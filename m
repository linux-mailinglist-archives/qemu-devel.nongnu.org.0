Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2932B4661CD
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 11:56:13 +0100 (CET)
Received: from localhost ([::1]:59758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msjl6-0003fr-8S
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 05:56:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1msjkE-0002wG-RY
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 05:55:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1msjk7-0004YI-PK
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 05:55:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638442504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1mU78q6/jOGrvbu0LOpwEzmx2XxlfU0vgWRfaSDoL1M=;
 b=RCDo9l7Cv8hRXUewPG1CG4jZ2DDfPfJj2ceL5MMFjqP7Miji//QlsSv10nqBtLFhOrX6/M
 FQjBoCGgrDa87IUM8kHt7G/ostu7VwXayMNGu92lZPvHMHs8oA0vHPuN99FI5FtDMLJTTY
 q1D6E0ouKg2haYspG1JnjJbnpbsS5hw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-311-aV2YTVaZPsuJDeqdAtHgqg-1; Thu, 02 Dec 2021 05:55:01 -0500
X-MC-Unique: aV2YTVaZPsuJDeqdAtHgqg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48B411006AA5
 for <qemu-devel@nongnu.org>; Thu,  2 Dec 2021 10:55:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EE5775F4E7;
 Thu,  2 Dec 2021 10:54:54 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 405C1180079A; Thu,  2 Dec 2021 11:54:53 +0100 (CET)
Date: Thu, 2 Dec 2021 11:54:53 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH] edid: set default resolution to 1280x800 (WXGA)
Message-ID: <20211202105453.h27qsc3hlnph5y76@sirius.home.kraxel.org>
References: <20211129140508.1745130-1-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211129140508.1745130-1-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 29, 2021 at 02:05:08PM +0000, Daniel P. Berrangé wrote:
> Currently QEMU defaults to a resolution of 1024x768 when exposing EDID
> info to the guest OS. The EDID default info is important as this will
> influence what resolution many guest OS will configure the screen with
> on boot. It can also potentially influence what resolution the firmware
> will configure the screen with, though until very recently EDK2 would
> not handle EDID info.

edk2 support is at "patches exist" level right now, not even merged,
will hopefully land in the next stable tag (feb 22).

Independent from that we plan to change the edk2 default resolution from
the current 800x600 to whatever qemu 7.0 will use, be that 1280x800 (as
suggested by this patch) or 1024x768 (current qemu default).

> One important thing to bear in mind is that the default graphics card
> driver provided by Windows will leave the display set to whatever
> resolution was enabled by the firmware on boot. Even if sufficient
> VRAM is available, the resolution can't be changed without installing
> new drivers. IOW, the default resolution choice is quite important
> for usability of Windows.

It's not that simple.

With uefi firmware windows sticks to whatever resolution the firmware
has initialized (without installing guest drivers).  The resolution can
be changed in the firmware setup.

With bios firmware windows can change the resolution at runtime using
vgabios calls, i.e. after completing the install you can right-click on
the desktop, pick display config in the popup menu, then change the
resolution.

So there are ways to use other resolutions.  They are not exactly
intuitive though and I think it makes sense to modernize the qemu
defaults.

> In considering what possible new default could be suitable, choices
> considered were 1280x720 (720p), 1280x800 (WXGA) and 1280x1024 (SXGA).
> 
> In many ways, vertical space is the most important, and so 720p was
> discarded due to loosing vertical space, despite being 25% wider.
> 
> The SXGA resolution would be good, but when taking into account
> window titlebars/toolbars and window manager desktop UI, this might
> be a little too tall for some users to fit the guest on their physical
> montior.

Yes, with FullHD (1920x1080) being a popular resolution these days
having a 1280x1024 guest display would leave only 56 pixes for title
bar and menus.

> This patch thus suggests a modest change to 1280x800 (WXGA). This
> only consumes 1 MB per colour channel, allowing double buffered
> framebuffer in 8 MB of VRAM. Width wise this is 25% larger than
> QEMU's current default, but height wise this only adds 5%, so the
> difference isn't massive on the QEMU side.

Looks like a good pick to me.

In case someone wants pick that up:
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>

Failing that I'll add that to my first post-freeze pull request.

take care,
  Gerd


