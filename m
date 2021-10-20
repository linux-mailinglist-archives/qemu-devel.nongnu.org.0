Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54108434D58
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:20:00 +0200 (CEST)
Received: from localhost ([::1]:35804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdCRj-0003b3-1w
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mdCO7-0006ww-U4; Wed, 20 Oct 2021 10:16:16 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:39229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mdCNx-000768-Gt; Wed, 20 Oct 2021 10:16:13 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 265F3746399;
 Wed, 20 Oct 2021 16:16:02 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id F161A746333; Wed, 20 Oct 2021 16:16:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id EEA2E7462D3;
 Wed, 20 Oct 2021 16:16:01 +0200 (CEST)
Date: Wed, 20 Oct 2021 16:16:01 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: Deprecate the ppc405 boards in QEMU? (was: [PATCH v3 4/7]
 MAINTAINERS: Orphan obscure ppc platforms)
In-Reply-To: <4e07823e-7162-525a-4a61-9bed63e85d58@kaod.org>
Message-ID: <d038ea-845a-d60-491-26211ecede3@eik.bme.hu>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <5e4f78ce-1508-5689-ec29-79edad0c824e@kaod.org>
 <491d6265-3785-b11-b7f0-621a3d2823@eik.bme.hu>
 <b9f27c1b-1162-b178-9333-89c0dd707c12@redhat.com>
 <103e098a-a8ac-a22a-8aad-3df7d8cde148@amsat.org>
 <939f2d12-38f6-4ab0-b688-384136d1d9c@eik.bme.hu>
 <4e07823e-7162-525a-4a61-9bed63e85d58@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1521928780-1634738964=:45829"
Content-ID: <17bad28-3bbb-4b49-bc83-3340dd41a0e1@eik.bme.hu>
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>, qemu-ppc <qemu-ppc@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1521928780-1634738964=:45829
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <d2a243e3-8e30-c6f8-bef9-44b535df46a@eik.bme.hu>

On Wed, 20 Oct 2021, Cédric Le Goater wrote:
> On 10/20/21 13:42, BALATON Zoltan wrote:
>> On Wed, 20 Oct 2021, Philippe Mathieu-Daudé wrote:
>>> On 10/5/21 14:29, Thomas Huth wrote:
>>>> I think there are many CPUs in that list which cannot be used with any
>>>> board, some of them might be also in a very incomplete state. So
>>>> presenting such a big list to the users is confusing and might create
>>>> wrong expectations. It would be good to remove at least the CPUs which
>>>> are really completely useless.
>>> 
>>> Maybe only remove some from system emulation but keep all of them
>>> in user emulation?
>> 
>> Or keep them all but mark those that are not tested/may be incomplete? So 
>> the used can see what is expected to work and what may need to be fixed. 
>> That way somebody may try and fix it whereas if it's not there they are 
>> unlikely to try to add it.
>
>
> The bamboo machine with 440 CPUs is booting with the latest kernel
> and we have an acceptance test for it now, thanks to Thomas. There

We also have the sam460ex for 440 based CPU that runs with Linux as 
another test but having more than one is better and not sure if the 
sam460ex has an acceptance test in QEMU. (I think Guenter Roeck tests 
sam460ex with Linux at least he did in the past.)

By the way what happened to the test written by Philippe for pegasos2. Is 
that upstream yet? That test used MorphOS so we don't only test Linux (but 
it needs the iso which is freely downloadable but probably not 
redistributable due to its license). And that's not a BookE CPU so maybe 
off-topic in this thtead I was just reminded of it.

> is not much effort in keeping them in a working state until someone
> volunteers. Hopefully, Christophe is making sure that we are not
> breaking anything with Linux support.
>
> The 405 machine are still close to deprecation I think. We are still
> struggling to boot one with mainline Linux, using uboot provided by
> Thomas which skips SDRAM init. It is not clear to me if u-boot is

I think the SDRAM init could be fixed by adding SPD data, I've done that 
for sam460ex, I may try to look at cleaning up the memory controller 
models together with the 440 one as these are similar but not too high on 
my list I want to do now so maybe later if 405 will be kept.

Regards,
BALATON Zoltan
--3866299591-1521928780-1634738964=:45829--

