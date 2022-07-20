Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7B057BDF1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 20:41:35 +0200 (CEST)
Received: from localhost ([::1]:49768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEEdZ-0000sH-U7
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 14:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oEEZa-0005Wo-0o
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 14:37:26 -0400
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834]:33709)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oEEZX-0004A1-Qi
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 14:37:25 -0400
Received: by mail-qt1-x834.google.com with SMTP id u12so1776972qtk.0
 for <qemu-devel@nongnu.org>; Wed, 20 Jul 2022 11:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=HpGbQenVF85YLrUt934ZKRCS+O8BI83qBygfa5/Jdtw=;
 b=jJebrS2msqLvgJZCW2LrfJ6RK/szCR4is/GVf5oazJnU479F0rta09awECcJm2xMbz
 A+VoRAmG0CO9yn02lwCNCqDQnyXwYdJajM3+7hpUr9zwZDhs1RQGSxDwhJsN5EFmKaoW
 GJsF5KAamWudFusENveI5B/2lWMarh05zf8NUEJB7XxeUN6s19m77cZGPDUtyx5jDaxp
 NCC/HKuI+9CfWuJBOpd0IPYUvipSe1L458NsZr3VJUvZJfjE4wSfPsrGui0VauB8yKBr
 Yod97x0aRlgErFYv7b8IL0SaoxFZDz31b5CBUwfhEAcP7G2dvA0T1ax7+/bCZu8FNFK9
 9XFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=HpGbQenVF85YLrUt934ZKRCS+O8BI83qBygfa5/Jdtw=;
 b=B7jK7J6Zek+goUa6bJ0UyrdUnuGkQm86NOmYqgzHWF8qBsjn8gaiM0kDKtW/xYYqry
 nloKS7HmyY7ucOgZHEEVEd7pM9TJMfpAUlPk1JLn7lTNv2ef2Wt4MnhdZSie7lrjca3i
 k8LxMJd3/DytIcedn9RzvaFGThs2VS49DmKrKriaGD2zfYbJ7h6urXYBBNpw8qYF0xy7
 7I9CndjMDueWmYibf8WNCiTQRm0lY8MIHaB3+hhzh4oVBaKO60H0XWzAsVkplryGrT33
 xjGQihEBnP9Yudb74ALZJM2tWpVybFQtY5pBK1j5V1gRgwUcSrgi2GVDdZpn0fA/pdL9
 ILVw==
X-Gm-Message-State: AJIora8HcPD1ZrEgHkFPYRcAnVWBVeDbA1TAQi9Lua+kaTvhSYF575oH
 ODg1iM9aIFHFrmNVdqg9NfC/0w==
X-Google-Smtp-Source: AGRyM1tYLTSiZBrbMMrmmpgixau5fqVhBaHtYAO7n5dJSnz60o4jCAZqMzycC3arnhUQO2xrfGE0sw==
X-Received: by 2002:a05:622a:1013:b0:31f:7b0:885d with SMTP id
 d19-20020a05622a101300b0031f07b0885dmr3377748qte.178.1658342242256; 
 Wed, 20 Jul 2022 11:37:22 -0700 (PDT)
Received: from snn377.eng.timetra.com ([208.184.70.254])
 by smtp.googlemail.com with ESMTPSA id
 g18-20020ac87752000000b0031ee01443b4sm9764406qtu.74.2022.07.20.11.37.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 11:37:21 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Wed, 20 Jul 2022 11:37:19 -0700 (PDT)
X-X-Sender: anisinha@anisinha-lenovo
To: Peter Maydell <peter.maydell@linaro.org>
cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org, 
 Ani Sinha <ani@anisinha.ca>, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 Aurelien Jarno <aurelien@aurel32.net>, 
 Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
 Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PULL 06/35] hw/acpi: refactor acpi hp modules so that targets
 can just use what they need
In-Reply-To: <CAFEAcA9WBo2Kn9BPz1y2JCxpBGnBWDOtgLFiu31V4PL2m6b7bQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207201132430.9370@anisinha-lenovo>
References: <20210904213506.486886-1-mst@redhat.com>
 <20210904213506.486886-7-mst@redhat.com>
 <CAFEAcA9WBo2Kn9BPz1y2JCxpBGnBWDOtgLFiu31V4PL2m6b7bQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::834;
 envelope-from=ani@anisinha.ca; helo=mail-qt1-x834.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



On Tue, 19 Jul 2022, Peter Maydell wrote:

