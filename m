Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C383C33FB76
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 23:47:48 +0100 (CET)
Received: from localhost ([::1]:37356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMex9-00082G-B2
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 18:47:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lMeus-0006uO-AY
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 18:45:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1lMeup-0005F2-AW
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 18:45:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616021121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=itLk/PLNKrA28tFR9pJ78cpC+YTGpOpCqWLjyVz42f4=;
 b=RiAKFefLIad4J0K4esnGdKn4poUKlfwWhgJHkcnBhJCVkDfEJzRx6xUixdzag3BgjtQ3SW
 ikKqxjzYWIpqORlPCl0K9ia2XWxX7MjWjNGECs9pqrpVo5D24a6EjETzYtiAF6DaFsoYpy
 2qmCp7DKdYAYsc4bvXBzlLN4/SeZUS8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-GCPzyyqjO0yZ2pfjZRXPgw-1; Wed, 17 Mar 2021 18:45:14 -0400
X-MC-Unique: GCPzyyqjO0yZ2pfjZRXPgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF61A800D53;
 Wed, 17 Mar 2021 22:45:12 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-112.ams2.redhat.com
 [10.36.113.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56F0C10023B0;
 Wed, 17 Mar 2021 22:45:05 +0000 (UTC)
Subject: Re: Microsoft and Intel NVDIMM ACPI _DSM interfaces status?
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <YFHsy8599w7KT1SB@stefanha-x1.localdomain>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <eaee4c20-5fd7-f257-eddf-331ffe4e39ef@redhat.com>
Date: Wed, 17 Mar 2021 23:45:04 +0100
MIME-Version: 1.0
In-Reply-To: <YFHsy8599w7KT1SB@stefanha-x1.localdomain>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Haozhong Zhang <haozhong.zhang@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dexuan Cui <decui@microsoft.com>,
 qemu-devel@nongnu.org, Jeff Moyer <jmoyer@redhat.com>,
 Wei Yang <richardw.yang@linux.intel.com>,
 Ross Zwisler <ross.zwisler@linux.intel.com>,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

(Adding Dexuan Cui to the CC list, comments below.)

On 03/17/21 12:49, Stefan Hajnoczi wrote:
> Hi,
> Microsoft and Intel developed two different ACPI NVDIMM _DSM
> interfaces.
>
> The specs for the Intel interface are available here:
> https://pmem.io/documents/NVDIMM_DSM_Interface_Example.pdf
>
> This is the interface that QEMU emulates. It has been reported that
> Windows 2016 Server and 2019 Server guests do not recognize QEMU's
> emulated NVDIMM devices using the Microsoft driver.

The Microsoft specification seems to be available at:

  https://uefi.org/NVDIMM%20RFIC%20Registry
  ->
  https://uefi.org/RFIC_LIST
  ->
  https://www.uefi.org/sites/default/files/resources/_DSM%20for%20Virtual%20NVDIMMs%20v1.01.docx

It defines:

- Region Format Interface Code (RFIC) 0x1901,

- with a _DSM command set (for non-root devices) that is identified by
  UUID 5746C5F2-A9A2-4264-AD0E-E4DDC9E09E80.

On the other hand, the Intel document defines:

- RFIC 0x0201,

- with a _DSM command set (for non-root devices) that is identified by
  UUID 4309AC30-0D11-11E4-9191-0800200C9A66.

In the Linux kernel,

- the Microsoft UUID is called UUID_NFIT_DIMM_N_HYPERV (1194c4133195,
  "nfit: Add Hyper-V NVDIMM DSM command set to white list", 2019-01-29),

- while the Intel one is called UUID_NFIT_DIMM (commit b94d5230d06e,
  "libnvdimm, nfit: initial libnvdimm infrastructure and NFIT support",
  2015-06-24).

An interesting excerpt from commit 1194c4133195:

> +        * There are 4 "legacy" NVDIMM command sets
> +        * (NVDIMM_FAMILY_{INTEL,MSFT,HPE1,HPE2}) that were created before
> +        * an EFI working group was established to constrain this
> +        * proliferation. The nfit driver probes for the supported command
> +        * set by GUID. Note, if you're a platform developer looking to add
> +        * a new command set to this probe, consider using an existing set,
> +        * or otherwise seek approval to publish the command set at
> +        * http://www.uefi.org/RFIC_LIST.

And presently, the "official RFIC list" *only* contains Microsoft's
definition.

So my guess is that the QEMU device model (emulating Intel) predates
both the standardization and the registry, and that the Microsoft driver
only recognizes their own format (RFIC 0x1901 / UUID
5746C5F2-A9A2-4264-AD0E-E4DDC9E09E80).

Back to your email:

On 03/17/21 12:49, Stefan Hajnoczi wrote:
> I'd like to understand the path forward that will allow both Linux and
> Windows guests to successfully use QEMU's emulated NVDIMM device
> (https://gitlab.com/qemu-project/qemu/-/blob/master/hw/acpi/nvdimm.c).
>
> Are/have these two interfaces being/been unified?

I wouldn't think so. In the Linux kernel, UUID_NFIT_DIMM_N_HYPERV is
mapped to NFIT_DEV_DIMM_N_HYPERV is mapped to NVDIMM_FAMILY_HYPERV,
which seems to translate to "DSM mask" and "flags" manipulations...
which I don't understand. :)

FWIW, I believe the Linux kernel implements a "generic set" of NVDIMM
operations, and then it cherry-picks those features/operations that the
hardware (virtual or otherwise) advertizes, or seems to support.

This, and more closely the above-quoted code comment, appear to indicate
that there's no unification, at the interface level. The Linux guest
driver may have some implementation-level unification.

The first link I pasted above,
<https://uefi.org/NVDIMM%20RFIC%20Registry>, refers to "NVST Workgroup
Chairperson". After logging in to my <members.uefi.org> account, I
managed to resolve "NVST" as follows:

- ACPI Specification Working Group [ASWG]

  - NVDIMM Subteam [NVST]

    - https://members.uefi.org/apps/org/workgroup/nvst/description.php

      """
      Public Description

      The NVDIMM Subteam was created to review ACPI and UEFI related
      topics pertaining to persistent memory devices. All relevant ECR's
      need to be reviewed by this subcommittee prior to review by the
      USWG and ASWG. Please contact the group chair with questions or to
      add items to the regular meeting agenda.
      """

Some other abbreviations resolved, for interpreting the blurb:

- USWG: UEFI Spec Working Group

- ECR: Engineering Change Request -- basically a ticket filed for one of
  the UEFI, ACPI, and Platform Init specs, in the (members only) Mantis
  bug tracker, at <https://mantis.uefi.org/>. ECRs are usually proposed
  as stand-alone documents that are attached to Mantis tickets.


> Should QEMU emulate both of them to make running Windows guests easy?

In my (uneducated) opinion: yes. Microsoft standarized their Region
Format Interface, with their _DSM UUID and all; and right now, that spec
seems to be the *only* officially approved format in the RFIC registry.
So it's plausible to me that, unlike the Linux kernel, Microsoft's
driver doesn't support the -- technically unapproved, nonstandard --
Intel Region Format Interface.

Dexuan, please correct me if I'm wrong.

Thanks,
Laszlo


