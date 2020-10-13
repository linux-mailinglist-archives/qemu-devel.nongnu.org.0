Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A1028D130
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 17:26:17 +0200 (CEST)
Received: from localhost ([::1]:55366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSMBs-0002vx-8k
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 11:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kSM9P-0002Ha-8R
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 11:23:43 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:49976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1kSM9M-0001DU-4a
 for qemu-devel@nongnu.org; Tue, 13 Oct 2020 11:23:42 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 860E2747602;
 Tue, 13 Oct 2020 17:23:37 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 395C77475FF; Tue, 13 Oct 2020 17:23:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 37AD57475FE;
 Tue, 13 Oct 2020 17:23:37 +0200 (CEST)
Date: Tue, 13 Oct 2020 17:23:37 +0200 (CEST)
To: =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 04/10] meson: option to build as shared library
In-Reply-To: <20201013144625.GP70612@redhat.com>
Message-ID: <c428697f-6483-1e7-182a-e3366cc9af68@eik.bme.hu>
References: <20201012232939.48481-1-j@getutm.app>
 <20201012232939.48481-5-j@getutm.app> <20201013075104.GA70612@redhat.com>
 <e27acf2-4dbe-4674-78cc-67aa7b505c54@eik.bme.hu>
 <20201013144625.GP70612@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-872622697-1602602617=:11522"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 10:41:07
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Joelle van Dyne <j@getutm.app>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: BALATON Zoltan <balaton@eik.bme.hu>
From: BALATON Zoltan via <qemu-devel@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-872622697-1602602617=:11522
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Tue, 13 Oct 2020, Daniel P. Berrangé wrote:
> On Tue, Oct 13, 2020 at 04:41:06PM +0200, BALATON Zoltan wrote:
>> On Tue, 13 Oct 2020, Daniel P. Berrangé wrote:
>>> On Mon, Oct 12, 2020 at 04:29:33PM -0700, Joelle van Dyne wrote:
>>>> From: osy <osy86@users.noreply.github.com>
>>>>
>>>> On iOS, we cannot fork() new processes, so the best way to load QEMU into an
>>>> app is through a shared library. We add a new configure option
>>>> `--enable-shared-lib` that will build the bulk of QEMU into a shared lib.
>>>> The usual executables will then link to the library.
>>>
>>> Note that QEMU as a combined work is licensed GPLv2-only, so if an app is
>>> linking to it as a shared library, the application's license has to be
>>> GPLv2 compatible. I fear that shipping as a shared library is an easy way
>>> for apps to get into a license violating situation without realizing.
>>
>> Please don't let that be an obstacle in merging this series. They'll do it
>> anyway as seen here so having it upstream is probably better than having a
>> lot of different/divergent forks.
>
> "They'll violate the license anyway" is not a compelling argument.

I meant they'll use it in other projects anyway and will maintain a fork 
instead of contributing to upstream so I think keeping this out of QEMU 
master does not help prevent that and would only promotes fragmentation. 
So avoiding possibly breaking license to not accept this series is not a 
compelling argument in my opinion.

Regards,
BALATON Zoltan

>
>> In case of UTM it seems to be licensed under Apache License 2.0:
>>
>> https://github.com/utmapp/UTM/blob/master/LICENSE
>>
>> which FSF says not compatible with GPLv2 but it is with GPLv3:
>>
>> http://www.gnu.org/licenses/license-list.html#apache2
>>
>> Not sure however if that's for using Apache licenced part in GPLv2 code or
>> the other way around like in UTM in which case I think the whole work will
>> effectively become GPLv3 as most parts of QEMU is probably GPLv2+ already or
>> BSD like free that should be possible to combine with only files explicitely
>> GPLv2 in QEMU remaining at that license and UTM parts are Apache 2.0 when
>> separated from QEMU. I have no idea about legal stuff whatsoever but
>> combining two free software components should be legal some way (otherwise
>> it's not possible to combine GPLv2 with GPLv3 either).
>
> You need to distinguish between GPLv2-only and GPLv2-or-later.
>
> GPLv2-or-later is fine as that upgrades to GPLv3 when used in a
> combined work with Apache License or GPLv3 software.
>
> GPLv2-only will, by design, *not* upgrade to newer GPL versions
> when combined - it is simply license incompatible.
>
> QEMU unfortunately has a bunch a GPLv2-only code present that we
> cannot eliminate.
>
> Regards,
> Daniel
>
--3866299591-872622697-1602602617=:11522--

