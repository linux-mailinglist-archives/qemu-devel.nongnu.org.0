Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 085E82E6F1B
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Dec 2020 09:52:45 +0100 (CET)
Received: from localhost ([::1]:47166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kuAkF-0001XG-L2
	for lists+qemu-devel@lfdr.de; Tue, 29 Dec 2020 03:52:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1kuAhz-00011P-SC
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 03:50:24 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.109.102]:49005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <acho@suse.com>) id 1kuAhw-0000vW-OB
 for qemu-devel@nongnu.org; Tue, 29 Dec 2020 03:50:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com;
 s=mimecast20200619; t=1609231814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JmT/d+SyosSoEFpYYkT8R1KVg+Y0GeO4Y8vCOIeZ/c0=;
 b=OBXMeJWrDS9rllW+fDiWew+7FarBmssVAitJSSZ7VPRMpn20GxqaloVTevb/42shWnC4MD
 aovNZ9pDrdLBicbGn6wWVKAW4vtAO2g+Kqmn359tQoydzgbVn73bM4NZLiIrrU1NXoBwhG
 piKaz9nr4rkUY+Cs3v5p/WvbGDLNiu8=
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur02lp2050.outbound.protection.outlook.com [104.47.4.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-9-EpgXjkoTMQKUQ9kZ0Xx3ng-1;
 Tue, 29 Dec 2020 09:50:12 +0100
X-MC-Unique: EpgXjkoTMQKUQ9kZ0Xx3ng-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OLoxtlgo/iYxLeo13q0imWbue0uI1cr0BqkwLWZEXCoWKU5LngKHFUXuCowRygShPI2u5B5BxiLgFPgyzD4DpQs7ngpRzzYggqZ3PVQn+Pn11hd/mT/e3fJuGUU7MeuO2xhj/qQGgAnrno8UAVQaUljkUoKc+stDwsr9iaokTOkTMK7+/qFfLiuoWXn8ElzDPTf1slMJj7Jq9M4LRfKRXHH5YSYVj9GWlMY//eQ6f3fyJFFMMwAkXYK5AogoD06c+Mzu5VBu6HaZEwjcYGR0FEqsSggZCT4Dyd7wzuRHpQtOn53slkbKxEeDuub2TdAIycW7WVN/Q37ENskMY1a44g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1gvR7w3Uhen+nm8KPuwaFe7BA2x7vNVPLXA/jfNRg4=;
 b=aCTJryXJ2qtVOaMwMUjRBx7c3ULaLJILBAvnSuL1m2y2g7EBIlrpmeJiFIt/lJso4aVlxUcXUuQ84RZJZE5KFWuScug/gQ6HnAzdaTggSXkYTrqX5+ETbvvCca4AZ7bXNj6qrfpVhrC/mbUEWUmkqQMH+KU7McKSMphz+Q0Vz4u4tdfImgrtqjKMYwFUWERvMUMVZE6oUrlgnJ5AWX6AcZdOnq/zpqeQbKzmwIUAg+bo0R/xlEeSdZkTo8w2ZIYviGDxc8O2RclUObKUBZH/JQT1mU4PhnGUSKKUkGCslNWKhUjjvLGsGcfJ/MPTTvENIeDeG+JbOgml4ivBf3zBDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25) by VI1PR04MB4766.eurprd04.prod.outlook.com
 (2603:10a6:803:55::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3700.31; Tue, 29 Dec
 2020 08:50:10 +0000
Received: from VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::c53b:66c3:e1dc:e5c6]) by VI1PR0402MB3744.eurprd04.prod.outlook.com
 ([fe80::c53b:66c3:e1dc:e5c6%7]) with mapi id 15.20.3700.029; Tue, 29 Dec 2020
 08:50:10 +0000
