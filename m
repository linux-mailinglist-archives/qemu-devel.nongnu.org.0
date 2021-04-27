Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BB736BD2D
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 04:14:05 +0200 (CEST)
Received: from localhost ([::1]:59426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbDEj-0005hx-20
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 22:14:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lbDCp-00058z-En
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 22:12:09 -0400
Received: from esa.hc3962-90.iphmx.com ([216.71.142.165]:16480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1lbDCk-0007Gq-Mv
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 22:12:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
 t=1619489522; x=1620094322;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WBYREzyy+bMmD5F7aW2tVixxyBPfmQX89HYbt23Y/aY=;
 b=kobNlph1x1QHDVfvI8fh1GNxrZ9k9w6sRoeASXJeKSNjOg/4fZ9aaCZS
 w70Bw2NsGK3KNm+lRR3ASGxLZuFm9cUpA1VrBjx3RVTDLPXbAcegGrMEf
 XvmFnH82ITIygnw+8oS5NcQbMVDXCGaQv4yZp8YEij37zTRoNBLTIx5WP I=;
IronPort-SDR: pHLfRcl2az5ynNaPQfYP6TxjIWQ0Z/Tmtwb9Xi/xfKSmTUsLUiu8ZbXa5E0qv+g9zziYdWHsvA
 IkGYCcquTgVIO+8V+mW6FTbN6H47QASPn6qRlb3NJOGkubiKeUg/cmboM6TjDsa64b5OCrnz+4
 UOIqHZA+Lg7s6EmbHhrWXkD5waNa7uKXyxhTizqSGU85OkjVtL49FsOZ+1q3ZET09IggCuA+rZ
 2JceuoGe1WWVEcRtP6KZGXtVXndK2QxCJkp4xT8wFVMCH8TJkDvBrKJvlTO0aUYUjOOX7bmqj4
 5cg=
X-IronPort-RemoteIP: 104.47.56.170
X-IronPort-MID: 23922
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
Received: from mail-co1nam11lp2170.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.170])
 by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2021 02:11:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwdoEAc0o3bxEb3pHP2omFKgFlnYnNKIe8F7p/84VSv0vxVqIzyLBIdi8TTbrbZZu0tRuHy8w4hyTg+4yRMF/6wbMqTKin+kI9kFPfXdEmVP4S8nu6vz+I+QV3xmeAf2cI0zrYbP6NbhkpvSUfwcMPLisR+zfO0t9Qn4QAuX3XELBDvcnc1chLlxO4+fH00kULfBGK2kluwbCDcrmwswyh2B6bTXziDFsb8RoRr7W24VYq/UvOjqUjI9UaKVpDxjOJd2sCLronEjFparAXX8l3cxFp7dgzB0vQc2lAB89WK5iB/7FOJwT74q7UwOUfVy89cNk6sPBPlB6MeT4m2h/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=puuP8qut8aYqNlmq0vMK86TvHAg8Q+Lhq6JcpDv0GY4=;
 b=HiWsUfNsHwhfstoIPGrb6RoNAhLSdSz9j5HV/0ViwPBP26OeVGXxXIpLw+z1XbB6XC7JR6erupbC2TRiVt76vfOszh9Sm2QMxLXlVsTyGDn5CZKPSTNcfnmlYrLQBdgw/42oOJkHFrPNCv73vb7T3JyGGJE49P2uT+dGJ4Hs23L8uWqexQxpHsVvaxNY+v9VokFdAgMHLFEheu0cDe6Axyh7aO0S7WpSPCFSh6w5TbU85lID3PTCF204VARB0Wlzlo9VOzfs9YTQCuSibmNbxxNQNTeSH46p9qGX5nCAqFmvwN1eJd0WZXp0+yAD0syELmgcMO9UNKlQl//8+IY4Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from BYAPR02MB4886.namprd02.prod.outlook.com (2603:10b6:a03:46::32)
 by BYAPR02MB4248.namprd02.prod.outlook.com (2603:10b6:a02:fe::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Tue, 27 Apr
 2021 02:11:58 +0000
Received: from BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608]) by BYAPR02MB4886.namprd02.prod.outlook.com
 ([fe80::859:d735:9964:608%6]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 02:11:58 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: Alessandro Di Federico <ale.qemu@rev.ng>, "qemu-devel@nongnu.org"
 <qemu-devel@nongnu.org>
Subject: RE: [PATCH v3 09/12] target/hexagon: import lexer for idef-parser
Thread-Topic: [PATCH v3 09/12] target/hexagon: import lexer for idef-parser
Thread-Index: AQHXJXJrjWvkxo4xfUKH7cE72vWcharHyagw
Date: Tue, 27 Apr 2021 02:11:58 +0000
Message-ID: <BYAPR02MB488623DCA2A3E942BE196E4EDE419@BYAPR02MB4886.namprd02.prod.outlook.com>
References: <20210330143750.3037824-1-ale.qemu@rev.ng>
 <20210330143750.3037824-10-ale.qemu@rev.ng>
In-Reply-To: <20210330143750.3037824-10-ale.qemu@rev.ng>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: rev.ng; dkim=none (message not signed)
 header.d=none;rev.ng; dmarc=none action=none header.from=quicinc.com;
x-originating-ip: [70.115.140.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81ad048e-abe2-4b6c-204c-08d90921d669
x-ms-traffictypediagnostic: BYAPR02MB4248:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR02MB4248FFA5055FB4D9B5AE49EFDE419@BYAPR02MB4248.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0fdTMujg4Z+DCTMoMupwVzRFg8lNuyrGiJSjjRODKjzlhHB+sV+g9c8hySo+4S6Q41HSIakQOGCs6j77uGRB1yBd+QK40LPS/NLr+1RAXSnQCmR0D8cVb9bTLPY0e0XqnfSj2nUlDq+s/eweexKVAPK2RhlUtIMqG8v+ZZ1LgPEypL01VlADx1cq5VFh85ShQtkTUc0r0QrruPE5p1jgcIiMV75cLCWTVLakj6ahcZePsPBsO3hs0mEqswGybDQeXZArJm3yxB8nDEIN77BJxz/2n5XaS1qlVc6oAFIUl/yGEsil5aWyLeSRuZfo5ylXUD5D5KK2A3MEfy+PuY9Q3CXsx9Wp/Biw/pKRl87rY2OZP8xw7XwcSRPwkjZSeoRRkGirc5vCkBie1Gdb49FHmr/iOTb4crgIddtUDlW1UOg7nsUK5GHFIoyAnq+2b2dOqeyZkcgAFSf7GVU19ypdno95H1WK+l3+Dduxzzwc4Fv20DvftwJzcEpYPdgwrRmWoHsollTGb7T56Lk8WJMQejjFqLb3fCUBlFJE1mMboE9YO8gM2K2TUl00RPYETE2W/xFQyaSyjg3QPXvuR8b6lXRQXBgXuzdD4y/uhOjEFD8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR02MB4886.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(366004)(396003)(136003)(8936002)(38100700002)(122000001)(54906003)(52536014)(86362001)(53546011)(5660300002)(26005)(66446008)(66476007)(64756008)(4326008)(71200400001)(33656002)(6506007)(76116006)(66556008)(110136005)(9686003)(186003)(55016002)(316002)(8676002)(7696005)(2906002)(478600001)(83380400001)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?HaI1dXxP3jOdik55l6AQfzYHi0Dtq8VeYkIoG7rSvpxobWnpWTbdzVag3E9n?=
 =?us-ascii?Q?x3krtvI9ChjWRbQmfNkbMR37cDsYD7W/JCJPjf12cbOUOhibVAZLXk2HWetV?=
 =?us-ascii?Q?3N/l7ugKiBwYTuVqoqtp/C6komVG+UEMS6XBCEV/y2WfxGBQdjNiScaIRW3r?=
 =?us-ascii?Q?XaiX5HFy5wZZu16V6Nu2fHdadWqlFAgmAQJScWe5EoQKtj+KpdnNkJa9kFkt?=
 =?us-ascii?Q?BP0JV3aMbij8nLyCTATKzYmFPVQGoCTaeM3XXD3CpwR7+cxIkmigkVqMgPZ+?=
 =?us-ascii?Q?mX2B1mfFimMzkHuVtsjvQ9KFmMEXUQ9PIITDxlj2T2RguBFLT3pwwHgPEaUS?=
 =?us-ascii?Q?1venmJFngi0fnXNovg0xIhYMyVTyeuX0etL54kc16FI2HhU0q01PcoFahIF0?=
 =?us-ascii?Q?oBeLmlsXO8eKeBB32mcIBdCi3xS8QPD6kGh1Yjo+U4RdHJvw2mo9wIzPnaCC?=
 =?us-ascii?Q?rZqWkKI21vmc8XRm3jl/gp+dlvCSCSH2YVDaTDAHokWX93fqmBBpVrIUVlcB?=
 =?us-ascii?Q?HsTxud2mx7clL2GUoOtPmti5CP2GczNIyPxFYDciuFulXLyOje0lvaIIWZnO?=
 =?us-ascii?Q?L70f2onmhoud56HBzznQy6q9q2prtJ+CZqHUJ6cZY8JCmACIEuss+7l5Gezy?=
 =?us-ascii?Q?CX+6p+FOfLq+YPxrYVCOq0JjLzN9mWlZZYL8IHPsCW/FrZtziT0OqmpRQ7fY?=
 =?us-ascii?Q?13yJ/CWObq+x37oV6knQVwUlkqvCCSl2bmUKYxoW9KKZjhHgdTnDyNsEJvQc?=
 =?us-ascii?Q?Z2DFEcivz7ObVeng0QzXu+SCtgjvnTrKqSJ/Hq+IQmIWC0F+UPBbzUELY0Zc?=
 =?us-ascii?Q?pmM5KkK5SX5+Pvk0j/2A8S51R6m7J4x0xMj2FnplprBE2U+QlKh9XzMtQ5+a?=
 =?us-ascii?Q?m0Q8MhRNGkzUm7pOtXuFZAS5o9SLjhtkq2qc9/vNUaaxYhQqCmOS7lJ1lClS?=
 =?us-ascii?Q?hup9i9BMYtFsj6wcy5pTye1osME+Z7if3KljwIjwHZOpf8HZgX/SIdINgWfS?=
 =?us-ascii?Q?wc/X7uWQh2z4InwS2IoFgkmmmxstcUunJVipyBb+PUv9KF7sY9eqiZNlktQh?=
 =?us-ascii?Q?t537nTxwb0qiwEUX4rz8iNN4W5xbOO0vHk7zsOL1yHh2m+D5g2aEzCZ2Sd1s?=
 =?us-ascii?Q?/vGFe3MFyLQe/Frv/hZQ2ZSNCFlU8ekjaL2h433LX4msByVA02U/OnlrnNPI?=
 =?us-ascii?Q?anJhnQmzyM1bMxPX174Fb+dSzezK0ml/IgPr1jqjV31qfOcmPLTZnzSit/ug?=
 =?us-ascii?Q?1VkKFvFgRSNxRYsW6ycrE3rUFikjU7hN8yJQhES8zGRtJUGDZJkcyuKASWS6?=
 =?us-ascii?Q?v0WhPr50gIgrbit5iOuOBSnQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR02MB4886.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ad048e-abe2-4b6c-204c-08d90921d669
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2021 02:11:58.4201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qkO+ZoTeboNWnWB3H2nYn/iZ83hnC11YiYw/OozWXnImcTSF02F0qJJfiYQsR3LRYyCQ7ERSSHj+N5PdDTkTBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4248
Received-SPF: pass client-ip=216.71.142.165; envelope-from=tsimpson@quicinc.com;
 helo=esa.hc3962-90.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Cc: Alessandro Di Federico <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "babush@rev.ng" <babush@rev.ng>, "nizzo@rev.ng" <nizzo@rev.ng>,
 "philmd@redhat.com" <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> -----Original Message-----
> From: Alessandro Di Federico <ale.qemu@rev.ng>
> Sent: Tuesday, March 30, 2021 9:38 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; babush@rev.ng; nizzo@rev.ng; philmd@redhat.com;
> richard.henderson@linaro.org; Alessandro Di Federico <ale@rev.ng>
> Subject: [PATCH v3 09/12] target/hexagon: import lexer for idef-parser
>=20

> +"fLSBNEW(P"{LOWER_PRE}"N)" { yylval->rvalue.type =3D PREDICATE;
> +                           yylval->rvalue.pre.id =3D yytext[9];
> +                           yylval->rvalue.bit_width =3D 32;
> +                           yylval->rvalue.is_dotnew =3D true;
> +                           return PRE; }
> +"fLSBNEW0"               { yylval->rvalue.type =3D PREDICATE;
> +                           yylval->rvalue.pre.id =3D '0';
> +                           yylval->rvalue.bit_width =3D 32;
> +                           yylval->rvalue.is_dotnew =3D true;
> +                           return PRE; }
> +"fLSBNEW1"               { yylval->rvalue.type =3D PREDICATE;
> +                           yylval->rvalue.pre.id =3D '1';
> +                           yylval->rvalue.bit_width =3D 32;
> +                           yylval->rvalue.is_dotnew =3D true;
> +                           return PRE; }
> +"fLSBNEW1NOT"            { yylval->rvalue.type =3D PREDICATE;
> +                           yylval->rvalue.pre.id =3D '1';
> +                           yylval->rvalue.bit_width =3D 32;
> +                           yylval->rvalue.is_dotnew =3D true;
> +                           return PRE; }

These represent the least significant bit of the operand.  Perhaps you shou=
ld set the bit_width to 1?  Or do tcg_gen_andi_tl(..., 1)?

Thanks,
Taylor


