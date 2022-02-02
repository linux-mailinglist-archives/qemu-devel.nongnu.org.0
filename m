Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F954A7636
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 17:52:46 +0100 (CET)
Received: from localhost ([::1]:38144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFIs9-00079k-NP
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 11:52:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nFHqV-0006zd-49
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 10:46:59 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:45534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david.edmondson@oracle.com>)
 id 1nFHq1-00043Y-Vz
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 10:46:58 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 212Fa9Ls022133; 
 Wed, 2 Feb 2022 15:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : references : date : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=pZpIz+xPYOO77JYrftETJzQqswQ5T9Zta9L2ZbLO/xk=;
 b=nuLptrQROoa5bZZFPGTeoEUrrnIxFUbf+eJkSierMQjuUmxgw0WSASgV3hnEoE6yZJgH
 +F+oO1a/lDChc5ocbmZO0NpXQAHl4+rRc//GJhHZCVBOKKF9zPiByrJyvJK5WbqzBp5f
 Opw33BCEsBRlvmeXXba/9mgyOgKf2iArmaoh4Bm6F9xXZF6RfD50xoi1HOpzEGSTs1X4
 vcbVg8NlhyfQS6i6ck9+ds/wI+LKRZ4aI9mQroXcglKQKF49mJW4FtWxfuH615B3z6q2
 xuSgYvLoS9++yhajBBn9Yo47BGXacB5qQW599ltGRV4yEZhMKbKp5+EqXJjw61tG5U1N 8w== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dxnk2nyv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Feb 2022 15:46:22 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 212FjCqt171401;
 Wed, 2 Feb 2022 15:46:21 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
 by aserp3020.oracle.com with ESMTP id 3dvwd8e76a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 02 Feb 2022 15:46:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwAFg2KZ+GQvc1f3JeoSUh+4NiUGl5gkTrlMhQ9EdrlmMxbdM5D2SBtf4QgJtpHaau7DCJ9wnpySMSgQ45gmK58fRZTGdSo2OrJn81KtTymxmlbcJ0u89tMQcuUYaS/iZq32ILQlQjmplySspqe/X+FktB53Wi3nIPxv3154xHtwevWOCdW1RHLGlF6uOf9IWCPpDQcXHUe9wFgJHD0drL5qB8NbSKUFUfHz3L74zPm5zMF/Sb1LWcUD5U/GyOdeCT8hKinOvLKINQaOtTRh15e5+1pdsuzsc21q5yjgm8XfT1zcFFg18b2ke+zhlo4/xXveASsrCPDljluisiRrWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pZpIz+xPYOO77JYrftETJzQqswQ5T9Zta9L2ZbLO/xk=;
 b=h18faoe+kZ0teSaHPeNVXNhZ+EOvZexbUrzzGk7puMXjKZY8WZmXsbWrlOtkr44jpGSXuKQCg4Fkpt7VAAHOBclnJonyNhl7OACB1/KnHNTGBUg2tFpb2eDtXPUw696NpfyOl13ZNwDYM/rdjsU+HrAKWdzZGrSy7GND+vke/o1SrZPMGEnKacy/hgakmy5NG4Kvcapyj94LVA6Tp03ranF/q+FbUGrWIPUEDUyom14GFoQ2CzaZO27zqbS6H0zGSkCy9mhkPIu7JN0GABZgQimFmjgyI3WfZxiznwBToKJwYm2bGujuvWzZJD/X8Xmy721p1kOB6v0KhJpIgZNOvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZpIz+xPYOO77JYrftETJzQqswQ5T9Zta9L2ZbLO/xk=;
 b=AQrcZdnR64PDWdENP0dQkPL7bZq79zosgxYp8Ri5mKHh7j+M2nZ5AtWjVQ2aCtFslBKBNCRy03vTQK2mnAiAZjbsvxjMafhkaWxmHltbf0S4oTnrTLNLktju3iB7UOnkClMcPO4TavAuwZgBpZiqDcPqnr9CA08VKrvp0yXSzq8=
Received: from DS7PR10MB4926.namprd10.prod.outlook.com (2603:10b6:5:3ac::20)
 by BN8PR10MB3569.namprd10.prod.outlook.com (2603:10b6:408:bd::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Wed, 2 Feb
 2022 15:46:19 +0000
Received: from DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::fc84:597b:4ef:55d]) by DS7PR10MB4926.namprd10.prod.outlook.com
 ([fe80::fc84:597b:4ef:55d%4]) with mapi id 15.20.4951.012; Wed, 2 Feb 2022
 15:46:19 +0000
