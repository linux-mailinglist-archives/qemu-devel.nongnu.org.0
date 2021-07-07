Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 158433BE3FD
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 09:53:15 +0200 (CEST)
Received: from localhost ([::1]:57516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m12Ms-0000vs-3R
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 03:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m12Lc-0007tg-UT
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 03:51:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m12Lb-0001zV-DH
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 03:51:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625644314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2TnAA/t6dqpkHKn0rMh4a+j2vWVuE3a2iJOXQ/9Efog=;
 b=WUc4+1IDUAzo4fZQOYRu4DvyHR26kFU4zdSas1h1iCSpeK/eRN7rlOtYQPXcpuh/MuiJrL
 jXbgC3WIdP/sLK5X/5434tDmVbYI2vUrUDbCsStWvi6V/s2r854y4/Klt3UmIsfvfEMoft
 gZJesKpKlTzIrJV9ZX1FLF3SFlZGdNA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-JAi8kB1UO-iNvp3WJeoJiw-1; Wed, 07 Jul 2021 03:51:51 -0400
X-MC-Unique: JAi8kB1UO-iNvp3WJeoJiw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F732100CA89;
 Wed,  7 Jul 2021 07:51:50 +0000 (UTC)
Received: from redhat.com (ovpn-112-88.ams2.redhat.com [10.36.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C60160843;
 Wed,  7 Jul 2021 07:51:48 +0000 (UTC)
Date: Wed, 7 Jul 2021 09:51:47 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Or Ozeri <oro@il.ibm.com>
Subject: Re: [PATCH v1] block/raw-format: implement .bdrv_get_specific_info
 handler
Message-ID: <YOVdE/7VLcyE0/P/@redhat.com>
References: <20210707053543.2521677-1-oro@il.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210707053543.2521677-1-oro@il.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: berrange@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 to.my.trociny@gmail.com, idryomov@gmail.com, dannyh@il.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.07.2021 um 07:35 hat Or Ozeri geschrieben:
> When using the raw format, allow exposing specific info by the underlying storage.
> In particular, this will enable RBD images using the raw format to indicate
> a LUKS2 encrypted image in the output of qemu-img info.
> 
> Signed-off-by: Or Ozeri <oro@il.ibm.com>

This doesn't feel right because it would introduce an inconsistency
(drivers are supposed to return information about their layer, and all
drivers except raw would still do so) and therefore wouldn't even solve
the full problem: For non-raw images, the information isn't any less
useful, but it still wouldn't be available.

I believe the information is already available in QMP, using
query-named-block-nodes, because then you get a separate BlockDeviceInfo
(which contains ImageInfoSpecific) for each node, including the protocol
node.

So maybe what we need to do is change qemu-img to iterate the node chain
(possibly using bdrv_primary_bs()) and print the ImageInfoSpecific for
each layer if it's present, while indicating which part is for which
layer.

So the output could look like this:

...
Driver specific information (qcow2):
    compat: 0.10
    compression type: zlib
    refcount bits: 16
Driver specific information (rbd):
    encryption format: luks

Kevin


