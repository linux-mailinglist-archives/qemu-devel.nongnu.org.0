Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E6F3CFA70
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:21:50 +0200 (CEST)
Received: from localhost ([::1]:60424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pgz-0004Mx-Ns
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:21:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <movement@li1368-133.members.linode.com>)
 id 1m5pVK-0000Hx-7J
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:09:46 -0400
Received: from ssh.movementarian.org ([2a01:7e00::f03c:92ff:fefb:3ad2]:38782
 helo=movementarian.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <movement@li1368-133.members.linode.com>)
 id 1m5pVI-0002QD-GS
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 09:09:45 -0400
Received: from movement by movementarian.org with local (Exim 4.93)
 (envelope-from <movement@li1368-133.members.linode.com>)
 id 1m5pV9-008wZ7-Ql; Tue, 20 Jul 2021 13:09:35 +0000
Date: Tue, 20 Jul 2021 13:09:35 +0000
From: John Levon <levon@movementarian.org>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Subject: Re: [PATCH RFC server 01/11] vfio-user: build library
Message-ID: <20210720130935.GA2121545@li1368-133.members.linode.com>
References: <cover.1626675354.git.elena.ufimtseva@oracle.com>
 <cover.1626722742.git.jag.raman@oracle.com>
 <5002d6a67cb6c429b2e3d21e106b468176e82a1f.1626722742.git.jag.raman@oracle.com>
 <20210719202409.GB1443636@movementarian.org>
 <0268673C-D5FD-4288-B7E6-B4B6D3CCCD23@oracle.com>
 <CAJ+F1CKkPV7GtR0NobyXm3SuR7ohde5Z8HdDGeogeqYSAj+-mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CKkPV7GtR0NobyXm3SuR7ohde5Z8HdDGeogeqYSAj+-mw@mail.gmail.com>
X-Url: http://www.movementarian.org/
Received-SPF: none client-ip=2a01:7e00::f03c:92ff:fefb:3ad2;
 envelope-from=movement@li1368-133.members.linode.com; helo=movementarian.org
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, KHOP_HELO_FCRDNS=0.398, RCVD_IN_XBL=0.375,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John Johnson <john.g.johnson@oracle.com>, Jag Raman <jag.raman@oracle.com>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "f4bug@amsat.org" <f4bug@amsat.org>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 20, 2021 at 04:20:13PM +0400, Marc-André Lureau wrote:

> > >> +  libvfiouser = static_library('vfiouser',
> > >> +                               build_by_default: false,
> > >> +                               sources: vfiouser_files,
> > >> +                               dependencies: json_c,
> > >> +                               include_directories: vfiouser_inc)
> >
> >     This way appears to be present convention with QEMU - I’m also not
> > very clear
> > on the reason for it.
> >
> > I’m guessing it’s because QEMU doesn’t build all parts of a submodule. For
> > example, QEMU only builds libfdt in the doc submodule. Similarly,
> > libvfio-user only builds the core library without building the tests and
> > samples.
> >
> You can give subproject options to build limited parts.
> 
> Fwiw, since libvfio-user uses cmake, we may be able to use meson
> cmake.subproject() (https://mesonbuild.com/CMake-module.html).

That'd be great. We also briefly discussed moving away from cmake anyway - since
both SPDK and qemu are meson-based, it seems like it would make sense. I'd
prefer it to be easy to regularly update libvfio-user within these projects.

Ideally, running qemu tests would actually run libvfio-user tests too, for some
level of assurance on the library's internal expectations.

regards
john

