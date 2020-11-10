Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 834662AD5DA
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 13:05:36 +0100 (CET)
Received: from localhost ([::1]:41774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcSP1-0005Gq-4c
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 07:05:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kcSNK-0004kV-LB
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:03:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kcSNH-0004tV-FF
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 07:03:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605009823;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xb5NDBYolxZDBZGyeWCqauLRVuynEynXiKgHa0bzNjI=;
 b=gnI/NOrBza3rqBLLUq7j2nbrlXoIvXJJaA7KD0NlWiDBWa+tOKRgo2w+JVD8FOemofxLm5
 j+5PwfOSFPajCc75JEV6I7QQLa867FkpjkNBNHh2t/N52Qe0fUz8xo2NyuIREO4MEAvdj6
 IUvRCsFaOA+izBHB6X+ZLFHJBwcCzcc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-vw_7oHk7NP2Otl4GVW_I1g-1; Tue, 10 Nov 2020 07:03:41 -0500
X-MC-Unique: vw_7oHk7NP2Otl4GVW_I1g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19F451009E37;
 Tue, 10 Nov 2020 12:03:40 +0000 (UTC)
Received: from gondolin (ovpn-112-243.ams2.redhat.com [10.36.112.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5CB5C4149;
 Tue, 10 Nov 2020 12:03:35 +0000 (UTC)
Date: Tue, 10 Nov 2020 13:03:14 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [RFC PATCH for-QEMU-5.2] vfio: Make migration support experimental
Message-ID: <20201110130314.5621be1c.cohuck@redhat.com>
In-Reply-To: <160494787833.1473.10514376876696596117.stgit@gimli.home>
References: <160494787833.1473.10514376876696596117.stgit@gimli.home>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Neo Jia <cjia@nvidia.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 09 Nov 2020 11:56:02 -0700
Alex Williamson <alex.williamson@redhat.com> wrote:

> Per the proposed documentation for vfio device migration:
>=20
>   Dirty pages are tracked when device is in stop-and-copy phase
>   because if pages are marked dirty during pre-copy phase and
>   content is transfered from source to destination, there is no
>   way to know newly dirtied pages from the point they were copied
>   earlier until device stops. To avoid repeated copy of same
>   content, pinned pages are marked dirty only during
>   stop-and-copy phase.
>=20
> Essentially, since we don't have hardware dirty page tracking for
> assigned devices at this point, we consider any page that is pinned
> by an mdev vendor driver or pinned and mapped through the IOMMU to
> be perpetually dirty.  In the worst case, this may result in all of
> guest memory being considered dirty during every iteration of live
> migration.  The current vfio implementation of migration has chosen
> to mask device dirtied pages until the final stages of migration in
> order to avoid this worst case scenario.
>=20
> Allowing the device to implement a policy decision to prioritize
> reduced migration data like this jeopardizes QEMU's overall ability
> to implement any degree of service level guarantees during migration.
> For example, any estimates towards achieving acceptable downtime
> margins cannot be trusted when such a device is present.  The vfio
> device should participate in dirty page tracking to the best of its
> ability throughout migration, even if that means the dirty footprint
> of the device impedes migration progress, allowing both QEMU and
> higher level management tools to decide whether to continue the
> migration or abort due to failure to achieve the desired behavior.
>=20
> Link: https://lists.gnu.org/archive/html/qemu-devel/2020-11/msg00807.html
> Cc: Kirti Wankhede <kwankhede@nvidia.com>
> Cc: Neo Jia <cjia@nvidia.com>
> Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Cc: Juan Quintela <quintela@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
>=20
> Given that our discussion in the link above seems to be going in
> circles, I'm afraid it seems necessary to both have a contigency
> plan and to raise the visibility of the current behavior to
> determine whether others agree that this is a sufficiently
> troubling behavior to consider migration support experimental
> at this stage.  Please voice your opinion or contribute patches
> to resolve this before QEMU 5.2.  Thanks,
>=20
> Alex
>=20
>  hw/vfio/migration.c           |    2 +-
>  hw/vfio/pci.c                 |    2 ++
>  include/hw/vfio/vfio-common.h |    1 +
>  3 files changed, 4 insertions(+), 1 deletion(-)

Given the ongoing discussions, I'd be rather more comfortable making
this experimental for the upcoming release and spent some time getting
this into a state that everyone is happy to live with, so

Acked-by: Cornelia Huck <cohuck@redhat.com>


