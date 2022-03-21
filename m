Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230014E3191
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 21:14:39 +0100 (CET)
Received: from localhost ([::1]:59210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWOQI-0004h1-89
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 16:14:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWOOi-0003rD-OW
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:13:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWOOh-00010o-D2
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:13:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647893578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LNGX4fytKKzZ9TNoGPl/p/nsMuHWEyLwjMJ8WdIkYZE=;
 b=BVkYkQJC6JsMwS5WywrUhMGhdeIK/VwevICYQlQjlxeTUAQW4UtbYd7u6IBljiyjPXXrN1
 rZbMteUAgCikcP2nEpM7uR+XBwmd0tQZWXCBXzIYgPVHNiHFVultSi8mp9I+LPPBdrb2Jr
 ACMRWREuDJsecImnMAB0FIvGUeEMahw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-301-CLoKWfRtNH6jp9E7b2DlHg-1; Mon, 21 Mar 2022 16:12:53 -0400
X-MC-Unique: CLoKWfRtNH6jp9E7b2DlHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7239E2999B2D;
 Mon, 21 Mar 2022 20:12:53 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14502400F721;
 Mon, 21 Mar 2022 20:12:53 +0000 (UTC)
Date: Mon, 21 Mar 2022 15:12:51 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Subject: Re: [PATCH v2] MAINTAINERS: change Vladimir's email address
Message-ID: <20220321201251.ohhzthftzmijihf2@redhat.com>
References: <20220316092702.426629-1-v.sementsov-og@mail.ru>
 <20220316213620.yrc6fvskjqabogoi@redhat.com>
 <3e0a174c-71e1-2308-855e-0cc9102a8ee0@mail.ru>
MIME-Version: 1.0
In-Reply-To: <3e0a174c-71e1-2308-855e-0cc9102a8ee0@mail.ru>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 17, 2022 at 11:24:28AM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 17.03.2022 00:36, Eric Blake wrote:
> > On Wed, Mar 16, 2022 at 12:27:02PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> > > Old vsementsov@virtuozzo.com is not accessible anymore.
> > > 
> > > Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
> > > ---
> > > 
> > > v2: @ya.ru mailbox works bad with mailing lists and git send-email
> > > command, @mail.ru works normally.
> > > 
> > > Probably, I'll have to change the email again in the near future. May be
> > > not. But I think it worth to change it now to something that works.
> > 
> > Same comment as with your attempt with @ya.ru - I'm happy to
> > incorporate this through my NBD tree, but want to confirm that we had
> > a round-trip conversation so that you are happy with the address
> > working to your needs.
> > 
> 
> It works)

Okay, I'm queueing this up through my NBD tree.  Do you also want to
tweak .mailmap and/or contrib/gitdm/aliases?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


