Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32FBF33FB09
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 23:25:08 +0100 (CET)
Received: from localhost ([::1]:58864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMebD-0008J2-7N
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 18:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMeaR-0007oU-Jo
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 18:24:19 -0400
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:38442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMeaQ-0002j8-4J
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 18:24:19 -0400
Received: by mail-ej1-x641.google.com with SMTP id r12so831508ejr.5
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 15:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=hA3+xDYk4BnFpu2owAaAT+dFxyMsEKZmeqohmiu5Ceg=;
 b=TLUBcaZkv0Jz9N9xuhe/mLFlvwL+dadSywxc2+mf9Nn5vgPxhX/AdO3Wyo4WoXNYvw
 8OYv94f0uc2dChBl2pJ8XmMpXmL3dMsX1KwMIqj94rT4jTtMJkkfiIvkBU5vzWEf2dp9
 lLPP5GhMyNa1UxxhO0JCEEVn8XssfstwDxe5vEO7hhCc/9LR57YNR/3H6h89V6WFgONp
 mpKrwZ8wv7IF1kml98PTXMyAzJJZJKF3o5ZGj2kF/sb3mFpbuPc2npq/wZSj/XUoC0E5
 PL60evHk884o9m6rCyfSASMxyZl7ew8KDlt4lGBFo1bkCMVyVF7wL1nD50UDt7/+LfJI
 pj5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=hA3+xDYk4BnFpu2owAaAT+dFxyMsEKZmeqohmiu5Ceg=;
 b=gb9X/msyhwdGEui0Njwq4p7/JqZ92l6jtJNp3WHKhQQEZmSUjgkl951SwUacSZ33j9
 JfmEo5vujsBwTwQ23l5KL99EFl1w/ppdHgZfilLeQJcND2zsUczrMimo9S0BhWniKSLf
 B8BuHq7nYitXt9zQAgaWowH3y8Y7Nc+9Ih4hxqtKLQeIOkdlNCQwpbqDnrqkiUmvNuXw
 Yl0Q6iCmDJdt9SiYs18dZCQwSMM5yVhKARRb2JKb9HheiEHZxVouz/LWJf0pT2OH7e3h
 rhvjHDM4DMEIGXO7SW/bup4ic2VCqmOYdf9nGtDLb7inBTY0MdNPzhKP7akHcnOUmDiV
 jrDA==
X-Gm-Message-State: AOAM5325ayTjWz4WiwTSASiKSOyRQSKVTEnAcpM9ITn5hCrJ5s9Z3dAq
 nZO8hUrF9stULxpGXynHnx98Bt+Uw8c1jFxXdgC5ZT3JxiMf2Rgr
X-Google-Smtp-Source: ABdhPJz7FmYJbiGcoSw2vjSTBTBPYC/tMiNbACSL56YSqVLFez8a2BZ6r3cXULxLGXGNoUnLvoyE3YINhVVJ84t/bSA=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr37474794ejj.4.1616019855931; 
 Wed, 17 Mar 2021 15:24:15 -0700 (PDT)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 17 Mar 2021 22:23:52 +0000
Message-ID: <CAFEAcA_cZYF9u8RfW5mUY7TgOLsRYh1sN7oioztfSV8_990peg@mail.gmail.com>
Subject: iotests failing on gitlab CI check-system-fedora job
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
Cc: Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The check-system-fedora job in the gitlab CI seems to have
started reliably failing on iotests 040 041 127 256 267:
 https://gitlab.com/qemu-project/qemu/-/jobs/1106977551

Could somebody have a look at what's happening, please?
(This is probably a regression that's got into master because
I stopped using "did gitlab CI pass" as a gate because gitlab
was running massively too slowly to be usable for that.)

thanks
-- PMM

