Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 748CD3FD3DA
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 08:33:36 +0200 (CEST)
Received: from localhost ([::1]:37512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLJoV-0004TL-3r
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 02:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mLJmg-0003bS-Gl; Wed, 01 Sep 2021 02:31:42 -0400
Received: from esa14.fujitsucc.c3s2.iphmx.com ([68.232.156.101]:42959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mLJme-0006hU-3v; Wed, 01 Sep 2021 02:31:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1630477900; x=1662013900;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wy6t3uWApBSLDoYZ4GilCuWIw5JtdwYJGOK0vGwYYDw=;
 b=cAlcLdoVLkB029mg0yrQ6dEANZVulrms7uCT+w9CRxCoKP29/WKmYqVI
 6i494B0dn1iWarZupcr7O1nsf5FCALXd8RiE25zUTGmyG/n2WAOs2LTVk
 1ISeAFk6vdBUZyDn36D4xKxeg2nAcc6+Y0U40Pj31yVfCJGoFU5+2jIDg
 fnmraf8vtfQjA0C+bYXWOCY3GiyAo6Lh50gB8r0cwBS2az3hRNWbHKTi7
 FufPAw3o/J19jkmpKGUv1pK704sAzsNw3P+O0tNwrqXJGHfJRhUJRkeKc
 5ycoNYFjxQUVa8GnfkhUif+w5wkW9csXUT5HXnhSpxLkzibVLAdd3Rdhb g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10093"; a="38080348"
X-IronPort-AV: E=Sophos;i="5.84,368,1620658800"; d="scan'208";a="38080348"
Received: from mail-ty1jpn01lp2058.outbound.protection.outlook.com (HELO
 JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.58])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2021 15:31:36 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FdcShGFtUZKVYYfH7/MKUl5VMNA7zM7lmq1Xds4uMwAWNmPBpm3TRKQD3Xh8MvpVa3dirV32bqE4NSTGWio9UXqnEqpd476+j5tNryEgjy0lUXNCdwa/dAUnwv7kBRlDiNpS2HN59P/HjKgMiVlspRkCdo48d488knhf/ZP63zaf1iFvIKgQ7aVdc9Bhzru5iL79SZpBry+MiH2poAnUGSuIH3vNIMFOD+kv0+fmHRZuh7o6trZuI5annXliejO2F6iQ4bOWNjRSLTrd4pQIH7zNkCyRt0wB/WLjtAkcp3VduG8rzHe0e5ehsFOprf2T2Ai/tPX8TJsfMcsZ2yRQhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubjHdJbUPa63sQsCLKueBKWTtW1KkXJsezczPzq5YJc=;
 b=EvXpTmNMiPPLfT3AOW/fxMqJYoi/13i4s1CNGtKZ/St5JCBA6KgTY76xQO/hhz9430CgQkK0GUvH9PpXuQ5SfnkvFcuQ4z3wt0rJdLsNwLl+WKPlA27vgyQ3qvLZWn37DjRcOhWEh60jZfHeB5lZCrD24qyIFTv6Rrz8EPlbSNbdXRDaPs7Gaj4bEzTxELLy6313WZpr+Dqz+mdV1FUtCkuvWRfn2+WLWrZEV96cKh2HHdTVpj1cWv7/8QRaXq0YpmwaqQU9t82XuuBfd11K4EA+sL4frHp0KM5s26jxb+Q73jc2vsXHd2fehi7EBRR45Y2miLKybMaANCbbV1OjFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ubjHdJbUPa63sQsCLKueBKWTtW1KkXJsezczPzq5YJc=;
 b=TJMPtEcPos1nfm8uLWeldUuPbsX6j1nTRQrPeT4O6veCoUSvdEY/RTSCxUcW1sL7+cdwPjtD7VktBapdClmF8o4eb2+4qJ5g0RHceCBMMGQY+6PDN31l6zVycXJGB1QUVej8uT+pUR3dpj7xGtjYpyQn/msJEiI2uNvlrh8XnBQ=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TYCPR01MB5805.jpnprd01.prod.outlook.com (2603:1096:400:44::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 06:31:33 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::534:e385:3c19:21c0]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::534:e385:3c19:21c0%7]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 06:31:33 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Andrew Jones' <drjones@redhat.com>
