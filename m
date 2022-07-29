Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DEE584D36
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 10:13:42 +0200 (CEST)
Received: from localhost ([::1]:34902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHL7t-000890-5L
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 04:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58196)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oHL4I-0004tK-Kz
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 04:09:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oHL4F-0005Mq-C6
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 04:09:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659082193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sWuWJ7Iqxl5s0FXtXoHGLLncxjmf643c1S4NHZXNJIk=;
 b=Idc3TpzkmYySWoHiI7OxF5xm8lvZXQF8qJ8+02jV55XRLcJ+fvC0WgFktVGfwBElVuE7O9
 XwW8TfWp9TBJP3Z8fH2rWvcT1O3WJXRFr20J2gWBlAVxRPSwvqhNadrGqLXq6/maBgaUVl
 Z6pKBDRJM5dMs+B9XnITNm6gIAU6oIo=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-pbCxm7GrOk6GG_kuwN5u6Q-1; Fri, 29 Jul 2022 04:09:52 -0400
X-MC-Unique: pbCxm7GrOk6GG_kuwN5u6Q-1
Received: by mail-ed1-f71.google.com with SMTP id
 e6-20020a056402190600b0043bde36ab23so2506016edz.11
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 01:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sWuWJ7Iqxl5s0FXtXoHGLLncxjmf643c1S4NHZXNJIk=;
 b=lpustR/fmMHeGNT1xX4X818Lc9tDS+k5kdHxcQI9bpCBdmcpvIL8kSiACu0OXT2L64
 njnnJi0fHZr9A6HvYim3Tn1v1POYGDkd9/jBubc1NShZ9punlkEyaBcfaZwe0FQL8mF7
 AW5+rK3SSJPuKVufhHhUbgpAvUNj2q8ZAis70G/VIWbP7NW7UTR2ExMCias3ad9Javml
 kocEeqkPQnwNUr9ziyNbKwFDr6LhaFw4lKbVsAhs9JqBx8pMAKE/LNZNYADvNKA4RpOG
 W4lBiW6UGWb0S08FJ3SY9lfHoegY4ff8m1vINfPYoth9G5HuDNbaqobgL/PP/F5xE73g
 CXbw==
X-Gm-Message-State: AJIora+EMiM1yj1wf8D3pZqiwlnoFbLTSbYZloi1B4ZOXLZVDYOgYaSb
 0mdO2lR7hU0onjOBb2fAgk7mOUYE38TVpz+ALe9tmVxl0gzPqVW5dXybLZyq+aMGelYzo4U22m/
 h3SUr+stXVMM9rbM=
X-Received: by 2002:a17:907:7f05:b0:72b:5a11:b357 with SMTP id
 qf5-20020a1709077f0500b0072b5a11b357mr2105943ejc.67.1659082191099; 
 Fri, 29 Jul 2022 01:09:51 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uqZyycENIZkThCcbY7Sixzd2GjckAMY632m3UJxnabwykivWHll5AMatlkyctL5ZxBHoRbRg==
X-Received: by 2002:a17:907:7f05:b0:72b:5a11:b357 with SMTP id
 qf5-20020a1709077f0500b0072b5a11b357mr2105921ejc.67.1659082190697; 
 Fri, 29 Jul 2022 01:09:50 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a1709064f0600b0072a66960843sm1366608eju.51.2022.07.29.01.09.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 01:09:50 -0700 (PDT)
Date: Fri, 29 Jul 2022 10:09:49 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 f4bug@amsat.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 ani@anisinha.ca, mst@redhat.com
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features
 of PIIX4_PM
Message-ID: <20220729100949.34b20fda@redhat.com>
In-Reply-To: <CAFEAcA-Bzbw6MY2kir5fWezQmet6BWD=B+qS6uetsxRvPbdyCQ@mail.gmail.com>
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <YuKgxM4IjAXh/goO@work-vm>
 <CAFEAcA-Bzbw6MY2kir5fWezQmet6BWD=B+qS6uetsxRvPbdyCQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 28 Jul 2022 16:04:58 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 28 Jul 2022 at 15:44, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Igor Mammedov (imammedo@redhat.com) wrote:  
> > > QEMU crashes trying to save VMSTATE when only MIPS target are compiled in
> > >   $ qemu-system-mips -monitor stdio
> > >   (qemu) migrate "exec:gzip -c > STATEFILE.gz"
> > >   Segmentation fault (core dumped)
> > >
> > > It happens due to PIIX4_PM trying to parse hotplug vmstate structures
> > > which are valid only for x86 and not for MIPS (as it requires ACPI
> > > tables support which is not existent for ithe later)
> > >
> > > Issue was probably exposed by trying to cleanup/compile out unused
> > > ACPI bits from MIPS target (but forgetting about migration bits).
> > >
> > > Disable compiled out features using compat properties as the least
> > > risky way to deal with issue.  
> >
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

it's not limited to VMSTATE_PCI_HOTPLUG but also memory hotplug
and other x86 specific knobs that may cause crash.
(I ignored cpu hotplug one for now since it doesn't cause crash)

> 
> -- PMM
> 


