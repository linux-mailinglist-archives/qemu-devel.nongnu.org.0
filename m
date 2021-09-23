Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C3E4164C9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 20:04:05 +0200 (CEST)
Received: from localhost ([::1]:36904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTT4m-0003gq-9M
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 14:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTT2p-00024D-3R
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:02:03 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:41612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTT2m-0006rl-T6
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 14:02:02 -0400
Received: by mail-wr1-x431.google.com with SMTP id w29so19554808wra.8
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 11:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=jnTMMNP4hj6i9aPcbQq5BuDoIQdtJWnZq6IAKaux8u0=;
 b=f0ZQ1J6Gvcgwj4fUXNwfi6iG5hW/ZwTWSA09lntzaTytS0cDbYiQXqnNPjwIU2rRI3
 vothpXUaQq8b1geld6PDl+V5Gviv2KGoRKcuOXkB0ZwnwJxIs52EBsAUn5Krz3pmf26l
 tB67smwlGNIBJ2ZGjkMePGSpXYu//Ii/bRcrkKlp2HZaBnsVilvjKOsHs4HHo7m+nTQp
 tZpNTLh/nCv23mYdIGsdKrNVZRu1LlcVLI3Y1rxi8XBQJAJgDos1WQLafWTO5Ljm6vNY
 KVcCx6Z21JeC90zsWpJORfT4G90y46LlWkDJCW/ai2kXeFnWDSED0E2CyAOo1SB/qGlM
 V3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=jnTMMNP4hj6i9aPcbQq5BuDoIQdtJWnZq6IAKaux8u0=;
 b=IBVu1KLal+N8N8KgH4Gvg9PgFHrIaKogtDUyepoBUjDQqfrW1pXQPyksn47kp22nlw
 o+DRwHk2Thk4bJFSGWsDgZE4nOW+tSyCmTkkfq9EuffLWO5W16VJtgQ3rv3chC66tsvH
 hNYjK/1nKa6NgZzGDbX5zJ72vnfxHC+CSnLIZUXyvE4kNAaNXMqKumlQtJtyxIIfvMlE
 Sp0P8IYnk5wdVFvC9w+hL8Mc0ELE2QqYemSHoF1bH63OB+f5HCdgW8/qybatM2D8KV1j
 3cD5wygpxn9Xl/S/qhp3JQ9pqGfmSWFf83f/zbm3Jqpai8Hip5Bz3hQiG0O3YNWp4Ghx
 Rs2g==
X-Gm-Message-State: AOAM530aCu2J83k/iXD9qXA+arvX6FC0XOkm69H8b7lClioe4Z0o1Wlb
 XWymT/LZyWR2WIcp9IfGinLbPfhyObcpZWOPKml51g==
X-Google-Smtp-Source: ABdhPJyR8aclb5yfa1F7wIbvu63H06OB1LTIJ6J4nQg9qz0e/WIM38oDmGlYrKay7I7XYULlEHFCObS/mu9le3AX430=
X-Received: by 2002:a7b:c194:: with SMTP id y20mr17554344wmi.37.1632420118915; 
 Thu, 23 Sep 2021 11:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210920214447.2998623-1-f4bug@amsat.org>
 <20210920214447.2998623-2-f4bug@amsat.org>
 <CAFEAcA_UfuKjXamxH-Y-4rs2mu+JM=7p8tGc2QixzPzDqZxcWg@mail.gmail.com>
 <90d882ac-968e-26f0-e5a4-8a2a401119cc@amsat.org>
 <45484122-fbea-434d-2edf-70a587b39cc3@amsat.org>
In-Reply-To: <45484122-fbea-434d-2edf-70a587b39cc3@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Sep 2021 19:01:06 +0100
Message-ID: <CAFEAcA-6ctOA4ZzUh8Y==bpN47Wco1QMoroV6_7t52nyj8BwVA@mail.gmail.com>
Subject: Re: [PATCH v5 01/31] target/arm: Implement arm_v7m_cpu_has_work()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Michael Davidsaver <mdavidsaver@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 23 Sept 2021 at 18:17, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
> Since we provide info->class_init as arm_v7m_class_init(), only
> tcg_ops and gdb_core_xml_file from CPUClass are set:
>
> static void arm_v7m_class_init(ObjectClass *oc, void *data)
> {
>      ARMCPUClass *acc =3D ARM_CPU_CLASS(oc);
>      CPUClass *cc =3D CPU_CLASS(oc);
>
>      acc->info =3D data;
> #ifdef CONFIG_TCG
>      cc->tcg_ops =3D &arm_v7m_tcg_ops;
> #endif /* CONFIG_TCG */
>
>      cc->gdb_core_xml_file =3D "arm-m-profile.xml";
> }

This class's parent type is TYPE_ARM_CPU; so TYPE_ARM_CPU's class_init
runs first and sets up most of the class fields. This function only
needs to set the ones which must be different on a M-profile core.

-- PMM

