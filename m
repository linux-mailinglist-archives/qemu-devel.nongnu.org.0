Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C42A3B5C28
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 12:10:50 +0200 (CEST)
Received: from localhost ([::1]:53546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxoE4-0003bu-Nz
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 06:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lxoCH-0002tB-Vm
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 06:08:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lxoC8-0002na-PW
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 06:08:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624874926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+MVF2qVtvbYN/MJfz5vt+N266uCbbbi4166hVr3FJ0c=;
 b=FASjQTd7rfqEQy4Q3PQd/UmMSf3T85o/BUAkutJPSSD2ClWAnskwOLGzf9PoDfO0VdlhHy
 XWuCp5tETzaGt2gqeOcI28VEHLTROO18f0+hUhsXNGspsrP8yf/fQLnu3ksYG/kcvyGkOU
 rEVx9u6QLr4KT3jDkMZFAeUIU0zLjo4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-CaaDRK23ORCh2SQxTh8h_A-1; Mon, 28 Jun 2021 06:08:43 -0400
X-MC-Unique: CaaDRK23ORCh2SQxTh8h_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48A88100CCC8;
 Mon, 28 Jun 2021 10:08:42 +0000 (UTC)
Received: from redhat.com (ovpn-112-137.ams2.redhat.com [10.36.112.137])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F4735D9C6;
 Mon, 28 Jun 2021 10:08:38 +0000 (UTC)
Date: Mon, 28 Jun 2021 12:08:36 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH 0/2] introduce QEMU_AUTO_VFREE
Message-ID: <YNmfpBqNnXF0Mx8x@redhat.com>
References: <20210619142120.48211-1-vsementsov@virtuozzo.com>
 <YNMOJLtbNHh2A/99@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YNMOJLtbNHh2A/99@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.696,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: eesposit@redhat.com, qemu-block@nongnu.org, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, stefanha@redhat.com,
 pbonzini@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 23.06.2021 um 12:34 hat Kevin Wolf geschrieben:
> Am 19.06.2021 um 16:21 hat Vladimir Sementsov-Ogievskiy geschrieben:
> > Hi all!
> > 
> > There is a good movement to use g_autofree macro, that helps to
> > automatically call g_free on exit from code block.
> > 
> > We lack similar possibility for qemu_memalign() functions family. Let's
> > add, it seems rather simple with help of "cleanup" attribute.
> > 
> > I'll update more places with a follow-up if this is accepted.
> 
> Good idea. Thanks, applied to the block branch.

I'm afraid I have to unqueue this:

Failures: 040 141 161 191 249
Failed 5 of 5 iotests

Maybe semantic merge conflicts that I didn't notice while applying or
rebasing.

Kevin


