Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3DA831A9F3
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Feb 2021 06:15:30 +0100 (CET)
Received: from localhost ([::1]:49716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAnHF-0007PN-6X
	for lists+qemu-devel@lfdr.de; Sat, 13 Feb 2021 00:15:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lAnGQ-0006z9-Um
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 00:14:38 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:45498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@gmail.com>)
 id 1lAnGP-00068t-B7
 for qemu-devel@nongnu.org; Sat, 13 Feb 2021 00:14:38 -0500
Received: by mail-ed1-x531.google.com with SMTP id t5so2173588eds.12
 for <qemu-devel@nongnu.org>; Fri, 12 Feb 2021 21:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qnNf5186hIY8JsPby8wCWW2OK0Fzyi13un+3K222ps4=;
 b=FjTMORdy7ehixLbeQGtuwEz75GEIaAJaCqop4Td75wOMRC73aL147KZ/jzRzzO2ZnW
 UQzFBnmKxnScs1ierYQDLlsOIQg+PB1MbbpFxPKZN0QJpknnis/BrJ/pJfNR5LyfABcj
 uQUN/sMteh93sJr2D4S2nN4BlJQnpkfOSOmue1c9Vu1amj8yua38zYci71f/Brlo8EM/
 he8KMWw0RzeoxkAbb4crHyPVmvZau9krgCAj37gEX2XlUAYHSHBvqDG2pNwUduvh8jbZ
 Ui2uGNCnSRbj6LYP3/GNNLy6QzeNIiUQ5OBnoJ07sIp2GyYpBLdFEm2fNb/+sSwYZ2Eo
 Ks7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qnNf5186hIY8JsPby8wCWW2OK0Fzyi13un+3K222ps4=;
 b=ArF5DDm1OyvQXtt6yfMtL7bLR2YZmz8qNuj8RGN0+SqIiu8/0+RaSoN8wXQq0XYae2
 3ZEBIjJMurVT1/ANtLREuni7z8C4uNxcsUOre0avQ+Bzj4dVjJpC9SLK0FWczePZ9lRI
 L+fxr3s4PSfhNLusK3N+cRyEFpqY0qvKt9XHacS7u20Z2LYdViqoFATaAT25ldcRaly8
 gt+gOM+LnBProtKWmqxb1LYCYVkQTiZVHpOmjccvsSnoULjoY5MNirIksJEh67NdXV6i
 nLlerySTBwBCFzHlgslWLwGjXLtFM0UOql0bzEwQe1ZFNpOzprxhTra2O+1kIZ8MB2ti
 sxSg==
X-Gm-Message-State: AOAM530gmqDTxg2tooCy1ZWE5gAYD0bLQ37VnjYpIQXtL0CoKAg4duT9
 sjJBy14wHTpUGkPwUVs9SqyHOsnMsSPn/I3FRjc=
X-Google-Smtp-Source: ABdhPJzI9JDtKlQxqHRwL4zkOhsGoiaXnkR5ZG3krnQaNQCGEO66+cP7KvsdGcoqUjj9mFUrB9gNzo0EsDDdGHTC2eQ=
X-Received: by 2002:a05:6402:40c6:: with SMTP id
 z6mr6456564edb.360.1613193275268; 
 Fri, 12 Feb 2021 21:14:35 -0800 (PST)
MIME-Version: 1.0
References: <mailman.1760.1613121930.30133.qemu-devel@nongnu.org>
 <1E9D7BA4-C070-48AE-9989-70EA04FE547D@gmail.com>
In-Reply-To: <1E9D7BA4-C070-48AE-9989-70EA04FE547D@gmail.com>
From: Akihiko Odaki <akihiko.odaki@gmail.com>
Date: Sat, 13 Feb 2021 14:14:24 +0900
Message-ID: <CAMVc7JWYxM4sd6KSFO5q8Cae0YOQvN8-9xbAVc0dUR49nAhxMw@mail.gmail.com>
Subject: Re: Virgil 3D renderer on macOS
To: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=akihiko.odaki@gmail.com; helo=mail-ed1-x531.google.com
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
Cc: qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

2021=E5=B9=B42=E6=9C=8813=E6=97=A5(=E5=9C=9F) 12:20 Programmingkid <program=
mingkidx@gmail.com>:
> I am also an M1 Mac owner. I don't know very much about graphics cards bu=
t I would be happy to help if you need a tester.

I don't need a tester now because I have not fixed even likely-obvious
performance and compatibility problems which I can find out easily if
I debug it or I run some serious performance/conformance test
programs. But thank you for your proposal.

>
> I was doing a lot of thinking about implementing a 3D video card in QEMU.=
 One option was to port PCem's Voodoo2 card to QEMU. Another option was to =
implement the ATI Rage 128 card. Drivers wouldn't probably be a problem sin=
ce they already exist for Mac OS and Windows. One issue users might encount=
er is game support. Both these cards are older and probably are missing fea=
tures that newer games need. Then there's the problem of proprietary firmwa=
re files these cards probably use. So I was wondering what your opinion on =
this issue. Should we focus on emulating a real video card or focus on maki=
ng Virgil 3D compatible with more operating systems?

The latter. I have no idea how complex such ancient accelerators are,
but probably fewer people than those interested in Virgil are
interested in them. The difference is quite important; you can reuse
code written for different purposes if you hack an existing program,
Virgil. In the case of my port, I made Virgil 3D renderer run on a
macOS/CGL host where it was mainly written for Linux/DRM hosts. You
can do the same, and port Virgil 3D drivers which already exist to
other platforms although it should be much harder than my port, which
is essentially fixes of some minor problems of programs written with
standard APIs (OpenGL).

