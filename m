Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7192A3728D4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 12:26:14 +0200 (CEST)
Received: from localhost ([::1]:45212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldsFp-0004yf-GF
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 06:26:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldrzK-00023O-Fw
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldrzF-0006Yw-0m
 for qemu-devel@nongnu.org; Tue, 04 May 2021 06:09:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620122944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EvORe9B/URLknbBbEqaDsInuMlYfGz5AojdgljOyw30=;
 b=hlAV5b0xjshGycoi/KYkD1LKn0xpVJVmNzPAYfO4qltDNveci0UmZLqXvFUehgJc7Vc3jD
 FPQSMuqSM4Yo8cDD6Kevo/pFRVGzpKBPgxc3ZgegqzXfz1SoVrRTVkcHC2UO+ooETJ/s5/
 Q0UqPV87jfavB5d11Xoj1CfO/GUjNMs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-irtnYgGSNyytPcivxXdmYw-1; Tue, 04 May 2021 06:09:02 -0400
X-MC-Unique: irtnYgGSNyytPcivxXdmYw-1
Received: by mail-wm1-f69.google.com with SMTP id
 t6-20020a1cc3060000b0290146ea8f8661so215201wmf.4
 for <qemu-devel@nongnu.org>; Tue, 04 May 2021 03:09:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EvORe9B/URLknbBbEqaDsInuMlYfGz5AojdgljOyw30=;
 b=Fgqb7EIaGqbdRUGB6vij6u35kLtv4ClJ428o5zs+/rzw7/P5bEMGoZQ+6ZZ/ZDN/gi
 G7nCVLifs9wRWlbsQY36UuwRtPgom9Uoa7T82WA2sQmjd0sYeQYeT0+HkOzXCOuEOi3W
 l0IgWa2QnHXFBLKX6U56Qw+iGtfeRP6K7qVJHIBgKgVmbhvEHUaoejpe12DGDmHot8Rt
 bSGQ7WhuMrvmAspN4O+n4cZYA4uEEdIj2IVz0vpAPM/ZL7KduTTdtYBHm/qrx+JNHufW
 rT9hWNuqQicWdAgH8x5lOt/biGlytIUda4C151/Uwx/7Y+P+nPYJSVfGXfWbj4D3G6om
 Yvzw==
X-Gm-Message-State: AOAM530GU9kFvjYhTK1oC7AELa7xQJ3S0bfB9/Fu1Qynmy7KkviRTRRJ
 krLF3dgbGTPKgJ3Cf+c1X4NetmOAAWYJ83dxAmP0baHAtAnuy4eCKv9s5qBG4110c5spKO94PuQ
 ZfOalmdmecO7Zwqg=
X-Received: by 2002:adf:ef92:: with SMTP id d18mr31512403wro.413.1620122941551; 
 Tue, 04 May 2021 03:09:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvbvtVEnl49tvUM7UflFkyjU9uVnUtCVOAP1fz5ef+OwNut8NT9/HV9i/JfLP0CSkSWaT9CA==
X-Received: by 2002:adf:ef92:: with SMTP id d18mr31512391wro.413.1620122941368; 
 Tue, 04 May 2021 03:09:01 -0700 (PDT)
Received: from [192.168.1.19]
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id j10sm5754456wrt.32.2021.05.04.03.09.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 03:09:01 -0700 (PDT)
Subject: Re: [PATCH] tests/migration-test: Fix "true" vs true
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>,
 qemu-devel@nongnu.org, thuth@redhat.com, lvivier@redhat.com,
 peter.maydell@linaro.org
References: <20210504100545.112213-1-dgilbert@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <e419383c-eedf-b674-41c2-e7c3c6c5ddf7@redhat.com>
Date: Tue, 4 May 2021 12:08:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210504100545.112213-1-dgilbert@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/4/21 12:05 PM, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Accidental use of "true" as a boolean; spotted by coverity
> and Peter.
> 
> Fixes: b99784ef6c3
> Fixes: d795f47466e
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Reported-by: Coverity (CID 1432373, 1432292, 1432288)
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  tests/qtest/migration-test.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 3a711bb492..4d989f191b 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -898,8 +898,8 @@ static void test_xbzrle(const char *uri)
>  
>      migrate_set_parameter_int(from, "xbzrle-cache-size", 33554432);
>  
> -    migrate_set_capability(from, "xbzrle", "true");
> -    migrate_set_capability(to, "xbzrle", "true");
> +    migrate_set_capability(from, "xbzrle", true);
> +    migrate_set_capability(to, "xbzrle", true);

Funny one =)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


