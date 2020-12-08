Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8862D25D8
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 09:27:44 +0100 (CET)
Received: from localhost ([::1]:46536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmYLX-0000Wz-HC
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 03:27:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1kmYJm-0008CK-T8
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:25:54 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:57784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1kmYJi-0004k9-3b
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 03:25:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1607415946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AHFv21jYqkWj/doGdlOLFTT3XEuk6o8EuN5E/FvX3c0=;
 b=BX+U/93hHFV0qInN01x7E0RDbybS0dfhaH69/TAySdOfid29uEcMVLt4N8gdImEnncTvDX
 stPTxNCD3M6cpun8W9BNfb1aYra9cr0eMfP9X4ms0kWjWtrubE+fBJD/AYWytfbEXuxDLb
 MFefd70V8gDzdYly7MzQxChdDrOYdHo=
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2058.outbound.protection.outlook.com [104.47.8.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-7-_Zn_SyR8OJyYY32CR3UG5w-1;
 Tue, 08 Dec 2020 09:25:44 +0100
X-MC-Unique: _Zn_SyR8OJyYY32CR3UG5w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEKt6khKZoJTbT5/tDVItiSDHorX7DO470JJ+4qsuP9jMzqTW6CwfAQna/yiixgef5/RB64HqhH99HgVQuAMKorjuhdlgdmjXvwdvPpzgDpb0B8QOYNtBcbZasDWTtB2la2PfgeN9tqyWxEzNJori5exUM94kPQb7EfuQva+c6VmKbPZK2B3O3BKR+5/+daOD3Ib6m56uHNY0VWg9gQ/k6iJRL/JFvFs+3zPhd5UYLry+oAsxud7QZ1UPD4DhWMK5PZbkZhXjvu1lfeLO4lfbi4NgjzJm4xd05q7mm9ILKb8hOO/UJIyZcqbUvyqfxA+WGSmcavnoTVo6g1t1oJJXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPH+gfjv4dkiyl5NZde9ETmJ06FZvAtqypZP/kBRGT4=;
 b=NYJDXy3ZusDdOOwOrco0eeflOuaFzDMxWVRCEz9osRu080vQQnvuN+/oA/gWZ37XT1E5atoLPo2PTSB7cqeIf9xSD0N+EXJ3igrEmHaQch/oyDGY37Y1gWOKu1Zy9I+p/wSEmOr9KCAvmzF4aYLOFGeBV9tH2cIJdJ6CYbbyG+35C86CWlUFZKCyKjRlvJHo9olU3aPyh22rV1Mk4SFMH1NAmGrz3ubm1sVTPIWGPesMo7r59le/dXdxfHC54jYtxXIv9R377jBhMrWvE7noS1J+Oupq6rADaXTZ104jR/Uu/IfLUpC0r2S+6RimaE0sL/Ws/nlogo3FDUL7rc5jeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB2992.eurprd04.prod.outlook.com
 (2603:10a6:802:9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.21; Tue, 8 Dec
 2020 08:25:41 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::c53b:66c3:e1dc:e5c6]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::c53b:66c3:e1dc:e5c6%7]) with mapi id 15.20.3654.012; Tue, 8 Dec 2020
 08:25:40 +0000
Message-ID: <8d37e67e3172dda36b931f756c88359a61df8915.camel@suse.com>
Subject: Re: [PATCH v2] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
From: AL Yu-Chen Cho <acho@suse.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
CC: philmd@redhat.com, wainersm@redhat.com, alex.bennee@linaro.org, 
 fam@euphon.net, cfontana@suse.de, brogers@suse.com, lyan@suse.com
Date: Tue, 08 Dec 2020 16:25:30 +0800
In-Reply-To: <d2a307da-d8c4-7ebc-cba0-abcd65e1c580@redhat.com>
References: <20201116113046.11362-1-acho@suse.com>
 <20201124094535.18082-1-acho@suse.com>
 <d2a307da-d8c4-7ebc-cba0-abcd65e1c580@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [60.251.47.115]
X-ClientProxiedBy: HK0PR01CA0062.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::26) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.41.170] (60.251.47.115) by
 HK0PR01CA0062.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend
 Transport; Tue, 8 Dec 2020 08:25:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e931974b-542d-4620-a435-08d89b52d926
