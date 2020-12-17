Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F37DC2DD1FE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 14:16:23 +0100 (CET)
Received: from localhost ([::1]:57182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpt8p-0002p4-1H
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 08:16:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpt2o-00076b-BB
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:10:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49859)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kpt2h-0004CR-2H
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 08:10:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608210602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6S6jCVMhh0s+birFxDVGZw/VmnJNffS/3B23cVvgFtw=;
 b=IP87T3TULhw2pPd622ztKgoLTU+Op9pQrx+JDVhKXXmharlgiHfpoqBkK+hsQzvKMUs5BY
 wX3sbQR7ZAIaVNuqIDmyHKIwZObhIqnTS7r3uvD4C33BxKlJ539ur8a9NO5uvaTD3i70my
 P7/ZrZ3TtcalDWw7AGUxJiTjtMFM8X8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-geFq5Nu5OL6J0S_iSNJuFA-1; Thu, 17 Dec 2020 08:09:58 -0500
X-MC-Unique: geFq5Nu5OL6J0S_iSNJuFA-1
Received: by mail-ej1-f69.google.com with SMTP id u25so8591025ejf.3
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 05:09:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6S6jCVMhh0s+birFxDVGZw/VmnJNffS/3B23cVvgFtw=;
 b=dqnuFD0C7RyJq7xR/3/7Y6A5cYQLKPwNScWs25YL8HgbkUlTAeWuhoqmtzkC8mbXc5
 MFtR0bNzR4qMmMshN6AXBGotrTTB26ROJZ3Mt30meCDScfswcpnU8FdbjHegmwfPiCSY
 ewWacrIqMDJLDQ0eAYsr4zKaefJY+s2wQjU9L/r5ySAsHK6O/ED1KxtyD5hVILejMO7B
 W+Ius5FDfl5FYfmhOJuDji0B4txrlhlskNhpA+cBVYs7+Cc7TpxH1v+iI66SQqWRt4dJ
 luZtqoZskKLAIEemH7qIu3KWe1uLjeuf4hh3U42AKw+5tRoPSlyfFciJkY68Ie5p3clq
 OY7g==
X-Gm-Message-State: AOAM533IKKHOv37xpuTFVeh2xf4eogGyGINrmBjlqVQiy2pF9RKFKQnK
 71z+5XYqkv8W/18qfV8P70PpT3r1RWK9lXEFBtBgca0YeYgjnzB/kGpt1hYe+30eV8MkexFx/QN
 FA6euER4INW/BiLwYp5RUxb4CGLj0CIzD8liAqy/Sqpoq2LL0E+dnbuXSCNC67gQYH20=
X-Received: by 2002:a17:906:b7d6:: with SMTP id
 fy22mr35068953ejb.219.1608210597172; 
 Thu, 17 Dec 2020 05:09:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz4e7+q0bmS7jBbYQLvCx5u9nr4T2JFSv0tmqXKsUppOxHz694iWYy7kEAfkemvOmZOmHUACw==
X-Received: by 2002:a17:906:b7d6:: with SMTP id
 fy22mr35068925ejb.219.1608210596872; 
 Thu, 17 Dec 2020 05:09:56 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id mb22sm3722452ejb.35.2020.12.17.05.09.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Dec 2020 05:09:56 -0800 (PST)
Subject: Re: [PATCH 08/18] libssh: convert to meson
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Pino Toscano <ptoscano@redhat.com>
References: <20201217094044.46462-1-pbonzini@redhat.com>
 <20201217094044.46462-9-pbonzini@redhat.com>
 <CAMxuvawQHEghsAU2g5jzViMUANB94C_AbBxdcqAMW4N-=c5r3g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c7322889-0439-1491-cf33-9e09801ada08@redhat.com>
Date: Thu, 17 Dec 2020 14:09:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAMxuvawQHEghsAU2g5jzViMUANB94C_AbBxdcqAMW4N-=c5r3g@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/12/20 13:35, Marc-André Lureau wrote:
> 
> You dropped the comment about  LIBSSH_VERSION_*,  I think it's worth 
> keeping. Eventually, we should set an expectation when this can be 
> dropped. (presumably when debian old stable with 0.7.3 support is 
> dropped, Pino?)

Yes, it should be added.

Paolo


