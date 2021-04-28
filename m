Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFD636DDD4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:06:14 +0200 (CEST)
Received: from localhost ([::1]:35450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbndd-0008LB-T0
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:06:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lbnbM-00072L-BY
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:03:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lbnbJ-0005Pn-LO
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:03:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619629428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1flRRt3jVH+tDHQlOfm5aGNs6n3AoqCdtDDhP+9SmRM=;
 b=AB+7tOf/d098ZG+l7r6dItn6zQg0cyOVWtbfdta/1sWyexqD+Bq4evQvJzRGvA/Nkg1gIC
 qrR0R9ADTtLZTYAuEywIzQhgixvt528a+DPOxpdmYyhDJlvccJnMKRij3V1zHpK/IIuMhn
 c+jK9GUwYz8TWZnuPNxwMwFHgCiry8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-4Z0tzxhWNQiCDxuXxH1i7Q-1; Wed, 28 Apr 2021 13:03:46 -0400
X-MC-Unique: 4Z0tzxhWNQiCDxuXxH1i7Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D26DC189829B;
 Wed, 28 Apr 2021 17:03:44 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-115-9.ams2.redhat.com [10.36.115.9])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 237C95F729;
 Wed, 28 Apr 2021 17:03:30 +0000 (UTC)
Date: Wed, 28 Apr 2021 19:03:29 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 00/36] block: update graph permissions update
Message-ID: <YImVYUQbIZC9T3Pz@merkur.fritz.box>
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210428151804.439460-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: fam@euphon.net, qemu-block@nongnu.org, qemu-devel@nongnu.org,
 armbru@redhat.com, stefanha@redhat.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28.04.2021 um 17:17 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi all!
> 
> And here is v4.

Thanks, applied to the block branch.

Though the error message shown by the test in patch 18 does need some
improvement on top. We should probably name both conflicting users and
who blocks whom in a way that is neutral as to which user is the new
one.

Also, curious that again patch 7 (and only patch 7) got From: mangled by
the mailing list. Seems there is something in it that Mailman doesn't
like?

Kevin


