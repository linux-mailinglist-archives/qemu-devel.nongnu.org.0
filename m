Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 045A83EDF08
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 23:06:01 +0200 (CEST)
Received: from localhost ([::1]:49530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFjnz-00039X-VY
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 17:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mFjlp-0001ZP-1W
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:03:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mFjlm-00036o-Nz
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629147821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pgzuZVMIuGK0gWweyiA7Cbm8kwbPz+OcgoBgiqfM4QU=;
 b=UZt8yV+5gh5Z/lpAodKzrJ+JNOLnYczW5GLOjE3W0crbA6qxduA4hMmGsPaAkSsNKyZeG5
 lyeZnImmqP0GKu8L/PbjVvWvvUe07WtuLsKMfF7GqSK8a7viywjCnrhV+V1g1UPQ56Wc+J
 GxwiBElHbcgPq0EowxJQXJuqheP9L9o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-556-Ntqksru6OLimVwoHz_5mBg-1; Mon, 16 Aug 2021 17:03:39 -0400
X-MC-Unique: Ntqksru6OLimVwoHz_5mBg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 583F08042EF;
 Mon, 16 Aug 2021 21:03:38 +0000 (UTC)
Received: from redhat.com (ovpn-113-125.phx2.redhat.com [10.3.113.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DFDA069CBC;
 Mon, 16 Aug 2021 21:03:37 +0000 (UTC)
Date: Mon, 16 Aug 2021 16:03:36 -0500
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH] qemu-storage-daemon: Only display FUSE help when FUSE is
 built-in
Message-ID: <20210816210336.zbzqhia6ewdugapa@redhat.com>
References: <20210816180442.2000642-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210816180442.2000642-1-philmd@redhat.com>
User-Agent: NeoMutt/20210205-719-68949a
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qing Wang <qinwang@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 16, 2021 at 08:04:42PM +0200, Philippe Mathieu-Daudé wrote:
> When configuring QEMU with --disable-fuse, the qemu-storage-daemon
> still reports FUSE command line options in its help:
> 
>   $ qemu-storage-daemon -h
>   Usage: qemu-storage-daemon [options]
>   QEMU storage daemon
> 
>     --export [type=]fuse,id=<id>,node-name=<node-name>,mountpoint=<file>
>              [,growable=on|off][,writable=on|off]
>                            export the specified block node over FUSE
> 
> Remove this help message when FUSE is disabled, to avoid:
> 
>   $ qemu-storage-daemon --export fuse
>   qemu-storage-daemon: --export fuse: Invalid parameter 'fuse'
> 
> Reported-by: Qing Wang <qinwang@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  storage-daemon/qemu-storage-daemon.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


