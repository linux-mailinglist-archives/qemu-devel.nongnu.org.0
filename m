Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AB95A65A1
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 15:53:25 +0200 (CEST)
Received: from localhost ([::1]:48740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT1gC-0001B7-EU
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 09:53:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=234d5777c=ross.lagerwall@citrix.com>)
 id 1oT1eX-0007ey-N8
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 09:51:41 -0400
Received: from esa3.hc3370-68.iphmx.com ([216.71.145.155]:24273)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=234d5777c=ross.lagerwall@citrix.com>)
 id 1oT1eU-0008D4-5H
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 09:51:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1661867498;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9RoClZ9fUPxx1mo6CGMNlf4dqyNre/p3NrplV+IptmQ=;
 b=eCNjx006cGFs3WOf0fHFTu4ePhlS8+ntN8xjoWxtcdKF4MtrJfzgNLfC
 dvJpkH3YvLX9X+Jx+4UBDq08FIlmJkImgEEXb/qTizfMbRL2ARKHiKb8k
 rbfaFeNpdI2lAYvHyhx5VBJlWwJl4QxTj3JiYOo2Z59nPn8dpPey15wZX 4=;
X-IronPort-RemoteIP: 104.47.57.177
X-IronPort-MID: 79382678
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:/t/KE6MgGzOx8DbvrR2HlsFynXyQoLVcMsEvi/4bfWQNrUoihWYOy
 WoYC2iFP/vcN2DzeNx/a4vj8BgH75bczYQyHgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMu/nb8EkHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPT0fBHARssMLY+889REF1E3
 tpJNAECO0Xra+KemNpXS8FKr+F6dYzHGd1avXttizbEEfwhXJbPBb3Q4sNV1ysxgcYIGuvCY
 80eanxkaxGojx9nYw9LTs5h2rr3wCCgLFW0q3rMzUYzy3LU1xc31LHiPcDKc9iObc5UglyZt
 iTN+GGR7hQya43EmWDbrSLEaunngBPfH65PHvqB7PM6sWbKgU8zCjczSg7uyRW+ogvkMz5FE
 GQP5icgpK443EiqSMTtGRyypTiPuRt0c8FMHuMz7gulzqvS/hbfGG4JUnhAYtlgv8gzLRQz2
 1qU2t/kGzFrmLuST32b6/GTtzzaBMQOBWoLZCtBQQ5b5dDm+dg3lkiWEYklF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9XABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:YNDvBajmhsLxUT3O9PfrD65lHnBQX3Z13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03IwerwQ5VpQRvnhP1ICPoqTM2ftW7dySaVxeBZnMHfKljbdxEWmdQtsp
 uIH5IeNDS0NykDsS+Y2nj1Lz9D+qjgzEnAv463oBlQpENRGthdBmxCe2Sm+zhNNW177O0CZf
 +hD6R8xwaISDAyVICWF3MFV+/Mq5ngj5T9eyMLABYh9U2nkS6owKSSKWnX4j4uFxd0hZsy+2
 nMlAL0oo+5teug9xPa32jPq7xLhdrazMdZDsDksLlVFtyssHfpWG1SYczBgNkHmpDr1L/sqq
 iJn/4UBbUx15oWRBDznfKi4Xin7N9k0Q6e9bbRuwqenSW+fkN0NyMJv/MmTvPUhnBQw+1Uwe
 ZF2XmUuIFQCg6FlCPh58LQXxUvjUasp2E++NRjxkC3fLFuH4O5l7Zvin99AdMFBmb3+YonGO
 5hAIXV4+tXa0qTazTcsnN0yNKhU3wvFlPeK3Jy8fC9wnxThjR03kEYzMsQkjMJ8488UYBN46
 DBPr5znL9DQ8cKZeZ2BfsHQ8GwFmvRKCi8eF66MBDiDuUKKnjNo5n47PE84/yrYoUByN8olJ
 HIQDpjxBoPkoLVeLizNbFwg2DwqT+GLEXQI+lllutEk6y5Qqb3OiueT11rm9e8opwkc7/mZ8
 o=
