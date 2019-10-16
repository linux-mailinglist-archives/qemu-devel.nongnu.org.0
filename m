Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46936D8C1E
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 11:06:16 +0200 (CEST)
Received: from localhost ([::1]:39690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKfG3-0005lA-BJ
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 05:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51279)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iKfAa-0000pj-Uz
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 05:00:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iKfAZ-0007v3-U5
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 05:00:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:30665)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1iKfAZ-0007ut-Od
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 05:00:35 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ACE84A3CD8D;
 Wed, 16 Oct 2019 09:00:34 +0000 (UTC)
Received: from localhost.localdomain (ovpn-117-113.ams2.redhat.com
 [10.36.117.113])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEBDA60C5D;
 Wed, 16 Oct 2019 09:00:32 +0000 (UTC)
Date: Wed, 16 Oct 2019 11:00:31 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Pavel Dovgalyuk <pavel.dovgaluk@gmail.com>
Subject: Re: [PATCH] qapi: add support for blkreplay driver
Message-ID: <20191016090031.GA4940@localhost.localdomain>
References: <157121523944.19602.3366908428295086643.stgit@pasha-Precision-3630-Tower>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <157121523944.19602.3366908428295086643.stgit@pasha-Precision-3630-Tower>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Wed, 16 Oct 2019 09:00:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: armbru@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 dovgaluk@ispras.ru, pavel.dovgaluk@ispras.ru, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 16.10.2019 um 10:40 hat Pavel Dovgalyuk geschrieben:
> This patch adds support for blkreplay driver to the blockdev options.
> Now blkreplay can be used with -blockdev command line option
> in the following format:
> -blockdev driver=blkreplay,image=file-node-name,node-name=replay-node-name
> 
> This option makes possible implementation of the better command
> line support for record/replay invocations.
> 
> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>

Thanks, applied to the block branch.

Kevin

