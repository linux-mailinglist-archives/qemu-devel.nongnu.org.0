Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 611B535FD47
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 23:27:58 +0200 (CEST)
Received: from localhost ([::1]:37196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWn3F-0006pH-12
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 17:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lWn1s-0006EV-Sy
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 17:26:32 -0400
Received: from mga03.intel.com ([134.134.136.65]:31007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lWn1q-0003K1-22
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 17:26:32 -0400
IronPort-SDR: 5lRLzyo4ByrqqALUaWrrf0UBWej+Uf0PBYOoeTQ3YYc2MsTjcmplv3YXQmFUjFqEMzmcBbNpWQ
 0xjifWE5gFHQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="194762815"
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="194762815"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 14:26:17 -0700
IronPort-SDR: NyRBwQ8r0WAbDPV1nPG64I+/jW9jxEXnomNQomU5//59AW6MYnuGk3mqYMuMuaJmY8eeWPysLU
 Z7jPPU0WZ3/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,223,1613462400"; d="scan'208";a="612246979"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by fmsmga006.fm.intel.com with ESMTP; 14 Apr 2021 14:26:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 14 Apr 2021 14:26:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 14 Apr 2021 14:26:15 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.013;
 Wed, 14 Apr 2021 14:26:15 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH 00/11] Add support for Blob resources feature
Thread-Topic: [PATCH 00/11] Add support for Blob resources feature
Thread-Index: AQHXJdz2h6I8jP8coE+Bdspyq04keqqyA4vggAJLwgCAADnlAA==
Date: Wed, 14 Apr 2021 21:26:15 +0000
Message-ID: <ad10ac98a4f141e599c177bbab62982e@intel.com>
References: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
 <58a1404f12d9434bae1d336f6553279e@intel.com>
 <20210414094502.krykle6fcv2ehkvg@sirius.home.kraxel.org>
In-Reply-To: <20210414094502.krykle6fcv2ehkvg@sirius.home.kraxel.org>
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
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=vivek.kasireddy@intel.com; helo=mga03.intel.com
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

>=20
> > Any other ideas as to how to eliminate that Blit cleanly?
>=20
> Well, "cleanly" pretty much implies "supported by toolkit".
[Kasireddy, Vivek] I was kind of hoping you'd not draw that implication :)
>=20
> gtk glarea for example sets up a framebuffer and expects the application =
render to that
> framebuffer.  So qemu glarea code does a fb-to-fb blit.
[Kasireddy, Vivek] Right, that is how it works today but we'd like to not h=
ave that
blit and instead submit the Qemu application buffer (i.e Guest FB) directly=
 to the
compositor  -- so that it can be placed on a hardware plane should the comp=
ositor
decide to do so. Only then it'd be absolute zero-copy but the compositor ma=
y decide
to composite it which would mean another blit that we cannot avoid.=20

I am trying to make a concerted effort to accomplish this using GTK/GLArea:
https://gitlab.gnome.org/GNOME/gtk/-/merge_requests/3410

But I get a feeling that it is inadequate as GTK/GLArea does not manage the=
 wl_buffers
submitted to the compositor -- EGL does. I suspect we either need to use a =
new GTK
mechanism -- that perhaps does not exist yet -- or not use GTK at all for t=
his.

I do understand that adding a new purely Wayland backend would make it redu=
ndant given
that GTK, SDL, Spice, etc already support Wayland; however, I do not see an=
y good options
available for eliminating that blit.

Thanks,
Vivek

>=20
> Other reasons are scaling and cursor rendering.  Not all reasons apply to=
 all UIs.  I think
> when using spice qemu doesn't blit (not fully sure what happens inside sp=
ice-server), but it
> could very well be that the spice-client does the blit instead, i.e. we j=
ust shift the issue to
> another place ...
>=20
> take care,
>   Gerd