X-IronPort-AV: E=Sophos;i="5.93,275,1654574400"; d="scan'208";a="79382678"
Received: from mail-dm6nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Aug 2022 09:51:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVL3sFcGjIwXl//9NYrDdLXI7YBo59gAzbPWkJoE7ZyAfRSxGl84XksmCtgpZTqfX2cjvt4lFYIDCdVtzVkJegyoQEJ9GE6djC9fokA48IUHD9qkw4EiRnUzIw11O4/iQw4ZPGMkceqNb2OyE2SeMYCZ5RI6Zx//HJT+DHIPbE79GZsVmlp38dTPmFd7UTvZx8W+1Fad5hJxpsP8D080CvapfJ3AffrhILkuGlmov3w4D3+LUWZV1pbLE7vCbmyb+w58qCgSvG3dp7Gdi6hwYH4Xgwbyo/ePG/uVOEQe/N7/plfQsynklq2Mfrbf7K89B7MzONPiUF6DQaQqwIyQ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RoClZ9fUPxx1mo6CGMNlf4dqyNre/p3NrplV+IptmQ=;
 b=iyP98EKkkpiD55+8/8TR43FBHTjGxrwOyTl3LUwfdr8KJ4EspJvZC2dnX0sgNmA/4WjSeXsZWOA+4bPvbZPL3uMDbyXQtN51Jk/Gsx5U/IL7hsRV1KMmoXhF/SE14BWxVcvyoEJoVGRR/YXkNYiSO3mnryy2e7WAJkEM6awDnbUr5Eh8bjJKoxmEAFF3KtmH/yqI/f+UXRvdr8PoYrhe8xvPwgGu5Zu0O2DbUtlYz+ffc3AVhZQxapLPjcKM04+riBf3IAWJFDTj+JpW4vdLD/KY4Jwq68rgogIB6cZrTRkbOfZiqJbPS64vlNhxlCbwTMgTe5DNtqYBcOMLXICZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RoClZ9fUPxx1mo6CGMNlf4dqyNre/p3NrplV+IptmQ=;
 b=pb34c2Nb1dOQSRptCB0YPlH/yqW7Qvim9EAGT7WCqKdFZR5wfK3GRWO2PwD4OE4cAJWzO9UvsnLqMvIcryDy2qRHj6NNd0JoCs3Y4jRWIrYsedMn7KxPSIlbK/jdUNItCSW2I1Dww881r4rpa+87OOtOhYLjPYYqp5iEVFopUdU=
Received: from SJ0PR03MB6374.namprd03.prod.outlook.com (2603:10b6:a03:390::7)
 by SJ0PR03MB6392.namprd03.prod.outlook.com (2603:10b6:a03:397::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.23; Tue, 30 Aug
 2022 13:51:21 +0000
Received: from SJ0PR03MB6374.namprd03.prod.outlook.com
 ([fe80::d8d0:bdac:7575:616b]) by SJ0PR03MB6374.namprd03.prod.outlook.com
 ([fe80::d8d0:bdac:7575:616b%5]) with mapi id 15.20.5566.016; Tue, 30 Aug 2022
 13:51:21 +0000
From: Ross Lagerwall <ross.lagerwall@citrix.com>
To: Stefan Berger <stefanb@linux.ibm.com>, Stefan Berger
 <stefanb@linux.vnet.ibm.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH] tpm_crb: Avoid backend startup just before shutdown under
 Xen
Thread-Topic: [PATCH] tpm_crb: Avoid backend startup just before shutdown
 under Xen
Thread-Index: AQHYuVmn+tY4+kEOKUSKeD1m2sVnla3BTCcAgAAI9zeAAAmagIAGG7aI
Date: Tue, 30 Aug 2022 13:51:21 +0000
Message-ID: <SJ0PR03MB6374B091035E9A19B7A1E7B6F0799@SJ0PR03MB6374.namprd03.prod.outlook.com>
References: <20220826143841.1515326-1-ross.lagerwall@citrix.com>
 <12d8f3b7-ae22-73c9-c0ab-eca403f421bb@linux.ibm.com>
 <PH0PR03MB6382266A55B2CDB9745015D5F0759@PH0PR03MB6382.namprd03.prod.outlook.com>
 <b27f4f82-87a6-c181-8fae-730e747ac14d@linux.ibm.com>
