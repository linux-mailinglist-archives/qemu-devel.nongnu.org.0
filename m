Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 994F54955C2
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 22:04:30 +0100 (CET)
Received: from localhost ([::1]:57950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAebc-0003bI-OH
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 16:04:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAZFf-0003eT-GT
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:21:28 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:55766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nAZFd-0004EJ-Fz
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 10:21:27 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20KEarbW027578; 
 Thu, 20 Jan 2022 15:21:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=sRCY52ehOPOreddk6bt78lDSBoZ1V+wOWCUcahZ6P4w=;
 b=nkYlYt6J/MkYDOCjRToLZcnsRMCL6hJzwscWLZ3YS8wGchqEs85A0voUmf/GfZE91GOx
 j6Y7VhCAeIla6gFOyGc7SJieguTJ1bHqOdxiK/n6oT1SbWKSLcs7SRpVUdQmV0tQAJ1Q
 Sm8/ttmurWI6SiicfeqbLVfDo+FIejTJPScjHAWkp44qBzz4qFX/8gGeU/Jy7Asvhgq/
 vtca95mG9spAP5Ztv+m+Isp3mKlWjvB/F1CVI+CjYm9h6p/olO7C/WtXK+pN7OMZRhmn
 NhkLXs26ZznNOhCDRdRo14skWvpgCxTOCv6Nqq7461k//MqQ5Z+ezkRGR9CDSjpyKpTn +A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dnc5f8fyh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 15:21:20 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20KF713g042609;
 Thu, 20 Jan 2022 15:21:19 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by aserp3030.oracle.com with ESMTP id 3dpvj27vvv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Jan 2022 15:21:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mUYQ5mcWmqVVH3Pm5D+N4BsUvIx3CDyyA2ny16nnHJUCM2WQPMqdklQF7MtOqVxQ1fDSyfttThbiDAGzuVm965MbMy3rrsOe1mljbzMYWdYqU4Mm2TzIUqHi3G9YpEMyEE6bnNNtDU1NApo+OP4cVAuxt8KBowIS5dmM7l9Y5V1VKYcSWi7uq2foTb8BCPH8CoEjIfsO6kvgpUc52NOnugrmHV4eFHOHiDiR1RlO+HjgnOQ6zeTxR8mkVvJWIrcUaPz9XjEtjP+t8SKKTnvSpaho2abFD5PZ6YppsrpBRs6ckE8mhKNRRuMylxegAwEeozdWoqpZNssBEvyoprpGgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRCY52ehOPOreddk6bt78lDSBoZ1V+wOWCUcahZ6P4w=;
 b=O+FL+QVD7KJC/SG0T8+RLk1waK8IGZdHF9ZWbFCDraCPPZSyFvW8nkYoCsbDg5DYRDdBK8b4K1gL7QUFWbPwMKPrzwB//SVjQ0h8ijHlZ0ZqrI8SG8I1ujUsSmcR0uEFgamfoJK0pyPUD82gsmd+KPSVwh/VcH72WFhwBPPXko7bP9ywzXObP8cEmWkt1VZAXB6ADkVgvFe2+7igW+SAoJ05o6TqAhqpTyJ9P+w6IPMfGNNfYcMidveBWEzJ9G/25JCKtEAwtSzyjkhL7x8R/vb6+UcVTeUF17nwCoT5lmNDQpjgGlJ4xX1igMUJgkB8Jsuw6W6Bp9LkupntT7ObaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRCY52ehOPOreddk6bt78lDSBoZ1V+wOWCUcahZ6P4w=;
 b=P+53XbgTxAiC+mgG3I7ELgk2iBXXWmOBmJtbYYLavcXQpwkjVnDToxj3ZVFZuVPGVJkHydPxjV9KiESvXN8T7j62M4Og+SeZA7UsOoY6xcyERrwmn9EARItnx+XdJnbmRDiWFQm4sVaqu+9jhgh4d1jzddA5xGaHsOEN+5Tul6E=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by CY4PR10MB1989.namprd10.prod.outlook.com (2603:10b6:903:11a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.12; Thu, 20 Jan
 2022 15:21:17 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::98b1:4348:5117:5fc%7]) with mapi id 15.20.4888.014; Thu, 20 Jan 2022
 15:21:17 +0000
