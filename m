Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD6D63727
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 15:41:34 +0200 (CEST)
Received: from localhost ([::1]:50052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkqNA-0005ui-QW
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 09:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46684)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hkqLS-0005DY-Oj
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 09:39:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hkqLR-0004xD-RV
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 09:39:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56496)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hkqLR-0004sQ-KL
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 09:39:45 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 85EA930C8094;
 Tue,  9 Jul 2019 13:39:36 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-111.ams2.redhat.com
 [10.36.116.111])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 40A5C51C99;
 Tue,  9 Jul 2019 13:39:36 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E54911138648; Tue,  9 Jul 2019 15:39:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
References: <20190702113414.6896-1-armbru@redhat.com>
 <20190702113414.6896-5-armbru@redhat.com>
 <e7916e59-75a9-cfd2-a2a3-ab30787a60e6@de.ibm.com>
 <bc9172f0-631f-4230-96dc-dd534222db82@de.ibm.com>
Date: Tue, 09 Jul 2019 15:39:34 +0200
In-Reply-To: <bc9172f0-631f-4230-96dc-dd534222db82@de.ibm.com> (Christian
 Borntraeger's message of "Tue, 9 Jul 2019 13:58:39 +0200")
Message-ID: <87bly372eh.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Tue, 09 Jul 2019 13:39:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] make distclean /clean does not work on fresh
 repository
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
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Christian Borntraeger <borntraeger@de.ibm.com> writes:

> This is still broken with qemu/master. 
>
> make clean/distclean no longer works on a fresh repository. As the make will return an error
> this can break any kind of scripts.

I intend to submit my fix later today.

