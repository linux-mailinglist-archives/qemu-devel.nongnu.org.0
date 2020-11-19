Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB672B9AA6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 19:32:49 +0100 (CET)
Received: from localhost ([::1]:52122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfojg-0004p4-R3
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 13:32:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rppt@kernel.org>) id 1kfnsx-0006pS-RH
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:38:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:54858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rppt@kernel.org>) id 1kfnsv-0003XD-HJ
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:38:19 -0500
Received: from kernel.org (unknown [77.125.7.142])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 29EAB246CE;
 Thu, 19 Nov 2020 17:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605807494;
 bh=j8yoUgNPwUrAH9hWklc4JtHbyJwtdVtZfAXrNV5fMkU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MWotZzvHI///F7nXbNuhmcE23HQZ5TAHfxi5tuIfW5aKphZWo8XXUCe3ChRSAXaMu
 wdcf27o/gc8PdtGoPAg1WYJ59h/sNaDRhEECk9lUAzchusO/CfDlzZTbWrUpOojACA
 jzma0oyE1R2w5WYeSpqXSn/IUhBY8iEJuAZsXlrg=
Date: Thu, 19 Nov 2020 19:38:00 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Alexander Graf <graf@amazon.de>
Subject: Re: [PATCH v2] drivers/virt: vmgenid: add vm generation id driver
Message-ID: <20201119173800.GD8537@kernel.org>
References: <3E05451B-A9CD-4719-99D0-72750A304044@amazon.com>
 <300d4404-3efe-880e-ef30-692eabbff5f7@de.ibm.com>
 <da1a1fa7-a1de-d0e6-755b-dd587687765e@amazon.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da1a1fa7-a1de-d0e6-755b-dd587687765e@amazon.de>
Received-SPF: pass client-ip=198.145.29.99; envelope-from=rppt@kernel.org;
 helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 19 Nov 2020 13:31:15 -0500
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
Cc: "asmehra@redhat.com" <asmehra@redhat.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 "dgunigun@redhat.com" <dgunigun@redhat.com>, KVM list <kvm@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 "ghammer@redhat.com" <ghammer@redhat.com>,
 "vijaysun@ca.ibm.com" <vijaysun@ca.ibm.com>, "Weiss,
 Radu" <raduweis@amazon.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Michal Hocko <mhocko@kernel.org>, Andrey Vagin <avagin@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>,
 linux-s390 <linux-s390@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Biggers <ebiggers@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, "Singh,
 Balbir" <sblbir@amazon.com>, "bonzini@gnu.org" <bonzini@gnu.org>,
 Jann Horn <jannh@google.com>, Dmitry Safonov <0x7f454c46@gmail.com>,
 "oridgar@gmail.com" <oridgar@gmail.com>, "Catangiu,
 Adrian Costin" <acatan@amazon.com>, Andy Lutomirski <luto@kernel.org>,
 "gil@azul.com" <gil@azul.com>, "MacCarthaigh, Colm" <colmmacc@amazon.com>,
 "Theodore Y. Ts'o" <tytso@mit.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "areber@redhat.com" <areber@redhat.com>,
 kernel list <linux-kernel@vger.kernel.org>,
 Pavel Emelyanov <ovzxemul@gmail.com>, Linux API <linux-api@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Willy Tarreau <w@1wt.eu>, "Woodhouse,
 David" <dwmw@amazon.co.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 01:51:18PM +0100, Alexander Graf wrote:
> 
> 
> On 19.11.20 13:02, Christian Borntraeger wrote:
> > 
> > On 16.11.20 16:34, Catangiu, Adrian Costin wrote:
> > > - Background
> > > 
> > > The VM Generation ID is a feature defined by Microsoft (paper:
> > > http://go.microsoft.com/fwlink/?LinkId=260709) and supported by
> > > multiple hypervisor vendors.
> > > 
> > > The feature is required in virtualized environments by apps that work
> > > with local copies/caches of world-unique data such as random values,
> > > uuids, monotonically increasing counters, etc.
> > > Such apps can be negatively affected by VM snapshotting when the VM
> > > is either cloned or returned to an earlier point in time.
> > > 
> > > The VM Generation ID is a simple concept meant to alleviate the issue
> > > by providing a unique ID that changes each time the VM is restored
> > > from a snapshot. The hw provided UUID value can be used to
> > > differentiate between VMs or different generations of the same VM.
> > > 
> > > - Problem
> > > 
> > > The VM Generation ID is exposed through an ACPI device by multiple
> > > hypervisor vendors but neither the vendors or upstream Linux have no
> > > default driver for it leaving users to fend for themselves.
> > 
> > I see that the qemu implementation is still under discussion. What is
> 
> Uh, the ACPI Vmgenid device emulation is in QEMU since 2.9.0 :).
> 
> > the status of the other existing implementations. Do they already exist?
> > In other words is ACPI a given?
> > I think the majority of this driver could be used with just a different
> > backend for platforms without ACPI so in any case we could factor out
> > the backend (acpi, virtio, whatever) but if we are open we could maybe
> > start with something else.
> 
> I agree 100%. I don't think we really need a new framework in the kernel for
> that. We can just have for example an s390x specific driver that also
> provides the same notification mechanism through a device node that is also
> named "/dev/vmgenid", no?
> 
> Or alternatively we can split the generic part of this driver as soon as a
> second one comes along and then have both driver include that generic logic.
> 
> The only piece where I'm unsure is how this will interact with CRIU.

To C/R applications that use /dev/vmgenid CRIU need to be aware of it.
Checkpointing and restoring withing the same "VM generation" shouldn't be
a problem, but IMHO, making restore work after genid bump could be
challenging.

Alex, what scenario involving CRIU did you have in mind?

> Can containers emulate ioctls and device nodes?

Containers do not emulate ioctls but they can have /dev/vmgenid inside
the container, so applications can use it the same way as outside the
container.

 
> Alex

-- 
Sincerely yours,
Mike.

