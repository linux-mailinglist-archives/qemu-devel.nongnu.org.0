Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2107C3B3598
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 20:24:45 +0200 (CEST)
Received: from localhost ([::1]:51942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwU1s-0000lf-7r
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 14:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lwTuy-0005Ag-Hz
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:17:36 -0400
Received: from mga07.intel.com ([134.134.136.100]:29236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lwTul-0000MR-7O
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 14:17:36 -0400
IronPort-SDR: DIS9xJ96eNxBYxZpslh+WToo/9WQ0SI8KmCUQYwoC9KZ7y22tq+tuQmoh0Y7q5cwDupnucWdDn
 fR3rNLXAwC9A==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="271384459"
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="271384459"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2021 11:17:14 -0700
IronPort-SDR: GTejrxwaKUc181embOH8oQUn7J9TXm6qJngoxGxPvANXf6wKT4uS00nRuWlRqRk7dQo0L0o8nN
 0fujRZUIxF1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,296,1616482800"; d="scan'208";a="491231097"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 24 Jun 2021 11:17:14 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 24 Jun 2021 11:17:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 24 Jun 2021 11:17:13 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2242.008;
 Thu, 24 Jun 2021 11:17:13 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [RFC v1 0/1] ui: Add a Wayland backend for Qemu UI
Thread-Topic: [RFC v1 0/1] ui: Add a Wayland backend for Qemu UI
Thread-Index: AQHXaLCsRFsl0OL5HkyeIk0iYdTdZKsjSbQAgAAtiwA=
Date: Thu, 24 Jun 2021 18:17:12 +0000
Message-ID: <9134eb849eb34f01a68802f8b754e61e@intel.com>
References: <20210624041040.1250631-1-vivek.kasireddy@intel.com>
 <20210624082812.kxgxdzayfnwr5q7q@sirius.home.kraxel.org>
In-Reply-To: <20210624082812.kxgxdzayfnwr5q7q@sirius.home.kraxel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=vivek.kasireddy@intel.com; helo=mga07.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, "Zhang,
 Tina" <tina.zhang@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Kim, Dongwon" <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

> > Why does Qemu need a new Wayland UI backend?
> > The main reason why there needs to be a plain and simple Wayland backen=
d
> > for Qemu UI is to eliminate the Blit (aka GPU copy) that happens if usi=
ng
> > a toolkit like GTK or SDL (because they use EGL). The Blit can be elimi=
nated
> > by sharing the dmabuf fd -- associated with the Guest scanout buffer --
> > directly with the Host compositor via the linux-dmabuf (unstable) proto=
col.
>=20
> Hmm, that probably means no window decorations (and other UI elements),
[Kasireddy, Vivek] Right, unfortunately, no decorations or other UI element=
s. For
that we can use GTK.=20
> right?  Also the code seems to not (yet?) handle mouse and kbd input.
[Kasireddy, Vivek] Yes, kbd and mouse support not added yet and that is why=
 I
tagged it as WIP. But it should not be too hard to add that.

>=20
> > The patch(es) are still WIP and the only reason why I am sending them n=
ow
> > is to get feedback and see if anyone thinks this work is interesting. A=
nd,
> > even after this work is complete, it is not meant to be merged and can =
be
> > used for performance testing purposes. Given Qemu UI's new direction, t=
he
> > proper way to add new backends is to create a separate UI/display modul=
e
> > that is part of the dbus/pipewire infrastructure that Marc-Andre is
> > working on:
> > https://lists.nongnu.org/archive/html/qemu-devel/2021-03/msg04331.html
>=20
> Separating emulation and UI has the big advantage that the guest
> lifecycle is decoupled from the desktop session lifecycle, i.e.
> the guest can continue to run when the desktop session ends.
>=20
> Works today with spice (when using unix socket to connect it can pass
> dma-buf handles from qemu to spice client).
>=20
> Using dbus instead certainly makes sense.  Whenever we'll just go send
> dma-buf handles over dbus or integrate with pipewire for display/sound
> not clear yet.  Marc-Andr=E9 thinks using pipewire doesn't bring benefits
> and I havn't found the time yet to learn more about pipewire ...
[Kasireddy, Vivek] On our side, we'll also try to learn how dbus and pipewi=
re
fit in and work. Having said that, can Marc-Andre's work be merged in=20
stages -- first only dbus and no pipewire?

Thanks,
Vivek
>=20
> take care,
>   Gerd


