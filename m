Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82DBACC359
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Oct 2019 21:08:45 +0200 (CEST)
Received: from localhost ([::1]:51390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iGSwW-0001JZ-IK
	for lists+qemu-devel@lfdr.de; Fri, 04 Oct 2019 15:08:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38275)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lersek@redhat.com>) id 1iGSsd-0006vL-4h
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 15:04:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lersek@redhat.com>) id 1iGSsc-0006oN-6s
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 15:04:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60632)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lersek@redhat.com>) id 1iGSsc-0006oG-1G
 for qemu-devel@nongnu.org; Fri, 04 Oct 2019 15:04:42 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 387A7308404E;
 Fri,  4 Oct 2019 19:04:41 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-253.rdu2.redhat.com
 [10.10.121.253])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D54F460600;
 Fri,  4 Oct 2019 19:04:31 +0000 (UTC)
Subject: Re: [PATCH 6/7] tests/fw_cfg: Declare one QFWCFG for all tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20191003225437.16651-1-philmd@redhat.com>
 <20191003225437.16651-7-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <a4215907-5b59-803b-76ad-da8f7dc6cbae@redhat.com>
Date: Fri, 4 Oct 2019 21:04:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20191003225437.16651-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Fri, 04 Oct 2019 19:04:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/04/19 00:54, Philippe Mathieu-Daud=C3=A9 wrote:
> It is pointless to create/remove a QFWCFG object for each test.
> Move it to the test context and create/remove it only once.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  tests/fw_cfg-test.c | 74 +++++++++++++++++----------------------------
>  1 file changed, 27 insertions(+), 47 deletions(-)

Reviewed-by: Laszlo Ersek <lersek@redhat.com>


