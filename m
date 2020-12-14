Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134D82DA28C
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 22:27:01 +0100 (CET)
Received: from localhost ([::1]:59088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kovMx-0008VB-MS
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 16:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kovLh-0007Op-FV
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 16:25:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kovLe-00061X-Qw
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 16:25:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607981138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sj44vDZp0yoWNaa+V0L2lJeML/RXpnxN2J+1LkLWlyw=;
 b=Fn4+CD0QyWnr8E2MugE6FbgHHJBhq9BpxYQ777GbPUgS9720KX4KEplBX7n4kBjRWtVmb9
 4zK7XxhlrztKfZJ/FJcCdZI9ZcfK8HAcZHV9/GcmRHXa57rbHRSwc4rghcCYUYV7UkMKkr
 IcALAiLFQMbUNNLKGL5xFt0lXz+YBUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-4SccWWaQPOeOxSEBp6sW3w-1; Mon, 14 Dec 2020 16:25:34 -0500
X-MC-Unique: 4SccWWaQPOeOxSEBp6sW3w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66A341005504;
 Mon, 14 Dec 2020 21:25:31 +0000 (UTC)
Received: from localhost (ovpn-116-160.rdu2.redhat.com [10.10.116.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4EFE60BE2;
 Mon, 14 Dec 2020 21:25:24 +0000 (UTC)
Date: Mon, 14 Dec 2020 16:25:23 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [for-6.0 v5 01/13] qom: Allow optional sugar props
Message-ID: <20201214212523.GS1289986@habkost.net>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-2-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201204054415.579042-2-david@gibson.dropbear.id.au>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pair@us.ibm.com, Marcelo Tosatti <mtosatti@redhat.com>,
 brijesh.singh@amd.com, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 frankja@linux.ibm.com, david@redhat.com, mdroth@linux.vnet.ibm.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, thuth@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>, dgilbert@redhat.com,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org, rth@twiddle.net,
 berrange@redhat.com, cohuck@redhat.com, qemu-ppc@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Dec 04, 2020 at 04:44:03PM +1100, David Gibson wrote:
> From: Greg Kurz <groug@kaod.org>
> 
> Global properties have an @optional field, which allows to apply a given
> property to a given type even if one of its subclasses doesn't support
> it. This is especially used in the compat code when dealing with the
> "disable-modern" and "disable-legacy" properties and the "virtio-pci"
> type.
> 
> Allow object_register_sugar_prop() to set this field as well.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> Message-Id: <159738953558.377274.16617742952571083440.stgit@bahia.lan>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo


