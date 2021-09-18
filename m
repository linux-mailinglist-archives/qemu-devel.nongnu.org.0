Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43243410513
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 10:23:11 +0200 (CEST)
Received: from localhost ([::1]:59042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRVcs-00048n-5s
	for lists+qemu-devel@lfdr.de; Sat, 18 Sep 2021 04:23:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTq8-0002ft-ET; Sat, 18 Sep 2021 02:28:44 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:36546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tangxingxin1008@gmail.com>)
 id 1mRTq6-00034l-QH; Sat, 18 Sep 2021 02:28:44 -0400
Received: by mail-pg1-x532.google.com with SMTP id t1so11807664pgv.3;
 Fri, 17 Sep 2021 23:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Zof6qln9KfL35tIFe3vdGE4eSyh7vVbu74tQehmNgUk=;
 b=JjjbYAnatGIVP6Mw+fxSupD63SeRhxzEJ9xN2eQVK39DgRRr55CIeY5iUKUxMykadL
 eD8fcxIYUmHLUNXxjye1ZX3c+yujDQdPhGfr5fI5lHu6WmURtTp0dKtr5X3clJ9+lM7I
 9oIRxG9Crqji8qcyDaB5n76vnX07EYfb1iXPd/e7icS1LsYq5PfYK4U0dJXUS2UmXF0A
 9OuvZhumYKRiBGniCzxmoCI5HHXzKPRL0KqlA5Fgv3xak1Lcz2YnJFAr0o/bnuI8H+zJ
 T4iClyWbZOzTRY2SkV33FVG1XCS6A2Jzkv7IgdMcINSB4w6tne54+gHPVJQ8s3fraYro
 Y+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Zof6qln9KfL35tIFe3vdGE4eSyh7vVbu74tQehmNgUk=;
 b=UolHl53aj5gjEn7PMBsOUdr7fr0iLP+VsfMs6NEeiOQ6p1y77WOJhp2Wph3Kx5ZvrB
 IPLH3mvaqC11EALqW3coBM22cMy05tw8zH6JIL7T+OVmIfAG9StRP/lf6d5UJldF+8Ix
 IJZ/F5+eO1hJDgbfiTR/R+kVOw7GzGxyJtF5eyd7N73Qle5GA3L+CxifF/emI0ZIMq0E
 A/vk+hH/hS/VOYP9tLRmHzxkkuurEL/F6Q+WEDEXgpKovpMeUiU2pL6z+EL9Lqi5RWWV
 7+mukXFrATxgqn3tky1C6w83MiUUbJmorOwuMOzoG5qUTzMV8diY+jCVzaNOhmi225nN
 xHlw==
X-Gm-Message-State: AOAM532WQPXlI8OOPDngNH3Xhp3ErdHZNjoOFdkMZcKKgmZUiKqWKA7o
 YXEDh2dN9Oj+uEbtrevwAmUpTts2c48v7I5e
X-Google-Smtp-Source: ABdhPJybeNpLF8CAxkmYvRGE4oml6YHharOQh54BxjeXYRR7jugO2EDcMklBTPmqhgqFZQ7tHX0jog==
X-Received: by 2002:a63:a70e:: with SMTP id d14mr4950372pgf.431.1631946518592; 
 Fri, 17 Sep 2021 23:28:38 -0700 (PDT)
Received: from eric-OptiPlex-7080.starfivetech.com (ip164.ip-51-195-37.eu.
 [51.195.37.164])
 by smtp.gmail.com with ESMTPSA id f27sm8126432pfq.78.2021.09.17.23.28.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 23:28:38 -0700 (PDT)
From: Eric Tang <tangxingxin1008@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC 00/10] add the rest of riscv bitmapip-0.93 instructions 
Date: Sat, 18 Sep 2021 14:28:06 +0800
Message-Id: <20210918062816.7546-1-tangxingxin1008@gmail.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=tangxingxin1008@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 18 Sep 2021 04:20:35 -0400
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
Cc: alistair.francis@wdc.com, bin.meng@windriver.com, palmer@dabbelt.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patches fixed some issues about srow/sroiw/clzw instructions and
add the rest of riscv bitmapip-0.93 instructions except fsri/fsriw &
bext/bdep & bextw/bdepw for opcode coding or name conflict problems. The
problems had been fixed in riscv bitmapip-1.0 version.

I have tested these bitmapip instructions, passed by compare the results
that produced by qemu and spike.

Please review and give your opinion kindly :)

Eric Tang (10):
  target/riscv: rvb: fixed an error about srow/sroiw instructions
  target/riscv: rvb: add carry-less multiply instructions
  target/riscv: rvb: add cmix/cmov instructions
  target/riscv: rvb: add generalized shuffle instructions
  target/riscv: rvb: add crossbar permutation instructions
  target/riscv: rvb: add bfp/bfpw instructions
  target/riscv: rvb: add CRC instructions
  target/riscv: rvb: add bit-matrix instructions
  target/riscv: rvb: fixed an issue about clzw instruction
  target/riscv: rvb: add funnel shfit instructions

 target/riscv/bitmanip_helper.c          | 351 ++++++++++++++++++++++++
 target/riscv/helper.h                   |  28 ++
 target/riscv/insn32.decode              |  36 +++
 target/riscv/insn_trans/trans_rvb.c.inc | 215 ++++++++++++++-
 target/riscv/translate.c                |  14 +
 5 files changed, 641 insertions(+), 3 deletions(-)

-- 
2.17.1


