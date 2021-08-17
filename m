Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEC13EE6D3
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 08:45:37 +0200 (CEST)
Received: from localhost ([::1]:41542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFsqu-0002P6-Dp
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 02:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mFspW-0001Qs-Kt; Tue, 17 Aug 2021 02:44:10 -0400
Received: from esa13.fujitsucc.c3s2.iphmx.com ([68.232.156.96]:49640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mFspS-0007Vz-W7; Tue, 17 Aug 2021 02:44:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1629182647; x=1660718647;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CkrgmidYqlozBF0lbVe2n4eFWml4+W9I3Z83niseUj4=;
 b=YthDPALSj8O7GDMGFYNUT9Tbi2iBpEY2tpsWPkfU+6+WbeBAJUj7Ut2z
 HlHW4WPMQ5BBGwWSmqdXqAKa1krq98l7FPbDshlueC3AcUlI5xl1vaTBp
 FlJQEY1JMHRu02puIMcyv7ONOlMS9q4vGShGNOSyz0cvQxx3yHa9Orqf+
 g8iODjd5l+WLQR+Uw4aXMXWaNdNIwkuEXpoQWN7a8Zev0pletKBWF/nlL
 fs9CwMO75yO65u8DoBhNqEyqlpX3XMTAtyU4raNaFEfo8BOyEzd+r5BgD
 1VP6wbLNhmGp/mhzi8z9yKVfcWEOSg7OpqnoQ+U396PdRCugavojzby2M w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10078"; a="36633756"
X-IronPort-AV: E=Sophos;i="5.84,328,1620658800"; d="scan'208";a="36633756"
Received: from mail-sg2apc01lp2053.outbound.protection.outlook.com (HELO
 APC01-SG2-obe.outbound.protection.outlook.com) ([104.47.125.53])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 15:44:01 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+IWryaE14pjeoM5bhyU4iQ4kw7Of4lOtSKQdPex47PjngAOB5cOFt/sUDiFni28NWi0bkqLhculkG/r1KBijeTuT080b9ShMbzxJvZZ+juFj65plxuS3QXbJ2KuNDWWub72wLgxwVQAhIDSwl++TS41yoadrOsfRF/BAOIrh56hSpmFS6MmaWAQssq+fqehiD6DjUeGHYfVcTpa+AEbPmFMgPN4PfKJbp1V1HsirCosNLUTf7xrTpRNUvDuR0+zb9YUfQpCuCJAKJb3e4V1rRXDU1C3/aSYYMXolX2qmQAmhbpXNlorT8m271zJYsPfLgeUDsfA7v5Mt+xcJ8eRjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNp6Egq2Dk+xxjK0n3Dh7xKXRr8/TSkZb+KoPmmBc3w=;
 b=giauTC46+Ukw7QQO734TMuCmONSP+QnJKAWgJ7zUh273SY3BNu9lwdxv/Qj5rGRM0Eja9Up5NGpJuKqDhmn0tqcuk0iy6JFll0I92gsP123luQVJ1vxyifUDfIeBi2M3SchETZacxgxUaySciVX6bftQq8Np2dY+wUObCali9GPY4ZP5pA9a/rRLJJgDNIAPDnwrEfKGbitWx1Qv6A8ZpkoWmGDQCCUICNkLMMSnfaT1XKo+f/2NDNp/w7x40mdLzz5mxK5ijRFbA69rolAPowpLT3TT3p2haid4Nb7F1vT6/9QIu/eKhx1pq7Yy8CAvl76rRtT5FPmnLBJp0DTrBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YNp6Egq2Dk+xxjK0n3Dh7xKXRr8/TSkZb+KoPmmBc3w=;
 b=LtVu4qw6RtZbi2SzQFRog3z13iGAqNVXX94Gv4yeTnUwquBOId5QVIDIH6+Mxb3/aI/dhwZ8AQy3BRsxhbJYlZGojWLm28MV80Y1AX+HjdV3TyL0De+gUcFVSoINavlc08tV/NwhCytLItas+6vLloVHM89PRO5JejHzIxm44jw=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TY2PR01MB3467.jpnprd01.prod.outlook.com (2603:1096:404:db::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Tue, 17 Aug
 2021 06:43:58 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::8a4:de4b:a07a:789c]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::8a4:de4b:a07a:789c%7]) with mapi id 15.20.4415.024; Tue, 17 Aug 2021
 06:43:58 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Andrew Jones' <drjones@redhat.com>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>
