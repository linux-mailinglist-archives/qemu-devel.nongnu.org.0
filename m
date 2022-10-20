Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A99296066A0
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:01:38 +0200 (CEST)
Received: from localhost ([::1]:56578 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYvE-0003NK-Ia
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:01:32 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYvB-0000LT-QT
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:01:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1olYur-0006dd-Fw
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 13:01:09 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:41578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1olYuo-0005AL-Vk
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 13:01:09 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29KBG3fU007080;
 Thu, 20 Oct 2022 17:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=zXDM72X/pZG6E4Ka0yAizdEig8U0cFZcs14pXPUy6w0=;
 b=UqNDGRGe4Ad9Ezg32lNwPIT16l1GXsPDu2y3Z3xHfkg9KKGJ6gjqO+rBFl6Zn4yb//Z3
 ataUWW1fT8BxuH15sZKKvr+YQ7uV4tvjxwokI5DA1aHaGbuCSR24mul4a3P5SWF0LBhR
 1fKiJMk+JEzu0RDiQoSHiEwdF4kSI3GaBjCFLPQ449B5laCZNT8IoWl3dtrD7q6LtRiE
 3fp484Ch96c5vPCP4ioGCS11o6bXtw7Wvb36BgNa/4VB/rJdKQCHBY5pjQ13cdntbUFH
 PYfKeHDLcAy51rOsY0k3Yd8ITZMiXr8H6ECPX6mISnIfkXXsbdAjr3reFhlXOcDwvKu5 fw== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kaknjkube-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 17:01:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h6/NSgFDKNrUgjzyg6K72S3XGwJFu5P4lbuL0xwxm/AswpCNsJe2uPR/K1cG0pE1OAq3QhJUspGs5kK0RlCso8+WhfPV+eWIDTTIyLVXJBLycOTOynIN7T8vVRgDygJpGftHpA7j7JuheUtfcHsbN7DoJiHo1hz4S9+dQEHvfURzsbrUhUVY/OqpsulzAW/Y3XXo2m5HzvvK9AqZN7Fkxf/yNP79yghESCMAz4s161MgA7zbFA5gKwkWmQSEC4kUKz8TB8xJEd2huS9W9E6eniuWpAiHox3fUuXn8ie7l+baS7batp3dR/ZhuqzGU7PyzIX41QuLfSdYlqcg6XM/vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXDM72X/pZG6E4Ka0yAizdEig8U0cFZcs14pXPUy6w0=;
 b=Bxo+hd644sYi8C9/HLapOjwIthbgOWrXd6GHYn3zVOTxTXiylqfqf4gcz/7IlV8cU6Fi+ZcJq+TKmmf+6eVHq8OWp2RD9zA+57mmWE4Ma3u8D44iKUngiPyLtMmyMhGa2vi0xWeTbjpn3V1TNs2tWRN7WSpulKL4u9d3befHiVIBcW5xpQt5d7VGhO1SAxnuctrINLqhk3cSjpZQIV/IwPnRDOF8QsOQ5A/j78osCNZYG/XzEZEh46rboq5EB/aBSL56jQ/r3dqK81ZunXLteUsIpWEK059xUQ531jcssuwOu0n+dhWs/ct6P1IkKgR8ZpHG34/oYRimnlse6Hdliw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by PH0PR02MB7512.namprd02.prod.outlook.com
 (2603:10b6:510:4f::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Thu, 20 Oct
 2022 17:00:58 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::48c8:3e4b:46c1:ca87]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::48c8:3e4b:46c1:ca87%5]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 17:00:58 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>
CC: "ale@rev.ng" <ale@rev.ng>, "anjo@rev.ng" <anjo@rev.ng>, Brian Cain
 <bcain@quicinc.com>, "philmd@linaro.org" <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>
Subject: RE: [PATCH 6/8] Hexagon (target/hexagon) Add overrides for various
 forms of jump
Thread-Topic: [PATCH 6/8] Hexagon (target/hexagon) Add overrides for various
 forms of jump
Thread-Index: AQHY5AtpFukpLA87TUaK1t7Z5yIzYK4XZ9qAgAAaA2A=
Date: Thu, 20 Oct 2022 17:00:58 +0000
Message-ID: <SN4PR0201MB880822E195FC730A2E10503FDE2A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221019223739.3868-7-tsimpson@quicinc.com>
 <3957bd3b267ea26ae687510d73736f6a80c30d99.1666270633.git.quic_mathbern@quicinc.com>
