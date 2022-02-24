Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8304C27FF
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 10:24:50 +0100 (CET)
Received: from localhost ([::1]:42178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNAMj-0004ho-C1
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 04:24:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nNA8K-0000ve-Iz
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:09:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1nNA8H-0003Q9-Uy
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:09:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645693792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MipqRekb/gRJ0EoMrViQ2jlOAR4w4LQdeVWHRfv+wTY=;
 b=AIXDCunax4MiOvDLkXFWKcGJvDjsq3TbeixBUxhiG0n5wpg24Ae5mCpqywe1QC6Nd36Rp3
 oUgpnsVACaNP6JD0s2U+Syqc5eg5JJ1+kaKoeX8u+rNaQfXOudzcPj8VxTLZAYz2usv1yi
 XvgYGkAYdlVuKmRgqMoItT4N2Wh0P4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-tdsNlK5GMRCnzIkcGZeW0g-1; Thu, 24 Feb 2022 04:09:50 -0500
X-MC-Unique: tdsNlK5GMRCnzIkcGZeW0g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20DB51006AA6;
 Thu, 24 Feb 2022 09:09:49 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E71D322DFD;
 Thu, 24 Feb 2022 09:09:38 +0000 (UTC)
Date: Thu, 24 Feb 2022 10:09:35 +0100
From: Peter Krempa <pkrempa@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] vl: transform QemuOpts device to JSON syntax device
Message-ID: <YhdLT7gtPNjYfB6C@angien.pipo.sk>
References: <20220224060653.74229-1-zhenzhong.duan@intel.com>
 <YhdJik/u1TOUCXsU@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YhdJik/u1TOUCXsU@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: kwolf@redhat.com, mst@redhat.com, Zhenzhong Duan <zhenzhong.duan@intel.com>,
 qemu-devel@nongnu.org, eblake@redhat.com, pbonzini@redhat.com,
 lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 24, 2022 at 09:02:02 +0000, Daniel P. Berrangé wrote:
> On Thu, Feb 24, 2022 at 02:06:53PM +0800, Zhenzhong Duan wrote:
> > While there are mixed use of traditional -device option and JSON
> > syntax option, QEMU reports conflict, e.x:
> > 
> > /usr/libexec/qemu-kvm -nodefaults \
> >   -device '{"driver":"virtio-scsi-pci","id":"scsi0","bus":"pci.0","addr":"0x02.0"}' \
> >   -device virtio-scsi-pci,id=scsi1,bus=pci.0
> 
> Why are you attempting to mix JSON and non-JSON syntax at the same
> time ? The expectation is that any mgmt app adopting JSON syntax
> will do so universally and not mix old and new syntax. So in practice
> the scenario above is not one that QEMU ever intended to have used
> by apps.

Based on the previous post they are using some 'qemu:commandline'
overrides with the legacy syntax with new libvirt which uses JSON
syntax:

<qemu:commandline>
  <qemu:arg value='-netdev'/>
    <qemu:arg value='user,id=mynet0,hostfwd=tcp::44483-:22'/>
    <qemu:arg value='-device'/>
  <qemu:arg value='virtio-net-pci,netdev=mynet0,mac=00:16:3E:68:00:10,romfile='/>
</qemu:commandline>

I suggested that they should add the required functionality to libvirt
instead of trying to hack qemu:

https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg05068.html


