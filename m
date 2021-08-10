Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E57773E5DC6
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 16:23:22 +0200 (CEST)
Received: from localhost ([::1]:37454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDSf3-0007VJ-O3
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 10:23:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDSe1-0006oV-Rp
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:22:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mDSdz-0002Gq-BW
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 10:22:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628605334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7vE4hsmuvuzwxNaldkWwBkHoh2joCXYDi/Whv+8V1uM=;
 b=Xy5eOWKZkxgvY494L0P2uBO+oYA+LKmRdLaWNdU1jXJIA5NqIEp9JABpO9VwvO+vvvrEnu
 oLc/g0yliQKukyFsYNFhVTzm6HN5x/4N4aR1Kv3r3FAWoLTsVStl2XjwSU9ExDDCc8O0+3
 3owS8SZDfA3oLju/UDKBo/dg8N+NPRs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-OmSxhPQWM2GlygVYQJJJ4Q-1; Tue, 10 Aug 2021 10:22:11 -0400
X-MC-Unique: OmSxhPQWM2GlygVYQJJJ4Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F8B91008061;
 Tue, 10 Aug 2021 14:22:10 +0000 (UTC)
Received: from localhost (unknown [10.22.32.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 237462B0B3;
 Tue, 10 Aug 2021 14:22:02 +0000 (UTC)
Date: Tue, 10 Aug 2021 10:22:01 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH for-6.2 02/12] qom: Use DEVICE_*CLASS instead of
 OBJECT_*CLASS
Message-ID: <20210810142201.4pvwejjniuz4xfug@habkost.net>
References: <20210806211127.646908-1-ehabkost@redhat.com>
 <20210806211127.646908-3-ehabkost@redhat.com>
 <87eeb11pjq.fsf@secure.mitica>
MIME-Version: 1.0
In-Reply-To: <87eeb11pjq.fsf@secure.mitica>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 10, 2021 at 01:56:25PM +0200, Juan Quintela wrote:
> > -        DeviceClass *dc = OBJECT_CLASS_CHECK(DeviceClass, list->data,
> > -                                             TYPE_DEVICE);
> > +        DeviceClass *dc = DEVICE_CLASS(list->data);
> 
> Finding where DEVICE_CLASS is defined is .... interesting.

That's a valid concern, but I wonder what we can do to address
this.  The existing practice of defining all macros manually
leads to a high number of mistakes and inconsistencies[1].

Now, once all QOM types are converted to the new macros (which is
work in progress), maybe we could replace:

  DEVICE_CLASS(oc)
  DEVICE_GET_CLASS(dev)

with more grep-friendly expressions like:

  CLASS(DEVICE, oc)
  GET_CLASS(DEVICE, dev)

The type of those expressions would still be (DeviceClass*).

---

[1] These are some of the fixes for bugs or inconsistencies that were
already merged to qemu.git:

6a567fbcf0b8 nubus: Delete unused NUBUS_BRIDGE macro
98b49b2bea15 spapr: Remove unnecessary DRC type-checker macros
08e14bb7e060 platform-bus: Delete macros for non-existing typedef
5c8b0f2cc799 can_emu: Delete macros for non-existing typedef
f58b770fbbd9 virtio-ccw: Fix definition of VIRTIO_CCW_BUS_GET_CLASS

These are fixes for broken QOM macros I submitted recently:

[PATCH for-6.2 1/6] acpi: Delete broken ACPI_GED_X86 macro
[PATCH for-6.2 2/6] sbsa_gwdt: Delete broken SBSA_*CLASS macros

And these are some other inconsistencies that are still in the
current tree, that need to be addressed:

hw/i386/kvm/i8254.c:45:1: type name mismatch: TYPE_KVM_I8254 vs KVM_PIT
hw/net/e1000.c:158:1: type name mismatch: TYPE_E1000_BASE vs E1000
hw/rtc/m48t59-isa.c:38:1: mismatching class type for M48TXX_ISA (M48txxISADeviceClass)
hw/rtc/m48t59-isa.c:131:1: class type declared here (None)
hw/rtc/m48t59.c:47:1: mismatching class type for M48TXX_SYS_BUS (M48txxSysBusDeviceClass)
hw/rtc/m48t59.c:654:1: class type declared here (None)
hw/s390x/virtio-ccw.h:63:1: typedef name mismatch: VirtioCcwBusState is defined as struct VirtioBusState
hw/s390x/virtio-ccw.h:59:1: typedef is here
hw/scsi/megasas.c:137:1: type name mismatch: TYPE_MEGASAS_BASE vs MEGASAS
hw/virtio/virtio-pci.h:29:1: typedef name mismatch: VirtioPCIBusState is defined as struct VirtioBusState
hw/virtio/virtio-pci.h:25:1: typedef is here
include/exec/memory.h:48:1: mismatching instance type for RAM_DISCARD_MANAGER (RamDiscardManager)
softmmu/memory.c:3418:1: instance type declared here (None)
include/hw/isa/superio.h:20:1: mismatching instance type for ISA_SUPERIO (ISASuperIODevice)
hw/isa/isa-superio.c:180:1: instance type declared here (None)
include/hw/s390x/event-facility.h:197:1: type name mismatch: TYPE_SCLP_EVENT_FACILITY vs EVENT_FACILITY
include/hw/s390x/s390-ccw.h:22:1: type name mismatch: TYPE_S390_CCW vs S390_CCW_DEVICE
include/hw/vfio/vfio-amd-xgbe.h:43:1: type name mismatch: TYPE_VFIO_AMD_XGBE vs VFIO_AMD_XGBE_DEVICE
include/hw/vfio/vfio-calxeda-xgmac.h:40:1: type name mismatch: TYPE_VFIO_CALXEDA_XGMAC vs VFIO_CALXEDA_XGMAC_DEVICE
include/hw/vfio/vfio-platform.h:73:1: type name mismatch: TYPE_VFIO_PLATFORM vs VFIO_PLATFORM_DEVICE
include/hw/watchdog/wdt_diag288.h:10:1: type name mismatch: TYPE_WDT_DIAG288 vs DIAG288
migration/migration.h:141:1: type name mismatch: TYPE_MIGRATION vs MIGRATION_OBJ
target/ppc/cpu.h:1253:1: mismatching instance type for PPC_VIRTUAL_HYPERVISOR (PPCVirtualHypervisor)
target/ppc/cpu_init.c:9090:1: instance type declared here (None)

-- 
Eduardo


