Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF7B3BAE5D
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 20:41:44 +0200 (CEST)
Received: from localhost ([::1]:39758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m073n-00027a-IC
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 14:41:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0713-0003sb-RD
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m0711-0006po-GP
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 14:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625423930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PjGZnW6zSulH1KT8VEYq1W324wcEJGvr2NUdPmJ3U84=;
 b=eHavgdFkzgwNPzGFP8amXbH0XzHCG/x2QVbmgprGgXfDhPVhi3tWH3DbUDrhXRXmmCMHq4
 XOtO26X00hbt8zS20ByAl/TI+yRgbpTPd8W5LLPe/9rbE3jGp+pr6mbT5/IY6Z6dW3VjEE
 yXqSzvYD78PH58rU6Z38uVxjh8CLmq8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-51-NwZRZRQ2Pn2XjpE_h5IvRw-1; Sun, 04 Jul 2021 14:38:47 -0400
X-MC-Unique: NwZRZRQ2Pn2XjpE_h5IvRw-1
Received: by mail-ed1-f70.google.com with SMTP id
 d5-20020a0564020785b02903958939248aso7931549edy.15
 for <qemu-devel@nongnu.org>; Sun, 04 Jul 2021 11:38:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PjGZnW6zSulH1KT8VEYq1W324wcEJGvr2NUdPmJ3U84=;
 b=lO5x28D7uoNgpJtv2PBpBI8emgQXeHwHVn6eBV5TVFvP9xb/KqSs+lSLTkVGeH9bhe
 VBZIjNhZtR0g87OPWYOVMb8j2SZlix3SD5cZXL+QFbddRqAnTgr3pjGoehCsQ8GKfNBi
 k8kLaV/5EauD5ynUqCWdi3A6Uc8Ddgk6Hg83YJwJg8SpqnGbPCF2s7+SIaXvIg/oY6az
 wRlgqMOEKcRuxPZnkvFyZBNfZVvNfxIFBUNFSo8eshzHIFvqrLVy1GiiVP7vSQ0sqZDF
 WxvaGCf3xe0xwqXvroxhdustCDRQXK6Qw4wGeqphIVxIizbbuRX8Sv4A1Rq1rXvrNHnp
 TBiw==
X-Gm-Message-State: AOAM530n4VATBJpSkNqbfkSxQ6BPCI2XtcqyqnQ51reiSMS0EKmMMSHh
 x1jXYX0Y23OY/qTsHoxUPSvYlMMCQOiI3Mn9WsmgngdChgptis4ong4dJ8pgBVmaNqpKbmE1CMs
 gszTVBTHRFx4cMZM=
X-Received: by 2002:a17:907:ea5:: with SMTP id
 ho37mr9732086ejc.109.1625423925802; 
 Sun, 04 Jul 2021 11:38:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3O5yD0E2JoJaQ+Sg4+xODTtuWtXxOykStk0TDWKM3qODTTWzYlg+CuornLo88E2o0ky3t3w==
X-Received: by 2002:a17:907:ea5:: with SMTP id
 ho37mr9732074ejc.109.1625423925618; 
 Sun, 04 Jul 2021 11:38:45 -0700 (PDT)
Received: from thuth.remote.csb (p5791d89b.dip0.t-ipconnect.de.
 [87.145.216.155])
 by smtp.gmail.com with ESMTPSA id f6sm3289191ejx.124.2021.07.04.11.38.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Jul 2021 11:38:45 -0700 (PDT)
Subject: Re: [PATCH 3/4] target/mips: Rewrite UHI errno_mips() using GHashTable
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210704170736.617895-1-f4bug@amsat.org>
 <20210704170736.617895-4-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1c9979ed-35f0-54bf-071e-9141ae708144@redhat.com>
Date: Sun, 4 Jul 2021 20:38:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210704170736.617895-4-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.441,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Alexander von Gluck IV <kallisti5@unixzen.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Richard Zak <richard.j.zak@gmail.com>, Leon Alrae <leon.alrae@imgtec.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/07/2021 19.07, Philippe Mathieu-Daudé wrote:
> Linking on Haiku OS fails:
> 
>    /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld:
>    error: libqemu-mips-softmmu.fa.p/target_mips_tcg_sysemu_mips-semi.c.o(.rodata) is too large (0xffff405a bytes)
>    /boot/system/develop/tools/bin/../lib/gcc/x86_64-unknown-haiku/8.3.0/../../../../x86_64-unknown-haiku/bin/ld:
>    final link failed: memory exhausted
>    collect2: error: ld returned 1 exit status
> 
> This is because the host_to_mips_errno[] uses errno as index,
> for example:
> 
>    static const uint16_t host_to_mips_errno[] = {
>        [ENAMETOOLONG] = 91,
>        ...
> 
> and Haiku defines [*] ENAMETOOLONG as:
> 
>     12 /* Error baselines */
>     13 #define B_GENERAL_ERROR_BASE              INT_MIN
>     ..
>     22 #define B_STORAGE_ERROR_BASE              (B_GENERAL_ERROR_BASE + 0x6000)
>    ...
>    106 #define B_NAME_TOO_LONG                   (B_STORAGE_ERROR_BASE + 4)
>    ...
>    211 #define ENAMETOOLONG                      B_TO_POSIX_ERROR(B_NAME_TOO_LONG)
> 
> so the array ends up beeing indeed too big.
> 
> Since POSIX errno can't be use as indexes on Haiku,
> rewrite errno_mips() using a GHashTable.
> 
> [*] https://github.com/haiku/haiku/blob/r1beta3/headers/os/support/Errors.h#L130
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   target/mips/tcg/sysemu/mips-semi.c | 62 ++++++++++++++++++++++--------
>   1 file changed, 45 insertions(+), 17 deletions(-)
> 
> diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
> index 4c924273c1b..3e91c9eb76c 100644
> --- a/target/mips/tcg/sysemu/mips-semi.c
> +++ b/target/mips/tcg/sysemu/mips-semi.c
> @@ -4,6 +4,7 @@
>    * Specifications: MD01069 Reference Manual (rev 1.1.6, 06 Jul 2015)
>    *
>    * Copyright (c) 2015 Imagination Technologies
> + * Copyright (c) 2021 Philippe Mathieu-Daudé
>    *
>    * This library is free software; you can redistribute it and/or
>    * modify it under the terms of the GNU Lesser General Public
> @@ -76,29 +77,56 @@ enum UHIOpenFlags {
>       UHIOpen_EXCL   = 0x800
>   };
>   
> -/*
> - * Unified Hosting Interface (rev 1.1.6)
> - * Appendix A. "Error values"
> - */
> -static const uint16_t host_to_mips_errno[] = {
> -    [ENAMETOOLONG] = 91,
> -#ifdef EOVERFLOW
> -    [EOVERFLOW]    = 139,
> -#endif
> +static GHashTable *uhi_errno_hash_table;
> +
> +static void uhi_errno_insert(int host_errno, int uhi_errno)
> +{
> +    gboolean ret = TRUE;
> +
> +    assert(uhi_errno_hash_table != NULL);
> +    ret = g_hash_table_insert(uhi_errno_hash_table,
> +                              GINT_TO_POINTER(host_errno),
> +                              GINT_TO_POINTER(uhi_errno));
> +    assert(ret == TRUE);
> +}
> +
> +static void uhi_errno_init(void)
> +{
> +    gboolean ret = TRUE;
> +
> +    uhi_errno_hash_table = g_hash_table_new(NULL, NULL);
> +
> +    /*
> +     * Unified Hosting Interface (rev 1.1.6)
> +     * Appendix A. "Error values"
> +     */
> +    uhi_errno_insert(ENAMETOOLONG,  91);
>   #ifdef ELOOP
> -    [ELOOP]        = 92,
> +    uhi_errno_insert(ELOOP,         92);
>   #endif
> -};
> +#ifdef EOVERFLOW
> +    uhi_errno_insert(EOVERFLOW,     139);
> +#endif
> +    assert(ret == TRUE);
> +}
>   
>   static int errno_mips(int host_errno)
>   {
> -    if (host_errno < 0 || host_errno >= ARRAY_SIZE(host_to_mips_errno)) {
> -        return EINVAL;
> -    } else if (host_to_mips_errno[host_errno]) {
> -        return host_to_mips_errno[host_errno];
> -    } else {
> -        return host_errno;
> +    gpointer uhi_errno;
> +
> +    if (uhi_errno_hash_table == NULL) {
> +        uhi_errno_init();
>       }
> +
> +    if (host_errno == 0) {
> +        return 0;
> +    }
> +    if (g_hash_table_lookup_extended(uhi_errno_hash_table,
> +                                     GINT_TO_POINTER(host_errno),
> +                                     NULL, &uhi_errno)) {
> +        return GPOINTER_TO_INT(uhi_errno);
> +    }
> +    return EINVAL; /* Not reachable per the specification */
>   }

Why not simply use a switch-case statement instead? ... that's simpler and 
still allows to compiler to optimize if the errno values are in a compact range.

  Thomas


