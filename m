Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E5B2CCD62
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 04:40:40 +0100 (CET)
Received: from localhost ([::1]:42568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkfTz-0006Jx-Ce
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 22:40:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1kkfSN-0005W1-BO
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 22:38:59 -0500
Received: from de-smtp-delivery-102.mimecast.com ([51.163.158.102]:27652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1kkfSJ-000436-Ue
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 22:38:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1606966732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nPTnsXLFleepKBqP6BLAKYRYmNl5zxipu0ubizN6/kM=;
 b=Gw6UcEtGJPSMvl6qQLwPohe/lfr+CibUHGJteG5ruldFArSIs5PumZU6uHokpEbAFtAinO
 u3WOu8OoVVzHuwmdF7SMG63toX95r8pYvyghY8F5A4PvM7pIWGadvSiUtj6uTLgfxtkUX6
 d4c5VJZ+RvuynUCcX9i20aPitWKpeOo=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2110.outbound.protection.outlook.com [104.47.17.110])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-SyalyUtBOPm-ZVV7HBhBvg-1; Thu, 03 Dec 2020 04:38:50 +0100
X-MC-Unique: SyalyUtBOPm-ZVV7HBhBvg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqhEhbXqfzBDJiWPDyN8/yGoRPN/YVKZL/ccFUVBlkxmS8VTt5+EI/S/M4y5dXysXgZ3tLovlptVBnYw7VUr/F8thuyLr2yis0xzTsZnvFvtHToIypD7RJwpON8++x3DIyhcPD81P/xVQyNK3rh9PnSjQBrDJMUgaF25xpLMqG77kQhGQHY1u3b614vUraZLzz9C/H2k7zcCaBgVjOUfb3ZiUFWzoF+0ByJ9p05S2HoeXV5oQJK3CRIUgL6XgBsunRTELwaE8yX8nX5uEWbTiQo1NNPAOYy7ReiAZxRUx0Zs6+josD4KOZlMlvsUiHZEnvzrucBKyyuPSwKHz3O+ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=23Q+wmYhgTGKcm41nidsBaRKjVQWHBWYT5uz8YrKJog=;
 b=jZi7Hiq0JJBqGyjE8IL1KcuT1Y78FfxV/zT1XIbNb3pjm1m/ENZa2RQVBTzZrNNnfcvCb7udrpFEsJHT6jqqAC0H94q7yQLP2Z2eEmLX9d9hV5gvhkXxn1U5p3onJhunmOIoaSQaJ5mSSe+zLA8Scl987gI3vFojsA92MJI7eB1CoFImisj0N8FzqSjHG1fcPXt3w2/ya+tcf1eJGNjRhaY2hSz/057YR6KbRFIplAksh25otrp46zxyDCcve8++qnhSxIkzn7D9TMv4DLJ1PekfzIh2xdo6y9y1Nqu1UQbNCVV7VJKB+x0MSqOsQW5VCD05JkDjIxX9nFU62MZs8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB7198.eurprd04.prod.outlook.com
 (2603:10a6:800:126::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Thu, 3 Dec
 2020 03:38:48 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::c53b:66c3:e1dc:e5c6]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::c53b:66c3:e1dc:e5c6%7]) with mapi id 15.20.3611.033; Thu, 3 Dec 2020
 03:38:48 +0000
Message-ID: <856f82016e0b36d81ba80342f2bb2e85482078f8.camel@suse.com>
Subject: Re: [PATCH v2] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
From: AL Yu-Chen Cho <acho@suse.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>, 
 qemu-devel@nongnu.org
CC: thuth@redhat.com, wainersm@redhat.com, alex.bennee@linaro.org,
 fam@euphon.net,  cfontana@suse.de, brogers@suse.com, lyan@suse.co, Willian
 Rampazzo <wrampazz@redhat.com>
Date: Thu, 03 Dec 2020 11:38:36 +0800
In-Reply-To: <3a5f46b9-c83f-e85c-dfc4-7fcaa711356b@redhat.com>
References: <20201130042659.29333-1-acho@suse.com>
 <3a5f46b9-c83f-e85c-dfc4-7fcaa711356b@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [60.251.47.115]
