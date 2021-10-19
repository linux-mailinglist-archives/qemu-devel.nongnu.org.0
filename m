Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E214332C1
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:44:22 +0200 (CEST)
Received: from localhost ([::1]:36722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mclfR-0006gt-UH
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:44:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mclcX-00044C-JE
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:41:22 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:59071)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1mclcV-00040g-PT
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:41:21 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-ZLwskkuZOseCZk8cUN9FIg-1; Tue, 19 Oct 2021 05:41:15 -0400
X-MC-Unique: ZLwskkuZOseCZk8cUN9FIg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAF4810A8E03;
 Tue, 19 Oct 2021 09:41:13 +0000 (UTC)
Received: from bahia.huguette (unknown [10.39.192.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 681AE60C82;
 Tue, 19 Oct 2021 09:41:02 +0000 (UTC)
Date: Tue, 19 Oct 2021 11:41:00 +0200
From: Greg Kurz <groug@kaod.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Deprecate the ppc405 boards in QEMU?
Message-ID: <20211019114100.6cf5971d@bahia.huguette>
In-Reply-To: <be84c7bf-47d3-1ba8-20ca-084a487db29d@csgroup.eu>
References: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <0beb4744-5421-2cec-1fe4-6a8b7353d932@redhat.com>
 <cdbfbb3c-2e79-7853-afe0-fe8a65683db1@ozlabs.ru>
 <3b1570d3-56f5-1184-239a-72791fc8ef83@redhat.com>
 <881242de-fec8-3296-ffb4-36d2a551d21f@redhat.com>
 <e551634d-c6e7-c57-5b7f-b9ad8621824@eik.bme.hu>
 <119bc1c7-22e0-c455-9f34-57a7424f0c52@redhat.com>
 <a60b6ad-801c-6783-a81d-1d2b8ed97e34@eik.bme.hu>
 <7526ae07-0054-69df-c71f-8751858ef0db@redhat.com>
 <ad151b9d-27a7-bb5d-2cad-1196ceecfdd6@redhat.com>
 <YWQB1FMhQfmqRYxN@yekko>
 <bcdf63a4-8d22-8b25-d980-7fc574f80e82@redhat.com>
 <be84c7bf-47d3-1ba8-20ca-084a487db29d@csgroup.eu>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 dbarboza@redhat.com, Alexey Kardashevskiy <aik@ozlabs.ru>,
 QEMU Developers <qemu-devel@nongnu.org>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVk?= =?UTF-8?B?w6k=?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 19 Oct 2021 11:31:03 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

>=20
>=20
> Le 11/10/2021 =C3=A0 15:24, Thomas Huth a =C3=A9crit=C2=A0:
> > On 11/10/2021 11.20, David Gibson wrote:
> >> On Mon, Oct 11, 2021 at 10:10:36AM +0200, Thomas Huth wrote:
> >>> On 06/10/2021 09.25, Thomas Huth wrote:
> >>>> On 05/10/2021 23.53, BALATON Zoltan wrote:
> >>>> [...]
> >>>>> Maybe these 405 boards in QEMU ran with modified firmware where the
> >>>>> memory detection was patched out but it seems to detect the RAM so =
I
> >>>>> wonder where it gets that from. Maybe by reading the SDRAM
> >>>>> controller DCRs ppc4xx_sdram_init() sets up. Then I'm not sure what
> >>>>> it needs the SPD for, I forgot how this worked on sam460ex. Maybe
> >>>>> for the speed calibration, so could be it detects ram by reading
> >>>>> DCRs then tries to get SPD data and that's where it stops as i2c is
> >>>>> not emulated on taihu. This could be confirmed by checking what it
> >>>>> pokes with -d guest_errors that shows accesses to missing devices
> >>>>> but don't know where 405 has the i2c controller and if it's the sam=
e
> >>>>> as newer SoCs. If so that could be reused and an i2c bus could be
> >>>>> added with the SPD data like in sam460ex to make u-boot happy or yo=
u
> >>>>> could skip this in u-boot.
> >>>>
> >>>> FWIW, I've just tried the latter (skipping the sdram init in u-boot)=
,
> >>>> and indeed, I can get to the u-boot prompt now.
> >>> [...]> I've also attached the patch with my modifications to u-boot.
> >>>
> >>> FYI, the changes can now be found on this branch here:
> >>>
> >>> =C2=A0 https://gitlab.com/huth/u-boot/-/commits/taihu
> >>>
> >>> I also added a gitlab-CI file, so you can now download the u-boot.bin=
=20
> >>> as an
> >>> artifact from the corresponding pipeline, e.g.:
> >>>
> >>> =C2=A0 https://gitlab.com/huth/u-boot/-/jobs/1667201028
> >>
> >> Thanks.
> >>
> >> Are you going to send a v2 of your proposed deprecation patches?
> >=20
> > No, since there was interest in keeping the 405 boards for testing the=
=20
> > 405 code in the Linux kernel, and since there is now a way to do at=20
> > least some very basic testing of these boards (with the u-boot=20
> > firmware), I don't plan to respin the deprecation patch. I just sent a=
=20
> > patch for adding the boards to our CI instead:
> >=20
> >  =C2=A0https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg02072.h=
tml
> >=20
>=20
> I have downloaded your u-boot.bin and tried it with both QEMU 5.2.0 and=
=20
> mainline, and I get:
>=20
> ERROR:../accel/tcg/tcg-accel-ops.c:79:tcg_handle_interrupt: assertion=20
> failed: (qemu_mutex_iothread_locked())
> Bail out! ERROR:../accel/tcg/tcg-accel-ops.c:79:tcg_handle_interrupt:=20
> assertion failed: (qemu_mutex_iothread_locked())
> Abandon (core dumped)
>=20
> I see in the mail history that you got that problem as well at some=20
> point. How did you fix it ?
>=20

https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg01019.html

Not yet upstream but already in David's ppc-for-6.2 tree :

https://gitlab.com/dgibson/qemu/-/commit/c29fca5c8173e9e647ebff07cb78b7c813=
5bd11a

> Thanks
> Christophe


