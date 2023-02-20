Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB1B69CC47
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 14:38:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU6N2-0001QX-JM; Mon, 20 Feb 2023 08:38:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU6Mz-0001QC-H1
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:38:17 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU6Mx-0002cb-RF
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 08:38:17 -0500
Received: by mail-pf1-x429.google.com with SMTP id fb30so486751pfb.13
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 05:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BYAdpcMquJrPiRLAbm3+em1rpL6y7keM4hsmzkZO6/4=;
 b=xzqpUH2qa5eLE5P/FwlxGzvMX2RU1eqtmBdSvK0KhC59vLqLZpeEzza8+CKbAYbWNv
 QmP33pqa+vzP9cpAWnGTM/ioDOPudAoAKWHTNbe5VjoC71874h2Mie9IogXDdu4aRnf5
 MSJS3VXgxwKxcz+NpVrQisoFle35cgbM79H19Yx4G0Kb+t6TtRBfYA7vde0iPfBDmHfu
 tX/+VvH8jwBLwhoP54lhApedRdBDI7U1LUWT5bRdD9Kd6e+KjFIp4CXbBazb5zfo/8/a
 AfEQOk31NiXJWBxGMfiY4NIuWgPSV5evEAD3Q/egCfWFFkcfZBtSmpaNY0pAL8Jo40lu
 RLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BYAdpcMquJrPiRLAbm3+em1rpL6y7keM4hsmzkZO6/4=;
 b=HhY3+nFuJ6Gi2VDr24rpAY8C9B7Laeq1w0gi9XwXq+hGh6LSRgjmQHc0v+om+Y5Gcx
 MG6BDXI5nygx/lp5AulvEnfOOyWbuMeEaxx1nNOpbqJwFw5HxGkkxieraP5tytJ0FPlE
 u+DABbWfDI6KC+qpuMCJ7lw0cvGqqPeV5gVUpc7QzDjNyrcJ7MI8VNSbnQxQM7yr7vdz
 EnYDg7J7DaHWWQEOqQ16B4c3UOf1dWJ5puGqn2RlhDXFqJ9IQ3ImNE2IWMngD8NdU7H4
 aXxEXT6jzwGIfFybCTw7geV3HGEO+jSurcewFxNQzsgbtZOA8UDbZgGdkPUIjVZeqJLV
 giOg==
X-Gm-Message-State: AO0yUKXRiPA3J2OI1Z2UA26gzgkuyohht0IoWPLwCXnEAhyBGEEY+cAl
 1euRvcsst83zETJmiB+6Pxvh9u9lQA/S91b6x9DMO8N18mCheA==
X-Google-Smtp-Source: AK7set+GZs+l6vRPCIUtIjY/Z8/LmRy87nb7XW7L8lReDHQ6btD7711xG4FsBJ0qPHx79uWvxx1Rckjmd/EaN0FWMGc=
X-Received: by 2002:a05:6a00:1631:b0:5a9:ce98:f621 with SMTP id
 e17-20020a056a00163100b005a9ce98f621mr212295pfc.1.1676900293659; Mon, 20 Feb
 2023 05:38:13 -0800 (PST)
MIME-Version: 1.0
References: <20230216171123.2518285-1-peter.maydell@linaro.org>
In-Reply-To: <20230216171123.2518285-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 13:38:02 +0000
Message-ID: <CAFEAcA81BG-pzsrMaKJhp54fxtRyJenfkkvXguqdykUP=JG5xg@mail.gmail.com>
Subject: Re: [PULL 00/30] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 16 Feb 2023 at 17:11, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> The following changes since commit 003ba52a8b327180e284630b289c6ece5a3e08b9:
>
>   Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-02-16 11:16:39 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230216
>
> for you to fetch changes up to caf01d6a435d9f4a95aeae2f9fc6cb8b889b1fb8:
>
>   tests/qtest: Restrict tpm-tis-devices-{swtpm}-test to CONFIG_TCG (2023-02-16 16:28:53 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * Some mostly M-profile-related code cleanups
>  * avocado: Retire the boot_linux.py AArch64 TCG tests
>  * hw/arm/smmuv3: Add GBPA register
>  * arm/virt: don't try to spell out the accelerator
>  * hw/arm: Attach PSPI module to NPCM7XX SoC
>  * Some cleanup/refactoring patches aiming towards
>    allowing building Arm targets without CONFIG_TCG
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

