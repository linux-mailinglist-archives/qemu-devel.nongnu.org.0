Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2141E48DCC5
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 18:20:03 +0100 (CET)
Received: from localhost ([::1]:35790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n83la-0002kw-4X
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 12:20:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n83dG-0001xN-3k
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:11:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n83d8-0007R2-Gb
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 12:11:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642093876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TE84rkosbB5ed9Vb9cNbaOwzPf0ahro+AWYlRDBs55w=;
 b=RjIc7egyHI8ef9yvd9t9EI6V5/NxeKun3KOF0UrEGwzNzPdnoRaFAGMuJCjY2VrM6kvFBj
 PyFa8ygPEfkv3Jl+lmFS/xsyfCzQh3gwJ4PSRt7/wT3DfNwVjFHzea7xJGDBb4arkjtg5j
 vs3TzKcZtEartsVbFuNV+an+irtq2Dk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-650-DYAjqXh0OgSHICKE25MDGg-1; Thu, 13 Jan 2022 12:11:13 -0500
X-MC-Unique: DYAjqXh0OgSHICKE25MDGg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 372B5835E23;
 Thu, 13 Jan 2022 17:11:12 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 522242E180;
 Thu, 13 Jan 2022 17:11:07 +0000 (UTC)
Date: Thu, 13 Jan 2022 18:11:05 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] iotests/testrunner.py: refactor test_field_width
Message-ID: <YeBdKQ6FLOXrR89e@redhat.com>
References: <20211210201450.101576-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211210201450.101576-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: hreitz@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.12.2021 um 21:14 hat Vladimir Sementsov-Ogievskiy geschrieben:
> A lot of Optional[] types doesn't make code beautiful.
> test_field_width defaults to 8, but that is never used in the code.
> 
> More over, if we want some default behavior for single call of
> test_run(), it should just print the whole test name, not limiting or
> expanding its width, so 8 is bad default.
> 
> So, just drop the default as unused for now.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks, applied to the block branch.

Kevin


