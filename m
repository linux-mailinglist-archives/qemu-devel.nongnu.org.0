Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBA057A402
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 18:15:11 +0200 (CEST)
Received: from localhost ([::1]:41124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDpsM-0001Ck-Ux
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 12:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDpqG-0006t7-9R
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 12:13:00 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:44837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDpqB-00039I-EC
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 12:13:00 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-31d7db3e6e5so146110827b3.11
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 09:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ygO7Z2Cp6G2ZKGAwQPkF8C0URkqVTmfo3bNa9wEh/SY=;
 b=ZfFUWNigo/Uos4GwCei3rJrFVwFBnpCM5KkFSIxWC+WaJbiLP51dSO8T0L/TPNKU6n
 nay3hzLQK34Ptj+TaAzQ1//yJ+snxdi1VYySvsNAKNzawYMBHf9yU0WDAo0iq0zQ2Gb4
 vty8QI2NIguhyCnP4SqXvqrFWAR6UreCC2bcU8xoOgkX4EPp2n0pfCpEF4H4h/SeaH0G
 BEXj/WR7gBQobrkCuyGTXQK4z0MjiTaqOyBIqQNcOGALQeYkG7Wy0tNW4sbRvO8mwCs/
 oaBY7JpRljSg3vfc4YJHJicjYO4m17V0cMw3ouU1y4WHPU7mcuSgsRfXKp7C4+S+sHO0
 F0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ygO7Z2Cp6G2ZKGAwQPkF8C0URkqVTmfo3bNa9wEh/SY=;
 b=tx5L27Pa4G7DUogv+7l3wERVbayaguKZQpFcI1LkF6+OKZlu8PMdTlsYq/mjXSPqwi
 KFkTxrl/slqmePv0guBrQptj6P12ESQjFFg5dLa5nDAK/5C5YQKwrAzpVUYqemeO/n5/
 BdLJQxHGxxiaWWcQ6Q/Qe4SPJw+sDujTuNK7WvsO0mphxBdEW309ugAzuCaw6yUU11RO
 Xw1KMXuCE+PW2D6zHCBAnPybNtUc3xQs48R0jyr4qNiXnJPzmZW1dr4Uxdv7J1upbj1H
 LH6+Yc7KfIuACkbzSNbOLHLcIQFDkGr7KOCPjc5XR8rg84FgiWBJSmcSeBMakn3q8REJ
 TG1A==
X-Gm-Message-State: AJIora9PRQjkn5H/CECQuYTK91ju0CHTFULPySeVFJDrfQ1YAhf9pe2q
 1uA6rxOgXFDFcOaMsg1ug7/5mqdcHy5WNllshW7l+A==
X-Google-Smtp-Source: AGRyM1spgs65HB3emtlF+3pw8X4j+76TPvB1cNetu20hqMVBNshAQYcDqrVS1I8Uby+SDUPKTMSjLzyQPqTJ7b3VEmg=
X-Received: by 2002:a0d:eb83:0:b0:31c:8741:a033 with SMTP id
 u125-20020a0deb83000000b0031c8741a033mr37444892ywe.455.1658247174180; Tue, 19
 Jul 2022 09:12:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210904213506.486886-1-mst@redhat.com>
 <20210904213506.486886-7-mst@redhat.com>
In-Reply-To: <20210904213506.486886-7-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jul 2022 17:12:43 +0100
Message-ID: <CAFEAcA9WBo2Kn9BPz1y2JCxpBGnBWDOtgLFiu31V4PL2m6b7bQ@mail.gmail.com>
Subject: Re: [PULL 06/35] hw/acpi: refactor acpi hp modules so that targets
 can just use what they need
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Sat, 4 Sept 2021 at 22:36, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> From: Ani Sinha <ani@anisinha.ca>
>
> Currently various acpi hotplug modules like cpu hotplug, memory hotplug, pci
> hotplug, nvdimm hotplug are all pulled in when CONFIG_ACPI_X86 is turned on.
> This brings in support for whole lot of subsystems that some targets like
> mips does not need. They are added just to satisfy symbol dependencies. This
> is ugly and should be avoided. Targets should be able to pull in just what they
> need and no more. For example, mips only needs support for PIIX4 and does not
> need acpi pci hotplug support or cpu hotplug support or memory hotplug support
> etc. This change is an effort to clean this up.
> In this change, new config variables are added for various acpi hotplug
> subsystems. Targets like mips can only enable PIIX4 support and not the rest
> of all the other modules which were being previously pulled in as a part of
> CONFIG_ACPI_X86. Function stubs make sure that symbols which piix4 needs but
> are not required by mips (for example, symbols specific to pci hotplug etc)
> are available to satisfy the dependencies.
>
> Currently, this change only addresses issues with mips malta targets. In future
> we might be able to clean up other targets which are similarly pulling in lot
> of unnecessary hotplug modules by enabling ACPI_X86.
>
> This change should also address issues such as the following:
> https://gitlab.com/qemu-project/qemu/-/issues/221
> https://gitlab.com/qemu-project/qemu/-/issues/193
>
> Signed-off-by: Ani Sinha <ani@anisinha.ca>
> Message-Id: <20210812071409.492299-1-ani@anisinha.ca>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>

Hi; I'm trying to track down the fix for a bug that I think
was introduced by this change. Specifically, if you
configure with a target list of
 '--target-list=mips-linux-user,mips64-linux-user,mipsel-linux-user,mipsn32-linux-user,mipsn32el-linux-user,mips-softmmu,mipsel-softmmu,mips64-softmmu,mips64el-softmmu'

(ie "just mips"), then run 'make check', the iotest 267 fails
because QEMU segfaults trying to do a VM save/restore on
qemu-system-mips. (You can run just that iotest by cd'ing
into the build dir's tests/qemu-iotests/ subdir and running
  ./check -qcow2 -gdb 267
if you like).

This is because hw/acpi/piix4.c (used by the MIPS malta board)
has a vmstate that includes use of the VMSTATE_PCI_HOTPLUG()
macro. This macro uses the vmstate_acpi_pcihp_pci_status
vmstate struct. If the MIPS target is built along with some
other targets which require CONFIG_ACPI_PCIHP then we correctly
get the real definition of that vmstate struct from pcihp.c.
However, if we are only building the MIPS targets then
CONFIG_ACPI_PCIHP is false, and we get the dummy definition
of the struct from acpi-pci-hotplug-stub.c. The dummy definition
obviously doesn't actually work for migrating anything, and
in fact the migration code ends up segfaulting because
the 'name' field in the struct is NULL. (MIPS builds and
uses hw/acpi/piix4.c because
configs/devices/mips-softmmu/common.mak sets CONFIG_ACPI_PIIX4=y,
and it needs this because piix4_init() unconditionally
creates a TYPE_PIIX4_PM device. It's possible this is a bug
revealed/introduced by the recent piix4 refactoring, but I
had a look at the code at the time this change was committed
and afaict back then it also created the PIIX4_PM device,
just in a different place. Indeed it is this commit which adds
the CONFIG_ACPI_PIIX4=y to the config!)

How is this intended to work? The obvious fix from my point
of view would just be to say "piix4.c requires pcihp.c"
and cause CONFIG_ACPI_PIIX4 to pull in CONFIG_ACPI_PCIHP,
but that seems like it would be rather undoing the point
of this change. But if Malta requires ACPI_PIIX4 and it
creates the PIIX4_PM device, it needs the real pcihp.c and
not the stubs, doesn't it ?

thanks
-- PMM

