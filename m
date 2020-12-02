Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348312CB27C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 02:49:44 +0100 (CET)
Received: from localhost ([::1]:58118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkHH5-0002t4-9U
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 20:49:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1kkHFF-00021m-F7
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 20:47:50 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:52841)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1kkHF9-0005zm-M4
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 20:47:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1606873663; x=1638409663;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=76Sh34cb6A5DhlGELz1UXs3v6fnmt88s/5ZQ6e6HTEQ=;
 b=ckLbirk6612nGEckXtHPOk/Wco7olmGgmB2caFhgo+uzOcTX3TbO3ua0
 2m9c0G6oV7UzZLPFQSepUHH3c4uZCVbApGeWMqHKyURYHINxkvvpS3Y2Z
 4U1/zh8wEqlkwsOCbexiv84HUBoLkmAbSd/mcPWp8zbAOG0M7azAlgPhE k=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 01 Dec 2020 17:47:42 -0800
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 01 Dec 2020 17:47:41 -0800
Received: from nasanexm03b.na.qualcomm.com (10.85.0.98) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Dec 2020 17:47:41 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03b.na.qualcomm.com (10.85.0.98) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 1 Dec 2020 17:47:41 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB5159.namprd02.prod.outlook.com (2603:10b6:a03:6e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Wed, 2 Dec
 2020 01:47:40 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::eca5:4fbf:3096:fea6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::eca5:4fbf:3096:fea6%6]) with mapi id 15.20.3611.031; Wed, 2 Dec 2020
 01:47:40 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>
Subject: RE: [RFC PATCH v5 20/33] Hexagon (target/hexagon) generator phase 2 -
 generate header files
Thread-Topic: [RFC PATCH v5 20/33] Hexagon (target/hexagon) generator phase 2
 - generate header files
Thread-Index: AQHWrlEScHT1ZBMEokOv9Q3uulA68anQMQMAgBMMaeA=
Date: Wed, 2 Dec 2020 01:47:40 +0000
Message-ID: <BYAPR02MB488650130A2A8B0D36A137F7DEF30@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1604016519-28065-1-git-send-email-tsimpson@quicinc.com>
 <1604016519-28065-21-git-send-email-tsimpson@quicinc.com>
 <20201119235340.418ffabf@orange>
