Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE7434811F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 20:00:56 +0100 (CET)
Received: from localhost ([::1]:55892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8kR-0000co-7c
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 15:00:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lP8UW-0002bh-6e; Wed, 24 Mar 2021 14:44:29 -0400
Received: from mx0b-002c1b01.pphosted.com ([148.163.155.12]:12626)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <raphael.norwitz@nutanix.com>)
 id 1lP8US-0000UQ-VB; Wed, 24 Mar 2021 14:44:27 -0400
Received: from pps.filterd (m0127841.ppops.net [127.0.0.1])
 by mx0b-002c1b01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12OIQfj4031536; Wed, 24 Mar 2021 11:44:20 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nutanix.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version;
 s=proofpoint20171006; bh=qT5qJTR8CY9gOnQ/Oe3jFvtEId4eM3ob7HETK8qhNrA=;
 b=kejr8Y0FAhFA8m28CKd2XQ0H6oShcOAIiCYCOaLBsAAHfjzYRqEeDCSzCXmBCg8Ka+rv
 KBXjMIQDJcZbJueFbwxhddbs3R9wD9uIG41E6HJ0QpGHclcnlsPtOHlzIcqDdGnED36i
 iJEo56yPELQmGmXcpNZ8wBcCZgSfgeLLkHiwUkR8w1/6NhEB6GMWvYOg2dH6DqioDkkL
 ChMYsD8uy2hOV3RkDsYgMQXXaGq7L+mVAxp7iwkxI7rXwaao9nttmIpT3hiPJ41GhXwn
 KUi99i91w3leWzR8snDTr3PL4UUO/E4SWFs0ucK5v6gOdGrICut0hO46TvpdcR/7+B3u Xg== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by mx0b-002c1b01.pphosted.com with ESMTP id 37ftwkaa01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Mar 2021 11:44:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TYn59noYr9Aa2Yzd5U15G8vWkhwk8a+48M2KIl5joUTpMJIyEdIishJjYF4UeYSl/9VvGRQVJw2Z2EjvU1UcA7tc8GWnHGFGasiFsz0Hd5lb80yzjyjutgBhx5pbFY0SaHnzirpbfugyGk6xXwUNOImMbw0Gkc+lPNUzhZyzTHwd+wB546FQPyBqGoM9jfJaryPM8v1exvtRWcckWQhdLxe5MAx6tgxmFo8kIZlNJ9EVJGil6+j+7TU/N9fqUD4EShtUoE62mVOeCbjPj+jFunIAdtjvZ2prdsQ+wXyuGY5vEVjnTl8PjJydTikta6OjfouldwKDh7TPuPxo1UaPcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qT5qJTR8CY9gOnQ/Oe3jFvtEId4eM3ob7HETK8qhNrA=;
 b=MT7qqubyrxgoU252HujNhWJW0VFpZeUoXObP1ZkjLR8g1WwX+qQtQ8B5puC5fZriSlqsnBY1qUpiwqTlQ0+SCe2sEiz/zMn7wyJT9kAZo1zi8bKZJDNqWtJRErB812X0k3Oi+roq39H9OpoUn6BbIo43sHSo2fv1+1QgidI7vcLI40trFgDqoY2L4wLNSwgguPDw9+w+uDbUKFa1dyscKIw4Mr6RPwegh75itE94JKNMLb+Gtc3huLTOXsR3sL6duu711rHhMauQpLI5pH5fqVRkUKlqZ6RzqcKLjFeLTt858EK6ngtC/xVLs4pjvY2sONNAamOPrWeVUtqrHWBIJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nutanix.com; dmarc=pass action=none header.from=nutanix.com;
 dkim=pass header.d=nutanix.com; arc=none
Received: from SN6PR02MB4543.namprd02.prod.outlook.com (2603:10b6:805:b1::24)
 by SA2PR02MB7801.namprd02.prod.outlook.com (2603:10b6:806:141::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 18:44:18 +0000
Received: from SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::7139:d6a4:cf94:c4b1]) by SN6PR02MB4543.namprd02.prod.outlook.com
 ([fe80::7139:d6a4:cf94:c4b1%4]) with mapi id 15.20.3977.024; Wed, 24 Mar 2021
 18:44:18 +0000
From: Raphael Norwitz <raphael.norwitz@nutanix.com>
To: Denis Plotnikov <den-plotnikov@yandex-team.ru>
Subject: Re: [PATCH v2 2/2] vhost-user-blk: perform immediate cleanup if
 disconnect on initialization
