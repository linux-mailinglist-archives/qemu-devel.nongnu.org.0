Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15952606661
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 18:58:30 +0200 (CEST)
Received: from localhost ([::1]:42554 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYsG-0006mW-FU
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:58:28 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olYsF-0006U4-SY
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 12:58:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1olYqv-0003hU-QR
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:57:07 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131]:55728)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1olYqs-0003lK-53
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 12:57:03 -0400
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29KDGtvP005179;
 Thu, 20 Oct 2022 16:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=qytRSqR3ZpokvdMollP7Ld7DAZECrapmnmWmgZnk5rI=;
 b=ptdJ7Fe638MhH1jo/5EujetIBfhBw9mCiAvBJ5TochQDNKyeQ8DzZB1ksmczyBL2t1sV
 WTf62/XLuCVZeXxl5f5o5jMbx/jQjIe4A2CYEw65K7chpQNQGKvvlKyfxduNKuauZ1FV
 fVcweMsj5TSB6FfxQsJDV1RasM9p48XZG4z0rRjwjoljL0zFKUiMZsJaTbgpalshHeyk
 Q4l0g2mqeIlpqvd21BFxbtArTFhvDgAoK51ng5M1UJHz+8RengnGBz4q6F+s5IKbC4vl
 aH8AiNRd/Zk9J0BsD8XoDA2N089zT5ku4Zm2e364Z4RwBVgN74v6IEOgPiUxrcAc+VUn Aw== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kb1efsk9m-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Oct 2022 16:56:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTz0ELO0k8vYuBF5hZIl0MPTdxlzdPfGQryLCWQdL1XOc9lCTcx2lKc/YmLP0CXAsQUQRdk/HvJOf9x1fMYoucI5dyLEXcQfaWSOxzYlJ+5wUZ5iGuTTysY1Iv+rp9RmkKeBta1q4k/iaTE8/mg0BUISh58egPAWcjp8MZE3vy0FeUyV5C4XRwx9ztgd34j7sy9uPa/M5WcHMQNSAPtMHyT+e71ssc5LCGyZ92R4lRxat98oDRsyNtPYvZaDps93Rq9y/H7oxwJxx1WcLqGSnPRENMHWQB5pdSnuto7rHEBRNeZ/Ygn9ChZFu4TK1wfvmP0ciqsdnb2rRC9K9bZERQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qytRSqR3ZpokvdMollP7Ld7DAZECrapmnmWmgZnk5rI=;
 b=lffV4hurPzf4g2BgzvuNEZMNttNj7yQSkcTnDfw+tXmyfSNW0pFsTqY/ZryWirubMmYV3/H0vsysYIsDdB83OW6NTW7LtsJ/73qyG+YMSm+sIlzEkXvIL92jNAIY8dZsdlkBwvy8pNmIK/H6ZdmtKvHftoqS0v4xPFS//E5Y3mYTincAF59iCh+5Ow3KoZkHJcOjGKEjkTr6iwOromdw4VRAJdQI/x9lwSg9ZgobS/npo08XnsxFsEvpv1jfz5jwrX2lD3Lj7UIgQ+7hPUMTO4xclkLwbtnnyAtiDmgu9R7FloaIICJeoSmJOSWa1qlWNBSmyXYR+e3zFLy6R3uBbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by CH2PR02MB6949.namprd02.prod.outlook.com
 (2603:10b6:610:8f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Thu, 20 Oct
 2022 16:56:51 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::48c8:3e4b:46c1:ca87]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::48c8:3e4b:46c1:ca87%5]) with mapi id 15.20.5723.033; Thu, 20 Oct 2022
 16:56:51 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>
CC: "ale@rev.ng" <ale@rev.ng>, "anjo@rev.ng" <anjo@rev.ng>, Brian Cain
 <bcain@quicinc.com>, "philmd@linaro.org" <philmd@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>
Subject: RE: [PATCH 7/8] Hexagon (target/hexagon) Use direct block chaining
 for direct jump/branch
Thread-Topic: [PATCH 7/8] Hexagon (target/hexagon) Use direct block chaining
 for direct jump/branch
Thread-Index: AQHY5Atp1nj2A578L0OK+yg7f6muYq4XaB+AgAAVorA=
Date: Thu, 20 Oct 2022 16:56:51 +0000
Message-ID: <SN4PR0201MB8808C0C1C12DD903AD8C3FE1DE2A9@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <20221019223739.3868-8-tsimpson@quicinc.com>
 <282c13438aac1a4a12b061634d8efb3c84ac29cd.1666278665.git.quic_mathbern@quicinc.com>
