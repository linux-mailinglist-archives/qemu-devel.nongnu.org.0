Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FFC34D298
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 16:42:36 +0200 (CEST)
Received: from localhost ([::1]:38338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQt6A-0000C0-T3
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 10:42:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lQt4m-0007hH-LB
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 10:41:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lQt4j-0006Rd-QL
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 10:41:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617028864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MxVecMN6EVFzaKw28ic3OZp4gd1blB0vRryLBugkN7o=;
 b=N/3Jfmox3K6DENDy4AV+XRh0GlZOQ4NrT0xmIZNPzT7sPCHgWLBMlJX4/thGvGCJfxmAkN
 LoDpIIPwkG5IQCRZVYdi6VuTzD7kzW/v4HlRJZPMXhUzhh4i8Bv4dVDsouKg/tjVZ3GiEt
 l0vj85P7wbViAU0WAQhOpvwgzhUvU1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-CHrX8aX0OFae24P1HyaI9Q-1; Mon, 29 Mar 2021 10:41:02 -0400
X-MC-Unique: CHrX8aX0OFae24P1HyaI9Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD8B1107ACCD;
 Mon, 29 Mar 2021 14:41:00 +0000 (UTC)
Received: from gondolin (ovpn-113-56.ams2.redhat.com [10.36.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 237225D6AB;
 Mon, 29 Mar 2021 14:40:52 +0000 (UTC)
Date: Mon, 29 Mar 2021 16:40:43 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Matthew Rosato <mjrosato@linux.ibm.com>
Subject: Re: [PATCH] MAINTAINERS: add/replace backups for some s390 areas
Message-ID: <20210329164043.686ea47f.cohuck@redhat.com>
In-Reply-To: <1616680509-8339-1-git-send-email-mjrosato@linux.ibm.com>
References: <1616680509-8339-1-git-send-email-mjrosato@linux.ibm.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: jjherne@linux.ibm.com, akrowiak@linux.ibm.com, farman@linux.ibm.com,
 pmorel@linux.ibm.com, qemu-s390x@nongnu.org, thuth@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 alex.williamson@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Mar 2021 09:55:09 -0400
Matthew Rosato <mjrosato@linux.ibm.com> wrote:

> S390 PCI currently has no backup, add one.  Add an additional backup
> for vfio-ccw and refresh the backup for vfio-ap.
> 
> Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
> ---
>  MAINTAINERS | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Thanks everyone!

Queued to both s390-next and s390-fixes (don't know yet which one will
get the next pull request.)


