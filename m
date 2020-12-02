Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 978852CB296
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Dec 2020 03:02:01 +0100 (CET)
Received: from localhost ([::1]:41528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkHSu-0000hE-B2
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 21:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1kkHLR-0005Kd-63
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 20:54:13 -0500
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:16811)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1kkHLN-0008UT-OL
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 20:54:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1606874049; x=1638410049;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RGVKUE1w5B9UI67ZiZeLg/tnIyuKiPxKHG62/+HFXhg=;
 b=J3e3EQM9iZ69IvBtQQSFNHcxaTHdVX8xrz9smdTiAwRyc+Ko8ieCdG5j
 PsFq91ZMeXpRneHJEIBvR6DIo6YMr0+CwP0U+M6sc5whRB/moI0hGZTUW
 xMgIkUkr9p2uhS5FTudAkrHAdEicdK/hiNVsWWaz6Zkf9Zeix8WEoCw2V k=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 01 Dec 2020 17:54:07 -0800
X-QCInternal: smtphost
Received: from nasanexm03a.na.qualcomm.com ([10.85.0.103])
 by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 01 Dec 2020 17:54:03 -0800
Received: from nasanexm03f.na.qualcomm.com (10.85.0.47) by
 nasanexm03a.na.qualcomm.com (10.85.0.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Dec 2020 17:54:02 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03f.na.qualcomm.com (10.85.0.47) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Tue, 1 Dec 2020 17:54:02 -0800
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB5159.namprd02.prod.outlook.com (2603:10b6:a03:6e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.31; Wed, 2 Dec
 2020 01:54:01 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::eca5:4fbf:3096:fea6]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::eca5:4fbf:3096:fea6%6]) with mapi id 15.20.3611.031; Wed, 2 Dec 2020
 01:54:01 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>
Subject: RE: [RFC PATCH v5 18/33] Hexagon (target/hexagon/imported) arch import
Thread-Topic: [RFC PATCH v5 18/33] Hexagon (target/hexagon/imported) arch
 import
Thread-Index: AQHWrlDj+FpvqrWMokyUN8Lo5iBnL6nQMQSAgBMMm8A=
Date: Wed, 2 Dec 2020 01:54:01 +0000
Message-ID: <BYAPR02MB48864629B3FC851BF8B3A652DEF30@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <1604016519-28065-1-git-send-email-tsimpson@quicinc.com>
 <1604016519-28065-19-git-send-email-tsimpson@quicinc.com>
 <20201119235341.0614922c@orange>
