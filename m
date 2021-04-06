Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E36D355A2A
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 19:18:43 +0200 (CEST)
Received: from localhost ([::1]:53682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTpLe-0008RN-5M
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 13:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTpIR-00072s-Jw
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:15:24 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTpIE-0007v9-CK
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 13:15:14 -0400
Received: by mail-wr1-x42f.google.com with SMTP id b9so7155795wrs.1
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 10:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=user-agent:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NYpQr/0loJZsY6NjE8VW+WSByt6uiaPkmGftFbmj8io=;
 b=lk8DE3P7uB6tgqIuEnQk5rXv8RxGHFNXEymQV6sP3dJN85NVVzANgPRaeKe4DLQTxd
 +y2I6Db56atzmTrUwSeg3aHieJEKmnNYcjQJGjiyRBjWMebIAz/TBDf1gCken9y3EfgZ
 lluJ18e38DN0nSOiYBl31mhVBTZdBfeE36QaL09JzeEhS3am8VCQbJlHaUga8WSzqR8M
 grcOfSSRsI4hLtzv83NpKgaDF+Z2/GbZuY8jfpAlTprCTFGBMxKRreHlL7deC0JKGslE
 /yCvyUg4KSvH+WxXCkko/i3CJ9N83o5QEw5T1c2/ct9q9yFWhtpGqx6hDWjr1dWX6og6
 vOUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:user-agent:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=NYpQr/0loJZsY6NjE8VW+WSByt6uiaPkmGftFbmj8io=;
 b=K2whOkXB1Ckj4ot+9RjI0B8MIIhO30bTOH8aKYesjHU1mxEwqa5wB76ct50j0YGTpQ
 aX2JOFBsZakPfVzYWsAQd3TLFBPtxCB1Zc9rGi7DK74xTvBhMZU7+Ph4k8+RSXVi4fpq
 zzDQ+Q0ZMsn4wECoc8bNz+lYkr3zVjMhKudDs8VswiB45ctyiJZrvMapHKBa09u/nUiw
 WOV98d3gdfBubtM59Z0DIHCqSnVg+FHVsNUpF1BhtgQeC6dEOiknplHsE8FkIsKe+HZM
 sZtylTeIOvHd4blj4iUcN5UUiJp6K6SnODV0rbov3mgij86S069zuufarEmflKR7zE2k
 eDbg==
X-Gm-Message-State: AOAM530fMsDIhimBrumg8HJTVGuYi/uGWV/ovc1qenkTZye+fTQXAFFc
 EMJLEygcpA+ZKCoPAuykvDlwgCx5hRZzJw==
X-Google-Smtp-Source: ABdhPJy8mJoI1K3aa9BKOvMDqgpjn8SWf/NQsRUt6812Tt/tISnBNITCpNNeh7s3ZhH99fbGjhpCCA==
X-Received: by 2002:adf:fb42:: with SMTP id c2mr36511321wrs.83.1617729308817; 
 Tue, 06 Apr 2021 10:15:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i127sm3962688wma.6.2021.04.06.10.15.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 10:15:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B750C1FF7E;
 Tue,  6 Apr 2021 18:15:06 +0100 (BST)
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Stefan Hajnoczi <stefanha@redhat.com>, =?utf-8?Q?Llu=C3=ADs?= Vilanova
 <vilanova@ac.upc.edu>
Subject: trace_FOO_tcg bit-rotted?
Date: Tue, 06 Apr 2021 17:00:20 +0100
Message-ID: <87eefnwd0l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: matheus.ferst@eldorado.org.br, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

It's been awhile since I last played with this but I think we are
suffering from not having some test cases for tracing code
generation/execution in the tree. I tried adding a simple trace point to
see if I could track ERET calls:

--8<---------------cut here---------------start------------->8---
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 0b42e53500..0d643f78fe 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -36,6 +36,7 @@
 #include "exec/log.h"
=20
 #include "trace-tcg.h"
+#include "trace.h"
 #include "translate-a64.h"
 #include "qemu/atomic128.h"
=20
@@ -2302,6 +2303,9 @@ static void disas_uncond_b_reg(DisasContext *s, uint3=
2_t insn)
         default:
             goto do_unallocated;
         }
+
+        trace_eret_tcg(s->current_el, dst);
+
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
diff --git a/target/arm/trace-events b/target/arm/trace-events
index 41c63d7570..2d4fca16a1 100644
--- a/target/arm/trace-events
+++ b/target/arm/trace-events
@@ -1,5 +1,10 @@
 # See docs/devel/tracing.txt for syntax documentation.
=20
+# translate-a64.c
+# Mode: softmmu
+# Targets: TCG(aarch64-softmmu)
+tcg eret(int current_el, TCGv target_el) "trans_eret: from EL%d", "exec_er=
et: EL%d to EL%"PRId64
+
 # helper.c
 arm_gt_recalc(int timer, int irqstate, uint64_t nexttick) "gt recalc: time=
r %d irqstate %d next tick 0x%" PRIx64
 arm_gt_recalc_disabled(int timer) "gt recalc: timer %d irqstate 0 timer di=
sabled"
--8<---------------cut here---------------end--------------->8---

According to the tracing docs I the:

  trace_eret_tcg(s->current_el, dst);

Should:

  Instead of using these two events, you should instead use the function
  "trace_<eventname>_tcg" during translation (TCG code generation). This fu=
nction
  will automatically call "trace_<eventname>_trans", and will generate the
  necessary TCG code to call "trace_<eventname>_exec" during guest code exe=
cution.

But it falls down with the following:

  ../../target/arm/translate-a64.c: In function =E2=80=98disas_uncond_b_reg=
=E2=80=99:
  ../../target/arm/translate-a64.c:2307:9: error: implicit declaration of f=
unction =E2=80=98trace_eret_tcg=E2=80=99; did you mean =E2=80=98trace_eret_=
exec=E2=80=99? [-Werror=3Dimplicit-function-declaration]
           trace_eret_tcg(s->current_el, dst);
           ^~~~~~~~~~~~~~
           trace_eret_exec
  ../../target/arm/translate-a64.c:2307:9: error: nested extern declaration=
 of =E2=80=98trace_eret_tcg=E2=80=99 [-Werror=3Dnested-externs]
  cc1: all warnings being treated as errors
  ninja: build stopped: subcommand failed.

So I'm wondering what needs to be done to fix this? Given the one other
tracepoint is in the general tcg-op.c is this just some build stuff to
do with how the tracepoint segments are generated?

--=20
Alex Benn=C3=A9e

