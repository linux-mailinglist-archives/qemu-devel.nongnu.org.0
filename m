Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D1442429A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:27:18 +0200 (CEST)
Received: from localhost ([::1]:35096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY9lF-0005Pi-Ck
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mY9RP-0000ey-U4
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:06:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mY9RM-0004v0-RA
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633536402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z7RZPon2xHpHmByrI8iogx4+csib6GYlLCdiGRK5V6g=;
 b=LEGGDLKgsuyhTMqXB5UfMfZY2FR9e6auBDW3zkP0VxrgVqACRCMTxTuTv13mty2sdymyi9
 DbuJqVj77ba4BMiYbpn9heAJAaaeTpm4JePmZs/Y7TGqFXGp7e7y2xmr6wj03nJO2TBvza
 9IS/2Z3aeAqHq/JFW47eFxed6BNldGg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-214-XncpLgasOA-Fqry5qWek8w-1; Wed, 06 Oct 2021 12:06:41 -0400
X-MC-Unique: XncpLgasOA-Fqry5qWek8w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DB9A1922960;
 Wed,  6 Oct 2021 16:06:40 +0000 (UTC)
Received: from redhat.com (ovpn-113-79.phx2.redhat.com [10.3.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 305CA5C1A1;
 Wed,  6 Oct 2021 16:06:37 +0000 (UTC)
Date: Wed, 6 Oct 2021 11:06:35 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 05/12] block-backend: rename _do_ helper functions to
 _co_do_
Message-ID: <20211006160635.3imvf7lviqrvyowr@redhat.com>
References: <20211006131718.214235-1-vsementsov@virtuozzo.com>
 <20211006131718.214235-6-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20211006131718.214235-6-vsementsov@virtuozzo.com>
User-Agent: NeoMutt/20210205-815-1dd940
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, ehabkost@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, hreitz@redhat.com, stefanha@redhat.com,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Oct 06, 2021 at 03:17:11PM +0200, Vladimir Sementsov-Ogievskiy wrote:
> This is a preparation to the following commit, to use automatic
> coroutine wrapper generation.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>  block/block-backend.c | 52 +++++++++++++++++++++----------------------
>  1 file changed, 26 insertions(+), 26 deletions(-)
>

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


