Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891E5445AA3
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 20:39:48 +0100 (CET)
Received: from localhost ([::1]:34240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miiaR-0008Ng-A2
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 15:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1miiZK-0007XX-7v
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 15:38:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1miiZH-0006Wv-22
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 15:38:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636054712;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kGL6GsmV+WyfTerHM7enZu36ifkYCt8A63C7byiHkw0=;
 b=dIOceNvDd3/b3nW2WPM7x7BlW+VLfZhCu9hZB+FoXWhcVkvvulOlUXjl8V+FYuAK36RZ6D
 hpdZBz+iEUM29PqCNHSsza37JPmU+aCK68+wvkecNgOAiIUjF6whs1rnNO3OtWW0KgCpFL
 ZFf0KjhOxX26ImcNtmSWnds8szF2wRM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-E223DiRTP9av8ntjbIkB5g-1; Thu, 04 Nov 2021 15:38:29 -0400
X-MC-Unique: E223DiRTP9av8ntjbIkB5g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54221800053;
 Thu,  4 Nov 2021 19:38:28 +0000 (UTC)
Received: from redhat.com (ovpn-112-104.phx2.redhat.com [10.3.112.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CA5AC5F4ED;
 Thu,  4 Nov 2021 19:38:17 +0000 (UTC)
Date: Thu, 4 Nov 2021 14:38:16 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v3 3/3] qapi: deprecate drive-backup
Message-ID: <20211104193816.4qybfnrmdh4vi7a2@redhat.com>
References: <20211103132912.1977438-1-vsementsov@virtuozzo.com>
 <20211103132912.1977438-4-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211103132912.1977438-4-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20211029-10-fe244a
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, kchamart@redhat.com, libvir-list@redhat.com,
 wencongyang2@huawei.com, xiechanglong.d@gmail.com, qemu-devel@nongnu.org,
 armbru@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 03, 2021 at 02:29:12PM +0100, Vladimir Sementsov-Ogievskiy wrote:
> Modern way is using blockdev-add + blockdev-backup, which provides a
> lot more control on how target is opened.
> 

> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Kashyap Chamarthy <kchamart@redhat.com>
> ---
>  docs/about/deprecated.rst              | 11 ++++++
>  docs/interop/live-block-operations.rst | 47 +++++++++++++++++---------
>  qapi/block-core.json                   |  5 ++-
>  3 files changed, 46 insertions(+), 17 deletions(-)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 25b7ec8d92..4a4910143f 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -234,6 +234,17 @@ single ``bitmap``, the new ``block-export-add`` uses a list of ``bitmaps``.
>  Member ``values`` in return value elements with meta-type ``enum`` is
>  deprecated.  Use ``members`` instead.
>  
> +``drive-backup`` (since 6.2)
> +''''''''''''''''''''''''''''

Correct here,...

> +++ b/docs/interop/live-block-operations.rst

>  
>  QMP invocation for ``drive-backup``
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  
> +Note that ``drive-backup`` command is deprecated since QEMU 6.1 and
> +will be removed in future.

...but stale here (this patch has been around for a while).

But even though we're in soft freeze, I lean toward this going in
rather than wait yet another release to do the deprecation.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