In-Reply-To: <282c13438aac1a4a12b061634d8efb3c84ac29cd.1666278665.git.quic_mathbern@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|CH2PR02MB6949:EE_
x-ms-office365-filtering-correlation-id: 5e4a6fe1-c4d2-401e-5c70-08dab2bc15bd
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FgR90G+ALbl3A79TsdRivXokCp+I6oaucfvEz3s3QDaDoCvlyy1jK4KjA+9PoP898lZ1VNpErKWHw24TE0MT4jIVSa21RpbpltrdZ4+NngKcjfeCOUQyr0+WGXMw6Ta5g3M8QWBShVAwTcipRrlC7KYyIBg6N/VHGhE35733aZpcdurmz8Rw9oN3Z7b7mhmmEZ5G8qcKaUhsEDf0FiYwO5lKTO022anyf+FcaphVvAHOklcbOnHBnNQORNMHX7HgBTjm28/1Fy3w1PxSOZGGhj+lACYXAnkTkwm6uubmKapHNE214nhIGUPuJoMpAE9hpEjYKYVJVifLCR/oDMy0kxaDQNYKHIB/s+cL4HueDeufkaOxMZ8NBFadsiYQyDT//IhrcXo8RyY1qOMlziT/Z8KSVQ7oJQHjBUK6F24s86mAas8NpMAnYiRtd/XjgZ0UXKJp2Vz0wjTZn0P9+rYPvTar2ZH6XoJzErny/Y6cW+ETeOWD3CFJVpyzMS1Up+JTlh/X6aqlqVTBdjnrjrmTyQ4oG8QMUaVe0srek0avzMkHXbkOlQncNUsOmuIXLSsAx1WyfMY/bE5q4zCJvSYbGtjS3+PuO3IOtl/x7QdlikxnEzq//4k1vyOQ1KIg6M2jVVzIa39+saGBdGSAZq6LWv0etSmjJEPu8XBUe9NOaTXbfQwLKE1JdF7D16g1QX3V+td6lZBkwST7hDR0Bkx+mdCofzFkOIxosAjt7BnZ91bCPPyKXKlbapcBEl/MBd9YWjUcvvw2i6IXDNj4qsytHQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(376002)(346002)(136003)(396003)(451199015)(83380400001)(38070700005)(86362001)(55016003)(33656002)(38100700002)(122000001)(6636002)(54906003)(316002)(5660300002)(52536014)(6862004)(8936002)(7696005)(71200400001)(186003)(2906002)(64756008)(6506007)(53546011)(76116006)(66946007)(66476007)(66446008)(66556008)(8676002)(4326008)(478600001)(26005)(9686003)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?WRPOPww2qdVp/eCfVDWECDnZJEnk6diYQawe7qdjMMcyD6u2hdcc+xOOjgCV?=
 =?us-ascii?Q?aZFRV4sT2ap4PXCRVDAXZm7dhh/cGtZ4nZLdeP1Q3z/MPZP2foGIgBvOezEO?=
 =?us-ascii?Q?m2+P5ATSReQCuUg+oYPKeEzYszYHB1/6qoo1w+RccIeXclWTfcIPEoPgA95q?=
 =?us-ascii?Q?UPf4jmu4/UaiBQZh5iwT19aKU+dlTjICMZUA7+tg12f7rdiYSwcVvRmeOcao?=
 =?us-ascii?Q?9RAwEREXmz1OELC5aB2IRfqTjwf4X10zCWTHlmVnfzAeQ3tjYvlWrkMd2SK9?=
 =?us-ascii?Q?euXFigfKG0kHJuKIZ80M5nbCoNIkuFc1EY5WGUSVTV5eMacFhb3gAF84xRtx?=
 =?us-ascii?Q?UULsOJeAuYYigOljj7ApDYdqkLUUo6r369hfJ81L2ESQz9J6ru+sG4VvAJLt?=
 =?us-ascii?Q?Owh/mI8sYMfAUeozsyUnYUl6RMu4AiF92wzlmBtwDo2s4gmUZ2XkdXm7orpt?=
 =?us-ascii?Q?DHL8eQFEcECA2KSJB8o8LNjashyUIA4Cj19BxjnM2PaqU3obGTcpdRPFRXk5?=
 =?us-ascii?Q?aSDS8h/kt6lGucQwrHOgkRHcoYCnEyVyc/hYMv/HyRilrZJHAXO95csB8zso?=
 =?us-ascii?Q?v6/TooD4HfYToTNh/lMllR0odV97tLwMfVDgbYz3rZRnnd7C2iTMhMK6fZ6R?=
 =?us-ascii?Q?S/V6PPO+njrtqCFuAUsNCMiJe390UJ/DtvYoqNApLLqk1RmwblwyTHGnwOkK?=
 =?us-ascii?Q?g43CeRakp5RD+rYeAl+SXD0QKckWiaukCClGQbEh/ZEtwWfx43QPZTJ33mU/?=
 =?us-ascii?Q?ZUrHo18Il8Iv6E5P2TfpRSI5z0UMTEOVg63fbB4oe2at+Qcttu7x9eaV1fOd?=
 =?us-ascii?Q?tJLCRxgpD2txY1TQui76RayqNY+qvgfz0+gl3p1QZKaIa2jn/jvcBZzDm2LI?=
 =?us-ascii?Q?nqHGzQ+1PzA8CviX7nOCOCQJJqEaDs0M0ZhUQT/MO6HuEze3LWBDDuoCWbSv?=
 =?us-ascii?Q?sX9rQ5Z3B8lazsuZLxekGIj1uwOAqtfp3fzztYWoT3MHgxmLRHDEOoeKgt0j?=
 =?us-ascii?Q?V936HVuYjSNDbH/i9eFol3Wt1IEXUM7ZZ3rdY215CVAnAhnSh/TLysokAD+U?=
 =?us-ascii?Q?FFpvJ7UKZ3b3+klbFJZuDfgcXP5/LjtqXgtthww2je3aPJD9MbHlhs0BN0er?=
 =?us-ascii?Q?C+yhhIEdt2BReV6q0tBwtQ/nrr+y0LNyxgxJybmhx1wl3boPV7LcbjYOgP+K?=
 =?us-ascii?Q?nEImjzafzGw+xNuKeAm1N7fzMz484lnNL/cITZFO8DFxYXGVxmQ84KAOJ/o6?=
 =?us-ascii?Q?Tz8WHd+6LwTKOstWlVdxig2T3g7ygQM5Jsau1eNgypVrc67TSOOn/Ze/oN8Q?=
 =?us-ascii?Q?3DQO7YU9QvDPyQT7+cttScuQUHhitK1oatpGL6Nav99qooO38RlY1SFprnYn?=
 =?us-ascii?Q?+jX4PrmeJYynZZzHJGbFXwPKV1nb8J+XOpgAJRPTnBe4Lhbyxt8QT+g+9tYX?=
 =?us-ascii?Q?knb7a5JI/hEsdP3GiW+3TollbuGc13BDwLwqo1W6HrdGlWVwAuRcxVOIVOdS?=
 =?us-ascii?Q?P9CqdBMhYKJ9Kr8HXT2ocmBbjb3IJzBBSZ2tyc1adYoggYqeLkDmYIVQZV63?=
 =?us-ascii?Q?3ti73TVYYdmiEHHqJzBCMArF4bZl5VNtQr94eJfh?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e4a6fe1-c4d2-401e-5c70-08dab2bc15bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2022 16:56:51.4048 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4kD5mzN4zhndnx9n5g57GLx3uCK/CrEo0eOJ45i7k023ta8OKJVZrEJ7H3zwTjZA8/onBGjOqh81P2iuvyHdEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6949
