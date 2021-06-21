Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAC63AE7F8
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 13:16:03 +0200 (CEST)
Received: from localhost ([::1]:40772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHuM-00075E-HC
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 07:16:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvHt7-0006Iy-N4
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:14:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lvHt4-0000Ci-Vb
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 07:14:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624274082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KdWt2okxlAe7LWzjufp8nJ42YnvkxOQeuAB101Ic4i4=;
 b=i2C1WoG9wGZA60YH5avgU4sOtciF+pA+Y9UDrkXjPvtql8+/BgFyOaTlbbEcDuGeY8Tqjq
 2fIBRvPWFPBsvoO38uWFrY+419IopOxkzDxmbNfePCFwuMkw+VILnZ5hRzArM0ySvyhkEi
 AC+9Bgykfq9ACe+dfO2FGYHgTzwVG/k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-Hz3PG4LVNea9mq528yFTlA-1; Mon, 21 Jun 2021 07:14:39 -0400
X-MC-Unique: Hz3PG4LVNea9mq528yFTlA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77170800D62;
 Mon, 21 Jun 2021 11:14:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A5A85C1C2;
 Mon, 21 Jun 2021 11:14:38 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8F51A18000B4; Mon, 21 Jun 2021 13:14:36 +0200 (CEST)
Date: Mon, 21 Jun 2021 13:14:36 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Khor, Swee Aun" <swee.aun.khor@intel.com>
Subject: Re: [PATCH v2] ui/gtk: Allow user to select monitor number to
 display qemu in full screen through new gtk display option
Message-ID: <20210621111436.l64mvuqpob7lc7dc@sirius.home.kraxel.org>
References: <20210617020609.18089-1-swee.aun.khor@intel.com>
 <8735tfsa79.fsf@dusky.pond.sub.org>
 <DM8PR11MB571712EDA6522BB50D192A63AF0A9@DM8PR11MB5717.namprd11.prod.outlook.com>
 <20210621065148.o7yggutrxgvdnpc7@sirius.home.kraxel.org>
 <DM8PR11MB57176186A481ACE8F5924AB8AF0A9@DM8PR11MB5717.namprd11.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <DM8PR11MB57176186A481ACE8F5924AB8AF0A9@DM8PR11MB5717.namprd11.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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
Cc: "Romli, Khairul Anuar" <khairul.anuar.romli@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eblake@redhat.com" <eblake@redhat.com>, "Kasireddy,
 Vivek" <vivek.kasireddy@intel.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Well, wouldn't it make sense to have monitor=<nr> work for both full-screen=on and full-screen=off cases?
> sweeaun:  Yes. That will be better option for user. However, I not managed to find other GTK window API that can set window into monitor rather than gtk_window_fullscreen_on_monitor so far.    

Hmm, right, nothing obvious at https://developer.gnome.org/gtk3/stable/GtkWindow.html for the non-full-screen case.

Nevertheless the options should have sane semantics.  We could:

  (1) Require full-screen=on in addition to monitor=<nr>.
      That would leave the door open to implement the full-screen=off
      case later if we figure some way to do that.
  (2) Rename the option to full-screen-on-monitor, to make clear this
      automatically enables fullscreen too.

take care,
  Gerd


