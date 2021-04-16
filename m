Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC8536191B
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 07:09:34 +0200 (CEST)
Received: from localhost ([::1]:51244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXGjV-0007P5-Qa
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 01:09:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1lXGig-0006zg-Qa
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 01:08:42 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <palmer@dabbelt.com>)
 id 1lXGie-0005FW-9x
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 01:08:42 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 e8-20020a17090a7288b029014e51f5a6baso8654834pjg.2
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 22:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=hdN/yYAI3FzeRRAf1q0pwdxPpFX1X2lXFwCpECc3XmA=;
 b=IpF5rHmtJ2aUcPs6Hbr+1aipmAMWPPPQoH7xD4fNYfDjRXT1Wwd5FmJ2VsQzg+66vZ
 5IIXmrbSsO4Zq5J4wNTM4jdDiPB7AIDpWEv6h72BK+uNePgu17RZxNtkNamhlFXfkQQD
 CHIex++r2nh+kBLjOqPUb5jSXJ055lm8raKiLVoAKENtj013lCeyQ9YpWPLA3rgl5ILh
 2W/SLBJ5fiI8Ca+djxLsBZUX1x45PHzgQBarK9pEb0s04QFWurDoTCI1syrCEiq5keU7
 bm74WJukjMsPWXqcVo/4V/pHv6FyKH2RiLYVSEGkdcDjdvSAOTzvCQ1tsprVLk5bWhEw
 FzjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=hdN/yYAI3FzeRRAf1q0pwdxPpFX1X2lXFwCpECc3XmA=;
 b=fdhD6giaSdfAkVgnST9HZxikf75Ws7ruu5HOQSPniXN6PUgQRyAB29Ucn4a328D768
 7q9X4c/KvKDTxq9WwPOUXdRT4oPoNk47DSnMykBn8LhurO8kTnsnkAYqMRMgC4JKa8IH
 IM1GFVlLer5kPSP1Ijjm6UGqHpXoyG5exAPYnf71QKEzSb2qZ3lvrGbl4s+4ZSfprEhF
 LzTwHzOqYxVkUTsyKnSic9Ej3p0PYsvZFO6QCrdvn+CrHdVyyjrcaN+gfC7zflZEKWsG
 2Yrt3EgtrT8WEkn4NjHEo5DgAAyS6llFZd13u/vWK7p1NaN8xbjZYBZOVkjJCqPIwjKp
 E+5Q==
X-Gm-Message-State: AOAM533LNxkHBZnE1IkSZSfoJvEB0hon6fcADkVNFtU2xrWFlB3gJiBg
 79NzCDsGOrEjKXs49OywkTO9RAetRnQ6Cg==
X-Google-Smtp-Source: ABdhPJyGO/19CfL7OXzjN3tjlBqFjXO9tleqPwlFVRXeypAMpEDqIH1wuE/GUlolRWU/ajlyWoEvSg==
X-Received: by 2002:a17:902:db0e:b029:eb:8b29:a809 with SMTP id
 m14-20020a170902db0eb02900eb8b29a809mr4144410plx.11.1618549717720; 
 Thu, 15 Apr 2021 22:08:37 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id c128sm3509910pfb.81.2021.04.15.22.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 22:08:37 -0700 (PDT)
Date: Thu, 15 Apr 2021 22:08:37 -0700 (PDT)
X-Google-Original-Date: Thu, 15 Apr 2021 22:08:34 PDT (-0700)
Subject: Re: [PING^2] [PATCH] [NFC] Mark locally used symbols as static.
In-Reply-To: <CAJOtW+7NN2rkcnKmNmMqEUXAgFku+zECRZgv2LX1G73HM-d2NQ@mail.gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: tetra2005@gmail.com
Message-ID: <mhng-565440a6-220c-496f-b822-5e0cb58d8d5d@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=palmer@dabbelt.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: marex@denx.de, aleksandar.rikalo@syrmia.com, sagark@eecs.berkeley.edu,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, crwulff@gmail.com,
 richard.henderson@linaro.org, f4bug@amsat.org, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, pbonzini@redhat.com,
 aurelien@aurel32.net, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Apr 2021 10:27:42 PDT (-0700), tetra2005@gmail.com wrote:
