Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED256FB64F
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 20:28:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw5ZQ-0006ub-JN; Mon, 08 May 2023 14:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1pw5Yv-0006tO-PA
 for qemu-devel@nongnu.org; Mon, 08 May 2023 14:26:18 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1pw5Yt-0006Za-H4
 for qemu-devel@nongnu.org; Mon, 08 May 2023 14:26:17 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 348H5R8K030628; Mon, 8 May 2023 18:26:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=OwtljkC1/xprKv4T13HP0evYC+97NPXAsFvwTteSkN0=;
 b=UCe8nZ0cGSmuTtdlSuKyMNjYaTukH17HEkNDTu68LK+/BoXtm/ANw2+PQGtpJarnbsaO
 +Ha8WGa/CENCLp5td8o/qkSAHTA1je9F1RfZPe9capq26G+BioTCcBz0GlvPviTuRIU6
 kYxzPz+VfOdeoqZLdvlLjtsR27ujJ5i62ADBh/zaayVa8/SACe+JdfJ41IymTQkYzFKV
 AFQoZqfxp+wtngR/v8uOxIXxdq05C22++spfp9Qm0ZxmAVnKTWistqvxBIY1/PXhRHd6
 HIqqYdb0nvr60/SVQN6AAZ3yjHsY4/yyDv48ivsQxWdLo4FQGpGZMMNtu15zKqCcgFPL Iw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qdeguc3x9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 May 2023 18:26:11 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 348HF1mK014774; Mon, 8 May 2023 18:26:10 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3qddb4kup8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 08 May 2023 18:26:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O9sn1+gBMocf4oDA4NwlnQK3V/Lvd+NrEGAell4GaLh/u6qeXDrmzS5EpMsyen0NvVyCxRM57if+Is9VzgvIkAXgA3CoPJGVgHJSOiJufaNVdHvEvAiCQYxy46/6n501U+Er06FsV/WMjDF/EIIlXHGa0Z6xyMa7iBdx4Q3uiY39Y/4ACQgcDUsSB0z7+TYcsjrLCWy1RQQy4MeO10+XCw8SpV0rhtAfKcfBkSox5pwCfXoNuYSE6Lvx+GlQYubdhWX1Y89nqr2HHee/eFqhSvr/fUdKG1dvZW6UjkM227L/rO0C5bUtZa2yNPqgjNm00CNbfRn004f7JdxtTNkGgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OwtljkC1/xprKv4T13HP0evYC+97NPXAsFvwTteSkN0=;
 b=lcF+pmbc58TCyylU6tlrwSu2+1PEAkILZ5g1ablr41H3b7KenFy7xJdh+Tt5liYI19PNF72XFa6V0pIiFwltyvI2dfFYWWXUuJ5jAeZri3WxG0KLzGCzWCiMLiwoS2JvDch4QwVlIpnhq9rWHAwK55+pIUJpQt7obvsc6n3OhkelBnTJwN3vggvlN4H2Xe1OK6prBFjMcDhm5Q6MK9/rsuerAw79vAJ23awcf2PmyOPMeCwKvMFq5eUjgUkqWKm/cwTGGu08CcxVkuxj3K3az4gXmqhpIDPPjTsJD7+8ln9uY6wjR9oVveyoyW04xQPYCfFrYhTXpaI74cjpceHIoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OwtljkC1/xprKv4T13HP0evYC+97NPXAsFvwTteSkN0=;
 b=vpnpxUlUMACp7CJAF++w9+KNahnEj1Gj7cW6E/1zHKOZo8V8lS+qj8pA5IqE6wzNCyHmY/IC4AtDxEUSrOWfeyed2Y52IV6Vt0nQbcIX75WSMXiNaRo2ccgzyHaBPMA0ZEgPZaJCII85CZkitmt3pZjHX3FeF+qUL4SwRfv6Y/k=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by CH0PR10MB7440.namprd10.prod.outlook.com (2603:10b6:610:18c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 18:26:07 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::805e:c245:d42d:5688]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::805e:c245:d42d:5688%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 18:26:07 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Markus Armbruster <armbru@redhat.com>
