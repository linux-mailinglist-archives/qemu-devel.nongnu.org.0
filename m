Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3466434E64
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 16:57:05 +0200 (CEST)
Received: from localhost ([::1]:45868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdD1c-0000Nu-PS
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 10:57:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mdCzs-0007V4-Sl; Wed, 20 Oct 2021 10:55:17 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:23481)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mdCzo-0000dq-KC; Wed, 20 Oct 2021 10:55:15 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 3ACD9746399;
 Wed, 20 Oct 2021 16:55:08 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id E9DCD746333; Wed, 20 Oct 2021 16:55:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id E6E657462D3;
 Wed, 20 Oct 2021 16:55:07 +0200 (CEST)
Date: Wed, 20 Oct 2021 16:55:07 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: Deprecate the ppc405 boards in QEMU?
In-Reply-To: <03d047aa-6d73-8697-ac43-29ab56563567@redhat.com>
Message-ID: <942cf427-d052-5bd-6b66-ddc5a53fbec5@eik.bme.hu>
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
 <03d047aa-6d73-8697-ac43-29ab56563567@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-1674444421-1634741503=:45829"
Content-ID: <fdb422cd-628-8a71-8e68-3633a7f5f819@eik.bme.hu>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, dbarboza@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1674444421-1634741503=:45829
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <4f21a2d4-dd8-7cec-458a-59ab5b19a659@eik.bme.hu>

On Wed, 20 Oct 2021, Thomas Huth wrote:
> On 20/10/2021 14.43, Cédric Le Goater wrote:
>
>> The 405 machine are still close to deprecation I think. We are still
>> struggling to boot one with mainline Linux, using uboot provided by
>> Thomas which skips SDRAM init. It is not clear to me if u-boot is
>> strictly necessary. It depends if Linux relies on it to do some
>> pre-initialization of HW. I guess once we find a good DTS for it, or
>> not, we can take a decision.
>
> FWIW, seems like this tarball contains a dts for a "taihushui" 405ep board:
>
> https://dev.archive.openwrt.org/raw-attachment/ticket/4153/kolsch.tranzeo.openwrt.bsp.tar.bz2
>
> ... I wonder whether that's the same board as the "taihu" board in QEMU?

The corresponding ticket has some info on the machine:

https://dev.archive.openwrt.org/ticket/4153.html

but it's not clear what taihu in QEMU is in the first place. The comment 
in ppc405_boards.c says it's an evaluation board so most likely the above 
one may have been designed based on this reference board. Some info on the 
eval board can be found here:

http://www.welcm.com/amccTaihu/amccTaihu.htm
https://datasheet.octopart.com/EV-460GT-KIT-03-AMCC-datasheet-11746697.pdf
https://happytrees.org/files/chips/datasheets/product_selector_guide--AMCC--PowerPC.pdf

I wonder what ref405ep was then, an earlier or later or different version?

Regards,
BALATON Zoltan
--3866299591-1674444421-1634741503=:45829--

