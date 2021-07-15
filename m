Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7373A3C9629
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 05:10:04 +0200 (CEST)
Received: from localhost ([::1]:54590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3rlC-0001XL-LS
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 23:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1m3rjV-0000N4-Uq
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 23:08:18 -0400
Received: from mga05.intel.com ([192.55.52.43]:55278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chen.zhang@intel.com>)
 id 1m3rjQ-0001Vn-PQ
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 23:08:16 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="296109085"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="296109085"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 20:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="562649999"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga004.jf.intel.com with ESMTP; 14 Jul 2021 20:07:54 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 14 Jul 2021 20:07:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 14 Jul 2021 20:07:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 14 Jul 2021 20:07:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqI5nzcu2xywWvNp6ZGqYolLD1E9jYlPbV/52sUkr4HaKbEZLBHOPyWhOXmPUgmHUyWjRRKBRTWLb7zdu7EYYqFH4kcDu8gmK6B+6cmYIafI+TLVvXMNb2BlGtB/fq8fZ+KgoHNS68c7ABWtXJPcnsfxprIRwfBMg//LyhdD0D3WtKvhZTihbRMUAre95rZF7DO8gDQibLZ/No9R6p+M7H4MO0yt3NL7AckTh6auJbDYCRXoSoHExcDx2C/lC5zt+2c2N+q85R+UJuX+rcGqF5dtAuZAANvwxAW/aG5WV1JY362jprq9hoCzzcLZx3k5qBmCyzFIYViBhx3YoOi5rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kW8jiHQJWSAKl5rmeU/hZMrrNfIwnvQvMq8f51MUGio=;
 b=aRSgFFRByok2/PM4Q7pTVkcU+S+qkYtq9sY2MF8/h4RWcmH8GwKSGdDEk/rlVZoTgQYNzoiHX7zbQdPq4eTVbCDLILIc3l2BtZ0WlQAwohkxBqMSQ2y3oiMSG3I90hvaS9rhhYZXmCTGNCY/om4IiUe/uFRWrDFgG7xYVcveYLZzlMhTMKunr+Ak1NQXg0jxfffMil6t1VAcUppvzStILfUfVK4x0ec7Z07wCPNnplz8BzeZxf2RF+oQ6TNVGQC5Tz/JUuhrN7yPOwvNZq0nCj1jVcH4DkGX8Rh+oyh3udek6H6VoiTxJP9XkQnqdKoUcyZyreHmQbzVi5GQT1l5/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kW8jiHQJWSAKl5rmeU/hZMrrNfIwnvQvMq8f51MUGio=;
 b=tuARBRRdMX+us9I8rlNBGgkgUfS/tS7Mhefupl34YDrAgD6tdZt1Csu9IB4hzhGHXdAbp/Qw9WJX5cXRxtN6WcnsSCm2KvQeAHH7mAAMnUhT3BOcq6zYbxkCKP2VXKxD4x1eABuQ5TK/+f6I7h3IZPTa4aemp/aLy1L75MDVFCQ=
Received: from BN0PR11MB5757.namprd11.prod.outlook.com (2603:10b6:408:165::23)
 by BN7PR11MB2691.namprd11.prod.outlook.com (2603:10b6:406:b3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Thu, 15 Jul
 2021 03:07:46 +0000
Received: from BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::d4a2:4607:7235:c6f6]) by BN0PR11MB5757.namprd11.prod.outlook.com
 ([fe80::d4a2:4607:7235:c6f6%9]) with mapi id 15.20.4331.023; Thu, 15 Jul 2021
 03:07:46 +0000
From: "Zhang, Chen" <chen.zhang@intel.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: RE: [PULL V2 3/6] hmp-commands: Add new HMP command for filter
 passthrough
Thread-Topic: [PULL V2 3/6] hmp-commands: Add new HMP command for filter
 passthrough
Thread-Index: AQHXbloWOO+a9uR+c0GNA0i7TSlx+qtC5MsAgACJzqA=
Date: Thu, 15 Jul 2021 03:07:46 +0000
Message-ID: <BN0PR11MB57570940435B251AA6D8DF3F9B129@BN0PR11MB5757.namprd11.prod.outlook.com>
References: <20210701091130.3022093-1-chen.zhang@intel.com>
 <20210701091130.3022093-4-chen.zhang@intel.com> <YO8xWHrtParXqSip@work-vm>
