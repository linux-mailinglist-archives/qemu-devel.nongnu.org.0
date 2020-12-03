Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B712CCD1A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 04:14:40 +0100 (CET)
Received: from localhost ([::1]:59260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkf4p-0007z7-ND
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 22:14:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kkf3W-0007E5-Tj
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 22:13:18 -0500
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:44875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zltjiangshi@gmail.com>)
 id 1kkf3U-0000jJ-Q5
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 22:13:18 -0500
Received: by mail-lj1-x243.google.com with SMTP id s9so848847ljo.11
 for <qemu-devel@nongnu.org>; Wed, 02 Dec 2020 19:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q5C10tV9cRN5Xqr1b5VZXI/5DNkuft8sU0elszZ/5NY=;
 b=laphmPrV+MJqL0E/eRLx5GI+Cduh2s4gz3nHJjFg2q76V04cxCO17IUDmygWuCjdWV
 9bfq5c+McJATXkFobAMBTwziGo2acD3NcFzWIZx4yTzyoZ7HLpEqkUy4dlx8DecybVnz
 QltWlRDrYVhoFz2xd8jr1nuByyWm5FytZITdAlcf8Gsxn74bptxBn60BO/BmpQZ5lS1c
 +v9hte+Vv80AXOkJmjj3PyzD7ztwSXUxdctwLRL9y4qaHKTEOHtMi4Jsz6UIbhidgbz4
 54HLX+4EtkmvFARjl6c3RVcJ3tSVyRQEB2PKeYiCnrJgKngHPxBICHi8EhlAlebHR7j0
 iWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q5C10tV9cRN5Xqr1b5VZXI/5DNkuft8sU0elszZ/5NY=;
 b=rnG+/8pNg8aKeLMVGddAb1l1AoeXOLXOcXAWOj2XAS4kx7cE+E0yV6T2oaaBsvWiuv
 /Wz4CpzzDe5bDpqcKWqnuDpGH/vx+TxvKczi5ukHFMiW7dhSR6+NlIHbUzNRs5kb/kNf
 WvK9zw//6XvZbOVXoLeVZAiYdIzFi7/1Ew5zl4qk6IWZD5Lewl7XhPCDwttHmK+RJvkT
 D1nRN6VZmzY5470hRAWCgFP+IRwGuD8T0H8oakfLDDQnVaTvqX7ChpkQOOOc8V+dgHs/
 rNgyG6T0Rve7UWUyosf65Z0hBBDocIa7XP22TvMW6zohxFaBghh18Ttd7wph52wtmYC8
 glxQ==
X-Gm-Message-State: AOAM5300h5L3K5qap2pDygRlUiXeBsIelZYLlp+hP+ItOyywcoGiZ3kB
 K8B/TnzxDF4J/oen8zK0rWNJWmE6AK84aLcGYL0=
X-Google-Smtp-Source: ABdhPJwlK8EtbAPW7mW1mp/gErK52KpGmWDjyabEn2tETE2CFaQgcDMYgA/Dv0wLmJIEyboe+pouIP97DuR7w0Pmho0=
X-Received: by 2002:a2e:164b:: with SMTP id 11mr381757ljw.34.1606965193252;
 Wed, 02 Dec 2020 19:13:13 -0800 (PST)
MIME-Version: 1.0
References: <20201201192807.1094919-1-f4bug@amsat.org>
 <20201201192807.1094919-7-f4bug@amsat.org>
 <CABDp7VqonBqH_PZGQ1e60K5-APJwNHf_UM+x8w6E28yhHeVsfg@mail.gmail.com>
 <7862974b-84e3-5390-9799-ab39250f0af4@amsat.org>
In-Reply-To: <7862974b-84e3-5390-9799-ab39250f0af4@amsat.org>
From: chen huacai <zltjiangshi@gmail.com>
Date: Thu, 3 Dec 2020 11:13:01 +0800
Message-ID: <CABDp7Vr11wkgX_ktY9LP=gqCsUH5U0pSYpuR+eK0-_QLj9F4UA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] linux-user: Add support for MIPS Loongson 2F/3E
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::243;
 envelope-from=zltjiangshi@gmail.com; helo=mail-lj1-x243.google.com
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
 Aurelien Jarno <aurelien@aurel32.net>, Huacai Chen <chenhc@lemote.com>,
 Meng Zhuo <mengzhuo1203@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Philippe,

On Wed, Dec 2, 2020 at 5:16 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 12/2/20 2:01 AM, chen huacai wrote:
> > Hi, Philippe,
> >
> > On Wed, Dec 2, 2020 at 3:31 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=
.org> wrote:
> >>
> >> Userland ELF binaries using Longsoon SIMD instructions have the
> >> HWCAP_LOONGSON_MMI bit set [1].
> >> Binaries compiled for Longsoon 3E [2] have the HWCAP_LOONGSON_EXT
> >> bit set for the LQ / SQ instructions.
> > What is Loongson-3E? I think you want to say Loongson-3A?
>
> Yes =3D) I have been confused because I looked at the INSN_LOONGSON2E
> and INSN_LOONGSON2F definitions earlier.
>
> Are you OK with this patch if I change
> - 3E -> 3A in subject and body
> - Longsoon -> Loongson in body?
That's OK.

Huacai
>
> As you maybe noticed, since Loongson is currently the single MIPS
> area with contributions, I am trying to strengthen it and ease its
> maintenance by adding (and running) more tests.
>
> >
> > Huacai
> >>
> >> [1] commit 8e2d5831e4b ("target/mips: Legalize Loongson insn flags")
> >> [2] commit af868995e1b ("target/mips: Add Loongson-3 CPU definition")
> >>
> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> >> ---
> >>  linux-user/elfload.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> >> index 2ba42d8e4bd..5a39a7dc021 100644
> >> --- a/linux-user/elfload.c
> >> +++ b/linux-user/elfload.c
> >> @@ -1023,6 +1023,8 @@ static uint32_t get_elf_hwcap(void)
> >>
> >>      GET_FEATURE_REG_EQU(CP0_Config0, CP0C0_AR, 3, 2, HWCAP_MIPS_R6);
> >>      GET_FEATURE_REG_SET(CP0_Config3, 1 << CP0C3_MSAP, HWCAP_MIPS_MSA)=
;
> >> +    GET_FEATURE_INSN(ASE_LMMI, HWCAP_LOONGSON_MMI);
> >> +    GET_FEATURE_INSN(ASE_LEXT, HWCAP_LOONGSON_EXT);
> >>
> >>      return hwcaps;
> >>  }
> >> --
> >> 2.26.2
> >



--=20
Huacai Chen

