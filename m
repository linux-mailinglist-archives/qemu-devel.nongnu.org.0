Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085E941E719
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 07:20:22 +0200 (CEST)
Received: from localhost ([::1]:41978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWAy4-0002dX-P9
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 01:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mWAx0-0001yA-Ed
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 01:19:14 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:38646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1mWAwy-0000ip-N3
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 01:19:14 -0400
Received: by mail-pl1-x633.google.com with SMTP id x4so5555247pln.5
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 22:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=IGttNu34fT6swjnUccHi4DG6YdsGNCI2iQcvX/f2WrE=;
 b=bzmCQyKagjE2jmbjDWerICl+DgWi2m4GmZ8Nnjr+90WXcpH2iQOlLpaPtr3Juo1ntR
 rG2YU/scp2gj+IFyiLva3r7AXEMIs+AewSCghTk8wyYef1mGMWJZT8JCf9Q+2f+Csdkg
 eFdI9WT3dL5G0pQAGxNawdrRXjOre6VFeJij3cIYMWy+dXjn/l/8TR7yXnvyIFkt+b7K
 W+X8DR7T100sISQ7/sfVxubmDWuU6iDb+RecR+F7m1A4JpIJiPNHH47Tg/HWMcFbd1/8
 CpVjPXIGjesOfBPKzDUQerja4OvpmjIKrgyJaP7N5YGf/bsdbEDeRykA49I5SI71t/se
 0YkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=IGttNu34fT6swjnUccHi4DG6YdsGNCI2iQcvX/f2WrE=;
 b=4hV4FgPxsbHUFjCAk4YYrh/AG4rV1gaksVd5MVzF3fsLM+nbDK+euECsfr8aAtAH2G
 X8zV6xJNX8hf9t73C0uCUmQMhibHc7v8svnY6h/nGiLh8Mh+NfMJIXka+basC3vtZRdw
 vV/bzYzxSXM/jeq89DPQUalShAJZRyERoPa7o6yjMEqsYdtUu52tc5Kh/Brhd1x4JSpw
 iNA13dAfaM4ygMTtnwMfA+CLK6zp/1fybkU7w3cA02d758RNGc/cLswepSc/Dawcx1AF
 S9v3s4TKF/LDCUB3WPqDOD6IjoynWTuz5szmIYXP57wsrrtwGshyMC3x5WGE2uI5LaVu
 fnSw==
X-Gm-Message-State: AOAM533A96y4RQEFZob1ArInm8SCBl2xmbwLKvocfrJW1phfGzVesBTu
 LuITMvOa1Q4jUjJ5Nx4/y7mtgg==
X-Google-Smtp-Source: ABdhPJwSRc2wfA0AjvvBskDkCEtqjNGQMtSgO/A1P9x4ox0r2f8KDdN27t4JQ2KFFAjF4JWSOtRtnw==
X-Received: by 2002:a17:902:930c:b0:13e:42b4:9149 with SMTP id
 bc12-20020a170902930c00b0013e42b49149mr9006503plb.86.1633065551090; 
 Thu, 30 Sep 2021 22:19:11 -0700 (PDT)
Received: from anisinha-lenovo ([115.96.125.135])
 by smtp.googlemail.com with ESMTPSA id u12sm6314873pjr.2.2021.09.30.22.19.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 22:19:10 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Fri, 1 Oct 2021 10:49:04 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] failover: fix unplug pending detection
In-Reply-To: <ec216e3a-71a3-c7a5-628f-1871d063d2a2@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2110011046060.579856@anisinha-lenovo>
References: <20210930082032.1237812-1-lvivier@redhat.com>
 <alpine.DEB.2.22.394.2109301450580.579856@anisinha-lenovo>
 <ec216e3a-71a3-c7a5-628f-1871d063d2a2@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: none client-ip=2607:f8b0:4864:20::633;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x633.google.com
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
Cc: Juan Quintela <quintela@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Jens Freimann <jfreimann@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On Thu, 30 Sep 2021, Laurent Vivier wrote:

> On 30/09/2021 11:24, Ani Sinha wrote:
> >
> >
> > On Thu, 30 Sep 2021, Laurent Vivier wrote:
> >
> > > Failover needs to detect the end of the PCI unplug to start migration
> > > after the VFIO card has been unplugged.
> > >
> > > To do that, a flag is set in pcie_cap_slot_unplug_request_cb() and reset
> > > in
> > > pcie_unplug_device().
> > >
> > > But since
> > >      17858a169508 ("hw/acpi/ich9: Set ACPI PCI hot-plug as default on
> > > Q35")
> > > we have switched to ACPI unplug and these functions are not called anymore
> > > and the flag not set. So failover migration is not able to detect if card
> > > is really unplugged and acts as it's done as soon as it's started. So it
> > > doesn't wait the end of the unplug to start the migration. We don't see
> > > any
> > > problem when we test that because ACPI unplug is faster than PCIe native
> > > hotplug and when the migration really starts the unplug operation is
> > > already done.
> > >
> > > See c000a9bd06ea ("pci: mark device having guest unplug request pending")
> > >      a99c4da9fc2a ("pci: mark devices partially unplugged")
> >
> > Ok so I have a basic question about partially_hotplugged flag in the
> > device struct (there were no comments added in a99c4da9fc2a39847
> > explaining it). It seems we return early from pcie_unplug_device() when
> > this flag is set from failover_unplug_primary() in virtio-net. What is the
> > purpose of this flag? It seems we are not doing a full unplug of the
> > primary device?
>
> Yes, to be able to plug it back in case of migration failure we must keep all
> the data structures.

Ok so two things here:
(a) could you please add a comment to PCIDevice struct in pci.h to clarify
what the flag actually means, why it is there and what it is supposed to
do.

(b) the naming of the variable could be something like do_partial_unplug
or some such. This could be a separate patch.

 >
> But reading the code again it seems this part should be in
> acpi_pcihp_eject_slot() rather than in acpi_pcihp_device_unplug_cb() to
> prevent the hotplug_handler_unplug()/object_unparent()  rather than the
> qdev_unrealize() (to be like in pcie.c).

Correct. You need to place the check earlier so as to be equivalent to
what the native hotplug code does.