In-Reply-To: <YO8xWHrtParXqSip@work-vm>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1c1160ba-f459-43e3-5d79-08d9473db86a
x-ms-traffictypediagnostic: BN7PR11MB2691:
x-microsoft-antispam-prvs: <BN7PR11MB2691A7586DF2DF7DCF456FE59B129@BN7PR11MB2691.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gOTN6lDZLq1MrTXjAGicocFhsUMSH4U046p6FQ9+DCnNfgO/Gzay4xD6Hk6jBl+SCbhSpJx5F89/N+HDnc0AYVhihsbXde3RDE//5vMJRQDGlJ/aAvTBFuYz8U/9+pT6lVTCEBgfpZN2x5jpXGR78P7rWCW6HWLKPYpzOBZNBfqjfDGOnCmP8DPSvKL9xvSIG1Ga4hCy/37yZD5dDBLrcwAKsQNtY6LczN4+//qzyLTpZ+vK29jHxn6LeRx1NtMsiFSl1WaOswG4XxBdv9++KDUUitUq0lgs3+8hB5Rku05LMbZ0Cb1GhZmVYZMhWpek3EPJtC7iXK59v3YBTSY8mtv1WH09XHteG0z2SNnZbqWxsLCd2FA6ul/YH2WX8jgKbLLLpi8Rn9vzf0uoxcdgIFMLfZPTe/k6r+k6NlLipSr+/7Am2p4+uo4/UzC09H/1qIBHhBcY8TunxOcbHgplqsRB0M9p1WsG4BCNTEsnY651tXdX7JWqKCMYKeZ/V6NcUbOMKkeKzAUTSL+UJPqVod/vq8nspzfEaIPgds3SF5KHHxMXuWPexKUSaRCZyQ+YQp8SEMYtlcqau08X2RkR+0+5+0kOmmvtOVeJerNRMJKqoXsgol63Qe8tulOaeQEcF+gvNmqBmF0n9OlpgVG3c3OBQOj3/QV7NCgObMgmlu3Dzg+84tdsoh3/Iv4PtiAJ6zVijVHbOq4wNEZCrMB08A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(366004)(39860400002)(376002)(9686003)(55016002)(7696005)(66556008)(186003)(52536014)(86362001)(2906002)(26005)(5660300002)(33656002)(316002)(76116006)(8676002)(110136005)(66446008)(478600001)(53546011)(71200400001)(6506007)(54906003)(4326008)(38100700002)(122000001)(8936002)(83380400001)(66946007)(66476007)(64756008)(38070700004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?VwAbHEQmDOr3JGaEBjHlsYIE4QWzHQ8KPG8/zKsqWhMM+7D2OZrn3oFUOc?=
 =?iso-8859-1?Q?qzlUxIiMlQARS3hB+Dgi//CxQpO6KbEcL9v9PN2GF89iRcTRYS9RSSZ4Cm?=
 =?iso-8859-1?Q?iWDUZyFqxsOGQb6ugsXlu0QU1JraaKlySlXlShrHWs/rphE8UXBSAtHjwS?=
 =?iso-8859-1?Q?2LY2pRKQEPGLive6k/jpaYQaJfMX6sQ1vF8syxLWxjZ/+E3UYspPlnMczn?=
 =?iso-8859-1?Q?Ms4FyjnRg556nZm5hO1MbATqOFdtJVBKdvY6Ky1wc226ctxw97sjnb6/HA?=
 =?iso-8859-1?Q?/kD4WNM3seC0FkQOTZLhoyYupV0ntQUXTbjHz3d0rzcdvILjRXdCRUQ44E?=
 =?iso-8859-1?Q?vwa1rGpWC0OvLqrS7VtiLPINYjezLUKxwoDo5XwtZ+KlLmYsmNMC0xyKhs?=
 =?iso-8859-1?Q?2v9gYVx7j0gawUYMsQo4lOYT4un3qIhjLTVgsyQam9haYR4LozurU2YDtv?=
 =?iso-8859-1?Q?dwiRCjXhiE1b4RtWo+1i6TekFFcMaIB6MQ1v6dYLntHL8akn9YeU1pGpw0?=
 =?iso-8859-1?Q?RgwSwy3oscE0CZUAz/GQfhm5etP0qX+1AU5nnei/fCjW7F+0Mqbzsv+zYI?=
 =?iso-8859-1?Q?Ghvc6fQ5FpV7/rT9yWNWSIjlWGYm1bTMUdyXHXvuTWr3KJTHj3EzvGI1FL?=
 =?iso-8859-1?Q?ceunxfHgswqO1hhf0WsMMnTif9589doruZ65pJ8j48IoNkr0VI17ZAXbGt?=
 =?iso-8859-1?Q?QbT2Z0uuq2P6p/b4RPM5vH8RL8NShHADzyR4L65qriWE0Nrfks3Yb76/5G?=
 =?iso-8859-1?Q?wnuIvXz4oYR7edbVgrksOsn8t0Ybf4NNGqFHhdXEt1GPRtQlxSVGdONDQ7?=
 =?iso-8859-1?Q?tEGjMSX53j/y4nRu0sQ5PMiQZYy5hGZzEMg7xSPGBqBvQi0bl6xM+D/rDe?=
 =?iso-8859-1?Q?4z/6B40VJlv1NRNt+NEDHJy4483kG0z3sjZC+R5+0TY+S+en3bRaSCmt7f?=
 =?iso-8859-1?Q?L+Uv1ebCtu9NlfoJOrjk5wVdX4YbaG0mWtmenB8TIUBskxDuiJf4mIzNyv?=
 =?iso-8859-1?Q?X71qGrpyHoWEkrfG3bJ8Wj15OUVOaNtvlQVcG82/FxsMyRUFGKBS2llfUX?=
 =?iso-8859-1?Q?1e3LELLqcvTV1QyJpEtIzEc1lXZJXnc78KWJr6tQlBynaeFFkv4rF+/oLl?=
 =?iso-8859-1?Q?iN2S3PuoaY1arB9/3bLftcyEC0ggMS4eWfXaDM4YLR1hH9zNO81XOlaEWP?=
 =?iso-8859-1?Q?OXQco/hvajk5sbeF6fVDVJm8iXlkhOvvEx4I+sgTVFjKFYiW1IXXO+Uo2P?=
 =?iso-8859-1?Q?yE29/WGPafCfxI7yOTv3B1mMMzUi0SBnu+yWO5mEMwltbHvPvTararcBYr?=
 =?iso-8859-1?Q?4PCS5s6lU0+L9I1C0ayFrrRvogzmDwbP0qKLQyrILPPYDmE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c1160ba-f459-43e3-5d79-08d9473db86a
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2021 03:07:46.1315 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nnoXE9aAN1r5iRZSpSWARKgweLfyxXnAvcTId8gU8cMpBeYnCdd3yfXIW9fK0j1Pk5nfd3O6k4m44KpILZm7bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2691
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.43; envelope-from=chen.zhang@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Lukas Straub <lukasstraub2@web.de>,
 =?iso-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Li Zhijian <lizhijian@cn.fujitsu.com>, qemu-dev <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Sent: Thursday, July 15, 2021 2:48 AM
