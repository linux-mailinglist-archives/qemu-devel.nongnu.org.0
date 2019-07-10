Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BE763538
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 13:56:05 +0200 (CEST)
Received: from localhost ([::1]:49002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkoj6-0005CU-Rt
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 07:56:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50993)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hkoiW-0004fi-Dt
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 07:55:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hkoiV-0005S1-Js
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 07:55:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34212)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hkoiV-0005Rb-EF
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 07:55:27 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A56A1308622D;
 Tue,  9 Jul 2019 11:55:26 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-111.ams2.redhat.com
 [10.36.116.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AAD9867E6;
 Tue,  9 Jul 2019 11:55:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BDCF71138648; Tue,  9 Jul 2019 13:55:22 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
References: <20190702113414.6896-1-armbru@redhat.com>
 <20190702113414.6896-5-armbru@redhat.com>
 <e7916e59-75a9-cfd2-a2a3-ab30787a60e6@de.ibm.com>
Date: Tue, 09 Jul 2019 13:55:22 +0200
In-Reply-To: <e7916e59-75a9-cfd2-a2a3-ab30787a60e6@de.ibm.com> (Christian
 Borntraeger's message of "Fri, 5 Jul 2019 23:31:35 +0200")
Message-ID: <87y3177785.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 09 Jul 2019 11:55:26 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PULL 4/4] Makefile: Reuse all's recursion
 machinery for clean and install
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
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Christian Borntraeger <borntraeger@de.ibm.com> writes:

> This seems to break "make clean" and "make distclean" in the source directory if there was never
> a configure.
>
> qemu]$ make clean
>   LD      recurse-clean.mo
> cc: fatal error: no input files
> compilation terminated.
> make: *** [rules.mak:118: recurse-clean.mo] Error 1

Reproduced.  I'll look into it.  Thanks!

