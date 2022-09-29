Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 306A55EFA0E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 18:18:06 +0200 (CEST)
Received: from localhost ([::1]:53884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odwEe-0006aQ-P2
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 12:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oduen-0005Yd-Lt; Thu, 29 Sep 2022 10:36:58 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:13000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1oduei-0006b8-W4; Thu, 29 Sep 2022 10:36:55 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id F3238759B50;
 Thu, 29 Sep 2022 16:36:49 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id BFEBE746E06; Thu, 29 Sep 2022 16:36:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id BD64D74633D;
 Thu, 29 Sep 2022 16:36:49 +0200 (CEST)
Date: Thu, 29 Sep 2022 16:36:49 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
cc: qemu-devel@nongnu.org, fam@euphon.net, berrange@redhat.com, 
 f4bug@amsat.org, aurelien@aurel32.net, pbonzini@redhat.com, 
 stefanha@redhat.com, crosa@redhat.com, minyihh@uci.edu, 
 ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu, cota@braap.org, 
 aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com, 
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com, 
 Alexey Kardashevskiy <aik@ozlabs.ru>, 
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>, 
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>, 
 "open list:Virtual Open Firm..." <qemu-ppc@nongnu.org>
Subject: Re: [PATCH v1 15/51] vof: add distclean target
In-Reply-To: <20220929114231.583801-16-alex.bennee@linaro.org>
Message-ID: <b2c5703-6015-a9bc-620-aa124c67b73@eik.bme.hu>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
 <20220929114231.583801-16-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 BOUNDARY="3866299591-2055951207-1664461999=:6311"
Content-ID: <9d907ff-90b1-1294-788d-87ca822e332@eik.bme.hu>
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
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2055951207-1664461999=:6311
Content-Type: text/plain; CHARSET=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 8BIT
Content-ID: <d8133bd1-7a5e-cab-8324-8f6dac76b849@eik.bme.hu>

On Thu, 29 Sep 2022, Alex Bennée wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
> pc-bios/vof/Makefile | 4 +++-
> 1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
> index 8809c82768..990f26af31 100644
> --- a/pc-bios/vof/Makefile
> +++ b/pc-bios/vof/Makefile
> @@ -19,4 +19,6 @@ vof.elf: entry.o main.o ci.o bootmem.o libc.o
> clean:
> 	rm -f *.o vof.bin vof.elf *~
>
> -.PHONY: all clean
> +distclean:
> +
> +.PHONY: all clean distclean

Shouldn't you also do something in this like at least depend on clean? By 
the way make distclean not in VOF but in QEMU build dir fails for me with:

Cleaning... 1 files.
rm -f config-host.mak qemu-bundle
rm: cannot remove 'qemu-bundle': Is a directory
make: *** [Makefile:219: distclean] Error 1

Regards,
BALATON Zoltan
--3866299591-2055951207-1664461999=:6311--

