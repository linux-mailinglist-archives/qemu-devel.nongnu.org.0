Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAA537126F
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 10:27:09 +0200 (CEST)
Received: from localhost ([::1]:58518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldTv2-00079X-Ce
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 04:27:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1ldTtR-0006YN-L9
 for qemu-devel@nongnu.org; Mon, 03 May 2021 04:25:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48449)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1ldTtP-0002Qw-7f
 for qemu-devel@nongnu.org; Mon, 03 May 2021 04:25:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620030324;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=h/0pvFqBC52bZueanR8Oh6SKBDO9Q0Q5k8FNB7JW8Nk=;
 b=NRoVLE7F+OgDrc4029J2m+RggaRj3icI6S9sE1V6TVjsLOhhSTSi0RU5HmUnCq17ujc5hK
 EA/C4SfMWOPip7v6ob9ztCCC4a06ny0OrY+KGPGwKL07lnbmdQWPOLajpWasrX9OfKgntv
 R1DehlphZnf9TWDKT7BGvea3fyrPxW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-IHGysI4KPNuJVvpZ7PJiWQ-1; Mon, 03 May 2021 04:25:22 -0400
X-MC-Unique: IHGysI4KPNuJVvpZ7PJiWQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4AB34107ACF2;
 Mon,  3 May 2021 08:25:21 +0000 (UTC)
Received: from angien.pipo.sk (unknown [10.40.208.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 209B910493D7;
 Mon,  3 May 2021 08:25:14 +0000 (UTC)
Date: Mon, 3 May 2021 10:25:12 +0200
From: Peter Krempa <pkrempa@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH] block: Drop the sheepdog block driver
Message-ID: <YI+zaGShXTnV1VoJ@angien.pipo.sk>
References: <20210501075747.3293186-1-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210501075747.3293186-1-armbru@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kwolf@redhat.com, libvir-list@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, May 01, 2021 at 09:57:47 +0200, Markus Armbruster wrote:
> It was deprecated in commit e1c4269763, v5.2.0.  See that commit
> message for rationale.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  docs/system/deprecated.rst             |    9 -
>  docs/system/device-url-syntax.rst.inc  |   18 -
>  docs/system/qemu-block-drivers.rst.inc |   69 -
>  docs/system/removed-features.rst       |    7 +
>  configure                              |   10 -
>  meson.build                            |    1 -
>  qapi/block-core.json                   |   93 +-
>  qapi/transaction.json                  |    8 +-
>  block/sheepdog.c                       | 3356 ------------------------
>  .gitlab-ci.yml                         |    1 -
>  MAINTAINERS                            |    6 -
>  block/meson.build                      |    1 -
>  block/trace-events                     |   14 -
>  tests/qemu-iotests/005                 |    5 -
>  tests/qemu-iotests/025                 |    2 +-
>  tests/qemu-iotests/check               |    3 +-
>  tests/qemu-iotests/common.rc           |    4 -
>  17 files changed, 14 insertions(+), 3593 deletions(-)
>  delete mode 100644 block/sheepdog.c

Libvirt will need to adjust one test case (lock it to qemu-6.0 test
data), but other than that, this change is okay with us.

ACKed-by: Peter Krempa <pkrempa@redhat.com>


