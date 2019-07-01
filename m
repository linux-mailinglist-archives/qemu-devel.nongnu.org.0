Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFED45464
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 07:58:22 +0200 (CEST)
Received: from localhost ([::1]:48604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbfEE-0002Aa-2M
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 01:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47107)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hbfCH-0001K0-G3
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 01:56:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hbfCG-0007UM-Lu
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 01:56:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47992)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1hbf7O-0002P5-Nz; Fri, 14 Jun 2019 01:51:18 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C9658308FC4D;
 Fri, 14 Jun 2019 05:51:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
 [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7128460466;
 Fri, 14 Jun 2019 05:51:15 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 05D2E11386A6; Fri, 14 Jun 2019 07:51:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
References: <20190613153405.24769-1-kwolf@redhat.com>
 <20190613153405.24769-6-kwolf@redhat.com>
Date: Fri, 14 Jun 2019 07:51:13 +0200
In-Reply-To: <20190613153405.24769-6-kwolf@redhat.com> (Kevin Wolf's message
 of "Thu, 13 Jun 2019 17:33:55 +0200")
Message-ID: <87o930iujy.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Fri, 14 Jun 2019 05:51:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v3 05/15] monitor: Remove Monitor.cmd_table
 indirection
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf <kwolf@redhat.com> writes:

> Monitor.cmd_table is initialised to point to mon_cmds and never changed
> afterwards. We can remove the indirection and just reference mon_cmds
> directly instead.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>

