Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DD086128
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 13:53:57 +0200 (CEST)
Received: from localhost ([::1]:48660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvgzU-0007pw-Of
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 07:53:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48739)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hvgyZ-0007Q1-Qm
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 07:53:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hvgyY-0006Rt-Gj
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 07:52:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54908)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hvgyW-0006Qq-A5
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 07:52:57 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8155F30BEBEB;
 Thu,  8 Aug 2019 11:52:54 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 997EE6012E;
 Thu,  8 Aug 2019 11:52:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 14AD1113864E; Thu,  8 Aug 2019 13:52:25 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Giuseppe Lettieri <giuseppe.lettieri@unipi.it>
References: <20190806151435.10740-1-armbru@redhat.com>
 <20190806151435.10740-28-armbru@redhat.com>
 <8c2a6fad-6ac1-21b1-c17c-e1bd5ac41c9f@redhat.com>
 <87a7ckrat7.fsf@dusky.pond.sub.org>
 <ee3709c9-f351-081a-3aeb-53b7b6036b0a@redhat.com>
 <87imr8l0ti.fsf_-_@dusky.pond.sub.org>
 <695325d7-a0c3-73c1-97ab-f62fb345c622@unipi.it>
Date: Thu, 08 Aug 2019 13:52:25 +0200
In-Reply-To: <695325d7-a0c3-73c1-97ab-f62fb345c622@unipi.it> (Giuseppe
 Lettieri's message of "Thu, 8 Aug 2019 09:27:52 +0200")
Message-ID: <87blwzho1y.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 08 Aug 2019 11:52:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] Is network backend netmap worth keeping?
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Vincenzo Maffione <v.maffione@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Giuseppe Lettieri <giuseppe.lettieri@unipi.it> writes:

> Dear Markus,
>
> the netmap project is alive and well, if a bit understuffed. We have
> moved to github:
>
> https://github.com/luigirizzo/netmap
>
> We have users from FreeBSD, where it is part of the official kernel,
> and Linux, both from Academia and industry.
>
> But you asked about the netmap backend in QEMU, in particular. When it
> was merged, the decision was made to disable it by default because it
> was not supported upstream in Linux. As Jason Wang says, this support
> is even more unlikely now than it was then.
>
> The fact the the backend has to be explicitly enabled and built from
> the sources has obviously cut down the number of potential
> users. However, we still think it is useful and we have pending
> updates for it. If it's causing problems in the workflow, I am willing
> to help as much as I can.

Could we make it a submodule, simililar to slirp and capstone?

    --enable-netmap=system      use the system's netmap
    --enable-netmap=git         use the git submodule
    --enable-netmap             use system's, else git, else fail
    --disable-netmap            disable netmap
    default                     use system's, else git, else disable

A fresh clone of https://github.com/luigirizzo/netmap clocks in at
14MiB, which is between libslirp's 1.5MiB and capstone's 72MiB.

