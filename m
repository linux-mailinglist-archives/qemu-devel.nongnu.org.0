Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 210813F894B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 15:45:58 +0200 (CEST)
Received: from localhost ([::1]:39942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJFhd-0006FB-6g
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 09:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFK8-0005I6-Dd
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:21:40 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:35811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJFK6-0007sc-U0
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 09:21:40 -0400
Received: by mail-ed1-x532.google.com with SMTP id q17so4677272edv.2
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 06:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QIkmguGk5Ur8kPzbCJ2653Kcvq5uHWpeziEE5g5qXDw=;
 b=b+0lDQgFoImsjgR7i/mXhZ5R1kffCi3MGAfa8leySHHm/SueR0YgfWLY1BxogP/8KE
 OcpQWSG3ADJTVu4793Qg6ipBUb1qxYaIzp12MC8td+XDRTFbjpSPCRSlNw0xDrnKC65I
 t2DBp17EP4ha3S2Z94dwR8Sjj4efbeSxoYUKD3CkCu1wJ/1QwGJvbM9out2KatLcR72W
 HCDGgjBcAChX8+3gI3kl7HgP4XJ0A1zL5CBllV9SYkKPeq/Nr6iloPbz0B78XJR0bQt1
 jdii/adWkMCeiY5VtqhYm3esY3rzwDAvlGvgdy/Bbh8WeONzfM3xG/I89WfCKMuwD5ZL
 Pcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QIkmguGk5Ur8kPzbCJ2653Kcvq5uHWpeziEE5g5qXDw=;
 b=cDQ8klDoohmackC9D05nvHP9P5zumaBFaYxQ4nySraNdnkTRw4AzpHBNk7ZSMKNblY
 Y0MD0Emy9i9snGRMrq7X2C7OuJMQGZFEj0iXPuLT2ZUmZVP95cGtdJ18dKhR4wpE8Hlf
 lsERSQFIrplrz/l2i1ywPSiGB9Nfqc1Xy9VA77iozSLr793H4t7ljKd2wZUa5vYWrGP4
 aN8kK87SVzrCwkfV7NdoUxtM2xzvh/K9tc4N9b/9JQA9jMPh2Fb4pgeZ43c9+QlKgKHj
 L8uoieM/CR03qyDWWA8Zvn7uhuVdprZlRyToHGEl/3Sc84bVMyxR52gQh85lOKmDa/1U
 1qPQ==
X-Gm-Message-State: AOAM532SBA6dFkNWuT7aJL9ZfElvBckhIiHbzkUtUq2EJ1iKXxVZUwwJ
 uAEK4t/vKvUjPGbYbn/6nKDOsb6tSzd5A1BcBc6ifw==
X-Google-Smtp-Source: ABdhPJxpXKPVY+ZYakVGjt52buznFD3O/otCjXAbgdu9PAUMHxmUrVuHhiAEyHGJ36CT9JvNvlGWiifvsSP/gxKLbuc=
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr4184326edw.44.1629984097322;
 Thu, 26 Aug 2021 06:21:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210819162637.518507-1-ani@anisinha.ca>
In-Reply-To: <20210819162637.518507-1-ani@anisinha.ca>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Aug 2021 14:20:49 +0100
Message-ID: <CAFEAcA_oAkE5UV+KASVj5xo4BR_t6hdtfxj1Z1wJfUCsytd5Tw@mail.gmail.com>
Subject: Re: [PATCH v3] hw/arm/Kconfig: no need to enable
 ACPI_MEMORY_HOTPLUG/ACPI_NVDIMM explicitly
To: Ani Sinha <ani@anisinha.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Aug 2021 at 17:26, Ani Sinha <ani@anisinha.ca> wrote:
>
> Since commit
> 36b79e3219d ("hw/acpi/Kconfig: Add missing Kconfig dependencies (build er=
ror)"),
> ACPI_MEMORY_HOTPLUG and ACPI_NVDIMM is implicitly turned on when
> ACPI_HW_REDUCED is selected. ACPI_HW_REDUCED is already enabled. No need =
to
> turn on ACPI_MEMORY_HOTPLUG or ACPI_NVDIMM explicitly. This is a minor cl=
eanup.
>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>



Applied to target-arm.next, thanks.

-- PMM

