Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7082CEE7D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 13:58:29 +0100 (CET)
Received: from localhost ([::1]:38532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klAfL-000872-R5
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 07:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1klAeL-0007TN-KZ
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 07:57:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1klAeH-0007dI-Ov
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 07:57:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607086640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=e2n1oh4DvD0ZoyVsf8H0hUYTOFg8vSGC6lf8R25dVKo=;
 b=PFg5itv84ZrBmO1apzLdcQpdELMqbd699BPc1MPeOMNMLqmdrLP4q7s7yuAf5AGvQpNA0v
 mfZEX4MCE+Bm6gz/vkERRbsWbsKizPUEKYHlBZJxOk9xhCQGnwpwvpJcp6jC1/lelFu/nX
 Ax8UT1douh06USa7uJsKDjjY5yhCvwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-HW980yUnOJG3P3Gk44aoFw-1; Fri, 04 Dec 2020 07:57:18 -0500
X-MC-Unique: HW980yUnOJG3P3Gk44aoFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 262D1107ACE4;
 Fri,  4 Dec 2020 12:57:15 +0000 (UTC)
Received: from gondolin (ovpn-113-97.ams2.redhat.com [10.36.113.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1F38F60C17;
 Fri,  4 Dec 2020 12:57:04 +0000 (UTC)
Date: Fri, 4 Dec 2020 13:57:02 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [for-6.0 v5 01/13] qom: Allow optional sugar props
Message-ID: <20201204135702.3b4a0b5f.cohuck@redhat.com>
In-Reply-To: <20201204054415.579042-2-david@gibson.dropbear.id.au>
References: <20201204054415.579042-1-david@gibson.dropbear.id.au>
 <20201204054415.579042-2-david@gibson.dropbear.id.au>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pair@us.ibm.com, brijesh.singh@amd.com, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 frankja@linux.ibm.com, david@redhat.com, mdroth@linux.vnet.ibm.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, thuth@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, dgilbert@redhat.com,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org, rth@twiddle.net,
 berrange@redhat.com, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  4 Dec 2020 16:44:03 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

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
> ---
>  include/qom/object.h |  3 ++-
>  qom/object.c         |  4 +++-
>  softmmu/vl.c         | 16 ++++++++++------
>  3 files changed, 15 insertions(+), 8 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>