From: David Edmondson <david.edmondson@oracle.com>
To: Leonardo =?utf-8?Q?Br=C3=A1s?= <leobras@redhat.com>
Subject: Re: [PATCH v1 1/1] target/i386: Mask xstate_bv based on the cpu
 enabled features
References: <20220129094644.385841-1-leobras@redhat.com>
 <cun8ruwrrqs.fsf@oracle.com>
 <7ae12835b7423d473ee5e6fd47254b078654e251.camel@redhat.com>
Date: Wed, 02 Feb 2022 15:46:14 +0000
In-Reply-To: <7ae12835b7423d473ee5e6fd47254b078654e251.camel@redhat.com>
 ("Leonardo =?utf-8?Q?Br=C3=A1s=22's?= message of "Tue, 01 Feb 2022 16:09:57
 -0300")
Message-ID: <cun1r0lqnjt.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.0.50 (gnu/linux)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO4P123CA0487.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::6) To DS7PR10MB4926.namprd10.prod.outlook.com
 (2603:10b6:5:3ac::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e05d40af-63dc-46a7-3c79-08d9e66327cb
X-MS-TrafficTypeDiagnostic: BN8PR10MB3569:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB35698DD388836BA11A4F6A0A88279@BN8PR10MB3569.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZDPj4nGwOj0pEhL8N7aKMWFPBeBypytC9eEMiyZGb3gtnul03+z+Scnu8KpQSigjh3Wkt26MT3zl0SUBI99drz9pNs2a2YAkIl5tnakHBAvjTpoQZR7dzVRmR1FvGuc+LbOJVf7zb1NnRZ/u9rtF5lwz4zs00/fuyCXLNe60517pwP07vIYAiwFrO9IHPc9BWb/MTHlvcwoDoV8gjdZE2xmdw8N2S/CwF1eIT1Lq+GUZv7Z+kjeKfOggyVjboDFYMJ9tgX5J++9+PY0QHDoV5dyA3W31jjGhljX6hRmeQ50sh6/d/lfkAsrhM5Hhq8/kuin9Mb4F8xey+Ud/PIPk7TTNr7QpfI/5BStCnoUbjVusteZqRx24U5EnlHZpI+F4o0hGFfsKCl32NImFFwHaa5KAqH8F1coB2yGWqmIpYk/Rg6Ma1CtUuEcDTD2KTTmS+z/ybcBLHAJspHojX4s7or+Za6aGjtRloPxIwh8S2ZnNBXXQlKwxJRmbmqA85GvpWuQ9vX3paUOyQimuCTlnxZKZwyVQdTcTxCti8tzkJ/NXawlVnUX2M1GYHsYkuIWc5ajDKdR3wU3gNk/rwxyBuxskVtBmWYypN1Cgk1IOP3fqlaSvci34WKDzx1EZV/cgaLoM3a0FbjKKER1+9/IJvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4926.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(52116002)(2616005)(6506007)(5660300002)(83380400001)(186003)(6512007)(2906002)(44832011)(8936002)(36756003)(8676002)(66556008)(38100700002)(316002)(6486002)(66946007)(508600001)(6666004)(66476007)(6916009)(86362001)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHRiTGFxN0hQa3h6clhzSHJjcTFsM0IyQmllb29VMEkrMUxVRlhTNzJVdllu?=
 =?utf-8?B?T0VCSWRTVzFpRWR6cm9HUFVPRHF1M3ErUzMrMTF6T1dIZm9WbStrb1hNTGRU?=
 =?utf-8?B?SnhRWE0veUZQS0NvU2dMVTgrM1NvTStVWTNzNWdBNXdvKzNyQk1tdkZzUG9D?=
 =?utf-8?B?VDRobVd6NjBYOHNlR092bjEwWUFPbnFqWHA3NW1DVUVTM20zeTZ6MDZFTlY2?=
 =?utf-8?B?VUlUMEpkSEM1WndZY2x3Z1ZXaDRVRDJWMGNtWjZ3QUFra0lrUVBUR0FURVN5?=
 =?utf-8?B?VmhDR2tJalgxa1Rac3RGbkZhV0k5Sjk5UWtsVlN5aytqbnBQbmpxMzJwL2E0?=
 =?utf-8?B?SDRmKzIvbzJaMUNQYS8zQ0U0ZXc5SThHSGtEZmIzSWVsUUlLeStnejRMWmt5?=
 =?utf-8?B?V2ltb2NrZ1VEUWxCS1dWY0hxbTdiY2tkdXVRWlQ3ZjlzZ2xsa2dqOEovNDVh?=
 =?utf-8?B?bnp6eGprWjMyUjVMYjVDUXRjL3FNUC9TMC9aRnpKSnNWalByVERsanRhWjdL?=
 =?utf-8?B?OEMwTlo2ODJMaDFFRzdITmg5VFJ5d0lLdmh6ekFtTlA5TjhSUmRiSnJzcm1Y?=
 =?utf-8?B?cG44QkRGUUdUb0EzQ3lKRXoxZFk4dFlVVEJPSGhQOWNXcjlqNjA4R3JBTXRq?=
 =?utf-8?B?L3k1bXJQQW9BanlQbFlEY0huMzJOYUlPMWxyS2ZpMi9BVWcrQjBBU2p0OXpF?=
 =?utf-8?B?TUlWbnVIbmdOLzhhS2NPSjU4U3ZRZWhubTNSblhyd3VpNlFFdEcyUk4yNWNC?=
 =?utf-8?B?YUZCejJwaCttMXFBVmcySldaWUJFVmp5K3lRbUFmZlFMNUZOSnp3UFpNaXJq?=
 =?utf-8?B?aXB6c1JqQlFXV08yaTNUQU54anhPQktzSlp0Uk1MQWsyMHhGNGVSWk1PZlI0?=
 =?utf-8?B?Zy9PczQxdlhndm9YVDdEWnE2S05zZjdPaFR0a2xDdzJibG9EZjErUHFpYkp2?=
 =?utf-8?B?OENRTWF3WFJJVFRiRkFNNkE4TDROa05PNkpNV2ZFTi9sMW4yQnlTT1BIZm9w?=
 =?utf-8?B?a0VucHN2Zmc1MSt1eVExcGxzbmhvOUsrUHBWS1hONHMwbmY1ZFAxWUhITDk1?=
 =?utf-8?B?NDNtWjkwNWtZWndwL2IrVEx3Q3VjNmJjU0VNejlWdFpwNmd5UmN6eG52MWxx?=
 =?utf-8?B?eTBKYlFuQjdnOHcweTVQQ09CY05KelFuQXdjU3JxNGhxdFg0clpoajgzZW44?=
 =?utf-8?B?amdKVE90UlpoZDBTSndSTFg1ME1YZ2hYdklBTGFZWmx5Y0hIaDlaWmNzTUR2?=
 =?utf-8?B?eUl3V0RKazk3WFJ6LzY4VllHMi9JVFJKTko3eERqQksrelBIdHdaVGpFOXVu?=
 =?utf-8?B?ZERobWl0TlB5SUR4UVVnRW1VdmprTFRha1FqbVE5UTc1YkJuTG9ybklIT0JQ?=
 =?utf-8?B?Wk1wRXNRKzVGQ1YwMFJKNjM0ellMQjFqSTE4Z1NDajloa293MjNzYk84c1pj?=
 =?utf-8?B?UFRMZFhGWjVESUkrV2l1YWowc3Q2QTN1V09oM2w1bDF2c1NuVEtENklMZ0Q2?=
 =?utf-8?B?VUZuSE50ZTBDbDluVmY3bWNQVjJ5MWtQb0xsWTNId3BRaC9INUhKcnFxMGNS?=
 =?utf-8?B?ZFhBZ0JrdXo5alBwV2UvRGxmUTNQcytielkxWkxRc013UURnSW44MmhnYkh6?=
 =?utf-8?B?Z0l6Q1NBK3NHWW14U3NqK040ZDBkYmdlbm5NL1pJY2ZXL2pCTnN1WUlBdHVz?=
 =?utf-8?B?aGZWY1Y3TTdaYjNHekduY0NQeE1XVVdNVzVOZSt2Y2lkTTY2c0g1a0l1Uy9R?=
 =?utf-8?B?N1RQVFJkdTdnSzh2aUs0aVkzTUFDRG94bWlvbjhKN2s2QWFOWW5zZHY4aDRD?=
 =?utf-8?B?R0ZQVmVXZ1J0eGNUR1oyVk9rYmllR25uSlcrejZaZHh2UmVPc0FrU05JbWtQ?=
 =?utf-8?B?ZkZFbDQ1MUtwbWpCV3FNWkJLY0gxcS9PNDN2b0YwRFJXQTZOR1VIdldYK3N0?=
 =?utf-8?B?dlIrRTJnOW13RmdoMEFOSC84WG9PbHJ0QWRHbzRrckwxbmN5V1FTZnQydTlp?=
 =?utf-8?B?N3dPRG5ZS21wTkdNaGdFZ0xlVUU4TjBzeDNuWjRaZE9sREFmMm94aHE2dVd5?=
 =?utf-8?B?dGdpd01ZOUJkSngzSW9DNkh1T041bFNtNzFLQ0t1MGNNeDB1TVBWYXBkRU5l?=
 =?utf-8?B?Vy9VKzkrWGFRN0RWUjVIMHh6Mlc2aXFjTjM3dzZiYXNlc25NZVA0aVpyUkVD?=
 =?utf-8?B?ZWlldTZCdzYwVzF6dmlaamxKWVFOVHY2NEpsRm5XbzlCeTVSUDYrVWd2MDFC?=
 =?utf-8?B?dCtweXlXZ1pNcUpuMTBRR3hsNWM2cWxDc2IvanMwS1lZTEt5SDFOaFBwUzQ3?=
 =?utf-8?Q?qQZAHUaoYpBaLvFL1F?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e05d40af-63dc-46a7-3c79-08d9e66327cb
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4926.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 15:46:19.4667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10U+hmNkolISuS3yfT3cAI6uG5XQfXt3KM0LzoRcpZhgZ04tSVV1gs9ksy7jg4vNbYFHmWe8WuecQcT1NDxArtIF+I9VLx/c5EL7LW1kL2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3569
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10246
 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202020087
X-Proofpoint-GUID: 7XvGGTbubzapb0r1P64v_nhro-IEmOpN
X-Proofpoint-ORIG-GUID: 7XvGGTbubzapb0r1P64v_nhro-IEmOpN
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=david.edmondson@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2022-02-01 at 16:09:57 -03, Leonardo Br=C3=A1s wrote:

> Hello David, thanks for this feedback!
>
> On Mon, 2022-01-31 at 12:53 +0000, David Edmondson wrote:
>> On Saturday, 2022-01-29 at 06:46:45 -03, Leonardo Bras wrote:
>>=20
>> > The following steps describe a migration bug:
>> > 1 - Bring up a VM with -cpu EPYC on a host with EPYC-Milan cpu
>> > 2 - Migrate to a host with EPYC-Naples cpu
>> >=20
>> > The guest kernel crashes shortly after the migration.
>> >=20
>> > The crash happens due to a fault caused by XRSTOR:
>> > A set bit in XSTATE_BV is not set in XCR0.
>> > The faulting bit is FEATURE_PKRU (enabled in Milan, but not in
>> > Naples)
>>=20
>> I'm trying to understand how this happens.
>>=20
>> If we boot on EPYC-Milan with "-cpu EPYC", the PKRU feature should
>> not
>> be exposed to the VM (it is not available in the EPYC CPU).
>>=20
>> Given this, how would bit 0x200 (representing PKRU) end up set in
>> xstate_bv?
>
> During my debug, I noticed this bit gets set before the kernel even
> starts.=20
>
> It's possible Seabios and/or IPXE are somehow setting 0x200 using the
> xrstor command. I am not sure if qemu is able to stop this in KVM mode.

I don't believe that this should be possible.

If the CPU is set to EPYC in QEMU then .features[FEAT_7_0_ECX] does not
include CPUID_7_0_ECX_PKU, which in turn means that when
x86_cpu_enable_xsave_components() generates FEAT_XSAVE_COMP_LO it should
not set XSTATE_PKRU_BIT.

Given that, KVM's vcpu->arch.guest_supported_xcr0 will not include
XSTATE_PKRU_BIT, and __kvm_set_xcr() should not allow that bit to be
set when it intercepts the guest xsetbv instruction.

dme.
--=20
Please forgive me if I act a little strange, for I know not what I do.

