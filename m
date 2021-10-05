Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B42D422648
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 14:20:36 +0200 (CEST)
Received: from localhost ([::1]:42770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXjQw-000559-Kg
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 08:20:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mXjOE-0003QS-FE; Tue, 05 Oct 2021 08:17:46 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:29580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mXjO9-0003hN-2P; Tue, 05 Oct 2021 08:17:45 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 0EAEF748F51;
 Tue,  5 Oct 2021 14:17:37 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id DBCE2748F4B; Tue,  5 Oct 2021 14:17:36 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id D8AEF746398;
 Tue,  5 Oct 2021 14:17:36 +0200 (CEST)
Date: Tue, 5 Oct 2021 14:17:36 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: Deprecate the ppc405 boards in QEMU?
In-Reply-To: <881242de-fec8-3296-ffb4-36d2a551d21f@redhat.com>
Message-ID: <e551634d-c6e7-c57-5b7f-b9ad8621824@eik.bme.hu>
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
 <0beb4744-5421-2cec-1fe4-6a8b7353d932@redhat.com>
 <cdbfbb3c-2e79-7853-afe0-fe8a65683db1@ozlabs.ru>
 <3b1570d3-56f5-1184-239a-72791fc8ef83@redhat.com>
 <881242de-fec8-3296-ffb4-36d2a551d21f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
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
 Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Greg Kurz <groug@kaod.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?ISO-8859-15?Q?C=E9dric_Le_Goater?= <clg@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?ISO-8859-15?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 5 Oct 2021, Thomas Huth wrote:
> On 05/10/2021 10.07, Thomas Huth wrote:
>> On 05/10/2021 10.05, Alexey Kardashevskiy wrote:
> [...]
>>> What is so special about taihu?
>> 
>> taihu is the other 405 board defined in hw/ppc/ppc405_boards.c (which I 
>> suggested to deprecate now)
>
> I've now also played with the u-boot sources a little bit, and with some bit 
> of tweaking, it's indeed possible to compile the old taihu board there. 
> However, it does not really work with QEMU anymore, it immediately triggers 
> an assert():
>
> $ qemu-system-ppc -M taihu -bios u-boot.bin -serial null -serial mon:stdio
> **
> ERROR:accel/tcg/tcg-accel-ops.c:79:tcg_handle_interrupt: assertion failed: 
> (qemu_mutex_iothread_locked())
> Aborted (core dumped)

Maybe it's similar to this: 2025fc6766ab25501e0041c564c44bb0f7389774 The 
helper_load_dcr() and helper_store_dcr() in target/ppc/timebase_helper.c 
seem to lock/unlock the iothread but I'm not sure if that's necessary. 
Also not sure why this does not happen with 460ex but that maybe uses 
different code.

> Going back to QEMU v2.3.0, I can see at least a little bit of output, but it 
> then also triggers an assert() during DRAM initialization:
>
> $ qemu-system-ppc -M taihu -bios u-boot.bin -serial null -serial mon:stdio
>
> Reset PowerPC core
>
> U-Boot 2014.10-rc2-00123-g461be2f96e-dirty (Oct 05 2021 - 10:02:56)
>
> CPU:   AMCC PowerPC 405EP Rev. B at 770 MHz (PLB=256 OPB=128 EBC=128)
>       I2C boot EEPROM disabled
>       Internal PCI arbiter enabled
>       16 KiB I-Cache 16 KiB D-Cache
> Board: Taihu - AMCC PPC405EP Evaluation Board
> I2C:   ready
> DRAM:  qemu-system-ppc: memory.c:1693: memory_region_del_subregion: Assertion 
> `subregion->container == mr' failed.
> Aborted (core dumped)
>
> Not sure if this ever worked in QEMU, maybe in the early 0.15 time, but that 
> version of QEMU also does not compile easily anymore on modern systems. So 
> I'm afraid, getting this into a workable shape again will take a lot of time. 
> At least I'll stop my efforts here now.

Do you have this u-boot binary somewhere just for others who want to try it?

Regards,
BALATON Zoltan

