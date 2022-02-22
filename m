Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8654BFDF3
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:00:02 +0100 (CET)
Received: from localhost ([::1]:33676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMXa5-0004w4-R1
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:00:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1nMWhh-00062k-H8
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:03:49 -0500
Received: from [2604:1380:4641:c500::1] (port=48712 helo=dfw.source.kernel.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1nMWhf-0001Dx-0F
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 10:03:49 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E0B3861589;
 Tue, 22 Feb 2022 15:03:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE1CC340E8;
 Tue, 22 Feb 2022 15:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645542218;
 bh=sF29agGyHsX8Udu48FPCpvs/QyXfpzPgjgx5kraSddQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f3dsrr0hoHdYTBf6UbJFOKQ+S+xQzLXMxVRXUzG1yPzzaz8CIqigtGy7weXYheNW+
 ha4/yrxPLMPW5w0NsBZ66wlB5D9/zq7n+hKDbBmT+HudU2/6lxUryeSUbFuB9p4T8D
 3euJoh+8xmA7a102HjWhUks7/FPGlzMArzkyTIPJFd5e4ha05TcBRKOSHje+57a1Be
 aaGXMV5b9+UcoVPx5Xq+3tySqxTuEofCjivfWck2TwmmjtLF/ltpRH8EqmI9cKCbpu
 y9RGo2LpA6XLf3XyhEkS3VK3fjDIh07KqFwThMwLoWoIcnziACpri9Ar450kvLj5Lv
 hqJtwdE2TGvZQ==
Date: Tue, 22 Feb 2022 07:03:35 -0800
From: Keith Busch <kbusch@kernel.org>
To: Stefan Hajnoczi <stefanha@gmail.com>
Subject: Re: Call for GSoC and Outreachy project ideas for summer 2022
Message-ID: <20220222150335.GA1497257@dhcp-10-100-145-180.wdc.com>
References: <CAJSP0QX7O_auRgTKFjHkBbkBK=B3Z-59S6ZZi10tzFTv1_1hkQ@mail.gmail.com>
 <YhMtxWcFMjdQTioe@apples>
 <CAJSP0QVNRYTOGDsjCJJLOT=7yo1EB6D9LBwgQ4-CE539HdgHNQ@mail.gmail.com>
 <YhN+5wz3MXVm3vXU@apples>
 <CAJSP0QXz6kuwx6mycYz_xzxiVjdVR_AqHnpygwV4Ht-7B9pYmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJSP0QXz6kuwx6mycYz_xzxiVjdVR_AqHnpygwV4Ht-7B9pYmw@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2604:1380:4641:c500::1
 (failed)
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=kbusch@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Sergio Lopez <slp@redhat.com>,
 kvm <kvm@vger.kernel.org>, Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 John Snow <jsnow@redhat.com>, Alex Agache <aagch@amazon.com>,
 qemu-devel <qemu-devel@nongnu.org>, "Florescu, Andreea" <fandree@amazon.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Rust-VMM Mailing List <rust-vmm@lists.opendev.org>,
 Klaus Jensen <its@irrelevant.dk>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Hannes Reinecke <hare@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 22, 2022 at 09:48:06AM +0000, Stefan Hajnoczi wrote:
> On Mon, 21 Feb 2022 at 12:00, Klaus Jensen <its@irrelevant.dk> wrote:
> >
> > Yes, I'll go ahead as mentor for this.
> >
> > @Keith, if you want to join in, let us know :)

Thank you for setting this up, I would be happy assist with the cause!

> > Suggested updated summary:
> >
> > QEMU's NVMe emulation uses the traditional trap-and-emulation method to
> > emulate I/Os, thus the performance suffers due to frequent VM-exits.
> > Version 1.3 of the NVMe specification defines a new feature to update
> > doorbell registers using a Shadow Doorbell Buffer. This can be utilized
> > to enhance performance of emulated controllers by reducing the number of
> > Submission Queue Tail Doorbell writes.
> >
> > Further more, it is possible to run emulation in a dedicated thread
> > called an IOThread. Emulating NVMe in a separate thread allows the vcpu
> > thread to continue execution and results in better performance.
> >
> > Finally, it is possible for the emulation code to watch for changes to
> > the queue memory instead of waiting for doorbell writes. This technique
> > is called polling and reduces notification latency at the expense of an
> > another thread consuming CPU to detect queue activity.
> >
> > The goal of this project is to add implement these optimizations so
> > QEMU's NVMe emulation performance becomes comparable to virtio-blk
> > performance.
> >
> > Tasks include:
> >
> >     Add Shadow Doorbell Buffer support to reduce doorbell writes
> >     Add Submission Queue polling
> >     Add IOThread support so emulation can run in a dedicated thread
> >
> > Maybe add a link to this previous discussion as well:
> >
> > https://lore.kernel.org/qemu-devel/1447825624-17011-1-git-send-email-mlin@kernel.org/T/#u
> 
> Great, I have added the project idea. I left in the sq doorbell
> ioeventfd task but moved it after the Shadow Doorbell Buffer support
> task and made it clear that the ioeventfd can only be used when the
> Shadow Doorbell Buffer is enabled:
> https://wiki.qemu.org/Google_Summer_of_Code_2022#NVMe_Emulation_Performance_Optimization

Looks great, this seems like a very useful addition to have. I like that
the feature can be broken down into two parts. Hopefully that makes it
more approachable.

