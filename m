Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F4F3C34BC
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 15:36:42 +0200 (CEST)
Received: from localhost ([::1]:56874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2D9t-0000fq-KQ
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 09:36:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2D8g-00087D-8F
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 09:35:26 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2D8e-0003wc-KU
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 09:35:25 -0400
Received: by mail-ej1-x636.google.com with SMTP id c17so22114914ejk.13
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 06:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=bv2x+/IM5RPoLHyBso4Qc4w3zof+JniDBUBCT67odU4=;
 b=n8gHg7Dd3wkrkSbtUqB8X9qL8ikmwIGpy9Y4OEEJf4oU+W0NZzo7zDRzZlkjtpxQ51
 v4h6/tzQJwTuZKuZVaYh7zMSL2ZkzBNcTricScxo0O0Wu89exEaKCZS7czU8+xP/6Vw0
 5LSIICInf3Wxq0XTpoWpdI4xzDifauX41jdz/0foBSxqp8DfnipEbOQzMZU79paI6ZxA
 0YXC6yqw0l73YDEcuozrMH7z/MfFWizoBefm3RhZwHnKrVyVQia1znzuRtOOSWpe6QgG
 2ffWS0p0y7tY/WGtRH/zMgZE2mzkFEEIp5DqvPm7phxGcRTtsRu2iU3U86M0trTUxc68
 1O+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=bv2x+/IM5RPoLHyBso4Qc4w3zof+JniDBUBCT67odU4=;
 b=PQIWR8o5R7b0JIkcnEqYbMDus/nE/OE7hqOo+vrGxfVdwes/YaZKK1d2I/PxCLGM5Z
 nsC2OnX0LTkOk/LKkWxh7dXuHJm3M1IimYJdpb2f9YUKFqKz8Ek6I9tvIZB8sIEsKaai
 4he5o8DHXPzZ+/AEDAa7u4i63XafTH4eaixfa79yPGiqkmVPxj7ussExt/rGZWVDFkwq
 aMqUc72io5R+SyvLodJ0wQrPyQssM10jQejfHla1jALP2t5/jp1q5ih8HGGScjz8dSfQ
 zJHOQPELRDycPT2CLbUB/d1BZw/JbYdlJaLnFgPkffHmi2opSq4rNf337YqIcBFYb+tW
 H1TQ==
X-Gm-Message-State: AOAM530ORCAyLi947TMbx45BTqfVHdLuvGjoKMXTfOO/Z6XdJb8dlijv
 QxMjzwSTD+C7AGz88SZrP2vexsLZQIbpTUka2dkYr/6leTMymQ==
X-Google-Smtp-Source: ABdhPJwYXueGZsEry1g2nOY1hQCAtbozzKt2vpcHRiSSJdNCJYADybFpL6dLzY/xBUX1kg/HbOmoV5G+A9qWv3lDeck=
X-Received: by 2002:a17:906:16cd:: with SMTP id
 t13mr22881216ejd.250.1625924122753; 
 Sat, 10 Jul 2021 06:35:22 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 10 Jul 2021 14:34:44 +0100
Message-ID: <CAFEAcA9ykYzTbuUskdCFkYYdYqZcUM5K2ciuFLKKh9_Y2GW7Dg@mail.gmail.com>
Subject: retrying failed gitlab CI external jobs (travis)
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
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
Cc: Thomas Huth <thuth@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; we now have travis's CI hooked into gitlab, which is nice. However,
unlike the gitlab native CI jobs, there's no UI for saying "retry this"
when the "travis CI" part of the overall gitlab pipeline fails.
This is awkward because travis seems to be prone to intermittent failures.
Is there any way we can make the jobs retryable?

thanks
-- PMM

