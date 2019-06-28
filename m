Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55D1959E7B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 17:11:40 +0200 (CEST)
Received: from localhost ([::1]:33036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgsXL-0006QA-G0
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 11:11:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48985)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hgsLc-0008Qs-M4
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 10:59:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hgsLb-0002Tt-1A
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 10:59:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:7749)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hgsLX-0002QX-4G; Fri, 28 Jun 2019 10:59:27 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 61760821C3;
 Fri, 28 Jun 2019 14:59:26 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE5475DA96;
 Fri, 28 Jun 2019 14:59:22 +0000 (UTC)
Date: Fri, 28 Jun 2019 16:59:21 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: jdillama@redhat.com
Message-ID: <20190628145921.GO5179@dhcp-200-226.str.redhat.com>
References: <20190628135508.8013-1-dillaman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190628135508.8013-1-dillaman@redhat.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Fri, 28 Jun 2019 14:59:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] MAINTAINERS: update RBD block maintainer
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
Cc: jdurgin@redhat.com, Jason Dillaman <dillaman@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 28.06.2019 um 15:55 hat jdillama@redhat.com geschrieben:
> From: Jason Dillaman <dillaman@redhat.com>
> 
> Remove Josh as per his request since he is no longer the upstream RBD
> tech lead. Add myself as the maintainer since I am the current RBD tech
> lead.
> 
> Signed-off-by: Jason Dillaman <dillaman@redhat.com>

Thanks, applied to the block branch.

Kevin

