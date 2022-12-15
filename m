Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FDC64E359
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 22:40:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5vxG-0003QR-85; Thu, 15 Dec 2022 16:39:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5vxF-0003QG-3W
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 16:39:49 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5vxD-00030G-B8
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 16:39:48 -0500
Received: by mail-pl1-x62b.google.com with SMTP id g10so328330plo.11
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 13:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vr/IbkaFnr0/TiACVGX0wRmH8Q+otBZWCHQ2Qjgq92k=;
 b=AzEr2JzRomiAwPQdrpv9fYp2u1a3O8Wixm9+wuJWWXdo/dXbl7QlQxC08PuOQUwlHh
 iymD0BEosiYUd3RjcfCWZMzusoVLtDo7V1le2R0bT/LDmwq1pUHMUZOl9XG8N4y70FKT
 vM4QOPONAGy0YUnDYlqh46xo/JKSfxqm4mqDKBDLl7a6Nc9EbzRkb+bJEJX2OuqF4HbO
 KpfNucaVPulpb2oLNvK8IegdJHSho3xT6dLmz3t/3evKu5wFp6YIhK/DLKKzsscmen2y
 ZfOnCGgVEXk7BUHUEEyrOBkQQ/EK5FRKDzS8oZbpczvZ1aCZOQUgwJITg/9hJGnNjXg4
 0uiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vr/IbkaFnr0/TiACVGX0wRmH8Q+otBZWCHQ2Qjgq92k=;
 b=bsTZ0SJL5UyCeyvT56Zso7DcHc2LDG37Wqz9kdqfiq2xc/h+kYbm2T9x/ODTUhK2Ac
 prWp62hbtUntq+cJ9osdbBF51wK55O4XuXVeFFKVeskVUTe8lA7MQNAH0jpw90sPPJVc
 lNK+59oz9kv/dclUXxzBiqZNNUbBcu43rsKKD8WbpDIGbk4C9jHDxwVwrhwJ7J4pLGkG
 EQMavQJkyz1MJGNvtixHoWfm3DvOggNVzR9t341JYDnZ7xUqKoMrFBU8xoysZoZs43Qz
 5DA1IjLH9W7rknS0ZBISqRH6vra1YhPoAdpqu8GOmCXTYl0RPl8w9KdGgevqcRCjFRcP
 Dpkg==
X-Gm-Message-State: ANoB5pmpwhZ9GNBkLTI+OYcqYPHRNAE5Ke7ve8rmQNfVN8QPId5Xk5F1
 oAnZAyGL7RRXUWreyahH3ZMaeKkS2X4hq2t3BQhQp/VcVZSSrw==
X-Google-Smtp-Source: AA0mqf6acEdjLQM9QHeM5oCGtxB46QWfHIKVaH1LCe5YageLKz7R7x5JQIFhirewcP0K5EKrKdegGq3CMIa7zL4KriE=
X-Received: by 2002:a17:903:2053:b0:189:cdc8:7261 with SMTP id
 q19-20020a170903205300b00189cdc87261mr23518461pla.168.1671140385305; Thu, 15
 Dec 2022 13:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20221215174013.1003508-1-peter.maydell@linaro.org>
In-Reply-To: <20221215174013.1003508-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Dec 2022 21:39:34 +0000
Message-ID: <CAFEAcA-YL5jrieAKUbZZJge1iB2On1B=5g+diMYTdE=KpmBRcw@mail.gmail.com>
Subject: Re: [PULL v2 00/28] target-arm queue
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62b.google.com
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

On Thu, 15 Dec 2022 at 17:40, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> drop the sysregs patch as the tcg sysregs test fails
> (probably a bug in the test)
>
> -- PMM
>
> The following changes since commit ae2b87341b5ddb0dcb1b3f2d4f586ef18de75873:
>
>   Merge tag 'pull-qapi-2022-12-14-v2' of https://repo.or.cz/qemu/armbru into staging (2022-12-14 22:42:14 +0000)
>
> are available in the Git repository at:
>
>   https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20221215-1
>
> for you to fetch changes up to 9e406eea309bbe44c7fb17f6af112d2b756854ad:
>
>   target/arm: Restrict arm_cpu_exec_interrupt() to TCG accelerator (2022-12-15 17:37:48 +0000)
>
> ----------------------------------------------------------------
> target-arm queue:
>  * hw/arm/virt: Add properties to allow more granular
>    configuration of use of highmem space
>  * target/arm: Add Cortex-A55 CPU
>  * hw/intc/arm_gicv3: Fix GICD_TYPER ITLinesNumber advertisement
>  * Implement FEAT_EVT
>  * Some 3-phase-reset conversions for Arm GIC, SMMU
>  * hw/arm/boot: set initrd with #address-cells type in fdt
>  * hw/misc: Move some arm-related files from specific_ss into softmmu_ss
>  * Restrict arm_cpu_exec_interrupt() to TCG accelerator


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

