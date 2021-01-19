Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB47A2FB685
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:55:19 +0100 (CET)
Received: from localhost ([::1]:41212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1rTa-0001Rl-PG
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:55:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rPX-0005dl-Hn
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:51:07 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:33321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1rPR-0005Ju-0i
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:51:07 -0500
Received: by mail-ed1-x534.google.com with SMTP id c6so14463934ede.0
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 05:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=d+vjECBYFoR6D1gAq6LxYtYPG1ClriFhGmGlhv7QJag=;
 b=VNOEhDZYFKYnZVyUKcLpLVuYPtgVIJf5JIohfKT4j/JCdn5ReKeNCpZDQki82g1Evr
 GqrkFxhXPBgiGgcyYAUWoTMtNs1eQ1DfBPg721+2onicGY7UUVRMl+YwfqZqJ6vYVEiJ
 kpNqiACNaNZzOc83bM2jQMZueI9Px1iTZFbideSdIPiWXdqA0J6bkIOJER8LafxY/GrU
 EJIXxosuvN/9k0uQ8OV81MrsDhppCvYW9S9GbeezS/3ZZYSrqVPtCDTH2EjVnuNft9O5
 0cr6n0k3y0yWJb9khbbkii7nLs6lVqkJeQefjlvz93CaZGqkwEDaMZ/VrKzM6AwySzul
 a6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=d+vjECBYFoR6D1gAq6LxYtYPG1ClriFhGmGlhv7QJag=;
 b=rYVOrPqWkh5wAit/U52UBXVsFfzEvvHAE2GHDfGjoG+Aw9g6S0cxyQh9cD9aWh/NYs
 xinh+W6f3Qctp8OL43RhGN5VadRlinIwNIxam3FNMjVOFERoBwkUsPvv6laxhRd9pDh9
 rOQiSw1opa5mhMjNyivJiUXbChmC8OhOyKbqjbnzAypysIVLzfgSGLPUS3ZLpBRw8Imj
 9AiCfSXTSNicsygKbHZczo2gVdPa0JfOUJ0kP/Pt/pgId9PcxOzBwONoCIw0D+JHFW6o
 nis/vmcFajNI0LoEomu4qsnpPuL2gkYtHiB+qYsSvu5KTKrGoKCTrsEsk9LBbq6CUJYF
 proA==
X-Gm-Message-State: AOAM532UXMKTGcaMRUuqmx6N3dWTu9NJR4Wi5Rfvb7AtCxV8sKThAOcD
 X4Y9osoXEqzE2SK6lx1+FDus8YNBlzY81RZyz2aYcg==
X-Google-Smtp-Source: ABdhPJxGhA2vD6GnCNn+owPy1uHOnPDKSMH6y6pCLMZJLbP0lQR/ujZ6AgzrBCNRoNfEuPPTEURc9JTnl1h0BdqDm3k=
X-Received: by 2002:a05:6402:1a55:: with SMTP id
 bf21mr3592180edb.146.1611064258924; 
 Tue, 19 Jan 2021 05:50:58 -0800 (PST)
MIME-Version: 1.0
References: <20210117192446.23753-1-f4bug@amsat.org>
 <20210117192446.23753-2-f4bug@amsat.org>
In-Reply-To: <20210117192446.23753-2-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 13:50:47 +0000
Message-ID: <CAFEAcA_358tUe-O9Yb94p=xDXXLTNM8EoQRvwMKEY_bmSTfzJQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/20] migration/vmstate: Restrict vmstate_dummy to
 user-mode
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 17 Jan 2021 at 19:24, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> 'vmstate_dummy' is special and only used for user-mode. Rename
> it to something more specific.
> It was introduced restricted to user-mode in commit c71c3e99b8
> ("Add a vmstate_dummy struct for CONFIG_USER_ONLY") but this
> restriction was later removed in commit 6afc14e92ac ("migration:
> Fix warning caused by missing declaration of vmstate_dummy").
> Avoid the missing declaration warning by adding a stub for the
> symbol, and restore the #ifdef'ry.

So what is the actual use of vmstate_dummy ? I had a grep
through and as far as I can see the points where vmstate_cpu_common
is used are all in softmmu-only code. I tried this patch
and QEMU seems to compile OK:

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 140fa32a5e3..a827417a4d8 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1131,8 +1131,6 @@ bool target_words_bigendian(void);

 #ifdef CONFIG_SOFTMMU
 extern const VMStateDescription vmstate_cpu_common;
-#else
-#define vmstate_cpu_common vmstate_dummy
 #endif

 #define VMSTATE_CPU() {                                                   =
  \
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 075ee800960..8df7b69f389 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -194,8 +194,6 @@ struct VMStateDescription {
     const VMStateDescription **subsections;
 };

-extern const VMStateDescription vmstate_dummy;
-
 extern const VMStateInfo vmstate_info_bool;

 extern const VMStateInfo vmstate_info_int8;
diff --git a/stubs/vmstate.c b/stubs/vmstate.c
index cc4fe41dfc2..8513d9204e4 100644
--- a/stubs/vmstate.c
+++ b/stubs/vmstate.c
@@ -1,8 +1,6 @@
 #include "qemu/osdep.h"
 #include "migration/vmstate.h"

-const VMStateDescription vmstate_dummy =3D {};
-
 int vmstate_register_with_alias_id(VMStateIf *obj,
                                    uint32_t instance_id,
                                    const VMStateDescription *vmsd,

thanks
-- PMM

