Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB4852F21E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 May 2022 20:11:35 +0200 (CEST)
Received: from localhost ([::1]:47852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ns766-00031U-Pd
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 14:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6xp-00067D-Ks; Fri, 20 May 2022 14:03:02 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:42958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1ns6xn-0004OK-VE; Fri, 20 May 2022 14:03:01 -0400
Received: by mail-ed1-x52b.google.com with SMTP id s3so11713840edr.9;
 Fri, 20 May 2022 11:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=tDa1dDpAyuUboWjaxNd8pdfd70CjgmOvNosK2Pg1Fac=;
 b=o0nl8uQgek/AuSB3kg9m+ndYw1LJg98n2diNnN6HVpphzOfWUej2UmIkbWt2gRfm6e
 n/wR9Ftl9IuojRdqiVDG5hvV+EDjae9XZuCgbma9ZtdUmCzI467bj7wQ7I3dJDJ9Mzee
 5s6Xnqn/6paoXX4pEq7buhhrvmTlWuO86HUoCiDVkuA9+ldLteKsEFIs4WAQuSORfCl/
 d3Bb5lir3F1rsV9U4sax/Zw62KdKK4cKbdMy2E0sd3dZHwO0kTOthdyxx6p7HYDKZcz+
 wxPFDMIkQDaajNGsayToVmkHZ+1TL02OMUSexb50OiHpl7otPxO8hlpcVy4Io17p1mPK
 XZtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=tDa1dDpAyuUboWjaxNd8pdfd70CjgmOvNosK2Pg1Fac=;
 b=QL2k5sSfkzgXV8uQzOGkb5P4cyk/z/Wzp4E9N015+wefNXsOA+I7hK5n+Y3ej/AcxR
 f9SAoPrp3EkvQLcVcWJFhPnoU/vAFogejJ7xRfqQ7yrwBsaQmc5NVSrsgGSBxcbbWqRK
 hBlmT/LCAmo4pkAvwGVtPFFPbh1++cXTxynE5p3/sC7UR1hZaBe2MxJmJB5nM5CspaAy
 fB2kOGYAeZE9Irq7X/zkqiSW6WiE7yI1kjRcfuTC00DddIFIBLN4m5Qtqucq772oW3Qe
 tbznds/exBGn+bcDsdEtm4Ri8N6fZy26I+/kqcPcDQdK4P67UysZj9VL4gVEaBg1CztS
 +dow==
X-Gm-Message-State: AOAM5323N++WhHWBEq/bUEn6+SMbWBpVml/ZFXuL2gp6+HtEkL7RJKZy
 zzHaVa/kYYXP4qQjZ1Idu63wDUs4c+Q=
X-Google-Smtp-Source: ABdhPJzGg0fhzn/V8fR9sUW0GhW+U9iaXCGfYnLNtMfQBqhyxx5BNUbqkdGxXjsioJcBDPM0dea23Q==
X-Received: by 2002:a05:6402:1d48:b0:427:dfa3:2272 with SMTP id
 dz8-20020a0564021d4800b00427dfa32272mr12122156edb.333.1653069777979; 
 Fri, 20 May 2022 11:02:57 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-014-209-236.89.14.pool.telefonica.de.
 [89.14.209.236]) by smtp.gmail.com with ESMTPSA id
 d13-20020a05640208cd00b0042617ba639esm4598054edz.40.2022.05.20.11.02.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 May 2022 11:02:57 -0700 (PDT)
Date: Fri, 20 May 2022 18:02:53 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 08/10] accel/tcg/cpu-exec: Unexport dump_drift_info()
In-Reply-To: <20220520180109.8224-9-shentey@gmail.com>
References: <20220520180109.8224-1-shentey@gmail.com>
 <20220520180109.8224-9-shentey@gmail.com>
Message-ID: <B372FB7B-2E70-400C-8320-46F32F42068A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 20=2E Mai 2022 18:01:07 UTC schrieb Bernhard Beschow <shentey@gmail=2Eco=
m>:
>Commit 3a841ab53f165910224dc4bebabf1a8f1d04200c 'qapi: introduce
>x-query-jit QMP command' basically moved the only function using
>dump_drift_info() to cpu-exec=2Ec=2E Therefore, dump_drift_info() doesn't
>need to be exported any longer=2E
>
>Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>---
> accel/tcg/cpu-exec=2Ec   | 2 +-
> include/exec/cpu-all=2Eh | 2 --
> 2 files changed, 1 insertion(+), 3 deletions(-)
>
>diff --git a/accel/tcg/cpu-exec=2Ec b/accel/tcg/cpu-exec=2Ec
>index 635aeecc0a=2E=2E7cbf9996b7 100644
>--- a/accel/tcg/cpu-exec=2Ec
>+++ b/accel/tcg/cpu-exec=2Ec
>@@ -1048,7 +1048,7 @@ void tcg_exec_unrealizefn(CPUState *cpu)
>=20
> #ifndef CONFIG_USER_ONLY
>=20
>-void dump_drift_info(GString *buf)
>+static void dump_drift_info(GString *buf)
> {
>     if (!icount_enabled()) {
>         return;
>diff --git a/include/exec/cpu-all=2Eh b/include/exec/cpu-all=2Eh
>index 5d5290deb5=2E=2E9a716be80d 100644
>--- a/include/exec/cpu-all=2Eh
>+++ b/include/exec/cpu-all=2Eh
>@@ -419,8 +419,6 @@ static inline bool tlb_hit(target_ulong tlb_addr, tar=
get_ulong addr)
> }
>=20
> #ifdef CONFIG_TCG
>-/* accel/tcg/cpu-exec=2Ec */
>-void dump_drift_info(GString *buf);
> /* accel/tcg/translate-all=2Ec */
> void dump_exec_info(GString *buf);
> void dump_opcount_info(GString *buf);

Ping

