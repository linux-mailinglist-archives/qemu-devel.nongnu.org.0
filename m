Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 729036AD50
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jul 2019 19:04:12 +0200 (CEST)
Received: from localhost ([::1]:51352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnQs7-0008LX-He
	for lists+qemu-devel@lfdr.de; Tue, 16 Jul 2019 13:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34832)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hnQrr-0007sp-HM
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 13:03:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hnQrq-0000GN-MY
 for qemu-devel@nongnu.org; Tue, 16 Jul 2019 13:03:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36082)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hnQro-0000C8-SQ; Tue, 16 Jul 2019 13:03:52 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2B3D63082D6C;
 Tue, 16 Jul 2019 17:03:52 +0000 (UTC)
Received: from linux.fritz.box (ovpn-117-24.ams2.redhat.com [10.36.117.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A8F05DA34;
 Tue, 16 Jul 2019 17:03:51 +0000 (UTC)
Date: Tue, 16 Jul 2019 19:03:49 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20190716170349.GK7297@linux.fritz.box>
References: <20190703172813.6868-1-mreitz@redhat.com>
 <20190703172813.6868-5-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190703172813.6868-5-mreitz@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 16 Jul 2019 17:03:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 04/12] block: Keep subtree drained in
 drop_intermediate
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

Am 03.07.2019 um 19:28 hat Max Reitz geschrieben:
> bdrv_drop_intermediate() calls BdrvChildRole.update_filename().  That
> may poll, thus changing the graph, which potentially breaks the
> QLIST_FOREACH_SAFE() loop.
> 
> Just keep the whole subtree drained.  This is probably the right thing
> to do anyway (dropping nodes while the subtree is not drained seems
> wrong).
> 
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Reviewed-by: Kevin Wolf <kwolf@redhat.com>

