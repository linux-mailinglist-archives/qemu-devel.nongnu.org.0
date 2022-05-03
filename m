Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 201D851926A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 01:45:22 +0200 (CEST)
Received: from localhost ([::1]:59980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm2Cm-0002oJ-L8
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 19:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nm1it-000226-JC
 for qemu-devel@nongnu.org; Tue, 03 May 2022 19:14:28 -0400
Received: from mga04.intel.com ([192.55.52.120]:42286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nm1iq-0001ZE-Gx
 for qemu-devel@nongnu.org; Tue, 03 May 2022 19:14:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651619664; x=1683155664;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=bE0yBISLW9V6aEi6dRlsTqShrbJ/M8YXEkLXuvbWc8E=;
 b=meXptxUj5oay+goYvgpY9FeccEKigkrtqZtvgO95ME3ZKtLSzgyd3b4f
 XIDvh+51XwzUlKyQmnMATZjEeONuU5ZiDdm7av1vXFlyL9O7Y8lk1k6LK
 8jOcUqjyedWVGe4NTIyK6JSpvp5/eDgORG9brBmt5052jLWzf5RS8WiAF
 watrkuCWhxC4JqvZVaLkl4AuXiswSxGeUbnoS8GgNVgU2dM012JL9vSNn
 s683+6rUjVou0oRurkock7O7ZIpamsAF/b6ijbnI2AqpKMkcYqrru2C3K
 OY+Rud6P4kOKwqNuDagsbGQzRjG+BjZS7G5MTVpbLb41PtAknhTJlSudy A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="266459732"
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="266459732"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 16:14:19 -0700
X-IronPort-AV: E=Sophos;i="5.91,196,1647327600"; d="scan'208";a="536562267"
Received: from cboltx-mobl.amr.corp.intel.com (HELO
 dongwonk-MOBL.amr.corp.intel.com) ([10.213.160.175])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 16:14:18 -0700
Date: Tue, 3 May 2022 16:14:16 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, philmd@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 1/3] ui/gtk: new param monitor to specify target monitor
 for launching QEMU
Message-ID: <20220503231416.GA352@dongwonk-MOBL.amr.corp.intel.com>
References: <20220428231304.19472-1-dongwon.kim@intel.com>
 <20220428231304.19472-2-dongwon.kim@intel.com>
 <YnDyodis9sdnyh3O@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YnDyodis9sdnyh3O@redhat.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=192.55.52.120; envelope-from=dongwon.kim@intel.com;
 helo=mga04.intel.com
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

On Tue, May 03, 2022 at 10:15:13AM +0100, Daniel P. Berrangé wrote:
> On Thu, Apr 28, 2022 at 04:13:02PM -0700, Dongwon Kim wrote:
> > Introducing a new integer parameter to specify the monitor where the
> > Qemu window is placed upon launching.
> > 
> > Monitor can be any number between 0 and (total number of monitors - 1).
> > 
> > It can be used together with full-screen=on, which will make the QEMU
> > window full-screened on the targeted monitor.
> > 
> > v2: fixed typos and updated commit subject and msg
> >     (Philippe Mathieu-Daudé)
> > 
> >     changed param name to monitor, removed unnecessary condition check
> >     on the parameter
> >     (Paolo Bonzini)
> > 
> > v3: updated Since version to 7.1 for monitor parameter
> > 
> > Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> > ---
> >  qapi/ui.json    | 6 +++++-
> >  qemu-options.hx | 2 +-
> >  ui/gtk.c        | 8 ++++++++
> >  3 files changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/qapi/ui.json b/qapi/ui.json
> > index 059302a5ef..ddcea7349b 100644
> > --- a/qapi/ui.json
> > +++ b/qapi/ui.json
> > @@ -1204,13 +1204,17 @@
> >  #               assuming the guest will resize the display to match
> >  #               the window size then.  Otherwise it defaults to "off".
> >  #               Since 3.1
> > +# @monitor:     Indicate monitor where QEMU window is lauched. monitor
> > +#               could be any number from 0 to (total num of monitors - 1).
> > +#               since 7.1
> >  #
> >  # Since: 2.12
> >  #
> >  ##
> >  { 'struct'  : 'DisplayGTK',
> >    'data'    : { '*grab-on-hover' : 'bool',
> > -                '*zoom-to-fit'   : 'bool'  } }
> > +                '*zoom-to-fit'   : 'bool',
> > +                '*monitor'       : 'uint32' } }
> 
> I feel like this ought to be an array of monitors, so that we can have
> explicit positioning when we have multiple graphical outputs and are
> creating a separate window for each.

That would be ideal but at the same time, wouldn't it make the option to
specific/complicated? And I am not sure how to create an option that takes the
data in the form of array. Do you have any reference?

> 
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

