Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B50A3FF14F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 18:25:30 +0200 (CEST)
Received: from localhost ([::1]:47264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLpWr-0006IE-8S
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 12:25:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpOj-0000Sk-Rh; Thu, 02 Sep 2021 12:17:05 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:35702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mLpOi-0001SM-8o; Thu, 02 Sep 2021 12:17:05 -0400
Received: by mail-wr1-x432.google.com with SMTP id i6so3843966wrv.2;
 Thu, 02 Sep 2021 09:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FVQ82fA2n+2YkhWVmssVrmq1ZgiebK+OWD8XFPkR2KQ=;
 b=NTN9poXw36sIQz7tT1cMpoOOwTG/lxJCt9n/hIDHpJ5oAGalZwShWoEdYjhHzzlMVv
 8/2soAA7WUYORMTBYBpUDtWNNxUFfDfUYJu04XkeEJLId1oUy0fpWdBO6D7Yyx1272JJ
 XKOsoC+njj5yavj0Qu1MgGlocXXaIcWXPI9T20BJ6avUCeJwQryVdBqiUkNfXQOnUX19
 Ji1BNyPOvloHuZqi99dMvFNWYRhFh5wijABsraMfCS9+BoMw9K93KiX8s+h3u2DNCNBy
 aYF39Fl9JigWDlhE1ZATlIq1qqUJ331MkmIOX3TRyMSoprNUbK+LRaCdaECy2hoGa1sh
 /wYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=FVQ82fA2n+2YkhWVmssVrmq1ZgiebK+OWD8XFPkR2KQ=;
 b=ZMol4hVEaoJkjLUK8FAzaftuv86t08mGgdGGxHwomNqPsytQS7AbT6zitJHSfYQYmw
 V1RZrgjwxcRFWavRijnMxSmsjgYv2mttOMRVM/OGgBxlfxoiIVIvIm6u5N6rxVgb3vek
 FIBGsleDsRumgR4ZX/jFOJInIko5QCRz9PCkqMbnnvvwc3jjyZb9eXurqpt5YIPPpXHT
 jHRrt8hEQ8CRw22PUbkGuIRUxwjvWUke2xGk9hANDX+16qrYJN7+zmqzmRmgBSgSNUxL
 AlR9epLn0b4ZFx17QDR09zgAmX7o5CnVcjAft6CTbiEmjSFwY5Ru3GeIl8m8bc95DUBn
 HvFg==
X-Gm-Message-State: AOAM532dC9RkjPDi1dB35WNPxRdrbaOAG4i7BlqPBD4xerwvlFla5ASf
 mTJnSKBi/tmCW2hczjIcNwhoSrBKbG4=
X-Google-Smtp-Source: ABdhPJwPHE7SqMAg84hdLm/drHbhhc9Rf1ir7m9E7UwL/bm+2kZWpbUhpR7xKiGkP3mn69DCmtzK4A==
X-Received: by 2002:adf:fd8c:: with SMTP id d12mr4712589wrr.21.1630599419723; 
 Thu, 02 Sep 2021 09:16:59 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 m5sm2067398wmi.1.2021.09.02.09.16.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 09:16:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/30] target/hexagon: Remove unused has_work() handler
Date: Thu,  2 Sep 2021 18:15:25 +0200
Message-Id: <20210902161543.417092-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210902161543.417092-1-f4bug@amsat.org>
References: <20210902161543.417092-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Taylor Simpson <tsimpson@quicinc.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Stafford Horne <shorne@gmail.com>, Marek Vasut <marex@denx.de>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Paul Durrant <paul@xen.org>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

has_work() is sysemu specific, and Hexagon target only provides
a linux-user implementation. Remove the unused hexagon_cpu_has_work().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/hexagon/cpu.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index 3338365c16e..aa01974807c 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -189,11 +189,6 @@ static void hexagon_cpu_synchronize_from_tb(CPUState *cs,
     env->gpr[HEX_REG_PC] = tb->pc;
 }
 
-static bool hexagon_cpu_has_work(CPUState *cs)
-{
-    return true;
-}
-
 void restore_state_to_opc(CPUHexagonState *env, TranslationBlock *tb,
                           target_ulong *data)
 {
@@ -287,7 +282,6 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, hexagon_cpu_reset, &mcc->parent_reset);
 
     cc->class_by_name = hexagon_cpu_class_by_name;
-    cc->has_work = hexagon_cpu_has_work;
     cc->dump_state = hexagon_dump_state;
     cc->set_pc = hexagon_cpu_set_pc;
     cc->gdb_read_register = hexagon_gdb_read_register;
-- 
2.31.1