X-ClientProxiedBy: HK2PR02CA0157.apcprd02.prod.outlook.com
 (2603:1096:201:1f::17) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.41.170] (60.251.47.115) by
 HK2PR02CA0157.apcprd02.prod.outlook.com (2603:1096:201:1f::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 03:38:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a0f659e-c213-4e6b-b9a6-08d8973cf161
X-MS-TrafficTypeDiagnostic: VI1PR04MB7198:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB71982EA8F8B2965D3CEF87A5A0F20@VI1PR04MB7198.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EcNwKt34+BdhSMlnvPHP0uXKc1FMnqR2YknsIShi1UraWQWHLfygVYgvcKuA+mgn8VikSwfteVAVKNlE3D7CzW7Y8jXFg8MtM8hrDkpyQ1HahuHyzrogHeihuSEBpsitFjRQDBdGeWkSA4+xKFs2MzQWAGOrDSVV6KbxCy7P02sLdSESP3381CYsqrO0A7eWP1HpKyOCm063Epo1YyTj3AhzNO27/bdbxRaSKlbiITYktJgWvP8HsGd+VU0zRaMzveQFK2qt3zv829GQwwaIC0zIWw1/j5qsLNO7FhkJ33nOMp3+1VoazcPnw2KcO8mxFtYCoalhOvROJj0nuhixwvUaua2y07lltwqrer9YsmOVcHzPzz0pcYTC9mS5LojrXa9kR406dbQoHc2GhhlOJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(396003)(39850400004)(136003)(366004)(376002)(966005)(4001150100001)(52116002)(2906002)(26005)(2616005)(53546011)(55236004)(6666004)(956004)(186003)(16526019)(86362001)(8936002)(16576012)(316002)(83380400001)(4326008)(36756003)(5660300002)(8676002)(66476007)(6486002)(66946007)(66556008)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RBYfOCUrpprjxhKU5Wy2cQZ4QNKzWsOuIN/C3hYhrmPXqR+qvmZJEOf8w7dp?=
 =?us-ascii?Q?lVdwhgWJjrYciuB+c5ULIcMSteEcPG/vRGjpqqNOSMZQteIdKSDnI2s78vJm?=
 =?us-ascii?Q?EbHAzS1IfReWLPigC0MwuG/lKH0lkceNJhDn85hwQRWpHwig4Tp1E+aMzc+W?=
 =?us-ascii?Q?nTMsUYkjgWf9ZilA+UTv3ubdEtCKisl3CNpxjbftxVJJiIZmEGPEWaEN8fDL?=
 =?us-ascii?Q?KJW6q88+N4cD9+pXXTMKnXz62+vlsPImvl25qYqULGhKR919Eqb+y6zJ/0li?=
 =?us-ascii?Q?MWK0sgd8WpVM/+rnCu6kO82leqG06LqlyngbkwslEP3QE3LKWqZHSeOk3zfH?=
 =?us-ascii?Q?wtLxBsaJnyL8hBZyMTkjQ0GxUmGZCR8vp+1b74dy2yAO6g6LPFSESBeFUfjQ?=
 =?us-ascii?Q?MvocTkKI93YMECvSsaHmYds09z33WBcfUIgmXCX6giYBXn8Hx6lNazolVUuU?=
 =?us-ascii?Q?/zdFlTCuvk7VkyL5srNUGJIV7TXiwmk24Q75csWcZspi8R8DnqprWulUsDT9?=
 =?us-ascii?Q?Pv5tw5dUAyjugaWiQGR9+mRXdG3U9K3xpp1IJrv8C89cD6iDHqKi7Y6Y02xs?=
 =?us-ascii?Q?0zFcGuY0gFgmSZpckIJ1UqAhpGt2dmj9Ez0xvru2N+qoomkgIhhtkr78yh30?=
 =?us-ascii?Q?VAAmcUyWPNp5CzIQQJo6OMtEJtNK31WGyez25NGFUQOj0UAOioNtN82rk5f7?=
 =?us-ascii?Q?CgljLYjLYi2uuqQaPFABhuJSRmhbIS8eMlJ4Q3+2gXFBnGcRKP9/b4pwAQay?=
 =?us-ascii?Q?sJ9SoHyWP8NE0CBGsu5jVVGcCkYEqLUmP3eFUKooiXRn8d8o5CkA8pTs8t+Z?=
 =?us-ascii?Q?nlwIrQ/x6fo6UU0hjCqoAJ/87WGBC0pKh3SCn9h3o6rVBc10jwq483934SvO?=
 =?us-ascii?Q?syqsfdB8/oT1r+nJueXLXWfCz4ifzrgyX6w3JvH5jrF9f1pD7b/BWnp7+g5t?=
 =?us-ascii?Q?kyN5RdCZHX2zSG40caOvuPFEsLYyimsja4JPL/iN6aCpaFHySxQK8zBEqxQG?=
 =?us-ascii?Q?t/x3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0f659e-c213-4e6b-b9a6-08d8973cf161
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 03:38:47.9858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4QdfVgQsREILADFsaEBsq2z+NdZBsJyXdoQe1MYm/Ywz83SoLc+Pe8c1oshfatNM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7198
Received-SPF: pass client-ip=51.163.158.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 2020-11-30 at 10:14 +0100, Philippe Mathieu-Daud=C3=A9 wrote:
> On 11/30/20 5:26 AM, Cho, Yu-Chen wrote:
> > v2:
> > Drop some package from dockerfile to make docker image more light.
> >=20
> > v1:
> > Add build-system-opensuse jobs and opensuse-leap.docker dockerfile.
> > Use openSUSE Leap 15.2 container image in the gitlab-CI.
> >=20
> > Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> > ---
> >  .gitlab-ci.d/containers.yml                   |  5 ++
> >  .gitlab-ci.yml                                | 30 +++++++++++
> >  tests/docker/dockerfiles/opensuse-leap.docker | 54
> > +++++++++++++++++++
> >  3 files changed, 89 insertions(+)
> >  create mode 100644 tests/docker/dockerfiles/opensuse-leap.docker
> >=20
> > diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-
> > ci.d/containers.yml
> > index 892ca8d838..910754a699 100644
> > --- a/.gitlab-ci.d/containers.yml
> > +++ b/.gitlab-ci.d/containers.yml
> > @@ -246,3 +246,8 @@ amd64-ubuntu-container:
> >    <<: *container_job_definition
> >    variables:
> >      NAME: ubuntu
> > +
> > +amd64-opensuse-leap-container:
> > +  <<: *container_job_definition
> > +  variables:
> > +    NAME: opensuse-leap
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index d0173e82b1..6a256fe07b 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -195,6 +195,36 @@ acceptance-system-centos:
> >      MAKE_CHECK_ARGS: check-acceptance
> >    <<: *acceptance_definition
> > =20
>=20
> What about adding in a comment who is the maintainer
> of these jobs? Some sort of contact in case there is
> a OpenSUSE specific issue for example.
>=20

I am glad to be a maintainer or reviewer for the openSUSE specific
issue.


> See:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg758968.html
>=20
> > +build-system-opensuse:
> > +  <<: *native_build_job_definition
> > +  variables:
> > +    IMAGE: opensuse-leap
> > +    TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
> > +    MAKE_CHECK_ARGS: check-build
> > +  artifacts:
> > +    expire_in: 2 days
> > +    paths:
> > +      - build
> > +
> > +check-system-opensuse:
> > +  <<: *native_test_job_definition
> > +  needs:
> > +    - job: build-system-opensuse
> > +      artifacts: true
> > +  variables:
> > +    IMAGE: opensuse-leap
> > +    MAKE_CHECK_ARGS: check
> > +
> > +acceptance-system-opensuse:
> > +  <<: *native_test_job_definition
> > +  needs:
> > +    - job: build-system-opensuse
> > +      artifacts: true
> > +  variables:
> > +    IMAGE: opensuse-leap
> > +    MAKE_CHECK_ARGS: check-acceptance
> > +  <<: *acceptance_definition
> > +
> >  build-disabled:
> >    <<: *native_build_job_definition
> >    variables:


