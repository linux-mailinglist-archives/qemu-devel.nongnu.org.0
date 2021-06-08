Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C9539EFD7
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 09:41:57 +0200 (CEST)
Received: from localhost ([::1]:50834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqWN2-0005Nc-AH
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 03:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lqWM2-0004gJ-Pc
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 03:40:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lqWM1-00017O-4C
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 03:40:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623138052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Or3k2qKi4PhFC7H7eleIBvEETA9pz98z0c4lYI+Z0Ig=;
 b=WmQhHzdCG9nNQ+x05zCRXLaOgaFxmhUWPKAwwbdveRCEVfHZt8xX+CplX3gvG28uTEpqh6
 k9irkqkTBSJ4fyKEcMh9NtuJxnXs+JqXo0PwWJ62JZrMHWOKnGlP0vRl28JINJF/OedSkG
 puqjULfJTbZsree5vieUcwwFM0esdo8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-HiSIF-L7Mg2zGfY11KIlew-1; Tue, 08 Jun 2021 03:40:50 -0400
X-MC-Unique: HiSIF-L7Mg2zGfY11KIlew-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EAB3801B18;
 Tue,  8 Jun 2021 07:40:49 +0000 (UTC)
Received: from localhost (ovpn-113-156.ams2.redhat.com [10.36.113.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AE825D6DC;
 Tue,  8 Jun 2021 07:40:48 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Halil Pasic <pasic@linux.ibm.com>, Christian Borntraeger
 <borntraeger@de.ibm.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] s390x/kvm: remove unused gs handling
In-Reply-To: <20210602125050.492500-1-cohuck@redhat.com>
Organization: Red Hat GmbH
References: <20210602125050.492500-1-cohuck@redhat.com>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 08 Jun 2021 09:40:46 +0200
Message-ID: <878s3kpzwh.fsf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 02 2021, Cornelia Huck <cohuck@redhat.com> wrote:

> With commit 0280b3eb7c05 ("s390x/kvm: use cpu model for gscb on
> compat machines"), we removed any calls to kvm_s390_get_gs()
> in favour of a different mechanism.
>
> Let's remove the unused kvm_s390_get_gs(), and with it the now
> unneeded cap_gs as well.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  target/s390x/kvm-stub.c  |  5 -----
>  target/s390x/kvm.c       | 10 +---------
>  target/s390x/kvm_s390x.h |  1 -
>  3 files changed, 1 insertion(+), 15 deletions(-)

Queued to s390-next.


