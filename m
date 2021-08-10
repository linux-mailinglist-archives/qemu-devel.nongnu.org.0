Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4CF3E86E6
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 01:59:41 +0200 (CEST)
Received: from localhost ([::1]:36834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDbel-0005cV-WD
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 19:59:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mDbdh-0004ex-Q0; Tue, 10 Aug 2021 19:58:34 -0400
Received: from esa1.fujitsucc.c3s2.iphmx.com ([68.232.152.245]:5006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mDbde-0001B2-Jb; Tue, 10 Aug 2021 19:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
 t=1628639912; x=1660175912;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZrAcyTgwpOvkrfGlLWY+0CIVMzV+YoeLpGzqpZuzp1A=;
 b=VU8cdC9Mql463ce3+yFtWPxk/SBXxKcAryHZn72uNNAgfreLzhGieUwG
 ahAHuF4QwA6WHPEg9O3MIIioEQwUUiQeh9J/9N9ASyoyB7GP7I+6234BA
 TlC0HdCLWX07wlmomtsf0VnjkkW5+hrVnJQ+UUHI2T6YoUGz3alJ2482K
 5FWE1peTn6EezbhI27JExL44vB97Yl7UWoUwZHGqYUquMKW5K0+OmHTRz
 leLTS0LD2igTPT2D57jYGY5YpDr5QIQEy+LbPrLnfr6iNgsTEZYV2uGHg
 FdLdUN9oNB8kdx5GRmNxTZ66Au7h8mdP5gm+J4a5Bnqj75qKzklsyiB6K w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="44677767"
X-IronPort-AV: E=Sophos;i="5.84,311,1620658800"; d="scan'208";a="44677767"
Received: from mail-hk2apc01lp2056.outbound.protection.outlook.com (HELO
 APC01-HK2-obe.outbound.protection.outlook.com) ([104.47.124.56])
 by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 08:58:27 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QLEQO/5SbYY3m0+3nUBb3qK9ASDU2okV6JtK/6UhOmE95HJ45CPGyl4BLH5RboqfAws247dKQr2hTh2WfQyBzf+ktpbvHr2Sty1uYCtRlIvyl71lvh6KZI+e+K9DO6HuhwLxpDoWaB7opoTHeTk0lYn7gZCeLyCog5KQczw1NtxJY5EPk1/MDklzt5aXBYZlgQ7rcWceGehaO2Xu4H1GhPV8IDrPH8AKEFQHJyt+Ud10VRKmTZIpw46t/axdJAC8xkyk8R1hbRkrHXfV7V/cr+Tk8aSLXg/83D047ybNYlZCfYF+wiPB+QOp9EYWCETrjBzuemSi4rqHfUQsU2HFTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uQoY+d/E5MC/g2MuqUEQ6PWWfaa9xsqtmiOFejUOp0=;
 b=TMKhXipXPxs9rTqQzlM9z2NxVYxJFJfMdJjtnKWdguUmeq/63JlBz64lOzMUewWJuTLPLExRxFGV3TbzmEifZQpn/I5YjipStnCY6xOWa98qkxl+1Pk6aBE33vqK5HHBKxexnsK3BP7oFWUHYSIOH8OYg1W4t6BPgr/RCxZJ7lZaKZCmkeTw4eaRBfUh4K1ki2UV4OvD0UHFw6gCPcypEjuyszV/wKqU6fJYNDDfhp941Go4IIlN9o9YZ6OjmrjeFoyybvd/5mKwID6Krq/5hRrC+ycNJebZtu86wNjGNG38gdhmqA2OvBAO9GIQoJNbDyte6jxtO6Sun3zuv9f9jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+uQoY+d/E5MC/g2MuqUEQ6PWWfaa9xsqtmiOFejUOp0=;
 b=pgGHjXREa3eZgVKrYY7/z38S4aSKcCnZar/F06AC04k7xSRnFaO0SPAJb1TpvcuygEbazUx9yn54y/UpvpVy1XUMANZKClf3mJewWyx6zzJOycoLyDcwo3VSviCsdpArt7NqGtkaYbp352pSNfzQG0QSV80SmNhKhXMvuA1VDLw=
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com (2603:1096:400:4f::8)
 by TY2PR01MB4907.jpnprd01.prod.outlook.com (2603:1096:404:10f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Tue, 10 Aug
 2021 23:58:22 +0000
Received: from TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::8a4:de4b:a07a:789c]) by TYCPR01MB6160.jpnprd01.prod.outlook.com
 ([fe80::8a4:de4b:a07a:789c%7]) with mapi id 15.20.4415.015; Tue, 10 Aug 2021
 23:58:10 +0000
From: "ishii.shuuichir@fujitsu.com" <ishii.shuuichir@fujitsu.com>
To: 'Andrew Jones' <drjones@redhat.com>
Subject: RE: [PATCH v3 1/3] target-arm: cpu64: Add support for Fujitsu A64FX
Thread-Topic: [PATCH v3 1/3] target-arm: cpu64: Add support for Fujitsu A64FX
Thread-Index: AQHXicvRRXtwLvmObkuHxn+n0+8QAatkxVQAgAdndqCAAHjogIAAuXpg
Date: Tue, 10 Aug 2021 23:58:10 +0000
Message-ID: <TYCPR01MB616009044D4CA63F066A4314E9F79@TYCPR01MB6160.jpnprd01.prod.outlook.com>
References: <20210805073045.916622-1-ishii.shuuichir@fujitsu.com>
 <20210805073045.916622-2-ishii.shuuichir@fujitsu.com>
 <20210805112432.mjrqizexwyammfm5@gator.home>
 <TYCPR01MB6160A85D5A15580645876DB9E9F79@TYCPR01MB6160.jpnprd01.prod.outlook.com>
 <20210810114123.yn6uftzurby25q4b@gator.home>
In-Reply-To: <20210810114123.yn6uftzurby25q4b@gator.home>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: =?iso-2022-jp?B?TVNJUF9MYWJlbF9hNzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZl?=
 =?iso-2022-jp?B?Y2UwNTBfQWN0aW9uSWQ9NTMyNjMwNGQtMjE4OC00OGJjLWE1NjgtMzky?=
 =?iso-2022-jp?B?ZDVmNjJmNjUxO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFi?=
 =?iso-2022-jp?B?NGQtM2IwZjRmZWNlMDUwX0NvbnRlbnRCaXRzPTA7TVNJUF9MYWJlbF9h?=
 =?iso-2022-jp?B?NzI5NWNjMS1kMjc5LTQyYWMtYWI0ZC0zYjBmNGZlY2UwNTBfRW5hYmxl?=
 =?iso-2022-jp?B?ZD10cnVlO01TSVBfTGFiZWxfYTcyOTVjYzEtZDI3OS00MmFjLWFiNGQt?=
 =?iso-2022-jp?B?M2IwZjRmZWNlMDUwX01ldGhvZD1TdGFuZGFyZDtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9OYW1lPUZV?=
 =?iso-2022-jp?B?SklUU1UtUkVTVFJJQ1RFRBskQiJMJT8lUhsoQjtNU0lQX0xhYmVsX2E3?=
 =?iso-2022-jp?B?Mjk1Y2MxLWQyNzktNDJhYy1hYjRkLTNiMGY0ZmVjZTA1MF9TZXREYXRl?=
 =?iso-2022-jp?B?PTIwMjEtMDgtMTBUMjI6NDU6MTNaO01TSVBfTGFiZWxfYTcyOTVjYzEt?=
 =?iso-2022-jp?B?ZDI3OS00MmFjLWFiNGQtM2IwZjRmZWNlMDUwX1NpdGVJZD1hMTlmMTIx?=
 =?iso-2022-jp?B?ZC04MWUxLTQ4NTgtYTlkOC03MzZlMjY3ZmQ0Yzc7?=
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 07eabac5-afde-4dd1-15ff-08d95c5ab508
x-ms-traffictypediagnostic: TY2PR01MB4907:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB4907D347BE64BC5589274C52E9F79@TY2PR01MB4907.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2043;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9U+ZShd6X/VIrBE9hLuK0+RoU4/Y3w9u89dT7xLCRdfMJVSRWuZI1vem3hPSTx6jrydX8cpeTgrn+WHZk5bZ1ruW/0/lAYhA15KOIAgdWmrkJHhDFvug+v39HSXbi7rkRaRCmvOOg5KulN9Kkp46lS8s+ABuChwhRCNN+paKckagv7mHVOBQ6d8IRHYBn+JouFAvW+Mq8Fz6ISlctDuEXFVtb7L0TdJiy2yjwHw+7sDVfS/glWdyuse1FVDWXPlbVq5WUyOjMN875K6x3t0eeqJTMMoaTeeKS7ophjK+fHUmP3TYZ332YkHCk1knxcfiac3IpvUNEI9a6IBpwqV3MCrC5fUNqsCqkqIZh7HFgPRtr4yz2gAbVNEzwaSED/Pz1mUUO1wRfNKCNMJEbVMg787iKpWHx5ss/R6uRCWAEfeX3FErRqfvBTIamKaB5qkVU8bfC69PZPUx0G2kgxOAX1bUNxisvz3fe9hQta4ZHBOciFPOgBRtm7n/+gM34Cxsr4j4GFHG8a9Eu/UzzG6bdu1eh7n+pcuadWptmulUlDTHUkSVDC+s815ORe/sjX/V8FRk0ii15dB8Uldo0pPGI8eAOn+EZOq3kOtt/X6dGVHimpTidKNcH6KXcXPFQ6pEvzrb1/NMu+1O/KyeTGn75820MFy5+ud0dwVGHtHJ8Ycswnmv7BAzZsbtXF3NgIGrH8mZ9IuR7utC/ZKbtOPvMA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB6160.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(396003)(136003)(376002)(366004)(4326008)(6506007)(53546011)(66446008)(8676002)(66476007)(71200400001)(5660300002)(107886003)(52536014)(38070700005)(478600001)(55016002)(33656002)(9686003)(316002)(26005)(86362001)(6916009)(186003)(85182001)(2906002)(38100700002)(83380400001)(54906003)(8936002)(76116006)(122000001)(7696005)(66556008)(64756008)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?enY5Y1VyQmRFT2NHWDdFYWNXRWc3WXZKMUc1WUVTaVUyczNERWxFNElU?=
 =?iso-2022-jp?B?Vi9nNndMbVpBdW5nMDdldlZ1aVlOZytVRElsdklxSU1TRjdRVVZPYTNC?=
 =?iso-2022-jp?B?eGtlS1pkZ3hDclRhV3ZnY29zR0pXa2pEdDFIeHJUNzV1N0VGU0h4enBR?=
 =?iso-2022-jp?B?T0lWWGpLbXZPazZLcEZzMjFKVEYzbzA1QVVXVldSK1d5Q1ZMaU5nWXpx?=
 =?iso-2022-jp?B?ZTl0Z3lNcFlzRTYveWFFUVlIajlweEorRmRTeE4wTE5zMVFhVE9HY0lW?=
 =?iso-2022-jp?B?TGU0cEkvdUx2QWNGNVg3dUx1OEVRbDlGS0YrUXNtSW03cHZaZmNTVmpZ?=
 =?iso-2022-jp?B?djRJYkFqTmcvaDQ1SEhpUTFSOVg0eHc2QlJNNmVoZlhnRGRpTEk3aUZa?=
 =?iso-2022-jp?B?NE9zdVE1SVcycHlrWmRtZWtnZ2gzNzdWV3EzWUFtR3BWdXBCaGprSXEz?=
 =?iso-2022-jp?B?Vnd3ZEI1Ri9sTWpkZHdxc3dmT3JyV3dPWGEzN1BCN3Z3RGkrYjJPQ3B1?=
 =?iso-2022-jp?B?cEp1TXBrWXpBK1ZLYXphRkNjR3hPWVhETndwV2dHMW0rVUFmQjFlaGF0?=
 =?iso-2022-jp?B?bndRZjA5bkFGRVR4VHZNTHdKTzlCT0lVenZzZzQrU1NxdjJzNnk2TGhT?=
 =?iso-2022-jp?B?Kzhibk83OUJqOWd5ZDhUMERvNWQxZy9lMUNWcEoyU2o3ZnhEdmNYVERm?=
 =?iso-2022-jp?B?dGd6eHFtVHA3OS9ZTXZaRzFXelpsL0dEYWpJZzJ1Y2RxTmFsdWU0Z1po?=
 =?iso-2022-jp?B?T05BM09MNTZ2R0VVZWlmZEgwOGQvY3FQZ1g1dVNMWUF2VTFSYTRNWWdR?=
 =?iso-2022-jp?B?N21lVW9RZzVNdE1iS1F0OUFla20yb1dlUDJDU0U5cUtPU0dodW5td0Yv?=
 =?iso-2022-jp?B?KzBYTFlvUkJYeUd1b0J4ejJ2L2c0aW1CZUh4dlFaeTcvckdydS8xVGx1?=
 =?iso-2022-jp?B?ZDQ1NEpad3NPSklXTjFDMklERlJqZnMrVTNISHFXR1kxbDlZZGhhajlh?=
 =?iso-2022-jp?B?R3kxMFZoZE53K2JsQWNYaHo5cnlBK3pldDdqdVVkRzBKMmduSFFzNkw5?=
 =?iso-2022-jp?B?bTlEaWpmWWlHOUlpd0M1cnM0b0VvdElmUnFDUjlvTlF1ZGxXbzVIbm1n?=
 =?iso-2022-jp?B?VDZyVWQ3dGdZejdtTVVUZ3hiKzV5VVBUbVhCQ0s5cUREU2tzdVlmUDJy?=
 =?iso-2022-jp?B?dTlDRmo4ZUprL3AxOUE4NTRMaVc5M0Z1WUI4QTVqS2F0UlloVlpMYkRm?=
 =?iso-2022-jp?B?R0c4Ry9aRU5rd05XUlExNGs0YUlNbW1MMmFBVVlWSm50U0pVeXNFd2Nz?=
 =?iso-2022-jp?B?RXZZZDVqcU8vdkh0eXdCb2RiUVl1VEdGZUxobVBjZG1mcE16OU5yN1JJ?=
 =?iso-2022-jp?B?a2RRdFZkakVOZ2tSZlZBNEswK0ZiR1BPa1dsN092c1NQVkRxOUJ2QVJw?=
 =?iso-2022-jp?B?MEh4R01rUXdTMG1BbFlFbWZuSlFPL3hwNVhFRUdGOXRZaFU2TUFHQzdU?=
 =?iso-2022-jp?B?YkJ5RnBPSjk4M1JCWnhQYVVvQzJMbHFPMHhkNVJNUHJLMFQzRnBUbGx0?=
 =?iso-2022-jp?B?Mk14OTZib2dYb2xxMG83Ykp1K2JVQmFVUWxYM1VDeXYrSm1SMGFKZzhD?=
 =?iso-2022-jp?B?eU0wQU10dnY4cGpGT3ZVNi9IZGJ4R1hTR1VpWDdOaXZObGxVc0QxMDZJ?=
 =?iso-2022-jp?B?akdBMFpwU0lkcVovU0VDNDgzUzZJRFVJSHRxU1pPbUJxVUZ3M0lhYlhF?=
 =?iso-2022-jp?B?YTVOckpGc2dxeXUvWDJzQU1hN0luSWlnbmdvQU9FY1ZNMzVuRVhhdksr?=
 =?iso-2022-jp?B?cHZDeXlDaXIrSWt4amJPMEx3UUgvTytQVU80alNuV0RnM3FWYS9jNVNM?=
 =?iso-2022-jp?B?a2M2bmUvUlBKcERtUG8rQTFjbGQyLzRjckZiOW1RNnQwK3A0M2pRSEJK?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6160.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07eabac5-afde-4dd1-15ff-08d95c5ab508
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2021 23:58:10.2319 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YU/kecnrLtyAt1/fLUdk48+trvYvEU2a+T+txjL16YLheHgOnlczNS7Aubnp7g7roeyyZTxod7HFJoJNcqSmXG+wkTxzaCJ4vrOauoJyaCM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4907
Received-SPF: pass client-ip=68.232.152.245;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa1.fujitsucc.c3s2.iphmx.com
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


Thank you very much for the source review and the patch.
We will create a series of V4 patches based on your comments.

Best regards.

> -----Original Message-----
> From: Andrew Jones <drjones@redhat.com>
> Sent: Tuesday, August 10, 2021 8:41 PM
> To: Ishii, Shuuichirou/ <ishii.shuuichir@fujitsu.com>
> Cc: peter.maydell@linaro.org; qemu-arm@nongnu.org; qemu-devel@nongnu.org
> Subject: Re: [PATCH v3 1/3] target-arm: cpu64: Add support for Fujitsu A6=
4FX
>=20
> On Tue, Aug 10, 2021 at 08:23:39AM +0000, ishii.shuuichir@fujitsu.com wro=
te:
> >
> > Thanks for your comments.
> >
> > Before reposting the fix patch series, based on your comments and the
> > v3 1/3 patch, we have considered the following fixes.
> >
> > If you have any comments on the fixes, please let us know.
> >
> > ---
> >
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h index
> > 9f0a5f84d5..84ebca731a 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -2145,6 +2145,7 @@ enum arm_features {
> >      ARM_FEATURE_M_SECURITY, /* M profile Security Extension */
> >      ARM_FEATURE_M_MAIN, /* M profile Main Extension */
> >      ARM_FEATURE_V8_1M, /* M profile extras only in v8.1M and later */
> > +    ARM_FEATURE_A64FX, /* Fujitsu A64FX processor */
> >  };
> >
> >  static inline int arm_feature(CPUARMState *env, int feature) diff
> > --git a/target/arm/cpu64.c b/target/arm/cpu64.c index
> > 612644941b..62dcb6a919 100644
> > --- a/target/arm/cpu64.c
> > +++ b/target/arm/cpu64.c
> > @@ -248,6 +248,21 @@ static void aarch64_a72_initfn(Object *obj)
> >      define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);  }
> >
> > +static void a64fx_cpu_set_sve(ARMCPU *cpu) {
> > +    /* Suppport of A64FX's vector length are 128,256 and 512byte only
> > +*/
>=20
> Missing spaces in text and s/byte/bit/
>=20
> > +    bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ);
> > +    bitmap_zero(cpu->sve_vq_init, ARM_MAX_VQ);
> > +    set_bit(0, cpu->sve_vq_map); /* 128byte */
> > +    set_bit(0, cpu->sve_vq_init);
> > +    set_bit(1, cpu->sve_vq_map); /* 256byte */
> > +    set_bit(1, cpu->sve_vq_init);
> > +    set_bit(3, cpu->sve_vq_map); /* 512byte */
> > +    set_bit(3, cpu->sve_vq_init);
>=20
> For all the comments in the above function s/byte/bit/
>=20
> > +    cpu->sve_max_vq =3D find_last_bit(cpu->sve_vq_map, ARM_MAX_VQ) +
> 1;
> > +
>=20
> Extra blank line
>=20
> > +}
> >  void arm_cpu_sve_finalize(ARMCPU *cpu, Error **errp)  {
> >      /*
> > @@ -448,6 +463,10 @@ void arm_cpu_sve_finalize(ARMCPU *cpu, Error
> > **errp)
> >
> >      /* From now on sve_max_vq is the actual maximum supported length. =
*/
> >      cpu->sve_max_vq =3D max_vq;
> > +
> > +       if(arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
> > +        a64fx_cpu_set_sve(cpu);
> > +    }
>=20
> Bad indentation and spacing, but I don't think this is the right place fo=
r this. I
> wouldn't even let ARM_FEATURE_A64FX enter arm_cpu_sve_finalize, since we
> know it doesn't support sve cpu properties.
> While it's ugly wherever we put it, since we have to special case it, I t=
hink it's less
> ugly at the callsite
>=20
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c index
> 2866dd765882..225800ec361c 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1350,10 +1350,14 @@ void arm_cpu_finalize_features(ARMCPU *cpu, Error
> **errp)
>      Error *local_err =3D NULL;
>=20
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> -        arm_cpu_sve_finalize(cpu, &local_err);
> -        if (local_err !=3D NULL) {
> -            error_propagate(errp, local_err);
> -            return;
> +        if (arm_feature(&cpu->env, ARM_FEATURE_A64FX)) {
> +            a64fx_cpu_set_sve(cpu);
> +        } else {
> +            arm_cpu_sve_finalize(cpu, &local_err);
> +            if (local_err !=3D NULL) {
> +                error_propagate(errp, local_err);
> +                return;
> +            }
>          }
>=20
>          /*
>=20
> >  }
> >
> >  static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const
> > char *name, @@ -852,6 +871,7 @@ static void aarch64_a64fx_initfn(Object
> *obj)
> >      ARMCPU *cpu =3D ARM_CPU(obj);
> >
> >      cpu->dtb_compatible =3D "arm,a64fx";
> > +    set_feature(&cpu->env, ARM_FEATURE_A64FX);
> >      set_feature(&cpu->env, ARM_FEATURE_V8);
> >      set_feature(&cpu->env, ARM_FEATURE_NEON);
> >      set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER); @@ -884,10
> > +904,6 @@ static void aarch64_a64fx_initfn(Object *obj)
> >      cpu->gic_vpribits =3D 5;
> >      cpu->gic_vprebits =3D 5;
> >      /* TODO:  Add A64FX specific HPC extension registers */
> > -
> > -    aarch64_add_sve_properties(obj);
> > -    object_property_add(obj, "sve-max-vq", "uint32",
> cpu_max_get_sve_max_vq,
> > -                        cpu_max_set_sve_max_vq, NULL, NULL);
> >  }
> >
> >  static const ARMCPUInfo aarch64_cpus[] =3D {
>=20
> Otherwise looks OK to me.
>=20
> Thanks,
> drew
>=20
> >
> > ---
> >
> > Best regards.
> >
> >
> > > -----Original Message-----
> > > From: Andrew Jones <drjones@redhat.com>
> > > Sent: Thursday, August 5, 2021 8:25 PM
> > > To: Ishii, Shuuichirou <ishii.shuuichir@fujitsu.com>
> > > Cc: peter.maydell@linaro.org; qemu-arm@nongnu.org;
> > > qemu-devel@nongnu.org
> > > Subject: Re: [PATCH v3 1/3] target-arm: cpu64: Add support for
> > > Fujitsu A64FX
> > >
> > > On Thu, Aug 05, 2021 at 04:30:43PM +0900, Shuuichirou Ishii wrote:
> > > > Add a definition for the Fujitsu A64FX processor.
> > > >
> > > > The A64FX processor does not implement the AArch32 Execution
> > > > state, so there are no associated AArch32 Identification registers.
> > > >
> > > > Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> > > > ---
> > > >  target/arm/cpu64.c | 44
> > > ++++++++++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 44 insertions(+)
> > > >
> > > > diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c index
> > > > c690318a9b..612644941b 100644
> > > > --- a/target/arm/cpu64.c
> > > > +++ b/target/arm/cpu64.c
> > > > @@ -847,10 +847,54 @@ static void aarch64_max_initfn(Object *obj)
> > > >                          cpu_max_set_sve_max_vq, NULL, NULL);  }
> > > >
> > > > +static void aarch64_a64fx_initfn(Object *obj) {
> > > > +    ARMCPU *cpu =3D ARM_CPU(obj);
> > > > +
> > > > +    cpu->dtb_compatible =3D "arm,a64fx";
> > > > +    set_feature(&cpu->env, ARM_FEATURE_V8);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_NEON);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_GENERIC_TIMER);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_AARCH64);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_EL2);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_EL3);
> > > > +    set_feature(&cpu->env, ARM_FEATURE_PMU);
> > > > +    cpu->midr =3D 0x461f0010;
> > > > +    cpu->revidr =3D 0x00000000;
> > > > +    cpu->ctr =3D 86668006;
> > > > +    cpu->reset_sctlr =3D 0x30000180;
> > > > +    cpu->isar.id_aa64pfr0 =3D   0x0000000101111111; /* No RAS
> Extensions
> > > */
> > > > +    cpu->isar.id_aa64pfr1 =3D 0x0000000000000000;
> > > > +    cpu->isar.id_aa64dfr0 =3D 0x0000000010305408;
> > > > +    cpu->isar.id_aa64dfr1 =3D 0x0000000000000000;
> > > > +    cpu->id_aa64afr0 =3D 0x0000000000000000;
> > > > +    cpu->id_aa64afr1 =3D 0x0000000000000000;
> > > > +    cpu->isar.id_aa64mmfr0 =3D 0x0000000000001122;
> > > > +    cpu->isar.id_aa64mmfr1 =3D 0x0000000011212100;
> > > > +    cpu->isar.id_aa64mmfr2 =3D 0x0000000000001011;
> > > > +    cpu->isar.id_aa64isar0 =3D 0x0000000010211120;
> > > > +    cpu->isar.id_aa64isar1 =3D 0x0000000000010001;
> > > > +    cpu->isar.id_aa64zfr0 =3D 0x0000000000000000;
> > > > +    cpu->clidr =3D 0x0000000080000023;
> > > > +    cpu->ccsidr[0] =3D 0x7007e01c; /* 64KB L1 dcache */
> > > > +    cpu->ccsidr[1] =3D 0x2007e01c; /* 64KB L1 icache */
> > > > +    cpu->ccsidr[2] =3D 0x70ffe07c; /* 8MB L2 cache */
> > > > +    cpu->dcz_blocksize =3D 6; /* 256 bytes */
> > > > +    cpu->gic_num_lrs =3D 4;
> > > > +    cpu->gic_vpribits =3D 5;
> > > > +    cpu->gic_vprebits =3D 5;
> > > > +    /* TODO:  Add A64FX specific HPC extension registers */
> > > > +
> > > > +    aarch64_add_sve_properties(obj);
> > > > +    object_property_add(obj, "sve-max-vq", "uint32",
> > > cpu_max_get_sve_max_vq,
> > > > +                        cpu_max_set_sve_max_vq, NULL, NULL);
> > >
> > > I'm not a huge fan of the sve-max-vq property since it's not a good
> > > idea to use it with KVM, because it's not explicit enough for
> > > migration[1]. I realize the a64fx cpu type will likely never be used
> > > with KVM, but since sve-max-vq isn't necessary[2], than I would
> > > avoid propagating it to another cpu type. Finally, if you want the
> > > a64fx cpu model to represent the current a64fx cpu, then don't you
> > > want to explicitly set the supported vector lengths[3] and deny the u=
ser the
> option to change them? You could do that by directly setting the vq map a=
nd not
> adding the sve properties.
> > >
> > > [1] With KVM, sve-max-vq only tells you the maximum vq, but it won't
> > > tell you that the host doesn't support non-power-of-2 vector
> > > lengths. So you don't get an explicit vector length list on the
> > > command line. Being explicit is the only safe way to migrate (see
> > > docs/system/arm/cpu-features.rst:"SVE CPU Property Recommendations").
> > >
> > > [2] If a shorthand is desired for specifying vector lengths, then
> > > just use a single sve<N> property. For example, sve-max-vq=3D4 and
> > > sve512=3Don are identical (but keep [1] in mind).
> > >
> > > [3] a64fx only support 128, 256, and 512 bit vector lengths, afaik.
> > >
> > > Thanks,
> > > drew
> > >
> > > > +}
> > > > +
> > > >  static const ARMCPUInfo aarch64_cpus[] =3D {
> > > >      { .name =3D "cortex-a57",         .initfn =3D aarch64_a57_init=
fn },
> > > >      { .name =3D "cortex-a53",         .initfn =3D aarch64_a53_init=
fn },
> > > >      { .name =3D "cortex-a72",         .initfn =3D aarch64_a72_init=
fn },
> > > > +    { .name =3D "a64fx",              .initfn =3D aarch64_a64fx_in=
itfn },
> > > >      { .name =3D "max",                .initfn =3D aarch64_max_init=
fn },
> > > >  };
> > > >
> > > > --
> > > > 2.27.0
> > > >
> > > >
> >