X-MS-TrafficTypeDiagnostic: VI1PR04MB2992:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB299277DFECB9871E91D22F69A0CD0@VI1PR04MB2992.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hkxiUGeiGSkBRJbNxWJxtzT9DZw6nWqTRvj2luznXsfQzVedRR9wPNdzvsy/G6xGrgmPOOkbfbbHCBwLsEM6H5xu3sezFbSvt1sfmFhMD7EbImaiVeGqrZWtYSZKTcl23xrDtoPsz6CCxq0Dp87kmO35Yopr1BBd0pwuKTd3PvFbYSqbG3HpwhAS63ZcxqmDd/VFyJzlc34lXGUdEETuENVJuWZT/SaZumhrO53s59ikY3rOAAp7HJCLd+EFlqhvWOtqBsjZT99hUtt9xlH9gdLgNiNG2dnrb1j5AoPC/1wesem4P5Erc+Le4WPn9+gX0HU4YUOvDDuFnXKn5ngcOnzXWb8qyaS3vLb1WTosCoxvudI4a3S56O89lBAHyuJTvYWiqxGC2/sdsqQ+L68BAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(346002)(956004)(5660300002)(6486002)(4744005)(86362001)(8936002)(66476007)(66556008)(66946007)(8676002)(2616005)(16526019)(26005)(186003)(55236004)(83380400001)(6666004)(508600001)(2906002)(36756003)(16576012)(52116002)(4326008)(107886003)(966005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?HzgKnngRXfu4LiTHeNrvefxIk/Us1xBA+j24ReNkuOC9GTFoDruG/WNug8LM?=
 =?us-ascii?Q?IpLWOS0sMgoHRzEEhx+6dgxTAKLj3DfRm/66j0t+L7IZpLIKY3TdAggSpOtB?=
 =?us-ascii?Q?oVvp4issNGqs8Zuc/ybrAX7E8z9LQZNWr8/LugOnIN4T8dAJRIiOdI5eoXGU?=
 =?us-ascii?Q?0H2eYdP7xxt+jaaIIUf/adZIqZT5neMrS4pUMAvxumguIrI7tYOf37rjwnRQ?=
 =?us-ascii?Q?Rlw0rKjviLMjF0kJkPVQhIe8x2B2hyIpZJNnWzCkjkIm6a6y1AjTCHnwAVep?=
 =?us-ascii?Q?h/wwKzJDOGFfRcf5iQoxsrS3/rMLrO+b6sJnlrSzaesU6lewg4U7i2zn1mq5?=
 =?us-ascii?Q?uuDRJQtGgNZBw/MPNbD+64GwkHKdxPo/IN9VO2rznfH+/v14v9rJdr2whd7w?=
 =?us-ascii?Q?J7DBRPovzdPVN8xZvhu23hT6fMW0ilDWXjXnnYlfiz93CCfQj9zP4G95rMY9?=
 =?us-ascii?Q?QJiUU9OooeSXGmvoNEaDKRMOpLUI3udMWw0w2S6r4P10hNdoz0HEtC3AzatD?=
 =?us-ascii?Q?vmpsoyKuq/36WAXIWdnBnbHDZhobmDxcZpHezg2pFpKxbKtZIprt6AY4f/V8?=
 =?us-ascii?Q?K58u4t5I+7igdCa5ZYEsDGb+8xl3i2KSYcjvynkRLwO688L6Th0vLITL5fT6?=
 =?us-ascii?Q?VgvRhyBa2CE5DxMhdKIh7C1tJQc6zx+6NdCN6vJHiW6pN3Z8YWACrvWrKj5Z?=
 =?us-ascii?Q?gPcUzrSQxPBUT9TqB7HXnNZAe6L3YcJUM+ZAApStBmT8Cin9JZmtuOAjOHul?=
 =?us-ascii?Q?BnxVefA35IY1p0+bprFmoOtiCl039pOQs1v7LP8wm1UQjPNWIfAZqcSeg9vX?=
 =?us-ascii?Q?xpy6kIvvFdhR9RMT+jslTnbtF2MNwB2eXDgyBNT1AyQVnAwmm7BhOUlesUIP?=
 =?us-ascii?Q?zwkrBpPsWVv5JU3iVrasnv+XH/PuPY+ztk0kYDUYMCcqupuN0ft4uCcJMB6s?=
 =?us-ascii?Q?NBvkmnCPcXTfbnjpfZO3GhHSuspOJi7MOms6T45RYgQEmtjn+5EsqDfvpNAi?=
 =?us-ascii?Q?Chjj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e931974b-542d-4620-a435-08d89b52d926
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2020 08:25:40.8715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hqbG7l+1hRseXNzEtntlZKqcUuR/YfKEY2pMjW9oNQBHkTxE3NIDgYumGAliHo2A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2992
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 2020-12-08 at 07:55 +0100, Thomas Huth wrote:
> On 24/11/2020 10.45, Cho, Yu-Chen wrote:
> > v2:
> > Drop some package from dockerfile to make docker image more light.
> >=20
> > v1:
> > Add build-system-opensuse jobs and opensuse-leap.docker dockerfile.
> > Use openSUSE Leap 15.2 container image in the gitlab-CI.
> >=20
> > Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> > ---
> > =C2=A0.gitlab-ci.d/containers.yml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 5 ++
> > =C2=A0.gitlab-ci.yml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 30 +++++++++=
++
> > =C2=A0tests/docker/dockerfiles/opensuse-leap.docker | 54
> > +++++++++++++++++++
> > =C2=A03 files changed, 89 insertions(+)
> > =C2=A0create mode 100644 tests/docker/dockerfiles/opensuse-leap.docker
>=20
> =C2=A0Hi!
>=20
> While trying to pick up your patch, I noticed that it is failing now
> in the
> gitlab-CI:
>=20
> =C2=A0https://gitlab.com/huth/qemu/-/jobs/896384459
>=20
> Could you please have a look and send a fixed v3?
>=20

No problem, will submit v3 soon.

Cheers,
      AL

> =C2=A0Thanks,
> =C2=A0 Thomas
>=20