Message-ID: <8ba85282e0de4e898389a1e04eab97aff12ef72e.camel@suse.com>
Subject: Re: [PATCH v3] gitlab-ci.yml: Add openSUSE Leap 15.2 for gitlab CI/CD
To: Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
Date: Tue, 29 Dec 2020 16:50:00 +0800
In-Reply-To: <e7954d35-3540-5230-28e8-8dd33569c95d@redhat.com>
References: <20201224085931.20465-1-acho@suse.com>
 <e7954d35-3540-5230-28e8-8dd33569c95d@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.2 
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [60.251.47.115]
X-ClientProxiedBy: HK2PR0302CA0023.apcprd03.prod.outlook.com
 (2603:1096:202::33) To VI1PR0402MB3744.eurprd04.prod.outlook.com
 (2603:10a6:803:16::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.156.41.170] (60.251.47.115) by
 HK2PR0302CA0023.apcprd03.prod.outlook.com (2603:1096:202::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.14 via Frontend Transport; Tue, 29 Dec 2020 08:50:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f8938f0-cb32-42bb-1c3a-08d8abd6c028
X-MS-TrafficTypeDiagnostic: VI1PR04MB4766:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4766912A6DC38F6323E7C72EA0D80@VI1PR04MB4766.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1Iex6ao4ZSA/xvqtqK9mZPtuhy5C+chKvKHzRiA2/j8zACGu7AOSIhnoJc1nxie8pTqqEN8i0XZps6qDw5DrfQrNBt70Dge+SgCoU7bqufcJsr/BUm/+OXLc44zXILzYs2o9jyhbxvUkhpgvB2PRHTKmTOsXtsD0YViUi6B+5zfsg1YUh9QXJQMaQ9m6qtOR3K5crU3r7udL9gUb9dJu1zUYWIRZRS4iZGfXtJGbKlMYUQIIojc2R7JT/pSu9UDw+7T05AN6RN/oJOuL62qXB4DwohseFFWEBUMVbXhClEUPUbJ6dn2i8uynimgiGer1qAvCK8et/0tppV9/tqYY4co6GX8yooyuuGak8EcbZ6qvGv1uThUzh7P5TvRJIdv/fY+lvCfs1u7QUWpEBhLTAYvknaDNePfOsErBJvECkmNznflX9kWSvFiIN2vbnP9dHPqk8G+JjXuhSi542QdR4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0402MB3744.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(136003)(376002)(366004)(39860400002)(5660300002)(66556008)(966005)(36756003)(52116002)(55236004)(6486002)(53546011)(2906002)(66946007)(8676002)(4001150100001)(86362001)(26005)(8936002)(2616005)(316002)(956004)(4326008)(66476007)(478600001)(16576012)(83380400001)(186003)(16526019)(107886003)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uXDEF5aqlTKiA/yR1LxwG2+YxMHgS0Who9j+KhhL7Bcl9j8jtzuipKIEeul9?=
 =?us-ascii?Q?DbwYoJSVD9VPq0RsVOY14x11r8UYiJIOIpjwbx36ZQv9pR0hvBeQld9Y7fwA?=
 =?us-ascii?Q?Gzbo6an/2NVmSrFeW/dGMubK9IcvZau5qfbJnQZP1ofj6zKFnwofsebSXjrf?=
 =?us-ascii?Q?D/E/RLcvPrD4OOsObuHmyQUWpyPNRAqW/BPJHWZ6kXdIej7w38UsQUJjPrdp?=
 =?us-ascii?Q?EH6yiHiYTO9oV6ep9VD+gc7d7N3KcUenZuXMVx3SculxDoqm02Fecq8LnLLo?=
 =?us-ascii?Q?Lpyj0IBgu2UmHqtDZy3irA6F8VU+t8g9XW+RGyWJ7TeOq2mRPzKM6K7EdQ1x?=
 =?us-ascii?Q?zQmUtWnfoxudLFZ1KpzGQ2/mrWnIMV34O3hoj7apyUSISnSaf9G/dcvjw3la?=
 =?us-ascii?Q?TjdYX4uM6d+9vXl1Os5ah8EBFEyCQFAfeNARLRmd2dxAedJPnQRNgcqKVO8k?=
 =?us-ascii?Q?Cxty5g5TBZ7+XTsBdJMoCQpcw/sXZlO9fwQkbY4eoNWlypdDOiVZTuIgop9T?=
 =?us-ascii?Q?U098AKMs/XVKTZnTzQDdAs0mgaGAKk6gij7UP1xZvv8sgezRgl/X59RXtjL8?=
 =?us-ascii?Q?hJj7RNcQyZMbxFjJreQECXJ1arTqsx4D6nr2QhTX3bnjgzogMzQc4IXjFvoq?=
 =?us-ascii?Q?N13ieMEDtpl8DiKwNrf79rtNuGioXPiM8V/Ps6c9BNAlLNDMXbTvuzSPA4RT?=
 =?us-ascii?Q?2XF0FUF5hLivNIXOtxYZ9f6/VKw/Nr3Gg/4jrytxEUGZmVOW+qOy3eK/Fqgq?=
 =?us-ascii?Q?XdYeCz7BtWDH6bzJWcLmltHb5wbZ8OMz2dYaDdNR5js6290+4Y3gBmPm4hlz?=
 =?us-ascii?Q?CXdN6I4sSajr6TJTzGNQ9y2CfpoHR6uLWXGZaw9cgt05UlLuB8pZTUKFE5r0?=
 =?us-ascii?Q?xoWPKQN+nutzXDK2Nz6XdFbUn1ia7J7VzLDYwqHZEzfuNTQt/49enkWc31Bi?=
 =?us-ascii?Q?IYmr30t5m1JL6/KLTizFYG0r2f5R0JS+R1GjhZIotDUUl3yoej09u2Gxq/Z4?=
 =?us-ascii?Q?pA0v?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3744.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2020 08:50:10.6571 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f8938f0-cb32-42bb-1c3a-08d8abd6c028
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j4PR5i9EBYIApFegBu1jBPaCXbdW20c1Bk12SRYutpnba9xomqtgS87QtkpIow3e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4766
Received-SPF: pass client-ip=194.104.109.102; envelope-from=acho@suse.com;
 helo=de-smtp-delivery-102.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, lyan@suse.com, thuth@redhat.com, philmd@redhat.com,
 brogers@suse.com, cfontana@suse.de, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to: AL Yu-Chen Cho <acho@suse.com>
From: AL Yu-Chen Cho via <qemu-devel@nongnu.org>

Hi Wainer,

On Mon, 2020-12-28 at 15:02 -0300, Wainer dos Santos Moschetta wrote:
> Hi,
>=20
> On 12/24/20 5:59 AM, Cho, Yu-Chen wrote:
> > Add build-system-opensuse jobs and opensuse-leap.docker dockerfile.
> > Use openSUSE Leap 15.2 container image in the gitlab-CI.
> >=20
> > Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> > ---
> > v3:
> > Drop the "acceptance-system-opensuse" job part of the
> > patch for now to get at least the basic compile-coverage
> >=20
> > v2:
> > Drop some package from dockerfile to make docker image more light.
> >=20
> > v1:
> > Add build-system-opensuse jobs and opensuse-leap.docker dockerfile.
> > Use openSUSE Leap 15.2 container image in the gitlab-CI.
> > ---
> > =C2=A0 .gitlab-ci.d/containers.yml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 5 ++
> > =C2=A0 .gitlab-ci.yml=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20 ++++++=
+
> > =C2=A0 tests/docker/dockerfiles/opensuse-leap.docker | 54
> > +++++++++++++++++++
> > =C2=A0 3 files changed, 79 insertions(+)
> > =C2=A0 create mode 100644 tests/docker/dockerfiles/opensuse-leap.docker
>=20
> On Gitlab CI this new docker file has no issues:
>=20
> https://gitlab.com/wainersm/qemu/-/jobs/934243313
>=20
> One test won't execute due to lack of hostname program:
>=20
> https://gitlab.com/wainersm/qemu/-/jobs/934243313#L3698
>=20
> Using it locally has some issues though. I can build the image as ...
>=20
> $ make docker-image-opensuse-leap
>=20
> ... but I cannot run the test-build script as ...
>=20
> $ make docker-test-build@opensuse-leap
>=20
> .. and the reason is that it misses the tar program which is used to=20
> untar the QEMU sources inside the container.
>=20
> Ensuring that tar is installed wasn't enough either, I had to adjust
> the=20
> path to python (/usr/bin/python3.8 doesn't exist).
>=20

Yes, that's the key point.
Thanks a lot.
And that's why acceptance-system-opensuse failed.

I will submit v4 for it.

Thanks again.

Cheer,
     AL

> So I did change:
>=20
> diff --git a/tests/docker/dockerfiles/opensuse-leap.docker=20
> b/tests/docker/dockerfiles/opensuse-leap.docker
> index 8b0d915bff..0e64893e4a 100644
> --- a/tests/docker/dockerfiles/opensuse-leap.docker
> +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> @@ -43,12 +43,13 @@ ENV PACKAGES \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libspice-server-devel \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 systemd-devel \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 systemtap-sdt-devel \
> +=C2=A0=C2=A0=C2=A0 tar \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 usbredir-devel \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virglrenderer-devel \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xen-devel \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vte-devel \
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 zlib-devel
> -ENV QEMU_CONFIGURE_OPTS --python=3D/usr/bin/python3.8
> +ENV QEMU_CONFIGURE_OPTS --python=3D/usr/bin/python3.6
>=20
> =C2=A0=C2=A0RUN zypper update -y && zypper --non-interactive install -y
> $PACKAGES
> =C2=A0=C2=A0RUN rpm -q $PACKAGES | sort > /packages.txt
>=20
> >=20
> > diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-
> > ci.d/containers.yml
> > index 892ca8d838..910754a699 100644
> > --- a/.gitlab-ci.d/containers.yml
> > +++ b/.gitlab-ci.d/containers.yml
> > @@ -246,3 +246,8 @@ amd64-ubuntu-container:
> > =C2=A0=C2=A0=C2=A0 <<: *container_job_definition
> > =C2=A0=C2=A0=C2=A0 variables:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NAME: ubuntu
> > +
> > +amd64-opensuse-leap-container:
> > +=C2=A0 <<: *container_job_definition
> > +=C2=A0 variables:
> > +=C2=A0=C2=A0=C2=A0 NAME: opensuse-leap
> > diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> > index 98bff03b47..a1df981c9a 100644
> > --- a/.gitlab-ci.yml
> > +++ b/.gitlab-ci.yml
> > @@ -195,6 +195,26 @@ acceptance-system-centos:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MAKE_CHECK_ARGS: check-acceptance
> > =C2=A0=C2=A0=C2=A0 <<: *acceptance_definition
> > =C2=A0=20
> > +build-system-opensuse:
> > +=C2=A0 <<: *native_build_job_definition
> > +=C2=A0 variables:
> > +=C2=A0=C2=A0=C2=A0 IMAGE: opensuse-leap
> > +=C2=A0=C2=A0=C2=A0 TARGETS: s390x-softmmu x86_64-softmmu aarch64-softm=
mu
> > +=C2=A0=C2=A0=C2=A0 MAKE_CHECK_ARGS: check-build
> > +=C2=A0 artifacts:
> > +=C2=A0=C2=A0=C2=A0 expire_in: 2 days
> > +=C2=A0=C2=A0=C2=A0 paths:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - build
> > +
> > +check-system-opensuse:
> > +=C2=A0 <<: *native_test_job_definition
> > +=C2=A0 needs:
> > +=C2=A0=C2=A0=C2=A0 - job: build-system-opensuse
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 artifacts: true
> > +=C2=A0 variables:
> > +=C2=A0=C2=A0=C2=A0 IMAGE: opensuse-leap
> > +=C2=A0=C2=A0=C2=A0 MAKE_CHECK_ARGS: check
> > +
> > =C2=A0 build-disabled:
> > =C2=A0=C2=A0=C2=A0 <<: *native_build_job_definition
> > =C2=A0=C2=A0=C2=A0 variables:
> > diff --git a/tests/docker/dockerfiles/opensuse-leap.docker
> > b/tests/docker/dockerfiles/opensuse-leap.docker
> > new file mode 100644
> > index 0000000000..8b0d915bff
> > --- /dev/null
> > +++ b/tests/docker/dockerfiles/opensuse-leap.docker
> > @@ -0,0 +1,54 @@
> > +FROM opensuse/leap:15.2
> > +
> > +# Please keep this list sorted alphabetically
>=20
> The list of packages below isn't sorted.
>=20
> Thanks for contributing this!
>=20
> - Wainer
>=20
> > +ENV PACKAGES \
> > +=C2=A0=C2=A0=C2=A0 bc \
> > +=C2=A0=C2=A0=C2=A0 brlapi-devel \
> > +=C2=A0=C2=A0=C2=A0 bzip2 \
> > +=C2=A0=C2=A0=C2=A0 cyrus-sasl-devel \
> > +=C2=A0=C2=A0=C2=A0 gcc \
> > +=C2=A0=C2=A0=C2=A0 gcc-c++ \
> > +=C2=A0=C2=A0=C2=A0 mkisofs \
> > +=C2=A0=C2=A0=C2=A0 gettext-runtime \
> > +=C2=A0=C2=A0=C2=A0 git \
> > +=C2=A0=C2=A0=C2=A0 glib2-devel \
> > +=C2=A0=C2=A0=C2=A0 glusterfs-devel \
> > +=C2=A0=C2=A0=C2=A0 libgnutls-devel \
> > +=C2=A0=C2=A0=C2=A0 gtk3-devel \
> > +=C2=A0=C2=A0=C2=A0 libaio-devel \
> > +=C2=A0=C2=A0=C2=A0 libattr-devel \
> > +=C2=A0=C2=A0=C2=A0 libcap-ng-devel \
> > +=C2=A0=C2=A0=C2=A0 libepoxy-devel \
> > +=C2=A0=C2=A0=C2=A0 libfdt-devel \
> > +=C2=A0=C2=A0=C2=A0 libiscsi-devel \
> > +=C2=A0=C2=A0=C2=A0 libjpeg8-devel \
> > +=C2=A0=C2=A0=C2=A0 libpmem-devel \
> > +=C2=A0=C2=A0=C2=A0 libpng16-devel \
> > +=C2=A0=C2=A0=C2=A0 librbd-devel \
> > +=C2=A0=C2=A0=C2=A0 libseccomp-devel \
> > +=C2=A0=C2=A0=C2=A0 libssh-devel \
> > +=C2=A0=C2=A0=C2=A0 lzo-devel \
> > +=C2=A0=C2=A0=C2=A0 make \
> > +=C2=A0=C2=A0=C2=A0 libSDL2_image-devel \
> > +=C2=A0=C2=A0=C2=A0 ncurses-devel \
> > +=C2=A0=C2=A0=C2=A0 ninja \
> > +=C2=A0=C2=A0=C2=A0 libnuma-devel \
> > +=C2=A0=C2=A0=C2=A0 perl \
> > +=C2=A0=C2=A0=C2=A0 libpixman-1-0-devel \
> > +=C2=A0=C2=A0=C2=A0 python3-base \
> > +=C2=A0=C2=A0=C2=A0 python3-virtualenv \
> > +=C2=A0=C2=A0=C2=A0 rdma-core-devel \
> > +=C2=A0=C2=A0=C2=A0 libSDL2-devel \
> > +=C2=A0=C2=A0=C2=A0 snappy-devel \
> > +=C2=A0=C2=A0=C2=A0 libspice-server-devel \
> > +=C2=A0=C2=A0=C2=A0 systemd-devel \
> > +=C2=A0=C2=A0=C2=A0 systemtap-sdt-devel \
> > +=C2=A0=C2=A0=C2=A0 usbredir-devel \
> > +=C2=A0=C2=A0=C2=A0 virglrenderer-devel \
> > +=C2=A0=C2=A0=C2=A0 xen-devel \
> > +=C2=A0=C2=A0=C2=A0 vte-devel \
> > +=C2=A0=C2=A0=C2=A0 zlib-devel
> > +ENV QEMU_CONFIGURE_OPTS --python=3D/usr/bin/python3.8
> > +
> > +RUN zypper update -y && zypper --non-interactive install -y
> > $PACKAGES
> > +RUN rpm -q $PACKAGES | sort > /packages.txt
>=20



