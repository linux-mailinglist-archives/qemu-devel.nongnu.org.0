Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3ED36FBDD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 16:04:05 +0200 (CEST)
Received: from localhost ([::1]:39874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcTkR-0001io-FZ
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 10:04:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcSmP-0002Al-9Y; Fri, 30 Apr 2021 09:02:01 -0400
Received: from mail-eopbgr820139.outbound.protection.outlook.com
 ([40.107.82.139]:52594 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1lcSmJ-0006Bc-HH; Fri, 30 Apr 2021 09:02:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZBhECafsYKfw6fXTr/yLKbCar3gmrWQPMYeDP9NdPvQE2P66RVtR4sHFTu+W3VRI/0GMw3g1EK7JlWcF0Fpx9z5HtvFS8waivXCcbYZJx2T49QoaJYVn/lkgHtnL809RhlzyCvUhJNZaV89ZkdMhdv4ZjpYpY9DxE3696kIqN168SBqWCddPU0vEh2byOkFMsqOoeYtoyUpvlVWjRWtzEN4kSXuxtwYmbrFBQPjTEkBi/rHWoVXqHduLsnLNe42OJu/aKui7qnkwysZOdxpC0R9MPkROqxQWikEY94wwXfvDdWc20xxgraiZvwI05UN7Qfod77XyGvO9SrxgI+0arA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRyaZTAbPbDPnz29+3k28L0gSSP0+7PUr8SzxIqg++I=;
 b=nsPPqMS/4C5lf/lW5mna8yR9XEbuxhJcJSdHswiGmwZt03hosMrhIPeCXF0hg83NOIiLZ0wKyknPdi0Dud4qn0PTeu7GLfGhuu6zVUL0/2sk7ebSOo9HR+BlgmZKHjrdnB8N1lj0JlH6F6l3RvzHK+Sy6XFSKk3I1eX2kJ4z9UEctxRVpMRyKUTk4j+5x1p81vgFalc2s+bxxuPh7MLhg5CYpX3dirRg3oTXdFZBEVEgPQ0279iuEQqlZ+FuFOk8F5t/mewrpJ1m903H4DWvwyfvzbh7QlXvpkKnnk4yOvWqKdBbkXzbNNPB4TvhTst/7tZzmQNV0dNaKOh5Fh0qAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DRyaZTAbPbDPnz29+3k28L0gSSP0+7PUr8SzxIqg++I=;
 b=dnSWz0f16iaWP5REe7OFIIBWgGr6pB4o0A2W4GrO9lLzrAy094iF6A7jk5hvsWPlU22q71ul/mR6CIZOOZIY/WGWwE6ffj18QGdPn75J/kMWSk2AC2vnXPFh0ocQdFGy5XDab6W+kuqEkdtrFAa63FmxdsB+Nkr8NVlQ2dRWG6ob8ToMDdy1N/oZpyOpSUnoPJTyUpGyiW66rWECilRJlGBesSFyjSSA2ylPpHeoLafFEOhdO1VnjDSsV85DSkV/XVJusWcdkvQA0XuaOQSQkOWCTax92jGTgUGFcpqoPFmBf/d6S+EFbOgD5VzWomQwMEkBBWZDVtBINqYTKYBU3w==
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com (2603:10d6:102:31::10)
 by CP2PR80MB4434.lamprd80.prod.outlook.com (2603:10d6:102:45::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.25; Fri, 30 Apr
 2021 13:01:52 +0000
Received: from CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d]) by CP2PR80MB3668.lamprd80.prod.outlook.com
 ([fe80::3810:ddb8:af7:cd9d%2]) with mapi id 15.20.4065.027; Fri, 30 Apr 2021
 13:01:52 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 02/30] decodetree: More use of f-strings
Thread-Topic: [PATCH v3 02/30] decodetree: More use of f-strings
Thread-Index: AQHXPV5a7JgCYMPSs0SDqkKHUjqj9KrNBxhQ
Date: Fri, 30 Apr 2021 13:01:52 +0000
Message-ID: <CP2PR80MB366812351F01C062A004EA46DA5E9@CP2PR80MB3668.lamprd80.prod.outlook.com>
References: <20210430011543.1017113-1-richard.henderson@linaro.org>
 <20210430011543.1017113-3-richard.henderson@linaro.org>
