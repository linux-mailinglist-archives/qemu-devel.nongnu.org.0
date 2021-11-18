Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F5C45520D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 02:15:13 +0100 (CET)
Received: from localhost ([::1]:56942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnW19-0002lJ-Nz
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 20:15:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@intel.com>)
 id 1mnVzo-0001vm-Nv; Wed, 17 Nov 2021 20:13:48 -0500
Received: from mga02.intel.com ([134.134.136.20]:60925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yadong.qi@intel.com>)
 id 1mnVzl-0005n6-RI; Wed, 17 Nov 2021 20:13:48 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="221304823"
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="221304823"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2021 17:13:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,243,1631602800"; d="scan'208";a="495157024"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga007.jf.intel.com with ESMTP; 17 Nov 2021 17:13:38 -0800
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 17 Nov 2021 17:13:38 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 17 Nov 2021 17:13:38 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 17 Nov 2021 17:13:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nu4GnjmDVXwkXBxQ/xeIXC+Dd2NHV1Sc9U9VOl1OU3L1sdI3zUXssHJINsiz8pHuo/Bzr+iYqBVBUixpI+CIhon3bUY0fpL+wYJo5iVITdCJnex1A0FRvXuYwoOAnzOjBA9NH5KPQBqtjvkT6NLT1O9052BJyW4vcKKsbmID+Q6pYPFQyj+g1/5oauA5+dxUCs7OE1ivM8gKQRGj4Py04a+IOGF7NXs8TuDmDx5Xrl3Zm4RXZ4zC0R/s7NrJH0nMtB1M/ZwvKjN/8vMxrjOHBPGhiXhIzZk1JcuTUDEMKSts2Y8YRYqwW5daraQ2dqH+3uXwbYPPFegn7892Up1LYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MM6lvQ1KwRrrzjeWgyhyeSsqysiTB/TtCVYhN2kF6k=;
 b=aKRRoePp4YuIzAbm3j2T9s9cAvWsTUElNEU+nmrg4tumCFOuDBd401v9tWcq0cAgCQBO5IqBMnyQmcrH1uxxTB9yjNyZ0Y6mlNVbs3WlkSRKHmXXKlZr29LQ0jgmrsXNeDK7u65CTiwiE2zyr8Zs3MhOFDzKIwZyXplyJqwzE3mRHT5NhgfKcYCYimFvFq1c3jcdX0W0YgQAqPGmLvH2LgGtlx8uhKtPZnxEmMLnTVqjqhxMvmUziwR3pJ3wrj7XvBsb1FKYXqdYa+q6oLw/rpITmVTJZV+zPpILBSIkuARZAM3waAM/EqwDvidP4+LyaWT/AAhvJHRcAhwzkH2RHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3MM6lvQ1KwRrrzjeWgyhyeSsqysiTB/TtCVYhN2kF6k=;
 b=tMZy+Dx1tagQ5xtm+Dbziya5x+ZHIx/UWo+iC8D1+u1IgAQNp+Sfv6ebEaR54kCKpjjPe2zOq9m/6B2AvRRShdjO4aaO6P8JXl+G363wDRWWl3z7TxwB4B0M8QlBVivWulrgih+JyqPbbaSINB3UsST6yNUkS9hdoaU4EaUCuAk=