In-Reply-To: <b27f4f82-87a6-c181-8fae-730e747ac14d@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f562b327-ba7e-47e0-ffda-08da8a8eb870
x-ms-traffictypediagnostic: SJ0PR03MB6392:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 00vZMQCnEjBf7O78toKJ3uq3B7GiamZc/kqcSErvWpyLHMnpV2pihUkFjMX1NdxF2DrsgoQmsBQ0g1S8EPxhGvIdx6zi1XRqgw8hM7i5LePLsN1V2B8Gupc7oMlgokN+k1iBdiWcJCIwHIkJCmtg0JUZrRhdc0g3I8S8j/+QDZhlM+R0TvKHt0/XvQSrQtEKrSFZcHKHkMGfXATAEPECbjQESYfZ1jux1IspXeGrhLQZdGrvHsrf6pXdH8MrrJXavyZJ0oR7H65WncqFLVAjPIt71cLL9Lp6q1/VdrGdibYblzCdMG5aeQe6MdQm1ghUZIGHPVNZNbZATJH24QcV6zHg0YrYXcgTPS9uWTTWxl48wwGxZKyqAGmk3iaUzlqZIMTJQXp5f1KibR7Od+M+nAhflWCphsQHQkhPFojkv8H4KqSLeOnyd5ouGB6BhxYoW28LDD1v/Sa/pZBwH1ScUNE9gDKIGtHhJjxWQKGg1blD+O65rPax7htTR7T8EhRkYx+fTqMJIHLIoXnaLujTZDKZ5Bbjc/6KLLJsEACNZD+CLdqRgt1LhE54TVbCEO2B5qNM0x6DDtVkUgECzyf/hSziGWX8F3++tl4+xihdmh4xn+8YT7Wg8nlxdNW5o5Rrtj7Vdql2DztTG1nrSda3ZuDRFeNbyLCDWj80wZY9eJkJLwMFVRZ4kpjfT4yHZuxUwoLfzMPlheoR4p2pAdTBf7+RumhXy8WoIUEv5dr1Hd5wBIeOoaMxK6ohAnFzRZmSYFEgE52Grta1GjQMEr+I/A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR03MB6374.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(4326008)(66446008)(9686003)(64756008)(8676002)(66476007)(7696005)(5660300002)(66556008)(76116006)(2906002)(53546011)(91956017)(71200400001)(52536014)(41300700001)(8936002)(478600001)(26005)(186003)(55016003)(66946007)(6506007)(82960400001)(86362001)(83380400001)(44832011)(33656002)(316002)(122000001)(38070700005)(110136005)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?P+uSqbB7qP1uXN6lLiM5HuXHWeTkk7qoCsJZAMeCsjz8/Teg01rlXMNZxt?=
 =?iso-8859-1?Q?8su/KBl+jR77oHDY9NjfEitgZEaYPPIGgn0c7mr8gJCjLgINQLnl4ilFF8?=
 =?iso-8859-1?Q?7ajPPH17nb2WYT6foaKGLXW/sRmynleuvUikZertCW5j/Z9dLz5dQfFanm?=
 =?iso-8859-1?Q?6x6DVw3wDJ/pRHngrYCgYDXliDnm2xnplQcKnSe/X/NNk/0CggH0R1gqxC?=
 =?iso-8859-1?Q?+2dMq6TLPxIcrAtrReE1cE4ojEuFXlEkqONZHdLdsYIgQw3Y34oEQe/fey?=
 =?iso-8859-1?Q?cOBD8YX43JUetOHNFAsHWQLTByBfNAZBn3SgKe5Ua86KJ/sDpgFz8/cdyn?=
 =?iso-8859-1?Q?9qu+o+YGMihCsmhZWrK3g/DCWL5K9qFPhoHOA5ubZkUatXu1xz3bHGjdFZ?=
 =?iso-8859-1?Q?Ze9Dzu40clb7foFqBeuVgIBrGe3xxxZ+pb6X+IoSYDwhJqfCEumQzEnRS3?=
 =?iso-8859-1?Q?TJDPlXA+8ayVWL9sfnQoyGOSgKKPhtQk2jpsctNeqfbfUbcm7daodEgzVB?=
 =?iso-8859-1?Q?oKiQ8wIDvoYZkvXX8fgzN4YHMROsnl7WSg02nAimMFreEjoVyxFlDOHx7C?=
 =?iso-8859-1?Q?LMUIwkWF6iuXd8xDuVDzfiTBfxL2HhxCDvNZivO2nttYXy+Cve8b+aGJIa?=
 =?iso-8859-1?Q?Oi+Ab71JQnDibeT4itP/YTI4Ntuj/RntHJm4qcqK57pXIsxGo0D/xFqXLH?=
 =?iso-8859-1?Q?W9AcZU7JFxHI+FCCQwMxH+d+cvBY7fV6N9LJAKvCiFYyqxDqs2TXSENJLb?=
 =?iso-8859-1?Q?Z6dQEBXz10On1KrHpCaNJUTKz8cEOFqbZqYpOsielinUTUdoDqICD8BtUt?=
 =?iso-8859-1?Q?K3Hntj7EBFyUU6JtvEJg3VtvGD9Yz/eiUEM5Jn+PCJKWWsz6PB3h6iD2/7?=
 =?iso-8859-1?Q?OS4CLlT6voi/clA9o/VrqBgTpbtpiqvPxs7cPf1wEASc5XU8fdBCWC4pVv?=
 =?iso-8859-1?Q?Ear30iNLiZtcLOz6sPvhHuSnduj2Y9buz551wchAnEB0NZDQdHm8ZWpfBL?=
 =?iso-8859-1?Q?Mgo32f2PM+I3LYLCqhRALq98iaXLN/mNloJwSt1fJME1Vehj+PRYuChPic?=
 =?iso-8859-1?Q?vH1Jz1LRemN96RtfH6qUTKKi8d5k4/nYr6+zL0BlUuRyyZ2H1ignU80B5I?=
 =?iso-8859-1?Q?MdyzC7Q/kQHephBypBAND585RV2trr2824+x3Ov3+i/aHgGmhuFA3yhsPr?=
 =?iso-8859-1?Q?LOcHkO0NlfXyIvUU8QrokR4EEL66JTMBK3dWw9CaliLiVwIxQYonOrq5la?=
 =?iso-8859-1?Q?eXW/Ws1x2VPg7e28gf+VjXyeVwKBYfbVoqgR3PfmBmA8EpPAhmRxSZiOfV?=
 =?iso-8859-1?Q?t9mDdLnDPWvMxZ2uKHncFz12Y2rxr4pG/LBgGOyFCwl0q9JI5UhC31jaGd?=
 =?iso-8859-1?Q?qeOKKyv6BXKbmbbm8w9kxdz/Sp61bUpZNO7spE9lMh9eQ1fu2115D6/Fyz?=
 =?iso-8859-1?Q?Pl1TeCevar/Btkb8zcTBFg1RWeiaEN8l2SAsZnmqF7bM13vwqZLoaNXLcJ?=
 =?iso-8859-1?Q?L4YYMUxGB2818DlT3dVkN71wyC/bLURpZmS9giAb93DPDyQ+e1npArIyMU?=
 =?iso-8859-1?Q?YZ8FRqfVcEgt7UwgaypPiE1RubneIEdISdZP9mGiuhmNJnVABUVXuzYkcE?=
 =?iso-8859-1?Q?i+7YxnQtdNUmIHTqM4gehCZKt6P5yVj3zp?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6374.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f562b327-ba7e-47e0-ffda-08da8a8eb870
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 13:51:21.0436 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hu02g23s5YhC0ABN6Oiq8xfZgU36suUoBCpoGn1ukEKj7Jflvm1uDFaNqEWRvC6ntrseXoG3DSAnUITDyccze7q/2oV7grdMAdDagVW09N0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6392
Received-SPF: pass client-ip=216.71.145.155;
 envelope-from=prvs=234d5777c=ross.lagerwall@citrix.com;
 helo=esa3.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

