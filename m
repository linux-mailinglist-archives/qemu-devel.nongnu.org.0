Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32DB573D7D
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jul 2022 22:02:50 +0200 (CEST)
Received: from localhost ([::1]:44860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBiZN-0001DP-Dv
	for lists+qemu-devel@lfdr.de; Wed, 13 Jul 2022 16:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1oBiWc-0007wg-IC
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 15:59:59 -0400
Received: from mga06b.intel.com ([134.134.136.31]:43370 helo=mga06.intel.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1oBiWZ-0007e4-V7
 for qemu-devel@nongnu.org; Wed, 13 Jul 2022 15:59:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657742395; x=1689278395;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MtoDHHwGnEDLxzW172rCu6+iTbmmLqErdj6IiNLgq1w=;
 b=hgm8W9lqMt+r0J39YI3SRu/eqAA09IQhohXPggHFv1kgyDnPDYpSL+Ww
 nlMiXkOq9dDGwuI0db2gi8gc6FqZec4tPzzJmpjYmqNPVltJkoO/Pw+8E
 mf/BjRwLNorJm8OYt3eJlR6Uh4u3tguU4JfBvEs3LCcuPF5fAhkrlJQd4
 BMCM+G5nGPyDaKlVCmYB8l6jgP+lTstcPnu6qYT1R1WOCZUF/4L9OZ2c3
 bKTCXczDreb58AALpiteD9MHqxhlqI9yMXfP/PJ1RcIhlW6zJwRmTg0iI
 nvNFChFswpQEo0kDj5z42TD/Yw2mKkf2+e7mJ6tK4mnYSpW7EhI7ZpDqS Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10407"; a="347014397"
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="347014397"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 12:59:49 -0700
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; d="scan'208";a="545987183"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.121.200.211])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2022 12:59:49 -0700
Date: Wed, 13 Jul 2022 12:59:47 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, berrange@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, f4bug@amsat.org, vivek.kasireddy@intel.com
Subject: Re: [PATCH v4 2/2] ui/gtk: a new array param monitor to specify the
 target displays
Message-ID: <20220713195947.GA53@dongwonk-MOBL.amr.corp.intel.com>
References: <20220711233959.32219-1-dongwon.kim@intel.com>
 <20220711233959.32219-3-dongwon.kim@intel.com>
 <87ilo2uagz.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ilo2uagz.fsf@pond.sub.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=134.134.136.31;
 envelope-from=dongwon.kim@intel.com; helo=mga06.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Tue, Jul 12, 2022 at 08:11:08AM +0200, Markus Armbruster wrote:
> Dongwon Kim <dongwon.kim@intel.com> writes:
> 
> > New integer array parameter, 'monitor' is for specifying the target
> > monitors where individual GTK windows are placed upon launching.
> >
> > Monitor numbers in the array are associated with virtual consoles
> > in the order of [VC0, VC1, VC2 ... VCn].
> >
> > Every GTK window containing each VC will be placed in the region
> > of corresponding monitors.
> >
> > Usage: -display gtk,monitor.<id of VC>=<target monitor>,..
> >        ex)-display gtk,monitor.0=1,monitor.1=0
> >
> > Cc: Daniel P. Berrangé <berrange@redhat.com>
> > Cc: Markus Armbruster <armbru@redhat.com>
> > Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> > ---
> >  qapi/ui.json    |  9 ++++++++-
> >  qemu-options.hx |  3 ++-
> >  ui/gtk.c        | 30 ++++++++++++++++++++++++++++--
> >  3 files changed, 38 insertions(+), 4 deletions(-)
> >
> > diff --git a/qapi/ui.json b/qapi/ui.json
> > index 413371d5e8..ee0f9244ef 100644
> > --- a/qapi/ui.json
> > +++ b/qapi/ui.json
> > @@ -1195,12 +1195,19 @@
> >  #               assuming the guest will resize the display to match
> >  #               the window size then.  Otherwise it defaults to "off".
> >  #               Since 3.1
> > +# @monitor:     Array of numbers, each of which represents physical
> > +#               monitor where GTK window containing a given VC will be
> > +#               placed. Each monitor number in the array will be
> > +#               associated with a virtual console starting from VC0.
> > +#
> > +#               since 7.1
> 
> I dislike repeating the type (here: array of numbers) in the
> description.
> 
> Suggest something like
> 
>    # @monitor:     List of physical monitor numbers where the GTK windows
>    #               containing the virtual consoles VC0, VC1, ... are to be
>    #               placed.  (Since 7.1)
> 
> Missing: what happens when there are more VCs than list elements.  Can
> you tell us?

    # @monitor:     List of physical monitor numbers where the GTK windows
    #               containing the virtual consoles VC0, VC1, ... are to be
    #               placed. If a mapping exists for a VC, then it'd be
    #               placed on that specific physical monitor; otherwise,
    #               it'd default to the monitor from where it was launched
    #               since 7.1

How does this look?
> 
> >  #
> >  # Since: 2.12
> >  ##
> >  { 'struct'  : 'DisplayGTK',
> >    'data'    : { '*grab-on-hover' : 'bool',
> > -                '*zoom-to-fit'   : 'bool'  } }
> > +                '*zoom-to-fit'   : 'bool',
> > +                '*monitor'       : ['uint16']  } }
> >  
> >  ##
> >  # @DisplayEGLHeadless:
> 
> [...]
> 

