Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9AC417BD1
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 21:29:35 +0200 (CEST)
Received: from localhost ([::1]:59804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTqt4-00008w-Jj
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 15:29:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTqju-0004QV-GZ
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:20:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mTqjs-0006fU-EH
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 15:20:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632511203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xOLybh6nrppMrH0wrHJ6H/OlKpHLkGI15TtV3BLLtKU=;
 b=Fx6VlU9Wxx9c6h+r2q4Xwn/S//c4KJDxQb3TjjyPWcRXiPGVOwQzna2JbDbV4Rbt3EFVeV
 B1sBvxFcpYdqAspAu06dnvnMENjaNPswmtPTk7FogMekLM7WMlsdDK7E9hA8odQlNM/1FG
 GkQLCaiMF59TXN4k09IdWh/AbG7HG88=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-_i6MxJoiM7uayfhwkvxMhg-1; Fri, 24 Sep 2021 15:20:00 -0400
X-MC-Unique: _i6MxJoiM7uayfhwkvxMhg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A8741084681;
 Fri, 24 Sep 2021 19:19:59 +0000 (UTC)
Received: from redhat.com (ovpn-115-8.phx2.redhat.com [10.3.115.8])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E246D5FC13;
 Fri, 24 Sep 2021 19:19:58 +0000 (UTC)
Date: Fri, 24 Sep 2021 14:19:57 -0500
From: Eric Blake <eblake@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] nbd/server: Allow LIST_META_CONTEXT without
 STRUCTURED_REPLY
Message-ID: <20210924191957.dml5l22zd6pdsmqb@redhat.com>
References: <20210907173505.1499709-1-eblake@redhat.com>
 <9f559b6c-36ce-5078-4169-c61f2a21124b@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <9f559b6c-36ce-5078-4169-c61f2a21124b@virtuozzo.com>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 14, 2021 at 05:19:42PM +0300, Vladimir Sementsov-Ogievskiy wrote:
> 07.09.2021 20:35, Eric Blake wrote:
> > The NBD protocol just relaxed the requirements on
> > NBD_OPT_LIST_META_CONTEXT:
> > 
> > https://github.com/NetworkBlockDevice/nbd/commit/13a4e33a87
> > 
> > Since listing is not stateful (unlike SET_META_CONTEXT), we don't care
> > if a client asks for meta contexts without first requesting structured
> > replies.  Well-behaved clients will still ask for structured reply
> > first (if for no other reason than for back-compat to older servers),
> > but that's no reason to avoid this change.
> > 
> > Signed-off-by: Eric Blake<eblake@redhat.com>
> 
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks; queuing this one through my NBD tree.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


