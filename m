Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E80A866A545
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 22:45:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGRqY-0003sy-FH; Fri, 13 Jan 2023 16:44:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pGRqW-0003sj-RB
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 16:44:20 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tsimpson@quicinc.com>)
 id 1pGRqU-0007nI-T2
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 16:44:20 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30DLiE1S009707; Fri, 13 Jan 2023 21:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=qcppdkim1;
 bh=6qA9ksCLRYxyYM15FMkLyApJ70gWcE7bx0niT+wT49Q=;
 b=KvD+4gWP8TBQ9GPayTPDEuEhk+FRhIE8SiErubRzuH3eZ+1NJCH+NUPWUNuvJopnXjD3
 B0AB3voXiDEqyjIzkUds4x7iNdLALWdWbf2a1GBzD6wBzx4dV4a/oUzJ+qGaMW6MIjOl
 muDBhrtwb05Vgtroz2cexvejbUkyi2Do6xhOogn61/pbuhSCwcevi0js9AjUACKUD/YG
 hSqbXcmn+sJjpurovmSdqKlVQPW79RQMPpyhCXueaRYA5gohyj5TlrlYLP6P1uXTXyQH
 hidrJ4AFU7iIt/KCQ0PiDiRKIdbfM+bOETJesciDs12ax09DIPLIu+lPnRDp31mF3TIQ Mg== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n32wu9yk2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 21:44:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K3j+3ICIWW/LBehKNcEa/czePI2nCEY0akT8CcUJBXLX2w+agusRIS3v91FssdCTTqQMmwoOirrrF6EOfP+8zdvPVTIfbc4XSCXOtjxAE1Bed+xkRbcUzdXjZxQml//Ni54VlQOJThn87587S+fBD+yQJa6Il5zVizSYsgAct09vscpDLMzqmrnzBuHUpMmfihl3wwYE0p9UL0B2j0cyfJBoWReQf6piT+Mf01ZMrDlrakvYRerOrrJ7h7DMQIDbRW+zaYZu0X/4jbiSX8pR91A+g96qomNobIHRON04vzOkAaqulU8oNgJiWRRYyJBnftCYfVl3IfjMbC9Jw4sF0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6qA9ksCLRYxyYM15FMkLyApJ70gWcE7bx0niT+wT49Q=;
 b=JsRd35UREzKm/RTtPnyvHGeTWJHZ4sfrZxjHmhu35wyO2Rk6JAZLwC4iJ3r4Rsob+gYrq2ZDiDSO0Q74r0o+rDecnakOMvXOcZIdh9OjU5JrPcEwwf+0xyaA/Hjp47PQQT7O/rdsLP7lhGp/vcFh59jSNWCa+j5shvpMV9QsGXojYxePquxJu/IpTm7yhJiBJ/wtrslnfssr30lEPS/RCyQQaczEQOseaSH1biVIbZc7OH1od3VjuFUtX0709vGVcw/s2e+igPEtjfXxiYz1uzq4Lx5Cy/64PQRcFgyTVJlYsFevCbm7d72I1TPuxYk0J51sGS8E8zMtiA/JaeOJfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 (2603:10b6:806:203::12) by BY5PR02MB6819.namprd02.prod.outlook.com
 (2603:10b6:a03:202::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Fri, 13 Jan
 2023 21:44:06 +0000
Received: from SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad4a:7f4:772b:2a86]) by SN4PR0201MB8808.namprd02.prod.outlook.com
 ([fe80::ad4a:7f4:772b:2a86%3]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 21:44:06 +0000
From: Taylor Simpson <tsimpson@quicinc.com>
To: "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: Brian Cain <bcain@quicinc.com>, "richard.henderson@linaro.org"
 <richard.henderson@linaro.org>
Subject: RE: [PATCH 1/2] Hexagon (iclass): update J4_hintjumpr slot constraints
Thread-Topic: [PATCH 1/2] Hexagon (iclass): update J4_hintjumpr slot
 constraints
Thread-Index: AQHZJ1R4PdLeHoPogkeq+2J5H96Fxq6c4WFA
Date: Fri, 13 Jan 2023 21:44:05 +0000
Message-ID: <SN4PR0201MB88083B709370C4345442CCAEDEC29@SN4PR0201MB8808.namprd02.prod.outlook.com>
References: <cover.1673616964.git.quic_mathbern@quicinc.com>
 <0fcd8293642c6324119fbbab44741164bcbd04fb.1673616964.git.quic_mathbern@quicinc.com>
In-Reply-To: <0fcd8293642c6324119fbbab44741164bcbd04fb.1673616964.git.quic_mathbern@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN4PR0201MB8808:EE_|BY5PR02MB6819:EE_
x-ms-office365-filtering-correlation-id: 263a4a20-4533-4cfb-ee47-08daf5af4bc7
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dXGbSPD4wr0Ax1OkIsoVZnxvTcV6sYXcrUulTAXeAK/96ytEY7r0REJ437haSucAevn+RDVNWoN00MpfuKJTb955E+Ta3xsjmntUjCsslGHJQVUnUUlEQdUt73meTaMwxuLPMOZcpaECowCtZOffKkgF2TifMztk0zvP7k2UiHeYNjNn1H4kuubAg3TxoRDRl7KIf6+tsm9YdpRZ6ZZEVdrUXUIjw8Ra6uzR4qaofCsj+aBhvHMG8NuGhHsjQAq7PQakOdmBw3cKqCgPmXndnZd/2A6b/M4b7OYVFtpc3DXrCCZ7aZmk8T3u7fCAPapFyAlKJoU4lDWhpaYbcQ8bVty4rutX4U0EJK63HlxZp0C8r9Bfo6CdN6xlhdIP8wKHomNy2GxrBxeFpVRROAIC8b2kzXKYrBCGlpcWStW7Hfe4oq2ntYDqZWSR+W/GQIDSVXGDx6lp7xHQfWSzLZGcwp3odPi7rNi8VnkHSXYCRI27RQT9oBaNJ8pyPnfQNXuxw6/TYaPvGI4NKmBJo1PGE1xHC82kjjvd5cjqSV36yMRblBO6BlhaMW66nN0REv3rYWKQgnoHj0RYI1jiPT8kKRMEjPCrA0H/51TK30z8XuK5tfDInsHC+DGvAdDI+nP8foy4ACnUeG7cC1uYNd703YWkYz+sLZ1trtGAOKDQaaCgp5ujPIdo04C6b659i9cL00zno8x6RZ+dvLzkkuATSA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN4PR0201MB8808.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199015)(38070700005)(478600001)(41300700001)(33656002)(38100700002)(71200400001)(86362001)(316002)(54906003)(110136005)(26005)(66556008)(186003)(66946007)(66476007)(7696005)(55016003)(76116006)(15650500001)(5660300002)(53546011)(6506007)(2906002)(8676002)(66446008)(9686003)(64756008)(4326008)(52536014)(83380400001)(8936002)(122000001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4q8xuSTVaurJ+JASoW3eBc4ZJ4nBsREgTOgsU40wPgGr9H+Wmv+rxXNVro0U?=
 =?us-ascii?Q?oggor9zeE7J+5N/KhxEJtd6/2Pr0s1hnCCWobFyYsMKXohzCumi4zV0ZQ6Rf?=
 =?us-ascii?Q?SPIQbpBLNG1rtoSzILLqZM7xSB041m1LMep8BxDDe9/W+0XrB0oAnTTho326?=
 =?us-ascii?Q?L+pXBMuAuuAnTGRwg8Lnza9DtFBIIYCpBr7QHRbSwYrjm7rkOioObN6GwwI1?=
 =?us-ascii?Q?GeZtEnaTQ5LxC1jgVfDGbyx6MusEjbKSchUtwgqE/FQx1FSdlHG1JLRJdRvy?=
 =?us-ascii?Q?tNIzFSCJgnm2KSA/mpCORNZMvmLK7prJgn4f2rnu6m9Z8gaILgfus+NUuhR+?=
 =?us-ascii?Q?jvIZZntc7ib86SDNvtRtwxA38IeWSjAGv7x73s9Q+6PHd1ZUurR5vVyhNJ5I?=
 =?us-ascii?Q?JcfWPFLCd94o1GyBnU79CVdpszGKJuadfbtCXkR0xz0RIKv/YNi/8AHeMiTx?=
 =?us-ascii?Q?KWsubqSvVnuhpb7/2IMuw4bXRXlicsrffhTZl9jPoe2aCi/e6hD7fExNg/RC?=
 =?us-ascii?Q?k2Fofg0Gff0Rlds21VfjenVpWgPGI2AjAiDhTOfSj5TeM4xcXoiLJF0z3Xgd?=
 =?us-ascii?Q?b2rRpif0N7hUJqCJjLBTUWnAHGMt4Bt/8nOlya9wHygpDU6ORZ5HV7aH5D9e?=
 =?us-ascii?Q?aaXN9h58lhAdP5/APVvmU1mqeCo/oz8LJSK7h911oHpnlYTvnIJqsoYvoJlG?=
 =?us-ascii?Q?6Qrh55DPq1d3/DLEQwVGPH3835sgFKObpu0pBCKlurIvdmi3BgbrEMxYCL4/?=
 =?us-ascii?Q?SqHZHPbsEf6f5CwoemLr1qQ78StUkmPBq3ovSxkH5fu/4w+Y6seiHjb63wYp?=
 =?us-ascii?Q?qTFCblrBHwN4KrzXFDdZJMTN10eHualNfrWbb/9zavwRIBzm3ZfQwNKF4ySv?=
 =?us-ascii?Q?JhUMuMyfJoWsCG643MSgcwR32yoe2veFCN7D7wMSgZZW4DukQtpnZIeP4JW0?=
 =?us-ascii?Q?j2eOPmgnstiX4p8W0xPEbPmCbi7phZ67Jc7rrEqEcEXgdtY4AT3vJiWhowba?=
 =?us-ascii?Q?HfREa+slXOU1dZsJMwOqxPjN+phmzXIMNwid66UdpcKKBmZTsyAhpG5fTvYB?=
 =?us-ascii?Q?KXVz5N8Bxz4CMdsHd5OzX+wiwNhO8TEJOxQeoPdBlqkIHLArijrM/2xRRG3m?=
 =?us-ascii?Q?uWZeRsdLibV3ftgEhsgzZh37C1FV6kzJFNyVC7HS/w6NPprL8A486rcCTNWf?=
 =?us-ascii?Q?797tny0DqZVtMbixSye0YCwk6cbfQEO7qq0tKU8dWE8qziA5nPg1k5gfNS7L?=
 =?us-ascii?Q?l0Hb3Xd+pp2pq3GsBfSthOIGdIAXRnQU9a11zwa9P3rFXmjF+PuDeps8odsl?=
 =?us-ascii?Q?NKsD9deLHhFCOb2M/0DV6dx8F0uMG0T/3/xkxuJzR7rp3JO934xvp40H+Deg?=
 =?us-ascii?Q?Q69tPxRnqXX2Y+QgIxwPllPUrAMEoUCMIZjK/bq8aE3nIRIA6myCcxJE6G+S?=
 =?us-ascii?Q?ESUeaEBKXihyUJZyiKvEMemos5YyNCOysYSpb4XvQjlDtUgBXeTtYc+NpCA9?=
 =?us-ascii?Q?hL4mvAkKW+zpYj7o9Qb57xZqmQIBHGkuYRse0Q8kPIoybQAFIOFHl0QgMW10?=
 =?us-ascii?Q?JgxK5VYTo4VjZP/7j1isfork4ssaHoWmA7daoClZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: AZ68E3lnMcB+p7xp6bvoxXCOeqX0w/hUCbGMstU/csvoIPHzmLMI8sMPbKu/33h1EJ5flMG8O+K8k8tBcI34ySM6qLobJmWAh5GJS0ZHIkz3tneP4FjIXtLIiiEK+gs4geJUpk0FgGqulq7mGQ3noC/i9jsxy2uH4kg6aGJ0z0A4l+qtw7h/fsv2G0uPWp9mDaU1OFAKkqGBWzZLAGesVhtM++L4Vc3IvfdyJmPDdiHGVyIHZBGjqmiU43uqySysNbn8rn1aab0NVvojGV4cjD9AcgzJVZNq6SbVmpFcRA4gafFac3TgWCbeGRBj79jsV0k16UDU7cdv+ZaFFHfFS65uSXlIbHIzJdHEWfdKYnhpdsmvmcx+ena2YJA6QTcGyrdROnmnSu/7EukqOhCZ1yE2wovlUkCwKDQekzu1ZLedqs6ScvCbyCFlOgIHP0AqEcF4HexpVqZsboYshJ9wNvupw3q9gwlpLghvCxChcLKoe2hSMMybrwBnFHOzY1DNOjqYNB1BkhAEIesUB7G/Ar1O1SZg+2gEloHOTaQS+9c54zk83UaijrIvkE3LaXUTw8VNytiwfDRCvAccIlGQ1JyAUv1bnNyp8nvXPloKql44tnx2NcCYfX0IFrAPxA3HS8JFfVdNngp+q3MWP6cNKZINN9f/85ctz8Fswiqe2IKCDicp3mWtNR/nu2RRIKJKjYVGMnMWnROZnxTAJwez7C8wfFh0gp3tP3bwqPMYC6J3HWtU1PVIqplIo4JMRqP+7PnULc3MhHrtmWRuXagYDIFekKWkf0ff5Y3JgRSCa+8=
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN4PR0201MB8808.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 263a4a20-4533-4cfb-ee47-08daf5af4bc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2023 21:44:06.5509 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FrbLGyW9CDied/q5uJ/t0cfnHGIvYKSnEg0UqJ0SCjGb4xSODGJ4MN8Ldwxd4HwOLwDdOMkZRyGqPDLaY6FkhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6819
X-Proofpoint-GUID: sN9Z1Vdjyom9I-y82_gYaW-gBRDlxDcF
X-Proofpoint-ORIG-GUID: sN9Z1Vdjyom9I-y82_gYaW-gBRDlxDcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_10,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxlogscore=352 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130149
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



> -----Original Message-----
> From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> Sent: Friday, January 13, 2023 7:39 AM
> To: qemu-devel@nongnu.org
> Cc: Taylor Simpson <tsimpson@quicinc.com>; Brian Cain
> <bcain@quicinc.com>; richard.henderson@linaro.org
> Subject: [PATCH 1/2] Hexagon (iclass): update J4_hintjumpr slot constrain=
ts
>=20
> The Hexagon PRM says that "The assembler automatically encodes
> instructions in the packet in the proper order. In the binary encoding of=
 a
> packet, the instructions must be ordered from Slot 3 down to Slot 0."
>=20
> Prior to the architecture version v73, the slot constraints from instruct=
ion
> "hintjr" only allowed it to be executed at slot 2.
> With that in mind, consider the packet:
>=20
>     {
>         hintjr(r0)
>         nop
>         nop
>         if (!p0) memd(r1+#0) =3D r1:0
>     }
>=20
> To satisfy the ordering rule quoted from the PRM, the assembler would,
> thus, move one of the nops to the first position, so that it can be assig=
ned to
> slot 3 and the subsequent hintjr to slot 2.
>=20
> However, since v73, hintjr can be executed at either slot 2 or 3. So ther=
e is no
> need to reorder that packet and the assembler will encode it as is. When
> QEMU tries to execute it, however, we end up hitting a "misaliged store"
> exception because both the store and the hintjr will be assigned to store=
 0,
> and some functions like `slot_is_predicated()` expect the decode machiner=
y
> to assign only one instruction per slot. In particular, the mentioned fun=
ction
> will traverse the packet until it finds the first instruction at the desi=
red slot
> which, for slot 0, will be hintjr. Since hintjr is not predicated, the re=
sult is that
> we try to execute the store regardless of the predicate. And because the
> predicate is false, we had not previously loaded hex_store_addr[0] or
> hex_store_width[0]. As a result, the store will decide de width based on
> trash memory, causing it to be misaligned.
>=20
> Update the slot constraints for hintjr so that QEMU can properly handle s=
uch
> encodings.
>=20
> Note: to avoid similar-but-not-identical issues in the future, we should =
look
> for multiple instructions at the same slot during decoding time and throw=
 an
> invalid packet exception. That will be done in the subsequent commit.
>=20
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>  target/hexagon/iclass.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Could you add a check-tcg test case?

Thanks,
Taylor

