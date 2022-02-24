Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 054324C2AFD
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 12:35:58 +0100 (CET)
Received: from localhost ([::1]:52450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNCPd-0007jF-2k
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 06:35:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nNCLN-00066p-DD
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:31:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1nNCLH-0003yr-CZ
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 06:31:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645702286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=36CPmyentgz/mKQ3EJm6khjZemUc8EfpQHK/YWSSWbo=;
 b=QmiU4bLEVT60JZE+LXVTJc7M8SaGnbyuZJHpJpfhyXWZnffPu80EgF7Jr5eYF6sHAtjVg2
 4x9igx46P2lYg+o5ElRpOM8KPgaFdYovASDguDonPiZAxIAqa5MHYAXu5dnYbpwLpYfzDm
 d3qFFOX3THhdf/WRIDVSa067V9HIC34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500--pgtdPHKPiyNp-nO8rxyZw-1; Thu, 24 Feb 2022 06:31:25 -0500
X-MC-Unique: -pgtdPHKPiyNp-nO8rxyZw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 566962E68;
 Thu, 24 Feb 2022 11:31:24 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B2236797DB;
 Thu, 24 Feb 2022 11:31:22 +0000 (UTC)
Date: Thu, 24 Feb 2022 12:31:21 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Subject: Re: [PATCH] vl: transform QemuOpts device to JSON syntax device
Message-ID: <YhdsiSDR60IXSAn/@redhat.com>
References: <20220224060653.74229-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
In-Reply-To: <20220224060653.74229-1-zhenzhong.duan@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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
Cc: pkrempa@redhat.com, mst@redhat.com, lersek@redhat.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.02.2022 um 07:06 hat Zhenzhong Duan geschrieben:
> While there are mixed use of traditional -device option and JSON
> syntax option, QEMU reports conflict, e.x:
> 
> /usr/libexec/qemu-kvm -nodefaults \
>   -device '{"driver":"virtio-scsi-pci","id":"scsi0","bus":"pci.0","addr":"0x02.0"}' \
>   -device virtio-scsi-pci,id=scsi1,bus=pci.0
> 
> It breaks with:
> 
> qemu-kvm: -device {"driver":"virtio-scsi-pci","id":"scsi0","bus":"pci.0","addr":"0x02.0"}: PCI: slot 2 function 0 not available for virtio-scsi-pci, in use by virtio-scsi-pci
> 
> But if we reformat first -device same as the second, so only same kind
> of option for all the devices, it succeeds, vice versa. e.x:
> 
> /usr/libexec/qemu-kvm -nodefaults \
>   -device virtio-scsi-pci,id=scsi0,bus=pci.0,addr=02.0 \
>   -device virtio-scsi-pci,id=scsi1,bus=pci.0
> 
> Succeed!
> 
> Because both kind of options are inserted into their own list and
> break the order in QEMU command line during BDF auto assign. Fix it
> by transform QemuOpts into JSON syntax and insert in JSON device
> list, so the order in QEMU command line kept.
> 
> Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>

This patch is incorrect and breaks several cases, which are the reason
why the QemuOpts path hasn't been changed yet.

For example, after this patch, help doesn't work any more:

$ build/qemu-system-x86_64 -device help
qemu-system-x86_64: -device help: 'help' is not a valid device model name

Any non-string property doesn't work any more in non-JSON syntax:

$ $ build/qemu-system-x86_64 -blockdev null-co,node-name=disk -device virtio-blk,drive=disk,physical_block_size=4096
qemu-system-x86_64: -device virtio-blk,drive=disk,physical_block_size=4096: Parameter 'physical_block_size' expects uint64

There may be more cases that are broken with this patch.

Kevin


