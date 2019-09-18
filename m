Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9537FB6E88
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Sep 2019 22:56:00 +0200 (CEST)
Received: from localhost ([::1]:35222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iAgzX-0001UM-JH
	for lists+qemu-devel@lfdr.de; Wed, 18 Sep 2019 16:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47151)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mlevitsk@redhat.com>) id 1iAgwK-0006UV-N9
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 16:52:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mlevitsk@redhat.com>) id 1iAgwJ-0008UW-GR
 for qemu-devel@nongnu.org; Wed, 18 Sep 2019 16:52:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56376)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mlevitsk@redhat.com>)
 id 1iAgwG-0008RP-1F; Wed, 18 Sep 2019 16:52:36 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1FCF5307D88C;
 Wed, 18 Sep 2019 20:52:34 +0000 (UTC)
Received: from maximlenovopc.usersys.redhat.com (unknown [10.35.206.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 344805D6A5;
 Wed, 18 Sep 2019 20:52:30 +0000 (UTC)
Message-ID: <5811ddb09b1e23e32cc7abe16610d2e28798f635.camel@redhat.com>
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Max Reitz <mreitz@redhat.com>, qemu-block@nongnu.org
Date: Wed, 18 Sep 2019 23:52:29 +0300
In-Reply-To: <20190918095144.955-9-mreitz@redhat.com>
References: <20190918095144.955-1-mreitz@redhat.com>
 <20190918095144.955-9-mreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Wed, 18 Sep 2019 20:52:34 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 8/8] Revert "qemu-img: Check
 post-truncation size"
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2019-09-18 at 11:51 +0200, Max Reitz wrote:
> This reverts commit 5279b30392da7a3248b320c75f20c61e3a95863c.
> 
> We no longer need this check because exact=true forces the block driver
> to give the image the exact size requested by the user.

Looks very good to me.

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>
Best regards,
	Maxim Levitsky


