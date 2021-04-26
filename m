Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B0336B2B9
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 14:07:40 +0200 (CEST)
Received: from localhost ([::1]:49814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb01b-0002on-RA
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 08:07:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralph.schmieder@gmail.com>)
 id 1lazzk-00029c-9Y
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 08:05:44 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralph.schmieder@gmail.com>)
 id 1lazzi-0000sH-AK
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 08:05:44 -0400
Received: by mail-ed1-x529.google.com with SMTP id q6so6131205edr.3
 for <qemu-devel@nongnu.org>; Mon, 26 Apr 2021 05:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=YFPo6vajRSWgGTydZJlzzkXjDaEWwyMMvJZj1owHO7A=;
 b=XCneiAj8V4oiqIXpghR3qibUpZD/dxU+al+lPU16v5/SFkS4BpV316kiOEZVlfDQVk
 1Y8ZhrIpJVlpeAekYYMPlIQvpK4jGCkWNlVDK0ghXepJJ6+466VoVoaJ+1rWO2Iy4xoh
 JYekcjJRjb5mPSWMRD/gJdmyWZ6lt+SR6pGIIDOeMWsJTWYg4IBs4rLh9yKiGwPZbbcx
 Q/nTga4cgmTvC/8F8h9MIz8miPkphlNFTpaspyXD37fZJHoxwl+mUMxNcnOu7CUC+1o8
 hK3Z+Kb4+9ey4NmhmTlV3lbuNsRRc3SOhls/H49iS3abc/0vBz+d0LxZiS8HXD+A5x4z
 CSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=YFPo6vajRSWgGTydZJlzzkXjDaEWwyMMvJZj1owHO7A=;
 b=siSvEJ/E8abm3qMyr31YmeyLmfIbwpIDV5CvfmtNcYgyRsSzXBLEzxbn9on/q6+r03
 ciuUkzCRyLiU2J785RWsD3SiuEgX3eWrtgT8zDYh9lX1UXIHlY2tCXGAZKP0KjwGVHUW
 6+aAFDl2yA0thqIKm95WtnHACAhUVDn2bpFvfOx29j+X12AJURVwjbDGXC1R7VhvwPyn
 /VVK81H4M5NpCOMS7Ai2fG68Wh600PwUV48h2MO5PqdWx9Je4tk4sVSCwJvhXE2+dYDq
 DXvYjTrh6yNQLwD1SZw6SWojP2LPy0hgpDe9TK4CXX0/9q8iB9/iL4vuCqDne3Fhdh8z
 n+fA==
X-Gm-Message-State: AOAM530z3nEM9unHQHOK9axJqOwm32fDJ5+R3YxoBfgj5/D9mh1Hityd
 DEnJ7VgYnMOB2Q290RoyObuWR8csJME+ng==
X-Google-Smtp-Source: ABdhPJyA/ZZsZjnUojP9XlxS2QPoZfnlHaI411Zs6NfI366rcgh7DLyCgTAFKKHsstNTAQQbKAiwVw==
X-Received: by 2002:a05:6402:42d1:: with SMTP id
 i17mr20210511edc.131.1619438740606; 
 Mon, 26 Apr 2021 05:05:40 -0700 (PDT)
Received: from ?IPv6:2001:470:1f0b:bcf:fd39:b1d0:730d:5edb?
 ([2001:470:1f0b:bcf:fd39:b1d0:730d:5edb])
 by smtp.gmail.com with ESMTPSA id hs26sm11140044ejc.23.2021.04.26.05.05.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 26 Apr 2021 05:05:40 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: socket.c added support for unix domain socket datagram transport
From: Ralph Schmieder <ralph.schmieder@gmail.com>
In-Reply-To: <20210423185408.6d5d14f0@redhat.com>
Date: Mon, 26 Apr 2021 14:05:39 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <88B7C1D9-40FB-4B2C-8CE0-D752D54C80B4@gmail.com>
References: <1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com>
 <20210423172940.14f48b49@elisabeth> <YIL0Ehmfgc1J9Ci9@redhat.com>
 <20210423185408.6d5d14f0@redhat.com>
To: Stefano Brivio <sbrivio@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=ralph.schmieder@gmail.com; helo=mail-ed1-x529.google.com
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



