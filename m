Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71EF4595BEA
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 14:41:08 +0200 (CEST)
Received: from localhost ([::1]:54632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNvsZ-0000HM-I8
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 08:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNvkK-0001uD-6I
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:32:38 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:34765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oNvjl-0002Nj-Nu
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 08:32:02 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-333b049f231so34691317b3.1
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 05:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=v+DRertAfOhDVcUnuGx9lEwhV6sbeQ2CQXMPmOp/Nvs=;
 b=Uas8zK7axSC01+TrTA/wNZ1xP2S+vma9C5mERK33X9vd/7Qf/yP3c8zuk8m0kAiPX5
 bke4r+RjlXW89b9dkta4W3qO67/+havYt9AsG9MiIZi+72DYSae059SVy1V1rxmBZznq
 TOWDpQyJVnUR+NNORwT+gx4EHHUCg198Xsg4H0m5tNXAMLxGu51X6d5ET49oz6xGBuVN
 BdnbJ9q2WVCg79oU97HxKgFiZR+fNSd6B8MrGilYQSN+/p+gwjo4nrO9DZ4JX6ipr9E4
 bH9SzVzzwOTj4VLjDb7WsEkzMmI1vP6GsYXkVmOgNiPqbrncLQyrRuvJi3+cduWpUHnD
 RE1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=v+DRertAfOhDVcUnuGx9lEwhV6sbeQ2CQXMPmOp/Nvs=;
 b=olIcsj0bikXagqtqQeRpYJlQB6+iJtpHWkQvptOjwa4+n1OEGlCUMOKi8SEgk4ZA6z
 G1SlKLvwgONLCLQjyEo5C9ou0BCrpQlpXo+t56rg5aAP77kWLzLhICG2XU+86i7/Vtg/
 ylO7KNnhPG7i5NLrTGH7WLY2yITTk5s457MJDkdoq0uHlB9ezXPRsRLCtBFcPzVU47Sz
 VHeuL1qVA/Cn8+CBj8sY59fDfLHIL6/pXqJSMmkus5wxHB7F2rXJRv8Vd4m1H/6BJLMr
 PQkeIleeXeu2z4SihWFIJdu4mRlRE2C+do6Zt687qY4xJWAX7fA5WhGiNiCFeGL9iyOj
 cnyA==
X-Gm-Message-State: ACgBeo3xgXvFXMNTUh1ScrkdycUI15zv2onHpBiXqiQhVarbR5JFE9Sr
 OCSmGxYGdYGHS81yvEi7yBDxVyjQb6eys2HjeVaT2Q==
X-Google-Smtp-Source: AA6agR7dLeAK+sEftuM6C/QD8QaZZa6Q6wVpEdYhAmp7wiXSmHCU3DXOfxjo+q4REmQwIjLVEXSvtxqafi7EWETpIK8=
X-Received: by 2002:a25:3d0:0:b0:67c:2231:65e with SMTP id
 199-20020a2503d0000000b0067c2231065emr14218893ybd.67.1660653119619; 
 Tue, 16 Aug 2022 05:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220812021427.cwenhciuftgtaj64@altlinux.org>
 <20220812084529.ur5qcyws5qvoyvuc@altlinux.org>
 <CAFEAcA9BuSe4SwpoWTALURaxoj-8U2y83k=und7oKrZBggLarQ@mail.gmail.com>
 <87h72hv71u.wl-maz@kernel.org> <20220813111137.5plgwrfnosolj2bp@altlinux.org>
 <8735e0s1zw.wl-maz@kernel.org>
In-Reply-To: <8735e0s1zw.wl-maz@kernel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Aug 2022 13:31:18 +0100
Message-ID: <CAFEAcA__6WaoFwTHH1FhAU1xpvGpA2YvZTo1BTjbKw2GqS5q+w@mail.gmail.com>
Subject: Re: qemu-system-aarch64: Failed to retrieve host CPU features
To: Marc Zyngier <maz@kernel.org>
Cc: Vitaly Chikunov <vt@altlinux.org>, qemu-arm@nongnu.org, 
 kvmarm <kvmarm@lists.cs.columbia.edu>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dmitry V. Levin" <ldv@altlinux.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Sat, 13 Aug 2022 at 14:32, Marc Zyngier <maz@kernel.org> wrote:
> But we probably need to handle EINTR when creating the mini VM.

It's easy enough to add a retry-on-EINTR loop to the KVM_CREATE_VM
ioctl in the target/arm/ code. But do we need to do that more
widely ? At the moment QEMU seems to assume that KVM ioctls
will never fail EINTR except for the one special-cased
KVM_CREATE_VM, plus (more obviously) KVM_RUN...

thanks
-- PMM