In-Reply-To: <20210430011543.1017113-3-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-originating-ip: [191.205.120.173]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d44b37c-800b-4bfc-d1b8-08d90bd81fa1
x-ms-traffictypediagnostic: CP2PR80MB4434:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CP2PR80MB443486A87085A3A015BDC37ADA5E9@CP2PR80MB4434.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RlFRI7+6YyQ/V73L24XjNCbgLAvsAHAoz77YKeEDtXHnB6vVKpfrwEAL93WnCnaa5Lf7bsiszK4elwMXDpBw/DzSWEL/NMY2T8abQt/vLEEjikFHSSa2c3A8Bbx457u9Z+0eKpV+RwKOcHaLhgl0MNtkJqgjYc9+1/ooQmDTRd5FXKdgJifOyzBnPySqf0cDYwJbjtzw08IwsGODAH7uU/kDmv/wOyc9h021Dc0geHCndobuM+yGXaYMboFs/evpzHhvLXootvVL3ji6rThQLsKrF2CJawEpxrn69hA2HMbO9owGRbBQx5T/GuFP9ahncIlARGAN+ACqpuOuP9n16+rwZarTqeDFMc2ncwcXP3YqKdPRla9VYth+6CX+d4mKfxMe6A7C4JSE83a3w2AmSyMQUcVcql3RpGoNnPmYWreeGWOfwf4p/2zdx3t6cMRcPxIfz2R0HLJRo3lhlfWDwhIHhvM7zFv1ib3LiDoAEC2zPq1/Vb3rHHpbMVYeVPhBDF/eseyzKUe5zzLev7205K8IcXxkJavCnvoM6LiX3hZuP5yr1YOCqAlvpYb4uhWYT4XQYq7K9WO6iS7kWdDBf4MIcuhyyXNNmTba8m4H1T8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CP2PR80MB3668.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(136003)(366004)(39830400003)(346002)(122000001)(6506007)(8936002)(66476007)(2906002)(64756008)(38100700002)(4326008)(558084003)(5660300002)(76116006)(7696005)(66556008)(66946007)(478600001)(8676002)(66446008)(54906003)(9686003)(26005)(86362001)(33656002)(71200400001)(52536014)(55016002)(110136005)(186003)(316002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?eVS8dp1rUj40pBBBBetNWmjFUimlHOYkSy6ou+4icueH9GH6P3pzQOxkaZMH?=
 =?us-ascii?Q?8RL+2BxoZ8Mw+YoSlk3uMWvE71qVa/1tp43YiLkJuKDixTJT9YzjA7z2bMOT?=
 =?us-ascii?Q?IpyijhZN/45ctrDU+8y241w+6wFT5QZhydn0YOov3awWIxtZ3ciNn7s5/Y3J?=
 =?us-ascii?Q?7YW2G4zdVQoU+tjSReKoGOs3w+QK5Z/6EhLguX8XFUERQtXu1UQ0r6yzS9J8?=
 =?us-ascii?Q?tjBhOV1pVqY7zr6z1NfeVqcAnSwo1/9Qe65FJNEjqAr2xJYmLXQaZ9mkzWuS?=
 =?us-ascii?Q?OL7SiF69NBtIAdKHkzjRQ9WHNFxEXy+Dy5zCaHhPYz7mDEF1Gq8fXPkz+tHM?=
 =?us-ascii?Q?NV0ws/P0pVD5PPyCYsXCgQgQfkf8Alt1B4YI6Ikl3RvYxS4l5hVycoeVoH+/?=
 =?us-ascii?Q?udiiutY7XeMtXznCRtfEx8gXlixswIVN8Lm6XjjDpEeiArjznnah26bafs1m?=
 =?us-ascii?Q?HCZEQ6LfxCYTbOksY+Idv95XooFOTipPzOY1MQGtFUQ5UPeCRp6H2Fa4w+le?=
 =?us-ascii?Q?HfQp3rzacY2Gq/5nm6h7AzB2pOC8Oy9Xa8q2rGd528C4qGZNrb1pKV/008Lz?=
 =?us-ascii?Q?GxgAbZEDt6zMWlmietS9uZ+Aj6weXYxDfUm0YZfWARNwrKUjsdwu9fu67oJt?=
 =?us-ascii?Q?1RtpYx6fxjYo6/RQBPGxC4VzocPMV+9bZaLyz0uHNFhR9RSPCJaoiUxfWobD?=
 =?us-ascii?Q?HlE3k95ZpaZinwamTsANw8Tmpsf+25D54mkM03Jsz6JSAY2faZwqYJ09E82x?=
 =?us-ascii?Q?P7KBRVtqVdKo3W3ntIVTlL0PpgBKXjpsM11xqmprhNE10awu6hpmzFpUfH+/?=
 =?us-ascii?Q?fia/MjP9q8I8fOVvUUTTXWIkf+XW35xIxPDW6gJ7xgx94TustluYvuQlG/vl?=
 =?us-ascii?Q?gqWiQ5cu5rRQPYEavg8feWksALtG6KHXaVvPtfhIWCxbC8OLqqGFfhctGbYu?=
 =?us-ascii?Q?SnS5TW4sB9B/I54VKbqmCyPqeFb3TQRcN57z4YVTsN6nkatBlHsHxLcoBo4B?=
 =?us-ascii?Q?2SsGCjl3M4Sl7XIt2A6oNK6JZi6srJ5VAFUjIgcJpKZyFnbawH39oxY6ocsQ?=
 =?us-ascii?Q?ZXqPeu0jyz0JEkJ8sciXBiEwhe4uS5pyky0I29WLM6ArBIFD6OxxGckTKP5a?=
 =?us-ascii?Q?blct1JtJTrxJcK1wf7NblE3T67eGaCdY95XjjdJeZMDGlU+aBBsADLOJEvY1?=
 =?us-ascii?Q?1HOzTvEYQozZxXWP3aBMI/pFk5dryhybr9QgdKhEyNk4U+mie9gQ1BJ5s4ch?=
 =?us-ascii?Q?9NePJcSCtKrE/IF1uVNE5mAfCNZfPIuVhWpvHQljVPcgRQDA9lx7zWFPzMTE?=
 =?us-ascii?Q?8A5Ric7AsXVpnhjZIxNfLYzm?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CP2PR80MB3668.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d44b37c-800b-4bfc-d1b8-08d90bd81fa1
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2021 13:01:52.0236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y8+1mwO6oHjieITHpgFIrnJm3UWkmw5BV63hGOZgFVYDuc5dhLmAdobwB8WkIkB2GzucBG9h3hcCUy2obme8pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB4434
Received-SPF: pass client-ip=40.107.82.139;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "f4bug@amsat.org" <f4bug@amsat.org>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "lagarcia@br.ibm.com" <lagarcia@br.ibm.com>,
 Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>,
 Matheus Kowalczuk Ferst <matheus.ferst@eldorado.org.br>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  scripts/decodetree.py | 50 ++++++++++++++++++++-----------------------
>  1 file changed, 23 insertions(+), 27 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>


