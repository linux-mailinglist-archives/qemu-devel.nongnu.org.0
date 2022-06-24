Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F44559CF9
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jun 2022 17:06:19 +0200 (CEST)
Received: from localhost ([::1]:44378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4kt0-0003dp-LA
	for lists+qemu-devel@lfdr.de; Fri, 24 Jun 2022 11:06:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kpD-0007YG-Rs
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:02:23 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:41906)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o4kpC-0002OY-7y
 for qemu-devel@nongnu.org; Fri, 24 Jun 2022 11:02:23 -0400
Received: by mail-yb1-xb29.google.com with SMTP id 23so4933765ybe.8
 for <qemu-devel@nongnu.org>; Fri, 24 Jun 2022 08:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EnYWT6+eru3uHPWApb4vpG/T5apsG8TSW4cZmehz1lw=;
 b=zq7QZtDLmFXHZztoUKje/w4bFHHUIrWSc+EfGMYwAsFnl94+nuNoEQtNLEwY9Utw2w
 XXlgeWTqV4VMtIEmbW2CQR22pTCLVggk1Cv4M2swje8tO3XyslNXhF9lkSfls1aH91vE
 lUldpVSJyfvzAPqlakH7K6aa3dkNP4Y3Z5OfRaloT4Rf2Z/fAT4EuXhgzD8drzW8jIui
 dS+whmMIYPOloBJV86hpTHDS0Vj/ImCxuJGnN+5JSw7HIJ6QxhIwj6ZM2FozegAZVkoj
 1Ej1zI2qRvyaz/uh/2rMK9RGC3pgcofibN/k/HtkE8jg+mQR5hwjTDPgGLiSK1yVRAY2
 Narg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EnYWT6+eru3uHPWApb4vpG/T5apsG8TSW4cZmehz1lw=;
 b=U54WVoxgzT6dlX0oJVdBk73RRClGj7WQQocTnwHatiiJD6Sb/U0gf95KvwTxRb0FqV
 LfIS6vYgKUpSp6NY/Z+j0aYypepvOP8mbyPM66efFkPVjG2ohgv7Db1GjQln7+sV6Fkz
 hEJYZN+rue2uZjCELjkwUFUMp79Ozf7uTzblSd/uBNjc394hvyebpmkXsXjOzGx6AgIX
 R/kwYO3IvR04mrNo98s6aWFYu/DChxIJE/9o626OlSb8M+V9oo96tHhBYyKVPvtS6FBn
 6YFWaUHczESlO3RPndut4oZQuvIC+PUdAzNFk/N7Rwq1cLa2UPX1NduRVk6nRGVPIXJZ
 JViw==
X-Gm-Message-State: AJIora8ieE+3+N2lcr7OxfegmoLSIf+/tXfOXQroY/eWt2YwjHd0ZfWV
 nv+I9OEFmGI+oRCYAz7u7Mri22KAp5Xips6cY1LrhA==
X-Google-Smtp-Source: AGRyM1uMXPWDr04izJp2BwkDssX+25tzbf0qMTakadA3kQlppmVhNAe/FMBviiZzY01JVp7a7VLvfBEFR7iSRsB3KFE=
X-Received: by 2002:a25:d655:0:b0:66c:84b7:df40 with SMTP id
 n82-20020a25d655000000b0066c84b7df40mr19510ybg.193.1656082940786; Fri, 24 Jun
 2022 08:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
 <20220616141950.23374-2-Jonathan.Cameron@huawei.com>
 <CAFEAcA8U9oNDStfLpxOwodGm9MCTdLrt-WV+x_-rTGw9UpBGvA@mail.gmail.com>
 <20220624133909.00005f6e@Huawei.com>
 <CAFEAcA8GA+ZXr2eS9bVxnhZRtda17Wx0Ud8CfcA90T6yiaecew@mail.gmail.com>
 <20220624150844.000005ec@Huawei.com> <20220624155436.000047cb@Huawei.com>
In-Reply-To: <20220624155436.000047cb@Huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jun 2022 16:01:42 +0100
Message-ID: <CAFEAcA8MLTm9XwAV_JU_EPiT9wfaZed8B19-pL=HobKepJsnkg@mail.gmail.com>
Subject: Re: [PATCH v11 1/2] hw/arm/virt: Basic CXL enablement on
 pci_expander_bridge instances pxb-cxl
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, qemu-arm@nongnu.org, 
 "Michael S . Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, linux-cxl@vger.kernel.org,
 linuxarm@huawei.com, 
 Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Adam Manzanares <a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, 
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, 
 Dan Williams <dan.j.williams@intel.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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

On Fri, 24 Jun 2022 at 15:54, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
> Just occurred to me there is another barrier to an approach that adds
> DT bindings.
> I fairly sure hw/pci-bridge/pci_expander_bridge.c (PXB)
> only works on ACPI platforms and is the only host bridge supported
> for CXL emulation in QEMU.

Isn't it probeable like any other PCI device/bridge ?

-- PMM