In-Reply-To: <20201119235340.418ffabf@orange>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 307d669f-3217-4ddc-5f8a-08d89664410b
x-ms-traffictypediagnostic: BYAPR02MB5159:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB51592C832B45E47CCE921F31DEF30@BYAPR02MB5159.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wanbq9ob9a5lCZmEeT5jN6nz6XbC3K7LjY2sXs9+gr6Xn2kXQaT41C2Eey8jxQuDxD3rQha2cwVhRbWiL3brTkcH/91cvfcxxwevRurlHBF1BGEdG3Tzbsxc5QcG93Y4kKSQFehkf8z5o/9sTSXgOydSVziWWq1RAR8ndKPDfxLF1D9ceYHbC+LE8Zozp9yzBimMWf53r+9TtzInMbh+shV47ZDexkxzOo33rY2zda2wIs2sOaDRcmsZ2eoYhCBPY03Nmh21SWKUqLxT3CAVyg/sQQQLV8PsZ0wunP3G8K7AXb8/uRkrypXiT2BMaQls
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(136003)(346002)(396003)(366004)(376002)(83380400001)(6506007)(7696005)(9686003)(4744005)(54906003)(76116006)(33656002)(186003)(55016002)(66556008)(66446008)(64756008)(53546011)(66946007)(66476007)(71200400001)(26005)(478600001)(86362001)(316002)(4326008)(5660300002)(2906002)(8676002)(52536014)(6916009)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?hSy/JmkBIjOQYmepbph//AHVhqcjJ9krFTQcH/d2emDUyOc6kUmzNK2XRrNh?=
 =?us-ascii?Q?ItdyKoTg6Ajwf5yn3cddJQf+cCPvEqrByKR0YlH2mLAzSTnGOLbwDdXLkdyk?=
 =?us-ascii?Q?UMB5qeLDEFQztmtne7iG+I9lv/YN4o8up5THucjfJoB7bFAtCYDW2fNSlLwD?=
 =?us-ascii?Q?uobllXhHL8PwsXfUjJMhFJ4O+69fmKOx+1zlisHxYdbEIHX7WrsnAeeiA4ZJ?=
 =?us-ascii?Q?hrfzI/l2ILyISOKkJqxaUNZNbEt4ijYr5zNo5OzWlFfk7abUN+arWB2eja9K?=
 =?us-ascii?Q?IJxY51X0adY/zP7ZRmPjWpzANiSPZ97c/LCGegTRRzIaD4n+eUmA8tC2gYd4?=
 =?us-ascii?Q?qaKfEmUwZLXpF+aQeqLKbGFFUrMkxtxy7H06rYcJV8lqQZZLAiOvr50tjM5w?=
 =?us-ascii?Q?aQyzbywIMbEEpYN+qhdC7EN71EGtZK77v+4Xzc/jS6FbsGlc24b5LxqFUc1s?=
 =?us-ascii?Q?3f2lV0u+SCM3u66cKGkUJAhZHhRJvKfhmiQoatQrFZYP0OMpJu4pPhBblHLP?=
 =?us-ascii?Q?XBriEkW4dfyjTa5Lo8RIquediEno7YitEYpscwlKSmP3PSj8XX5ErCqkX4ld?=
 =?us-ascii?Q?kvA/QCEu/k2BUkWvskMOk/IyHHnAed8qqglph1uBaqK6WmNZNpjwCqFswix6?=
 =?us-ascii?Q?ILuAW53ch0ge2jAMd3FLq992dMnPUme4NFlDhxGJFmbTQNtKyxvrfLN3/HR9?=
 =?us-ascii?Q?W9E6Lf43qX+5vCrCT4DBPaLfh5Yr7NlKBzyS2KOB2uqaW2igdk+z/jg3i3d7?=
 =?us-ascii?Q?aotFM2boo0A2/KGyp2wqZ+bnRhXI+oIJVFN4TiTTIONhsbHZElwwP8NEykus?=
 =?us-ascii?Q?T+EtidKQGevQ/OM0ZKiRWgl8ZnKwSowjtvGnT4U6EUacFQpPBAq9+8WYeUyN?=
 =?us-ascii?Q?uiHSQeXjySqnMjQxB5Z+KQBta7hRrDHxXXfGbLcL/LqtMEoiFEgBOX61Cd3e?=
 =?us-ascii?Q?jjlkvjq7VGBpbpShoaxs4WBbL93T4OyqwczPKIYywrs=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=anVJXjgyj9fsDki5x0M0VXEpv0RNVVUHCiZ11WPS1h0I8Q8uCk1npsSoccpuvjsXqHyehUE0Tin/qZiMV0etkddpoh+FFozaTLBBRUg+0viE0cgU9z2zRP3umXCe6DczxZcVtuJtHkeOsI5cSBZARBrpwOz8y0vJ+Gfak64+ZAannohwWaZAIGU4/2h4sDAmkzi5nk0fxMiU4bDdDEftGA4OLwM46oaslb/nXyfLb0T10LCUcv2tM5O3kuZiaiYT0JKvJsDnYA4yeBI8DqRBMelvROSp/XTS67OPy8e3qgMRSULDQeF0g8/IUjf6x9cn3EkwKsW+hg77xH1GfQtQvw==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtcQC48RWYnpHLb7n/S6kyEUPxS8TsB0Gt291rqfTkA=;
 b=kj8fDGjjpzcyk8HzEBsyGBGpe4jaeAdpmFhdzAe2hBR4k+o0vxnilvsXGG5KZvtofhe307Qes4bu3itGmFpYK7Y/3Rp6PP+8mp7fHNHCEur3QVaRYYvjr2LuQ6PAIznhY7LWpfPFG6xOt8ygBLvHs+SjsajNWlG0SEGcXF/O/bLaeytF6UrWbWGGzmip+cvUd1wYKg6NZCf9t5XLuw+JI8CNaEJWRYybRurk0CrlWgHAMv2Dt/xJicf3CgJl5WFTk9Luxun/murnwVZaMXloo+tyy3rZ5SsfxlT06jUtIszY01vf1Tv6DuICgPK/yavEs9RI1RmPwHzr7cs68GMRNA==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CtcQC48RWYnpHLb7n/S6kyEUPxS8TsB0Gt291rqfTkA=;
 b=Kv6iNxZHmN0NMurEnfqEEKyc6MexvxI9XJjganGgVHrEstARAGMRIrU8U2tKphE4rcmroZg5XvUsdeF6ZpCci1SxXAHrf0fWYdorTQt+kdBxOn2mb/gUwj3wjTbl27WA8pNhmomzg0Xln2dLkSCjYmRAePGRdWVOUNKLl0XDGA4=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 307d669f-3217-4ddc-5f8a-08d89664410b
x-ms-exchange-crosstenant-originalarrivaltime: 02 Dec 2020 01:47:40.3975 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: bFkEld4mFWG5W2JRKuQQCLXobxhUM0li+c5Efdr6ygK4wSoiH49hdq8JFC3LK9Yp4np0ljrmHaBb3RzYLT8KRg==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB5159
x-originatororg: quicinc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.38; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Brian Cain <bcain@quicinc.com>, "at.org@qualcomm.com" <at.org@qualcomm.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "laurent@vivier.eu" <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Alessandro Di Federico <ale.qemu@rev.ng>
> Sent: Thursday, November 19, 2020 4:54 PM
> To: Taylor Simpson <tsimpson@quicinc.com>
> Cc: qemu-devel@nongnu.org; Brian Cain <bcain@quicinc.com>;
> richard.henderson@linaro.org; at.org@qualcomm.com; laurent@vivier.eu
> Subject: Re: [RFC PATCH v5 20/33] Hexagon (target/hexagon) generator
> phase 2 - generate header files
>
> Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> > +from hex_common import *
>
> I'd suggest to avoid `import *`.

OK

