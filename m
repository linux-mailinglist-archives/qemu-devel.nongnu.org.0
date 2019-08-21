Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126C79836C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 20:45:01 +0200 (CEST)
Received: from localhost ([::1]:52172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0VbP-0005pY-QN
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 14:44:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44385)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Sandra_Loosemore@mentor.com>) id 1i0Uj1-0000OS-Ef
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:48:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Sandra_Loosemore@mentor.com>) id 1i0Uiy-0002Bs-NP
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:48:46 -0400
Received: from esa2.mentor.iphmx.com ([68.232.141.98]:29339)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Sandra_Loosemore@mentor.com>)
 id 1i0Uiw-00023F-JM
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 13:48:42 -0400
IronPort-SDR: Q2eNXhEGXWlznuTJXnGgl+ETXVvbGYSqrbVKEcYZb5EWPXkGz3P7sQI6kBO2iyM0wd0vGvvPzy
 jwdsIMAdqztGEf4YmBvsHg5U3HphGFauhosnwziAeCYCwZB9HroCS/PpZZdL74pYXSdE49c4tZ
 EElC6ursLyQlIdyPrdMnrOhgbrprs3PUQn9JeFyhDRLoNNZhImKNYWY5YMs64pA547nC5Q7C3f
 TZoEHv1J/+ER+kfQC1bC1kvZea3kkv3j6WIKVYzuNhQq5DvZS1oOa5abxEX60KBXSP08j3v4oP
 gA4=
X-IronPort-AV: E=Sophos;i="5.64,412,1559548800"; d="scan'208";a="40620971"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
 by esa2.mentor.iphmx.com with ESMTP; 21 Aug 2019 09:48:38 -0800
IronPort-SDR: 5tuOxBdujpdL3HTyIHvF2L8vn4xu30l06OS7xAyMpukJy3ElaV1l+PJjCFSdKrbdK3+TO99Oc5
 g74FoOr4JXs4EjlzdZbxPWelDGbw89BSTHU90hqu26IJts/iWY0VvxmtYCS4067w+rXjtk+HeH
 KUKY1fg9lHDe9EEeKa88EiSGZG4ZzA96Mp0WiSVWLna4/P3vb8N1Frdr6c5GJKS7m1SAeSwyNx
 pKa2OM/2Ni/QXT8kFRGSnbrcBkYRgV2k72lJdBI5jKgDe2kTeX/FZ5UPMbJYdlNVJ00B3iLr/Z
 CKs=
To: Laurent Vivier <laurent@vivier.eu>, <qemu-devel@nongnu.org>
References: <20190821142151.19995-1-sandra@codesourcery.com>
 <20190821142151.19995-2-sandra@codesourcery.com>
 <e84f586a-7238-7bbe-f519-bb7c370c404b@vivier.eu>
 <608fde9c-bcac-9e6f-98f0-c208bda2eb5a@codesourcery.com>
 <f75cc1f8-0920-7997-e09a-041565f95656@vivier.eu>
From: Sandra Loosemore <sandra@codesourcery.com>
Message-ID: <489c4ec3-a09d-db42-4712-ddb9e8f270dd@codesourcery.com>
Date: Wed, 21 Aug 2019 11:48:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <f75cc1f8-0920-7997-e09a-041565f95656@vivier.eu>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SVR-ORW-MBX-05.mgc.mentorg.com (147.34.90.205) To
 svr-orw-mbx-03.mgc.mentorg.com (147.34.90.203)
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 68.232.141.98
Subject: Re: [Qemu-devel] [PATCH 1/2] target/nios2: Fix bug in semihosted
 exit handling
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
Cc: Marek Vasut <marex@denx.de>, Chris Wulff <crwulff@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/21/19 9:41 AM, Laurent Vivier wrote:

> Could add this information in the commit messages of each patch?

Sure.  V2 of the patches coming up shortly.

-Sandra

