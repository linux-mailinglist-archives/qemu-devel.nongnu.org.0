Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A80C2FE6CB
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 10:55:13 +0100 (CET)
Received: from localhost ([::1]:59412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2WgK-00019Y-Dm
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 04:55:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6485d9ad4=Niklas.Cassel@wdc.com>)
 id 1l2WfF-0000fj-Dg; Thu, 21 Jan 2021 04:54:05 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:63080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6485d9ad4=Niklas.Cassel@wdc.com>)
 id 1l2WfC-0006Pz-LR; Thu, 21 Jan 2021 04:54:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611222842; x=1642758842;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=d32FvcufdoJOzIGBfOqv+AaOCdXHWL9kiHapJ671X2Y=;
 b=mXAnSX3WH9Kk2xJS4TXlTNcWww3gQdZYu4vQe8Wy8H38wEYeGH1qM+/h
 kam3Ad68XEmJq9DrKInsH+P7UZW2/BX1KJq7yAdgSATnbFQatHg82jV0Z
 LvNNO5+1Qszj1/nwVTXXp8r4HpcnZnmRTehdSBtM+KnAAfF1OLcOWOuXf
 lov6JakLoAwQ2Q3g/s74WLrgn+1yXegJlEHg+tVBxuGGkqJV2KB4Bh14u
 h1c1TNdkVUkDnKLLXgOuiygxfF8gehll951UCar50T5fjl+CY4ulEiBO+
 NAxNbhiCw+pC4qziCkWlJAFl1k94GqAucemOjqdXHgq8Pz0GeLhZ4PBQ1 Q==;
IronPort-SDR: 70y6yzmvW/t9rBlKE9i4rUhgX5/aK+/IXG5bOow49t9uu24eDDEAKvQZtfnG2Kt8ZHI9erjeyq
 liJcS7M+O7P7RKfBnnmdBCCFqU4bGBhml/iOcCU24Ii3ftr/yrBd8NAhX2yobBxRghdPIb8gRR
 aktuunyC/CbLL4a9ybpVMZioajSGgYBajWba+EzsJnQT4JR75Xvq8IcURiQs1TRAa3Mtnyr7Bw
 XviaAbXOJ3RULeTzSBJixY93b7xxhZx2GESreWBlwFnS6tv7R3qx9esanbcxyjAHYrEKJatsIt
 zVQ=
X-IronPort-AV: E=Sophos;i="5.79,363,1602518400"; d="scan'208";a="157976319"
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hgst.iphmx.com with ESMTP; 21 Jan 2021 17:53:58 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8Sm6fjPU8umrJ9WFvbcMs5V1oqq22T+kHIGSaqWs8Mk5BgedrnWFY2Unu1Rr8iSfmILYJlYWfwYFk7Zkgotb78uEUbPE310IzwScySq9Bjz18LDDw5/eA5bfZikulQULTW+qfHhLc5vKQYGxRgYOiPXn/Trmqg4YVIUVSl754SZEF1vt6UDVLFvu/C/kkC+99J1EWgELbvf8GVOpKXb5p4Jz99nMf7EEZOzAQpbdmUJbVnmi1lGfJzipVdL/cHjsDFgZKLi7H6LdnVgGCLF77VFnzA556EFJGt0FTQx+W14woQb5YMmInEtyvp/YsZs6z7GX0w9P4JzJO4M4LOQmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ay+ZJl0w2s9wC1I6SrzPRCZDQ1C6nMmklkxkn+qIIww=;
 b=CxpkGVEGd+0Wt9l+5AwFrq1c+VJRWsqdNMLl78jJ1AvPMmf0QTvEGlP7DCZFCELzZmdrNO+k490s9fUNSJhCv6SGlZRQolck7IS5pmNL+pJ4Edvc/aTMS1cfNCBNAKmGifpnnnzhDKGJvq6LXJwL5HOOhpRqA1P15GkNYbZ/436Qzup2YJSFhXe1vWP3PrAXxujLobfrbyEPcLhjFr7zJVuiOPrBr+a7jSLxKjwB4AUjMCFx+oyzdvkK+A+pldlDEIsdtlDXAHWSJ3Evn3KhoT8l7/lRcSSbELMaf0bhEC5YUFM8Vl8+D3CxkHIy8gXc4gZ+6FNyudGusTMWnIT/8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ay+ZJl0w2s9wC1I6SrzPRCZDQ1C6nMmklkxkn+qIIww=;
 b=Amjr8Hs2Tz7maG8Oq1tGChtmvNaW9H2jfxGDM3rv+WmOQ3IOziSM1w57WlsbNUTLPG8fz/UHZaLDHYd44VtqDurRHf+mHcnmEqtMYwuydhKrrS55Yu4oGA+PpFbNoN6J4Yl2UjXx8gbBQyuytUiSEqM13f0LaFvmh+6srVfVNLs=
