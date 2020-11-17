Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B65C2B59AA
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 07:21:13 +0100 (CET)
Received: from localhost ([::1]:35768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1keuMZ-0002Sk-Tz
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 01:21:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1keuLX-00020s-L2
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 01:20:07 -0500
Received: from de-smtp-delivery-52.mimecast.com ([51.163.158.52]:57996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1keuLV-0001WU-EE
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 01:20:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1605594003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OeYN4yrpKDxhm9ykcqPxinq+L6DK88bIjUYo0AIEyt0=;
 b=lmK/VBQQiTsK/RQhafScUTzafioZnbHYj6IuVuhPVyjm80Sz4/Yec8aOA2pibVPN/clVG+
 NQ+nX8NJCOGIteEvO3W7wjyvdjBp/WeFA/Gc1ToQBxxY9WbbgPZH1BQiSfdlgGFh52a+Ax
 DkXVWuEXPNqszvNMu4SYawGGCoBGCGo=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-17-hZmkNyM-PZuFdhgkJQnsxg-1; Tue, 17 Nov 2020 07:20:01 +0100
X-MC-Unique: hZmkNyM-PZuFdhgkJQnsxg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqIEeBZR5jIXrxRGonEpEKLtKOpdZ7t5Y4QVfYqStoxlaWzlq5oMh3PTU+xsgSXwFHh3SqXsttibPnSHHE00UFnmueRWpvY57Yeb3bGJlULByQVHl5RopEo+moeHeIE/7JW+iyc5v+rNbjC8OERoEC8zzJK9KpNlaGQEUwAkBB4oVXP6U6SFcoUQlKT+RkikEhY4PdrPB4NAvLZZ/1BfM2Nn1JdqXNG69wHJIQ0lIT/xxx3+E9hpMVK9dA+1qi7a1QwE5aPeZMtOccKrpZLIDhNr3+eAJaDpaKwQFX5GxZh3Pu3aIhlsCNJRcj43TVGnkJJoGFq7eduwne8nkWcCnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OqUUfmbLpNq+F0z+UjTvQLkucSNbVBv5MpScoPR0cLE=;
 b=nFB+yydNxnWpzzXUTn9w49Eo661MMkq7bOmTNi14qpkXwR7KFgVLBnV3QjgOu5qwGrfOmecNWSZ10lU4QDpY+b5scPRBgE5dBzSI4zSGvHxzZSvv7O/IIUIhbuFibyoTxDFDKCdRRCAsyDSOUx+8HYa0j8c/rlqOFgWNBoJYzt0FmYQZBqB0Vu87EqQX5GIMr4x5qmM6NWg2Qbx8AMpNgfhccf0dSeHYoVM/kjex5VWyAl3lX/bNL2gJ0OKbnl0nklQSw/90C/t/EBRsjfKtNOMYymRo5ubeXhKZ6D6qxQIe3LLAE0V0f2JhGCi+RZ1k0iM9yHeHxBFTcKj6/hZMvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB4301.eurprd04.prod.outlook.com
 (2603:10a6:803:4a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.25; Tue, 17 Nov
 2020 06:19:59 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::70b4:f8cd:f720:1624]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::70b4:f8cd:f720:1624%7]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 06:19:59 +0000
Message-ID: <268f06cd967f454682cbf38ed9dca8ebeb4b362e.camel@suse.com>
Subject: Re: [PATCH] gitlab-ci.yml: Add openSUSE Tumbleweed and Leap for
 gitlab CI/CD
From: AL Yu-Chen Cho <acho@suse.com>
To: Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
CC: qemu-devel@nongnu.org, thuth@redhat.com, philmd@redhat.com, 
 wainersm@redhat.com, fam@euphon.net, cfontana@suse.de, brogers@suse.com, 
 lyan@suse.com
Date: Tue, 17 Nov 2020 14:19:49 +0800
In-Reply-To: <87y2j1wl2i.fsf@linaro.org>
References: <20201116113046.11362-1-acho@suse.com> <87y2j1wl2i.fsf@linaro.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [60.251.47.115]
X-ClientProxiedBy: HK2P15301CA0023.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::33) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.41.170] (60.251.47.115) by
 HK2P15301CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3611.4 via Frontend Transport; Tue, 17 Nov 2020 06:19:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ebc6c030-451e-4af0-7907-08d88ac0cf6c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4301:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4301F5E2E9E436C33F756E3AA0E20@VI1PR04MB4301.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YT1Fm1yQ2QfbZiiYIb6c9SFZggFwybG3yYW0sTjoMbXvgBjz4jJVLGL6fZPO7mFOhpD9OIXl20ytdP/UQ0qmCCmSR16EqTbJxjsnjbwzBaGmr2DptzeMRoi0QXbrhlZorN58UBIr477lG6/TX6k/zAIzzpk7Wh8mHkVC3FraZCEk8jnZoKzbAvDcmoTyNuEPs1qL6m+4xkv+B625KngXFpLlXgeLiB3QxI+X1SjP1K5u1R44kz/yIMl+EjtkQpbY4SvI4FgtLzaBOrlNAqQ+Qr3L7jkKIcXzwjMoacmb0tq+cpDxsWPvKkUzm2D51Fz4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(346002)(136003)(366004)(396003)(316002)(26005)(6486002)(8676002)(107886003)(186003)(16526019)(2906002)(8936002)(66574015)(6666004)(55236004)(86362001)(4326008)(4001150100001)(16576012)(36756003)(83380400001)(52116002)(66946007)(66476007)(478600001)(5660300002)(6916009)(956004)(2616005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ifoiHt/UXB1oaQljoqqs9dwKSUMvnmJKOWQAh12sq8JQobjTviRu4c79kNEUw+tqXKcNX7uGKKrhbmUnQYKzvdbq6HPSCJQW9qBIBMwEEQis2LHdFXhJGCXeKCWn3kCS3tM9c4f+Q3zrQ9C6hj9nmp4NwK+0SMZa5c8fOcCWYh5z7VDFpyYJ9cY0cQyKrOFTMfKheJA8E8+pl+jQoWoJ68OxL5Xq7GuhuzhzO1uFjzXo/euPtjREcXTmP2sPBPbYOjCx2KBzq6xSmQPMNsVqLsTjnqr3nLqnxYfq72NIlW98e2NkJzhViCk4udP1x+Kf2M6toMx+sMcPrGiqebqngo3R40bIkhk3BefHLEDcmRJj105I/QT+qkbQuXiHT8FSwHmLrvpkzbHaBTjRmwZtpTfclkIWejBZZSzCoRhHkeCCWZFfwCRIHRsBfkUf+x2WSDNVCxItE5F0sJuMLc9SzolgQpJx8Z2v1WQDRXurht9qbIskbn0H98Kud4IVQ1nTwcNnArAK0yPOMwEH3QapYUaaoNtvOft12kxeTKNT0LUxjH8lbFAWxaTl5kRKnL+qCgu3LaLivXfqRPnlCREwLY4VhAWQTtmQcvdVdCAlFSxJMX9nqRHOdDf3rkvJsWw4SUSQjw5E9JdXG6sGyopZaw==
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc6c030-451e-4af0-7907-08d88ac0cf6c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2020 06:19:59.5339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQIzLmvNNwKhCDN2ziCI1oGEM3f1CQ7N+INu3ue4szYG++CLh87/ZGjqekhqvYRU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4301
Received-SPF: pass client-ip=51.163.158.52; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-52.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 01:20:03
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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

Hi,

On Mon, 2020-11-16 at 12:19 +0000, Alex Benn=C3=A9e wrote:
> Yu-Chen, Cho <acho@suse.com> writes:
>=20
> > Add build-system-opensusetw and build-system-opensuse152 jobs and
> > add opensuse152.docker and opensusetw.docker dockerfile.
> > Use openSUSE Tumbleweed and openSUSE Leap 15.2 container image in
> > the
> > gitlab-CI.
> >=20
> > Signed-off-by: Yu-Chen, Cho <acho@suse.com>
>=20
> Hi,
>=20
> Could you split the TW and the Leap patches please as they are adding
> distinct things.
>=20

ok, no problem, I will send it again only for openSUSE Leap.

> I'm not super familiar with openSUSE LEAP but I assume this is in the
> same category of short lived "tip" distros as Fedora and non LTS
> Ubuntu?
> In which case we should name it as such (opensuse-leap?) as we will
> tick
> the build version each time a new version comes out.
>=20
> I'm less sure about Tumbleweed because I don't think we make any
> commitment to support rolling distros. We don't have Gentoo, Arch or
> Debian Testing* in our dockerfiles either. I would expect rolling
> distros to track the upstream build themselves.
>=20

Yes, I got it, thanks for your suggestion.

Cheers,
      AL


> * Debian 11 (next stable is there purely for compiling test cases)
>=20
> > ---
> >  .gitlab-ci.d/containers.yml                 | 10 +++
> >  .gitlab-ci.yml                              | 60 ++++++++++++++
> >  tests/docker/dockerfiles/opensuse152.docker | 88
> > ++++++++++++++++++++
> >  tests/docker/dockerfiles/opensusetw.docker  | 89
> > +++++++++++++++++++++
> >  4 files changed, 247 insertions(+)
> >  create mode 100644 tests/docker/dockerfiles/opensuse152.docker
> >  create mode 100644 tests/docker/dockerfiles/opensusetw.docker
> >=20
> > diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-
> > ci.d/containers.yml
> > index 11d079ea58..449a00de70 100644
> > --- a/.gitlab-ci.d/containers.yml
> > +++ b/.gitlab-ci.d/containers.yml
> > @@ -48,6 +48,16 @@ amd64-debian11-container:
> >    variables:
> >      NAME: debian11
> > =20
> > +amd64-opensuseTW-container:
> > +  <<: *container_job_definition
> > +  variables:
> > +    NAME: opensusetw
> > +
> > +amd64-opensuse152-container:
> > +  <<: *container_job_definition
> > +  variables:
> > +    NAME: opensuse152
> > +
> >  alpha-debian-cross-container:
> >    <<: *container_job_definition
> >    stage: containers-layer2
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index 9a8b375188..540a700596 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -195,6 +195,66 @@ acceptance-system-centos:
> >      MAKE_CHECK_ARGS: check-acceptance
> >    <<: *acceptance_definition
> > =20
> <snip>
> > +
> > +build-system-opensuse152:
> > +  <<: *native_build_job_definition
> > +  variables:
> > +    IMAGE: opensuse152
> > +    TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
> > +    MAKE_CHECK_ARGS: check-build
> > +  artifacts:
> > +    expire_in: 2 days
> > +    paths:
> > +      - build
> > +
> > +check-system-opensuse152:
> > +  <<: *native_test_job_definition
> > +  needs:
> > +    - job: build-system-opensuse152
> > +      artifacts: true
> > +  variables:
> > +    IMAGE: opensuse152
> > +    MAKE_CHECK_ARGS: check
> > +
> > +acceptance-system-opensuse152:
> > +  <<: *native_test_job_definition
> > +  needs:
> > +    - job: build-system-opensuse152
> > +      artifacts: true
> > +  variables:
> > +    IMAGE: opensuse152
> > +    MAKE_CHECK_ARGS: check-acceptance
> > +  <<: *acceptance_definition
> > +
>=20
> What's the thinking about this selection of TARGETS and tests? We've
> tried to spread the various configure, TARGETS and CHECK combinations
> across all the distros to avoid too much repetition of what is mostly
> the same code being tested.
>=20