From: Jag Raman <jag.raman@oracle.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v5 01/18] configure, meson: override C compiler for cmake
Thread-Topic: [PATCH v5 01/18] configure, meson: override C compiler for cmake
Thread-Index: AQHYDX1v0+qjGUrncEWV1g3PsztlxKxr59MAgAAf7QA=
Date: Thu, 20 Jan 2022 15:21:16 +0000
Message-ID: <A618FD83-948F-4E9A-A435-73EAFB3DB253@oracle.com>
References: <cover.1642626515.git.jag.raman@oracle.com>
 <139b14d9db775e4fc8755f9974c0b5d593a14d3b.1642626515.git.jag.raman@oracle.com>
 <6714a8f5-ce68-e081-4ae6-08bce0a12c95@redhat.com>
In-Reply-To: <6714a8f5-ce68-e081-4ae6-08bce0a12c95@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.120.0.1.13)
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f0dac78f-6703-4542-6e51-08d9dc2880fa
x-ms-traffictypediagnostic: CY4PR10MB1989:EE_
x-microsoft-antispam-prvs: <CY4PR10MB19894FEDBE3F0BFF0FC39866905A9@CY4PR10MB1989.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FG95O+oRGeBT70UTitLMuU3AcxDO004xrV1OsCJH5Z6U4jhHtUk1qXWhT4bDiWHufv/F26SL3HgCBPAEMc/eORRnRRwasLenxW2Rxjtf02Q9t9LhJ5d08y1MF5sdkrkTp7Zqu/8Wmm5WiD0zcIPED4p3p9YFSGiC/f80n+3zFwL71aB+PsBZMEeQyewqKDbmAFYOYD+HIVsHPhm2WEd5Bt8P/toowvh9cwDdY/T8wV2mMSByBQbCvGucqTISA1/HzjNal6Xi99Bi7YmzvZnGJUMNw9g4JUKANJpkbHs4lgFK6vakFuCZDrmtnxoQ+yEcc+4IDN4pwiwUKbhD+FT0IPtuDGw7Sz7ibT1AgVDuwDTuB5fIUQQpMweX2363BajySiHRXl4VbpxUbnriaaOyYPNut6XSQ48O2d+bmhux7pl9YmZmz0SeLZ2oaJ0Sk2oDn3tQCZjIfWeJUlkApzvfNe6YD5ufzUZvratgYwOATzJLbUruuADNG5fF02Sc0S/CHnx5kXy7eQBAX9tDDmw/WuY2iEYxDbseCotAMJAc/iMnVF9aQxQfHm5Q5VKUvHotSU5mxB6EMP7YPPdLQGicvvuKUzHHdmpAF9Pm9DgDGTwVrakGbIuWPd8RCRnIyyvLX0K1tZHgF24DO9dsB1yeoadHsaX4Gizj1q9jDg6NMM1Vnq3loTccufwh6E/x1LC2mIPo/REvpqbEJcoAJ1G1jt3eoPumGkyDglzmP2jB47A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(44832011)(122000001)(54906003)(66476007)(64756008)(6506007)(33656002)(66446008)(2616005)(66946007)(53546011)(8936002)(316002)(38070700005)(5660300002)(71200400001)(76116006)(86362001)(38100700002)(6916009)(186003)(6486002)(508600001)(8676002)(36756003)(6512007)(4326008)(7416002)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Cl6rOktcpw0VeTOKAmSajxBgrWkoQwO277yP+LYlub0Q/aApSpW8m6YiLOtd?=
 =?us-ascii?Q?CAEubTb6csDYEKtdOl3hrE7Ny5Ra7h7VjwN4ljKOY0eAyjTzNebsRVtqS/Vq?=
 =?us-ascii?Q?f+Eq0pM1itsA43h4hwccGacJmi7/3i4cPKyF6rM6b2CBPvMEwkyoW8J4j0iZ?=
 =?us-ascii?Q?MoRbVQpq3IBkNCtdn5AnwYS+R6ooB9822eVU+0znYaBZdg2IUYrZOjI138wH?=
 =?us-ascii?Q?U8DGt8seis2fXYNGCF/1hRKoEY+Rfic1SWA/wsIu5WooIQlkv5jUA04JZ9Fr?=
 =?us-ascii?Q?X+ftSqFvYozB29+rUo0p7BRZHy+awsVgOsMfJQbPPEHJsM6tchiYyV0LMwWE?=
 =?us-ascii?Q?QAN9JYKtS37oJ/zSl1rnMp/QSnj8P6jCLCk9O3UH9SYxnzpZBSsBrcyFkg5j?=
 =?us-ascii?Q?z6U32MR2reUSJ7XVImxYMY1ZV77x0If8PQflzXFTQ14t1oWj6Q2vopG3K7H6?=
 =?us-ascii?Q?+fATgP1+YsTYffb3Gbzo+9wAsub5X7tJ0fDE3dEnkeUIxwQDD1UwX913cxFS?=
 =?us-ascii?Q?fvJ4IlTqEtKqRmpY0xgbyPRSCko95QAvXpQUla3PQ1T0qWod7LCF4f7PMjIq?=
 =?us-ascii?Q?r9tWAHVpSHEJ81djUCrsQHZJUB99oUiq3LrkAV8Vq9KeJkCjN30zoEBdnGX0?=
 =?us-ascii?Q?dOIZvcqqRosjC7bNRUPHZOIFiXTNSvw/XtQ7tCWeSEBpFDZwK4E7D3PGfPEr?=
 =?us-ascii?Q?BTQJGqE0Xi+fO0PzbA0oPjw6GTN2YBXJ8aunnc8EA4fgiS16Q3F1YX9Df18U?=
 =?us-ascii?Q?lLh87h01nFwUV7fn3bp9SIjlUgAj2+nZjiVac4PC95pdnx02kGXdAZ8jEz60?=
 =?us-ascii?Q?dYKRACtgqUZttO252+vLu/BnxjC/5Q7pmH+sANplYO7n7yLdicpRTXYmSMtM?=
 =?us-ascii?Q?VSKTXbpeNP4rMKLCPrzBusWU8IeoqrOgzqJmHOp10+pSDK3VQq0GlgDCqkxY?=
 =?us-ascii?Q?X60fQikNXObIJvIhRBJ2akMMo10fY5iMXHdq/Y6N3jjMMB3kIPJL1BSS+BIW?=
 =?us-ascii?Q?3SFtoSwVaGKCipsk1ePIGDRKrmAN73dbEAdtf4ZpBzOiR51uTKbu0OrCF1qM?=
 =?us-ascii?Q?5sk8f8VUr45dAXh8BBVJmgOSdOT13uOK9/YhXehj1Cgv/S4gU2a0BGmvPZZH?=
 =?us-ascii?Q?fLQCTVq8jVmqJnfE3pVv2yYbixm9sEtAxJXzGMQY/giZt8wZygM53QeF7TNB?=
 =?us-ascii?Q?0rKNhtZlA8GUjJVAq37CIZCnW4AUB8jhpEggxTzcFwdBSt+KqFPwBWZi68dT?=
 =?us-ascii?Q?Tp5eqPBA606nmwXnsp97ov3A1ezemq446aVYE9K/HBczN9NS6I4pqkkdYbPI?=
 =?us-ascii?Q?9FCmaUYhEbbFYaqPpZy+hwqk1B2S79Zxnt1wZYVOzp6d7Lq8OueJG0XMmHhd?=
 =?us-ascii?Q?hXrl06c2jHf97UKi46rLMjwpSWIawd/rRVpxkKFEUjKFxba4RRETzXbzUVaX?=
 =?us-ascii?Q?c2ct60EkWuJ134Z56E0Hzcn1al+YYkd6ZKtwNKZv1lj3ZpLSfYBpASGQQ1Ce?=
 =?us-ascii?Q?EM973Cq5iS6tP6mas8WowkngqFxWEiZ+EdYtu+yTeDaX92eZWoUepZrtf0KR?=
 =?us-ascii?Q?kJZXe+YRez0MHNhhtnVgifUMc/nWRoWC1t2i1MNtdzzY73Q8H63mWZrhyeLN?=
 =?us-ascii?Q?xioX3Ea9t19cmv1Ra9qWUv/XQZDPtb9nAxGuL4Fl3Hu5sBpw83eLc5d4L7PS?=
 =?us-ascii?Q?s+G9Cw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <5E934BF0CCBDF146A3989644A61B95E0@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0dac78f-6703-4542-6e51-08d9dc2880fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2022 15:21:16.9084 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LcaTuhhMn1+Ra32CK49BrptooSEh22wAp5KBoumwyjSAX+4a2wYtAD3b0Mv3yoBaAdnu6Ce2Ksbosv/L+HxnLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1989
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10232
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 spamscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201200080
X-Proofpoint-GUID: RgwQSfD-hkeEFH0l22b3hvEIiDx0yzlX
X-Proofpoint-ORIG-GUID: RgwQSfD-hkeEFH0l22b3hvEIiDx0yzlX
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "eduardo@habkost.net" <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "bleal@redhat.com" <bleal@redhat.com>,
 John Johnson <john.g.johnson@oracle.com>,
 "john.levon@nutanix.com" <john.levon@nutanix.com>,
 qemu-devel <qemu-devel@nongnu.org>, "armbru@redhat.com" <armbru@redhat.com>,
 "quintela@redhat.com" <quintela@redhat.com>, "mst@redhat.com" <mst@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "thanos.makatos@nutanix.com" <thanos.makatos@nutanix.com>,
 "marcandre.lureau@gmail.com" <marcandre.lureau@gmail.com>,
 "eblake@redhat.com" <eblake@redhat.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "f4bug@amsat.org" <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Jan 20, 2022, at 8:27 AM, Paolo Bonzini <pbonzini@redhat.com> wrote:
