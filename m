Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD577BC293
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Sep 2019 09:27:11 +0200 (CEST)
Received: from localhost ([::1]:41858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCfE6-00086u-UR
	for lists+qemu-devel@lfdr.de; Tue, 24 Sep 2019 03:27:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39379)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iCfCl-0007N8-Cl
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 03:25:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iCfCk-0001g8-BL
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 03:25:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56566)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iCfCk-0001ft-6C
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 03:25:46 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7C459301D67F;
 Tue, 24 Sep 2019 07:25:45 +0000 (UTC)
Received: from redhat.com (ovpn-117-109.ams2.redhat.com [10.36.117.109])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D845A60F9E;
 Tue, 24 Sep 2019 07:25:41 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert \(git\)" <dgilbert@redhat.com>
Subject: Re: [PATCH 2/2] tests/migration/postcopy: trim migration bandwidth
In-Reply-To: <20190923131022.15498-3-dgilbert@redhat.com> (David Alan
 Gilbert's message of "Mon, 23 Sep 2019 14:10:22 +0100")
References: <20190923131022.15498-1-dgilbert@redhat.com>
 <20190923131022.15498-3-dgilbert@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Tue, 24 Sep 2019 09:25:39 +0200
Message-ID: <87mueu40lo.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Tue, 24 Sep 2019 07:25:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
Reply-To: quintela@redhat.com
Cc: thuth@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> On slow hosts with tcg we were sometimes finding that the migration
> would complete during precopy and never get into the postcopy test.
> Trim back the bandwidth a bit to make that much less likely.
>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>



