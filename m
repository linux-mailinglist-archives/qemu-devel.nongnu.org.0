Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 320918A06D
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Aug 2019 16:12:18 +0200 (CEST)
Received: from localhost ([::1]:45888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxB3Z-0002nn-FD
	for lists+qemu-devel@lfdr.de; Mon, 12 Aug 2019 10:12:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60251)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hxB2R-0001v7-OY
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 10:11:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hxB2Q-0007u3-Te
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 10:11:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46184)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hxB2Q-0007ts-Om
 for qemu-devel@nongnu.org; Mon, 12 Aug 2019 10:11:06 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 21E687E438
 for <qemu-devel@nongnu.org>; Mon, 12 Aug 2019 14:11:06 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E5E4D5C54A
 for <qemu-devel@nongnu.org>; Mon, 12 Aug 2019 14:11:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 673381136444; Mon, 12 Aug 2019 16:11:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
References: <20190802122325.16520-1-armbru@redhat.com>
Date: Mon, 12 Aug 2019 16:11:03 +0200
In-Reply-To: <20190802122325.16520-1-armbru@redhat.com> (Markus Armbruster's
 message of "Fri, 2 Aug 2019 14:23:25 +0200")
Message-ID: <8736i6tqx4.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Mon, 12 Aug 2019 14:11:06 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] qapi: Make visit_next_list()'s comment
 less confusing
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Markus Armbruster <armbru@redhat.com> writes:

> visit_next_list() returns non-null on success, null on failure.  The
> comment's phrasing "until NULL return or error occurs" is needlessly
> confusing.  Scratch the "or error occurs" part.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Queued for 4.2.

