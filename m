Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE6D6DAB7C
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 12:26:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkjGq-0008Aq-S5; Fri, 07 Apr 2023 06:24:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pkjGj-0008AO-Jg; Fri, 07 Apr 2023 06:24:38 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1pkjGh-0004MB-6U; Fri, 07 Apr 2023 06:24:33 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 qe8-20020a17090b4f8800b0023f07253a2cso42940225pjb.3; 
 Fri, 07 Apr 2023 03:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680863069; x=1683455069;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E0+LwPIg9rOKsBOH9ebv8cG7jmwkFz1QIuUvAzod4PQ=;
 b=bvtLiq2DJ9i3xHcT34T7FB7irIh0Gir1AqFHENoLvH2swftZDvQKG2zPnkpC6SSUNj
 19QKkrGGZyhc3EX4ItYoe8MfzqVObZVyGH9qmQOX3M9C7vBgUy6WIRRYycut3nE8HPAV
 sU66kvGMFIEWQVsveNgcVYQvEP585dW7J+b1MCa/OzU9zphHoDkD26bJOxU9EUMJuWM4
 Z7todfx+1+CEjuuHJlouBM38d0lKX8MCtYd6lxPFM6XidO347BaJjMrH/buG3psBecTv
 9PYXj+SE0qwcaOpV3RTxpfVEVmUCFplvLd4r07oegju3VrQajFGyydlLRbvrX5rpi7tG
 uDOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680863069; x=1683455069;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=E0+LwPIg9rOKsBOH9ebv8cG7jmwkFz1QIuUvAzod4PQ=;
 b=rF1CyRn48LCaq8wC079IgcnkrXTB/Q1Rvf5OCE1XlicACyRoGZx6LYN5tXyqgrmtV9
 y01HmuqT2X14DXvDDN3NbR29nNyIQCqhJxxd/XrOdRjXa6QessY/OYiSw7yNjqW7yUtw
 ohl00bbrkpIbOrfQ8n1+whoJxyNdb9Zv0vtqmaoqJ5YVJ5YLu4suulQqlhlYJ/n5a/at
 CE1qN6r/SkcYpsizjjr6v06/Lv7D7/HZcHtS0+7yz6SYecBZ0yL3QfHdM3fsXn7LbaiU
 CRRkv4VEUmj7PQ+vHB/Hmmy9juvLm87AjIX2QezeLGOxCMFDdAisT83c34P9CnsOfUbB
 vTew==
X-Gm-Message-State: AAQBX9cvrXsurzHdGW/xPyccGJHup8KiUh1m6iKY7Romat41DqMRB7F/
 pVdbkht10HYotY8BUgiq3m8=
X-Google-Smtp-Source: AKy350aXnqA2AoU7eYMDr8TXykSrrn+9X6+3AP6egv678+XbxSaPmIJEya1/zhO4xv7AH796Ak2rEA==
X-Received: by 2002:a05:6a20:dc85:b0:da:c40:8d7 with SMTP id
 ky5-20020a056a20dc8500b000da0c4008d7mr2074130pzb.1.1680863068941; 
 Fri, 07 Apr 2023 03:24:28 -0700 (PDT)
Received: from localhost ([203.59.189.25]) by smtp.gmail.com with ESMTPSA id
 l5-20020a654c45000000b005143448896csm2346080pgr.58.2023.04.07.03.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 03:24:28 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Apr 2023 20:24:23 +1000
Message-Id: <CRQG87D3J96O.2610UOHM3V36V@wheely>
Cc: "Richard Henderson" <richard.henderson@linaro.org>, <qemu-ppc@nongnu.org>
Subject: Re: assert !temp_readonly(ts) in tcg_reg_alloc_op
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Nicholas Piggin" <npiggin@gmail.com>, <qemu-devel@nongnu.org>
X-Mailer: aerc 0.14.0
References: <CRQEHNGPTSUM.34NYFP2RDLQA6@wheely>
In-Reply-To: <CRQEHNGPTSUM.34NYFP2RDLQA6@wheely>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Fri Apr 7, 2023 at 7:02 PM AEST, Nicholas Piggin wrote:
> I get a crash running a powerpc64 TCG machine on x86.
>
> It can be triggered by booting a custom vmlinux patched to use powerpc
> prefix instructions and pcrel addressing, I don't know if that's related
> or coincidence. I can give Linux patches or a vmlinux file to reproduce
> if needed, or I can test patches quickly.
>
> The first bad commit is 7058ff5231a0 ("target/ppc: Avoid tcg_const_* in
> translate.c")

This seems to do the trick:

diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 9d05357d03..23869fe6cb 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -1807,8 +1807,8 @@ static inline void gen_op_arith_modw(DisasContext *ct=
x, TCGv ret, TCGv arg1,
         TCGv_i32 t2 =3D tcg_constant_i32(1);
         TCGv_i32 t3 =3D tcg_constant_i32(0);
         tcg_gen_movcond_i32(TCG_COND_EQ, t1, t1, t3, t2, t1);
-        tcg_gen_remu_i32(t3, t0, t1);
-        tcg_gen_extu_i32_tl(ret, t3);
+        tcg_gen_remu_i32(t1, t0, t1);
+        tcg_gen_extu_i32_tl(ret, t1);
     }
 }