Received: from BL1PR11MB5479.namprd11.prod.outlook.com (2603:10b6:208:317::18)
 by MN2PR11MB3919.namprd11.prod.outlook.com (2603:10b6:208:13b::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25; Thu, 18 Nov
 2021 01:13:32 +0000
Received: from BL1PR11MB5479.namprd11.prod.outlook.com
 ([fe80::fc12:a79b:c5db:a9d3]) by BL1PR11MB5479.namprd11.prod.outlook.com
 ([fe80::fc12:a79b:c5db:a9d3%7]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 01:13:32 +0000
From: "Qi, Yadong" <yadong.qi@intel.com>
To: Christoph Hellwig <hch@infradead.org>, Stefan Hajnoczi
 <stefanha@redhat.com>
Subject: RE: [PATCH 1/2] block:hdev: support BLKSECDISCARD
Thread-Topic: [PATCH 1/2] block:hdev: support BLKSECDISCARD
Thread-Index: AQHX2dzamYXy/ElsOUmIuyd+uNaIiKwEogIAgADECoCAAJgBAIABPSmAgAE9ezA=
Date: Thu, 18 Nov 2021 01:13:32 +0000
Message-ID: <BL1PR11MB5479A90EAC942690010F1950E39B9@BL1PR11MB5479.namprd11.prod.outlook.com>
References: <20211115045200.3567293-1-yadong.qi@intel.com>
 <20211115045200.3567293-2-yadong.qi@intel.com>
 <YZJq4E92zYQeqMy7@stefanha-x1.localdomain>
 <BL1PR11MB547976F230BB9EAE2E7C458BE3999@BL1PR11MB5479.namprd11.prod.outlook.com>
 <YZOO1hD/+AAMB/b5@stefanha-x1.localdomain> <YZSY44T08a2yePpr@infradead.org>
In-Reply-To: <YZSY44T08a2yePpr@infradead.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.200.16
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00e0a129-711a-404c-176e-08d9aa30a358
x-ms-traffictypediagnostic: MN2PR11MB3919:
x-microsoft-antispam-prvs: <MN2PR11MB39194CA6612692002CDF12A5E39B9@MN2PR11MB3919.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Z5W9IDPgB0HEGRiCAG4m34gbc+8glD+FSrOFo4Us8BtXWgE/1fDJLUY2JvHuCwD6nF8LWVUPbZkWEpWpzigMute0ibwVElyN0rVzEsxWd6gd8KWq6jf3IqSNGGi8KoAjDkpmcg+4JhIqSSRZCtqcLXabeIQTUJbpzm8TIA0MFtcSyg3T/PrR/hp0tZuSx08mbkXJs5fRNEjkwGA9XU3znyLFANIXjGig2pQwp4TJ8UE93n8J0ZSE52Mb7e8CEhRRwO/VIoQDvMHrzCutSkxzSENVC1ht3IeNeXVJPVcpxW7Q2CJIc6X0Lw++tor+fVe6LlVcEQvPUEexMekB1jv6JZm9h8nShGbKyO5G59AoCMFyGodTQWMQa2iXUJXr82TowFi7RRyTuymT4Ew51ozMzWRxxhx80ZdOJtaiM17CXRLPcl7roSfWmpqrtBblbNKazUe9J9BniqG8RZXcJXDE/dgowq7nwn4FEKXsdYKg2jp2GddrtyOz9iNCLB17+T6NccyfA0yssUKmnCD5H5g/4wBO2foLYWFK3NjqAyoeQnuoU2zeCzlECH3aw63F8/CZkfqhMDiA0Sc8TakwoP8n/3fDa6c/1slEaEMDtzwNZY/JOtwwlO7zFXLsPmPnDVCXW9V5wC4x2YBSJb0QiHSM5ULV7oLn5Z8pXLHR4+wT6aESX9jXCQu+cxwmfPbu316FoAoS4pFbA9wsMTLiU95CXQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5479.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2906002)(6506007)(4744005)(186003)(8676002)(5660300002)(9686003)(107886003)(33656002)(26005)(122000001)(71200400001)(76116006)(110136005)(4326008)(316002)(83380400001)(8936002)(66476007)(7696005)(52536014)(508600001)(66446008)(64756008)(66946007)(66556008)(55016002)(38070700005)(86362001)(54906003)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?IEYjYv9ONSOKL1SG5F3tHk9jqAQd8lv6b1qod9IYPWbmiDRQ9LVAJ/e6DOkn?=
 =?us-ascii?Q?aRH41xIVz/0Q+yTstnkoQqFLTsl6kWYLe+DJGDTk5e1TbK3tNbHA4xBx1Pkp?=
 =?us-ascii?Q?/oAL9I9zV8y92l78KdBJT1vIYKPLnrmYwhBZxDckb24RvYM9Z74MV8XiDOmH?=
 =?us-ascii?Q?pIaHi8xfrGh9w+DQ8hGlisgiWootSeWgqdCGE+rpO7Nj1sBgMwAuAWEzWEUr?=
 =?us-ascii?Q?xHDkFoSt443y8E/jtFvI+v04SjteeHafnkKmimJK1ai85MVK32ljZCMXGfVW?=
 =?us-ascii?Q?ls2rbsUqczH7GYmQwVRJbcZlsMREZqn0C7KcLJC7QJ41Nr+shJjKgT3NGyKf?=
 =?us-ascii?Q?de4dLqBYCJX0nVuZqTJNDAoiYTuoGABJpqe0m/RYkR9je0vuj7MulwAhUPiB?=
 =?us-ascii?Q?dh7EJ5DMAnpKE9+EBWJrfrsO4umvWKt4GgnB75fGUX2jzK+lZtaVh600YAqo?=
 =?us-ascii?Q?kyoXXOhnTQDh/NxVUCqr1xPCbzUH/Nthq5W8LrOpVfnHcLUdt2uL6XPmuYL7?=
 =?us-ascii?Q?3t78YYZh0n2MOJgG45pWQdMy2QvzLQWyS4yk+PWWyINAEW1MauTIeuD3UhTF?=
 =?us-ascii?Q?3N+UVy3pcqMQMQq61FnUhVDgVieU2CoV2EkJkgkb0b2tUy+oxOj/A7nkF330?=
 =?us-ascii?Q?/3pbti9GD1dxSxA15vuBRKCeL6EfM3n1zr/goIgYPqpBH6cLy7dQimwRBbFh?=
 =?us-ascii?Q?ID/895A4hojTkBVUP3dr1AUnlHIiMK7IDWnsZinLnzYJ5vInkrAiJHd1BhGn?=
 =?us-ascii?Q?gQOTtL9dbq4ZQOjaNFux+Y4uVZnCxNsCAiELiW5ZVd3ab6NZP9uT2/9dlcGO?=
 =?us-ascii?Q?iklBE2gSgSJHdFHY1qpjDSs3zTVUO2rjWeU5F/fsaIlIDMPIkBNcGWybUob9?=
 =?us-ascii?Q?4sF5W85RGUNuPKALv2hiJGfGO65eK1rztX2+qrDY/5SrCiXMa6uok85Kq9lK?=
 =?us-ascii?Q?m/LAnhGUhLUnQ9luYurwifsoXuvWLf4rGbXEWorfLvsGOYStarBqwCaDhpV3?=
 =?us-ascii?Q?GtavzFLH62RkJwyfmICQx+Pc9aFe9fptmDsOuHi3J4mp4PCK1Ymih6Aau5qu?=
 =?us-ascii?Q?dS10EJHy9BQPPorsTMq0ldT4f9cSkqMkM99a5wCao4zpKnuu/+ToWrEKpnlF?=
 =?us-ascii?Q?eMfsVQ14vkjC/i39cJzUOr76INlc49sZ8xxUnVBwcOd2GjmqDTOgh1rsq8Sf?=
 =?us-ascii?Q?FYC3vBiGJVU21bubR9ngC1ede4krZtgMlIiggyOd3fLhUhrkK0eLp7oz6zzl?=
 =?us-ascii?Q?6hkfKROlVnZA3m4kJbYnXT3ky5nRpce9rO1gBLxdx6jPdTA+32pw2eYLOiFh?=
 =?us-ascii?Q?AuCXZI7JaoO9PvuGYwkQ8nY8z5hmOe9Ta6vwhJUX9apXylzDjeDw/vmPOcq6?=
 =?us-ascii?Q?NVlu8b6kap193u5a0pM5nUhL0LAzrvsXCM1FLLCnpJHON75nXnjWuWWtJGEV?=
 =?us-ascii?Q?p8L+TKkD5KTp2hx3M7hvNWaaaZ09vizNaZjO+SC9qNz8aPhgBGPROS02+qfh?=
 =?us-ascii?Q?wXRTD2ip3kAt+yDWd7p5atDEl6IthsypYMowom2xPdBodULrKWmSpqWRUxLU?=
 =?us-ascii?Q?l8LHX9Zm3/RBiMnKeZ0+V76XmK8aG4IkO5V4DTWq/0ERvs67/zHrwL9ewZHz?=
 =?us-ascii?Q?YA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00e0a129-711a-404c-176e-08d9aa30a358
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 01:13:32.4142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p8DvyEQJCRNVnYq91eOCVSL1Nc1rCah+anKwAwVIa9gcfpoEJ2l5Zbd/zcHu4iQKczlSbmBIgnDjPwrJE2RK+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3919
X-OriginatorOrg: intel.com
Received-SPF: pass client-ip=134.134.136.20; envelope-from=yadong.qi@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jens Axboe <axboe@kernel.dk>, "kwolf@redhat.com" <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>, "Chen, Luhai" <luhai.chen@intel.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "Wang,
 Kai Z" <kai.z.wang@intel.com>, "hreitz@redhat.com" <hreitz@redhat.com>,
 "fam@euphon.net" <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> What is the use case for exposing secure erase in qemu?  The whole concep=
t for
> a LBA based secure erase is generally not a very smart idea for flash bas=
ed
> media..
Hi, Christoph
We got a user requirement: support BLKSECDISCARD in VM. Which is:
ioctl(BLKSECDISCARD) in guest -> qemu backend perform secure discard
on native block device accordingly.
This is a requirement to meet the security level of the project.
So I sent out these patches to see whether qemu could accept such changes.