> On Apr 23, 2021, at 18:54, Stefano Brivio <sbrivio@redhat.com> wrote:
>=20
> On Fri, 23 Apr 2021 17:21:38 +0100
> Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>=20
>> On Fri, Apr 23, 2021 at 05:29:40PM +0200, Stefano Brivio wrote:
>>> Hi Ralph,
>>>=20
>>> On Fri, 23 Apr 2021 08:56:48 +0200
>>> Ralph Schmieder <ralph.schmieder@gmail.com> wrote:
>>>=20
>>>> Hey...  new to this list.  I was looking for a way to use Unix =
domain
>>>> sockets as a network transport between local VMs.
>>>>=20
>>>> I'm part of a team where we run dozens if not hundreds of VMs on a
>>>> single compute instance which are highly interconnected.
>>>>=20
>>>> In the current implementation, I use UDP sockets (e.g. something =
like=20
>>>>=20
>>>> -netdev
>>>> id=3Dbla,type=3Dsocket,udp=3Dlocalhost:1234,localaddr=3Dlocalhost:567=
8)=20
>>>>=20
>>>> which works great.
>>>>=20
>>>> The downside of this approach is that I need to keep track of all =
the
>>>> UDP ports in use and that there's a potential for clashes.  =
Clearly,
>>>> having Unix domain sockets where I could store the sockets in the
>>>> VM's directory would be much easier to manage.
>>>>=20
>>>> However, even though there is some AF_UNIX support in net/socket.c,
>>>> it's
>>>>=20
>>>> - not configurable
>>>> - it doesn't work =20
>>>=20
>>> I hate to say this, but I've been working on something very similar
>>> just in the past days, with the notable difference that I'm using
>>> stream-oriented AF_UNIX sockets instead of datagram-oriented.
>>>=20
>>> I have a similar use case, and after some experiments I picked a
>>> stream-oriented socket over datagram-oriented because:
>>>=20
>>> - overhead appears to be the same
>>>=20
>>> - message boundaries make little sense here -- you already have a
>>>  32-bit vnet header with the message size defining the message
>>>  boundaries
>>>=20
>>> - datagram-oriented AF_UNIX sockets are actually reliable and =
there's
>>>  no packet reordering on Linux, but this is not "formally" =
guaranteed
>>>=20
>>> - it's helpful for me to know when a qemu instance disconnects for =
any
>>>  reason =20
>>=20
>> The current IP socket impl for the net socket backend uses =
SOCK_DGRAM,
>> so from a consistency POV it feels sensible todo the same for UNIX
>> sockets too.
>=20
> That's just for UDP though -- it also supports TCP with the "connect=3D"=

> parameter, and given that a stream-oriented AF_UNIX socket behaves =
very
> similarly, I recycled that parameter and just extended that bit of
> documentation.
>=20
>> None the less, your last point in particular about wanting to know
>> about disconnects feels valid, and if its useful to you for UNIX
>> sockets, then it ought to be useful for IP sockets too.
>>=20
>> IOW, I wonder if  we should use DGRAM for UNIX sockets too by default
>> to match current behaviour, but then also add a CLI option that =
allows
>> choice of DGRAM vs STREAM, and wire that up for IP & UNIX sockets.
>=20
> The choice would only apply to AF_UNIX (that is, not to TCP and UDP).
>=20
> The current situation isn't entirely consistent, because for TCP you
> have "connect=3D", for UDP it's "udp=3D" or "mcast=3D", and I'm =
extending the
> "connect=3D" case to support stream-oriented AF_UNIX, which I think is
> consistent.
>=20
> However, to have it symmetric for the datagram-oriented case
> (UDP and AF_UNIX), ideally it should be changed to
> "dgram=3Dhost:port|path" -- which I guess we can't do.

That's what I thought, too. It would be canonical but would break =
backwards compatibility... hence impossible to change the existing =
parameter from udp to dgram.

However, an alternative would be to use the dgram approach for both UDP =
and UDS dgram and keep the UDP option for backwards compatibility.

The code would have to ensure that the dgram param type matches the =
localaddr param type and that localaddr has to be present if dgram is =
provided (as with UDP currently).


>=20
> I see two alternatives:
>=20
> 1.
>  - "connect=3D" (TCP only)
>  - "unix=3Dpath,type=3Ddgram|stream"
>  - "udp=3D" (UDP only)
>=20
> 2.
>  - "connect=3D" (TCP and AF_UNIX stream)
>  - "unix_dgram=3D"
>  - "udp=3D" (UDP only)
>=20

> The major thing I like of 2. is that we save some code and a further
> option, but other than that I don't have a strong preference.
>=20
> --=20
> Stefano


