Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A7D4E7A62
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:22:38 +0100 (CET)
Received: from localhost ([::1]:51378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpW9-0001sO-27
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:22:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTm-0007KY-BP
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:10 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:20090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nXpTj-00033X-8M
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:20:09 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PHMHaY031945; 
 Fri, 25 Mar 2022 19:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=Yt9sf+8d0fvplRO+dyCK0MaSwMdvMBjW0vGx56suLHg=;
 b=SkrroF1NrN6cOvii4GpQANPu1KTBMe2mtrH+LEBBHL1ihvZoHR0S1p9Fj+K0rr4gimel
 DXxMLPEN1F4avP1c5MfC9OMEYrNcIB/VacSFnQ5xW3OuF/RcFblCvr3GeZ/KjHxM9ljp
 k1lQI8u3jWrfpe8Ul/VS8uwlKITppiI+ej2E0UUdQ8RTJTx3QyVEUGlmPs8zjHrlvHkH
 iGmFvCgeaZWbW5Eychlax09AecAgb+R+82/lUzguBg7tz5R8yNvJTJhAsLprWuHDPbq6
 Erk9tDVobYDyulemdOQpVjHKW6+/50082r0jHpgUXrnk+4evk+1/mmSy4lfiKorX4Ojw Qw== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew5y287g0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:19:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJHl2l014815;
 Fri, 25 Mar 2022 19:19:54 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2048.outbound.protection.outlook.com [104.47.56.48])
 by aserp3030.oracle.com with ESMTP id 3ew5793v04-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:19:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xwt82ON1onmi/87rVgBE4JOaIC+ieIQgXL/QZ7PWKgJXR1/2TId7DioMZjcK/AlBlNKnb8a4IDPykwoeyMZxJRoqddNG4pjTgAPKndRAgdLHFJKG8niTKoRU6WHn+MHGCUWystmVeY69Sy3VGRN1ZmyyON2INOjOG/04LXrpS1ZsHLrJTmjSa6/zZrtF2tNImnaWSVMhBjGa4Lk/xTVlhwpDXN9s5XtxpmK0eG/s48UZq8V/qzMvHeZ4JrCwIVfXxdhooYyC7aPj47I2XTS3oBJf0OAa1Ejd8kB3TatgTbkAvMuuLtX3yaEZA7x/Qbq+oXY9G6xusTlpzcP+ai6PBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yt9sf+8d0fvplRO+dyCK0MaSwMdvMBjW0vGx56suLHg=;
 b=g3js1Pp1uA/B337muLZhNrOhZzXyzgjxTeqEM+Dj3qDtJruwi7H2dFULRhgl0ZwPS80b6c8bULvnTYuMZrZDzG/jhWsE7B37u9SfSBXXng3rCQPcHTBWC2ydG23W4Bx7SnO1f7M0O61ruutPzkokA4+E8+E3NAB+yTxg4lZpx6H2BqYWTXzJUhKAwfVKv+QG2GY4D6e2KtEhZVcZqyyks39qU34HJO/klpq36vg7Pe/vhic5JoHLwS71tU2P3f8VZUNTVaH6LYDcGKH8o7E3hqb8MUKoYClGI9/6gZwTxoKUvqV9mW5SnoIrkMD+g1/45T4HNwTE+GcAEyNFlckXoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yt9sf+8d0fvplRO+dyCK0MaSwMdvMBjW0vGx56suLHg=;
 b=bVmYwbeO5Ht3um+cHqQqkaf3EqpoL+O/QB0XUPCowVlZZsmX6+FBRDm0r2AYVgn4hJSDx6teCP52IoFejE+bw/qgsLexMR6KPgXFpuxr+6levFM4vex1yWg+FxX/lLNyz4m8FmhbJjBys5yfyDwDENeKzLjMgzKHyPry7tz2G/8=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by BN0PR10MB5206.namprd10.prod.outlook.com (2603:10b6:408:127::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 19:19:52 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::508e:7f79:394:563a%5]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 19:19:52 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 00/17] vfio-user server in QEMU
Date: Fri, 25 Mar 2022 15:19:29 -0400
Message-Id: <cover.1648234157.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR2101CA0024.namprd21.prod.outlook.com
 (2603:10b6:805:106::34) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc867499-03b4-4552-eb37-08da0e946fb3
