Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A6D32D585
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 15:42:17 +0100 (CET)
Received: from localhost ([::1]:52376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHpBA-0006rh-J9
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 09:42:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHpA0-000635-Pc
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:41:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lHp9w-0004RE-DG
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 09:41:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614868858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0HO3wg7YxGDt2sho873o2iKK0kUE+i1gf7A26+TTbW4=;
 b=ABdBRmK50YH+eHnNoD3BXUDkVZS09EVz7Te4mcnTEkHLtvfFvVQNlsXipsg4NS28PbtEfe
 cnQadDcRnCZjidZ8eE4o1LzC77RAzo+CTpj4sSFvQhQwO1PejAL3MxW8yJE98t7xax9v5a
 u6dJTZ9sQxPGX5bHVxv5LO6aQb47rSo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-586-gF7yLGvcOz2S8U13goq5NQ-1; Thu, 04 Mar 2021 09:40:57 -0500
X-MC-Unique: gF7yLGvcOz2S8U13goq5NQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE63110866A3;
 Thu,  4 Mar 2021 14:40:54 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-64.ams2.redhat.com [10.36.113.64])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ABEB60CDF;
 Thu,  4 Mar 2021 14:40:47 +0000 (UTC)
Date: Thu, 4 Mar 2021 15:40:46 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v2 0/6] parallels: load bitmap extension
Message-ID: <20210304144046.GE9607@merkur.fritz.box>
References: <20210224104707.88430-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20210224104707.88430-1-vsementsov@virtuozzo.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
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
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 24.02.2021 um 11:47 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Hi all!
> 
> We need to load bitmaps from parallels image in our product.
> So here is a feature.

Thanks, applied to the block branch.

I changed some sentences in patch 2 as suggested in my reply to it.
Please let me know if you're happy with these changes or if you would
like to tweak them a bit more.

Kevin


