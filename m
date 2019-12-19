Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 391641260CD
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 12:28:58 +0100 (CET)
Received: from localhost ([::1]:39474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihtyu-0006Mt-OG
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 06:28:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46706)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1ihty6-0005tL-Be
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 06:27:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1ihty3-0007dQ-NY
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 06:27:44 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:32032
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1ihty3-0007Xz-Cr
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 06:27:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576754862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6YaXRmLc443fQa0ogmuVLrUNTlG1WF+VbmYYqgMVBjU=;
 b=URVkX/GG/AgFtia0GEL7mINePaOaIxW8rZCBuSot9P2FSA04WPjjJVS7btka3r1eiHtdYY
 XgMa4CVDrAuWJ5aYgFaW/gLKUc31Rqbi0FsrmSaciR1nbAPlskSkO6TTynqzRRdZMETgJU
 2foKGvlPZ1Y0bid/e4MTi6J7MH30vYQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-6i1ltKW3PL-imCG3UT-zgw-1; Thu, 19 Dec 2019 06:27:39 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 030B8189CD0A;
 Thu, 19 Dec 2019 11:27:38 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-53.ams2.redhat.com [10.36.117.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D9F427D938;
 Thu, 19 Dec 2019 11:27:36 +0000 (UTC)
Date: Thu, 19 Dec 2019 12:27:35 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH] MAINTAINERS: fix qcow2-bitmap.c under Dirty Bitmaps header
Message-ID: <20191219112735.GF5230@linux.fritz.box>
References: <20191219101603.25508-1-vsementsov@virtuozzo.com>
MIME-Version: 1.0
In-Reply-To: <20191219101603.25508-1-vsementsov@virtuozzo.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 6i1ltKW3PL-imCG3UT-zgw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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

Am 19.12.2019 um 11:16 hat Vladimir Sementsov-Ogievskiy geschrieben:
> Somehow I wrote not full path to the file. Fix that.
>=20
> Also, while being here, rearrange entries, so that includes go first,
> then block, than migration, than util.
>=20
> Fixes: 052db8e71444d
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Thanks, applied to the block branch.

Kevin