X-MS-TrafficTypeDiagnostic: BN0PR10MB5206:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB5206087AB30129C93DF49E84901A9@BN0PR10MB5206.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DiKvx4N5tKZniBMCRYkKBNYnJoWNt10JOUTaYhx7eM/3paUp1spOTnkdxcJtIlMDlMYEcJ2xYC7X0/QhUyYPoUuOzMLqDo+/2fLKSb2wEnLPVRDupvIaIJTifqSpskHGQ4YcAshKWFZgUm6HmycXWsZ22El9xsz+wEgDUahucVuz60cKgXW5EgwQYr0rdsjzL596Y7v5Ymnvduv3U+VQfqzyzabp6jigyIm+zk/ZWaz00XtvBv5ZoLkiBk0fWtSR6bDayIV4pS1j0wTU+PlRB0sqh/4Kvu1jtmTsPHlHysq8as9Hys0dPXKWJSwqaLJn6x51gpune51RCKzzFNjfap43lxowAT1tBnM+mvcyzbVv9xQ8X1QvVQOBC4YGJDTLXSgmNogzsMFvXTgkDleYWb3T9hCcBaC9mt2C3vMhfIkU8buHx1RZKjpC9W8fHCM0Ym5fmxOZbrIH2joho6OsCPKdaQxAplkkakKieqhq3U3A874rZ1zSNscPLOQVfCw5D8v6QvjPpmnLMtpHH1wp9qT2xGkbLRyKVgu13odokimmvUxIqYtmvLBAjqtShr4QAwnAttKOHUmGh1LejP7aAixJrZiQZcgiEoH4WcE1/vdGXdpOeGG/TQWGUopnItvIBBXecmu0oCPLp20TEj/vmu6aAcKnz1e30lyj9NxPWS9921cGf1b1ScjT4fA1Jci10uSrmVdKl8vzs8chtS2fOHaIrM8+d/NDEtWxSwkwvi0tPlrMR6wfd71OHQL7t9Tz24ukPWrxIatjKdZ2Wgs3Y16t6swdKVwus+b54YPNXYjY60ksT5TXs8qcfuXxDYB8qFx0A0Znog/TuAucjMWfLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(186003)(107886003)(316002)(2616005)(26005)(83380400001)(6486002)(36756003)(6666004)(6512007)(6506007)(52116002)(66946007)(2906002)(86362001)(508600001)(966005)(38100700002)(38350700002)(6916009)(66476007)(8936002)(7416002)(5660300002)(66556008)(8676002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzZwR3NmR1lPRHVTQzZtMnJ1Yk1ZSVpLTW9BSEdVdkRUWG9veGZ6VmNIMjFn?=
 =?utf-8?B?N2xHbW8rL0JMcnlKN2NpRnp6QVFCNnFsVzBKT3V6cXkyT0FXQkV5aktSd0lh?=
 =?utf-8?B?dk52V3EyUkdqa2dIenJzZGg1MDU1YmpIWHpVV3piT3Z0UGx3eVY4cDJGUkgv?=
 =?utf-8?B?Y1grY2phQldOY2s4OHFpMjN0S2Q5a3Rma1d0OXJKbnRsV1FQNjhCOG85LzVj?=
 =?utf-8?B?SHFiczgrbXh4YzNpSjV6c1RFOXljN1hhS09YQU0raTBHUVVmNFdXbk5VNzho?=
 =?utf-8?B?RG1iNkJqeHFEaDdRQS9rNTJEYnRBb1pZMmthVFNtMWlzK2ErQnBmcFVRaTJ1?=
 =?utf-8?B?SkttMjhXRzRFWHdKK3grekpzSEpVY2tjUStPeXk5dEpWcjV3MTJjUmxoM01v?=
 =?utf-8?B?bVJkcUJ1RUxEdy9yMUJTVFBZcWVvM2hGV2xPM3FROEVpbHhVVWhDMHFxTG5m?=
 =?utf-8?B?WEJjUnh4ZnJTUUl4SmJHeEJrblRRSDdReTdRZXRjdkVQUEVtZjNiak5BYjBx?=
 =?utf-8?B?Q3d3UVUrdHltYWk3R1ZlSk1aT0d5ZFZjY3J1RjBNNHFuUlRJNmlzZnRTekNS?=
 =?utf-8?B?RWhaU0thTTRQc1ZCNHZsUGpNeGpVRmp4ZE1JaDA4UDBndHowYk1Hc2dNRDcr?=
 =?utf-8?B?cHBWUDc2a1B4SyswY2xtWlR3WUU3ajlUMldZdzlxa0xwRDFrS1dJUFJmVGhS?=
 =?utf-8?B?ekVmV1dNU2xyb0NXNGhiaFNzZHN4K2JId1NTR29TRUxVeWwvTHhkT0JVL2tU?=
 =?utf-8?B?d0ZjdmkrWFdzbHJMYm9CcjR5VStickpKcWxCTCtTQkorVzJjcXE5Q0pwN3Mv?=
 =?utf-8?B?bDl6RDVmeElHeWRtWC9TL1czbWZacVM4ZjFidFQ5TjdlQUlOaVdSZWt2N1RD?=
 =?utf-8?B?eFRCL1c4dktWbExoalFhd08rTWtCLy9teTIvRWtDcjhaQTRxYjFraVorUk54?=
 =?utf-8?B?OUhRd0ZybU9qcGNhWDh4TUVyV3N3RDJEN1hEOGpuZXZJN1c1L2daQzRzVnky?=
 =?utf-8?B?c1BFdEJLNjduMGt5dUU2Z09nbWRTbTIzTVNZSVU0WmNuc3p2WDg5eTBDakpB?=
 =?utf-8?B?VnIvRnBOeW0vK3I4WCtKdkUzSm9FZ09iM3lWMXk3K2VBSWRYY1JpVmlHSVNh?=
 =?utf-8?B?K1RoS2l2NkxZOHEwaHcycG44U2tmVnF3NDQ1anJ1VEh2aC8wV0F6cmFDZlIw?=
 =?utf-8?B?ZEVaUWxwdXFGSFVjUndPa3gxY0YxT1BMK2UzWmFxd2JodjdkdkZ2NHNmek5F?=
 =?utf-8?B?UTVrcUU2MlUybU1UaWdMZElzYTN3N0tnWVNLOVZyeHVXUU5xeFM0bXo1amFr?=
 =?utf-8?B?dHpNV21rRTh3L3FvREZPOGcrSkRGRHVqM3NKWE4rSDBobEIvRXpjMG8xUkFG?=
 =?utf-8?B?SkZscHpZcUtSdlRzMkdkQm0wWFdGY0swZXJDQzFGU24xWGgvbHllV1QwRW12?=
 =?utf-8?B?R2xWb256QWp0Y0xhbzZ1MjBuKzAwOTQ3T3o2UFRGUDZaVFErSm1IVWpNSEZu?=
 =?utf-8?B?dDNxSVdVOUxCcjBXVGlEOFBrWVBUQjRiSmV6L0Y3MGZwN215QngvVzZjZE0y?=
 =?utf-8?B?Mk5hcWJRV3RFZllPNTg2dVpiamZIdlpoTkM2WXN0WFhBMVdwd2JNYzdyWWRD?=
 =?utf-8?B?dGw0UmU0MXRCUHpYVnM1cWRrcWZxczlxUjh6Nm1MTlpKaURTRytvREYzZlQw?=
 =?utf-8?B?RWg0WWFIdElaVG9SbVBNQkhzVjg5aVZWQUZXMUVoQjVQcTZIbDBYaUZKRzNE?=
 =?utf-8?B?SXptTTBpYkNQVUFJNFlLcE9xUHo0NlV6ajI5U1lHbVllbUk1QzE0akVpYXRI?=
 =?utf-8?B?bUNJWTJQaWx2RC9oSGpIdmluRDRBYnUrK3ZWQ2toTnVWZkpYYnBQeTJ5bTJB?=
 =?utf-8?B?b0JSSTdURzB5NzE2QitkRENmOHBYVmRqd25aMVRVNUdrSFdLblphMWJQMnFO?=
 =?utf-8?B?MGg4T0N6MHdzZ0JiQTg0U0J3bVArUWl0WmpKZlBjSThrL3JJeFhSc3dsdnN4?=
 =?utf-8?B?THVYNWRFL3RQd1BHOERTb0hlR1E1ajVGOVFkYVE5NUdFRkR1aEFRbEdPbkZB?=
 =?utf-8?B?MjRneXFueTBjUytJT2dSRFRCSTNIbk0rQnE5QktmNWRLdXM2MFRFSGJucjAx?=
 =?utf-8?B?SWJqV203enJkSHpYUUxTbVhtOWhaY0NoKzJFdVdMTkJyNWYrcytueVh5bWZB?=
 =?utf-8?B?dHVpYWozbVNIbEhqc2ZmUlNTTHZtSEFRQVNyblVLeXF4Mm41dEphNTdWemR2?=
 =?utf-8?B?dFc3cWxjRVRwYUFVUkJLNUpVeGhVSDh5eUN6WjFSTzJ5dXg0MjlibWNiTVdK?=
 =?utf-8?B?YnNZRldENE9YK1NqcWdva2I4VU1JeEk4ZXNlNTZlZDRUYVpxQ3JmZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc867499-03b4-4552-eb37-08da0e946fb3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:19:52.0544 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/jG3fcrs8N4thwFB9B8gmJkMLgGQWo+7g0Ze8pKivyBvXpdGvbQDEMPcXePJ9tZq8ZVlHYiZ6sxXkD39+CA7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5206
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250106
X-Proofpoint-GUID: CLjJNs-_ybdIJSNOCfR1Lu4Vu3OBqGet
X-Proofpoint-ORIG-GUID: CLjJNs-_ybdIJSNOCfR1Lu4Vu3OBqGet
Received-SPF: pass client-ip=205.220.177.32; envelope-from=jag.raman@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 berrange@redhat.com, bleal@redhat.com, john.levon@nutanix.com, mst@redhat.com,
 armbru@redhat.com, quintela@redhat.com, f4bug@amsat.org,
 alex.williamson@redhat.com, kanth.ghatraju@oracle.com, stefanha@redhat.com,
 thanos.makatos@nutanix.com, pbonzini@redhat.com, jag.raman@oracle.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This is v7 of the server side changes to enable vfio-user in QEMU.

Thank you very much for reviewing the last revision of this series!

In this revision, we've dropped the patches concerning migration
due to a major changes in the VFIO PCI protocol. We are changing the
client, library and server to conform with the updated spec, and
will send the migration patches for review separately.

The review of client side changes are happening parallelly [1]. The
avocado test in Patch 17 of this series depends on the client, as
such it has to wait until client changes are available. However,
we run the avocado test, among others, to confirm that the server
is working as expected - we do it before submitting patches for
review each time. The following repo applies this series on the
latest client, in case anyone would like to run vfio-user.
repo: https://github.com/oracle/qemu
branch: vfio-user-client-v7server
launcher: scripts/vfiouser-launcher.py
[1]: https://lore.kernel.org/all/6d8ae21cbade8f4bb7eaca4da29e57f0cb1a03f3.1641584317.git.john.g.johnson@oracle.com/T/

We've made the following changes in this revision:

[PATCH v7 02/17] qdev: unplug blocker for devices
  - corrects comments to prevent creation of new section for
    unplug blocker
  - adds an assert to device_finalize() to confirm that device
    does not have unplug blockers
  - moves the unplug blocker functions to hw/core/qdev.c
  - moves test for unplug blocker to qdev_unplug() from qmp_device_del()

[PATCH v7 05/17] configure: require cmake 3.19 or newer
  - new in this series

[PATCH v7 06/17] vfio-user: build library
  - configure script sets cmake_required flag for vfio user

[PATCH v7 07/17] vfio-user: define vfio-user-server object
  - adds auto-shutdown sub-option to the remote machine
  - adds boolean auto_shutdown to TYPE_REMOTE_MACHINE's class
  - adds vfu_object_auto_shutdown() helper function to
    vfio-user-obj.c to query the auto-shutdown property
    from the machine
  - reworks VFU_OBJECT_ERROR() & vfu_object_finalize() to use
    the helper function above.
  - updates QEMU version to 7.1 in commentary for VfioUserServerProperties

[PATCH v7 08/17] vfio-user: instantiate vfio-user context
  - moves phase_check() after the check for machine type
    in vfu_object_init()
  - sets o->vfu_ctx to NULL in vfu_object_finalize()

[PATCH v7 09/17] vfio-user: find and init PCI device
  - holds a reference to attached device in the server,
    and unrefs it during cleanup

[PATCH v7 10/17] vfio-user: run vfio-user context
  - updates QEMU version to 7.1 in commentary for VFU_CLIENT_HANGUP

[PATCH v7 11/17] vfio-user: handle PCI config space accesses
  - adds a comment explaining that writes to BAR register in
    config space doesn't create conflicting memory regions

[PATCH v7 12/17] vfio-user: IOMMU support for remote device
  - passes IOMMU table as an opaque data to pci_setup_iommu()
  - adds locking to access the table to enable concurrent access
  - retains the global data structure as remote_iommu_del_device()
    needs it because it doesn't have access to the opaque data
  - removes redundant check to confirm if hash table is present
    in remote_iommu_find_add_as()
  - adds remote_iommu_del_elem() to free IOMMU entry when it
    is removed from the table

[PATCH v7 14/17] vfio-user: handle PCI BAR accesses
  - adjusts the 'offset' in vfu_object_bar_rw() - MemoryRegion
    returned by memory_region_find() could be a subregion of the
    root memory region referenced by pci_dev->io_regions[pci_bar].memory.
    'offset' input argument is relative to the root region, whereas it
    must be relative to the subregion before access.
  - adds warning for out-of-range access

[PATCH v7 15/17] vfio-user: handle device interrupts
  - moves msi_nonbroken initialization to hw/remote/machine.c
  - adds irq_opaque to PCIDevice which the interrupt notification
    could use; drops global hash table which map device to
    vfio-user context
  - removes NULL function pointer test in msi_notify and msix_notify
  - vfu_object_msi_notify() asserts that IRQ vector is allocated

[PATCH v7 16/17] vfio-user: handle reset of remote device
  - adds comment to explain lost connection handling

[PATCH v7 17/17] vfio-user: avocado tests for vfio-user
  - drops the migration test

Dropped the following patches:
configure, meson: override C compiler for cmake
softmmu/vl: defer backend init
vfio-user: register handlers to facilitate migration

We are looking forward to your comments.

Thank you very much!

Jagannathan Raman (17):
  tests/avocado: Specify target VM argument to helper routines
  qdev: unplug blocker for devices
  remote/machine: add HotplugHandler for remote machine
  remote/machine: add vfio-user property
  configure: require cmake 3.19 or newer
  vfio-user: build library
  vfio-user: define vfio-user-server object
  vfio-user: instantiate vfio-user context
  vfio-user: find and init PCI device
  vfio-user: run vfio-user context
  vfio-user: handle PCI config space accesses
  vfio-user: IOMMU support for remote device
  vfio-user: handle DMA mappings
  vfio-user: handle PCI BAR accesses
  vfio-user: handle device interrupts
  vfio-user: handle reset of remote device
  vfio-user: avocado tests for vfio-user

 configure                                  |  36 +-
 meson.build                                |  44 +-
 qapi/misc.json                             |  23 +
 qapi/qom.json                              |  20 +-
 include/exec/memory.h                      |   3 +
 include/hw/pci/pci.h                       |  10 +
 include/hw/qdev-core.h                     |  29 +
 include/hw/remote/iommu.h                  |  18 +
 include/hw/remote/machine.h                |  10 +-
 include/hw/remote/vfio-user-obj.h          |   6 +
 hw/core/qdev.c                             |  24 +
 hw/pci/msi.c                               |  11 +-
 hw/pci/msix.c                              |  10 +-
 hw/remote/iommu.c                          |  95 +++
 hw/remote/machine.c                        |  73 +-
 hw/remote/vfio-user-obj.c                  | 847 +++++++++++++++++++++
 softmmu/physmem.c                          |   4 +-
 softmmu/qdev-monitor.c                     |   4 +
 stubs/vfio-user-obj.c                      |   6 +
 tests/qtest/fuzz/generic_fuzz.c            |   9 +-
 .gitlab-ci.d/buildtest.yml                 |   2 +
 .gitmodules                                |   3 +
 Kconfig.host                               |   4 +
 MAINTAINERS                                |   6 +
 hw/remote/Kconfig                          |   4 +
 hw/remote/meson.build                      |   4 +
 hw/remote/trace-events                     |  11 +
 meson_options.txt                          |   3 +
 stubs/meson.build                          |   1 +
 subprojects/libvfio-user                   |   1 +
 tests/avocado/avocado_qemu/__init__.py     |  14 +-
 tests/avocado/vfio-user.py                 | 164 ++++
 tests/docker/dockerfiles/centos8.docker    |   2 +
 tests/docker/dockerfiles/ubuntu2004.docker |   2 +
 34 files changed, 1483 insertions(+), 20 deletions(-)
 create mode 100644 include/hw/remote/iommu.h
 create mode 100644 include/hw/remote/vfio-user-obj.h
 create mode 100644 hw/remote/iommu.c
 create mode 100644 hw/remote/vfio-user-obj.c
 create mode 100644 stubs/vfio-user-obj.c
 create mode 160000 subprojects/libvfio-user
 create mode 100644 tests/avocado/vfio-user.py

-- 
2.20.1