In-Reply-To: <3957bd3b267ea26ae687510d73736f6a80c30d99.1666270633.git.quic_mathbern@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|PH0PR02MB7512:EE_
x-ms-office365-filtering-correlation-id: 6b9ab6ef-dd60-4d36-40e5-08dab2bca8f3
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 35V4b8bZXXiP+xSjzM7BIABeoLey6MAI6Eh5nu0hbM9VojCiozPSd6OrFHhdBo4HTjfR3ZAsqtzDUWrc2jYbWdJ+g6Y9lLND4XeFKeRvbS3LL33Xh2629VwoOgUoAGAS6peyj92veVOQqjUBTLHNFn5D3y0ErakaYifM/wM9+JxvHMEnEUzryTalBZe7Coyl9Bc1Ma/pWumdTuNwF/zuPLD9mjeU38+HFDdZodfbsSPv4X6ZN+HFg+bugp/pi6YnfVm/0pvWc/405Tv5x+BDOl3DInZDWYyjr5BHdPgxmpCA2EzUdL00hlTlpnK0f0r5haNclnXNX+ff/5MTZ+8J/qO9rnLOucba/osxoEeiyMxggTDQjdHA08LvFGvVILq9PksQYm7DnbP6yzizmq7z+hORB8hIMpqtT7i+QatMcSjgrVEw7Hgyt5hzsjCnmEUoUI+G34enH7B6YuemO5uTIwPpKR80K2PPP3752nRe9eWi9KFZDABauTKXd1k6+pnIi/st8HCAmL+SJE3rIuyRnQC2FfIGKbHW1NwoJYcO5nRiFl9gg/Wozb0yAkUJp2DH8Ay+QR2e/ymzgs5asHAn2pGZJYn75viUh53T5L9+mqD0rFPF2AerxBaHLJOmq+1ta7ydSkm0E74+pmQ5YksGwobKmnm7S5HbWHX1WpsUF2q+COIewb3TlCQv+T+ZT/M/FIwTjbMMq9xMd4AyEXhRl81EZ4T3AxdnoRHqdA9KRoIiQ5JulIBxLPMiqPnyY2W6DAksRQ5o+zc9P9hM6I99tw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(451199015)(122000001)(2906002)(7696005)(6636002)(55016003)(53546011)(54906003)(6506007)(71200400001)(41300700001)(478600001)(66446008)(66476007)(66556008)(66946007)(76116006)(316002)(8676002)(186003)(64756008)(4326008)(9686003)(26005)(38100700002)(86362001)(6862004)(5660300002)(33656002)(52536014)(38070700005)(83380400001)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3O28N9ngzVz0gEJl8Kfq01aCNmAyN6rI+EbI62ZBxEnp9QIKfbW9vgWgKD8c?=
 =?us-ascii?Q?dIUz0+MPBH7SN1vw1/RChKy1Oooy1kKuLgnbdS5dR9K5+qemRyLGAIuIxG7X?=
 =?us-ascii?Q?sm+jQd7wclIGktCU+0gXy/uXRKZcdRQ+0g/knZeHfdV5S0jx/R1SeMTxglfy?=
 =?us-ascii?Q?8bsHPMQdhU3tIcrz7DxP9/QYFPqlBco0jDYsSP2LN+7Ple6gCUiEvzTgkLsV?=
 =?us-ascii?Q?36cN7AMBDChzxqtynkpcWAW0ExhHLYcd8eAbV20wD/JdqtM0Y2gAwrMoLuHl?=
 =?us-ascii?Q?ENal4VDt9AtzNDnS9Mq8gMpflJ9E0yQ7GJd9rvNHmqg9OOzUpM0U4cwaHEAi?=
 =?us-ascii?Q?9KTLPhHe/RpriItUDb9zscsqMp4PBwYi+IajmRd/7lV65C/y1AEjyEvD6Ck7?=
 =?us-ascii?Q?Jn1vRVT1eH5ZexloP4prlS5VvHlffzkfRK3NeFJcFynGYwFmDwaFK4JOI6Mx?=
 =?us-ascii?Q?zO0Knu+4u2tVqMqyPA/MhCTHSsaSWyxFe7kPf35otViMIoMJvB7gg8OTatB5?=
 =?us-ascii?Q?HBlO1I65G5PHsD2bL6X/FGn9nlMOYPO2M2Z9s/ZSAv+voxIj4XJ+MJiXYKiu?=
 =?us-ascii?Q?Tk0H5jKbTKSLLDOgnLNW0/lJWbYIYu21nFKT9fEbFuimU5yrD1NypToQn1dJ?=
 =?us-ascii?Q?LkSIo1mjuKwhD6oQOJ+ZuW9mZyEbNZZWE/mIOvxmBeJflZGH3lv3fGXpjAsZ?=
 =?us-ascii?Q?mcd3pmVOWociPf5SwkBhJbdCFgVFbvIQ9W8stjL4PyrjFplngMvGnw8sq6dJ?=
 =?us-ascii?Q?Gp+8X5Lzvgu5eR9NPVcgZHOiTMu4jlhbg/EJPt+/f5rGuQHgNPPTHNvpD0t1?=
 =?us-ascii?Q?SMchyTdm95sLqitChH9RclN7lreJGovcKpWwLmm/Bi7JA/34OwWkOiBg1xrr?=
 =?us-ascii?Q?W/KevcG9tASElDXg42uNlV4VJzXrxAS+Z9uWdEG3rCXNcSLSgN3pSfxemPOR?=
 =?us-ascii?Q?bFiQc1wK1mEKBMu0iM90yy+Tjy2yj5uR2df3vJmUXQkSn+PcjnYYaxNYlvY1?=
 =?us-ascii?Q?yzPFl+PYs5SEM5AnPTV5ehsxDOCOPR7ZSI1+XM6gz4sltkzx0FESiUZHX7Yb?=
 =?us-ascii?Q?MqjO0DHQ/q1q4TrEvg36FkS1iDr4oBNrgSHD8JjGuwBFx8DdQhICeSIefCZd?=
 =?us-ascii?Q?nDIg2tNDs1CnimFo38bAr66oSm2vPCgRxJfEWsc+pwVLlDrYt2Jelzbj2sPw?=
 =?us-ascii?Q?iEfYjh5aB/Umzwn32UEEZuNu7zx/7asKvXXqJ8QD9/aGqIMfFN8A5eiAFKYn?=
 =?us-ascii?Q?bm+ZKIbCHwcYV5ceplTnJZgfOT2v1zqkSV4QLC8/1zXDx+xt7T2UgS7pePz7?=
 =?us-ascii?Q?faqcLSkr0FurCB8WvyA86SvF/zkmcK7l88D7X3KWu/UgviWCXtDr5cB1cvha?=
 =?us-ascii?Q?qItQgN3kvGKeODYTXCg7QY7H1l/EL4ZCOzFes7kQ3pnXB5hjSsUKHJPNJH+H?=
 =?us-ascii?Q?nuBe6O9HtMBkgEq/7oDWG4Xgd4OY04V2djRoRM1R00aVeDiJCXl46I2BXUss?=
 =?us-ascii?Q?NGEn2j1mKnxX6sjbpuRb4yWa+hxTLO7FHLjU7NppFExMT+cBPQrkKYiCYJen?=
 =?us-ascii?Q?WPysKG9uC6haCAL18fSN+N4guBzJE5leiovX2dY1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b9ab6ef-dd60-4d36-40e5-08dab2bca8f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2022 17:00:58.3987 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GTmHhZdgdGZBgT5oDlImvXrfJzQbihBnmGoTR7BEAOVZuN9dEDaAgMjcOCljJGCNfVF/lzHx9Mkp2ybCkzhlPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7512