In-Reply-To: <20201119235341.0614922c@orange>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36b1f859-017d-4457-ee94-08d896652427
x-ms-traffictypediagnostic: BYAPR02MB5159:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB5159410694D6DA2E29C1A604DEF30@BYAPR02MB5159.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WXTD9EXMswrONgRCnq3//adBMFh9L/uw5VJbZvjmZ4izvayUIEtajKTUQlp5fa7CyR5VGNUF7/j6wfvF78/+/O8xqBR10y6LIE0prb/fxVs1i+sR/NZ+E4jRZsYyEaxZxzSW+quS9W4I7mVs1DWKqWfTlKhFyBTp8STpPw/eRCU90H6RnEoBfZ8XUHLH9qyp1+2MUOkWW6m2zzb0hIeXNMZLbawTH7rCiBpD85TCfBM5zF3flrCbB5fG7Ytuntq49IpUdf0jZEHUJIvXVGd2e+8IICnH6Ds8og35niY7/JzGWGdJiFKtstcazyZbDt5vRnts1NuSjTG5yAOy+BM3aQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39850400004)(346002)(366004)(136003)(316002)(86362001)(107886003)(52536014)(6916009)(8676002)(8936002)(5660300002)(4326008)(2906002)(76116006)(186003)(33656002)(83380400001)(7696005)(6506007)(54906003)(9686003)(26005)(478600001)(71200400001)(66446008)(55016002)(66556008)(53546011)(66946007)(66476007)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?5JlpUeRcKi1rB6B0tjIpwzkHrnaCqo16+IOImpi9IUPm7b8bIJEBJ5kKC76x?=
 =?us-ascii?Q?YPXwZwtn0ZxNYtNULIwTuOzbGFL/mVoTEepAKquc16BeA12P5rZildIuy5sL?=
 =?us-ascii?Q?uKbp80cRaTelnNLoRZ0KDV3Dt1C/F++KYqqKDvl9tSvVag9tq90lntnHqsaB?=
 =?us-ascii?Q?8xupPm2YMtp9yTBPPRFTf/AHL3volpilrClQVdA2nDB83HVBKaSN/iF66got?=
 =?us-ascii?Q?HwBiR/igoxJambAu2xRznI6rkCa/5tHFBLVSxbFjSHOc3+YE0jNJS9asAbun?=
 =?us-ascii?Q?1dlbvdr+nLMac4IBqk87vk1Llr/wL3mv0ybkUPzUBINpMYObimePXI1TZmF2?=
 =?us-ascii?Q?jwFrWsA9lIY7k+GKJmMiyq/Lyu/Ldw46JB4MPoTi+tglBHSqSEDkCxQK3/wP?=
 =?us-ascii?Q?LxttycbTUpcgHa4zb6VCegtGKNlcQfXluIip12fX/IjyA3tvjFZusjIKJn9d?=
 =?us-ascii?Q?ykmYIZRTxqpfvWCGJDXxuWpK7CJSxZy4Qfhve7pypw90JaAdBW7aXWMYVOp+?=
 =?us-ascii?Q?bBtQHu28CY/bshd0K+xMvhC2CRf90a0akmfRHQQOGeM0I3rnclDZKEKev56W?=
 =?us-ascii?Q?Mfn0iWCGfW2eUhF6axxz4PwyZ8FbkmOpxFuhLhz6if76nCQN/cmwkJ5tNy8t?=
 =?us-ascii?Q?zrsBwI+FNAgfWonblt0e3i6aZL+FHNUK3ivMvpWf8ZWbdmhLgp1EvxEl8mIa?=
 =?us-ascii?Q?Rrp1lkGBR4dGPXMkVqIF96hTDNeKhHd/y1xHxH2RvwaBVWeaKf3aT2giFgJD?=
 =?us-ascii?Q?9gpWYBuBmB9dfn2eZwUoH28YumAC4I+lrgaOOi5EuybhTkdKisNl23BzlfWc?=
 =?us-ascii?Q?Q95gKM4lYPjlZlS7fKtv6nCLsYEcXUCcxF81lwM7teoXppdNidtdK+QtmBgo?=
 =?us-ascii?Q?M5XW9sL7Ku6AdmDNElAYPkR3yWSrbUZtdW8v3KI4Hp7jduN0fxfcgYK3TAdU?=
 =?us-ascii?Q?fjUFQ3euCC5fcLGpP6Uz2HcaKoeGwZzL1tQ6rD023sY=3D?=
arc-seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtaWbsgTkgzxVmuga8LnHbohqZWg7cbaB5sVwLFplLEcar+wT3MdW83QLyeYbTMqdH+oinSnpw3fj5k/0Y5+ou7t7ZJsuzfgFfR/cRBAEjh2QbQr7UUTRZjfqpWF1dGCs7SxwnvfV7c0l/hJiLTBs/+5IinpwLCsiEdPRLw2EXU7yaVMNXjPpRUtf/+VsT9xVXOGirAS2QURmNRolyvbsSLLhVaaKTfme7QKhcOTf95XYIeN+nAvW0rpuGb7cPDF0s6MbWOKvZeuaNqOEIEuVIxUQlwsP8qdjgydpSaZaUlcKCyQyR1CRXvAq6qza+dvbP730Dl5k/q1h+OfgAeZCg==
arc-message-signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9IuqD5/0HyEP2d2csoLbW/FEOLBbhYgllJGwcw6BCE=;
 b=EJEmB5co0hZbg48shENGKZPUnY4knqZX0SLfGId+jqKgQ/hgSqupjI2Po1hgvPD/pa/JWY1UsMGDCUmLjwddRqwxx25uCC0QCA0V6HogTXagljRY6nVDVKPSdi8ho11RG1WRSPCGQLjgWfD5X61LIrG1wpzKVOLi3MNaFIZVEhZmRG0Ld21KaXsMr+2NnLDHtQUoW/1Gp9kZVIYa8aVeMu08t8Lk51rgxrB3cWM9G/mJhDSvOYkE/jw5i9W8K/R183aA7lfkTjEsEkQwXunq/R10Uvjh3kz3lV5ahk3IxvT+N0aAY4i9pg2bUbJXxHuHDD6jzVfdbeJZTW7vXMrpCw==