CC: QEMU Developers <qemu-devel@nongnu.org>, Elena Ufimtseva
 <elena.ufimtseva@oracle.com>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: Machine x-remote property auto-shutdown
Thread-Topic: Machine x-remote property auto-shutdown
Thread-Index: AQHZf2INcX471s5zlEy64l65lwjsUK9QtkoA
Date: Mon, 8 May 2023 18:26:07 +0000
Message-ID: <EF3614AE-EAEC-4B7A-B428-562A40E20DCF@oracle.com>
References: <87h6squ8ol.fsf@pond.sub.org>
In-Reply-To: <87h6squ8ol.fsf@pond.sub.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.500.231)
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR10MB4013:EE_|CH0PR10MB7440:EE_
x-ms-office365-filtering-correlation-id: d69c8d97-fe27-46d3-e9eb-08db4ff1b0db
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: V9AkY86Mw50eKWHifIcr+XtC4Fk4a4je5T7JIUa1eXbo0XOGv2Y75RhtzT4sy71Vet7Sr9ce8PxbH+4Jjpb0vPE7vNqjhuJ+iLHYc+6hu5/O/5+bGWwLLnyoaiCshtd0eOUvHAxJerVLy3TmtIIhBPYjmbOox1Z+MhC2FdeISqNMGXsCbz7Zwc9U+TtSxNm2bUdTheRBjVHzwTfdJriiuNrucHwbu0wQi+3anGzLucrMlspgzefDYSktQXjOOSldAWqMcNavxGF0Q501dOkjwdEA1l6fDaw5Nb1rxadIiMMOWfP3DZID7ecfTkkN4o8gUE5eYYul+MngdAhq3RSVgvzczu0c2jdnygVPlnQTxxaUMm5Pr8S1opyjN4fBaAPMDtahdXRTdo0hVOaNrq+CQed52XxVqnWxGwCfPHvO10ZPkvy1NLhKCtMo/ZZ+ShmkkaW2TYtz/Fvp8RLHmQYuj2E3/0AL+59/xB2JeR9IGCL0w1xSDFjzqebVu7+J6DDdc3JK/uCgQnAgaQsToEfZTNfS2WIujan6FUWNse9lxGxCGjc4Uz7CNOf59plvxCzqYEda/VPMSvGCu12C6oJM03F3IT6cVXZWYcGCrNAl48i9/GaCCCmd3Tt7TAzPxwz7uRhvGMxEzZL7mNV4pe/3ew==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199021)(478600001)(66946007)(66556008)(66476007)(66446008)(64756008)(6916009)(4326008)(76116006)(6486002)(316002)(91956017)(54906003)(86362001)(33656002)(36756003)(83380400001)(6506007)(53546011)(6512007)(2616005)(44832011)(71200400001)(41300700001)(2906002)(5660300002)(8936002)(8676002)(38070700005)(186003)(122000001)(38100700002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?usvrvcfDNw6/wZoddO8IHSjFN9xJ0ZW1tfgTB9YP1KMILd8GToxtUQkwqFxY?=
 =?us-ascii?Q?rNc26nCAS5/UzRQYqzDN+be0ZRNvO5SbBxWk8Kv+IVJf/8p5+jXueG83cEiK?=
 =?us-ascii?Q?abpGt49nWeVRDgt60/5lZFr6MIpkWpulyb/8WMF4bAaOqzer5lGYp/Aita8z?=
 =?us-ascii?Q?ObKFN/xxEUJ4hMEH+UwmfJ+45Gn5LHirPPeM0gLbBWwAgyAUDuGzHtYgen/m?=
 =?us-ascii?Q?F8YVmOax2tbE410XZdBN1bDXtxri8vMUKWCAdPjnScBt7iUDrLmSmkRNXW7D?=
 =?us-ascii?Q?MEjNrWszMJVANqbIDJC0rg3dKvOilTqWB9fVYtZ035Fkbp2/DKz4yosGvk+w?=
 =?us-ascii?Q?nrFSqy8NTkNQQCh6VJ6KWHqt1RF2cmxpE7TWS4CzkAxSypWpiMomFSLMBaQa?=
 =?us-ascii?Q?aQa6GZ9dKysi2uUpLAb42jBRFp4sBqJjl85uNWrYdW92yyn8dJrBbm7Macik?=
 =?us-ascii?Q?yEsR35ADnjqyDGFdzyXnhz504nHQ7ZM+1OMBrNU4bBSQaF9ezihYUztaYE/c?=
 =?us-ascii?Q?BD3Dyr0UM5L2BNBq71eUh2Tq+UH1DRYXFhuV47ZuxW6kkZZPiQ4+Ni7Pjyf7?=
 =?us-ascii?Q?f3LuuhtYcTkIbbvvWvKXjosmFXDtbaw2ExtgLmBngu+GNNZ9kBkSEEL0/ZGQ?=
 =?us-ascii?Q?kNGtCcR/qbtbq6tO12+iptRECiU/I0MGO9DM58KU/2hBrmezNZP4EJWEKU0E?=
 =?us-ascii?Q?2PdmWv503/626GjCNG0h/sqANm2bJVs0eBZkgBMqKFfUfUiuB9z+8uq/f8Ni?=
 =?us-ascii?Q?senyt0f8ktJINODCZyn1Xox59CTJyf5zAmhsUoJVj4/szKGSvs9UoREtJ/Nc?=
 =?us-ascii?Q?owTcKqbRp+lMyxDlqM7SLlId62WkqnLrzokvhP+sGl0awu0fUM+V2ieH/Z4/?=
 =?us-ascii?Q?37mTWRU4Q/U5kfUTJeD4ZL+Q2Bh0X5Ce2Mhz0q4/jj9shZpaCANd22/8wXVc?=
 =?us-ascii?Q?8nh2rk8WjP1E4Q25wqa0g5lDx328mYAxiohL9rt237eo/Qzp524aWPwSOMcx?=
 =?us-ascii?Q?ltNITfxPZDKW8uxCdmAVKYsX9aQRYdheiA03m9nTuxzOklglBdVsRMyGyjt1?=
 =?us-ascii?Q?mqUUG0SwEC0HMYS3Yxq+YCvoeINiSmAs35iYS5ojIZWVizmasQO1TcLYdR/u?=
 =?us-ascii?Q?6FUC5wjyYPxznSbDiwB/lyYYiBpjPFMlBoogoNGeKaIEhJoqxw+Zl7Zduz8/?=
 =?us-ascii?Q?VjIVVKqm2HXtkj2ZHtD88ZBEo2Ib+k6Gs0YIZViVcaUPEkgM+iBXl6069cAy?=
 =?us-ascii?Q?FeR2YnDCKQJO3bhyzx6uXgPDXfmswCwSs8X+sgikGEWVtfNhDcH+tl62L2Js?=
 =?us-ascii?Q?xpkwtGfKXq+Nru55O/ck11p+pBZnIuw3RZQ0R6anOD0rT4+gh5DDKB1cfYnR?=
 =?us-ascii?Q?5O+0eXjIIAe2kjWRhtjTlLLi36DH8/gI+iY8TLgsY+v0lZ1gxOl1Ta4irVmq?=
 =?us-ascii?Q?zIbfT6YQWPunI34OpfnXXZ+sTD1A7hhDGyJlId+1QKR6fHI8LD4G3E4N4E3q?=
 =?us-ascii?Q?SKja2SJiJ7hHgggMXGz/5qYKJJV4ctfR7xSoMPTPmJVg0fcAsQ2cBMRh5YCk?=
 =?us-ascii?Q?kvmeOB3DYAdkPCZdAArkh2fcipYOM87FU08t4+KnKKr1SIoS7IuqQdEhz3xY?=
 =?us-ascii?Q?qkfvMclDq1NrOeFRmktZx4Q=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <32EBC6521E8D88428421BEF4BA06F2BE@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: lANigisv9t2aqUcghfIMLw+y7AsdWAaXNmkFId6IusKbhhwve96JvphCDEwwJ+uuOCLHw3Kqjd4lOMB1hBcskUk9F1RjiedvgiF2RRzT95IClVN+hGVwuPr3AtvY6SuuknGVu9eMm7NxmoH0BJXYNvQxAbvX6q/Y6gOMVA1+QeH4rUpEarFn1Im0ofHB8pUqXjHzomRemk+bpoU2qJuIZq7OwvTM3YInQKE/7Id10DRLwu0dObQVWxixwIXzmphEOOrrfATjOx1QpFR+QvoMxvWxIeSVuwUH8Ynx+tZqyrRIm0MBwLZI7ez/gsPmxvXNsPl/mbCbbU1eJhSZMNe1fvnmuelOT4uoOzzWmguHwd+FuCe2rcMUCqyLzPxhxbIjCdyIuYdzvxpRpUfujHDVIfojZ57eKAYYqonQSwSKZrlCqqm2CLuZd6Gr/TpS4yzu69HboNz8NyB+ZVw2KTfX1SXFUdo1nQ3DVqpPHiqa8pzoDMR9Zb5tDU5eA2AGcpI3NwjCcMncxtDH7LLrWDCd4FGF+NDsww4qZURZh6LcRGXkrEAa7QwxqqHtH/2NaSm5LijDug86BaZ6YQjnR2rrw1gDraFmq/QE78ytrQXIVWkgAOPszudS70g4ghSVafDsuxTHk/Btwg0z8lkBm7IvgLyMe/Ndw4e4jIz3z2Aw14b3HQiASuUFGZnggXlWcRuOvlTTj/6Qol30v9hDcx78Lv8u0rTKSLsXltAGpW4cjiwgYFB9hN2GmtiRNtpjA+Y+zRjclSn8hjiHvDtAWDgSag==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69c8d97-fe27-46d3-e9eb-08db4ff1b0db
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2023 18:26:07.5605 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gMvVCRq0saJg+dJnNoCSskUzd1L1o20gyyfZmirgDkB88nTtqePryDH2zrvZw7vkuwocuI+OLM3IbNrioXWPGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7440
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_13,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 suspectscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305080118
X-Proofpoint-GUID: 1MjCMUDFHz5RX6l0WST9n9ARs2yDXWze
X-Proofpoint-ORIG-GUID: 1MjCMUDFHz5RX6l0WST9n9ARs2yDXWze
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi Markus,

Please see the comments inline below.

> On May 5, 2023, at 10:58 AM, Markus Armbruster <armbru@redhat.com> wrote:
>=20
> I stumbled over this property, looked closer, and now I'm confused.
>=20
> Like most QOM properties, x-remote.auto-shutdown is virtually
> undocumented.  All we have is this comment in vfio-user-obj.c:
>=20
>    /**
>     * Usage: add options:
>     *     -machine x-remote,vfio-user=3Don,auto-shutdown=3Don
>     *     -device <PCI-device>,id=3D<pci-dev-id>
>     *     -object x-vfio-user-server,id=3D<id>,type=3Dunix,path=3D<socket=
-path>,
>     *             device=3D<pci-dev-id>
>     *
>     * Note that x-vfio-user-server object must be used with x-remote mach=
ine only.
>     * This server could only support PCI devices for now.
>     *
>     * type - SocketAddress type - presently "unix" alone is supported. Re=
quired
>     *        option
>     *
>     * path - named unix socket, it will be created by the server. It is
>     *        a required option
>     *
>     * device - id of a device on the server, a required option. PCI devic=
es
>     *          alone are supported presently.
>     *
>     * notes - x-vfio-user-server could block IO and monitor during the
>     *         initialization phase.
>     */
>=20
> This differs from docs/system/multi-process.rst, which has
>=20
>  - Example command-line for the remote process is as follows:
>=20
>      /usr/bin/qemu-system-x86_64                                        \
>      -machine x-remote                                                  \
>      -device lsi53c895a,id=3Dlsi0                                        =
 \
>      -drive id=3Ddrive_image2,file=3D/build/ol7-nvme-test-1.qcow2        =
   \
>      -device scsi-hd,id=3Ddrive2,drive=3Ddrive_image2,bus=3Dlsi0.0,scsi-i=
d=3D0  \
>      -object x-remote-object,id=3Drobj1,devid=3Dlsi0,fd=3D4,
>=20
> No mention of auto-shutdown here.
>=20
> It points to docs/devel/qemu-multiprocess, which doesn't exist.  I guess
> it's docs/devel/multi-process.rst.  Please fix that.  Anyway, no mention

Sorry about this. I will fix it.

> of auto-shutdown there, either.
>=20
> Let's try code instead.  The only use of the property is here:
>=20
>    static bool vfu_object_auto_shutdown(void)
>    {
>        bool auto_shutdown =3D true;
>        Error *local_err =3D NULL;
>=20
>        if (!current_machine) {
>            return auto_shutdown;
>        }
>=20
>        auto_shutdown =3D object_property_get_bool(OBJECT(current_machine)=
,
>                                                 "auto-shutdown",
>                                                 &local_err);
>=20
>        /*
>         * local_err would be set if no such property exists - safe to ign=
ore.
>         * Unlikely scenario as auto-shutdown is always defined for
>         * TYPE_REMOTE_MACHINE, and  TYPE_VFU_OBJECT only works with
>         * TYPE_REMOTE_MACHINE
>         */
>        if (local_err) {
>            auto_shutdown =3D true;
>            error_free(local_err);
>        }
>=20
>        return auto_shutdown;
>    }
>=20
> The comment suggests auto-shutdown should always be set with machine
> TYPE_REMOTE_MACHINE, i.e. -machine x-remote basically requires
> auto-shutdown=3Don.  Why isn't it the default then?  Why is it even
> configurable?  Use cases?

The "auto-shutdown" property tells the server if it should continue running
after all the clients disconnect or if it should shut down automatically af=
ter
the last client disconnects.

The user can set this property to "off" when the server serves multiple
QEMU clients. The server process will continue to run after the last
client disconnects, waiting for more clients to connect in the future.

>=20
> Anyway, vfu_object_auto_shutdown() returns
>=20
> (1) true when we don't have a current machine
>=20
> (2) true when getting the current machine's auto-shutdown property fails
>=20
> (3) the value of its auto-shutdown property otherwise
>=20
> Two uses:
>=20
> * In vfu_object_finalize():
>=20
>    if (!k->nr_devs && vfu_object_auto_shutdown()) {
>        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>    }
>=20
>  I guess this requests shutdown when the last TYPE_VFU_OBJECT dies.
>=20
>  SHUTDOWN_CAUSE_GUEST_SHUTDOWN is documented as
>=20
>    # @guest-shutdown: Guest shutdown/suspend request, via ACPI or other
>    #                  hardware-specific means
>=20
>  Can't say whether it's the right one to use here.
>=20
> * In VFU_OBJECT_ERROR():
>=20
>    /**
>     * VFU_OBJECT_ERROR - reports an error message. If auto_shutdown
>     * is set, it aborts the machine on error. Otherwise, it logs an
>     * error message without aborting.
>     */
>    //
>    #define VFU_OBJECT_ERROR(o, fmt, ...)                                 =
    \
>        {                                                                 =
    \
>            if (vfu_object_auto_shutdown()) {                             =
    \
>                error_setg(&error_abort, (fmt), ## __VA_ARGS__);          =
    \
>            } else {                                                      =
    \
>                error_report((fmt), ## __VA_ARGS__);                      =
    \
>            }                                                             =
    \
>        }                                                                 =
    \
>=20
>  Here, the property does something entirely different: it makes QEMU
>  *crash* on certain errors.
>=20
>  Why are these errors so harmless when auto-shutdown is off that it's
>  safe to continue, but so serious when it's on that we must crash
>  immediately?
>=20
> Could you explain to me why it makes sense to tie "automatic shutdown"
> and "crash on certain errors" together?

When auto-shutdown is "off," we don't want the server to die automatically
unless explicitly killed. As such, we report the error instead of crashing
the server when auto-shutdown is off.

--
Jag

>=20
> By the way, both uses of vfu_object_auto_shutdown() are in device code.
> I can't see how its cases (1) and (2) can be reached.
>=20