X-Proofpoint-GUID: FUWFkfrcmiS2TQ9ThzI6TXZnaNA8o1TH
X-Proofpoint-ORIG-GUID: FUWFkfrcmiS2TQ9ThzI6TXZnaNA8o1TH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_08,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0
 mlxscore=0 adultscore=0 malwarescore=0 suspectscore=0 mlxlogscore=826
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210200101
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=tsimpson@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



> -----Original Message-----
> From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> Sent: Thursday, October 20, 2022 10:24 AM
> To: Taylor Simpson <tsimpson@quicinc.com>
> Cc: ale@rev.ng; anjo@rev.ng; Brian Cain <bcain@quicinc.com>;
> philmd@linaro.org; qemu-devel@nongnu.org; Matheus Bernardino (QUIC)
> <quic_mathbern@quicinc.com>; richard.henderson@linaro.org
> Subject: Re: [PATCH 6/8] Hexagon (target/hexagon) Add overrides for
> various forms of jump
>=20
> Taylor Simpson <tsimpson@quicinc.com> wrote:
> > diff --git a/target/hexagon/gen_tcg.h b/target/hexagon/gen_tcg.h index
> > b56b216110..dbafcae2de 100644
> > --- a/target/hexagon/gen_tcg.h
> > +++ b/target/hexagon/gen_tcg.h
> >
> > +#define fGEN_TCG_J4_cmplt_f_jumpnv_t(SHORTCODE) \
> > +    gen_cmp_jumpnv(ctx, pkt, TCG_COND_GE, NsN, RtV, riV) #define
> > +fGEN_TCG_J4_cmplt_f_jumpnv_nt(SHORTCODE) \
> > +    gen_cmp_jumpnv(ctx, pkt, TCG_COND_GE, NsN, RtV, riV)
> > +
>=20
> Nitpick: any reason not to place these two !COND variants...
>=20
> > +
> > +#define fGEN_TCG_J4_cmplt_t_jumpnv_t(SHORTCODE) \
> > +    gen_cmp_jumpnv(ctx, pkt, TCG_COND_LT, NsN, RtV, riV) #define
> > +fGEN_TCG_J4_cmplt_t_jumpnv_nt(SHORTCODE) \
> > +    gen_cmp_jumpnv(ctx, pkt, TCG_COND_LT, NsN, RtV, riV)
> > +
>=20
> ...below these COND variants, like you did in the other insns?
>=20

