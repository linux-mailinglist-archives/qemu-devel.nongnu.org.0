Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB428369662
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 17:50:47 +0200 (CEST)
Received: from localhost ([::1]:51298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZy4s-0002AY-RC
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 11:50:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralph.schmieder@gmail.com>)
 id 1lZy2R-0000Nu-A9
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:48:15 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralph.schmieder@gmail.com>)
 id 1lZy2O-0006wi-MY
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 11:48:15 -0400
Received: by mail-wr1-x42e.google.com with SMTP id a4so48868946wrr.2
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 08:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=71xJlyCc/PwxCoOojUNAxxfAafa29TsOP5zVlgZJ6Y8=;
 b=uDZxTFrZSKw8t47JgP3v9ypdwW09HvNLsnoCuXPdwE/49C/krBCRXRp4sfSIoM0gVT
 D0o4DnYMNfmu7PdqQZwz+XNa+hRyGNP4xjVau/Z/FRd3q5QokPyesxf9RCqHtu0xn7vy
 9lqvlnuS0sHcL1GwQcNd2qw49SkDAxss65tkzhdup+9QH8XwePQNHYsmZhrtVE6EyRGM
 THP3VrRytKhEJH384zwE5x9PbRAKPIEK00Po+cvUgryh3Mmny2Q84xLZ/c3OEPdmGE3K
 MYz03WVRYppnUMIdU5KE307Gu0dvtW3hvPdIPOMbCq6HKBuP0/IVbIW3SN6Xjy1pBfBg
 THpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=71xJlyCc/PwxCoOojUNAxxfAafa29TsOP5zVlgZJ6Y8=;
 b=XOsZHZ+frM1S8O6DJ9vEaLpEpO7skO5lrORk8wI5+npfnpoJoBWIPXBKD4W4/VPKEd
 n9poai1yU3eYlOerCdmPOpDhK33yTlRwo+IGfCySs8GNUD6jbirkwqGaVFWF2iyyFOfC
 mc5aQE26jXsEmun2XszlQz5TMeZwFFtJJeCG45uesiuIBCdUtVaSSC7Eo2mL2K4qdxDF
 rBKyQ84HEVBiz7qhMK+2+vN70sSv6FK32J12lCtxfs/VMy3B2jqS8Vgw4i9p12em0zfD
 Obbw61xHPpddlm5CGXSKcAAVaKGPpxPAg+9aZO7o38y/Zj6Ry+kFfSKuBJsIHpytqzjj
 1DOg==
X-Gm-Message-State: AOAM530GTZWPrDovC8hUCjisKo9X8uz9MGOKtq83jNzcms9m6OTB/MtI
 mCxliP5qEYQtC+j/yYeQ4+4=
X-Google-Smtp-Source: ABdhPJxIWViZO8TWafqhJ+7FZOpnf9s7AYTUfJWZg6SPHurqWPZE/SS8EiwaAEUK8i/7aKsBVX22MA==
X-Received: by 2002:adf:f410:: with SMTP id g16mr5604770wro.345.1619192891247; 
 Fri, 23 Apr 2021 08:48:11 -0700 (PDT)
Received: from ?IPv6:2001:470:1f0b:bcf:1513:9cd9:82b8:bd28?
 ([2001:470:1f0b:bcf:1513:9cd9:82b8:bd28])
 by smtp.gmail.com with ESMTPSA id z17sm9707728wro.1.2021.04.23.08.48.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 08:48:10 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: socket.c added support for unix domain socket datagram transport
From: Ralph Schmieder <ralph.schmieder@gmail.com>
In-Reply-To: <20210423172940.14f48b49@elisabeth>
Date: Fri, 23 Apr 2021 17:48:08 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <F0191BF0-7C7A-4587-8B94-BACA7E1F911F@gmail.com>
References: <1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com>
 <20210423172940.14f48b49@elisabeth>
To: Stefano Brivio <sbrivio@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=ralph.schmieder@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, Stefano... Thanks for the detailed response... inline
Thanks,
-ralph