> From: Stefan Berger <stefanb@linux.ibm.com>=0A=
> Sent: Friday, August 26, 2022 5:27 PM=0A=
> To: Ross Lagerwall <ross.lagerwall@citrix.com>; Stefan Berger <stefanb@li=
nux.vnet.ibm.com>=0A=
> Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>=0A=
> Subject: Re: [PATCH] tpm_crb: Avoid backend startup just before shutdown =
under Xen =0A=
> =A0=0A=
> On 8/26/22 12:15, Ross Lagerwall wrote:=0A=
> >> From: Stefan Berger <stefanb@linux.ibm.com>=0A=
> >> Sent: Friday, August 26, 2022 4:20 PM=0A=
> >> To: Ross Lagerwall <ross.lagerwall@citrix.com>; Stefan Berger <stefanb=
@linux.vnet.ibm.com>=0A=
> >> Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>=0A=
> >> Subject: Re: [PATCH] tpm_crb: Avoid backend startup just before shutdo=
wn under Xen=0A=
> >>=A0=A0 =0A=
> >> On 8/26/22 10:38, Ross Lagerwall wrote:=0A=
> >>> When running under Xen and the guest reboots, it boots into a new dom=
ain=0A=
> >>> with a new QEMU process (and a new swtpm process if using the emulato=
r=0A=
> >>> backend). The existing reset function is triggered just before the ol=
d=0A=
> >>> QEMU process exists which causes QEMU to startup the TPM backend and=
=0A=
> >>> then immediately shut it down. This is probably harmless but when usi=
ng=0A=
> >>> the emulated backend, it wastes CPU and IO time reloading state, etc.=
=0A=
> >>>=0A=
> >>> Fix this by calling the reset function directly from realize() when=
=0A=
> >>> running under Xen. During a reboot, this will be called by the QEMU=
=0A=
> >>> process for the new domain.=0A=
> >>>=0A=
> >>> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>=0A=
> >>> ---=0A=
> >>>=0A=
> >>> This conditional logic is ugly. Is there a cleaner way of doing this?=
=0A=
> >>>=0A=
> >>>=A0 =A0=A0 hw/tpm/tpm_crb.c | 7 ++++++-=0A=
> >>>=A0 =A0=A0 1 file changed, 6 insertions(+), 1 deletion(-)=0A=
> >>>=0A=
> >>> diff --git a/hw/tpm/tpm_crb.c b/hw/tpm/tpm_crb.c=0A=
> >>> index 67db594c48..ea930da545 100644=0A=
> >>> --- a/hw/tpm/tpm_crb.c=0A=
> >>> +++ b/hw/tpm/tpm_crb.c=0A=
> >>> @@ -26,6 +26,7 @@=0A=
> >>>=A0 =A0=A0 #include "sysemu/tpm_backend.h"=0A=
> >>>=A0 =A0=A0 #include "sysemu/tpm_util.h"=0A=
> >>>=A0 =A0=A0 #include "sysemu/reset.h"=0A=
> >>> +#include "sysemu/xen.h"=0A=
> >>>=A0 =A0=A0 #include "tpm_prop.h"=0A=
> >>>=A0 =A0=A0 #include "tpm_ppi.h"=0A=
> >>>=A0 =A0=A0 #include "trace.h"=0A=
> >>> @@ -308,7 +309,11 @@ static void tpm_crb_realize(DeviceState *dev, Er=
ror **errp)=0A=
> >>>=A0 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 TPM_PPI_ADDR_BASE, OBJECT(s));=0A=
> >>>=A0 =A0=A0=A0=A0=A0=A0 }=0A=
> >>>=0A=
> >>> -=A0=A0=A0 qemu_register_reset(tpm_crb_reset, dev);=0A=
> >>> +=A0=A0=A0 if (xen_enabled()) {=0A=
> >>> +=A0=A0=A0=A0=A0=A0=A0 tpm_crb_reset(dev);=0A=
> >>> +=A0=A0=A0 } else {=0A=
> >>> +=A0=A0=A0=A0=A0=A0=A0 qemu_register_reset(tpm_crb_reset, dev);=0A=
> >>> +=A0=A0=A0 }=0A=
> >>>=A0 =A0=A0 }=0A=
> >>>=0A=
> >>>=A0 =A0=A0 static void tpm_crb_class_init(ObjectClass *klass, void *da=
ta)=0A=
> >>=0A=
> >> This doesn't look right also for Xen. Shouldn't it be something like t=
his?=0A=
> >>=0A=
> >>=A0 =A0=A0=A0=A0 qemu_register_reset(tpm_crb_reset, dev);=0A=
> >>=A0 =A0=A0=A0=A0 if (xen_enabled()) {=0A=
> >>=A0 =A0=A0=A0=A0=A0=A0=A0 tpm_crb_reset(dev);=0A=
> >>=A0 =A0=A0=A0=A0 }=0A=
> >>=0A=
> >>=0A=
> >> We need the reset callback for VM reset.=0A=
> > =0A=
> > This patch doesn't change anything for the QEMU/KVM case which works=0A=
> > fine as is.=0A=
> > =0A=
> > In the Xen architecture, the guest is rebooted into a new domain which=
=0A=
> > has new instances of QEMU and swtpm. The old instances are terminated.=
=0A=
> > So during a guest reboot it doesn't make sense to have the QEMU for the=
=0A=
> > old domain call tpm_crb_reset() just as it is about to exit since it=0A=
> > causes swtpm to be sent CMD_INIT which causes it to needlessly=0A=
> > reinitialize and reload the state. Instead, the new QEMU instance=0A=
> > post-reboot will call tpm_crb_reset() to start the backend directly fro=
m=0A=
> > the realize() function, just as for the initial guest boot.=0A=
> =0A=
> =0A=
> You should probably add this to the commit text because I wouldn't have =
=0A=
> known that a VM reset in Xen causes a new domain to be created...=0A=
=0A=
Hi Stefan,=0A=
=0A=
This is already included at the start of the commit message:=0A=
=0A=
"""=0A=
When running under Xen and the guest reboots, it boots into a new domain=0A=
with a new QEMU process (and a new swtpm process if using the emulator=0A=
backend).=0A=
"""=0A=
=0A=
Ignoring the commit message, is the code change acceptable?=0A=
=0A=
Thanks,=0A=
Ross=

