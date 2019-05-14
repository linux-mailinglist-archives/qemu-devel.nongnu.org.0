Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE011CB9E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 17:16:52 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49736 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQZAh-0007KT-ER
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 11:16:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQZ9Y-0006s9-MU
	for qemu-devel@nongnu.org; Tue, 14 May 2019 11:15:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hQZ9X-00028H-U4
	for qemu-devel@nongnu.org; Tue, 14 May 2019 11:15:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:1036)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hQZ9X-00027Z-Ny
	for qemu-devel@nongnu.org; Tue, 14 May 2019 11:15:39 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD1CC821D9;
	Tue, 14 May 2019 15:15:38 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83638608A6;
	Tue, 14 May 2019 15:15:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id EC22111385E4; Tue, 14 May 2019 17:15:31 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
References: <20190510173049.28171-1-richard.henderson@linaro.org>
Date: Tue, 14 May 2019 17:15:31 +0200
In-Reply-To: <20190510173049.28171-1-richard.henderson@linaro.org> (Richard
	Henderson's message of "Fri, 10 May 2019 10:30:24 -0700")
Message-ID: <877eatdq3w.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 14 May 2019 15:15:38 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v6 00/25] Add qemu_getrandom and
 ARMv8.5-RNG etc
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"make check-unit" fails for me:

  TEST    check-unit: tests/test-crypto-tlscredsx509
Unexpected error in object_new_with_propv() at /work/armbru/qemu/qom/object.c:674:
invalid object type: tls-creds-x509

and

  TEST    check-unit: tests/test-io-channel-tls
Unexpected error in object_new_with_propv() at /work/armbru/qemu/qom/object.c:674:
invalid object type: tls-creds-x509

I haven't looked further.

