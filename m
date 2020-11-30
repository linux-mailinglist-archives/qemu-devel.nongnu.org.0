Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0F92C900B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Nov 2020 22:29:30 +0100 (CET)
Received: from localhost ([::1]:45148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kjqjh-0002tJ-FN
	for lists+qemu-devel@lfdr.de; Mon, 30 Nov 2020 16:29:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1kjqim-0002KR-6L
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 16:28:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:54446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1kjqik-0000NM-B1
 for qemu-devel@nongnu.org; Mon, 30 Nov 2020 16:28:31 -0500
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 247E62076A;
 Mon, 30 Nov 2020 21:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606771707;
 bh=nRkhpXnGjHJGH3BKb1G/qP5N1PKFw4d6Y40Sy/kY1ps=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=DpdC9uqks5pPHPFDx2tEwTqEET2dzNOoklp05CrqT2LJiBmmRoUqE9evb4PSG+dBM
 KZMUi6Vln0PKwwrCPqooMjAb5F/lzBougs/eR0wrGwNGLSMYsQJTHfWXDVr/nfYuaL
 IPIwgah91UgCxyobhXyX32H4UNvRQPfYEvuvlE4s=
Date: Mon, 30 Nov 2020 13:28:25 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH-for-6.0 v4 15/17] gitlab-ci: Add test for Xen (on CentOS 7)
In-Reply-To: <20201127142407.GC2098@perard.uk.xensource.com>
Message-ID: <alpine.DEB.2.21.2011301326110.1100@sstabellini-ThinkPad-T480s>
References: <20201108204535.2319870-1-philmd@redhat.com>
 <20201108204535.2319870-16-philmd@redhat.com>
 <20201126173824.GB2098@perard.uk.xensource.com>
 <20201126174559.GP2271382@habkost.net>
 <20201127142407.GC2098@perard.uk.xensource.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Received-SPF: pass client-ip=198.145.29.99;
 envelope-from=sstabellini@kernel.org; helo=mail.kernel.org
X-Spam_score_int: -85
X-Spam_score: -8.6
X-Spam_bar: --------
X-Spam_report: (-8.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.496,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Paul Durrant <paul@xen.org>,
 qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 Nov 2020, Anthony PERARD wrote:
> On Thu, Nov 26, 2020 at 12:45:59PM -0500, Eduardo Habkost wrote:
> > On Thu, Nov 26, 2020 at 05:38:24PM +0000, Anthony PERARD wrote:
> > > Is `make check` going to do something useful with the Xen support? Or is
> > > it going to need more work in order to test the Xen support of QEMU?
> > > (Like starting an actual Xen guest.)
> > 
> > I don't think it will test Xen support, but we still want to at
> > least check if --enable-xen doesn't break anything else.
> 
> That sound good.
> 
> > Is there any public CI system anywhere where Xen support is
> > tested today?
> 
> Yes, we have osstest which regularly test Xen with QEMU from upstream.
> Result are sent to xen-devel. But that might not be very useful for
> qemu-devel.
> 
> We also have a GitLab CI which does some Xen tests, but I don't think
> QEMU is tested there.
> https://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=automation/gitlab-ci/test.yaml;hb=HEAD
> https://gitlab.com/xen-project/xen/

QEMU (the version of QEMU picked by the Xen tools) is built but not used
in the Xen Project CI-loop yet.

I am extending the CI-loop with more tests [1], and I would like to have at
least one QEMU test at some point soon. Probably something based on Xen 9pfs.

[1] https://marc.info/?l=xen-devel&m=160627845825763 

