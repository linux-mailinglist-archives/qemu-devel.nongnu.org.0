Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3B5602CCC
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 15:22:09 +0200 (CEST)
Received: from localhost ([::1]:35268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okmXm-0007NQ-C5
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 09:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1okmRa-0003wa-4X
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:15:44 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1okmRW-0002JF-80
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 09:15:40 -0400
Received: from fraeml735-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4MsDny6p2hz688Kq;
 Tue, 18 Oct 2022 21:13:42 +0800 (CST)
Received: from lhrpeml100004.china.huawei.com (7.191.162.219) by
 fraeml735-chm.china.huawei.com (10.206.15.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 15:15:25 +0200
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 lhrpeml100004.china.huawei.com (7.191.162.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 14:15:25 +0100
Received: from lhrpeml500005.china.huawei.com ([7.191.163.240]) by
 lhrpeml500005.china.huawei.com ([7.191.163.240]) with mapi id 15.01.2375.031; 
 Tue, 18 Oct 2022 14:15:25 +0100
To: "quintela@redhat.com" <quintela@redhat.com>, kvm-devel
 <kvm@vger.kernel.org>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: RE: KVM Call for 2022-10-18
Thread-Topic: KVM Call for 2022-10-18
Thread-Index: AQHY37VkOnBjdkxbIUaY587Mhc9eLa4UJvhQ
Date: Tue, 18 Oct 2022 13:15:25 +0000
Message-ID: <6834adc6bf3a4921b69f1513f642d2e6@huawei.com>
References: <871qran29t.fsf@secure.mitica>
In-Reply-To: <871qran29t.fsf@secure.mitica>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.202.227.178]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=shameerali.kolothum.thodi@huawei.com;
 helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
From:  Shameerali Kolothum Thodi via <qemu-devel@nongnu.org>



> -----Original Message-----
> From: Qemu-devel
> [mailto:qemu-devel-bounces+shameerali.kolothum.thodi=3Dhuawei.com@nong
> nu.org] On Behalf Of Juan Quintela
> Sent: 14 October 2022 11:11
> To: kvm-devel <kvm@vger.kernel.org>; qemu-devel@nongnu.org
> Subject: KVM Call for 2022-10-18
>=20
>=20
>=20
> Hi
>=20
> Please, send any topic that you are interested in covering.
>=20
> For next week, we have a topic:
>=20
> - VFIO and migration
>=20
> We are going to discuss what to do with vfio devices that support
> migration.  See my RFC on the list, so far we are discussing:
>=20
> - we need a way to know the size of the vfio device state
>   (In the cases we are discussing, they require that the guest is
>   stopped, so I am redoing how we calculate pending state).
>=20
> - We need an estimate/exact sizes.
>   Estimate can be the one calculated last time.  This is supposed to be
>   fast, and needs to work with the guest running.
>   Exact size is just that, we have stopped the guest, and we want to
>   know how big is the state for this device, to know if we can complete
>   migration ore we will continue in iterative stage.
>=20
> - We need to send the state asynchronously.
>   VFIO devices are very fast at doing whatever they are designed to do.
>   But copying its state to memory is not one of the things that they do
>   fast.  So I am working in an asynchronous way to copy that state in
>   parallel.  The particular setup that caused this problem was using 4
>   network vfio cards in the guest.  Current code will:
>=20
>   for i in network cards:
>      copy the state from card i into memory
>      send the state from memory from card i to destination
>=20
>   what we want is something like:
>=20
>   for i in network cards:
>      start asyrchronous copy the state from card i into memory
>=20
>   for i in network cards:
>      wait for copy the state from card i into memory to finish
>      send the state from memory from card i to destination
>=20
> So the cards can tranfer its state to memory in parallel.
>=20
>=20
> At the end of Monday I will send an email with the agenda or the
> cancellation of the call, so hurry up.
>=20
> After discussions on the QEMU Summit, we are going to have always open a
> KVM call where you can add topics.
>=20
>  Call details:
>=20
> By popular demand, a google calendar public entry with it
>=20
>=20
> https://calendar.google.com/calendar/u/0?cid=3DZWdlZDdja2kwNWxtdTF0bm
> d2a2wzdGhpZHNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ
>=20
> (Let me know if you have any problems with the calendar entry.  I just
> gave up about getting right at the same time CEST, CET, EDT and DST).
Hi,

Just wondering did this call happen? Tried joining in as it was showing
14:00-15:00 in my google calendar(BST), but no luck.

Thanks,
Shameer

>=20
> If you need phone number details,  contact me privately
>=20
> Thanks, Juan.
>=20


