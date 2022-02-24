Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D75D34C2770
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 10:08:39 +0100 (CET)
Received: from localhost ([::1]:50220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNA75-0007SF-0F
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 04:08:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nNA1Y-0004S5-2L
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:02:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nNA1U-0002Sa-FH
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 04:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645693371;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Vc+g91GjETxLuNPfDXZJgryEP5ArArnZniWO+iZEn4I=;
 b=JwBwKWePl16gqUJ8En5Ln3Tr97BGJ4+/m+GszDLo5YZxGVQX/P62QNueW0XjAFV5Yq6dQA
 9vNE3ddibD2jXoTj0o605db52y91pqEurLO07bR61dqpRD3CFfPQVvPikHYKteUOD3Czui
 ewo2CVf0cyBseBBSqcCLVV1/kRslWkw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-a9CY0cwzM8SDQGicwWKNTg-1; Thu, 24 Feb 2022 04:02:48 -0500
X-MC-Unique: a9CY0cwzM8SDQGicwWKNTg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79B6F1091DA2;
 Thu, 24 Feb 2022 09:02:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.97])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB7A76767B;
 Thu, 24 Feb 2022 09:02:04 +0000 (UTC)
Date: Thu, 24 Feb 2022 09:02:02 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Zhenzhong Duan <zhenzhong.duan@intel.com>
Subject: Re: [PATCH] vl: transform QemuOpts device to JSON syntax device
Message-ID: <YhdJik/u1TOUCXsU@redhat.com>
References: <20220224060653.74229-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
In-Reply-To: <20220224060653.74229-1-zhenzhong.duan@intel.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: kwolf@redhat.com, pkrempa@redhat.com, mst@redhat.com, eblake@redhat.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, lersek@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 24, 2022 at 02:06:53PM +0800, Zhenzhong Duan wrote:
> While there are mixed use of traditional -device option and JSON
> syntax option, QEMU reports conflict, e.x:
> 
> /usr/libexec/qemu-kvm -nodefaults \
>   -device '{"driver":"virtio-scsi-pci","id":"scsi0","bus":"pci.0","addr":"0x02.0"}' \
>   -device virtio-scsi-pci,id=scsi1,bus=pci.0

Why are you attempting to mix JSON and non-JSON syntax at the same
time ? The expectation is that any mgmt app adopting JSON syntax
will do so universally and not mix old and new syntax. So in practice
the scenario above is not one that QEMU ever intended to have used
by apps.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


