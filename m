Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D7342D998
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 14:57:17 +0200 (CEST)
Received: from localhost ([::1]:54068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb0IN-0003Q9-UW
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 08:57:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mb0HB-0002fA-JW
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 08:56:01 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:48211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mb0H9-0000rs-Jr
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 08:56:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=bnxqSOwgw0n6hicGAXRCL1Bxd/VXT2Zk+5bkIwNdo9k=; b=VIgc0qsL6FGie7Z0AEG5K/HlG8
 m59q5OFx9/TJxqfZClIoyKNV/y+m5MAPqpKKI9LYqFUVjCw23wxRm3+zL550iDlxvWHbY3SIoiHEV
 XiPQJPMOj3y+Q0waP58kzmc07P75jFntiIkqxcL6Th4E5RyQi532vdD8nbLX9Y1rKQBZUCaDwL7uJ
 fJeExFBtsflIkZReG/i6gq2+9M1XVZ5g6UlW0nNwTxIDlVj4+i7ZMqnfukDSywlhhHNNHsh5SLvx1
 pkwuAuazSMsLj525Ll+LjShqEZW0bBLtoGndblEfK7Ex09KbcAg5z3e4aI5Jcoo23WBQXJEOxwDG4
 6jWvHmz4HdCEEYdqu8phspssaCntu0//EqnaXhsGA4vm9Vt2h8m3g4F4Eug7T4avbnz3gDUiTryAJ
 m1u8Mf01tTkAMlrXZTBadDn3zxow/ITv8lcKDbakOzyJG17bff5WP7GvjWOpXrJzAFs7wZ7AdWxYg
 ZkyFrbwjL+3HYjqI9xueFdEd77yyXQS7waJu5aMW8fqBNxrNuumgbE8pyRZTq8aYXf0BpWuzBEZWt
 yxTqpZ35hus8KT6R/+yreiuFIPnR2JNxNZc/oejLyvAvJru6kQuaoNgSfxfx2MNw0Xy+0wzjnYhVW
 DdTy5EWflj+u5Y6YsclcnPfzyAQy/ianr6UeNoSeg=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 00/11] 9p: Add support for Darwin
Date: Thu, 14 Oct 2021 14:55:55 +0200
Message-ID: <3493661.FTZtrCqsiM@silver>
In-Reply-To: <CAB26zV17E_b_-nnLBTeH2QxT=c7vy9zvPak+Tp4TkyECNGUS-Q@mail.gmail.com>
References: <20211013230405.32170-1-wwcohen@gmail.com>
 <7858538.Xg4lN0sot7@silver>
 <CAB26zV17E_b_-nnLBTeH2QxT=c7vy9zvPak+Tp4TkyECNGUS-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
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

On Donnerstag, 14. Oktober 2021 14:22:19 CEST Will Cohen wrote:
> Correct. It's been tested and functions when applied to QEMU master, with
> host running macOS Big Sur 11.6 (personal machine) using client 9p2000.L
> (taking a cue from the guest mounting instructions on
> https://wiki.qemu.org/Documentation/9psetup).

So it was the Linux kernel's 9p client on guest side with 9p 'local' fs dri=
ver=20
and 9p transport driver was 'virtio-pci'.

I was just wondering if somebody already bothered for macOS being the guest=
,=20
because that use case is a bit more challenging, especially with macOS 11 a=
nd=20
higher. But I see that's nothing you were into.

> On Thu, Oct 14, 2021 at 7:57 AM Christian Schoenebeck <
>=20
> qemu_oss@crudebyte.com> wrote:
> > On Donnerstag, 14. Oktober 2021 12:48:55 CEST Will Cohen wrote:
> > > Many thanks for all the clarifications =E2=80=94 it=E2=80=99s my firs=
t time using
> > > git-send-email and first time with mailing-list-based devel workflows.
> >=20
> > Will
> >=20
> > > adjust accordingly, work through gitlab, and eventually resend via
> > > git-publish as v2.
> >=20
> > So the intended use case is macOS being host.
> >=20
> > Has this been tested, and if yes, using which 9p client and which macOS
> > version?
> >=20
> > Best regards,
> > Christian Schoenebeck



