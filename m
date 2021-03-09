Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3DB33239E
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 12:06:53 +0100 (CET)
Received: from localhost ([::1]:57674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJaCS-0000ia-64
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 06:06:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJZuw-00071i-3x
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:48:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lJZum-0007jA-8M
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:48:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615286915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1oPwGCt0ZeqlH7x2F9o9cV4recxB0g7xPF2LXzP+Azo=;
 b=fKRlhs4cU1cOj8R5xrA++Kv79kmnuyITmvOrAWJcB6cJKXchD2VL7+qWzF3n3NgoB/3mR2
 hwM/ItajGbkfIjCLm5hZdz0/1Eoh5hApT4G9PeQKL0JQo0jDmh/P6xfFGEV6KyMGw5oDg6
 VtrJY7nz+uVTjS6Ye1/zL1VHjWgDJJw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-nywqsGGDPUKMk3WZ52ZPVA-1; Tue, 09 Mar 2021 05:48:31 -0500
X-MC-Unique: nywqsGGDPUKMk3WZ52ZPVA-1
Received: by mail-ej1-f70.google.com with SMTP id h14so5461891ejg.7
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 02:48:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1oPwGCt0ZeqlH7x2F9o9cV4recxB0g7xPF2LXzP+Azo=;
 b=Rs03jXic79es5MiU8ABUa8IojzE5NFcKeha1jIwo2FbFMtp45Wpu4JZpOIYBBWv/5p
 jO8qsxQJTT8Jm/gtXTmrl22WaDgleh2UpYrGIXxDKQ9Q/TK4hTMc5Iu5pNhY2sTi4fez
 ELvRIsvmrax2BNuLOazALN/zbZtsBMNiNue9KV3+5A7e8QLRKgtTlCDeiRaHS94TKkFj
 AcSVpK7LaqgL+lxnqEDZsm3BW1Hxhkv3zRicNd8kbMTHEo4gT/CrL938itoqjtyL1ii3
 vCPCYrkubTXcla3MyoMrQabhtbOZq+zBGNvrhXfrF5RVu4CF4AaxYHzdJEoxJu9OblUo
 m75g==
X-Gm-Message-State: AOAM533D575ttBsq89CYudFmol0s/FWzSqjFqCA82gVyR3pIHs/MyNaI
 iHOmFB3v/qdbgadye6++vJWAeEtiBOItMwCJ9AEnl8rit0v8EglxbMBmEa30Ix6NO7FdLYSE1Qu
 akic0oekbMBXGSNGXC4K5qQdxhn/XTi2tvQP36jW/w/VMzFleHnySxdoZ6xjmJBp0oHw=
X-Received: by 2002:a17:906:a896:: with SMTP id
 ha22mr19413115ejb.503.1615286910252; 
 Tue, 09 Mar 2021 02:48:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyqJkTuyX445TkYnXZCHRnmokAlgLrrmRrQNjVXBD7v2VRYqzWWvcrCo5aWZ2yWrPgDHDss7A==
X-Received: by 2002:a17:906:a896:: with SMTP id
 ha22mr19413101ejb.503.1615286910068; 
 Tue, 09 Mar 2021 02:48:30 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t12sm3119847edy.56.2021.03.09.02.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Mar 2021 02:48:29 -0800 (PST)
Subject: Re: [PATCH] coroutine: add libucontext as external library
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210309032637.41778-1-j@getutm.app> <YEdBce6TWCVpSph9@redhat.com>
 <CA+E+eSBt5sq08zfxLOZKNQd=A3q=9YLEt0moipTb7j+OGWyuRg@mail.gmail.com>
 <537a6a0e-431b-3920-c8dc-290e4e3d8895@redhat.com>
 <YEdOJIUp5wsVo0ao@redhat.com>
 <CAJ+F1CJ30dgGMj-R54jonrHsieAYZRk4foOOYgspkKbQ=3P3Uw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <96c824e5-3eba-be5c-b9ab-271f2017de54@redhat.com>
Date: Tue, 9 Mar 2021 11:48:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAJ+F1CJ30dgGMj-R54jonrHsieAYZRk4foOOYgspkKbQ=3P3Uw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Joelle van Dyne <j@getutm.app>, Stefan Hajnoczi <stefanha@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09/03/21 11:42, Marc-André Lureau wrote:
> If I remember correctly, there were objections because we wanted to have 
> an implementation close to QEMU, so we could easily extend it, or add 
> custom optimizations.

I think it's quite mature now.  The code that needs to stay close to 
QEMU is the locks as they rely on AioContext, but the generic coroutine 
stuff can certainly be moved out.

Paolo


