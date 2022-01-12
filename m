Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B5348C95C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 18:28:10 +0100 (CET)
Received: from localhost ([::1]:50814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7hPt-00064Y-L9
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 12:28:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n7h91-0004cq-IW
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:10:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n7h8y-00054i-Tg
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 12:10:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642007440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ydb/3epK+zwrM8C2EGZE9gqqkKj8XQ6XC+dTPPKR+gY=;
 b=PxpNGoVDlVvq4C4wLJhzV3Kc5MVfPHiR3AkFI0fUvApQXok034oVKwYz279WPHMC3XuPNn
 riahayu9Axv4z0CQhTc8LMyo8vcbyhj9MV7D9RZdt9V0nEcmQC7r7t4tlzVca2KDbDjMTl
 J0ATVG/tlfWRAFbn5XSKZIH0dsAoWU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-PAozEYDYM8OqFJO52Xeyng-1; Wed, 12 Jan 2022 12:10:34 -0500
X-MC-Unique: PAozEYDYM8OqFJO52Xeyng-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F22CD190B2A1;
 Wed, 12 Jan 2022 17:10:32 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.78])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 32A1826DE0;
 Wed, 12 Jan 2022 17:10:25 +0000 (UTC)
Date: Wed, 12 Jan 2022 18:10:23 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2] block: drop BLK_PERM_GRAPH_MOD
Message-ID: <Yd8Lf47yR326E+x9@redhat.com>
References: <20210902093754.2352-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210902093754.2352-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ehabkost@redhat.com, qemu-block@nongnu.org, jsnow@redhat.com,
 armbru@redhat.com, qemu-devel@nongnu.org, hreitz@redhat.com, crosa@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 02.09.2021 um 11:37 hat Vladimir Sementsov-Ogievskiy geschrieben:
> First, this permission never protected a node from being changed, as
> generic child-replacing functions don't check it.
> 
> Second, it's a strange thing: it presents a permission of parent node
> to change its child. But generally, children are replaced by different
> mechanisms, like jobs or qmp commands, not by nodes.
> 
> Graph-mod permission is hard to understand. All other permissions
> describe operations which done by parent node on its child: read,
> write, resize. Graph modification operations are something completely
> different.
> 
> The only place where BLK_PERM_GRAPH_MOD is used as "perm" (not shared
> perm) is mirror_start_job, for s->target. Still modern code should use
> bdrv_freeze_backing_chain() to protect from graph modification, if we
> don't do it somewhere it may be considered as a bug. So, it's a bit
> risky to drop GRAPH_MOD, and analyzing of possible loss of protection
> is hard. But one day we should do it, let's do it now.
> 
> One more bit of information is that locking the corresponding byte in
> file-posix doesn't make sense at all.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks, applied to the block branch.

Kevin


