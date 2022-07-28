Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C945845DF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 20:53:01 +0200 (CEST)
Received: from localhost ([::1]:33132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH8d2-0006O8-5k
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 14:53:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oH8Z7-0003Tl-LB
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 14:48:57 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:37787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1oH8Z5-0003Zm-An
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 14:48:57 -0400
Received: by mail-qv1-xf35.google.com with SMTP id m10so2060198qvu.4
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 11:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=ch7WdRPGG5eDh/3ImoMnx3lBXkbWaQrUdoLijvB8hOk=;
 b=W38qpDkMHLrkEPBRaJK4FS00eZ1NMiGvoy3o4eJo6S/WmJhEAuaWEaLVVoJSGs0emx
 agUGDdx0ryJDshVB5oJR7ngudW1XB0dH2ly7drfpHFucf+WLqtgqnOVqjkBc/YP8fcD4
 lEqjILzwsTcshX63ZefhpIWSX1wsSctl00lv2dFC84lrGMj6RBLAh3mTEOadgwx2vIoI
 Tp7HLMDCFA4HBX9LX5X6rAHxeQgkL2eMxjMzxrcUVwPUyboVNlX6mGfDFufzNJJVoQ0a
 PY07gYd7k1JIG1WofGVEehqpf6unZaFxVFOeBPawW0lu9ySZlKaVDVt+R2Qhz1T8EwOA
 TEcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=ch7WdRPGG5eDh/3ImoMnx3lBXkbWaQrUdoLijvB8hOk=;
 b=Z3BFM10HeVrnvKWrG7Z20F/eW0KiN++p+TwUlf69KFP9FOTBpd2BaRr0R3w70+bOi2
 UkWEYceiT4c2SOXpncQtvqG0/FePJ9OAo5j+xLjr2ET0xD2bPjKcLlTyHrePlURkzGyY
 CWDMDMxKdqBJQhMaT5ML5x9TSLn2ZOSjb+Vq9MkrwS0GC2EEAQRaivE3QRfHeC4VAESp
 ZrVh6wNLt5ruG+7ksYgbytZDVe/1ZlWnoVGDQZH8Ng0fK7+8VbGJrpFcOyqZPB3Fbqel
 zsYp24H7K9eVWrz77mtgtA8cDsVAik2j35j6updLcAv/mcw7HiYedqAF50sh0VkmYgZy
 4R9g==
X-Gm-Message-State: ACgBeo1LE1tCjICXtaMYeWcp/HF64KshihMK6EqbPQi6tqZ66yOekpKr
 XZlZZVcnjWGayKNRQsPOrqUWcw==
X-Google-Smtp-Source: AA6agR5vtgAZFph52WHUCQhS080d1LePxuQEBVIu8f+tP6yt6OpKSGcefGpZahl5XD9cVUCdgKzgLg==
X-Received: by 2002:a0c:8bd2:0:b0:474:7d1a:eb5b with SMTP id
 a18-20020a0c8bd2000000b004747d1aeb5bmr343829qvc.18.1659034133787; 
 Thu, 28 Jul 2022 11:48:53 -0700 (PDT)
Received: from snn377.eng.timetra.com ([208.184.70.254])
 by smtp.googlemail.com with ESMTPSA id
 d21-20020a05620a241500b006b249cc505fsm1126349qkn.82.2022.07.28.11.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 11:48:53 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Thu, 28 Jul 2022 11:48:50 -0700 (PDT)
X-X-Sender: anisinha@anisinha-lenovo
To: Peter Maydell <peter.maydell@linaro.org>
cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org, 
 f4bug@amsat.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com, 
 ani@anisinha.ca, mst@redhat.com
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features
 of PIIX4_PM
In-Reply-To: <CAFEAcA-Bzbw6MY2kir5fWezQmet6BWD=B+qS6uetsxRvPbdyCQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2207281147120.151455@anisinha-lenovo>
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <YuKgxM4IjAXh/goO@work-vm>
 <CAFEAcA-Bzbw6MY2kir5fWezQmet6BWD=B+qS6uetsxRvPbdyCQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::f35;
 envelope-from=ani@anisinha.ca; helo=mail-qv1-xf35.google.com
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



On Thu, 28 Jul 2022, Peter Maydell wrote:

> On Thu, 28 Jul 2022 at 15:44, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:

> > Isn't the problem partially due to a 'stub' vmsd which isn't terminated?
>
> Yes, but setting these properties causes that vmsd
> (vmstate_acpi_pcihp_pci_status) to not be used:
>
>  * it is used only in VMSTATE_PCI_HOTPLUG()
>  * that macro is used only in hw/acpi/ich9.c (not relevant here) and
>    hw/acpi/piix4.c
>  * in piix4.c it is invoked passing it the test functions
>    vmstate_test_use_acpi_hotplug_bridge and
>    vmstate_test_migrate_acpi_index
>  * setting the properties on the device as this patch does
>    causes those test functions to return false, so the
>    vmstate_acpi_pcihp_pci_status is never examined

I believe this happens in vmstate_save_state_v() in this condition
checking:

  while (field->name) {
        if ((field->field_exists &&
             field->field_exists(opaque, version_id)) ||
            (!field->field_exists &&
             field->version_id <= version_id)) {





