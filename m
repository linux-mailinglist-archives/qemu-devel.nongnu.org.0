Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D1268D3CF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 11:13:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPKxg-0006ca-SN; Tue, 07 Feb 2023 05:12:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pPKxS-0006Ch-OG
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:12:16 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1pPKxQ-0003oz-9m
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 05:12:14 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 hv11-20020a17090ae40b00b002307b580d7eso10613582pjb.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 02:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qCC/6ycsZZB3tzhI/SogW4IH9/TPK6tsBxHCQ7Wvksg=;
 b=P0270ZMXDYfxBf9ngr82xuv7XCHpSfaPh+7ZQSsfLAUGqtGVxi0zCRkf3zoSGSZfoX
 SCy5hXOcj4tPGpaP+Jt3JqQNjij5ct2YN0Rs1LzFasYeUVUlOqshNR63yyOB1XeW9jpY
 PqdzMWdOSipDUFu3kBS0FreC7zfc5SMTD5aTb3XZKo95yZWrlIJRcipwlXp//MDyVfqr
 MJ7KAv5FMvhm7okuNVCneWu07HI5nlnK3nk+DgUE3M0dOGDHHBpH1N/nCiYrRidGRTiq
 pb1UFArNhpwtbdGQSvgE6rH5SkQsmSDXU+o2UGsMEO7RCc4EuHGik1h6QRX6+28AtU8Q
 T1kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qCC/6ycsZZB3tzhI/SogW4IH9/TPK6tsBxHCQ7Wvksg=;
 b=S9Yx8xkBQ1dX3CXflg14qvULt9eRy7s08MU2j2ZDFnheaEejm+xWtzhna/Ck7tm7Yl
 eK7MKjQgnDy5eGGnOW/0M1rW8+TLsrhO3TL2rlA/XrLtZ3Qt06UJqXCo8HLDkBm4xLUU
 GN++mmETg4IcUlxS2tX5TQFOLQNB3RWb8aLM/U5grp6x+2hOyromTbAwzT99bYi5oHo6
 jPWi2DXJrwuyVGBiyVb2S5DDvleetbQpJqHnVq1tm1xcu0ed3YGmw5KxuDuvEpuYdxH1
 PdZ3LZtCQRbhcEzUEFxbRPb2vKlInyrtMSbKHc950HBVspXgG8Q80HxtjDy0fcP9n2jW
 FhhQ==
X-Gm-Message-State: AO0yUKXN6QxiNdgee/IMila5GUGNe7edvCtop8WdYoFx4QOOjLznmMKf
 P5xZ4Sex7ze+44SVhiUWwJG54g==
X-Google-Smtp-Source: AK7set8XeNXaL3EFUz54Tf3nC/GHOLaSMlvKyCoxzqYPtRhlsXiJnafC53oxfVmTc1c9FlO+0xp1iw==
X-Received: by 2002:a17:90a:f2d4:b0:230:d3a1:ba03 with SMTP id
 gt20-20020a17090af2d400b00230d3a1ba03mr3329559pjb.43.1675764730363; 
 Tue, 07 Feb 2023 02:12:10 -0800 (PST)
Received: from sunil-laptop ([49.206.14.226]) by smtp.gmail.com with ESMTPSA id
 z19-20020a17090ad79300b00230da56ddecsm1685727pju.27.2023.02.07.02.12.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 02:12:10 -0800 (PST)
Date: Tue, 7 Feb 2023 15:42:01 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Andrea Bolognani <abologna@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>,
 Atish Kumar Patra <atishp@rivosinc.com>,
 Ani Sinha <ani@anisinha.ca>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH 02/10] hw/riscv/virt: Add a switch to enable/disable ACPI
Message-ID: <Y+Ij8ey7NduVgiQY@sunil-laptop>
References: <20230202045223.2594627-1-sunilvl@ventanamicro.com>
 <20230202045223.2594627-3-sunilvl@ventanamicro.com>
 <CABJz62PFGT1H-AArbfTkpiX24mHU=q3wk7h-bpduZhJyy7tTLw@mail.gmail.com>
 <fe3b5794-be2a-eec7-9d4e-9a13eab48378@linaro.org>
 <20230206125610.nmo2bbbd5kosihav@sirius.home.kraxel.org>
 <25504aa3-20e3-d7e6-4111-c956370949ba@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25504aa3-20e3-d7e6-4111-c956370949ba@linaro.org>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Feb 07, 2023 at 09:50:29AM +0100, Philippe Mathieu-Daudé wrote:
> On 6/2/23 13:56, Gerd Hoffmann wrote:
> > On Mon, Feb 06, 2023 at 12:18:06PM +0100, Philippe Mathieu-Daudé wrote:
> > > On 6/2/23 11:54, Andrea Bolognani wrote:
> > > > On Thu, Feb 02, 2023 at 10:22:15AM +0530, Sunil V L wrote:
> > > > > +    object_class_property_add(oc, "acpi", "OnOffAuto",
> > > > > +                              virt_get_acpi, virt_set_acpi,
> > > > > +                              NULL, NULL);
> > > > > +    object_class_property_set_description(oc, "acpi",
> > > > > +                                          "Enable ACPI");
> > > > 
> > > > The way this works on other architectures (x86_64, aarch64) is that
> > > > you get ACPI by default and can use -no-acpi to disable it if
> > > > desired. Can we have the same on RISC-V, for consistency?
> > > 
> > > -no-acpi rather seems a x86-specific hack for the ISA PC machine, and
> > > has a high maintenance cost / burden.
> > 
> > Under the hood it is actually a OnOffAuto machine property and -no-acpi
> > is just a shortcut to set that.
> > 
> > > Actually, what is the value added by '-no-acpi'?
> > 
> > On arm(64) the linux kernel can use either device trees or ACPI to find
> > the hardware.  Historical reasons mostly, when the platform started
> > there was no ACPI support.  Also the edk2 firmware uses Device Trees
> > for hardware discovery, likewise for historical reasons.
> > 
> > When ACPI is available for a platform right from the start I see little
> > reason to offer an option to turn it off though ...
> 
> Yeah I concur. There is no point in disabling ACPI on the RISCV virt
> machine IMO.

Thank you all for the inputs. I am fine to keep it enabled by default.
Do you mean we don't need the switch at all even for some
testing/debugging purpose?

Thanks,
Sunil

