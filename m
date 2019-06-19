Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2F74B3F8
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 10:22:53 +0200 (CEST)
Received: from localhost ([::1]:35820 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdVro-0001m0-GC
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 04:22:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43044)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <david.brenken@efs-auto.org>) id 1hdVqJ-0000z9-Ve
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 04:21:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david.brenken@efs-auto.org>) id 1hdVqJ-0001E4-3j
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 04:21:19 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:35439)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <david.brenken@efs-auto.org>)
 id 1hdVqI-0001DB-RB
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 04:21:19 -0400
Received: from localhost.localdomain ([178.239.76.114]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MdwRi-1iEDal0oiM-00b5h2; Wed, 19 Jun 2019 09:57:01 +0200
From: David Brenken <david.brenken@efs-auto.org>
To: qemu-devel@nongnu.org
Date: Wed, 19 Jun 2019 09:56:38 +0200
Message-Id: <20190619075643.10048-1-david.brenken@efs-auto.org>
X-Mailer: git-send-email 2.16.1.windows.4
X-Provags-ID: V03:K1:GN0OTgSUdnHIlnKJaszyuOSvsINsBnNPmfT/qyV2poJ/QbIXv4T
 ZnEBmPt6SNoALJMiX0DJCs/LZHzH8fvR+27J/W9ATV2BnAu9HbnAdg6vR6TRfGY3iPU5yxx
 +iRQhDy96L/GZoTX1pO0+2vjm5Ixfb6XbxNfuD0XeNupU5LJNaA7ajtBsgkJuuLT28fccFa
 DMF7ym0rOCyovEx8bkZGw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XBOnKy6k+9U=:aYotFfrXxSjuGP6V1Co5Aw
 M+rEj+e38WWTJIoSV6jy98VAWf4lceNsKtUAniYxrkNcLoOa+ozjzwaH6eoF0/RvY191Y8Mzc
 SfGSGtCxtCkNL77I98/2LmkzllKbtVt2WxpmT7hW2I4YEGGguzSGdclw1rrbNvHbdOs3bpy/p
 WZRocSSBvOGIrbHZVp4zrn/3M9iJvGEs3CHJFAbE9HGinlH4Mbyq6UdmHxzak/B/Pq1acEPzZ
 9hwpGXrBO0r1ltTtZ6Ig68jtgJ1FpBhmoQS7+ScOcPN8mRzPJ++sFObe2PTlCLbdU3jBhDvMd
 A19cBXgmC3aO4AJMs38cDE9byeDJknJA3oxGqaHo0tP28gsAv5IYEgzCptvw2ZxlBogGCZWsc
 fd7D4w+rNPEv2eAJoMIg12L4tuoKzSs6WTeV4EdKdL/FZ8LE5ayn/cs3CkitVylyDvFvGDKv1
 oj079AKkRw4xKI3O1QZddtm8J4kQtRT16lfStULAqpYK9BqZClzKbXgBJOOKA0XFMqGBVAFmw
 RVtxiJp4+9YgyCgtmIpIKPOx70D5K/eiVBnjofKZtlwKyNSeGGHVl4EWDe7BWX+2aO6qb9apS
 cZ1FodIrt6xG1/ucWa4113o877tXTCxHf2WUqn2CvKXbjNnW8koFkavjUCxhmbV1B0eUWRVwt
 jSw2rthoViib9n8ZHpfBjj97X/7H2+MaMxnj1iloCwLSCn3LVF7tYWtI+l73TL/4E/Z5nK0/D
 hf+V6fyv1nopVwBWr9zr3VBkqm2h9CdEip3ecWP+59UpHGFelteP+Pql9QM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-devel] [PATCH v2 0/5] tricore: adding new instructions and
 fixing issues
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
Cc: kbastian@mail.uni-paderborn.de, David Brenken <david.brenken@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Brenken <david.brenken@efs-auto.de>

Hello everyone,

as discussed here is the second version of the patchset.
- We changed the implementation of the RRPW_INSERT to make use of 
tcg_gen_deposit_tl.
- We added more information of the implementation of QSEED in the code
and changed parts of the implementation.
- We do only sync ctx.hflags with tb->flags.

Best regards

David

Andreas Konopik (1):
  tricore: add QSEED instruction

David Brenken (3):
  tricore: add FTOIZ instruction
  tricore: add UTOF instruction
  tricore: fix RRPW_INSERT instruction

Georg Hofstetter (1):
  tricore: reset DisasContext before generating code

 target/tricore/fpu_helper.c | 126 ++++++++++++++++++++++++++++++++++++
 target/tricore/helper.h     |   3 +
 target/tricore/translate.c  |  14 +++-
 3 files changed, 141 insertions(+), 2 deletions(-)

-- 
2.22.0.windows.1