> Hi all,
>
> This patch makes locally used symbols static to enable more compiler
> optimizations on them. Some of the symbols turned out to not be used
> at all so I marked them with ATTRIBUTE_UNUSED (as I wasn't sure if
> they were ok to delete).
>
> The symbols have been identified with a pet project of mine:
> https://github.com/yugr/Localizer
>
> Link to patch: https://patchew.org/QEMU/CAJOtW+5DDMsr8QJQxaa1OHT79rpMJCrwkYbuaRTynR_ngUxgHA@mail.gmail.com/
>
> From 4e790fd06becfbbf6fb106ac52ae1e4515f1ac73 Mon Sep 17 00:00:00 2001
> From: Yury Gribov <tetra2005@gmail.com>
> Date: Sat, 20 Mar 2021 23:39:15 +0300
> Subject: [PATCH] Mark locally used symbols as static.
>
> Signed-off-by: Yury Gribov <tetra2005@gmail.com>
> Acked-by: Max Filippov <jcmvbkbc@gmail.com> (xtensa)
> Acked-by: David Gibson <david@gibson.dropbear.id.au> (ppc)
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com> (tracetool)
> Reviewed-by: Taylor Simpson <tsimpson@quicinc.com> (hexagon)
> ---
>  disas/alpha.c                                 | 16 ++--
>  disas/m68k.c                                  | 78 ++++++++---------
>  disas/mips.c                                  | 14 ++--
>  disas/nios2.c                                 | 84 +++++++++----------
>  disas/ppc.c                                   | 26 +++---
>  disas/riscv.c                                 |  2 +-
>  pc-bios/optionrom/linuxboot_dma.c             |  4 +-
>  scripts/tracetool/format/c.py                 |  2 +-
>  target/hexagon/gen_dectree_import.c           |  2 +-
>  target/hexagon/opcodes.c                      |  2 +-
>  target/i386/cpu.c                             |  2 +-
>  target/s390x/cpu_models.c                     |  2 +-
>  .../xtensa/core-dc232b/xtensa-modules.c.inc   |  2 +-
>  .../xtensa/core-dc233c/xtensa-modules.c.inc   |  2 +-
>  target/xtensa/core-de212/xtensa-modules.c.inc |  2 +-
>  .../core-de233_fpu/xtensa-modules.c.inc       |  2 +-
>  .../xtensa/core-dsp3400/xtensa-modules.c.inc  |  2 +-
>  target/xtensa/core-fsf/xtensa-modules.c.inc   |  2 +-
>  .../xtensa-modules.c.inc                      |  2 +-
>  .../core-test_kc705_be/xtensa-modules.c.inc   |  2 +-
>  .../core-test_mmuhifi_c3/xtensa-modules.c.inc |  2 +-
>  21 files changed, 125 insertions(+), 127 deletions(-)

You might have better luck splitting these sorts of things up: when 
there's a patch that touches a bunch of different trees it can be 
unclear who is going to merge it, which is frequently how these sorts of 
things get lost.

> diff --git a/disas/riscv.c b/disas/riscv.c
> index 278d9be924..0d124d8b61 100644
> --- a/disas/riscv.c
> +++ b/disas/riscv.c
> @@ -789,7 +789,7 @@ static const rv_comp_data rvcp_fsgnjx_q[] = {
>
>  /* instruction metadata */
>
> -const rv_opcode_data opcode_data[] = {
> +static const rv_opcode_data opcode_data[] = {
>      { "illegal", rv_codec_illegal, rv_fmt_none, NULL, 0, 0, 0 },
>      { "lui", rv_codec_u, rv_fmt_rd_imm, NULL, 0, 0, 0 },
>      { "auipc", rv_codec_u, rv_fmt_rd_offset, NULL, 0, 0, 0 },

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com> (RISC-V)

Thanks!

