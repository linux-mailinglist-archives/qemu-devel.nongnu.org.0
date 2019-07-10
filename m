Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0947161B8A
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Jul 2019 10:06:51 +0200 (CEST)
Received: from localhost ([::1]:39250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkOfi-0006wk-7k
	for lists+qemu-devel@lfdr.de; Mon, 08 Jul 2019 04:06:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53822)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hkOe2-0005uq-Km
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 04:05:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hkOe1-0003oC-NU
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 04:05:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58588)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1hkOe1-0003nz-Hp
 for qemu-devel@nongnu.org; Mon, 08 Jul 2019 04:05:05 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E00583082E44
 for <qemu-devel@nongnu.org>; Mon,  8 Jul 2019 08:05:04 +0000 (UTC)
Received: from redhat.com (unknown [10.36.118.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 231945D70D;
 Mon,  8 Jul 2019 08:05:01 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
In-Reply-To: <20190708072437.3339-3-marcandre.lureau@redhat.com>
 (=?utf-8?Q?=22Marc-Andr=C3=A9?=
 Lureau"'s message of "Mon, 8 Jul 2019 11:24:36 +0400")
References: <20190708072437.3339-1-marcandre.lureau@redhat.com>
 <20190708072437.3339-3-marcandre.lureau@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Mon, 08 Jul 2019 10:04:59 +0200
Message-ID: <87wogtc5p0.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 08 Jul 2019 08:05:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/3] tests: add qtest_set_exit_status()
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com> wrote:
> Modify the behaviour of qtest_quit() to check against the expected
> exit status value. The default remains 0.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


But I would like a review from anyone from qtest.

