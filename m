Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB6C410B4A
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Sep 2021 13:30:56 +0200 (CEST)
Received: from localhost ([::1]:39362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRv26-0002L4-3E
	for lists+qemu-devel@lfdr.de; Sun, 19 Sep 2021 07:30:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mRv0Y-0001ep-5L
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 07:29:18 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:38795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mRv0U-0006U2-SX
 for qemu-devel@nongnu.org; Sun, 19 Sep 2021 07:29:17 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so13181280pjc.3
 for <qemu-devel@nongnu.org>; Sun, 19 Sep 2021 04:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=IA89P+mMI6b4veXn3KfdPy9qphkJOcjjeuwmw7YadH0=;
 b=csshuyOu7WeNY+RgF34xLrnvjUKl8gPiVrGaIRcKVkpOj9IIRkbVLC9QRBuIaSRLIa
 newMGpQXaSROQiJiYsaTfTVPrUPWaaSkRvOuaWNnKjR2Hi9LxkUBWnN6RlRMLMExn5LE
 NqQkTrc1Kf0P2sotKBJKg0fGumprrPeoWclj+Klm+NmDHK0Nw2ZE6kIFAToPzLaCkeg4
 sHTreoPzK+HJW1UBgBRzrQ2FcEJozKBPZU+7igadgZ6Y+uVWCGrBrTAZXtsfbIDhrCXI
 MqmZDfZxXW0kAAcHkDl0tAGc+UywipnFNFmsX3M6K+uxMWq5273uRjpYnluzSihsSABq
 rGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=IA89P+mMI6b4veXn3KfdPy9qphkJOcjjeuwmw7YadH0=;
 b=4P5wnnAbcpPU+W08vlcaIrDhesc2SJkqRoN1ZW1s0CjN/1PKqaH9SQbbAogDDSWLBE
 oI9Ka55Ych8w8LMIMhtNxNOPFe3yLbAfeV3ZZiFjy/NjkGbSh5PJuZtfEW8wsvVBDj+E
 ZlwBPjLxbulJ8EnQVfIcHpgSZ7NLLmXmW1c4isRWUAHz+5peSXCFTLAelxyXcaiI+QxF
 h9UlWP0nHCXqWI34Ybst39klFXdOYVbhxyfvJvPLV3ZOTouarlbvX+B0SwlttQQbvhJl
 ZYnzagg22p6q2effKEvZhOsaILjHl3KKaOE6G2M+M7B7n05StghnOs+AFVXm6k5rKHmJ
 b+8A==
X-Gm-Message-State: AOAM5322fEcxMS7U1WJp6P2x1FGG4mqVRDBA/mIMmsYrzz6vX9N9R7HE
 CzpfrLGxDe1zghjMKiYi2Xa7Sg==
X-Google-Smtp-Source: ABdhPJxB2wq6gxk1/7jzauzUvpFto/AGUb6k5+vvnqzuKVksPsb0+362vn7h4t2Pi4GYafU0/JVGrQ==
X-Received: by 2002:a17:903:2451:b0:13b:9694:4ea3 with SMTP id
 l17-20020a170903245100b0013b96944ea3mr17789953pls.74.1632050952966; 
 Sun, 19 Sep 2021 04:29:12 -0700 (PDT)
Received: from anisinha-lenovo ([203.212.243.59])
 by smtp.googlemail.com with ESMTPSA id z12sm558787pjb.52.2021.09.19.04.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 04:29:12 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Sun, 19 Sep 2021 16:59:07 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Ani Sinha <ani@anisinha.ca>
Subject: Re: [RFC PATCH] tests/acpi/pcihp: add unit tests for hotplug on
 multifunction bridges for q35
In-Reply-To: <alpine.DEB.2.22.394.2109190822510.3818584@anisinha-lenovo>
Message-ID: <alpine.DEB.2.22.394.2109191635040.3913985@anisinha-lenovo>
References: <20210806174642.490023-1-ani@anisinha.ca>
 <20210806174642.490023-2-ani@anisinha.ca>
 <20210917153248.6ef88697@redhat.com>
 <alpine.DEB.2.22.394.2109190814020.3818584@anisinha-lenovo>
 <alpine.DEB.2.22.394.2109190822510.3818584@anisinha-lenovo>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Sun, 19 Sep 2021, Ani Sinha wrote:


> > > > +static void test_acpi_q35_multif_bridge(void)
> > > > +{
> > > > +    test_data data = {
> > > > +        .machine = MACHINE_Q35,
> > > > +        .variant = ".multi-bridge",
> > >
> > > > +        .required_struct_types = base_required_struct_types,
> > > > +        .required_struct_types_len = ARRAY_SIZE(base_required_struct_types)
> > > do we care, i.e. why is this here?
> >
> > This verifies the smbios struct. It seems most of the other tests uses it.
> > So I left it in this test also.
> > Which of the tests should not be testing smbios?
>

> Right now smbios is only tested for non-uefi firmware. There are lots
> of tests that does not use uefi yet exercize the smbios struct tests.
> For example:
>
> test_acpi_piix4_tcg
> test_acpi_piix4_tcg_bridge
> test_acpi_piix4_no_root_hotplug
> test_acpi_piix4_no_bridge_hotplug
> test_acpi_piix4_no_acpi_pci_hotplug
> test_acpi_q35_tcg
> test_acpi_q35_tcg_bridge
> test_acpi_q35_tcg_mmio64
> test_acpi_q35_tcg_ipmi
> test_acpi_piix4_tcg_ipmi
>
> Should the smbios struct verification tests be removed from all of them?

To answer my own question ...

> test_acpi_q35_tcg

This uses smbios options directly. So we need to keep smbios specific
verifications.

> test_acpi_piix4_no_root_hotplug
> test_acpi_piix4_no_bridge_hotplug
> test_acpi_piix4_no_acpi_pci_hotplug

I think smbios specific struct tests can be removed from all of the above.
They just deal with DSDT tables.

Out of the rest,

> test_acpi_piix4_tcg
> test_acpi_piix4_tcg_bridge
> test_acpi_q35_tcg_bridge

I am not sure for the above three. I am not sure if the options passed
indirectly affect smbios. Probably not?

> test_acpi_q35_tcg_mmio64
> test_acpi_q35_tcg_ipmi
> test_acpi_piix4_tcg_ipmi

For the above three, we probably need the smbios checks. Again I am not
100% certain.

