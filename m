Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C033619E0
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 08:35:23 +0200 (CEST)
Received: from localhost ([::1]:36902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXI4X-0005B5-OC
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 02:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lXI34-0004ac-8u
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 02:33:50 -0400
Received: from mga17.intel.com ([192.55.52.151]:46391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lXI31-0007IP-Id
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 02:33:49 -0400
IronPort-SDR: yH15NPPf3KhSm9D5jwSmBREhuCo5REKs2o0mWEPeXBKT1DEmZvjV7U8onSqn+BGohhwg6GK83s
 IXfaxvpQnh2A==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="175104298"
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="175104298"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 23:33:40 -0700
IronPort-SDR: v+nauwuaYedTUeHX+lysXoHku4Yvn4yfIOwG7cUHiYC6WtLsEgZID7UkR0Pw6LPizK5QDBFN1Q
 OM1ubt4nDM2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,226,1613462400"; d="scan'208";a="382973346"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 15 Apr 2021 23:33:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 15 Apr 2021 23:33:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 15 Apr 2021 23:33:39 -0700
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.013;
 Thu, 15 Apr 2021 23:33:39 -0700
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: RE: [PATCH 00/11] Add support for Blob resources feature
Thread-Topic: [PATCH 00/11] Add support for Blob resources feature
Thread-Index: AQHXJdz2h6I8jP8coE+Bdspyq04keqqyA4vggAJLwgCAADnlAIABNl+AgAD/oBA=
Date: Fri, 16 Apr 2021 06:33:38 +0000
Message-ID: <d2ae38a134674dbba47b95c3bcf2fc2a@intel.com>
References: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
 <58a1404f12d9434bae1d336f6553279e@intel.com>
 <20210414094502.krykle6fcv2ehkvg@sirius.home.kraxel.org>
 <ad10ac98a4f141e599c177bbab62982e@intel.com>
 <20210415074307.6uohri7zjbiwjilm@sirius.home.kraxel.org>
In-Reply-To: <20210415074307.6uohri7zjbiwjilm@sirius.home.kraxel.org>
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
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=vivek.kasireddy@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?iso-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, "Zhang,
 Tina" <tina.zhang@intel.com>, "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Kim, Dongwon" <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Gerd,

> > I do understand that adding a new purely Wayland backend would make it
> > redundant given that GTK, SDL, Spice, etc already support Wayland;
> > however, I do not see any good options available for eliminating that b=
lit.
>=20
> Well, one idea is using dbus (discovery/setup) and pipewire (data
> streams) to allow other applications access the guest display (also audio=
, input, ...).
> Simliar to gnome exporting the wayland display that way for remote access=
 and screen
> sharing.
>=20
> pipewire supports using dmabufs, so that should allow to decouple user in=
terface code
> from qemu without making compromises on performance, which is probably qu=
ite useful
> for a number of use cases, like a zero-copy wayland client, or a client u=
sing drm directly.
[Kasireddy, Vivek] We considered having a separate client but decided that =
adding the
relevant pieces to Qemu UI would be sufficient. We also felt that the inter=
action between
the client and Qemu for sharing the dmabuf (guest FB) would add to the over=
head and
exacerbate synchronization issues. And, maintaining and distributing such a=
 client would=20
probably not be prudent for us right now.

>=20
> Right now pipewire support is at "idea" level, there isn't even a proof-o=
f-concept for that.
> So it surely doesn't help short-term, but IMHO this makes alot of sense m=
edium/long-
> term.
[Kasireddy, Vivek] Ok, we'll explore this idea further to see if it would w=
ork for our use-case.=20

>=20
> Marc-Andr=E9 has experimental code for a dbus-based UI for qemu.  It does=
n't use pipewire
> as data transport though.  At least the first version posted a while ago =
@ qemu-devel
> doesn't.
[Kasireddy, Vivek] What is the main motivation for a new dbus-based UI for =
Qemu?
Also, would you be able to review the patches in this series soon?

Thanks,
Vivek

>=20
> take care,
>   Gerd