arc-authentication-results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
dkim-signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9IuqD5/0HyEP2d2csoLbW/FEOLBbhYgllJGwcw6BCE=;
 b=VyditUKYPZXH876Al7gbPb1pgjomf/MpTv5TyHcCyEPRvK2zCL47VVV7pJkOoeUnzqUdWaPBZ++CZLgjuWoKa5FP57fdJOXRRkFRG6kZOGCDGHp2+Hb7ruYPLj5uQHDwajqnE2v/QTVsqMPYwbxhvVp47AqtpwD9GW4tcoDkgSE=
x-ms-exchange-crosstenant-authas: Internal
x-ms-exchange-crosstenant-authsource: BYAPR02MB4886.namprd02.prod.outlook.com
x-ms-exchange-crosstenant-network-message-id: 36b1f859-017d-4457-ee94-08d896652427
x-ms-exchange-crosstenant-originalarrivaltime: 02 Dec 2020 01:54:01.3566 (UTC)
x-ms-exchange-crosstenant-fromentityheader: Hosted
x-ms-exchange-crosstenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
x-ms-exchange-crosstenant-mailboxtype: HOSTED
x-ms-exchange-crosstenant-userprincipalname: 8RlEd/nwk+j1PHLjJlrTSlzxU0DA3iWq2lTH6P87CPwzX1cEbLNrHltPG2KtvqM81mx9tJ/i8dP6Cio2HXPnDw==
x-ms-exchange-transport-crosstenantheadersstamped: BYAPR02MB5159
x-originatororg: quicinc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Received-SPF: pass client-ip=199.106.114.39; envelope-from=tsimpson@quicinc.com;
 helo=alexa-out-sd-02.qualcomm.com
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
> Cc: qemu-devel@nongnu.org; richard.henderson@linaro.org;
> at.org@qualcomm.com; laurent@vivier.eu; Brian Cain <bcain@quicinc.com>
> Subject: Re: [RFC PATCH v5 18/33] Hexagon (target/hexagon/imported) arch
> import
>
> On Thu, 29 Oct 2020 19:08:24 -0500
> Taylor Simpson <tsimpson@quicinc.com> wrote:
>
> > +Q6INSN(C2_any8,"Pd4=3Dany8(Ps4)",ATTRIBS(A_CRSLOT23),
> > +"Logical ANY of low 8 predicate bits",
> > +{ PsV ? (PdV=3D0xff) : (PdV=3D0x00); })
>
> I understand these files are supposed to stay unchanged, but handling
> assignments as expressions as opposed to statements would complicate
> our parser in a non-negligible way.
>
> Would it be possible to turn this (and other similar situations) into:
>
>     { PdV =3D PsV ? (0xff) : (0x00); }


Even though this one is obvious, I'm not ready to open the door to changes =
to the imported files.  We need to have a conversation with the owners on a=
 long term strategy for keeping these files in sync.

I'll make the other two changes you suggested and resubmit the patch series=
.  Since we've been through several reviews, I'll remove the "RFC" this tim=
e.


Thanks,
Taylor


