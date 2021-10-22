Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB91437C06
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Oct 2021 19:36:32 +0200 (CEST)
Received: from localhost ([::1]:56920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdyT1-00058S-FZ
	for lists+qemu-devel@lfdr.de; Fri, 22 Oct 2021 13:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdyPg-00035j-Bb
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:33:05 -0400
Received: from mail-eopbgr820120.outbound.protection.outlook.com
 ([40.107.82.120]:37280 helo=NAM01-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luis.pires@eldorado.org.br>)
 id 1mdyPa-0006Y9-Mj
 for qemu-devel@nongnu.org; Fri, 22 Oct 2021 13:33:02 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q56GLJ8NNtKDc6Ic2ujh+IoFZU0yEXjSCL3wawGl3gOH226qXu8M3tAPeqGhRPXZP8e3RFaYY1aW4pKJ8E1qS2MmwsNsn0zdNzpo4eFkr/9vW1PF3CiSNZv/XqoVvTko7wMDwSV/Wh6jrUAubyJLz6cMGrrAGeAkOsgcwXn2uhFKRqYv5c2++Clw/F/rxSBOs5krtN6cpyge/enkq9VSSwhs3nB/5yB1MTr/GnEhHEn2lPY62uQVFpD7Z2w/vRLod15mN1aEX83kax+E3H6rGqmfG57MWmxL/RCxxM07L9gydtU30X5j19YNUxmpNmnJFo48Nq6whaJdAzb9VM/nxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xt2JIY/uJLGjS7LTYkPNQ1lTHMraVIPewPiL3vSBXM=;
 b=CQ/IVz8vpwLx7dCgDvdT3iZAteoiVLLAs1nP8jkuVWYs4M+UaWt4sGjw+eE3uc5EpY7SJgsWCzyEQCElk13L8Hg+HUN68LUwaLmpFbPr4TKM+nB45IZvdoo96S9XCmubN3GHaG2lwlDMdzJS8E8RoZYcLViSxwTKmJPJIqM+q5M5WU6rMcThjeQU95nRceri3nSrE0f7WIIPk5wkL1mPcGVmXt7MCG6iYyZdz+y6nvDYgEUokinVMMVeoJgMSQjnaY2CRKlkF2kElU9/luLLOK8vM/Mz5K9hu5FFE8F83eJanCo5mO1gbxgzHjDcifaY3VZWr74hIhDhfoKO+Gm94Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=eldorado.org.br; dmarc=pass action=none
 header.from=eldorado.org.br; dkim=pass header.d=eldorado.org.br; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eldorado.org.br;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xt2JIY/uJLGjS7LTYkPNQ1lTHMraVIPewPiL3vSBXM=;
 b=G+Yuy0H5QOrvgsKrux31DGMNRttQoN+Riq6MzdY/FBkINmqc06OHTTzrY325VVtcqxUzzJ8HsU+yoqgLdjFZbgQUJQj5PXQ1zFoSs47l7pYDS4Cssjlf9k9LNwgwzhkWBN1TSAt9s1WqfzFaAR6Uz4S/8rzNH2ujvv+1ZEYJpOrcCOge2Iax04rW8wmtHRbLw31c+NaVNIqiYNggtpumHj0qlq8vZbqTiJmGPImaxNacxpt1iRIxiLwNz7p+aEV4AaEDdt/KU+xbNK/yy70Q97qN0Ofr0J03FnELB6JI9CLv1fYKTsqEXE6Mu3L0NvyOLf1VXzcxnRA+Q0rHCmsojA==
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com (2603:10d6:103:f::13)
 by CP2PR80MB3924.lamprd80.prod.outlook.com (2603:10d6:102:38::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Fri, 22 Oct
 2021 17:32:53 +0000
Received: from CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047]) by CPXPR80MB5224.lamprd80.prod.outlook.com
 ([fe80::bdcf:f3e5:cc0b:4047%3]) with mapi id 15.20.4628.018; Fri, 22 Oct 2021
 17:32:53 +0000