Subject: RE: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
Thread-Topic: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
Thread-Index: AQHXj0JXKFl553Ufz0WuhVfBX6IF0atvlwsAgAACXYCABzQ/oA==
Date: Tue, 17 Aug 2021 06:43:58 +0000
Message-ID: <TYCPR01MB6160B0A6E08CAE7CB2C6D8F0E9FE9@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <20210812060440.1330348-1-ishii.shuuichir@fujitsu.com>
 <20210812060440.1330348-2-ishii.shuuichir@fujitsu.com>
 <20210812091650.i5np3szvdoelu2cx@gator.home>
 <20210812092517.mwcfhksoe4cgy3cl@gator.home>
In-Reply-To: <20210812092517.mwcfhksoe4cgy3cl@gator.home>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?iso-2022-jp?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZl?=
 =?iso-2022-jp?B?Y2UwNTBfQWN0aW9uSWQ9MjQxZDg4ZmMtYzIwYS00ZmQzLWEzMDctYTBm?=
 =?iso-2022-jp?B?YjU0YzFkNzdmO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFi?=
 =?iso-2022-jp?B?NGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9h?=
 =?iso-2022-jp?B?NzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxl?=
 =?iso-2022-jp?B?ZD10cnVlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQt?=
 =?iso-2022-jp?B?M2IwZjRmZWNlMDUwX01ldGhvZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9OYW1lPUZV?=
 =?iso-2022-jp?B?SklUU1UtUkVTVFJJQ1RFRBskQiJMJT8lUhsoQjtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRl?=
 =?iso-2022-jp?B?PTIwMjEtMDgtMTZUMjM6MjY6MDZaO01TSVBfTGFiZWxfYTcyOTVjYzEt?=
 =?iso-2022-jp?B?ZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?iso-2022-jp?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7?=
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0e2bdc65-a75d-4b82-14ca-08d9614a645a
x-ms-traffictypediagnostic: TY2PR01MB3467:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB34673BCF2453C9300D8736EBE9FE9@TY2PR01MB3467.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wqGBXo0JBlORPBDy7/UZtsQpQuEYGZqGl7TClYCkvb7BzAn8lNZVL8U5N2MUIPJWazEC4Yxz2iLogC1BF5jYJHswkIJJR/8mPxmTOLvNL5qGg2yUaIQmBnQJJ5xvAcohmDIvGNAZraPCbLyMvNHe5cadXpRmBQcQVyOpru99hvOpkOr0b6aYIpaYcDFPOvAyPpVML3vybm2wM9zeSI3J9Y/ny5bfRfbzL3R+v6qPrkB1zHdqr9hXlQzfo01jaQh58f9OX4/nGayJv12IkPDUUlkUAohmHpFUKcfCkY4ms3f2xFyb67JpVaeAI6jxForIIHNq7qdWfj43WBzzkgrnZdFBLF15hSxj/i9AvVOGNomVqFiUEKpG9o/v+jqcj1QM4QMK6ArQZGkeIaaS6Jm10UMljygfDQm90wO4yRRgrGptLOrVM+zyo8FYBPyoSr0pG30vTdo6dLTtdIbGVt+yVFZc8zG6HB2sOzPNZMLspi0SVTbtMicwASfw3audqrTNMmx98mEE8/SYxx0s2oLCCQFY/c7MJcffzO0T1BFpwgX+Js38/MsTQs8H/mTky+sX0opFd0A0f9iifzx+fkvlGv7v2pcglnRhrPe3s0z+9k4WZUo9qCxL+O/uPLu1ZLpL62dPhIK72sXdU2bHFnePuvPqHP9sNgv/26nFl9KpBtL0vXcrDw/VPZvPsQ/kGtao8DqF+Myf/8hBrQO5MUm37A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(346002)(136003)(38070700005)(107886003)(4326008)(9686003)(7696005)(66476007)(66556008)(66946007)(71200400001)(66446008)(64756008)(8676002)(55016002)(76116006)(122000001)(52536014)(33656002)(26005)(478600001)(5660300002)(54906003)(186003)(8936002)(85182001)(110136005)(2906002)(316002)(6506007)(38100700002)(53546011)(83380400001)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?d2ZzR0g3bGNFSzMrQUEwVzZJSFRpbG1UV3B0NmxkcnNWcmp5Z0FOTC9B?=
 =?iso-2022-jp?B?N2FhZkJhYnRueHpmb2JydVVzVnNJZEhpTTVZRG9TQmRwWHNDM09HWjNO?=
 =?iso-2022-jp?B?MlpDUG9YcE5jUVdRR1l1aXJEb1VrNXpNSExuWnBTOVdXanpIM1FWTXRx?=
 =?iso-2022-jp?B?bTl4aVZ3MmNRZGFzSGlOVmlVM1Y2OGxvTUNQSU11ZFdpcDBtMVpUKytT?=
 =?iso-2022-jp?B?SVM3amFIUW95emxoV2pCbjI2VWxrTkpQRHc1ZFBITHl4MFovSnJ5dGRW?=
 =?iso-2022-jp?B?eTRXbkVGMzVXL0t0SlpTeTVjcm9tSXYvSzJaZlJJOHYxaXVicjVLRHF5?=
 =?iso-2022-jp?B?KzhvUXdoSzNwZjFnODdhWDNXZU5WWUkxNlJRNkxLT2drUUxwQU5ZcGZx?=
 =?iso-2022-jp?B?NG1zckdLL0M3YmxJdWtMNkNxSWtTWmhTVmVld0luSWdwRjRmbmJQeG9O?=
 =?iso-2022-jp?B?N0V6emN1ZTVMTFpMOENJTVVQNE5DSUU2emlIcnM5QldNbjA4MnVBaG92?=
 =?iso-2022-jp?B?UVhDVjFIOWtDQTBHZWZCOXJGcXpoZlRpN1Q0eDNSSkdESEdoWFhta1pL?=
 =?iso-2022-jp?B?TXZPNG5iSXRBQVYxajExUWtHUlk1UjhJbWNnYUIxcWVZbVI4ZmhyZkg1?=
 =?iso-2022-jp?B?L3pubkJjVWNMbFVsUXJNQ3dRSnpQd1dqU3EwYndPZUFBbEt6VU9mWDFX?=
 =?iso-2022-jp?B?VFVLbWZ1U1NpQ2wxWExsRThZcFZ6b29TZExTL0dwMnBxT1pZWnB5SWFX?=
 =?iso-2022-jp?B?YXlLM1paNkZIZ0xTRkx1MmdBM3lwNEZwY3haZmhuODVjcGJLbzUwYXBD?=
 =?iso-2022-jp?B?ejVzbWhyYndrNlA5L3k2b1RpcWJlTnE2TjJYKytzMnIwOGtBaStDMUY2?=
 =?iso-2022-jp?B?ei9nQ3o2b0poTlhmbTlIUjhDNk1RZkhoeitBTXIvUk9lY2VIbVZNTWNn?=
 =?iso-2022-jp?B?YmxoNWxYeWRwdG5mTFRJNWVLTGpGZ3N3VGgzaERCMysvZ2RqMDB5ZlhG?=
 =?iso-2022-jp?B?NVFLYjE4dUF4OG1YVHl6THh3dDZGNnV5MWpmZlA2YUo5WlBSZzJyLzYx?=
 =?iso-2022-jp?B?Mmx6MStyV0QzNEZxVStFTzMvZjVhVENEWjFNZU1vT1ZWZURxMDZLaDFE?=
 =?iso-2022-jp?B?K2R0enl3Vkk2Q3RvRmZwYnp6N0VTRlBvRlJ6VSt6WU1hUUtLUjBoejF0?=
 =?iso-2022-jp?B?SEpTVXQva2dIdkMxMVBVNFFGYXB5VjlXdXBwWXF4TkdqK0RxRzlOdEpk?=
 =?iso-2022-jp?B?QUpEQUhMRFpXSEw1UzNoVklMNnRHM1FwdWNBQlhnVE9XYjlCZzVVdEhB?=
 =?iso-2022-jp?B?YlY5ZVRsd2plZGYwZDNYcy9SV09mSGJLNkUwd1NRQVRVTUtzaE9TMWdF?=
 =?iso-2022-jp?B?cVkrZUpCcitrQ1NEK01yNVI5VHlzYjRycCtiQzZRSjJ5d2kwcy9mQi82?=
 =?iso-2022-jp?B?VzZvZEs2RGdYQkdrRG5nM2VnbGMrc3Rjc1BpalkrZDVrck5FUGFrQ2pC?=
 =?iso-2022-jp?B?S2sxS1RPdm9CcDZuN09HWjZxaHdVZGdNT2hURTJTK0p6TGVZaHd2aGQr?=
 =?iso-2022-jp?B?U1oxTDloTGpsTUlJUWc1Y2xHdVpRWUhOc2lzYmlGVjZzdnIvSStqc3h5?=
 =?iso-2022-jp?B?SlBWSGZCN0o0cnZjMXVnUG9mU29xb0MzYTJxQXFTbzVlZTA3ZUZxSTh0?=
 =?iso-2022-jp?B?YkZGeXlLZWdrK0ZCZHRzc1hqQjZjOW9jZmxxeW9NSTJvMlBQbllSNnlX?=
 =?iso-2022-jp?B?T21iTW1hRG5Gekp5dUtiMzl4NmttQlowTWM3L2ZYcXo4dEcrcDlNRmtK?=
 =?iso-2022-jp?B?T2lJUGpMNjBqRHVLbEI2OXV4N3IxWmZZaGZzaVpiWFdUQVBrQUJQdnNP?=
 =?iso-2022-jp?B?NXp1RGpqNmxUem1qUlErYWdHelRGWFFCQUdWWDNPbmhIcFVtTzYrZEJX?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e2bdc65-a75d-4b82-14ca-08d9614a645a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2021 06:43:58.7580 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mc91I0OPhpTZKvUiMP2uPDkArwk+ILsIN6MNkgIkfJHLYWjbjADOfFs2BiEL6diYN1jnTDoqJVPXr5idmk5S753WedlkJAeRdMBR6Gk0zEw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3467
