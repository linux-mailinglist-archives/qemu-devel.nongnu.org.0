Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AF63AE7F2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 13:12:44 +0200 (CEST)
Received: from localhost ([::1]:34302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHr9-0002Ws-Pe
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 07:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvHlz-0000Qv-H1
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:07:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvHlu-0005n5-OB
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:07:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624273637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cvGT0/pr8f5vrzJJUACsqfqjDcXrqZcs4xbNZ8GKRig=;
 b=Pginn5Hi9Lo6fZQ7VNjIW0PJXoHg+OpfRWf2pvDyyTeSN40REJcaEKUK+UtKzKLCm8n+X3
 5AZxDpDbfk36y2z0jQ5PZf0yZGWkzBV/k4dVFpm1KlYrU9F7Yx2v2P0hru3LtARDk/87oQ
 SlqZsJwYdT9xx/s9SEMqEqMli/axlHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-39-QRJfzAA2MSisSaEDsN1tGQ-1; Mon, 21 Jun 2021 07:07:14 -0400
X-MC-Unique: QRJfzAA2MSisSaEDsN1tGQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55931800C60;
 Mon, 21 Jun 2021 11:07:13 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A06A5D9CA;
 Mon, 21 Jun 2021 11:07:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EB17718000B4; Mon, 21 Jun 2021 13:07:10 +0200 (CEST)
Date: Mon, 21 Jun 2021 13:07:10 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2] ui/gtk: Allow user to select monitor number to
 display qemu in full screen through new gtk display option
Message-ID: <20210621110710.u7stl5la2cp5mlqw@sirius.home.kraxel.org>
References: <20210617020609.18089-1-swee.aun.khor@intel.com>
 <8735tfsa79.fsf@dusky.pond.sub.org>
 <DM8PR11MB571712EDA6522BB50D192A63AF0A9@DM8PR11MB5717.namprd11.prod.outlook.com>
 <20210621065148.o7yggutrxgvdnpc7@sirius.home.kraxel.org>
 <875yy739hv.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <875yy739hv.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Khor, Swee Aun" <swee.aun.khor@intel.com>, "Romli,
 Khairul Anuar" <khairul.anuar.romli@intel.com>,
 "eblake@redhat.com" <eblake@redhat.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > I don't think qemu has to worry much here, and trying to automatically
> > adapt to hot-plugged monitors might even have bad interactions with
> > whatever the display server is going to do.
> 
> I'm concerned there is a TOCTTOU issue:
> 
>     if (opts->u.gtk.has_monitor) {
>         int n_monitor;
> 1.      n_monitor = gdk_display_get_n_monitors(window_display);
> 
> 2.      if ((opts->u.gtk.monitor <= n_monitor) &&
>             (opts->u.gtk.monitor > 0)) {
>             GdkScreen *gdk_screen;
>             gdk_screen = gdk_display_get_default_screen(window_display);
> 3.          gtk_window_fullscreen_on_monitor(GTK_WINDOW(s->window), gdk_screen,
>                                              (opts->u.gtk.monitor - 1));
>         } else {
>             fprintf(stderr, "Invalid GTK monitor argument\n");
>         }
>     }
> 
> If monitors can go at any time, then the check 2. cannot ensure we pass
> a valid monitor number at 3.
> 
> I asked what happens when we pass an invalid monitor number.  I'm not
> sure I understand sweeaun's answer.
> 
> If what happens is sane, then why have check 2.?

gtk_window_fullscreen_on_monitor() seems to be a "best effort" offer and
it doesn't return error codes.  So catching possible user errors looks
useful to me.  The code should use error_report instead though (or maybe
warn_report given this is not fatal).  Reporting the valid range is
probably a good idea too.

take care,
  Gerd


