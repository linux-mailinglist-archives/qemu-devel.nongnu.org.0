Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878A854F7CD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 14:46:37 +0200 (CEST)
Received: from localhost ([::1]:44558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2BMy-0002Hc-79
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 08:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=160677330=anthony.perard@citrix.com>)
 id 1o2BJB-0008RD-It; Fri, 17 Jun 2022 08:42:41 -0400
Received: from esa1.hc3370-68.iphmx.com ([216.71.145.142]:51042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=160677330=anthony.perard@citrix.com>)
 id 1o2BJ8-000695-VB; Fri, 17 Jun 2022 08:42:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1655469758;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=aQ2JFJdgxW+bvJ7wlrkPH1pYSZsqotk9gFtitGX3Kfo=;
 b=D1fmndEmk7h3rYynn55vaUwXo5QpE413xGsuhT2VuJpdPJoR8gMmFpuq
 tQ4752Hoimiywdb1oLXIRNiXlBmbm0UfVZN1Zh0c/trIJbJd7EDYCgXrY
 TNyNvIBMKTxUt98N1fhKJOrRgeX5v5MWBF7i4bowaHPA2OqcdStJMuAh3 4=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74267833
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:A6+buqOqEc0TJXjvrR2Cl8FynXyQoLVcMsEvi/4bfWQNrUoj3mNRn
 zcWXG6HO//fNmamLtBzO4jl9k9UupLWx9JlQAto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFUMpBsJ00o5wbZn29Aw3bBVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Z2
 fFsiZWqVCkSIKzLid4cYhJ7CjFTBPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gRQayAO
 JpCMlKDajyaYTpoO1I8U6kwt7unp1ehXT9H+W6a8P9fD2/7k1UqjemF3MDuUsWHQNgQglyZu
 GPP+0z/BRcVMsHZziCKmlq3nfPGly7/XIMUFZW7++RsjVnVwXYcYDUOXEa/iem0jAi5Qd03A
 0YO8Sozpqsg3EWsSp/2WBjQiGeJuwNZV9dOHukS7gaLxazJpQGDCQAsXjNHLdArqsIybTgrz
 UOS2cPkAyR1t7+YQm7b8a2bxQ5eIgBMczVEP3VdC1JYvZ+z++nfky4jUP5yNI+Jh8foNwruw
 jeblikPjJYKneMygvDTEU/8v968mnTYZldru1iLBTr/tl4RiJ2NPNLxtwWChRpUBMPAFwTa4
 iBZ8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirnUWWwC
 KMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YsKVPfoH0zPRfNhQgBdXTAdoluU
 ap3jO72VSpKYUiZ5GHeqxghPU8DmXllmDK7qWHTxBW7y7uODEOopUM+GALWNIgRtfrcyC2Mq
 oo3H5bamn13DbylCgGKoNF7ELz/BSVibXwAg5cMLbDrz8sPMDxJNsI9Npt4I9Q7x/8OyraXl
 px/M2cBoGfCabT8AV3iQhhehHnHBP6TcVpT0fQQAGuV
IronPort-HdrOrdr: A9a23:ofSIZKHW6Xg6BiWIpLqE6MeALOsnbusQ8zAXP0AYc3Jom+ij5q
 STdZUgpHrJYVkqNU3I9ertBEDEewK6yXcX2/hyAV7BZmnbUQKTRekIh7cKgQeQeBEWntQts5
 uIGJIeNDSfNzdHsfo=
X-IronPort-AV: E=Sophos;i="5.92,306,1650945600"; d="scan'208";a="74267833"
Date: Fri, 17 Jun 2022 13:42:21 +0100
To: Chuck Zmudzinski <brchuckz@aol.com>
CC: <qemu-devel@nongnu.org>, <xen-devel@lists.xenproject.org>,
 <qemu-trivial@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>, Paul
 Durrant <paul@xen.org>
Subject: Re: [PATCH v2] xen/pass-through: merge emulated bits correctly
Message-ID: <Yqx2rYn+9jEV679a@perard.uk.xensource.com>
References: <b6718a3512ec0a97c6ef4a5b5c1f3de72238c603.1654961918.git.brchuckz.ref@aol.com>
 <b6718a3512ec0a97c6ef4a5b5c1f3de72238c603.1654961918.git.brchuckz@aol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <b6718a3512ec0a97c6ef4a5b5c1f3de72238c603.1654961918.git.brchuckz@aol.com>
Received-SPF: pass client-ip=216.71.145.142;
 envelope-from=prvs=160677330=anthony.perard@citrix.com;
 helo=esa1.hc3370-68.iphmx.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

On Sat, Jun 11, 2022 at 12:43:29PM -0400, Chuck Zmudzinski wrote:
> In xen_pt_config_reg_init(), there is an error in the merging of the
> emulated data with the host value. With the current Qemu, instead of
> merging the emulated bits with the host bits as defined by emu_mask,
> the emulated bits are merged with the host bits as defined by the
> inverse of emu_mask. In some cases, depending on the data in the
> registers on the host, the way the registers are setup, and the
> initial values of the emulated bits, the end result will be that
> the register is initialized with the wrong value.
> 
> To correct this error, use the XEN_PT_MERGE_VALUE macro to help ensure
> the merge is done correctly.
> 
> This correction is needed to resolve Qemu project issue #1061, which
> describes the failure of Xen HVM Linux guests to boot in certain
> configurations with passed through PCI devices, that is, when this error
> disables instead of enables the PCI_STATUS_CAP_LIST bit of the
> PCI_STATUS register of a passed through PCI device, which in turn
> disables the MSI-X capability of the device in Linux guests with the end
> result being that the Linux guest never completes the boot process.
> 
> Fixes: 2e87512eccf3
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1061
> Buglink: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=988333
> 
> Signed-off-by: Chuck Zmudzinski <brchuckz@aol.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

Thank you, looks like it's been a long quest to figure this one out.

-- 
Anthony PERARD

