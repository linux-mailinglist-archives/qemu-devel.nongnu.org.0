Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6984F4823F2
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 13:18:04 +0100 (CET)
Received: from localhost ([::1]:40766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3GrC-0007kJ-RR
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 07:18:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3Gfx-0006mO-0q
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:06:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3Gft-0002WL-VP
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:06:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640952380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HSFj77Ip7KqV7SWGw257G9PvpKYvCd/6yjbCggR4TwQ=;
 b=d3WBE1awb0xzCvE7vKbqb3uACrcAdz2/hVoc+60lpRNb1Kun7P6zHxCHv8hiNf930VQFXJ
 y6P8YcNbhEAw3EX0Sh7n4V2bMvLst9H+/5t7BZ2AL/ATmIDSnfu5faufcl9057Iko5D4yT
 BCdXVLHGkcljL7NTWwV8eEmGKckmLJI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-VHlEdCnoPzaXptpJ-RTAZQ-1; Fri, 31 Dec 2021 07:06:19 -0500
X-MC-Unique: VHlEdCnoPzaXptpJ-RTAZQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 r9-20020adfb1c9000000b001a2981d9356so7509526wra.20
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:06:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HSFj77Ip7KqV7SWGw257G9PvpKYvCd/6yjbCggR4TwQ=;
 b=XapKJJl2UAxD6wK8vKAfD/Aiz/pn8pGWjkBpALjHeSHyRTF8t2dXvKk/MZkWETksye
 lhdnCZRvmldyQ4rSmFIWrlGFScjMnFpE7AUT2Q+gpnYlsodhPKH40yd4FdZ4B4ZP1f2B
 gPro5jlFpdrvJLoVmoF8fxmeVr5bS+2PhaJf8wTyRh+VMPQobXbfh2qAx2eEQ9/c347j
 u62j0p6yr7LMb1GM3RIkF/wRrwdpukuUHq+K+N9TLE8xdjAjL4E0k4shNi27SYabSn/Y
 k4UJaL/uKOkFCl5cuasbJv+zgzMR2NVxUeE2SYe5vI6i8MHdiw9JWRDHjxk88jpSXIhh
 MuCA==
X-Gm-Message-State: AOAM530hLBNG1lSlkpQx6rHgmxA354Q1rVkZ1ARAFwDq/OhW71LonIyg
 IG+8p57ivsFys833KZvflOfMciBGKwJwwLy49Y3GFaUfOk71YAZxeOFthj0pguUJiVNC+yl9PBP
 3cR8KA81A3We7+TajmSEpqWpTs6seLnX0d9ViqRGTCj2cKa4C8Pg1Sl+UVeL9gaYr
X-Received: by 2002:adf:efc6:: with SMTP id i6mr28340523wrp.428.1640952377692; 
 Fri, 31 Dec 2021 04:06:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcF6s0+SHlxI+69aQHIMmO0EeHSh7yje1+WZ4c6dfpSMm15NdRN8MNXO0tTdQ+GL8OZwl6tw==
X-Received: by 2002:adf:efc6:: with SMTP id i6mr28340498wrp.428.1640952377485; 
 Fri, 31 Dec 2021 04:06:17 -0800 (PST)
Received: from [192.168.1.36] (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id j17sm26421875wrp.68.2021.12.31.04.06.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Dec 2021 04:06:17 -0800 (PST)
Message-ID: <7caf16f9-e380-be50-935e-2e3d03d38f86@redhat.com>
Date: Fri, 31 Dec 2021 13:06:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v2] MAINTAINERS: Change philmd's email address
To: qemu-devel@nongnu.org
References: <20211231000759.707519-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211231000759.707519-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.024,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/31/21 01:07, Philippe Mathieu-Daudé wrote:
> The philmd@redhat.com email address will stop working on
> 2022-01-01, change it to my personal email address.
> 
> Update .mailmap in case anyone wants to send me an email
> because of some past commit I authored.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: Fixed .mailmap (Richard)
> ---
>  .gitlab-ci.d/edk2/Dockerfile |  2 +-
>  .mailmap                     |  1 +
>  MAINTAINERS                  | 18 +++++++++---------
>  3 files changed, 11 insertions(+), 10 deletions(-)

Patch queued.


