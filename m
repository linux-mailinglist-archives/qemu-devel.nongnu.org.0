Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F10051924B
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 01:25:23 +0200 (CEST)
Received: from localhost ([::1]:54306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm1tR-00052v-Ki
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 19:25:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nm1qB-0002XI-W9
 for qemu-devel@nongnu.org; Tue, 03 May 2022 19:22:00 -0400
Received: from mga11.intel.com ([192.55.52.93]:17005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nm1q2-0005E9-Ez
 for qemu-devel@nongnu.org; Tue, 03 May 2022 19:21:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651620110; x=1683156110;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xE5KRAWGsYEOC7KOozQbnPEsGSpfX57aHRjOuMKwf6c=;
 b=R/pcMZuMCX3XoV6YUocWL9xNTi9Sz8LkiaF5SEy4w0OuNhWpakqGnnQf
 3TkaVRjJD6yZMGGebnveVeG9Yfk7YnMbnEdGpCSZhMcofmleuoELWqSvI
 c78l3WGGvv3W7Rt2Jla5S6dKmQlXK8mil50iO99Z1ldeyz9f3gzHvFRuC
 zHQrV5r3a9fXnBuM1Kdf9JZaIAVMJowOPbUWxGyE3Xb0+zk8YTe29Mofi
 H4nFBBjp7tlbDczU9NZzcc4yDrCNjwFaZtS91DL6GjP42PIXTV0fMtq0Z
 T2BSs8UX0KC544i6yPRAIBSucPdWmI0dJ8gIdT2p3YyEthg5dit5Uj1Fo w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="265204776"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="265204776"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 16:21:48 -0700
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="692729016"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.213.160.175])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 16:21:47 -0700
Date: Tue, 3 May 2022 16:21:44 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, philmd@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 2/3] ui/gtk: detach_all option for making all VCs
 detached upon starting
Message-ID: <20220503232144.GB352@dongwonk-MOBL.amr.corp.intel.com>
References: <20220428231304.19472-1-dongwon.kim@intel.com>
 <20220428231304.19472-3-dongwon.kim@intel.com>
 <YnDyC4jvC/V0o33Z@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YnDyC4jvC/V0o33Z@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=192.55.52.93; envelope-from=dongwon.kim@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, May 03, 2022 at 10:12:43AM +0100, Daniel P. Berrangé wrote:
> On Thu, Apr 28, 2022 at 04:13:03PM -0700, Dongwon Kim wrote:
> > With "detach-all=on" for display, QEMU starts with all VC windows
> > detached automatically.
> > 
> > If used with "full-screen=on", it places individual windows (from
> > top window) starting from monitor 0 or monitor n in case monitor=n.
> > 
> > In case # mon < # VCs, only same number of VCs as # mon will be sent to
> > the monitors for full-screen while others are remaining in windowed-mode.
> > 
> > Target monitor number for individual VC is rotated in case monitor=n
> > (n != 0) (e.g. if monitor=1 and # VCs = 2, the top window will be
> > full-screened on monitor 1 and top second window will be full-screened
> > on monitor 0.)
> 
> I tend to wonder whether we actually need this at all, as opposed
> to just changing QEMU's behaviour by default.
> 
> It makes sense to have tabs per-VC for the things like the HMP
> console, serial ports, etc, but I think graphical video outputs
> should always be displayed as multiple windows. Putting graphical
> outputs as tabs rather defeats the purpose of having multiple
> outputs IMHO. 
> 
> IOW, why won't we just create 1 gtk window per graphical output
> all the time.

I got your point but I think this requires changes in the
policy, which I guess need community-wide agreement. Why don't we move
on with this new option and at the same time start the discussion?

One more point is, I tried to find out but I couldn't think of any good way
to distinguish between guest output consoles and other consoles. Do you
have any thought on this?

> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

