Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85FC7C1117
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Sep 2019 16:55:53 +0200 (CEST)
Received: from localhost ([::1]:33372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEE8W-0003EG-0Z
	for lists+qemu-devel@lfdr.de; Sat, 28 Sep 2019 10:55:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49305)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iEE7K-0002hy-LL
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 10:54:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iEE7G-0006wC-Fo
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 10:54:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58348)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iEE7G-0006vF-A1
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 10:54:34 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6B96E1DBC;
 Sat, 28 Sep 2019 14:54:32 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 870281000337;
 Sat, 28 Sep 2019 14:54:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1001F113864E; Sat, 28 Sep 2019 16:54:28 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Aleksandar Markovic" <Aleksandar.Markovic@rt-rk.com>
Subject: Re: [PATCH v2 01/20] target/mips: Clean up helper.c
References: <47e6-5d8e0a80-19-52027780@183847874>
Date: Sat, 28 Sep 2019 16:54:28 +0200
In-Reply-To: <47e6-5d8e0a80-19-52027780@183847874> (Aleksandar Markovic's
 message of "Fri, 27 Sep 2019 15:11:04 +0200")
Message-ID: <87y2y8a2u3.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Sat, 28 Sep 2019 14:54:32 +0000 (UTC)
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
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Aleksandar Markovic" <Aleksandar.Markovic@rt-rk.com> writes:

> OK, my case belongs to "used to work before" group. I used GMail
> Android app to send this particular mail, and have been using that app
> for several months without problema. I am going to find an alternative
> way of sending mails to the list.

Appreciated!

[...]