X-Proofpoint-GUID: GhxVPR74wami3hALnM4AIgEwbs4UmUqA
X-Proofpoint-ORIG-GUID: GhxVPR74wami3hALnM4AIgEwbs4UmUqA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_08,2022-10-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 spamscore=0 mlxlogscore=530 bulkscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210200100
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
> Sent: Thursday, October 20, 2022 10:25 AM
> To: Taylor Simpson <tsimpson@quicinc.com>
> Cc: ale@rev.ng; anjo@rev.ng; Brian Cain <bcain@quicinc.com>;
> philmd@linaro.org; qemu-devel@nongnu.org; Matheus Bernardino (QUIC)
> <quic_mathbern@quicinc.com>; richard.henderson@linaro.org
> Subject: Re: [PATCH 7/8] Hexagon (target/hexagon) Use direct block chaini=
ng
> for direct jump/branch
>=20
>=20
> Do we want to perform this logic at gen_write_new_pc_addr() as well?
>=20
> Although, in that case, we would need a separate ctx->branch_dest to hold=
 a
> TCGv instead of target_ulong...
>=20
> Or have a single variable (TCGv) but add an extra tcg_gen_addi(ctx-
> >branch_dest, tcg_gen_constant_tl(pkt->pc), pc_off) call to
> gen_write_new_pc_pcrel(). (In which case, we could also unify the two
> gen_write_new_pc_* functions and have one as a thin wrapper around the
> other.) IDK about the extra overhead from tcg_gen_addi(), though.

We get the best performance from direct block chaining when the destination=
 is a constant at translation time (i.e., a direct branch) because we can u=
se goto_tb + exit_tb.

Take a look at gen_end_tb in translate.c to see how this is ultimately done=
.  For a single direct branch and a tight loop, we get the best performance=
.  Otherwise, we use tcg_gen_lookup_and_goto_ptr which is still better than=
 what we were doing before.

Thanks,
Taylor

