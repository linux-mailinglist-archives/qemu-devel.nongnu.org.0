Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0F7640FDA
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 22:18:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1DPO-0007DY-Af; Fri, 02 Dec 2022 16:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1p1DPM-0007DB-2w
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 16:17:20 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1p1DPJ-0003MD-W6
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 16:17:19 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A4ED7623E8;
 Fri,  2 Dec 2022 21:17:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AEB5C433C1;
 Fri,  2 Dec 2022 21:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670015833;
 bh=Daxnn9PxSBnQ8obySBdXs/Ovh5ZwL9UWPHAxJS63sKY=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=RSCYRwi9hysgKOyVwJQDTH8mRGQd59YQETBzp9rlNcmhbbpM5BjBVs7V3nf7cHBDV
 lxSNpuM1uOPDKeJyikEj0ZPezdXfdDSymlre2rM+OPkf1E58KcH2vyk5b3EDZroWDZ
 rfl3xq2GUjdkDQnucuLWg5jainrPDIboIQKHJVL0wJ3S0r3xv7LJhKqy8I9y7BpeVW
 OLqywA30xZ04b2Zi3lc3xRpu82rGFQ4vm69Xr3v44jbdc2kUvvGAdE1EPmjQmZ538v
 Q5ikTHz+INkccLYZLvWDrPHIjP8+bnFEC3z6AJsDtM7MtguaGUNHrvVg0DxSg8vnRX
 YB0W+7A3HSI9w==
Date: Fri, 2 Dec 2022 13:17:09 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
cc: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-dev@xilinx.com, 
 Paolo Bonzini <pbonzini@redhat.com>, stefano.stabellini@amd.com, 
 alex.bennee@linaro.org, xen-devel@lists.xenproject.org, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>
Subject: Re: [QEMU][PATCH v2 05/11] include/hw/xen/xen_common: return error
 from xen_create_ioreq_server
In-Reply-To: <4b143736-d5a4-ac75-3671-9566a00707af@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2212021316530.4039@ubuntu-linux-20-04-desktop>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
 <20221202030003.11441-6-vikram.garhwal@amd.com>
 <a45c902a-043d-5256-7961-40c8aabd89b4@linaro.org>
 <4b143736-d5a4-ac75-3671-9566a00707af@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-181244257-1670015833=:4039"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=sstabellini@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-181244257-1670015833=:4039
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 1 Dec 2022, Philippe Mathieu-Daudé wrote:
> On 2/12/22 08:19, Philippe Mathieu-Daudé wrote:
> > Hi Stefano and Vikram,
> > 
> > On 2/12/22 03:59, Vikram Garhwal wrote:
> > > From: Stefano Stabellini <stefano.stabellini@amd.com>
> > > 
> > > This is done to prepare for enabling xenpv support for ARM architecture.
> > > On ARM it is possible to have a functioning xenpv machine with only the
> > > PV backends and no IOREQ server. If the IOREQ server creation fails,
> > > continue to the PV backends initialization.
> > > 
> > > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > > Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> > > ---
> > >   include/hw/xen/xen_common.h | 13 ++++++++-----
> > >   1 file changed, 8 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
> > > index 77ce17d8a4..6510ac15e0 100644
> > > --- a/include/hw/xen/xen_common.h
> > > +++ b/include/hw/xen/xen_common.h
> > > @@ -467,9 +467,10 @@ static inline void xen_unmap_pcidev(domid_t dom,
> > >   {
> > >   }
> > > -static inline void xen_create_ioreq_server(domid_t dom,
> > > -                                           ioservid_t *ioservid)
> > 
> > How long are we supposed to maintain this code? Per [*]:
> > 
> >    In general XenProject.org supports stable branches for 18 months full
> >    support plus 18 months security fixes. When a new X.Y.0 release is
> >    made there is usually one more release on the to-be-retired stable
> >    branch to mop up any loose patches sitting in the repository at which
> >    point the branch is retired.
> > 
> > 4.17 was just released. 4.5 was 7 years ago. IIUC EOL'ed 4 years ago.

Hi Philippe,

So far we have not removed any of the old compatibility code in the xen
headers like xen_common.h. However, you have a point and I think we
could do so going forward. Like you wrote, 4.5 was 7 years ago, I would
be happy to remove the old compatibility code to support ancient
releases and that would simplify the code in the QEMU xen headers quite
a bit.

That said, the change in this patch is orthogonal. This is needed anyway
because we can have very modern Xen builds without IOREQ server
capabilities (it is a kconfig option). So we would still need this patch.

Cheers,

Stefano



> > [*]
> > https://wiki.xenproject.org/wiki/Xen_Project_Maintenance_Releases#Stable_Maintenance_Branches
> 
> +Paolo for commit 14efd8d3b5 ("meson, configure: move Xen detection to
> meson"):
> 
>     xen_libs = {
>       '4.11.0': [ 'xenstore', 'xenctrl', 'xendevicemodel', 'xenforeignmemory',
> 'xengnttab', 'xenevtchn', 'xentoolcore' ],
>       '4.10.0': [ 'xenstore', 'xenctrl', 'xendevicemodel', 'xenforeignmemory',
> 'xengnttab', 'xenevtchn', 'xentoolcore' ],
>       '4.9.0': [ 'xenstore', 'xenctrl', 'xendevicemodel', 'xenforeignmemory',
> 'xengnttab', 'xenevtchn' ],
>       '4.8.0': [ 'xenstore', 'xenctrl', 'xenforeignmemory', 'xengnttab',
> 'xenevtchn' ],
>       '4.7.1': [ 'xenstore', 'xenctrl', 'xenforeignmemory', 'xengnttab',
> 'xenevtchn' ],
>       '4.6.0': [ 'xenstore', 'xenctrl' ],
>       '4.5.0': [ 'xenstore', 'xenctrl' ],
>       '4.2.0': [ 'xenstore', 'xenctrl' ],
>     }
> 
> According to repology for the 'xen' package:
> 
>    FreeBSD (ports):    4.16
>    Debian 11:          4.14.5
>    Fedora 35:          4.16.2
>    Ubuntu 20.04:       4.11.3
>    OpenSUSE Leap 15.3: 4.14.1
>    RHEL 8:             ?
> 
--8323329-181244257-1670015833=:4039--

