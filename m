Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D4630A8E5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 14:38:25 +0100 (CET)
Received: from localhost ([::1]:51098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ZPM-0007rp-7w
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 08:38:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l6ZOD-0007NN-MX
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 08:37:13 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:34529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l6ZOB-0007En-9w
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 08:37:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=HxngDtfwgZGWft2UaGyWUwBEQVq3Q1tK50A/kmfivoI=; b=Y2TIzR/XPHdqghysoCK/c7IfK2
 SBEXQf6zgZ1U13GTLSSJDOYdQwq6+hRe62tQlfrOKfurecEX+mmCcUCevDBVzJVycg7XKJvhsRup4
 UYRijmPYFmX/MUab2c4iiB8j7MDfEFGK9ykGIN8ZFuluUOPw87EalhECJ3+5MW+QRtOq31Q8ZaqAc
 cofA87G/4450Nqd7yIrqqkNsVaDGJbKK9DXLgoU2m9OHM5MBSN0p3UFJxooMXeOrXFeNq5Rt8O9Ve
 j/ZwE+Z4lU6iLQ8c1d8teqCbozuFshVg463TRdy+ezTrORLiaZKTnd1rkLokMhJCarUM47rPXQr7C
 GXvKCmkzmfZJO62iGB/ZIWEGzCys6ZUfl7IypVOmOVErhBJX+wR0Jhvvqgvyga0eqZA3wlsE45RXE
 fyWSn++SzLUlMLFnvvHGeMz2pBeTIkY4BCjJxS4j7oDTyrMsrigzzJGBY0RbPHnKwJxn1olY9eR9L
 gq+4C63GjnMs60Z3pW/KAf2Tlf1cM2UWBAmHwxDJzMua/Vs3fOeUKC5RHJQj+9X2yLoUAQKRyjlCL
 60UFqEoDuEV5s/TS0AgpP3YwyUXuttflpPZ53iKZalnh8dxdkBFeY/TIwKg23vT2zN/XFjzr/dxVL
 rSF0gqvqCALnibssANioryD+EsfYPXXU1VQ6aILGM=;
To: qemu-devel@nongnu.org
Subject: Re: 9pfs developers docs
Date: Mon, 01 Feb 2021 14:37:02 +0100
Message-ID: <18968671.BsRifgzQ0d@silver>
In-Reply-To: <20210201132649.6db25cec@bahia.lan>
References: <3475760.T70ipHyFzN@silver> <3962897.vStEPALNoS@silver>
 <20210201132649.6db25cec@bahia.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Christian Schoenebeck <qemu_oss@crudebyte.com>
From: qemu_oss--- via <qemu-devel@nongnu.org>

On Montag, 1. Februar 2021 13:26:49 CET Greg Kurz wrote:
> On Mon, 01 Feb 2021 12:30:52 +0100
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > On Montag, 1. Februar 2021 10:24:26 CET Greg Kurz wrote:
> > > On Sun, 31 Jan 2021 19:23:52 +0100
> > > 
> > > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > > Hi,
> > > 
> > > Hi Christian,
> > > 
> > > > I started setting up some developer documentation for 9pfs:
> > > > 	https://wiki.qemu.org/Documentation/9p
> > > > 
> > > > Still quite a bunch that should be added (e.g. there should be a
> > > > section
> > > > about threads and coroutines), but at least it's a start ...
> > > 
> > > I agree that a bunch of other things should be documented, but that's
> > > definitely a great start. Thanks for doing this !
> > > 
> > > Just one remark on the topology diagram:
> > > 
> > > https://wiki.qemu.org/File:9pfs_topology.png
> > > 
> > > It gives the impression that the 9p transport and server can
> > > handle multiple guests, which they certainly don't : each
> > > 9p server lives in exactly one device which is exposed to
> > > exactly one guest.
> > 
> > Right, I haven't considered that the diagram might be interpreted that
> > way. My primary intention was to show the 3 main components of 9pfs from
> > design perspective and secondary showing that multiple guests can share
> > storage.
> > 
> > So what would be better: a) duplicating the server side in the diagram
> > (then the image might become a bit large in height), b) dropping the
> > multiple guests, c) making the issue with server instances clear in the
> > text?
> I'd rather go for b)

Updated the diagram on the wiki page.

To keep noise low, I won't send emails on further changes to that wiki page. 
If you want to be auto notified then just add yourself to the watch list 
there.

> > If there are other things that you might think should be outlined by
> > additional diagram(s) let me know, then I can add that in one rush.
> > 
> > --
> > 
> > BTW I'm no longer able to run the 'local' 9p tests, --slow doesn't work
> > for
> > me. If you don't have an idea what I might be missing, then I have to look
> > why the CLI parameter is not interpreted.
> 
> Is it that '-m slow' doesn't work when running 'qos-test' or
> that 'make check-qtest SPEEP=slow' doesn't run the slow tests ?

Ah, that's '-m slow', not '--slow'. Yeah, that works for qos-test. I added the 
'-m slow' switch to the wiki page as well.

For now I can live with that, as I am more commonly calling qos-test directly. 
But it would be nice if the slow tests would make it into the general chain of 
all QEMU tests accordingly again.

> The latter was discussed on IRC last year but I don't know if
> anyone has tried to investigate this yet.
> 
> Nov 24 11:36:53 <groug>	th_huth, Hi. FYI it seems that the meson conversion
> kinda broke 'make check SPEED=slow'. Test programs aren't passed '-m slow'
> Nov 24 11:51:42 <f4bug>	th_huth: do you know who uses/tests SPEED=slow? Nov
> 24 11:52:03 <f4bug>	th_huth: I thought this was a block-related feature 
Nov
> 24 11:52:44 <groug>	f4bug, it is supposedly used by gitlab CI
> Nov 24 11:52:59 <groug>	.gitlab-ci.yml:    MAKE_CHECK_ARGS: check-qtest
> SPEED=slow Nov 24 12:50:53 <th_huth>	groug, I'm also running make check
> SPEED=slow manually sometimes ... I guess that got lost in the conversion
> to ninja ... bonzini, did you ever try? Nov 24 12:51:03 <bonzini>	no it
> shouldn't
> Nov 24 12:51:21 <th_huth>	let me check...
> Nov 24 12:51:40 <bonzini>	ah, the tests are chosen correctly but -m slow 
is
> lost Nov 24 12:52:02 <groug>	yes that's what I see
> Nov 24 12:54:04 <groug>	bonzini, missing bits in scripts/mtest2make.py ?
> Nov 24 12:54:28 <bonzini>	groug: sort of, but assuming that all 
executables
> support -m slow wouldn't work
> 
> Cc'ing Thomas and Paolo for additional details.
> 
> > Best regards,
> > Christian Schoenebeck



