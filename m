Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2CF3D7DF3
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 20:47:20 +0200 (CEST)
Received: from localhost ([::1]:39878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8S6o-0002ln-Ty
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 14:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m8S5n-00023o-Ph
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 14:46:15 -0400
Received: from mga01.intel.com ([192.55.52.88]:21065)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m8S5j-0002Kz-SA
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 14:46:15 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="234379791"
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="234379791"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 11:46:03 -0700
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="580318294"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.254.51.248])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 11:46:03 -0700
Date: Tue, 27 Jul 2021 11:46:01 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 1/3] ui/gtk: adds status bar for expressing ups and fps
Message-ID: <20210727184601.GA87@dongwonk-MOBL.amr.corp.intel.com>
References: <20210726222551.28795-1-dongwon.kim@intel.com>
 <YP/CzA+IvMpeTgQh@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YP/CzA+IvMpeTgQh@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=192.55.52.88; envelope-from=dongwon.kim@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found there are no such performance indicators available in Qemu/GTK.
I thought this was the gap as in many fields, users want to check fps or
ups to evaluate graphic or display performance in their use-cases.

Thanks for your feedback!. 

On Tue, Jul 27, 2021 at 09:24:44AM +0100, Daniel P. Berrangé wrote:
> On Mon, Jul 26, 2021 at 03:25:49PM -0700, Dongwon Kim wrote:
> > With a display option, "show-fps=on", qemu adds a status bar and print
> > following performance numbers on the bar,
> > 
> > ups = update per seconds - the rate the guest scanout is updated.
> > fps = frame per seconds - the frame rate of VC's GL drawing area
> > 
> > One function, gd_gl_count_frame is added to count # frames
> > and calculate ups and fps every 100 frames or guest scanout updates.
> 
> This feels like a pretty niche/novelty feature. Is this really
> something we can justify adding to the UI, considering that it
> means we will be maintaining this UI and supporting code long
> term. 
> 
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

