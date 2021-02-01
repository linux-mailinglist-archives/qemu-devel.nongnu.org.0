Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AC130A8FE
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 14:46:35 +0100 (CET)
Received: from localhost ([::1]:53428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6ZXH-0001DR-1H
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 08:46:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l6ZVf-0000e2-F0
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 08:44:55 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:40783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l6ZVd-0002G9-Qr
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 08:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=NSfzzg66V22Cg9lDrfS+bxyMqgFzRk42zAoegwnZzEU=; b=PI4V7HwK+KwVcGOWzuutkNJOsC
 OXlUydtgVV7J+dkJaKvsAvmQxeTPbe4nqoA6dxMDS3oBP+cY6QCypYmJSQjy9jUUhwF1ZWLN+UTGR
 n2/01348FsrTDAgxxOhV1jrPbVE0Rfv9ORPjoBlpCZy0OXxlmfrRi2WPcX+aPYxBVrZRZg+oepHUx
 fGLmZUOWuXXrsp9lAbzpWuMyvkCyYdo1hxKUKWTBVIY4Ide1WjolMJ02ti3/PONrDXqC6wWBuNt6n
 X0Eq9f5Rwz/TL2uv24MeiYeyK7kdiiy6y4iSmTrK3M4gUBkjFZIkfWoPjB0qL93SjrB7eJudyqvCH
 z8v7bkZ30oj10ZnpFODI00I7k1Zzq6CheCCB2qS/t+dVt7/1ZoEGTu8QmjRO8ooX1F3Cr6qrXRXjC
 haFuVsuHolm2s86JTqFXY7JexmrWrxYLLaSC+tNV3sOS5FzCLMt/aFg1h0twXVlynGRDrPZfZ8ihq
 7jynYNmzwv39VL+6d2u0xAg1bTG32uZPKAcOEXROoSQdRpjDYz/XWkA5qrmXBHWk/p0AZQDian6iB
 hKy95SAPj3VeIo67+u4DX5Qtotg4PrOyUx+rDE759P+SqepFSN9djUd3fBJ2p1U/aHAxiPdgmsfHE
 5NGPOBx82e4STWs/FTyNDxGxRcTsMmKGqz9WaYIDo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Subject: Re: 9pfs developers docs
Date: Mon, 01 Feb 2021 14:44:50 +0100
Message-ID: <6582125.VqjDZda3nx@silver>
In-Reply-To: <CAFEAcA8M29hEVu0XQAk0+fhDsmkDPu7foKAKP75ptEz_KFD+-Q@mail.gmail.com>
References: <3475760.T70ipHyFzN@silver>
 <CAFEAcA8M29hEVu0XQAk0+fhDsmkDPu7foKAKP75ptEz_KFD+-Q@mail.gmail.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 1. Februar 2021 12:42:44 CET Peter Maydell wrote:
> On Sun, 31 Jan 2021 at 18:25, Christian Schoenebeck
> 
> <qemu_oss@crudebyte.com> wrote:
> > I started setting up some developer documentation for 9pfs:
> >         https://wiki.qemu.org/Documentation/9p
> > 
> > Still quite a bunch that should be added (e.g. there should be a section
> > about threads and coroutines), but at least it's a start ...
> 
> Thanks for working on this; our developer docs of QEMU internals
> are very patchy and improvements and additions to them are very welcome.
> 
> The wiki's a good place for initial work on the docs, since it
> allows quick iteration and collaboration. When you think the docs
> are in a more final state you might consider moving them into
> docs/devel/ as an rst file, so they become part of the developer
> manual.
> 
> thanks
> -- PMM

I wonder how that is solved on kernel.org, because they also have a wiki and 
in-tree rst files. Maybe they have some way to merge content between the two 
in a sensible way.

Best regards,
Christian Schoenebeck



