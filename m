Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 013B93C64E0
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 22:22:34 +0200 (CEST)
Received: from localhost ([::1]:56470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m32Rk-0005is-HY
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 16:22:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m32Q8-0004pB-Vc; Mon, 12 Jul 2021 16:20:53 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:61442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1m32Q3-0005FH-1m; Mon, 12 Jul 2021 16:20:51 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B2B4974570D;
 Mon, 12 Jul 2021 22:20:41 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 34CC9745709; Mon, 12 Jul 2021 22:20:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 31EA97456E3;
 Mon, 12 Jul 2021 22:20:41 +0200 (CEST)
Date: Mon, 12 Jul 2021 22:20:41 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 0/2] tests/acceptance: Add tests for the Pegasos2 machine
In-Reply-To: <20210515134555.307404-1-f4bug@amsat.org>
Message-ID: <ba5f83e4-9c48-3097-cdcb-be5efbf991e3@eik.bme.hu>
References: <20210515134555.307404-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1214575468-1626121241=:99032"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Thomas Huth <huth@tuxfamily.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-ppc@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1214575468-1626121241=:99032
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Sat, 15 May 2021, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (2):
>  tests/acceptance: Ignore binary data sent on serial console
>  tests/acceptance: Add tests for the Pegasos2 machine
>
> tests/acceptance/avocado_qemu/__init__.py |  7 +-
> tests/acceptance/machine_ppc_pegasos.py   | 98 +++++++++++++++++++++++
> 2 files changed, 103 insertions(+), 2 deletions(-)
> create mode 100644 tests/acceptance/machine_ppc_pegasos.py
>
> --
> 2.26.3

Now that pegasos2 is in master should these tests be added too? I can't 
test if these still apply or work correctly so just sending this as a 
reminder in case we want this to be part of the next release too but 
could also be added later if no time for it now.

Regards,
BALATON Zoltan
--3866299591-1214575468-1626121241=:99032--

