Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7824B39290
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 18:55:08 +0200 (CEST)
Received: from localhost ([::1]:49586 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZI8x-0000yU-Me
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 12:55:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48371)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hZGgg-0003sp-LK
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:21:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hZGgf-0001uZ-Fm
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:21:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34466)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hZGgf-0001sG-5k
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:21:49 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D1202300BCE9
 for <qemu-devel@nongnu.org>; Fri,  7 Jun 2019 15:21:45 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
 [10.36.116.148])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D83B1001B00
 for <qemu-devel@nongnu.org>; Fri,  7 Jun 2019 15:21:44 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2E93E11386A0; Fri,  7 Jun 2019 17:21:38 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
References: <20190523143508.25387-1-armbru@redhat.com>
Date: Fri, 07 Jun 2019 17:21:38 +0200
In-Reply-To: <20190523143508.25387-1-armbru@redhat.com> (Markus Armbruster's
 message of "Thu, 23 May 2019 16:35:04 +0200")
Message-ID: <874l51a0al.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 07 Jun 2019 15:21:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/4] Cleanups around qemu-common.h
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

> qemu-common.h stipulates:
>
>  * If a header file uses a definition from qemu-common.h, that definition
>  * must be moved to a separate header file, and the header that uses it
>  * must include that header.
>
> I count 117 violations of that rule.  This series fixes them.  It also
> reduces the number of objects depending on qemu-common.h in my
> "everything" build from roughly 5800 out of 6500 to less than 600.
>
> I used my "[RFC v4 0/7] Baby steps towards saner headers" to check
> properly self-contained headers remain self-contained.

Queued.