> On Sat, 4 Sept 2021 at 22:36, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > From: Ani Sinha <ani@anisinha.ca>
> >
> > Currently various acpi hotplug modules like cpu hotplug, memory hotplug, pci
> > hotplug, nvdimm hotplug are all pulled in when CONFIG_ACPI_X86 is turned on.
> > This brings in support for whole lot of subsystems that some targets like
> > mips does not need. They are added just to satisfy symbol dependencies. This
> > is ugly and should be avoided. Targets should be able to pull in just what they
> > need and no more. For example, mips only needs support for PIIX4 and does not
> > need acpi pci hotplug support or cpu hotplug support or memory hotplug support
> > etc. This change is an effort to clean this up.
> > In this change, new config variables are added for various acpi hotplug
> > subsystems. Targets like mips can only enable PIIX4 support and not the rest
> > of all the other modules which were being previously pulled in as a part of
> > CONFIG_ACPI_X86. Function stubs make sure that symbols which piix4 needs but
> > are not required by mips (for example, symbols specific to pci hotplug etc)
> > are available to satisfy the dependencies.
> >
> > Currently, this change only addresses issues with mips malta targets. In future
> > we might be able to clean up other targets which are similarly pulling in lot
> > of unnecessary hotplug modules by enabling ACPI_X86.
> >
> > This change should also address issues such as the following:
> > https://gitlab.com/qemu-project/qemu/-/issues/221
> > https://gitlab.com/qemu-project/qemu/-/issues/193
> >
> > Signed-off-by: Ani Sinha <ani@anisinha.ca>
> > Message-Id: <20210812071409.492299-1-ani@anisinha.ca>
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>
> Hi; I'm trying to track down the fix for a bug that I think
> was introduced by this change. Specifically, if you
> configure with a target list of
>  '--target-list=mips-linux-user,mips64-linux-user,mipsel-linux-user,mipsn32-linux-user,mipsn32el-linux-user,mips-softmmu,mipsel-softmmu,mips64-softmmu,mips64el-softmmu'
>
> (ie "just mips"), then run 'make check', the iotest 267 fails
> because QEMU segfaults trying to do a VM save/restore on
> qemu-system-mips. (You can run just that iotest by cd'ing
> into the build dir's tests/qemu-iotests/ subdir and running
>   ./check -qcow2 -gdb 267
> if you like).
>
> This is because hw/acpi/piix4.c (used by the MIPS malta board)
> has a vmstate that includes use of the VMSTATE_PCI_HOTPLUG()
> macro. This macro uses the vmstate_acpi_pcihp_pci_status
> vmstate struct. If the MIPS target is built along with some
> other targets which require CONFIG_ACPI_PCIHP then we correctly
> get the real definition of that vmstate struct from pcihp.c.
> However, if we are only building the MIPS targets then
> CONFIG_ACPI_PCIHP is false, and we get the dummy definition
> of the struct from acpi-pci-hotplug-stub.c. The dummy definition
> obviously doesn't actually work for migrating anything, and
> in fact the migration code ends up segfaulting because
> the 'name' field in the struct is NULL. (MIPS builds and
> uses hw/acpi/piix4.c because
> configs/devices/mips-softmmu/common.mak sets CONFIG_ACPI_PIIX4=y,
> and it needs this because piix4_init() unconditionally
> creates a TYPE_PIIX4_PM device. It's possible this is a bug
> revealed/introduced by the recent piix4 refactoring, but I
> had a look at the code at the time this change was committed
> and afaict back then it also created the PIIX4_PM device,
> just in a different place. Indeed it is this commit which adds
> the CONFIG_ACPI_PIIX4=y to the config!)
>
> How is this intended to work? The obvious fix from my point
> of view would just be to say "piix4.c requires pcihp.c"
> and cause CONFIG_ACPI_PIIX4 to pull in CONFIG_ACPI_PCIHP,
> but that seems like it would be rather undoing the point
> of this change.

Yes. From the commit log and the vague recollection I have about this
change :

> For example, mips only needs support for PIIX4 and does not
> need acpi pci hotplug support or cpu hotplug support or memory hotplug
support
> etc

So does malta really need acpi hotplug? If not, then the stubbing out of
the vmstate struct is correct.

But if Malta requires ACPI_PIIX4 and it
> creates the PIIX4_PM device, it needs the real pcihp.c and
> not the stubs, doesn't it ?
>
> thanks
> -- PMM
>

