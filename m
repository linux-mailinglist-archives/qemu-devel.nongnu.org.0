Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4018C2DC330
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:35:59 +0100 (CET)
Received: from localhost ([::1]:35948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYqM-0004e5-Ae
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:35:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kpYoV-0003j4-8E
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:34:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kpYoQ-0001TI-JX
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:34:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608132837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HvYvpUzBG39dbjrH40JgriRuqaHccdapKZxGS48X1yI=;
 b=YmO3UeaOVDZwRC7nSf1kCBYFkVezvEP3kad6oUZdBE71P6+RRSQRUW/m3B2MlFTi8yosR3
 p+8OAxHfU9d5O8M31akzVbTFvDtfqUTznu++9kGLfHOJtfvYT9DnN7gYXAQ9ww3SVsrkhg
 S0+dJfj7nn4uP636G2B+aAopx1PqzH4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-ploea2IXNZSvaEWfucD7vw-1; Wed, 16 Dec 2020 10:33:55 -0500
X-MC-Unique: ploea2IXNZSvaEWfucD7vw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 325781005504;
 Wed, 16 Dec 2020 15:33:54 +0000 (UTC)
Received: from gondolin (ovpn-113-163.ams2.redhat.com [10.36.113.163])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 170825D71B;
 Wed, 16 Dec 2020 15:33:52 +0000 (UTC)
Date: Wed, 16 Dec 2020 16:33:51 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2] qga/commands-posix: Send CCW address on s390x with
 the fsinfo data
Message-ID: <20201216163351.3012ca99.cohuck@redhat.com>
In-Reply-To: <20201127082353.448251-1-thuth@redhat.com>
References: <20201127082353.448251-1-thuth@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Michael Roth <michael.roth@amd.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Nov 2020 09:23:53 +0100
Thomas Huth <thuth@redhat.com> wrote:

> We need the CCW address on the libvirt side to correctly identify
> the disk, so add this information to the GuestDiskAddress on s390x.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1755075
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  v2: Add missing comment about "subchno" (thanks to Cornelia for spotting this)
> 
>  The libirt part of this fix can be found here:
>  https://www.redhat.com/archives/libvir-list/2020-November/msg01455.html
> 
>  qga/commands-posix.c | 34 ++++++++++++++++++++++++++++++++++
>  qga/qapi-schema.json | 20 +++++++++++++++++++-
>  2 files changed, 53 insertions(+), 1 deletion(-)

Thanks, applied.


