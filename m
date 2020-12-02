Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D022CB1FD
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 02:04:16 +0100 (CET)
Received: from localhost ([::1]:35650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkGZ4-00065J-RN
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 20:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kkGX7-0005cT-3m
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 20:02:13 -0500
Received: from mail-qv1-xf44.google.com ([2607:f8b0:4864:20::f44]:42844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kkGX5-0000ZB-HA
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 20:02:12 -0500
Received: by mail-qv1-xf44.google.com with SMTP id cv2so1848399qvb.9
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 17:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=wesPKLVxS7jdW9lMYMDRXybqUnq7mBQZdIoR3mQtFQ4=;
 b=fbZbN8v3Xp9U6viRDO6o1n0IuUXeJPc/RkqIUoix4qYU755ssgYorTc3Gv7sT3Yk5G
 /frgJU05mUQdUsVSohERXULCO6+B6t5DDA4ZlZUqfAKx3Ai6g/n6h7U/tWzXKTCo++97
 9xBlmgHaMkZUKm8cS0JHAyRO9C0rskAVkkNSvm24RCTloCnzEXtyyTkMMhI/Y0wFuc3k
 tQjMVY5BQt926WkHM7fWtAl+kOhVzvqxFrBtA+QAUtJjGC51C5UkM0ONv7pulUtAG1YI
 Br4PJrCvEU3dsevT57N1HByXvtUWeW6nrfNLIvYwFQAkEkG2v+RtnBoeQJ4RRncPEKYo
 SKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wesPKLVxS7jdW9lMYMDRXybqUnq7mBQZdIoR3mQtFQ4=;
 b=hsknLzaXKLtdVYA8KzAzioINZPpOjpdvWkC3D8Kf1U10e3kqRHXwJEI0K0F1gXDqER
 qi77ceDyKxyxOSOJnnrVUbuddyWSitpkMv4bDPC86zQw/TXNF4VAQJ1jr9qUc/G0pdG4
 iflR6KvlRPQ8iGa+PE67j8pzAiecdtv22g7b6fJ2ts7BS13pm8JidQU8CnE+jf91clN6
 /iSiW+wUrBjRkovvVM20ht8rcawyBT2M/j3r6VADKlL+kxDI5qvVLtHkEz9VwjjloxPG
 8ITVRZrcta62i1HG+HYjdLC9/JYPSyIoyLZp4Hyr9w4lTZffatBXqiBN12oOJ213ULfu
 iBGA==
X-Gm-Message-State: AOAM533ngSHxlTHIfHXKanUOUyy03468nDfuZu7VvBbGlO9BJm9Rj2Er
 z/QO/EEex6y2e8WnMuN739BNWgm+A08pSTpCG4w=
X-Google-Smtp-Source: ABdhPJzfTPZbrhowRNbIcm6VYzVq/CvBMQzvg7Doz/wM0wfldBHRIXANDInGQtoRyxNdEjCebB450Axln5qQX4myboI=
X-Received: by 2002:ad4:4a87:: with SMTP id h7mr254324qvx.14.1606870930618;
 Tue, 01 Dec 2020 17:02:10 -0800 (PST)
MIME-Version: 1.0
References: <20201201192807.1094919-1-f4bug@amsat.org>
 <20201201192807.1094919-7-f4bug@amsat.org>
In-Reply-To: <20201201192807.1094919-7-f4bug@amsat.org>
From: chen huacai <zltjiangshi@gmail.com>
Date: Wed, 2 Dec 2020 09:01:58 +0800
Message-ID: <CABDp7VqonBqH_PZGQ1e60K5-APJwNHf_UM+x8w6E28yhHeVsfg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] linux-user: Add support for MIPS Loongson 2F/3E
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::f44;
 envelope-from=zltjiangshi@gmail.com; helo=mail-qv1-xf44.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
 Meng Zhuo <mengzhuo1203@gmail.com>, Huacai Chen <chenhc@lemote.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Philippe,

On Wed, Dec 2, 2020 at 3:31 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> Userland ELF binaries using Longsoon SIMD instructions have the
> HWCAP_LOONGSON_MMI bit set [1].
> Binaries compiled for Longsoon 3E [2] have the HWCAP_LOONGSON_EXT
> bit set for the LQ / SQ instructions.
What is Loongson-3E? I think you want to say Loongson-3A?

Huacai
>
> [1] commit 8e2d5831e4b ("target/mips: Legalize Loongson insn flags")
> [2] commit af868995e1b ("target/mips: Add Loongson-3 CPU definition")
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  linux-user/elfload.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index 2ba42d8e4bd..5a39a7dc021 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -1023,6 +1023,8 @@ static uint32_t get_elf_hwcap(void)
>
>      GET_FEATURE_REG_EQU(CP0_Config0, CP0C0_AR, 3, 2, HWCAP_MIPS_R6);
>      GET_FEATURE_REG_SET(CP0_Config3, 1 << CP0C3_MSAP, HWCAP_MIPS_MSA);
> +    GET_FEATURE_INSN(ASE_LMMI, HWCAP_LOONGSON_MMI);
> +    GET_FEATURE_INSN(ASE_LEXT, HWCAP_LOONGSON_EXT);
>
>      return hwcaps;
>  }
> --
> 2.26.2
>
>


--=20
Huacai Chen

