Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3CE3E3F93
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 08:13:48 +0200 (CEST)
Received: from localhost ([::1]:59684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mCyXj-0002hB-6J
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 02:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mCyWn-00022X-ST
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 02:12:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mCyWl-0004dq-Ls
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 02:12:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628489566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H8yKeMbmUHz8S9EYJo/ndAVxqTDLvebmh6riOPzHfo0=;
 b=G3Ely/rNDe/WweedsF1UX8do2rcftBZ6QEHHfp5NcYd5K14k0BwY3R4cO1xeozRB5ECAgt
 DuDyK4V4J/nOiu26hg8MZu/ivJ/G/FpzoDEWEUR9fmv/s0cY7fZDUoD0X5pBjTzoVMEeNo
 aMADgXRbji76nb1lLGTlquMw6nCX+jg=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-ubEORxA3PxGlgA4_tAHXKw-1; Mon, 09 Aug 2021 02:12:43 -0400
X-MC-Unique: ubEORxA3PxGlgA4_tAHXKw-1
Received: by mail-wr1-f72.google.com with SMTP id
 l12-20020a5d6d8c0000b029015488313d96so5029842wrs.15
 for <qemu-devel@nongnu.org>; Sun, 08 Aug 2021 23:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=H8yKeMbmUHz8S9EYJo/ndAVxqTDLvebmh6riOPzHfo0=;
 b=mDgqHz25Xfo26JSfi1qvWmTvCIYj0VuSl0VZb1NTeUXfTArxEEfEqtIvW6MuJ6YZNT
 L8XM7ULLxURKhYuRA9Pn4B+8+p92dy5jIN1fH/hfbC7go0OXiMMIvY8c1Aql2KBPLPmL
 04toj5A65GEO7/j0rTFb/vTV7sq15R6aL8tynAuoN5lmCp6z+EsPSCU8wRXvyIG4edCs
 hAPsekDSebmI3YJQCMDkU8GFMxZ/MYcHWt2/sKzigQpx349R/zH3Icw5tesQSqYJ+e0C
 iP4tVgeK6aEFxB3qyKiZDRxebpIJHwokLdu5KRMMXEnfcAzm1Po0yLY+gQP9QctL4qrR
 JouQ==
X-Gm-Message-State: AOAM532nCG3xTczLLITAxxFNBB4DG9kFyC02LxWXOte7azkZyBboKHKV
 TnD5/1UpJaFdHIVXYi/2xp3L5cqnvz7CnsRA5QSAlWHCTmCwo9OBmeG81BCGkKNIH+rRvrw0kro
 peGwk9UT/49aMLP8=
X-Received: by 2002:a05:600c:4f42:: with SMTP id
 m2mr33007803wmq.47.1628489562232; 
 Sun, 08 Aug 2021 23:12:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQnK6tIL2oMt/pvxFCYMHH/iah4wGhhpsG3ZP7y/GRZD0WXiaDNTOKX1qAF82zA4GaSjbycQ==
X-Received: by 2002:a05:600c:4f42:: with SMTP id
 m2mr33007779wmq.47.1628489562026; 
 Sun, 08 Aug 2021 23:12:42 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id b20sm17558590wmj.48.2021.08.08.23.12.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 08 Aug 2021 23:12:41 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 2/2] disas/nios2: Simplify endianess conversion
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210807110939.95853-1-f4bug@amsat.org>
 <20210807110939.95853-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b869358f-caed-6e03-5822-ada080961a11@redhat.com>
Date: Mon, 9 Aug 2021 08:12:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210807110939.95853-3-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.707,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Marek Vasut <marex@denx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chris Wulff <crwulff@gmail.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/08/2021 13.09, Philippe Mathieu-Daudé wrote:
> Since commit 12b6e9b27d4 ("disas: Clean up CPUDebug initialization")
> the disassemble_info->bfd_endian enum is set for all targets in
> target_disas(). We can directly call print_insn_nios2() and simplify.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   include/disas/dis-asm.h |  3 +--
>   disas/nios2.c           | 22 +++-------------------
>   target/nios2/cpu.c      |  6 +-----
>   3 files changed, 5 insertions(+), 26 deletions(-)
[...]
> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
> index 5e37defef80..5b503b5bb99 100644
> --- a/target/nios2/cpu.c
> +++ b/target/nios2/cpu.c
> @@ -146,11 +146,7 @@ static void nios2_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
>   {
>       /* NOTE: NiosII R2 is not supported yet. */
>       info->mach = bfd_arch_nios2;
> -#ifdef TARGET_WORDS_BIGENDIAN
> -    info->print_insn = print_insn_big_nios2;
> -#else
> -    info->print_insn = print_insn_little_nios2;
> -#endif
> +    info->print_insn = print_insn_nios2;
>   }

Oh, wow, I didn't even know that nios2 could be compiled with different 
endianness? I mean, we only have a "nios2-softmmu" target, not something 
like "nios2be-softmmu" and "nios2le-softmmu" ?

Anyway, your patch makes a lot of sense to clean this up.

Reviewed-by: Thomas Huth <thuth@redhat.com>