>=20
> On 1/19/22 22:41, Jagannathan Raman wrote:
>> The compiler path that cmake gets from meson is corrupted. It results in
>> the following error:
>> | -- The C compiler identification is unknown
>> | CMake Error at CMakeLists.txt:35 (project):
>> | The CMAKE_C_COMPILER:
>> | /opt/rh/devtoolset-9/root/bin/cc;-m64;-mcx16
>> | is not a full path to an existing compiler tool.
>> Explicitly specify the C compiler for cmake to avoid this error
>> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
>> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
>=20
> This should not be needed anymore, as the bug in Meson has been fixed.

OK, will drop this patch.

Thank you!

>=20
> Paolo
>=20
>>  configure | 2 ++
>>  1 file changed, 2 insertions(+)
>> diff --git a/configure b/configure
>> index e1a31fb332..6a865f8713 100755
>> --- a/configure
>> +++ b/configure
>> @@ -3747,6 +3747,8 @@ if test "$skip_meson" =3D no; then
>>    echo "cpp_args =3D [$(meson_quote $CXXFLAGS $EXTRA_CXXFLAGS)]" >> $cr=
oss
>>    echo "c_link_args =3D [$(meson_quote $CFLAGS $LDFLAGS $EXTRA_CFLAGS $=
EXTRA_LDFLAGS)]" >> $cross
>>    echo "cpp_link_args =3D [$(meson_quote $CXXFLAGS $LDFLAGS $EXTRA_CXXF=
LAGS $EXTRA_LDFLAGS)]" >> $cross
>> +  echo "[cmake]" >> $cross
>> +  echo "CMAKE_C_COMPILER =3D [$(meson_quote $cc $CPU_CFLAGS)]" >> $cros=
s
>>    echo "[binaries]" >> $cross
>>    echo "c =3D [$(meson_quote $cc $CPU_CFLAGS)]" >> $cross
>>    test -n "$cxx" && echo "cpp =3D [$(meson_quote $cxx $CPU_CFLAGS)]" >>=
 $cross
>=20


