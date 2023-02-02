Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D5D687FDE
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 15:23:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNaUP-0001U7-Kj; Thu, 02 Feb 2023 09:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pNaUI-0001T1-B8
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 09:22:54 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1pNaUG-0002N6-HU
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 09:22:54 -0500
Received: by mail-ej1-x629.google.com with SMTP id ud5so6416476ejc.4
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 06:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vrull.eu; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GMHBIIDL+Gs5g5qmJb2qZUmw9eyGCtQHrGm48e3o9xY=;
 b=JW/RVPmTKJyBS1XqlsRBPfFRVgpOX6p6bhKp+6xb+BzxAfUngxj2qjuYmrZvoJjQuI
 MeGbR5kPc/I6YwRI1e6QSLpua91pwRrY0VyI7HkidR+0f/e9YbuOb9KKpMKKzVuExxEY
 7B6ovizcoJtQBUqMBtRITot78H6iNPFM51um9nKYXMYkZXVzQtHYmyZoKKiX6tf7O/fg
 iBmDnkr83mSEbRCbr9uC4CUwX5T6ZE2YwokXMbLTsE3i/jJZuyL6QLvWmAY+Oy6Q7aCu
 5P7GeFz4umk/uuwlJyTYGDAIjy6Qgbbgm1V78cWeztKHWTd/7EcterMv0RhIxhPGn5XD
 naDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GMHBIIDL+Gs5g5qmJb2qZUmw9eyGCtQHrGm48e3o9xY=;
 b=ut1fz7rZoflI5xUgxa0Eo96B4bv5UAl4Wv+lrGENXj5uAFSKWbdt01R51o5GP1qene
 H70zo+7C3GAvJ9F7QLCigJvj57X3eZLUJNueFQFdPp+Msz/RkvEx5Xe82f3a1J9jONFc
 4PYf13DzjITOPWMt/CgorAYYI+x1r15Yd+wAsL3nbItQm40EKE959sQjCfrGTY4+s/XM
 Lz6tMRpgzbDWZOCr+bb44PM4wy4g+4m25J+GqNUs2muZNjmFxvn3717iEi2qYXVsxYJ/
 r63B3B4djpW19awusG+ToS0FXCSFaGys+mskXp0tQfDweae5QMTo3UXQBIMHeajObGXA
 8lAw==
X-Gm-Message-State: AO0yUKWE7Ztf81Fw9F4rOWGFxpL4EM7T0YrlxUj33k5fZ3kmcIM685yu
 TB7u9Zfl1HPPyNssQMUsgEtefpVnbZLKh694vwfrLQ==
X-Google-Smtp-Source: AK7set8XWWJz0QoVSo7kS5uMirIKtCFwdi0jfNCM84qu503GS/hC1UGfXcKeilaEm5xDqqBq7Dn+6HwqRC8emOKlBj0=
X-Received: by 2002:a17:906:2bdb:b0:878:6f08:39ec with SMTP id
 n27-20020a1709062bdb00b008786f0839ecmr2028727ejg.233.1675347770951; Thu, 02
 Feb 2023 06:22:50 -0800 (PST)
MIME-Version: 1.0
References: <20230202124230.295997-1-lawrence.hunter@codethink.co.uk>
 <20230202124230.295997-9-lawrence.hunter@codethink.co.uk>
In-Reply-To: <20230202124230.295997-9-lawrence.hunter@codethink.co.uk>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Thu, 2 Feb 2023 15:22:39 +0100
Message-ID: <CAAeLtUCZ2ECiVJnS=sxQd69Kq-2UxRELQB+pQAjXxNLSWPiLxQ@mail.gmail.com>
Subject: Re: [PATCH 08/39] target/riscv: Add vrev8.v decoding, translation and
 execution support
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Cc: qemu-devel@nongnu.org, dickon.hood@codethink.co.uk, 
 nazar.kazakov@codethink.co.uk, kiran.ostrolenk@codethink.co.uk, 
 frank.chang@sifive.com, palmer@dabbelt.com, alistair.francis@wdc.com, 
 bin.meng@windriver.com, pbonzini@redhat.com, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-ej1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 2 Feb 2023 at 13:42, Lawrence Hunter