Thread-Topic: [PATCH v2 2/2] vhost-user-blk: perform immediate cleanup if
 disconnect on initialization
Thread-Index: AQHXIJF87JsK9puenUeVuAIfepYq1KqTekCA
Date: Wed, 24 Mar 2021 18:44:18 +0000
Message-ID: <20210324184417.GB16138@raphael-debian-dev>
References: <20210324093829.116453-1-den-plotnikov@yandex-team.ru>
 <20210324093829.116453-3-den-plotnikov@yandex-team.ru>
In-Reply-To: <20210324093829.116453-3-den-plotnikov@yandex-team.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.10.1 (2018-07-13)
authentication-results: yandex-team.ru; dkim=none (message not signed)
 header.d=none; yandex-team.ru; dmarc=none action=none header.from=nutanix.com; 
x-originating-ip: [98.151.208.226]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f9a2429e-632d-4345-9db6-08d8eef4d52a
x-ms-traffictypediagnostic: SA2PR02MB7801:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA2PR02MB78016CCF2B80ED6ACDE81837EA639@SA2PR02MB7801.namprd02.prod.outlook.com>
x-proofpoint-crosstenant: true
x-ms-oob-tlc-oobclassifiers: OLM:800;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sX1azeRz/op7krySKvMHD2+7uDmrvPluBRvJD+G1i1Ih7fsAwR6OmiqdxZNFChukAqpTtm40O8qVr+JjhqEkhp7mRLHUXXSY4037Ai3E54QyxeLzmLlOxANsIDpn4fmGIP0qPrDCES3KCq/Sxgb6x36PaQerbo8t/sbllQSdcPi+oooBbfIu1Y2El8ML89F5yU+m8HgvlZOVUVjXmOSw8eiLHZiYqID2dsQ1fJ0cqrs+25bTqBMWbv9iyTv3XaUqefGyo/NvGUp0R25VDhCnfsMTuVI7P7Z7onjeSHu+UlPQRedlqranZWfEB59bK2kSwveTq49XvVEpvkw8GL05u9YwCRZpevw08ELP/sjEcn46p5jrEsJLZbOz5we/15YCAqpSO10dS9KyMUnBUhTbTFtTLVPW/UZRYvSxwF7rMYdo8Xe57lJHerCr5ghc80X2WzI3/9IgxDNk/TW4+zFfrOH5qsPP/S2dQ43dGlJsspClP0f/foy4hMYnYOPD2d8MdLPNDvQQrfkZTFUCSX1wnR1gL675mNwEy6AR2YfG7eWAuZzXBBg72G38U3RgF8pIkS0owzUD9wGFi2vt7bg3Ys2Mm0ON2xjWbRCw71UOgz7hWuJ6UbAUqFGTBvpOIOhaPD5hcvc5EQ8TCtSynfTskHet2ZP1fV8GP/VztU1KSQ9zNDxMOM9h8on7nrOTkWJ4
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR02MB4543.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(396003)(346002)(136003)(39860400002)(376002)(366004)(76116006)(2906002)(66946007)(9686003)(66556008)(66446008)(64756008)(33716001)(33656002)(66476007)(54906003)(86362001)(83380400001)(6512007)(186003)(316002)(91956017)(8676002)(6916009)(478600001)(26005)(6506007)(38100700001)(44832011)(4326008)(71200400001)(6486002)(5660300002)(1076003)(8936002)(14773001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?CJtJ7mqsp3Yj+660iwhwrtfbDzeW0L5U2tPPbE9XqlwqH9aZvFLYCz1upqnw?=
 =?us-ascii?Q?gT8flJuTDMjOGfPuErnSnoJSN4eDRO5RHj1KqDxMrCN+0ND7Vhi9YLr6Ojs5?=
 =?us-ascii?Q?FqUv+B7ADH5MdJnEZ6GYZViw1Ekqaa/3PaeSwuPWgtahwXApXMjn5A3/rjPo?=
 =?us-ascii?Q?a5Xf1yWEWgv6kvsFMzTR//pYkztqD7l/8QeUUJ9ggJtXn0kVrLCl5gY16PB0?=
 =?us-ascii?Q?Ad1zqCv4DMCkYdliBMgIsDcYk+sPSZWua/OoG8y56rY5QpbEFf3hkXulZ2gM?=
 =?us-ascii?Q?vzZXr5ESiazaqW+QYiKKGxQ3ySKsyqlkWcmrDBArZs//YhidfviqHX2W8g0m?=
 =?us-ascii?Q?K4L+AC2qILVr7WFynFV5RAhrGrffbHccfvGAg+iffod5HHUQP0xt7J3M9hb6?=
 =?us-ascii?Q?sEkd/MDYH21WOjJvJK74II0z5GPXDxt5MHIdKSrKqFwgwuI5iY7hLVgjpNrz?=
 =?us-ascii?Q?C9xGj6dNsxlqXp4F+KrjmI3pIC/NC+scRnpJskf2x2f/tM0dovbarECHuDuP?=
 =?us-ascii?Q?q0b1t5dknw3T9QALRgf4EGPabmv6RyzmBhgWtN5KZomR5DoRPAwbWRJVStca?=
 =?us-ascii?Q?HzzmeddTHNrcSWu3vVjZr+5uA4b/iWoQAyvW7uW4sxaIaaLK9u8KMnKPDAEd?=
 =?us-ascii?Q?+afMZKZcWf9w5+HaeFEi1pjPPijjcvoyekZtTHAj83S5qqvxOREGF4jOfHnM?=
 =?us-ascii?Q?fgyg9JyKJe5VJsnDc6ShMPBp0U6WToAe2+R4NKXcBvJpXuBTTU7tudqCxZSI?=
 =?us-ascii?Q?f7/7RGt9Rq91rAjHJoDFTraUQDmib2HdXmSB2/OUl9ZB4xvpbqJdkmZN0dSF?=
 =?us-ascii?Q?MPhxewuNJ2SqiTpC8mHhS4ZM97KTqg3zFs/4+FmLR+3qpTNN2sof8vfju5e8?=
 =?us-ascii?Q?h0WVRdlsttW1+GAY84OZGcWtQdWLzh9y+yh5/Z0IqbNDIsT067VXnxN6tSE4?=
 =?us-ascii?Q?nkn4Sl92lblJLYtjYqNkSVA/QDxTMfnHWAzISkBmBOf8ghrIq7uLIa07uCGB?=
 =?us-ascii?Q?NLzstkEoUSpq+iWcuCf4dBS2HCOrGkH3BpsYfBUTe9kkR09doavUH17Y3VAm?=
 =?us-ascii?Q?bwhndkN+UiFoTE+xijXyRHJzljzT0kp5PFM+v1JhozNVEHWQMK4klypiFhaL?=
 =?us-ascii?Q?bO5FcwJmQqJ9jT0+PyL8ThxSS5thS7mAXfnL9hhD2p9wRW63JODy7cA832hY?=
 =?us-ascii?Q?AdXvkAOpbpxkGYgF6RVzFt2sQwELBppEEtVxlGE6c2bTEAdp/0u64UcynytS?=
 =?us-ascii?Q?8EG6aIRPUlanITZC7XBEAHcQCapJEB7RrNmxN+ebG+YVNSyD0qZjXD/JN0sc?=
 =?us-ascii?Q?9koEdSJLIYp0ai8eIcisCjCh1WaGf5fVBdOrxdzauSIlIg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8E9B41488178474986183EB2AB7AA573@namprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nutanix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4543.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9a2429e-632d-4345-9db6-08d8eef4d52a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 18:44:18.6976 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: bb047546-786f-4de1-bd75-24e5b6f79043
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LpVBBFIFHTWgT8DWJv89JCtbXguI0pEPAevikdXJiWc5uL8Q3Rwh9ycy6LagkI9qJPrql8pjco9dsfjMU1BOkTDPKoScI0hhZCrQMdheQLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7801
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-24_13:2021-03-24,
 2021-03-24 signatures=0
X-Proofpoint-Spam-Reason: safe
Received-SPF: pass client-ip=148.163.155.12;
 envelope-from=raphael.norwitz@nutanix.com; helo=mx0b-002c1b01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 "mreitz@redhat.com" <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Looks good, just clean up the commit message to reflect the way you've
now split the patches.

Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>

On Wed, Mar 24, 2021 at 12:38:29PM +0300, Denis Plotnikov wrote:
> Commit 4bcad76f4c39 ("vhost-user-blk: delay vhost_user_blk_disconnect")
> introduced postponing vhost_dev cleanup aiming to eliminate qemu aborts
> because of connection problems with vhost-blk daemon.
>=20
> However, it introdues a new problem. Now, any communication errors
> during execution of vhost_dev_init() called by vhost_user_blk_device_real=
ize()
> lead to qemu abort on assert in vhost_dev_get_config().
>=20
> This happens because vhost_user_blk_disconnect() is postponed but
> it should have dropped s->connected flag by the time
> vhost_user_blk_device_realize() performs a new connection opening.
> On the connection opening, vhost_dev initialization in
> vhost_user_blk_connect() relies on s->connection flag and
> if it's not dropped, it skips vhost_dev initialization and returns
> with success. Then, vhost_user_blk_device_realize()'s execution flow
> goes to vhost_dev_get_config() where it's aborted on the assert.
>=20

The next sentence is a little misleading as splitting initialization and
operational logic has already been done in a prior patch. Please reword
to clarify that we've already made the split.

> The connection/disconnection processing should happen
> differently on initialization and operation of vhost-user-blk.
> On initialization (in vhost_user_blk_device_realize()) we fully
> control the initialization process. At that point, nobody can use the
> device since it isn't initialized and we don't need to postpone any
> cleanups, so we can do cleanup right away when there is communication
> problems with the vhost-blk daemon.
> On operation the disconnect may happen when the device is in use, so
> the device users may want to use vhost_dev's data to do rollback before
> vhost_dev is re-initialized (e.g. in vhost_dev_set_log()), so we
> postpone the cleanup.
>

ditto - this patch no longer splits the two cases.

> The patch splits those two cases, and performs the cleanup immediately on
> initialization, and postpones cleanup when the device is initialized and
> in use.
>=20
> Signed-off-by: Denis Plotnikov <den-plotnikov@yandex-team.ru>
> ---
>  hw/block/vhost-user-blk.c | 48 +++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
>=20
> diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
> index 1af95ec6aae7..4e215f71f152 100644
> --- a/hw/block/vhost-user-blk.c
> +++ b/hw/block/vhost-user-blk.c
> @@ -402,38 +402,38 @@ static void vhost_user_blk_event(void *opaque, QEMU=
ChrEvent event,
>          break;
>      case CHR_EVENT_CLOSED:
>          /*
> -         * A close event may happen during a read/write, but vhost
> -         * code assumes the vhost_dev remains setup, so delay the
> -         * stop & clear. There are two possible paths to hit this
> -         * disconnect event:
> -         * 1. When VM is in the RUN_STATE_PRELAUNCH state. The
> -         * vhost_user_blk_device_realize() is a caller.
> -         * 2. In tha main loop phase after VM start.
> -         *
> -         * For p2 the disconnect event will be delayed. We can't
> -         * do the same for p1, because we are not running the loop
> -         * at this moment. So just skip this step and perform
> -         * disconnect in the caller function.
> -         *
> -         * TODO: maybe it is a good idea to make the same fix
> -         * for other vhost-user devices.
> +         * Closing the connection should happen differently on device
> +         * initialization and operation stages.
> +         * On initalization, we want to re-start vhost_dev initializatio=
n
> +         * from the very beginning right away when the connection is clo=
sed,
> +         * so we clean up vhost_dev on each connection closing.
> +         * On operation, we want to postpone vhost_dev cleanup to let th=
e
> +         * other code perform its own cleanup sequence using vhost_dev d=
ata
> +         * (e.g. vhost_dev_set_log).
>           */
>          if (realized) {
> +            /*
> +             * A close event may happen during a read/write, but vhost
> +             * code assumes the vhost_dev remains setup, so delay the
> +             * stop & clear.
> +             */
>              AioContext *ctx =3D qemu_get_current_aio_context();
> =20
>              qemu_chr_fe_set_handlers(&s->chardev, NULL, NULL, NULL, NULL=
,
>                      NULL, NULL, false);
>              aio_bh_schedule_oneshot(ctx, vhost_user_blk_chr_closed_bh, o=
paque);
> -        }
> =20
> -        /*
> -         * Move vhost device to the stopped state. The vhost-user device
> -         * will be clean up and disconnected in BH. This can be useful i=
n
> -         * the vhost migration code. If disconnect was caught there is a=
n
> -         * option for the general vhost code to get the dev state withou=
t
> -         * knowing its type (in this case vhost-user).
> -         */
> -        s->dev.started =3D false;
> +            /*
> +             * Move vhost device to the stopped state. The vhost-user de=
vice
> +             * will be clean up and disconnected in BH. This can be usef=
ul in
> +             * the vhost migration code. If disconnect was caught there =
is an
> +             * option for the general vhost code to get the dev state wi=
thout
> +             * knowing its type (in this case vhost-user).
> +             */
> +            s->dev.started =3D false;
> +        } else {
> +            vhost_user_blk_disconnect(dev);
> +        }
>          break;
>      case CHR_EVENT_BREAK:
>      case CHR_EVENT_MUX_IN:
> --=20
> 2.25.1
> =

