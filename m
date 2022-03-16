Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BC24DBA3A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 22:37:57 +0100 (CET)
Received: from localhost ([::1]:59746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUbL9-0007jv-Pe
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 17:37:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nUbJn-0006v7-C7
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 17:36:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nUbJk-0000X1-Lh
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 17:36:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647466587;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ElR2/IgWSuLnUzVIHYUgqaXTPCsU7os3uk7hbfRkxQw=;
 b=MPZ73yOpSZc04BP9EMihtWQn7eOy2Wqhzt1y+3NYCnWUmFCzV1mRIEunSKm346svaSXDoF
 RhYmUvBKaaqvHpO+c5MxfM35NPwv3JvhmPz+umud524XsT6gwO8rSqjEgZZpoCmGCFWyNZ
 i9RlJ8W5cr3iRqdAX9U9guaU94uj6+E=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-54-uNvAs3bPMJa1jRV7HexaXQ-1; Wed, 16 Mar 2022 17:36:23 -0400
X-MC-Unique: uNvAs3bPMJa1jRV7HexaXQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B2C0D899EC2;
 Wed, 16 Mar 2022 21:36:22 +0000 (UTC)
Received: from redhat.com (unknown [10.22.33.105])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62B7F2156A5A;
 Wed, 16 Mar 2022 21:36:22 +0000 (UTC)
Date: Wed, 16 Mar 2022 16:36:20 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Subject: Re: [PATCH v2] MAINTAINERS: change Vladimir's email address
Message-ID: <20220316213620.yrc6fvskjqabogoi@redhat.com>
References: <20220316092702.426629-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
In-Reply-To: <20220316092702.426629-1-v.sementsov-og@mail.ru>
User-Agent: NeoMutt/20211029-454-6adf99
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, Mar 16, 2022 at 12:27:02PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> Old vsementsov@virtuozzo.com is not accessible anymore.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
> ---
> 
> v2: @ya.ru mailbox works bad with mailing lists and git send-email
> command, @mail.ru works normally.
> 
> Probably, I'll have to change the email again in the near future. May be
> not. But I think it worth to change it now to something that works.

Same comment as with your attempt with @ya.ru - I'm happy to
incorporate this through my NBD tree, but want to confirm that we had
a round-trip conversation so that you are happy with the address
working to your needs.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