Subject: RE: [PATCH v6 1/3] target-arm: Add support for Fujitsu A64FX
Thread-Topic: [PATCH v6 1/3] target-arm: Add support for Fujitsu A64FX
Thread-Index: AQHXnkJZ7tK5GTXMjU+UvgcKnN9w3KuNZv8AgAFRcCA=
Date: Wed, 1 Sep 2021 06:31:33 +0000
Message-ID: <TYCPR01MB61601C2C329E74D5AC5AD09EE9CD9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <20210831082940.2811719-1-ishii.shuuichir@fujitsu.com>
 <20210831082940.2811719-2-ishii.shuuichir@fujitsu.com>
 <20210831102002.baj3yipk7ulvi32i@gator.home>
In-Reply-To: <20210831102002.baj3yipk7ulvi32i@gator.home>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?iso-2022-jp?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZl?=
 =?iso-2022-jp?B?Y2UwNTBfQWN0aW9uSWQ9NWIwMGM5YzMtMmUyOC00NzFiLWJjMWEtYTdk?=
 =?iso-2022-jp?B?NGRmYTkyNzhiO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFi?=
 =?iso-2022-jp?B?NGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9h?=
 =?iso-2022-jp?B?NzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxl?=
 =?iso-2022-jp?B?ZD10cnVlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQt?=
 =?iso-2022-jp?B?M2IwZjRmZWNlMDUwX01ldGhvZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9OYW1lPUZV?=
 =?iso-2022-jp?B?SklUU1UtUkVTVFJJQ1RFRBskQiJMJT8lUhsoQjtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRl?=
 =?iso-2022-jp?B?PTIwMjEtMDktMDFUMDY6Mjc6NDVaO01TSVBfTGFiZWxfYTcyOTVjYzEt?=
 =?iso-2022-jp?B?ZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?iso-2022-jp?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7?=
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b4a8eed5-6c68-471f-7d60-08d96d122442
x-ms-traffictypediagnostic: TYCPR01MB5805:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TYCPR01MB5805B31158C97CECFEC2A93BE9CD9@TYCPR01MB5805.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rMYfVIeCEn2Tq8X+3MWA92Da1vPzJNPNuCQGX7iMYms9iGFfwIuk6Yy/lQy0eoeHpbbbdu87QlEvw8MQ+TBZWHfN14PmSkYVLHruri70pxl2O3KJ6c5t1tpSSSvK5MY2hkdXkXNcU/on/NWCHdr3Re+Q4OkdkFpAz5fjR1C/53s4NDCX8R+06LaVfnzg3dP3gRtofEzNl29Kbx7k/MaCqoIQmoUu/ynIrFbVyHYm34YEHAHBoAy38mgqHUxKgKWgSYro5n2AXXtOE5dagsTMGxwug7wAY2SrGSF/ESZaa7NZG6tK4dQ39Z7mdnIzZFYEyoaJFapWVVXm37LU/aX7T62ght1zr5I1TWK7KdlsGsAPyE5tAwNmx5JJ0N2hJD3sPmkZHYWrquCaZNPjOEeMjJqegpBR+s9ltn7LQBEc5Ok6rMF4ugP09jtqO7E3Rmlh6n2iRn9CXF4eTcWTPY303olq9d63nmTStzjac8YsTi6bIkikvynVqo1IOjDRmz/0v+XhLAzio/byAgtlp+h5hbc+D2J9OsuCv+qoDy8t9BRD+Ii0SG3dwC+xPj4T5OchYsjqSXTkuNPueoIqVCc45BEOLbW2Q+N2i8OITDj6znejirQfR70ZzmX5D8+u/V/NzIhGX/kex7WbTdI/a2Negxy0deChkt2/ZPrvU03kZ+xxaxPz/R+NvHuu4eiIY+O4qSbF2Ps7Geq52r3nJ68AUA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(508600001)(7696005)(83380400001)(6916009)(38070700005)(8676002)(122000001)(66946007)(107886003)(52536014)(55016002)(9686003)(76116006)(316002)(86362001)(66476007)(85182001)(53546011)(66556008)(38100700002)(8936002)(26005)(186003)(4326008)(71200400001)(54906003)(6506007)(66446008)(5660300002)(33656002)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?S0NvWHlKb0I2a0VPSWZkTGo2QVM0ZnFJbzdMeWt4SWNaZlhobk42VEgw?=
 =?iso-2022-jp?B?cml6T2JOaEZVdFp4dGdPZGp2QlBvcFBvc3k3MkVHYlJqc0dJOC9yZm9z?=
 =?iso-2022-jp?B?TGQ4cEQzdXduUC9vUmtwLzdQdmNDeTYyd0NIbU1BVjFNTFNMdlV3bTd5?=
 =?iso-2022-jp?B?N2tkUHM3dEw3M1NzaG9RQ2E3TjJkK0dYaGVzY3hSZW1Dc0lyaUZSaDhi?=
 =?iso-2022-jp?B?YkprM3U3d1VNT2hSNXlwc0RWMXBjblNnelhaUE44b3ZWUHlHVGRUeHNn?=
 =?iso-2022-jp?B?bmtyUFloRThscFdyTDVnTTBuaEltTWlEbzlMV295WmsvbmdJSkFQbUVi?=
 =?iso-2022-jp?B?dlkwbHd3eDJERFVOSWtHcHE2TUMvTElieHJOWHJuRk1ETUM3TlNxbEtz?=
 =?iso-2022-jp?B?bUlzZVpnYWpiTGtBY05EQm9FTVNGalF5dTZFTHA4YURpR3ZHVm10LzZY?=
 =?iso-2022-jp?B?Q2NkSzlmTUhSdXBTcWdNRGpUKzQ2N24veGdSdzlibTBoUkZFS0JITHUr?=
 =?iso-2022-jp?B?amhyTWZZQ2J2ckEzWE9hcFdiOGNDUmtwbEZUTmMvTHFxL05wQ3RtOGps?=
 =?iso-2022-jp?B?TnpyaGpoOHBHVksvdVZsWUp4bUJqdG5IRUJuYkRpQ1JUcU9ySjNrSk94?=
 =?iso-2022-jp?B?MmFZMjUvWGp6OVJuSVRXa2pza1N0N3crMFNLTC8zTkVseVgwMUtNVFQ2?=
 =?iso-2022-jp?B?MnJkZ2pqNFVVTU9rdHJ2ZHlMbzYya3VONGZiNGY4RTJOMWRweFJlUUxv?=
 =?iso-2022-jp?B?dmpLV1BacndOZjUycFNGQ0ZJNFp2cHNFMTBxYXF4YVRaMGRxazF1U1A3?=
 =?iso-2022-jp?B?b2w1YncyTVZGQUFuTUhMLzZNaHZRd3JFUWpSZTcwZFFCRHlCREdJMGRR?=
 =?iso-2022-jp?B?aHZsY0g3RFg5L2Qvbm5zSzUza2s2bitXWWdBaWtsOStFdHMvaCtzQ3Q2?=
 =?iso-2022-jp?B?ODlRZjF6d2ZyZjMzSFBBZG10Yyt0TDlydTN5RUZmUFROSXhXSFFCK1ZE?=
 =?iso-2022-jp?B?ZlNRMUxxOEN0OXhCMG9UU3RkNFMyaGlNMU81elVIYWRWTDdkL3ZSQTQ1?=
 =?iso-2022-jp?B?ampQNVk5d0lCSFZHSE1mMENQMFRxVGpLWU92NVA1MUc0amlCb3pkSDJn?=
 =?iso-2022-jp?B?S3VLckRWaUJHL0ZXQVhRNlJaa2dVTThubnk5Nno1RXI3UXpuK0F3VlE1?=
 =?iso-2022-jp?B?cDByUmtJQ2xnL0VlU2hjaXJYK2J5MTRZbWViTzZOSWtZZVlsZHhoaTdr?=
 =?iso-2022-jp?B?b2FMNXBjL3ZydUxybityQjhydjhCVWZPblIrLytpTHFNbG84NFJJS09Z?=
 =?iso-2022-jp?B?Nk5uc3hQMURLRTIxeWdDYmZZMEZSUHJQdmgwTU84VlU2RnVCeUwvbTRx?=
 =?iso-2022-jp?B?aDF3T0sweTB1cnk0c29qaHl5d0VzZXQ1SVB6eGx1MmVIcFhMZ3U4aUdq?=
 =?iso-2022-jp?B?WWdlM2tDa3Bya1MyRkpUVVJGZzhWMEV4WGp6SUxhQkRlVEdsMG93My9M?=
 =?iso-2022-jp?B?MVJxUXFHN3RSV2czdHBGWGtkQTNkVElQU21jbWJnWno1c1pvSSt4RTR2?=
 =?iso-2022-jp?B?eksrK2hCY0hweHVaUDBhOW5Ka0Q2Z1ZkcUUrbnRsY0tvQVV1MGtTdjhw?=
 =?iso-2022-jp?B?OTZPMnVaajJXQ21QWVZHVFhDTTcwdkZrS1JjYUNXTmlZcFFCYkNld25H?=
 =?iso-2022-jp?B?V0dnUEg5L1o0UjMvT2hOSHl0alNYaGJIb2haS1J6NmNwTkdXQlFxQ0NS?=
 =?iso-2022-jp?B?elBxb0pkYmRRTEtrb2tCa3lTTU9UZ3VFS25nL2N3Y1FobG1JTm9vakNM?=
 =?iso-2022-jp?B?SWhBaVRENGt4Z3EyR01jRUpBUTE5QmVldFBTaUlJYUxEc3ZvS2tXZ0U5?=
 =?iso-2022-jp?B?d2J6czN1ckp3eTdGNEhoT2prWDM2Q1lDdnN1MVVxc0VRTWhPQmpiQTRX?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4a8eed5-6c68-471f-7d60-08d96d122442
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 06:31:33.4095 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JSqcG22rcpDw4KbHOBBNg2f9/5IIQNwEzotfc7s64aPariF6ookIvIj2T/yRbFL7NiWqgpUVJD16JqLPHKL8NiwTbZVpbyhgkT9X9yX6jtE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5805
Received-SPF: pass client-ip=68.232.156.101;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa14.fujitsucc.c3s2.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> I already gave my r-b on the last posting, but here it is again
>=20
> Reviewed-by: Andrew Jones <drjones@redhat.com>

Sorry, We overlooked that.
Thank you:)

Best regards,

> -----Original Message-----
> From: Andrew Jones <drjones@redhat.com>
> Sent: Tuesday, August 31, 2021 7:20 PM
> To: Ishii, Shuuichirou/=1B$B@P0f=1B(B =1B$B<~0lO:=1B(B <ishii.shuuichir@f=
ujitsu.com>
> Cc: peter.maydell@linaro.org; qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Subject: Re: [PATCH v6 1/3] target-arm: Add support for Fujitsu A64FX
>=20
> On Tue, Aug 31, 2021 at 05:29:38PM +0900, Shuuichirou Ishii wrote:
> > Add a definition for the Fujitsu A64FX processor.
> >
> > The A64FX processor does not implement the AArch32 Execution state, so
> > there are no associated AArch32 Identification registers.
> >
> > For SVE, the A64FX processor supports only 128,256 and 512bit vector le=
ngths.
> >
> > The Identification registers value are defined based on the FX700, and
> > have been tested and confirmed.
> >
> > Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> > ---
> >  target/arm/cpu64.c | 48
> > ++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >
>=20
> I already gave my r-b on the last posting, but here it is again
>=20
> Reviewed-by: Andrew Jones <drjones@redhat.com>