> To: Zhang, Chen <chen.zhang@intel.com>
> Cc: Jason Wang <jasowang@redhat.com>; qemu-dev <qemu-
> devel@nongnu.org>; Eric Blake <eblake@redhat.com>; Markus Armbruster
> <armbru@redhat.com>; Daniel P. Berrang=E9 <berrange@redhat.com>; Gerd
> Hoffmann <kraxel@redhat.com>; Li Zhijian <lizhijian@cn.fujitsu.com>; Luka=
s
> Straub <lukasstraub2@web.de>
> Subject: Re: [PULL V2 3/6] hmp-commands: Add new HMP command for
> filter passthrough
>=20
> * Zhang Chen (chen.zhang@intel.com) wrote:
> > Add hmp_passthrough_filter_add and hmp_passthrough_filter_del make
> > user can maintain object network passthrough list in human monitor
> >
> > Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> > ---
> >  hmp-commands.hx       | 26 +++++++++++++++++
> >  include/monitor/hmp.h |  2 ++
> >  monitor/hmp-cmds.c    | 67
> +++++++++++++++++++++++++++++++++++++++++++
> >  3 files changed, 95 insertions(+)
> >
> > diff --git a/hmp-commands.hx b/hmp-commands.hx index
> > 8e45bce2cd..426a7d6cda 100644
> > --- a/hmp-commands.hx
> > +++ b/hmp-commands.hx
> > @@ -1292,6 +1292,32 @@ SRST
> >    Remove host network device.
> >  ERST
> >
> > +    {
> > +        .name       =3D "passthrough_filter_add",
> > +        .args_type  =3D "protocol:s?,object-name:s,src:s?,dst:s?",
> > +        .params     =3D "[protocol] object-name [src] [dst]",
> > +        .help       =3D "Add network passthrough rule to object passth=
rough list",
> > +        .cmd        =3D hmp_passthrough_filter_add,
> > +    },
> > +
> > +SRST
> > +``passthrough_filter_add``
> > +  Add network stream to object passthrough list.
> > +ERST
> > +
> > +    {
> > +        .name       =3D "passthrough_filter_del",
> > +        .args_type  =3D "protocol:s?,object-name:s,src:s?,dst:s?",
> > +        .params     =3D "[protocol] object-name [src] [dst]",
> > +        .help       =3D "Delete network passthrough rule from object p=
assthrough
> list",
> > +        .cmd        =3D hmp_passthrough_filter_del,
> > +    },
> > +
> > +SRST
> > +``passthrough_filter_del``
> > +  Delete network stream from object passthrough list.
> > +ERST
> > +
> >      {
> >          .name       =3D "object_add",
> >          .args_type  =3D "object:S",
> > diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h index
> > 3baa1058e2..ba6987e552 100644
> > --- a/include/monitor/hmp.h
> > +++ b/include/monitor/hmp.h
> > @@ -77,6 +77,8 @@ void hmp_device_del(Monitor *mon, const QDict
> > *qdict);  void hmp_dump_guest_memory(Monitor *mon, const QDict
> > *qdict);  void hmp_netdev_add(Monitor *mon, const QDict *qdict);  void
> > hmp_netdev_del(Monitor *mon, const QDict *qdict);
> > +void hmp_passthrough_filter_add(Monitor *mon, const QDict *qdict);
> > +void hmp_passthrough_filter_del(Monitor *mon, const QDict *qdict);
> >  void hmp_getfd(Monitor *mon, const QDict *qdict);  void
> > hmp_closefd(Monitor *mon, const QDict *qdict);  void
> > hmp_sendkey(Monitor *mon, const QDict *qdict); diff --git
> > a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c index
> 0942027208..b47a2e4850
> > 100644
> > --- a/monitor/hmp-cmds.c
> > +++ b/monitor/hmp-cmds.c
> > @@ -1638,6 +1638,73 @@ void hmp_netdev_del(Monitor *mon, const
> QDict *qdict)
> >      hmp_handle_error(mon, err);
> >  }
> >
> > +IPFlowSpec *hmp_parse_IPFlowSpec(Monitor *mon, const QDict *qdict)
> {
> > +    IPFlowSpec *spec =3D g_new0(IPFlowSpec, 1);
> > +    char *src, *dst;
> > +
> > +    spec->protocol =3D g_strdup(qdict_get_try_str(qdict, "protocol"));
> > +    spec->object_name =3D g_strdup(qdict_get_try_str(qdict, "object-
> name"));
> > +    src =3D g_strdup(qdict_get_try_str(qdict, "src"));
> > +    dst =3D g_strdup(qdict_get_try_str(qdict, "dst"));
> > +
> > +    if (src) {
> > +        spec->source =3D g_new0(InetSocketAddressBase, 1);
> > +
> > +        if (inet_parse_base(spec->source, src, NULL)) {
> > +            monitor_printf(mon, "Incorrect passthrough src address\n")=
;
> > +            g_free(spec->source);
> > +            g_free(src);
> > +            goto err;
>=20
> That leaks dst if dst is set.
>=20
> > +        }
> > +        g_free(src);
> > +    }
> > +
> > +    if (dst) {
> > +        spec->destination =3D g_new0(InetSocketAddressBase, 1);
> > +
> > +        if (inet_parse_base(spec->destination, dst, NULL)) {
> > +            monitor_printf(mon, "Incorrect passthrough dst address\n")=
;
> > +            g_free(spec->destination);
> > +            g_free(dst);
>=20
> That leaks src, and spec->source
>=20
> Perhaps the easiest thing would be:
>   g_autofree *src =3D NULL;
>   g_autofree *dst =3D NULL;
>=20
> and then they'll get free'd up automatically.
> Then in err:  you can do a g_free() of spec->source and
> spec->destination and finally spec.
>=20

Oh, good idea. I will quick update it.
By the way,  please review or tag other patches in this series.
Maybe we can catch up 6.1 merge window.

Thanks
Chen

> Dave
>=20
> > +            goto err;
> > +        }
> > +        g_free(dst);
> > +    }
> > +
> > +    return spec;
> > +
> > +err:
> > +    g_free(spec);
> > +    return NULL;
> > +}
> > +
> > +void hmp_passthrough_filter_add(Monitor *mon, const QDict *qdict) {
> > +    IPFlowSpec *spec;
> > +    Error *err =3D NULL;
> > +
> > +    spec =3D hmp_parse_IPFlowSpec(mon, qdict);
> > +    if (spec) {
> > +        qmp_passthrough_filter_add(spec, &err);
> > +    }
> > +
> > +    hmp_handle_error(mon, err);
> > +}
> > +
> > +void hmp_passthrough_filter_del(Monitor *mon, const QDict *qdict) {
> > +    IPFlowSpec *spec;
> > +    Error *err =3D NULL;
> > +
> > +    spec =3D hmp_parse_IPFlowSpec(mon, qdict);
> > +    if (spec) {
> > +        qmp_passthrough_filter_del(spec, &err);
> > +    }
> > +
> > +    hmp_handle_error(mon, err);
> > +}
> > +
> >  void hmp_object_add(Monitor *mon, const QDict *qdict)  {
> >      const char *options =3D qdict_get_str(qdict, "object");
> > --
> > 2.25.1
> >
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