> On Apr 23, 2021, at 17:29, Stefano Brivio <sbrivio@redhat.com> wrote:
>=20
> Hi Ralph,
>=20
> On Fri, 23 Apr 2021 08:56:48 +0200
> Ralph Schmieder <ralph.schmieder@gmail.com> wrote:
>=20
>> Hey...  new to this list.  I was looking for a way to use Unix domain
>> sockets as a network transport between local VMs.
>>=20
>> I'm part of a team where we run dozens if not hundreds of VMs on a
>> single compute instance which are highly interconnected.
>>=20
>> In the current implementation, I use UDP sockets (e.g. something like=20=

>>=20
>> -netdev
>> id=3Dbla,type=3Dsocket,udp=3Dlocalhost:1234,localaddr=3Dlocalhost:5678)=
=20
>>=20
>> which works great.
>>=20
>> The downside of this approach is that I need to keep track of all the
>> UDP ports in use and that there's a potential for clashes.  Clearly,
>> having Unix domain sockets where I could store the sockets in the
>> VM's directory would be much easier to manage.
>>=20
>> However, even though there is some AF_UNIX support in net/socket.c,
>> it's
>>=20
>> - not configurable
>> - it doesn't work
>=20
> I hate to say this, but I've been working on something very similar
> just in the past days, with the notable difference that I'm using
> stream-oriented AF_UNIX sockets instead of datagram-oriented.
>=20
> I have a similar use case, and after some experiments I picked a
> stream-oriented socket over datagram-oriented because:
>=20
> - overhead appears to be the same
>=20
> - message boundaries make little sense here -- you already have a
>  32-bit vnet header with the message size defining the message
>  boundaries
>=20
> - datagram-oriented AF_UNIX sockets are actually reliable and there's
>  no packet reordering on Linux, but this is not "formally" guaranteed
>=20
> - it's helpful for me to know when a qemu instance disconnects for any
>  reason
>=20

IMO, dgram is the right tool for this as it is symmetrical to using a =
UDP transport... Since I need to pick up those packets from outside of =
Qemu (inside of a custom networking fabric) I'd have to make assumptions =
about the data and don't know the length of the packet in advance. Using =
the datagram approach fits nicely into this concept.  So, yes, in my =
instance the transport IS truly connectionless and VMs just keep sending =
packets if the fabric isn't there or doesn't pick up their packets.

And maybe there's use for both, as there's currently already support for =
connection oriented (TCP) and connectionless (UDP) inet transports.=20

>> As a side note, I tried to pass in an already open FD, but that
>> didn't work either.
>=20
> This actually worked for me as a quick work-around, either with:
> 	https://github.com/StevenVanAcker/udstools
>=20
> or with a trivial C implementation of that, that does essentially:
>=20
> 	fd =3D strtol(argv[1], NULL, 0);
> 	if (fd < 3 || fd > INT_MAX || errno)
> 		usage(argv[0]);
>=20
> 	s =3D socket(AF_UNIX, SOCK_STREAM, 0);
> 	if (s < 0) {
> 		perror("socket");
> 		exit(EXIT_FAILURE);
> 	}
>=20
> 	if (connect(s, (const struct sockaddr *)&addr, sizeof(addr)) < =
0) {
> 		perror("connect");
> 		exit(EXIT_FAILURE);
> 	}
>=20
> 	if (dup2(s, (int)fd) < 0) {
> 		perror("dup");
> 		exit(EXIT_FAILURE);
> 	}
>=20
> 	close(s);
>=20
> 	execvp(argv[2], argv + 2);
> 	perror("execvp");
>=20
> where argv[1] is the socket number you pass in the qemu command line
> (-net socket,fd=3DX) and argv[2] is the path to qemu.
>=20


As I was looking for dgram support I didn't even try with a stream =
socket ;)


>> So, I added some code which does work for me... e.g.
>>=20
>> - can specify the socket paths like -netdev
>> id=3Dbla,type=3Dsocket,unix=3D/tmp/in:/tmp/out
>> - it does forward packets between two Qemu instances running
>> back-to-back
>>=20
>> I'm wondering if this is of interest for the wider community and, if
>> so, how to proceed.
>>=20
>> Thanks,
>> -ralph
>>=20
>> Commit
>> =
https://github.com/rschmied/qemu/commit/73f02114e718ec898c7cd8e855d0d5d5d7=
abe362
>=20
> I think your patch could be a bit simpler, as you could mostly reuse
> net_socket_udp_init() for your initialisation, and perhaps rename it =
to
> net_socket_dgram_init().

Thanks... I agree that my code can likely be shortened... it was just a =
PoC that I cobbled together yesterday and it still has a lot of =
to-be-removed lines.


> Anyway, I wonder, would my approach work for you instead? I'm posting =
my
> patch in a minute.
>=20
> --=20
> Stefano
>=20