From: Luis Fernando Fujita Pires <luis.pires@eldorado.org.br>
To: Richard Henderson <richard.henderson@linaro.org>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 20/48] tcg/optimize: Split out fold_mulu2_i32
Thread-Topic: [PATCH v3 20/48] tcg/optimize: Split out fold_mulu2_i32
Thread-Index: AQHXxr91FMW0g6ToqEyCdCwGk8LnAKvfSBCA
Date: Fri, 22 Oct 2021 17:32:53 +0000
Message-ID: <CPXPR80MB52246079408680EEC4E3F8AADA809@CPXPR80MB5224.lamprd80.prod.outlook.com>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
 <20211021210539.825582-21-richard.henderson@linaro.org>
In-Reply-To: <20211021210539.825582-21-richard.henderson@linaro.org>
Accept-Language: pt-BR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linaro.org; dkim=none (message not signed)
 header.d=none; linaro.org; dmarc=none action=none header.from=eldorado.org.br; 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ba40e76-4f8b-4304-da99-08d99581faaa
x-ms-traffictypediagnostic: CP2PR80MB3924:
x-microsoft-antispam-prvs: <CP2PR80MB392413D5AE51267D4A397DBADA809@CP2PR80MB3924.lamprd80.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:400;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iApogzH5Ujh6g9heQvr4XrVNlMrh5uINaAdfEK0GXX2KBDyZYLDl9xyURq5+sboMALJIhFxe/0JgB5Cn5McCa8Xrv1qKgNHXlh4ri6T1bY9VAtLdEDeTSleTW26Y7HStmvCXqQnJ0PtAiQ3eIVSEigjrbIKCwkEAo/45YjrdYXU9XDV4W5q7gyqXXRn61KW7Wx6aZZvEFFHSDJ6zLthueqSvhDgggKi5YXrucT8xsWmkV1GN3jKUF1LOWkDS3OQTKY8kRJhK0nhr/LtUKBBORigkMYMUsaxtovXESEFIr8olW0CyDsLFk1uxFBbmxdDRelE4SukglCOAr6/kbYzaXLsItwwVVi03Ob2zLT0TDzsWTzqv2yhQv79ApnfiUuf0DTxO+FVHaZlCvxnIivXN/1hj9L74aGtCEkXNQnkPBrwTvaLVWIULTqpy5FG/3VnCYuZQFliUWCD8kQOPg8xmlLR7YQROhriTCk0/Ijv2jFYeyou8CHqLfNCdQ49sdohmkTnE7F4IexYtEEHT6wWJeBKBdt1RAkPjQmp+BkW1jhoNGfFzNBUHNxVkzKvQrXIrxsOM0Us47NwXklDxWnZzqC7f3RyvrbLJiBiVXetsdFNbvsjoNvdVIbbPP9MiWOp+HZTzuLXbWp6brPsEPK+1j1sIUmIrD/2KdG2QJ8/lKl2MmTrCTHYll3Ip+Ys1Tda5IIKc/JodeXGkZ13fLTch0OGNgV9258Z/Gx+DPYha1gju2If/8bM9gDOfn1xsBnIl5aUDCzzKGZzdoFJAa7BH/caCIwXKXQ95G8KDApqeeFE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CPXPR80MB5224.lamprd80.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38070700005)(4326008)(186003)(66476007)(52536014)(66556008)(66446008)(316002)(71200400001)(9686003)(33656002)(86362001)(83380400001)(64756008)(76116006)(55016002)(8936002)(5660300002)(2906002)(110136005)(38100700002)(66946007)(26005)(6506007)(558084003)(122000001)(508600001)(8676002)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sWnh/jxh4a92YYBGcYZXLU9CUNH4bfWDZhBvLERTN3eHidKvUILSlNPbs7OZ?=
 =?us-ascii?Q?SIF2kyBhi7p5fDXgBKSeOtT/CPg7TNlJ5D7VMIadnJXKBYW0/vk4dpMTnBQ5?=
 =?us-ascii?Q?MROeByQgreaQh+BIyLTJa3uqdVzqqiyJNKJfaBt//tjREQeV8jcGysCHTbNU?=
 =?us-ascii?Q?dIhq/YLveUR7fdX6XBhlf19va6+HhkuntuUWqzhMX6gjklceagehH+AQlWcF?=
 =?us-ascii?Q?jwxRd818WBZXjT4OIagSXlmjFA7TRPtka26EvvusbW3xt+TtoqCe2dsTAAdr?=
 =?us-ascii?Q?ro7dx6SSc77L7PePIIu5HsTCaVvN+wrSPQVJB4xfI0hOJvDBFufw0dl/n9Uv?=
 =?us-ascii?Q?5bSNRlzl1oe1dpamAQPbeLlab8+5I+FKTMgoN5WiTMRtM3g881tJLF1+e3t0?=
 =?us-ascii?Q?hs0XK8q2XraKYjYvGsxkxQES+H4AJeJZBGTGGmwTh26fwxR6f0cJkXTCAfkF?=
 =?us-ascii?Q?sqExpaT/LJt4HFZWLAhy/At7hDXXMirgJR1FtwTBoTvzWmgo/zzKSq+7Hw1g?=
 =?us-ascii?Q?qOIVYqNbe0xoAFKr58eCbNV2Bh0ITfs1fqclWOP52k44BBiwK8J+OtU0ufOF?=
 =?us-ascii?Q?PR1jexjWVlvIG66zzJOWwMxKIR4r+oyLLOOfcex20dVO+M6Y4bD2FgX0zPWn?=
 =?us-ascii?Q?3b7CjGQhllKvV8phO0smPP0NJW+ujvomlVf5BNsi2xWStfB8KtuMeXSTHjsb?=
 =?us-ascii?Q?a5p1p8By5layEaI1U/7ZeiMIsnQpPTyUeMKio9sRa8x6NelhqnWk+IHiJolF?=
 =?us-ascii?Q?KDLFMp1NQAynxQMptUmj9p6GcYuzsEveLjbLnVezu+eJVMGdzDWESH4fpDRm?=
 =?us-ascii?Q?Fr2xPtJab0krRCS2LeZRV7HfHlT7sRtu9f6UvIcGEQQsE9d5XXe3DfirCjxI?=
 =?us-ascii?Q?TKidpaE0ia3rHToICdPyQmdrspo15jm46QDZP2F7ViqzatNzC9OoBdr/btCM?=
 =?us-ascii?Q?zEa9HYa0s+R6xq6OHbMo5rDprh/NHjhepAMjQ8x8aoApSZy/38G1hx//bIMJ?=
 =?us-ascii?Q?H3GbMThn5mKqmwxblzeuHo9knBeNpZ1Ws3s3c+8keFoSgpG3iV7pSJYJFZfy?=
 =?us-ascii?Q?je0FeBcJ1XEiG/hkkugYRHNuAeKlo9qOSXP976aZWeGF8eEOQaQ06S6rT/V3?=
 =?us-ascii?Q?Zl2iC2atmCkhL40VrDbFrNoZky0g8tq4BmM5MPkfs4wA8CSKz0S4oo+qBcpc?=
 =?us-ascii?Q?IkZ/O1rytr09XreI+WZ+nl0bNzzRFR/iUBFynAwzqdY0lY6u1Y+f6vPw+qkn?=
 =?us-ascii?Q?Dw/K7FJXnOtdRUBcAjiSea6uIUN8NubF1eyk6iQD8dF8O7Ua4KeAA18PHdOX?=
 =?us-ascii?Q?Q+6rvoPKq7ihjIcwG4UUml0cMKbtmrvgC+Qmd4I3Bx2lBZ9jkzdCDw9lfgqu?=
 =?us-ascii?Q?Zf5vVOec5/iQRumMB8hITAskbT3x3VBcjRxUuk8x7RCPG6deP/cp54ExT1EV?=
 =?us-ascii?Q?tdOrtoxFI4c=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: eldorado.org.br
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CPXPR80MB5224.lamprd80.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ba40e76-4f8b-4304-da99-08d99581faaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2021 17:32:53.7987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b9397c69-e827-4afc-a365-ab275e41638f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cjxb48@eldorado.org.br
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CP2PR80MB3924
Received-SPF: pass client-ip=40.107.82.120;
 envelope-from=luis.pires@eldorado.org.br;
 helo=NAM01-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_05=-0.5, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Cc: "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/optimize.c | 37 +++++++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 16 deletions(-)

Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>

--
Luis Pires
Instituto de Pesquisas ELDORADO
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