<lawrence.hunter@codethink.co.uk> wrote:
>
> From: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
>
> Signed-off-by: Nazar Kazakov <nazar.kazakov@codethink.co.uk>
> ---
>  target/riscv/helper.h                      |  4 ++++
>  target/riscv/insn32.decode                 |  1 +
>  target/riscv/insn_trans/trans_rvzvkb.c.inc |  1 +
>  target/riscv/vcrypto_helper.c              | 10 ++++++++++
>  4 files changed, 16 insertions(+)
>
> diff --git a/target/riscv/helper.h b/target/riscv/helper.h
> index c94627d8a4..c980d52828 100644
> --- a/target/riscv/helper.h
> +++ b/target/riscv/helper.h
> @@ -1163,6 +1163,10 @@ DEF_HELPER_6(vrol_vx_h, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vrol_vx_w, void, ptr, ptr, tl, ptr, env, i32)
>  DEF_HELPER_6(vrol_vx_d, void, ptr, ptr, tl, ptr, env, i32)
>
> +DEF_HELPER_5(vrev8_v_b, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vrev8_v_h, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vrev8_v_w, void, ptr, ptr, ptr, env, i32)
> +DEF_HELPER_5(vrev8_v_d, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vbrev8_v_b, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vbrev8_v_h, void, ptr, ptr, ptr, env, i32)
>  DEF_HELPER_5(vbrev8_v_w, void, ptr, ptr, ptr, env, i32)
> diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
> index 782632a165..342199abc0 100644
> --- a/target/riscv/insn32.decode
> +++ b/target/riscv/insn32.decode
> @@ -903,3 +903,4 @@ vror_vx         010100 . ..... ..... 100 ..... 1010111 @r_vm
>  vror_vi         010100 . ..... ..... 011 ..... 1010111 @r_vm
>  vror_vi2        010101 . ..... ..... 011 ..... 1010111 @r_vm
>  vbrev8_v        010010 . ..... 01000 010 ..... 1010111 @r2_vm
> +vrev8_v         010010 . ..... 01001 010 ..... 1010111 @r2_vm
> diff --git a/target/riscv/insn_trans/trans_rvzvkb.c.inc b/target/riscv/insn_trans/trans_rvzvkb.c.inc
> index 591980459a..18b362db92 100644
> --- a/target/riscv/insn_trans/trans_rvzvkb.c.inc
> +++ b/target/riscv/insn_trans/trans_rvzvkb.c.inc
> @@ -154,3 +154,4 @@ static bool vxrev8_check(DisasContext *s, arg_rmr *a)
>  }
>
>  GEN_OPIV_TRANS(vbrev8_v, vxrev8_check)
> +GEN_OPIV_TRANS(vrev8_v, vxrev8_check)
> diff --git a/target/riscv/vcrypto_helper.c b/target/riscv/vcrypto_helper.c
> index 303a656141..b09fe5fa2a 100644
> --- a/target/riscv/vcrypto_helper.c
> +++ b/target/riscv/vcrypto_helper.c
> @@ -125,3 +125,13 @@ GEN_VEXT_V(vbrev8_v_b, 1)
>  GEN_VEXT_V(vbrev8_v_h, 2)
>  GEN_VEXT_V(vbrev8_v_w, 4)
>  GEN_VEXT_V(vbrev8_v_d, 8)
> +
> +#define DO_VREV8_B(a) (a)
> +RVVCALL(OPIVV1, vrev8_v_b, OP_UU_B, H1, H1, DO_VREV8_B)

Let's call it what it is: "DO_COPY" or "DO_IDENTITY" ...

> +RVVCALL(OPIVV1, vrev8_v_h, OP_UU_H, H2, H2, bswap16)
> +RVVCALL(OPIVV1, vrev8_v_w, OP_UU_W, H4, H4, bswap32)
> +RVVCALL(OPIVV1, vrev8_v_d, OP_UU_D, H8, H8, bswap64)
> +GEN_VEXT_V(vrev8_v_b, 1)
> +GEN_VEXT_V(vrev8_v_h, 2)
> +GEN_VEXT_V(vrev8_v_w, 4)
> +GEN_VEXT_V(vrev8_v_d, 8)
> --
> 2.39.1
>

