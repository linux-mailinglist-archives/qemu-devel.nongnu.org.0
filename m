Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE16325393
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 17:34:48 +0100 (CET)
Received: from localhost ([::1]:51304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFJbD-0005Ev-A2
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 11:34:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lFJYF-0003tF-Of
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 11:31:43 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:42027)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lFJY9-0002BF-O2
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 11:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Cc:
 Content-ID:Content-Description;
 bh=upbhcPvTDll9o9VVt1G+2DG4a+cndDZvHoepW8CGA4Q=; b=OQCUo3CrHLWPygn8vQnkbh8TfW
 dNT5hqzZLLVAkNqo9FwlIeGh4QUC31w4OK4zGBLg91wXLQcuskFB0XyfmD/W3SIZ7x5AeeXP10DFh
 njeUueMy5oCUH45APr3DoNB/LL0sOnnuUGwTWAQyfrQQCrOitAG0qoNZSF43nuYHqmtabnZ+H4Kr1
 hvFqL9DO+gwf925jzyYq7A0nj0WVDM5QnTJhFEHswv+55ouG5AGw2HzKYs0/gFxJDJO4HDUPn8wJr
 RgYttOrFATbcCuQTQTcTdt+ieDaAii4pOFSlI+0ZG5q9zFDpwkcpEJcedI0jzW4wHZSRU8L9JmHy4
 FKhaw+2N22PpLSE3wVtUwBBaegiFAxxig5JOagpRQZ1R4qRUwzu9UtSVccJiYemPyQ0bvOBSNXDDL
 fQHAsf+oHjcduRwSf3yAoi0Jd2AJgaACKjqBjOmtyiS0awl2qM0nkgB+lvlKrUYpU8KE388dj65bX
 i8Ueyhsy/XqYaovIOjzaYZCWVkg04wKD2d0+8WXLPTC19h5dTegfuS1PEd+ivgPPbdMIR4L9g3LrA
 xbUkA7qDWQRpioDcB6+6J7RBjd+3jcwYyl5tkb3MM6y+J2sT85LmW/g4BPb83Ca7aV+VljBUEyFbp
 9EbmUmEHAgS0xlBr4PwTCgH1nA63XaIU1RdqhbEmQ=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Subject: Re: 9pfs developers docs
Date: Thu, 25 Feb 2021 17:31:22 +0100
Message-ID: <1713522.Q2EPVctnWf@silver>
In-Reply-To: <18968671.BsRifgzQ0d@silver>
References: <3475760.T70ipHyFzN@silver> <20210201132649.6db25cec@bahia.lan>
 <18968671.BsRifgzQ0d@silver>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 1. Februar 2021 14:37:02 CET qemu_oss--- via wrote:
> On Montag, 1. Februar 2021 13:26:49 CET Greg Kurz wrote:
> > > > I agree that a bunch of other things should be documented, but that's
> > > > definitely a great start. Thanks for doing this !
> > > > 
> > > > Just one remark on the topology diagram:
> > > > 
> > > > https://wiki.qemu.org/File:9pfs_topology.png
> > > > 
> > > > It gives the impression that the 9p transport and server can
> > > > handle multiple guests, which they certainly don't : each
> > > > 9p server lives in exactly one device which is exposed to
> > > > exactly one guest.
> > > 
> > > Right, I haven't considered that the diagram might be interpreted that
> > > way. My primary intention was to show the 3 main components of 9pfs from
> > > design perspective and secondary showing that multiple guests can share
> > > storage.
> > > 
> > > So what would be better: a) duplicating the server side in the diagram
> > > (then the image might become a bit large in height), b) dropping the
> > > multiple guests, c) making the issue with server instances clear in the
> > > text?
> > 
> > I'd rather go for b)
> 
> Updated the diagram on the wiki page.
> 
> To keep noise low, I won't send emails on further changes to that wiki page.
> If you want to be auto notified then just add yourself to the watch list
> there.

Ok, I think I'm done with this page:
https://wiki.qemu.org/Documentation/9p

At least I think I've described everything I wanted to from my side regarding 
current 9p status.

Best regards,
Christian Schoenebeck



