Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937C93BB557
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 04:55:18 +0200 (CEST)
Received: from localhost ([::1]:40052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0ElR-0007Bl-6S
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 22:55:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1m0EkU-0006WJ-TH
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 22:54:18 -0400
Received: from mga11.intel.com ([192.55.52.93]:47391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1m0EkR-0005OA-8f
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 22:54:18 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="205906596"
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="205906596"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2021 19:54:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="495966502"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 04 Jul 2021 19:54:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Sun, 4 Jul 2021 19:54:05 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4
 via Frontend Transport; Sun, 4 Jul 2021 19:54:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.4; Sun, 4 Jul 2021 19:54:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OSmAa5UccNkMX4SgpmchpoWOpdPQrl8ce8Hqn0OFYPZKM5nXBMjxKXiPZDUZ7a1AfXLPJd8OjTm0f4vXBYC9p63vbDo3KhW9cAuAtcaBXpQBEPC+48KsWK7dgBNzpvy2XrH+RSIpxz1RnZKXJ6AkUfHg4skKTqJ5tBRROHBLjMjwW9Mty4XzxjK/MnOncaTdOgVM1BU+4x12kK/MEnTCf3MzBrk/HgtABDDz/Zygr0F8DWw/K8L//1q/WgAj/HnVVhBG75cakAG3vONtOkGrCCb1qr9V+PRzJ6nv0ZSZITV30ggUWolerNur8/w7Wsm3is90adn3KhOnYq003MMK/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DOo0jq/v/3LFTAyvwcAll5gvD9GKbgC4mVEVasMM/M=;
 b=GTukZFbTc2xn65TQ0KlVvNK+MHZxHT9kkieNLJDDiwkiRDO19FtwrtCQTm/7/Es1drwrynd5qBoarcczZBs/AylUtgVgHwTESS7tw7qYkxRwNu5TmhuRbmybryB/zz/XSXYXbFXCOJeFNZZGXdwx38oHBjAxs8s+fBYaKNj9gO6TxzdCrKwM1E5NNc1A5GtS/friwzon0owwuwm+883VlW67uHFcV8jhEv2jQH/z9jUYx7UfgZa/LDpjCVYgUfbzdEbREpznbhmPI/DFtBg4cj+ztkYqvp9TlnvqqM8pd+gsuu01abNqX3oXsV6mDtdQSwoYPYLRZn8RauQ3ggSW9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DOo0jq/v/3LFTAyvwcAll5gvD9GKbgC4mVEVasMM/M=;
 b=zg43Mf8PgjtJfehbqiocLvdR3agXzil9GNNkZ0t5ilLp59yYs7aprjS7N9WMMArlly/QtFUr2FW+NlxhR0NsxRWCrj3fESi8ZISa/u2p58haVhJcFe2MfrnOp5w3cQcFCTQksE0N0h1pbaltcKZF1Iaopfi8aE8/Jgk4kr9vhjU=
Received: from DM8PR11MB5640.namprd11.prod.outlook.com (2603:10b6:8:3f::14) by
 DM8PR11MB5576.namprd11.prod.outlook.com (2603:10b6:8:37::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.27; Mon, 5 Jul 2021 02:54:02 +0000
Received: from DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::1d1e:4556:7093:9b9e]) by DM8PR11MB5640.namprd11.prod.outlook.com
 ([fe80::1d1e:4556:7093:9b9e%2]) with mapi id 15.20.4287.033; Mon, 5 Jul 2021
 02:54:02 +0000
From: "Rao, Lei" <lei.rao@intel.com>
To: Lukas Straub <lukasstraub2@web.de>
Subject: RE: [PATCH 4/7] colo: fixed 'Segmentation fault' when the simplex
 mode PVM poweroff
Thread-Topic: [PATCH 4/7] colo: fixed 'Segmentation fault' when the simplex
 mode PVM poweroff
Thread-Index: AQHXYyQS1d3Erw6LBEWuv3jfLItpk6sxz+AAgAH5IRA=
Date: Mon, 5 Jul 2021 02:54:02 +0000
Message-ID: <DM8PR11MB5640086C7DA374B5E17985E3FD1C9@DM8PR11MB5640.namprd11.prod.outlook.com>
References: <1623898035-18533-1-git-send-email-lei.rao@intel.com>
 <1623898035-18533-5-git-send-email-lei.rao@intel.com>
 <20210703223620.7dbf323a@gecko.fritz.box>
In-Reply-To: <20210703223620.7dbf323a@gecko.fritz.box>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-reaction: no-action
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
authentication-results: web.de; dkim=none (message not signed)
 header.d=none;web.de; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.55.46.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b998354c-c0fc-44a4-7342-08d93f602577
x-ms-traffictypediagnostic: DM8PR11MB5576:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM8PR11MB5576CFD05A9ACAD7B6C7490FFD1C9@DM8PR11MB5576.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4aaMTzQWxkA7WNSN+pOxFEhxxZJsKljlzVn06Q6XGiUDu3RHbUWsA6RkN/EikvR9pLkL8iKPHe2Fvw58JqVEWrAsQ2ziJPUy7ZTGGwnK1EmDyujlOgIxrh+mL27vuVXeidConRPdj+CFEyAbA1m3n1jNfDBvH2CGJyr9OrCEdSFVYSFGOA/3SnJR5UrfHIa0nHp5uDD1PiBvBLNBCAkqWKra8bVB2Xxy5AshAFZ1pgFb2afyXi54jO60Kdj2C8nwibQYUBbs5eWOlo9mClK2dSps4meR+z8u/m7njN57Hv3c1lu79++crjycUQgXtsdcWn2eG4cgMiKAp35Vo0R7FvCoh4kzDssORtMqo1Vx499NnWidjWC5ERaPPptKXffTtTEoyVmhnhMr1wQ66er3ucf18S2RHn2ja1oX7oYCAQOepQRcKVozPiVNPR8Mt98e4KcuzJTantdj1updeBULCuOHS1C/5XJCeWsW5YQIRPb715CzsVwKDyDo/hU8ZgQyQUJYqHupnHBjAA3Q+KUE5fpL/F8bX98dI/yk2yYyLEgCdfESy3HyItdubeSWyuXOig6brlb70Razw6Yag923drvVXvUTrPNcOcY7S16uy0VMXZU4uMS4HhICRmZn5LGPEZhWxE8UezZ9d5IgBUek1w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5640.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(346002)(366004)(396003)(39860400002)(136003)(186003)(71200400001)(66556008)(66946007)(64756008)(4326008)(53546011)(478600001)(76116006)(6506007)(9686003)(33656002)(55016002)(2906002)(66446008)(66476007)(38100700002)(8936002)(122000001)(54906003)(52536014)(316002)(83380400001)(6916009)(8676002)(26005)(7696005)(5660300002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cEP/W5hNwiURwfNmfFDvYrC4Wjr2KQNj+gYiuTCHykKQkywEUJzTnXUySLyG?=
 =?us-ascii?Q?1cu3Cd7Rwog55AtB8t1zUbsPXNAWbtoV2+FO2Y5NaEj4J7hTvYzJnrnVDQR5?=
 =?us-ascii?Q?EHsoarhEbGpckYckrS8W6cA303i9/LPfjEo4jPyG2ptTPdHSG/5ezvA+KWXp?=
 =?us-ascii?Q?h81ODuAFH+xlWUvDFe+vI7rWcGET3kUQJO7yNt9BFiHQoUoyR/6zfoA/EAOs?=
 =?us-ascii?Q?p4l4ah8mz5hZdRhPSl7I2MKvBzia3ii+x5oz2BKcqUozxA+LhGxKOkOaN5nJ?=
 =?us-ascii?Q?MPi8eph6UzubnpMi/OQ+8p4rgBUhjkdtc0JpnEEpc/MJowrlpYtrr1O19QQj?=
 =?us-ascii?Q?qBzSwWNBlbsoEVrTTl8AgbZIagzPNT053KBeeL2jayeMHsZJQiVo48gXdQ3a?=
 =?us-ascii?Q?UECr15URFF1ZyxAasg6d7uBF8gvcH40doYQoY81V33UmJbJUx4WEzu7bOpWs?=
 =?us-ascii?Q?Ldsk1Gj44owIQiNtDmadYNjfyxRtu5veyRVRw5IjluJnQLVOiOBDYM9PZ0Er?=
 =?us-ascii?Q?UWHtX/OgjTJrsObVNxty2n5DfeLCYfe8JbwGB3adkrAc/cGZVioSWzT3LKSw?=
 =?us-ascii?Q?S7L7b7Voal0l+nthVNpLh4hlIui/gTosigmvAq3us7wzmG6h3uIyQszT5+RY?=
 =?us-ascii?Q?OHvma9QjMPQS1BOE1/H3MR1/1/xoC2SFqN5XjP4QdU/6CZLAwDXxT5/s7nOx?=
 =?us-ascii?Q?5sGqH1YO/CzPX1pDaRCe9gUay8M3w5Yq3AE6WrR7Yc1CpqZDkIv4H7uma8we?=
 =?us-ascii?Q?fbZPm5g8mYhd28vIXoGArZhdidl07y6E/RFtgesqwdEm+4GcVukdG8cM3NrE?=
 =?us-ascii?Q?jwSD99wwbtaeROSfGHC7OlX179t/p9HmzQJkZfUyTaWwZz5ZIO8PFc7ZtXQg?=
 =?us-ascii?Q?fTJEmFA3tIL++SDLg1OY8i1D9ZBWfUMx99JDpBlYMs2KoiOXu2dCOuUGLpEd?=
 =?us-ascii?Q?M47ogjkTQQkzR0HKh3IJEAsV3xat6B2qpSVWeEogyGNUfe4VRteuTjdjbJyN?=
 =?us-ascii?Q?kbzwmF+GGDGjASGnuKaZS4VTnu8KkGI4qT4Yp/nFkj9+PEeJz6Wckl4adrdC?=
 =?us-ascii?Q?Yf2Tsk6BkICr7JMFJmmW47/RTp0p93kBM8cwHvxj4wC4ZFulPOFn+NL+1Ot9?=
 =?us-ascii?Q?f/eL1oHG2kFLBm90+g1UoLMaNOkKm4YBs0F4vmah04xe3siXkFx/xstgrROT?=
 =?us-ascii?Q?xgmED1B1/yxVu0poKD9mwoH2hBR46T0a1ZVZsaCDS/UgnEhO12csS9CZW+g8?=
 =?us-ascii?Q?w8PRNO0cPHcGegjreoHFvyS/HxTFNiIvR/0HDg1mmJmoBX7adQLIf/QaZUWt?=
 =?us-ascii?Q?Ps4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5640.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b998354c-c0fc-44a4-7342-08d93f602577
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2021 02:54:02.6516 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8rGYwSFVALPOAwOppkwgKEXswwf3H/cYepyBrIbOv/ZPc0Bj7Rx25oy170AVfPx8iXPenqBWe6fb6yDJ6MdTCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5576
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=192.55.52.93; envelope-from=lei.rao@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: "like.xu.linux@gmail.com" <like.xu.linux@gmail.com>,
 "zhang.zhanghailiang@huawei.com" <zhang.zhanghailiang@huawei.com>,
 "lizhijian@cn.fujitsu.com" <lizhijian@cn.fujitsu.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Zhang,
 Chen" <chen.zhang@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's been a long time since this bug, I will reproduce it to get the GDB st=
ack, but it may take some time.

Thanks,
Lei.

-----Original Message-----
From: Lukas Straub <lukasstraub2@web.de>=20
Sent: Sunday, July 4, 2021 4:36 AM
To: Rao, Lei <lei.rao@intel.com>
Cc: Zhang, Chen <chen.zhang@intel.com>; lizhijian@cn.fujitsu.com; jasowang@=
redhat.com; zhang.zhanghailiang@huawei.com; quintela@redhat.com; dgilbert@r=
edhat.com; like.xu.linux@gmail.com; qemu-devel@nongnu.org; Like Xu <like.xu=
@linux.intel.com>
Subject: Re: [PATCH 4/7] colo: fixed 'Segmentation fault' when the simplex =
mode PVM poweroff

On Thu, 17 Jun 2021 10:47:12 +0800
Lei Rao <lei.rao@intel.com> wrote:

> From: "Rao, Lei" <lei.rao@intel.com>
>=20
> When a PVM completed its SVM failover steps and begins to run in the=20
> simplex mode, QEMU would encounter a 'Segmentation fault' if the guest=20
> poweroff with the following calltrace:
>=20
> Program received signal SIGSEGV, Segmentation fault.
>=20
> This is because primary_vm_do_failover() would call=20
> "qemu_file_shutdown (s->rp_state.from_dst_file);" and later the=20
> migration_shutdown() would do it again. So, we should set the s->rp_state=
.from_dst_file to NULL.

Hello,
Please provide a backtrace to such bugfixes. It helps the reviewers to bett=
er understand the bug and the fix and it helps yourself to check if it is a=
ctually correct. I suggest you to enable coredumps in your test (or even pr=
oduction) system, so for every crash you definitely have a backtrace.

> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> Signed-off-by: Lei Rao <lei.rao@intel.com>
> ---
>  migration/colo.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/migration/colo.c b/migration/colo.c index=20
> 616dc00..c25e488 100644
> --- a/migration/colo.c
> +++ b/migration/colo.c
> @@ -156,14 +156,15 @@ static void primary_vm_do_failover(void)
> =20
>      /*
>       * Wake up COLO thread which may blocked in recv() or send(),
> -     * The s->rp_state.from_dst_file and s->to_dst_file may use the
> -     * same fd, but we still shutdown the fd for twice, it is harmless.
> +     * The s->to_dst_file may use the same fd, but we still shutdown
> +     * the fd for twice, it is harmless.
>       */

This change to the comment is incorrect. Shutting down a file multiple time=
s is safe and not a bug in it self. If it leads to a crash anyway, that poi=
nts to a bug in the qemu_file_shutdown() function or similar.

>      if (s->to_dst_file) {
>          qemu_file_shutdown(s->to_dst_file);
>      }
>      if (s->rp_state.from_dst_file) {
>          qemu_file_shutdown(s->rp_state.from_dst_file);
> +        s->rp_state.from_dst_file =3D NULL;
>      }

This is incorrect, as the file won't be closed after this and is leaked. An=
d indeed, when applying the patch to master, qemu crashes when triggering f=
ailover on the primary, due to the leak:

qemu-system-x86_64: ../util/yank.c:107: yank_unregister_instance: Assertion=
 `QLIST_EMPTY(&entry->yankfns)' failed.

>      old_state =3D failover_set_state(FAILOVER_STATUS_ACTIVE,



--=20


