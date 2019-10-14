Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A028DD5F7D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Oct 2019 11:59:45 +0200 (CEST)
Received: from localhost ([::1]:46366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJx8i-0006CA-O0
	for lists+qemu-devel@lfdr.de; Mon, 14 Oct 2019 05:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37777)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1iJx7T-0005ge-Qw
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 05:58:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1iJx7S-000509-TF
 for qemu-devel@nongnu.org; Mon, 14 Oct 2019 05:58:27 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39939)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1iJx7Q-0004xO-OD; Mon, 14 Oct 2019 05:58:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id ED29610DCCA4;
 Mon, 14 Oct 2019 09:58:23 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.36.118.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CECB65DA2C;
 Mon, 14 Oct 2019 09:58:22 +0000 (UTC)
Date: Mon, 14 Oct 2019 11:58:21 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v2] iotests/028: Fix for long $TEST_DIRs
Message-ID: <20191014095821.GD7173@localhost.localdomain>
References: <20191011121808.3243-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191011121808.3243-1-mreitz@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Mon, 14 Oct 2019 09:58:23 +0000 (UTC)
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 11.10.2019 um 14:18 hat Max Reitz geschrieben:
> For long test image paths, the order of the "Formatting" line and the
> "(qemu)" prompt after a drive_backup HMP command may be reversed.  In
> fact, the interaction between the prompt and the line may lead to the
> "Formatting" to being greppable at all after "read"-ing it (if the
> prompt injects an IFS character into the "Formatting" string).
> 
> So just wait until we get a prompt.  At that point, the block job must
> have been started, so "info block-jobs" will only return "No active
> jobs" once it is done.
> 
> Reported-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Thanks, applied to the block branch.

Kevin

