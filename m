Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C415BB0D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Jul 2019 13:57:17 +0200 (CEST)
Received: from localhost ([::1]:57560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hhuvr-0005LE-PY
	for lists+qemu-devel@lfdr.de; Mon, 01 Jul 2019 07:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50759)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhuuv-0004jo-T8
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 07:56:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhuuu-0003Wp-RQ
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 07:56:17 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34283)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhuuu-0003Vf-Km
 for qemu-devel@nongnu.org; Mon, 01 Jul 2019 07:56:16 -0400
Received: by mail-ot1-x344.google.com with SMTP id n5so13200239otk.1
 for <qemu-devel@nongnu.org>; Mon, 01 Jul 2019 04:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D5nEZI+hxb+H44y17IXUNqKuOh3W4xbgrH7vKYCJ5qs=;
 b=c8XZ50VqDWVZ5XOskKo3UJkr0SIUt+zFAj7uQBVRamDXZkXIN5dzsFPxeVTox9wBkG
 kjMM/dSrh7ih071+uzrB6IqBTDXOTeMQr+odGUVgudX6vEYd/lWdhVoh/BKq3Cv7o+CI
 YnHmRxWBMO5YW8/pKmruNmKoFfjg5hRCfADhfKZXJrPMbtkwyMyJIrY1bUHny/j8nw9s
 HNsHR8g2JR1iJCkvQ+nRA4mjcEyWlemqDVi6lFGwn3NL3mqHXqBiqTOxcGMZyqwBZEIF
 Qb6LJECD5l3aIaRbMjx1LHFMQu4vzW7HSqk2540ViputxGnZsqQ4rc284zV0NvgS3UBE
 m7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D5nEZI+hxb+H44y17IXUNqKuOh3W4xbgrH7vKYCJ5qs=;
 b=e9INaf7iRKIYrTGyiOsx0tbp4pJZc9LaxGiPqOsS+CeaA+xIgnUfQsH66bopAIXU+7
 MqQclbvLoddinyVKyVe34hZGz1NaM6NZ8wz3goBtuu8pXiLBlztM6QMbhPRutO0XijOP
 CjDc4ENBIgGDrJ/djsYFU086n1Pyrqx4XjTPqn75gHrrQmY2poaW/OGAEqD7sOv2yuXL
 m6F8MbHEb7b6A3NKbWUuMMQkRRM25NKcV/8oAFqLQN6ENBDmpggxh7NdNSXDlRsO9ngj
 dX4fublci84UWAWGtiPcBAw17xShjjngEdl47bdISg7K3QL8S7/XZUSNZLtL1+0ByVHL
 Jz2Q==
X-Gm-Message-State: APjAAAWX6xVjlRbAdS6naHIR83vUpDKzigU1o/QwcDsDIbkfVUlXvdpc
 EMURQhxRQW3Df/lRQjveyVLtlyH53ksIE+cNDvZiNA==
X-Google-Smtp-Source: APXvYqx7kmXUpfXmk+jkd3J3hXZ4cXElfV/6Swtewouur+Wu/brJ4GB1cT7KFDjHi/+SIdN+1I2u7cbuKoJfPTiuXeg=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr19975476oti.91.1561982175236; 
 Mon, 01 Jul 2019 04:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190416013902.4941-1-andrew.smirnov@gmail.com>
 <20190416013902.4941-4-andrew.smirnov@gmail.com>
In-Reply-To: <20190416013902.4941-4-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 12:56:04 +0100
Message-ID: <CAFEAcA_=HpkXDriPRvnKRA=XKaK0Vpi8isZH5B8eETVVAr6=mw@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH 3/5] pci: designware: Update MSI mapping
 unconditionally
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Apr 2019 at 02:39, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>
> Expression to calculate update_msi_mapping in code handling writes to
> DESIGNWARE_PCIE_MSI_INTR0_ENABLE is missing an ! operator and should
> be:
>
>     !!root->msi.intr[0].enable ^ !!val;
>
> so that MSI mapping is updated when enabled transitions from either
> "none" -> "any" or "any" -> "none". Since that register shouldn't be
> written to very often, change the code to update MSI mapping
> unconditionally instead of trying to fix the update_msi_mapping logic.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

