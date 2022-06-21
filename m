Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4291553917
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 19:43:40 +0200 (CEST)
Received: from localhost ([::1]:47276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3hud-0003Xf-UI
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 13:43:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3hm4-0002qC-6c
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 13:34:49 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:46751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o3hm2-0002L6-E4
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 13:34:47 -0400
Received: by mail-yb1-xb36.google.com with SMTP id l11so25651055ybu.13
 for <qemu-devel@nongnu.org>; Tue, 21 Jun 2022 10:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d9ZbXmQLFhnX/3ekXkvyrQROH4oz1tGU4TXGUU5TFME=;
 b=L8GLYDDQTeAHLZCH1u7v6b//rZCow6FkVOijrqtcBBaYwKzmKjDvO9uf/orzUJDYkw
 t2qmgI1hP6B1vtp+CQp9ChhGcH936oDPCrv5/ML18PC5zzy7KzNUGKviPwjJ5P7Rezzq
 HsBOrbER4mY4trGt7mM8zwMhS21a/moazpu0jdA7Nmu1OXW8A7TzaVpwsSXpZqHj4yzM
 OkUyUm9hj/iqS6xOINpOvTDLUA023g2ioXR4D7PA/TUAAl9uNVL4utxQE8P27F12g7RD
 +WRItr6p5SQS2HHK+xiPim+PX7KbtSz3h+j1z7BCdAshzigbZOG47NM7PkgpKWHQapzL
 oMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d9ZbXmQLFhnX/3ekXkvyrQROH4oz1tGU4TXGUU5TFME=;
 b=u7FwFWY+UzwMY4QXG/egVm0+OtqTx4zPqaQqjGNtrnRLCfOGQsRQLqgvGM4/J2CoxL
 qzbNkkoU5kMDEuzf4bS5QNYmpcYrl961Mb6tYzUxY3fQoibYAtXdcVxy7D0W+c4FajZO
 fSN8dD9bNzgkyqvsyY2SjErNDEzQPxbrs6mJao2ttM/Ylxx38Qvb05EYCOncp/5zUlB6
 1pgLd5GGXbqxyRnlKGyIkdMMnixSHqIL0DQyH5SF9d37O6n/eCihCM67OEr07rJkrz9Q
 dfVg1gUaqCqFbC3Sf6L5fFjTak3B0D9Pw9qX8wO94Gu2m08g4jir7FhTWFjg10gAdFuf
 ZTTA==
X-Gm-Message-State: AJIora8JbYm/evJt8AuTbLx6Mrd1h/zaNQh87dGN5PSZjWs/IqU0Vk1T
 M0t/aN9z7i1Zmxo8pHlzKtdjIW1NqOY43lXU5muIJQ==
X-Google-Smtp-Source: AGRyM1tfCIMneb2jjZqnEjb1is4xZO9LM42kHusL/euWDHGVIZMghiSGC9Ji7mVMOQkPR4HXijdMnMc+Md4zweLm8nw=
X-Received: by 2002:a5b:dd2:0:b0:668:fc4a:9403 with SMTP id
 t18-20020a5b0dd2000000b00668fc4a9403mr14319015ybr.39.1655832885122; Tue, 21
 Jun 2022 10:34:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220620192242.70573-1-agraf@csgraf.de>
 <20220620192242.70573-2-agraf@csgraf.de>
 <CAFEAcA8=ThZ_texhcH2vqMicpAxOR9G1jtpCyBDbz9gbk5yg=w@mail.gmail.com>
In-Reply-To: <CAFEAcA8=ThZ_texhcH2vqMicpAxOR9G1jtpCyBDbz9gbk5yg=w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2022 18:34:07 +0100
Message-ID: <CAFEAcA9kRP+dHj=a2OFnx0k+d9FSnQShjr+5Ff85tLQNZXZoyw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] target/arm: Catch invalid kvm state also for hvf
To: Alexander Graf <agraf@csgraf.de>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 21 Jun 2022 at 12:41, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Mon, 20 Jun 2022 at 20:22, Alexander Graf <agraf@csgraf.de> wrote:
> >
> > Some features such as running in EL3 or running M profile code are
> > incompatible with virtualization as QEMU implements it today. To prevent
> > users from picking invalid configurations on other virt solutions like
> > Hvf, let's run the same checks there too.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1073
> > Signed-off-by: Alexander Graf <agraf@csgraf.de>
>
>
> > --- a/target/arm/cpu.c
> > +++ b/target/arm/cpu.c
> > @@ -1490,7 +1490,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
> >          }
> >      }
> >
> > -    if (kvm_enabled()) {
> > +    if (!tcg_enabled()) {
>
> I'm a bit surprised we don't need to also have "&& !qtest_enabled()",
> but I guess if "make check" works then we're fine :-)

In fact you do need to handle qtest here too, otherwise
lots of tests in 'make check' barf on the unexpected error...

I'm going to squash the following fix in and take the patchset into
target-arm.next. (PS: you forgot the cover letter, I think ?)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0862dcd63cb..d9c4a9f56d2 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -39,6 +39,7 @@
 #include "hw/boards.h"
 #endif
 #include "sysemu/tcg.h"
+#include "sysemu/qtest.h"
 #include "sysemu/hw_accel.h"
 #include "kvm_arm.h"
 #include "disas/capstone.h"
@@ -1490,8 +1491,12 @@ static void arm_cpu_realizefn(DeviceState *dev,
Error **errp)
         }
     }

-    if (!tcg_enabled()) {
+    if (!tcg_enabled() && !qtest_enabled()) {
         /*
+         * We assume that no accelerator except TCG (and the "not really an
+         * accelerator" qtest) can handle these features, because Arm hardware
+         * virtualization can't virtualize them.
+         *
          * Catch all the cases which might cause us to create more than one
          * address space for the CPU (otherwise we will assert() later in
          * cpu_address_space_init()).


thanks
-- PMM

