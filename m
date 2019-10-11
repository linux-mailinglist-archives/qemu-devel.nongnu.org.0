Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DDD9D3C86
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 11:37:56 +0200 (CEST)
Received: from localhost ([::1]:47904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIrMx-00035U-0N
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 05:37:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54060)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iIrLS-0002Dj-6C
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 05:36:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iIrLR-0001Ml-AD
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 05:36:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48876)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iIrLO-0001GY-8O; Fri, 11 Oct 2019 05:36:18 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EF678C049E17;
 Fri, 11 Oct 2019 09:36:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.118.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DCDA3CC8;
 Fri, 11 Oct 2019 09:36:12 +0000 (UTC)
Date: Fri, 11 Oct 2019 11:36:10 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Subject: Re: [PATCH v2 1/4] qemu-iotests: remove bash shebang from library
 files
Message-ID: <20191011093610.GD5158@localhost.localdomain>
References: <20191009194740.8079-1-crosa@redhat.com>
 <20191009194740.8079-2-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009194740.8079-2-crosa@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 11 Oct 2019 09:36:15 +0000 (UTC)
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
Cc: qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.10.2019 um 21:47 hat Cleber Rosa geschrieben:
> Due to not being able to find a reason to have shebangs on files that
> are not executable.
> 
> While at it, add a mode hint to emacs, which would be clueless or
> plain wrong about these containing shell code.

vim still doesn't like the change.

Of course, we could also add another line for vim and for every other
editor in use, but actually, I think I'd prefer just dropping this
patch. It even makes each file a few bytes larger instead of saving
something. Shebang lines are a shorter and more portable format
indicator than the alternatives.

So I think in the end we have found a good reason to keep them. :-)

Kevin