Received: from DM5PR04MB0684.namprd04.prod.outlook.com (2603:10b6:3:f3::20) by
 DM5PR04MB1226.namprd04.prod.outlook.com (2603:10b6:3:a4::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10; Thu, 21 Jan 2021 09:53:57 +0000
Received: from DM5PR04MB0684.namprd04.prod.outlook.com
 ([fe80::11d3:8b30:e11f:87e5]) by DM5PR04MB0684.namprd04.prod.outlook.com
 ([fe80::11d3:8b30:e11f:87e5%9]) with mapi id 15.20.3784.011; Thu, 21 Jan 2021
 09:53:56 +0000
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Minwoo Im <minwoo.im.dev@gmail.com>
Subject: Re: [RFC PATCH V3 8/8] hw/block/nvme: Add Identify Active Namespace
 ID List
Thread-Topic: [RFC PATCH V3 8/8] hw/block/nvme: Add Identify Active Namespace
 ID List
Thread-Index: AQHW7zWQMFdEKboD4kOu/J9IUmg3q6oxEE6AgADH8IA=
Date: Thu, 21 Jan 2021 09:53:56 +0000
Message-ID: <20210121095355.GB151328@localhost.localdomain>
References: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
 <20210119170147.19657-9-minwoo.im.dev@gmail.com>
 <20210120140718.GA130091@localhost.localdomain>
 <20210120215819.GA2645@localhost.localdomain>
In-Reply-To: <20210120215819.GA2645@localhost.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [85.226.244.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 97d5857d-02bf-448f-c51b-08d8bdf27826
x-ms-traffictypediagnostic: DM5PR04MB1226:
x-microsoft-antispam-prvs: <DM5PR04MB1226A973CE84DDB30E34976EF2A10@DM5PR04MB1226.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:2089;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uWk6Kcev3ug7zQpeuSSNBoqgh2+j5iPxrL4ynHFcpKVZfVUSCVI5CXKSbv7//9x+8Kb8KViZkavAP54mNIoX7g1osNp7jd0GdTX9RepHtOAfbEoxEJZNps7Ac8wsWV9lfDR03g56xHrnnbfznKR9gxcnAfwPRcVFGFT/m+tHJ0HuZEyWU8qMKAI7YTJ0trrrA6fXZF7RKqWwi/uu+SU2FCYtsmQEZ28d8uHj/m9mW9SSCkr4hnMP7Qjw0YrQYNd5GePMVjgqNBn7B3OE/UafUu0gAf1pH/WlxMmE4FflGHeMr6mDmIP4XnX+IiJc7ifU5wXiP4WR6Krd04UIm1YPHB60jaa3kO4DoUL25sMQJQh5jzj6ThlNkFoa2gKY9mG2OomC7y+GmezpOjaOEvqKuE0wBd612MxmdKxzcxqFHx30E92H038UEehCPW+GDR685hZgreuX9fEqDEL1t4ZS6Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR04MB0684.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(478600001)(66946007)(966005)(86362001)(54906003)(33656002)(6506007)(5660300002)(83380400001)(26005)(8936002)(6486002)(71200400001)(8676002)(1076003)(66476007)(186003)(66446008)(64756008)(9686003)(2906002)(66556008)(91956017)(4326008)(6512007)(316002)(6916009)(76116006);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?59tyVHSlv8GQIvn/3nxIH17v3nZsO6I0Cwakrleis3BcViOR6Njdt8Q3eNDU?=
 =?us-ascii?Q?Ei3QU5nGKFE/Fo5NbwI2vL7w9yu4oTrB4uo3RMcHumlCBS1zvtbUIuNEd9tK?=
 =?us-ascii?Q?JSbq5gjgzbEkM15sQhUS8GwdxXqaYzo9rYC6NRZ9aBpw/iucn1yQVv8RM6oq?=
 =?us-ascii?Q?VVeysbvBOWTr8u0Og76Bnsz/8+Get1uI8brXRBtmXX3cWtIHzUW0DKnH0Dy9?=
 =?us-ascii?Q?xdOv/txIHfDBpYpOddZu97nQBvtTeVbQePKT2PPqM3QwL4N1Yjfqi+UY0D54?=
 =?us-ascii?Q?nlvABCDM7bJGvK9ZmmHSPZNKCps5ELiC5abQSCvblkws7+NB4p0XtU/h3Z3Y?=
 =?us-ascii?Q?/r+/ZJux8QRU7MhAsKSZ2Bzs54V1fySpDScrfKhZHYTLDvE4u+kQ2GOaPIoN?=
 =?us-ascii?Q?dlmM7Vt/I+zw24jzpW9/9oHdxJUtPlpn1LLJQUdLFeeHxvv5BJzi8AJuVpJu?=
 =?us-ascii?Q?aAF2N1zo2iw7OEsCiD00Uwm9mUI5+rFWnPoFtMI+PHHPYYSHSAkMykkytoVq?=
 =?us-ascii?Q?LS3GtqIQ/xQkCcZSpgihOrolEMAJiWhONHWvsxNpVu/23NRIM7xjMyJsqxQL?=
 =?us-ascii?Q?WvPn3i6nU4FPREFLeS0RddbRmSnhINq/7L70sNKEgLornDM0vtVUm8nXdV7o?=
 =?us-ascii?Q?V2XVXHLfOMMghn9JHrbw0CZA/aZR6i2WDqGhOeZyU27BFZhh0oPO6f+DtfSL?=
 =?us-ascii?Q?hGnPb5p9v7Q5CUa3aRJH6oerLyMyxTlQ1MCELR4MezQ9xoT0UfZEeP6/774i?=
 =?us-ascii?Q?bJLwXax7Ha9HPP03DREJEtAx7m4Kje9n5mMmx5NgFHHA7YI8HhvSf7tjd9Qd?=
 =?us-ascii?Q?vkGsYcAISl1fE86o8zQIEtfCeR1z6NrJcUxAcbthALE+fxhnjmaBkeYbX/Cg?=
 =?us-ascii?Q?BvgvlE0wgRhcOkAeCE4yPxijTmua1M8Nl/j4gZ8x2Bg7yrFTSXiHNOJ/FrOh?=
 =?us-ascii?Q?pIoXIDBdVyBVSrwgtPiYmZXuSwJrVpdLY1+yyuS+ajgIQiZZrfRv3Ktd5fDN?=
 =?us-ascii?Q?lZrx?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8CFD68F071BC784A8CF20C64BAA843B2@namprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR04MB0684.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d5857d-02bf-448f-c51b-08d8bdf27826
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 09:53:56.7977 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j+6gp8B6Z05LS9EOlDD9cWbzbnrpFTTV4nGcpm3l4YalPJficnuOIjXIBTWJE8oAjGgo/8FUn/VZn1XfIIIQhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB1226
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=6485d9ad4=Niklas.Cassel@wdc.com; helo=esa5.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 06:58:19AM +0900, Minwoo Im wrote:
> > Hello Minwoo,
> >=20
> > By introducing a detached parameter,
> > you are also implicitly making the following
> > NVMe commands no longer be spec compliant:
> >=20
> > NVME_ID_CNS_NS, NVME_ID_CNS_CS_NS,
> > NVME_ID_CNS_NS_ACTIVE_LIST, NVME_ID_CNS_CS_NS_ACTIVE_LIST
> >=20
> > When these commands are called on a detached namespace,
> > they should usually return a zero filled data struct.
>=20
> Agreed.
>=20
> > Dmitry and I had a patch on V8 on the ZNS series
> > that tried to fix some the existing NVMe commands
> > to be spec compliant, by handling detached namespaces
> > properly. In the end, in order to make it easier to
> > get the ZNS series accepted, we decided to drop the
> > detached related stuff from the series.
> >=20
> > Feel free to look at that patch for inspiration:
> > https://github.com/dmitry-fomichev/qemu/commit/251c0ffee5149c739b134781=
1fa7e32a1c36bf7c
>=20
> I've seen this patch and as Klaus said, only thing patches need go with
> is to put some of nvme_ns_is_attached() helper among the Identify
> handlers.
>=20
> > I'm not sure if you want to modify all the functions that
> > our patch modifies, but I think that you should at least
> > modify the following nvme functions:
> >=20
> > nvme_identify_ns()
> > nvme_identify_ns_csi()
> > nvme_identify_nslist()
> > nvme_identify_nslist_csi()
>=20
> Yes, pretty makes sense to update them.  But now it seems like
> 'attach/detach' scheme should have been separated out of this series
> which just introduced the multi-path for controllers and namespace
> sharing.  I will drop this 'detach' scheme out of this series and make
> another series to support all of the Identify you mentioned above
> cleanly.

Hello Minwoo,

thank you for putting in work on this!

Kind regards,
Niklas=