Received-SPF: pass client-ip=68.232.156.96;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa13.fujitsucc.c3s2.iphmx.com
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> On Thu, 12 Aug 2021 at 10:25, Andrew Jones <drjones@redhat.com> wrote:
> > On second thought, do we want the QMP CPU model expansion query to
> > show that this CPU type has sve,sve128,sve256,sve512? If so, then our
> > SVE work isn't complete, because we need those properties, set true by
> > default, but forbidden from changing.
>=20
> Do we have precedent elsewhere (arm, x86, wherever) for "this CPU object
> exposes these properties as constant unwriteable" ?

We have not yet conducted a confirmation of Peter's question, but...

> On second thought, do we want the QMP CPU model expansion query to show t=
hat
> this CPU type has sve,sve128,sve256,sve512? If so, then our SVE work isn'=
t
> complete, because we need those properties, set true by default, but forb=
idden
> from changing.

Based on Andrew's comment,=20
We have created a patch based on v4 that works as intended in QMP.

----------
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 162e46afc3..2d9f779cb6 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1345,29 +1345,12 @@ static void arm_cpu_finalizefn(Object *obj)
 #endif
 }

-static void a64fx_cpu_set_sve(ARMCPU *cpu)
-{
-    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
-    bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ);
-    bitmap_zero(cpu->sve_vq_init, ARM_MAX_VQ);
-    set_bit(0, cpu->sve_vq_map); /* 128bit */
-    set_bit(0, cpu->sve_vq_init);
-    set_bit(1, cpu->sve_vq_map); /* 256bit */
-    set_bit(1, cpu->sve_vq_init);
-    set_bit(3, cpu->sve_vq_map); /* 512bit */
-    set_bit(3, cpu->sve_vq_init);
-
-    cpu->sve_max_vq =3D find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) + 1;
-}
-
 void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)
 {
     Error *local_err =3D NULL;

     if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
-        if (arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
-            a64fx_cpu_set_sve(cpu);
-        } else {
+        if (!arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
             arm_cpu_sve_finalize(cpu, &local_err);
             if (local_err !=3D NULL) {
                 error_propagate(errp, local_err);
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 5e7e885f9d..1ec2a7c6da 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -847,6 +847,23 @@ static void aarch64_max_initfn(Object *obj)
                         cpu_max_set_sve_max_vq, NULL, NULL);
 }

+static void a64fx_cpu_set_sve(Object *obj)
+{
+    int i;
+    Error *errp =3D NULL;
+    ARMCPU *cpu =3D ARM_CPU(obj);
+    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
+    const char *vl[] =3D {"sve128", "sve256", "sve512"};
+
+    for(i =3D 0; i <sizeof(vl)/sizeof(vl[0]); i++){
+        object_property_add(obj, vl[i], "bool", cpu_arm_get_sve_vq,
+                            cpu_arm_set_sve_vq, NULL, NULL);
+        object_property_set_bool(obj, vl[i], true, &errp);
+    }
+
+    cpu->sve_max_vq =3D find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) + 1;
+}
+
 static void aarch64_a64fx_initfn(Object *obj)
 {
     ARMCPU *cpu =3D ARM_CPU(obj);
@@ -885,6 +902,9 @@ static void aarch64_a64fx_initfn(Object *obj)
     cpu->gic_vpribits =3D 5;
     cpu->gic_vprebits =3D 5;

+    /* Set SVE properties */
+    a64fx_cpu_set_sve(obj);
+
     /* TODO:  Add A64FX specific HPC extension registers */
 }
----------

In the case of the patch above,
it is possible to identify only the SVE vector length supported by A64FX fr=
om QMP,=20
as shown in the following result.

----------
Welcome to the QMP low-level shell!
Connected to QEMU 6.0.93

(QEMU) query-cpu-model-expansion type=3Dfull model=3D{"name":"a64fx"}
{"return": {"model": {"name": "a64fx", "props": {"sve128": true, "sve256": =
true, "sve512": true, "aarch64": true, "pmu": true}}}}
(QEMU)
----------

How about this kind of fix?
However, by allowing the sve128, sve256, and sve512 properties to be specif=
ied,=20
the user can explicitly change the settings (ex: sve128=3Doff),=20
but the only properties that can be set is the vector length supported by A=
64FX.=20
We personally think this is a no problem.

We would appreciate your comments.

Best regards.

> -----Original Message-----
> From: Andrew Jones <drjones@redhat.com>
> Sent: Thursday, August 12, 2021 6:25 PM
> To: Ishii, Shuuichirou/=1B$B@P0f=1B(B =1B$B<~0lO:=1B(B <ishii.shuuichir@f=
ujitsu.com>
> Cc: peter.maydell@linaro.org; qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Subject: Re: [PATCH v4 1/3] target-arm: Add support for Fujitsu A64FX
>=20
> On Thu, Aug 12, 2021 at 11:16:50AM +0200, Andrew Jones wrote:
> > On Thu, Aug 12, 2021 at 03:04:38PM +0900, Shuuichirou Ishii wrote:
> > > Add a definition for the Fujitsu A64FX processor.
> > >
> > > The A64FX processor does not implement the AArch32 Execution state,
> > > so there are no associated AArch32 Identification registers.
> > >
> > > For SVE, the A64FX processor supports only 128,256 and 512bit vector
> lengths.
> > >
> > > Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> > > ---
> > >  target/arm/cpu.c   | 27 +++++++++++++++++++++++----
> > >  target/arm/cpu.h   |  1 +
> > >  target/arm/cpu64.c | 42
> ++++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 66 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/target/arm/cpu.c b/target/arm/cpu.c index
> > > 2866dd7658..162e46afc3 100644
> > > --- a/target/arm/cpu.c
> > > +++ b/target/arm/cpu.c
> > > @@ -1345,15 +1345,34 @@ static void arm_cpu_finalizefn(Object *obj)
> > > #endif  }
> > >
> > > +static void a64fx_cpu_set_sve(ARMCPU *cpu) {
> > > +    /* Suppport of A64FX's vector length are 128,256 and 512bit only=
 */
> > > +    bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ);
> > > +    bitmap_zero(cpu->sve_vq_init, ARM_MAX_VQ);
> > > +    set_bit(0, cpu->sve_vq_map); /* 128bit */
> > > +    set_bit(0, cpu->sve_vq_init);
> > > +    set_bit(1, cpu->sve_vq_map); /* 256bit */
> > > +    set_bit(1, cpu->sve_vq_init);
> > > +    set_bit(3, cpu->sve_vq_map); /* 512bit */
> > > +    set_bit(3, cpu->sve_vq_init);
> > > +
> > > +    cpu->sve_max_vq =3D find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ)
> +
> > > +1; }
> > > +
> > >  void arm_cpu_finalize_features(ARMCPU *cpu, Error **errp)  {
> > >      Error *local_err =3D NULL;
> > >
> > >      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> > > -        arm_cpu_sve_finalize(cpu, &local_err);
> > > -        if (local_err !=3D NULL) {
> > > -            error_propagate(errp, local_err);
> > > -            return;
> > > +        if (arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
> > > +            a64fx_cpu_set_sve(cpu);
> > > +        } else {
> > > +            arm_cpu_sve_finalize(cpu, &local_err);
> > > +            if (local_err !=3D NULL) {
> > > +                error_propagate(errp, local_err);
> > > +                return;
> > > +            }
> > >          }
> > >
> > >          /*
> > > diff --git a/target/arm/cpu.h b/target/arm/cpu.h index
> > > 9f0a5f84d5..84ebca731a 100644
> > > --- a/target/arm/cpu.h
> > > +++ b/target/arm/cpu.h
> > > @@ -2145,6 +2145,7 @@ enum arm_features {
> > >      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
> > >      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
> > >      ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later
> > > */
> > > +    ARM_FEATURE_A64FX, /* Fujitsu A64FX processor */
> > >  };
> > >
> > >  static inline int arm_feature(CPUARMState *env, int feature) diff
> > > --git a/target/arm/cpu64.c b/target/arm/cpu64.c index
> > > c690318a9b..5e7e885f9d 100644
> > > --- a/target/arm/cpu64.c
> > > +++ b/target/arm/cpu64.c
> > > @@ -847,10 +847,52 @@ static void aarch64_max_initfn(Object *obj)
> > >                          cpu_max_set_sve_max_vq, NULL, NULL);  }
> > >
> > > +static void aarch64_a64fx_initfn(Object *obj) {
> > > +    ARMCPU *cpu =3D ARM_CPU(obj);
> > > +
> > > +    cpu->dtb_compatible =3D "arm,a64fx";
> > > +    set_feature(&cpu->env, ARM_FEATURE_A64FX);
> > > +    set_feature(&cpu->env, ARM_FEATURE_V8);
> > > +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> > > +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> > > +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> > > +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> > > +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> > > +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> > > +    cpu->midr =3D 0x461f0010;
> > > +    cpu->revidr =3D 0x00000000;
> > > +    cpu->ctr =3D 0x86668006;
> > > +    cpu->reset_sctlr =3D 0x30000180;
> > > +    cpu->isar.id_aa64pfr0 =3D   0x0000000101111111; /* No RAS
> Extensions */
> > > +    cpu->isar.id_aa64pfr1 =3D 0x0000000000000000;
> > > +    cpu->isar.id_aa64dfr0 =3D 0x0000000010305408;
> > > +    cpu->isar.id_aa64dfr1 =3D 0x0000000000000000;
> > > +    cpu->id_aa64afr0 =3D 0x0000000000000000;
> > > +    cpu->id_aa64afr1 =3D 0x0000000000000000;
> > > +    cpu->isar.id_aa64mmfr0 =3D 0x0000000000001122;
> > > +    cpu->isar.id_aa64mmfr1 =3D 0x0000000011212100;
> > > +    cpu->isar.id_aa64mmfr2 =3D 0x0000000000001011;
> > > +    cpu->isar.id_aa64isar0 =3D 0x0000000010211120;
> > > +    cpu->isar.id_aa64isar1 =3D 0x0000000000010001;
> > > +    cpu->isar.id_aa64zfr0 =3D 0x0000000000000000;
> > > +    cpu->clidr =3D 0x0000000080000023;
> > > +    cpu->ccsidr[0] =3D 0x7007e01c; /* 64KB L1 dcache */
> > > +    cpu->ccsidr[1] =3D 0x2007e01c; /* 64KB L1 icache */
> > > +    cpu->ccsidr[2] =3D 0x70ffe07c; /* 8MB L2 cache */
> > > +    cpu->dcz_blocksize =3D 6; /* 256 bytes */
> > > +    cpu->gic_num_lrs =3D 4;
> > > +    cpu->gic_vpribits =3D 5;
> > > +    cpu->gic_vprebits =3D 5;
> > > +
> > > +    /* TODO:  Add A64FX specific HPC extension registers */ }
> > > +
> > >  static const ARMCPUInfo aarch64_cpus[] =3D {
> > >      { .name =3D "cortex-a57",         .initfn =3D aarch64_a57_initfn=
 },
> > >      { .name =3D "cortex-a53",         .initfn =3D aarch64_a53_initfn=
 },
> > >      { .name =3D "cortex-a72",         .initfn =3D aarch64_a72_initfn=
 },
> > > +    { .name =3D "a64fx",              .initfn =3D aarch64_a64fx_init=
fn },
> > >      { .name =3D "max",                .initfn =3D aarch64_max_initfn=
 },
> > >  };
> > >
> > > --
> > > 2.27.0
> > >
> >
> > For the SVE related bits
> >
> > Reviewed-by: Andrew Jones <drjones@redhat.com>
>=20
> On second thought, do we want the QMP CPU model expansion query to show t=
hat
> this CPU type has sve,sve128,sve256,sve512? If so, then our SVE work isn'=
t
> complete, because we need those properties, set true by default, but forb=
idden
> from changing.
>=20
> Thanks,
> drew


