Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E7B345EB4
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 13:58:21 +0100 (CET)
Received: from localhost ([::1]:55174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOgc0-0006vI-OS
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 08:58:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lOgZt-0004Ye-Ja
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:56:13 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:33733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lOgZi-0004Yr-1T
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=8EvuWMeSvlhuN/NKhL1UEoBjWre8dNBAehaT2Zpce9o=; b=NqYiK4FfYS8c9KtJULdhW93z5r
 y99PLzm/cCPl/l9Nj1iquA6FxM++4L2wMCCwRwd1aZ3M5Th9fqTTv72mthY/2LsIuVQaHt/Mvszp+
 v8saY9s12zcMCdxzcoeQtVEkXDZM4/Nm1xd9Vub/ofMi4+vpnEz0h6oQT9jff+0FoArMyIONqW2iK
 I8hTXhCWM+8fB6Sml/BSRtDx95Mz4VbMGMIxU619lt/3bZGEm9RT0bjEn2Pwl+JJqlzPYPsbY5JB9
 KQW0up0aJtM6znG2O2o8aRd3vJR/QDlFGuz+js2icjIhpqNw4qd8T4J68BZX4BiiUe0k9B5FC0DcX
 ujgjn4LQwBd8xpApAthBcDJ3+9gdY7GFRZdqmPHr4HyFuW0gDfABnWmBt/24pIk2hePkFPg3p6klr
 RLVHRoCAqe4CTyuyeKMn8ai9DS+CUAm7BZ7vYoU43o0cuMBkiRTrf9W5h5bLtnTPK5q9eNLjIIx3U
 1G6cD2vkMBEt0qeARHsckBd0YX21qqkei8pJml0/e9bAON8VPOnJfTNz0iftSpeGV4fH4EWSu97sH
 Vp1oskbTLPZILyYdm09deTV4Bi/UFz/EEvb0vN4OWchUXAQX4KjZqLZa49A+AQZv/I5OAigslc7s4
 4zJ/aKiqo3E1e7hmMUrkJ19TjBV9Kfg6EKevMyy6M=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, slp@redhat.com,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, virtio-fs@redhat.com,
 Xie Yongji <xieyongji@bytedance.com>,
 Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [External] Re: [RFC PATCH 0/9] Support for Virtio-fs daemon crash
 reconnection
Date: Tue, 23 Mar 2021 13:54:46 +0100
Message-ID: <2732080.qQGZu95Wvu@silver>
In-Reply-To: <YFh3gIMbEEEYDdS/@stefanha-x1.localdomain>
References: <20201215162119.27360-1-zhangjiachen.jaycee@bytedance.com>
 <1711593.yAA9ihpmTb@silver> <YFh3gIMbEEEYDdS/@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 22. M=E4rz 2021 11:54:56 CET Stefan Hajnoczi wrote:
> > > Thanks, Christian. I am still trying to figure out the details of the
> > > ROP
> > > attacks.
> > >=20
> > > However, QEMU's vhost-user reconnection is based on chardev socket
> > > reconnection. The socket reconnection can be enabled by the "--chardev
> > > socket,...,reconnect=3DN" in QEMU command options, in which N means Q=
EMU
> > > will
> > > try to connect the disconnected socket every N seconds. We can increa=
se
> > > N
> > > to increase the reconnect delay. If we want to change the reconnect
> > > delay
> > > dynamically, I think we should change the chardev socket reconnection
> > > code.
> > > It is a more generic mechanism than vhost-user-fs and vhost-user
> > > backend.
> > >=20
> > > By the way, I also considered the socket reconnection delay time in t=
he
> > > performance aspect. As the reconnection delay increase, if an
> > > application
> > > in the guest is doing I/Os, it will suffer larger tail latency. And f=
or
> > > now, the smallest delay is 1 second, which is rather large for
> > > high-performance virtual I/O devices today. I think maybe a more
> > > performant
> > > and safer reconnect delay adjustment mechanism should be considered in
> > > the
> > > future. What are your thoughts?
> >=20
> > So with N=3D1 an attacker could e.g. bypass a 16-bit PAC by brute-force=
 in
> > ~18 hours (e.g. on Arm if PAC + MTE was enabled). With 24-bit PAC (no
> > MTE) it would be ~194 days. Independent of what architecture and defend
> > mechanism is used, there is always the possibility though that some kind
> > of side channel attack exists that might require a much lower amount of
> > attempts. So in an untrusted environment I would personally limit the
> > amount of automatic reconnects and rather accept a down time for further
> > investigation if a suspicious high amount of crashes happened.
> >=20
> > And yes, if a dynamic delay scheme was deployed in future then starting
> > with a value smaller than 1 second would make sense.
>=20
> If we're talking about repeatedly crashing the process to find out its
> memory map, shouldn't each process have a different randomized memory
> layout?
>=20
> Stefan

Yes, ASLR is enabled on Linux and other OSes by default for more than 10=20
years. But ASLR does not prevent ROP attacks which are commonly using relat=
ive=20
offsets, tweaking the stack, indirect jumps, as well as heap spraying. Plus=
=20
side channels exist to gain access to direct addresses.

The situation might improve significantly when shadow stacks (e.g. Intel CE=
T)=20
become widely used in future. But in the meantime I would be cautious if=20
something is crashing too often in a certain time frame.

Best regards,
Christian Schoenebeck



