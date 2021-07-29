Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D77553D9D4C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 07:56:25 +0200 (CEST)
Received: from localhost ([::1]:48426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8z1s-0000gm-Gc
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 01:56:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8z0w-0007uy-Tv
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 01:55:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m8z0t-0000eD-FG
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 01:55:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627538121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sXCcSnt28rYcldvOSFVJrkOiixriNgVH3OWXvGOjMdo=;
 b=Tz6h/lgG6LHoMYcbCAZzuPP30THmogGpmvvZ1qTaP2YN+RkCFaOCNrkmgaOjUeG0lvkEjj
 sq8PazemvN4IfXMam2INiRUMiei+XF4kKziKCyoKq3u3NFrDqEWzOODeN7nXBiTBduXdmX
 1Ng7QDVPJivLBQ1LmpQL/GhUfKDsC3A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-bMWuFHh9OvyAv5xTbYZu9A-1; Thu, 29 Jul 2021 01:55:19 -0400
X-MC-Unique: bMWuFHh9OvyAv5xTbYZu9A-1
Received: by mail-wr1-f72.google.com with SMTP id
 s22-20020adf97960000b02901535eae4100so1829149wrb.14
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 22:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sXCcSnt28rYcldvOSFVJrkOiixriNgVH3OWXvGOjMdo=;
 b=XO+oZT/2mc1Tpft9BEyp/+aktx4OEbdGZMPNU7RTUtRo910qrakeQrH5rrxaBCJg7l
 j7UowcMmAgqOlamKQ6Lp+0ZI7XuCzhHNjhU21IkSO+3wps9+8oiL7lO8P+CG7MJMk0gU
 qaIUzT8U/vtDkTSneA6iayEck+ob+fW37Vy7z5aOuTjA8pMXRXXJULYmoXd+Cxl/wlWq
 W5KMY+DPFauv4xj0uWgyp61WAoec5lRq/h7AmEasuTDELY4vj/bk/nX0Ujpw1kdB7K4H
 GMdxf1KClg+N2T/PINX69TNxlfuGgeIJNFiFoL/udeufyEEUiKysXmSEBHRs6JGDbR0g
 3MyA==
X-Gm-Message-State: AOAM533frePrsgl+Ix63q1zADm9w3qbAhPFX8xpnIo6MDzl8rjtdW580
 Zg5HE0Umj05TO4r0S7tBV+d2e15mbQ/7ylyLiy4Vb8lDUVcr2mxDDHhGHruMwTBLQbjeL5gklCV
 GDF88pDxq+lWiS9I=
X-Received: by 2002:a05:6000:2a9:: with SMTP id
 l9mr2787809wry.75.1627538118303; 
 Wed, 28 Jul 2021 22:55:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6OBg3+pQ4j6Ya2TzWVzrga3PiW669Kqy7V/lJDj9cOvMkSIUjXvGgWeHO2WwP7FeN3RLxCA==
X-Received: by 2002:a05:6000:2a9:: with SMTP id
 l9mr2787789wry.75.1627538118098; 
 Wed, 28 Jul 2021 22:55:18 -0700 (PDT)
Received: from thuth.remote.csb (p5791d475.dip0.t-ipconnect.de.
 [87.145.212.117])
 by smtp.gmail.com with ESMTPSA id u11sm1982149wrr.44.2021.07.28.22.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 22:55:17 -0700 (PDT)
Subject: Re: [PATCH] tests: Fix migration-test build failure for sparc
To: Peter Xu <peterx@redhat.com>, qemu-devel@nongnu.org
References: <20210728214128.206198-1-peterx@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d5093e20-fb32-dcd5-2100-b26eafb55672@redhat.com>
Date: Thu, 29 Jul 2021 07:55:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210728214128.206198-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.277, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/07/2021 23.41, Peter Xu wrote:
> Even if <linux/kvm.h> seems to exist for all archs on linux, however including
> it with __linux__ defined seems to be not working yet as it'll try to include
> asm/kvm.h and that can be missing for archs that do not support kvm.
> 
> To fix this (instead of any attempt to fix linux headers..), we can mark the
> header to be x86_64 only, because it's so far only service for adding the kvm
> dirty ring test.
> 
> No need to have "Fixes" as the issue is just introduced very recently.
> 
> Reported-by: Richard Henderson <rth@twiddle.net>
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>   tests/qtest/migration-test.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index 1e8b7784ef..cc5e83d98a 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -27,7 +27,8 @@
>   #include "migration-helpers.h"
>   #include "tests/migration/migration-test.h"
>   
> -#if defined(__linux__)
> +/* For dirty ring test; so far only x86_64 is supported */
> +#if defined(__linux__) && defined(HOST_X86_64)
>   #include "linux/kvm.h"
>   #endif
>   
> @@ -1395,7 +1396,7 @@ static void test_multifd_tcp_cancel(void)
>   
>   static bool kvm_dirty_ring_supported(void)
>   {
> -#if defined(__linux__)
> +#if defined(__linux__) && defined(HOST_X86_64)
>       int ret, kvm_fd = open("/dev/kvm", O_RDONLY);
>   
>       if (kvm_fd < 0) {
> 

Acked-by: Thomas Huth <thuth@redhat.com>

Juan, Dave, if you don't mind I can take this through my testing branch - 
I'm planning to send a pull request today anyway.

  Thomas


