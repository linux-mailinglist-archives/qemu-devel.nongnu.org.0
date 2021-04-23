Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3573693D6
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 15:40:17 +0200 (CEST)
Received: from localhost ([::1]:34922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZw2b-00035H-2h
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 09:40:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralph.schmieder@gmail.com>)
 id 1lZw0v-0000yF-Li
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:38:35 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:51040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralph.schmieder@gmail.com>)
 id 1lZw0r-0004vQ-JE
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 09:38:32 -0400
Received: by mail-wm1-x32c.google.com with SMTP id u187so6566242wmb.0
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 06:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=P5+TVFNW53vIV5tBPL+MrH4wFNcgMMFLeh07y+/CR7Y=;
 b=PFL7nDSYqlw3MgLUUZxN8OYuCW/28xgIrKfIM9/tToE4Tv91sV3ReKxQBVWGEk04Cc
 S4ySimCt4xWyg1DikxikKizDtBRYASBi94ZSbVX2Us2gbI1Nn/KMF6hca6H1Gk5B5A1W
 m4wMi9sZZ5VH62hV030lR9PqprGyDEimI9pwCbPMw4amj8RW9vYdvYfkz61qXekaZpcs
 yb8dOF55NHD4GQ3dhs6sk89VqTbV/WoSYRoCNYkcJa7EoKeF+UtJaaf+ABlewRXOlEUi
 9FPbnoJNUJ0rQtfS8To/X+fyWm5SJ47ug8Ra8DDU+5bL5RRpr2kC9CRwn6oUIj81zCvj
 ccOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=P5+TVFNW53vIV5tBPL+MrH4wFNcgMMFLeh07y+/CR7Y=;
 b=magT21wNwBO2TRJCDKEpk5kRnROGMrFa9SMbEXOacAWsFWkJsW1ASg6XmGUn4jeba/
 UFEiomNHb+HwsI/Ol8cZRnBBFBeDUWkg8DFUNFyQhnM8QvL1I7vIymoO1elVLZDExzjj
 vX3E4aVULoPGyueaJ1PH2MXCGp7FSxxNwpnFELpPVAHH6Ubmf4wxM7IQuxh+G+EnAAWa
 o+l7sfwUb+r7eiMIL7XGSS2Aj5LTQT04fqxfc++lKyKv3bUJ4AskfkwZONfVACjrJooe
 Q9w3JndriRg7dEsqE7pkjSFt7GF3gJEPtP2vNt1LeTLS+Ark3jB3kjGbtp0gjn0GvhWI
 csVg==
X-Gm-Message-State: AOAM533PmbVK6YcbOiz2Xwr8QLZ9AUAHZtdS8sEBejrHjXnpCf61jEYy
 N6a+l0ayZTIPGDzqBSaXTUs=
X-Google-Smtp-Source: ABdhPJwkmqLzP0bqgnS3Gk8kWIzGNg1Fn6w5aQ7t9tNY/1BS0bbuiCMVYx4BF04dKNOnqm8FZ8PlQw==
X-Received: by 2002:a1c:20c2:: with SMTP id g185mr4305173wmg.74.1619185107187; 
 Fri, 23 Apr 2021 06:38:27 -0700 (PDT)
Received: from ?IPv6:2001:470:1f0b:bcf:1513:9cd9:82b8:bd28?
 ([2001:470:1f0b:bcf:1513:9cd9:82b8:bd28])
 by smtp.gmail.com with ESMTPSA id z15sm8818379wrv.39.2021.04.23.06.38.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Apr 2021 06:38:26 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: socket.c added support for unix domain socket datagram transport
From: Ralph Schmieder <ralph.schmieder@gmail.com>
In-Reply-To: <YIKQZSHKeXjvthDp@redhat.com>
Date: Fri, 23 Apr 2021 15:38:22 +0200
Content-Transfer-Encoding: quoted-printable
Message-Id: <9D581C76-0E48-4C90-AC3B-6A992862DE0A@gmail.com>
References: <1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com>
 <YIKQZSHKeXjvthDp@redhat.com>
To: =?utf-8?B?IkRhbmllbCBQLiBCZXJyYW5nw6ki?= <berrange@redhat.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=ralph.schmieder@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Apr 23, 2021, at 11:16, Daniel P. Berrang=C3=A9 =
<berrange@redhat.com> wrote:
>=20
> On Fri, Apr 23, 2021 at 08:56:48AM +0200, Ralph Schmieder wrote:
>> Hey...  new to this list.  I was looking for a way to use Unix domain =
sockets as a network transport between local VMs.
>>=20
>> I'm part of a team where we run dozens if not hundreds of VMs on a =
single compute instance which are highly interconnected.
>>=20
>> In the current implementation, I use UDP sockets (e.g. something like=20=

>>=20
>> -netdev =
id=3Dbla,type=3Dsocket,udp=3Dlocalhost:1234,localaddr=3Dlocalhost:5678)=20=

>>=20
>> which works great.
>>=20
>> The downside of this approach is that I need to keep track of all the =
UDP ports in use and that there's a potential for clashes.  Clearly, =
having Unix domain sockets where I could store the sockets in the VM's =
directory would be much easier to manage.
>>=20
>> However, even though there is some AF_UNIX support in net/socket.c, =
it's
>>=20
>> - not configurable
>> - it doesn't work
>>=20
>> As a side note, I tried to pass in an already open FD, but that =
didn't work either.
>>=20
>> So, I added some code which does work for me... e.g.
>>=20
>> - can specify the socket paths like -netdev =
id=3Dbla,type=3Dsocket,unix=3D/tmp/in:/tmp/out
>> - it does forward packets between two Qemu instances running =
back-to-back
>>=20
>> I'm wondering if this is of interest for the wider community and, if =
so, how to proceed.
>=20
> As a general rule, any place in QEMU that supports sockets, ought to
> support all of IPv4, IPv6 and UNIX sockets.   Where there are gaps
> it generally just needs someone motivated to provide a patch.

OK, great... The code basically works afaict, so I am wondering if you =
guys are OK with the CLI "unix=3Dpath1:path2" approach and also whether =
patches are sent to this list or whether it's better to open a PR on =
github/gitlab?


Thanks,
-ralph