Good catch, I will change this.

> > diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c index
> > 6e494c0bd8..fba76d3b38 100644
> > --- a/target/hexagon/genptr.c
> > +++ b/target/hexagon/genptr.c
> > @@ -456,6 +456,35 @@ static TCGv gen_8bitsof(TCGv result, TCGv value)
> >      return result;
> >  }
> >
> > +static void gen_write_new_pc_addr(DisasContext *ctx, Packet *pkt,
> > +                                  TCGv addr, TCGv pred) {
> > +    TCGLabel *pred_false =3D NULL;
> > +    if (pkt->pkt_has_multi_cof) {
> > +        if (pred !=3D NULL) {
> > +            pred_false =3D gen_new_label();
> > +            tcg_gen_brcondi_tl(TCG_COND_EQ, pred, 0, pred_false);
> > +        }
> > +        /* If there are multiple branches in a packet, ignore the seco=
nd one */
> > +        tcg_gen_movcond_tl(TCG_COND_NE, hex_gpr[HEX_REG_PC],
> > +                           hex_branch_taken, tcg_constant_tl(0),
> > +                           hex_gpr[HEX_REG_PC], addr);
> > +        tcg_gen_movi_tl(hex_branch_taken, 1);
> > +        if (pred !=3D NULL) {
> > +            gen_set_label(pred_false);
> > +        }
> > +    } else {
> > +        if (pred !=3D NULL) {
> > +            pred_false =3D gen_new_label();
> > +            tcg_gen_brcondi_tl(TCG_COND_EQ, pred, 0, pred_false);
> > +        }
> > +        tcg_gen_mov_tl(hex_gpr[HEX_REG_PC], addr);
> > +        if (pred !=3D NULL) {
> > +            gen_set_label(pred_false);
> > +        }
> > +    }
>=20
> Another nitpick: we could possibly extract the common code out of the if-
> else branches for clarity (but note my other comment about this function =
at
> patch 7):
>=20
> static void gen_write_new_pc_addr(DisasContext *ctx, Packet *pkt,
>                                   TCGv addr, TCGv pred) {
>     TCGLabel *pred_false =3D NULL;
>     if (pred !=3D NULL) {
>         pred_false =3D gen_new_label();
>         tcg_gen_brcondi_tl(TCG_COND_EQ, pred, 0, pred_false);
>     }
>     if (pkt->pkt_has_multi_cof) {
>         /* If there are multiple branches in a packet, ignore the second =
one */
>         tcg_gen_movcond_tl(TCG_COND_NE, hex_gpr[HEX_REG_PC],
>                            hex_branch_taken, tcg_constant_tl(0),
>                            hex_gpr[HEX_REG_PC], addr);
>         tcg_gen_movi_tl(hex_branch_taken, 1);
>     } else {
>         tcg_gen_mov_tl(hex_gpr[HEX_REG_PC], addr);
>     }
>     if (pred !=3D NULL) {
>         gen_set_label(pred_false);
>     }
> }

Yes, this will be easier to read.  I'll change it.

> The rest of the patch LGTM.

Thanks,
Taylor


