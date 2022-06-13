Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 426F9549FBB
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 22:45:44 +0200 (CEST)
Received: from localhost ([::1]:41994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0qwR-0005TW-Cd
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 16:45:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qff-000099-Rj
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:28:23 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:45750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1o0qfd-0001vK-Cl
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 16:28:23 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25DJXYGT025664;
 Mon, 13 Jun 2022 20:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=vuYAcUE2qctPVMyHcVmyaRPy4HZtBnw4XbP6RD7gzN8=;
 b=kdLjVKgZrytLyiDmIHiSSuPfHexuQnnl9bkylsqBlfa2i00AkBI/zYEC/if7MSkoV9oK
 7BysjDFpHUVfGc/ovxOJTRcrKeTQ0C8heYNfNtgQO9VFhn+imJ6SAboHs4hklDXqUvRj
 VlZfOW+x7qXIqF28AWyu4OSDM3DKfBSuDZDn7fID8ZYZ+lYHt6a1dAKBl998+2xTb0Uc
 jvG4hDTzVRUNtB+n1f1pNUfgd6A8T0pBbFVYkOe27BdJG6N9B7ZGtdjRpcBTUclF+Mzd
 nSIor8DVsHtJ9WaaGABhCnBHXfAPKyCQ68voHhsWCfPFj/foS3ZQbp70FowzQGrvCOpx Ww== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmjx9c1yu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:28:16 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25DK66oo030851; Mon, 13 Jun 2022 20:28:14 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2044.outbound.protection.outlook.com [104.47.66.44])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gpbv8ruve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jun 2022 20:28:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OD2DszWNHkDs7ZjNc4wFhlsed5dep+sR6At2lW3E+TZKPcxPAm5X6UdSs8lkCIv6dEgts0QQk1xKWKtKd2z7cxm3F0Rr725Uaqb4Vnd9FRjNmJqEy6VDj6L4VbuaEe5JkELOldvxhEvteYoGGB83w4dAVvFI2O/kIWmhLeRA5yMsePMS6W3/qqjUb1YbWu8Lm8QKUDkKlBLTL493Y9L78RcQDENt/mmlEjfpCmhq171fxLV7XcFcTqi8GuWMeAzc40heWlaYsGNkKhfycR3NaZC2BN1fHuO7dZXuGB8R3YnlTdreX8X1WwUO7FdNlfTAxgdwna51Fk3figrg5Y+dMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vuYAcUE2qctPVMyHcVmyaRPy4HZtBnw4XbP6RD7gzN8=;
 b=ecm4ujXE4sybbVbt4X1yJvoJmdPAKfQC0s6+To3zuFBSUpbGFVmHZ7KrvnoUf195yXuvC5UBdIB8W9U5MkFPwd8997NMiKFo1vsuLivkoRwoe9+d+fO1XFdSagj8yj1MpMPS0YKbQ57F/qwKvKVHbkIHb2oOkzsNzenT7aqPqOYwoL1cKWMoocwPr4QW7kC/fRUG5npfoO1XLpMnFis82hP0cxXf4RK2JBAYCl3xbEn8c3JEgzynbKTQEWrc07KbsyVZ+umnm0VkrLnJgSbCylp45DQA9w3eMSsvfOsy1jZzeu9KG1sIGhYOXLG/HZHaNNv+a5jCG7pdR5RGk36XPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vuYAcUE2qctPVMyHcVmyaRPy4HZtBnw4XbP6RD7gzN8=;
 b=NIFizbaOm+4QBIqHx1X5nZdNa4mNXv2vS72ujSbo1z9Rcd7Iey1znDVPNMjqid0apoeJCuTkU7Fpsy2P7WJ2xXDNSbMSq4vDCAhD8B20ARJDsdQULjlmlZ6QwofazTSQVG0kL9RbL0mIlWpJv7XZlnI3rVd8qZTvkIkoVZkMdYI=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by PH7PR10MB5723.namprd10.prod.outlook.com (2603:10b6:510:127::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Mon, 13 Jun
 2022 20:27:14 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5332.020; Mon, 13 Jun 2022
 20:27:13 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, alex.williamson@redhat.com,
 f4bug@amsat.org, pbonzini@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, bleal@redhat.com, berrange@redhat.com,
 peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, eblake@redhat.com, armbru@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, imammedo@redhat.com,
 peterx@redhat.com, john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v12 05/14] vfio-user: define vfio-user-server object
Date: Mon, 13 Jun 2022 16:26:25 -0400
Message-Id: <e45a17001e9b38f451543a664ababdf860e5f2f2.1655151679.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1655151679.git.jag.raman@oracle.com>
References: <cover.1655151679.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0018.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::23) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8c6a53d9-c5f0-4e4f-ecac-08da4d7b19c4
X-MS-TrafficTypeDiagnostic: PH7PR10MB5723:EE_
X-Microsoft-Antispam-PRVS: <PH7PR10MB5723454841D813182415282590AB9@PH7PR10MB5723.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3XMEBX+sHtX6IEqh84onrpollw8ZHbEx47nIwwUwfzyR/D61zO/asYvY1h5vqaPPrqkupKj05w4OlaSAkNF0iLRj5nhyiEEoPaZR17xB2v0G+K3jfDCfxZq6zIGSFQ5epyDd9/3sPFilQd8j4h4upAxkh3sx7GWJ7Xt31mol+d4rw5G4i+pY+uHJp7yibVAeISN2L8xcGCAtgDZZIDwXQpUFeF/OYHUTLwFs+XgEPwwXQ2pH4/Xi62bCFkuhy78lXPjkB8oVsO5midUBAi7Pci7zepeJ6t6dR2CvCbpmSPCycFqCFyr16y0zpUuwE0zoQnuB6AE4uYwWFQk0FrbMdW1zFynxjoz3WibGFogMtLxiBeDNmBq9rxw65swzq+BC97oja/I+Be5O+mhp4tSrHVTLRcCsajAvbjFNksYYLxk6Odyb6eqApdnxTzje8a6iLUh6tRr9ty+Je9iTj2RVnUZGB81YOFzU3RJ+O9ocHxUA2UupSg+3Z29wjZcyFLmAPR6/eW8UFWX/XMkjdqYRwpyQI3MNrZMrZQ70nK4ZzCIrxUO+mRJCx8MtY6h/H+aBoj5+8kz4p7xgz5Hxs1rJOX5i2R2OAusfcQ/5fFdbMCxAd8qT63mbK4qEhW2tGhwMkfd87SqvJ8D3iE7FQZNoWabDakkYH93B/Ckn/DczdM7ls0IeFZhWbJeSONjOe+hkb0JaWAAvYv57KkEvbAsIOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(8676002)(36756003)(6486002)(4326008)(6506007)(6666004)(8936002)(5660300002)(38100700002)(508600001)(86362001)(316002)(7416002)(2906002)(107886003)(2616005)(38350700002)(30864003)(83380400001)(52116002)(66476007)(6512007)(66946007)(186003)(26005)(66556008)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3hYb0lzUUh0NktMdnI2cnRJRkwwR2Z2djNiczk4ak9DSTB4S3F6djRqTFps?=
 =?utf-8?B?LytZV2hiUmYyUEdubHNranU0UEhMQXN1aGUyVkJZUVk2WFFBd2E0cU5pTmo4?=
 =?utf-8?B?UnFJb0kxOVNRMmtlTkRvc2xpczJOaDR2dDlpUnhKWDJVbGZ1c1ZGbTlUdTQ2?=
 =?utf-8?B?Sk56dSsweWtHei9FNitWTG9XWVpsZUdsTWM4aGh1aWZ2YmhXWWZaVlVuMzNq?=
 =?utf-8?B?K0xPa09BbXlSZGNGaEs2eEhwU3o4OGIvUDRoTE5SelUwMkFLU01RRUJqMVhT?=
 =?utf-8?B?dUNyNW1QRUFsQzZiYURLeWpaNTJQVlJvSWV3Ni9NTnAvMHF0VXcwNzhpUDVV?=
 =?utf-8?B?RGk0SkNMK2VWMkRiUGZlelM1SHFQb2JLUC85cmJ1R3VjM2ZHLzJiTTRwSThx?=
 =?utf-8?B?eUFwQmI3c0g0Q1JDRTRCcGlZUU40cmVjL281aG5PbUo3dXRQd2NWRWgxV2lC?=
 =?utf-8?B?cEZNL2hCLzZwdWRCOFFVd0F5Y1pXS25UNSt0cXNlTnBHU2krR3Z4VWtkd1Ix?=
 =?utf-8?B?dFpRRGgxZXBXd0swOFArelQvWVNBS0plTHppZ0l6allUMkZVZnRPTDZ2cFZ4?=
 =?utf-8?B?UHFJZUFYa0dpVDMwL1Z3djF4L0J2cDhqT3RndGU3NFVnaSs4YnJNNjF6NGRW?=
 =?utf-8?B?Zy9BVmdGUm9rUXRSUEdZbE53TW9tTUVkRy85VE5lQTJUQkxCRGFPcnNVd0lU?=
 =?utf-8?B?c1duYjhMTlZaWUhHVWV6aHoyUDIzVng4Y0Y3YXFiUjJFTVRodVhTZHpHejlS?=
 =?utf-8?B?TG1HVmJ4YXQ5KzNIbDRoRzNTTXVxbVNoTXUxNGFQUjRnRzZsV1FBR2hvUEoz?=
 =?utf-8?B?QmJISXhyeHplTysrenJlSXQ2V29BL3UzT2x3SGNtaHNZNklSMGtDeGtMVDlC?=
 =?utf-8?B?aE1wUUs0enNwZlphWDROZUJKQWx0SFNObi9wc2NDcnRxMGZYUmFGd3VKS0JY?=
 =?utf-8?B?MTBFOU1qUFk3ZGJQRXZzTHlwWHI2aDVYM3ZxTndSOXNnWVJlcSt2SFJTRlZk?=
 =?utf-8?B?YzFEVllhOEp1MjlEZHBYR25QMi9RREp6RlFDb2h0QWdBbHo2RlFGaW4xQWZq?=
 =?utf-8?B?Ujkray90dWFYcGlURmxOVHB5Q1Q5VmxjeUpMNWRWSzNtOTlJQUsvM3ozRDZE?=
 =?utf-8?B?ZXJDK1Z4aWJ5UmdVOGY3OU1UclI5L1lUV0NQV2wyY2NNeHQ3dEV2dHQ1QSty?=
 =?utf-8?B?Q2VTN2xnRGtOZnZaMmUrekxpaXhxb3Y1SWFteUc1NTljTFJ6TWJTMmhxSFBr?=
 =?utf-8?B?bWVMMDBta3k5aytmdURmVnczRWxQS0NEN0VlM3RHSHdybm5zZzJpRERsRVAx?=
 =?utf-8?B?Vmt6N1ZGaml6TCt0ZmxLT0xUMS9rTzB4WUIzUzZuYU9lTlJIa21vMzA2b2pX?=
 =?utf-8?B?c1hrVSs3dGdGdDU0SWlGZUR3d0hva1oyMEJsZVZieWlRTnMxSUY2RXZETDZE?=
 =?utf-8?B?S3lXbndaOXFHaldxNUxaQ1FCT0orNmtSMjI5a09kOVQ3Rnp0TEFLNitFSi9l?=
 =?utf-8?B?RlNVZkVhOGpjM2ZYdVZ6MHJwNTcvclZiNnU2azlZWUI5cC9aYVFlNUo4QW0v?=
 =?utf-8?B?Q3ZDL2JMem9PNjRDN1N0Z3l4elg0aERFR2lNSEdRZGJqVmMwdXZYNjFhRUVO?=
 =?utf-8?B?UE5lU3d3bmZSV2hkc0swNWhpaUhSOXlxQzd2bndNUGM1ekg2dW1nS1JSbEJX?=
 =?utf-8?B?S202c0ljbGhkVlZQNXFkZXQ4aURjUy9RNDVGTnNoS3pSUk9idWg1M2NHS1pP?=
 =?utf-8?B?cExSeElHZUM2V1VBRmVCNG5wT3dVUUNKT05SWDhxYUVzVnFlay9Oa0FhVlFn?=
 =?utf-8?B?U0lXQzM3ZWlIZWJhOUwwZWJrOG1mbUlqTHJMSXlMaDJ5YWt6ZFBUdWM1eFY0?=
 =?utf-8?B?ZjdLMHF2ZWZhbkpJZDlNVXJ3WW9Zc2dnVDZPV2tRYkFrb0dWVVNSZHV4WFFN?=
 =?utf-8?B?VGhKbnRBWTVvZjlJOUphTjVLRzgrRGlzeGMvQitwaklKWks4NEZLN2pWY2Fq?=
 =?utf-8?B?RnpMUEpqTmRkSUpRdWNVWXRHNXRlZDd1dVJjT1VYeVQxYldSSVBnSnRDMnor?=
 =?utf-8?B?UkRMZ3NTUmJLVVd0U2J3WUY4cXFseW03RHN2NVh2M2VSU1dwZ2xQaEJVRTZU?=
 =?utf-8?B?NHRpRU1nbkYxTTR6bmtYNFovelF6RnU4cGswZGdxU1dNc2w0V1VobVNEV1hh?=
 =?utf-8?B?VzVaT3dURU9uV3VON3dXWSt0RndRdmJHaVNoVUFMT1dHUGJSVjlHdWtPT3Rk?=
 =?utf-8?B?TEM0Rk5DUk1JQytxQ3FEc0hLYWRJSU1yMlpFejRNemFrU1VFUlYxSnRNTTdL?=
 =?utf-8?B?aHhjaWRqeE5YTE1OaFdEenRabFl5bE5HS2wrc1lJWDI4T1JhN2ZIdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c6a53d9-c5f0-4e4f-ecac-08da4d7b19c4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 20:27:13.8435 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MeIMAbRUwFDlB2MOXUBU1gwTDUZbKqWTjRtvRmVjAXgVbl78RZfz/5alD5s+dFEa5jJJZISkid60D+gVnSu8DQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5723
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.874
 definitions=2022-06-13_08:2022-06-13,
 2022-06-13 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206130082
X-Proofpoint-ORIG-GUID: xYzbeEqihTJIoTBjB2CjOFonPbVlergm
X-Proofpoint-GUID: xYzbeEqihTJIoTBjB2CjOFonPbVlergm
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Define vfio-user object which is remote process server for QEMU. Setup
object initialization functions and properties necessary to instantiate
the object

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 qapi/qom.json               |  20 +++-
 include/hw/remote/machine.h |   2 +
 hw/remote/machine.c         |  27 +++++
 hw/remote/vfio-user-obj.c   | 210 ++++++++++++++++++++++++++++++++++++
 MAINTAINERS                 |   1 +
 hw/remote/meson.build       |   1 +
 hw/remote/trace-events      |   3 +
 7 files changed, 262 insertions(+), 2 deletions(-)
 create mode 100644 hw/remote/vfio-user-obj.c

diff --git a/qapi/qom.json b/qapi/qom.json
index 6a653c6636..80dd419b39 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -734,6 +734,20 @@
 { 'struct': 'RemoteObjectProperties',
   'data': { 'fd': 'str', 'devid': 'str' } }
 
+##
+# @VfioUserServerProperties:
+#
+# Properties for x-vfio-user-server objects.
+#
+# @socket: socket to be used by the libvfio-user library
+#
+# @device: the ID of the device to be emulated at the server
+#
+# Since: 7.1
+##
+{ 'struct': 'VfioUserServerProperties',
+  'data': { 'socket': 'SocketAddress', 'device': 'str' } }
+
 ##
 # @RngProperties:
 #
@@ -874,7 +888,8 @@
     'tls-creds-psk',
     'tls-creds-x509',
     'tls-cipher-suites',
-    { 'name': 'x-remote-object', 'features': [ 'unstable' ] }
+    { 'name': 'x-remote-object', 'features': [ 'unstable' ] },
+    { 'name': 'x-vfio-user-server', 'features': [ 'unstable' ] }
   ] }
 
 ##
@@ -938,7 +953,8 @@
       'tls-creds-psk':              'TlsCredsPskProperties',
       'tls-creds-x509':             'TlsCredsX509Properties',
       'tls-cipher-suites':          'TlsCredsProperties',
-      'x-remote-object':            'RemoteObjectProperties'
+      'x-remote-object':            'RemoteObjectProperties',
+      'x-vfio-user-server':         'VfioUserServerProperties'
   } }
 
 ##
diff --git a/include/hw/remote/machine.h b/include/hw/remote/machine.h
index 8d0fa98d33..ac32fda387 100644
--- a/include/hw/remote/machine.h
+++ b/include/hw/remote/machine.h
@@ -24,6 +24,8 @@ struct RemoteMachineState {
     RemoteIOHubState iohub;
 
     bool vfio_user;
+
+    bool auto_shutdown;
 };
 
 /* Used to pass to co-routine device and ioc. */
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 9f3cdc55c3..4d008ed721 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -77,6 +77,28 @@ static void remote_machine_set_vfio_user(Object *obj, bool value, Error **errp)
     s->vfio_user = value;
 }
 
+static bool remote_machine_get_auto_shutdown(Object *obj, Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    return s->auto_shutdown;
+}
+
+static void remote_machine_set_auto_shutdown(Object *obj, bool value,
+                                             Error **errp)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    s->auto_shutdown = value;
+}
+
+static void remote_machine_instance_init(Object *obj)
+{
+    RemoteMachineState *s = REMOTE_MACHINE(obj);
+
+    s->auto_shutdown = true;
+}
+
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -90,12 +112,17 @@ static void remote_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add_bool(oc, "vfio-user",
                                    remote_machine_get_vfio_user,
                                    remote_machine_set_vfio_user);
+
+    object_class_property_add_bool(oc, "auto-shutdown",
+                                   remote_machine_get_auto_shutdown,
+                                   remote_machine_set_auto_shutdown);
 }
 
 static const TypeInfo remote_machine = {
     .name = TYPE_REMOTE_MACHINE,
     .parent = TYPE_MACHINE,
     .instance_size = sizeof(RemoteMachineState),
+    .instance_init = remote_machine_instance_init,
     .class_init = remote_machine_class_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_HOTPLUG_HANDLER },
diff --git a/hw/remote/vfio-user-obj.c b/hw/remote/vfio-user-obj.c
new file mode 100644
index 0000000000..bc49adcc27
--- /dev/null
+++ b/hw/remote/vfio-user-obj.c
@@ -0,0 +1,210 @@
+/**
+ * QEMU vfio-user-server server object
+ *
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL-v2, version 2 or later.
+ *
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+/**
+ * Usage: add options:
+ *     -machine x-remote,vfio-user=on,auto-shutdown=on
+ *     -device <PCI-device>,id=<pci-dev-id>
+ *     -object x-vfio-user-server,id=<id>,type=unix,path=<socket-path>,
+ *             device=<pci-dev-id>
+ *
+ * Note that x-vfio-user-server object must be used with x-remote machine only.
+ * This server could only support PCI devices for now.
+ *
+ * type - SocketAddress type - presently "unix" alone is supported. Required
+ *        option
+ *
+ * path - named unix socket, it will be created by the server. It is
+ *        a required option
+ *
+ * device - id of a device on the server, a required option. PCI devices
+ *          alone are supported presently.
+ */
+
+#include "qemu/osdep.h"
+
+#include "qom/object.h"
+#include "qom/object_interfaces.h"
+#include "qemu/error-report.h"
+#include "trace.h"
+#include "sysemu/runstate.h"
+#include "hw/boards.h"
+#include "hw/remote/machine.h"
+#include "qapi/error.h"
+#include "qapi/qapi-visit-sockets.h"
+
+#define TYPE_VFU_OBJECT "x-vfio-user-server"
+OBJECT_DECLARE_TYPE(VfuObject, VfuObjectClass, VFU_OBJECT)
+
+/**
+ * VFU_OBJECT_ERROR - reports an error message. If auto_shutdown
+ * is set, it aborts the machine on error. Otherwise, it logs an
+ * error message without aborting.
+ */
+#define VFU_OBJECT_ERROR(o, fmt, ...)                                     \
+    {                                                                     \
+        if (vfu_object_auto_shutdown()) {                                 \
+            error_setg(&error_abort, (fmt), ## __VA_ARGS__);              \
+        } else {                                                          \
+            error_report((fmt), ## __VA_ARGS__);                          \
+        }                                                                 \
+    }                                                                     \
+
+struct VfuObjectClass {
+    ObjectClass parent_class;
+
+    unsigned int nr_devs;
+};
+
+struct VfuObject {
+    /* private */
+    Object parent;
+
+    SocketAddress *socket;
+
+    char *device;
+
+    Error *err;
+};
+
+static bool vfu_object_auto_shutdown(void)
+{
+    bool auto_shutdown = true;
+    Error *local_err = NULL;
+
+    if (!current_machine) {
+        return auto_shutdown;
+    }
+
+    auto_shutdown = object_property_get_bool(OBJECT(current_machine),
+                                             "auto-shutdown",
+                                             &local_err);
+
+    /*
+     * local_err would be set if no such property exists - safe to ignore.
+     * Unlikely scenario as auto-shutdown is always defined for
+     * TYPE_REMOTE_MACHINE, and  TYPE_VFU_OBJECT only works with
+     * TYPE_REMOTE_MACHINE
+     */
+    if (local_err) {
+        auto_shutdown = true;
+        error_free(local_err);
+    }
+
+    return auto_shutdown;
+}
+
+static void vfu_object_set_socket(Object *obj, Visitor *v, const char *name,
+                                  void *opaque, Error **errp)
+{
+    VfuObject *o = VFU_OBJECT(obj);
+
+    qapi_free_SocketAddress(o->socket);
+
+    o->socket = NULL;
+
+    visit_type_SocketAddress(v, name, &o->socket, errp);
+
+    if (o->socket->type != SOCKET_ADDRESS_TYPE_UNIX) {
+        error_setg(errp, "vfu: Unsupported socket type - %s",
+                   SocketAddressType_str(o->socket->type));
+        qapi_free_SocketAddress(o->socket);
+        o->socket = NULL;
+        return;
+    }
+
+    trace_vfu_prop("socket", o->socket->u.q_unix.path);
+}
+
+static void vfu_object_set_device(Object *obj, const char *str, Error **errp)
+{
+    VfuObject *o = VFU_OBJECT(obj);
+
+    g_free(o->device);
+
+    o->device = g_strdup(str);
+
+    trace_vfu_prop("device", str);
+}
+
+static void vfu_object_init(Object *obj)
+{
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+    VfuObject *o = VFU_OBJECT(obj);
+
+    k->nr_devs++;
+
+    if (!object_dynamic_cast(OBJECT(current_machine), TYPE_REMOTE_MACHINE)) {
+        error_setg(&o->err, "vfu: %s only compatible with %s machine",
+                   TYPE_VFU_OBJECT, TYPE_REMOTE_MACHINE);
+        return;
+    }
+}
+
+static void vfu_object_finalize(Object *obj)
+{
+    VfuObjectClass *k = VFU_OBJECT_GET_CLASS(obj);
+    VfuObject *o = VFU_OBJECT(obj);
+
+    k->nr_devs--;
+
+    qapi_free_SocketAddress(o->socket);
+
+    o->socket = NULL;
+
+    g_free(o->device);
+
+    o->device = NULL;
+
+    if (!k->nr_devs && vfu_object_auto_shutdown()) {
+        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    }
+}
+
+static void vfu_object_class_init(ObjectClass *klass, void *data)
+{
+    VfuObjectClass *k = VFU_OBJECT_CLASS(klass);
+
+    k->nr_devs = 0;
+
+    object_class_property_add(klass, "socket", "SocketAddress", NULL,
+                              vfu_object_set_socket, NULL, NULL);
+    object_class_property_set_description(klass, "socket",
+                                          "SocketAddress "
+                                          "(ex: type=unix,path=/tmp/sock). "
+                                          "Only UNIX is presently supported");
+    object_class_property_add_str(klass, "device", NULL,
+                                  vfu_object_set_device);
+    object_class_property_set_description(klass, "device",
+                                          "device ID - only PCI devices "
+                                          "are presently supported");
+}
+
+static const TypeInfo vfu_object_info = {
+    .name = TYPE_VFU_OBJECT,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(VfuObject),
+    .instance_init = vfu_object_init,
+    .instance_finalize = vfu_object_finalize,
+    .class_size = sizeof(VfuObjectClass),
+    .class_init = vfu_object_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void vfu_register_types(void)
+{
+    type_register_static(&vfu_object_info);
+}
+
+type_init(vfu_register_types);
diff --git a/MAINTAINERS b/MAINTAINERS
index bc2241576e..6bddfe3197 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3633,6 +3633,7 @@ F: include/hw/remote/proxy-memory-listener.h
 F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
+F: hw/remote/vfio-user-obj.c
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 7da83350c8..0eb5a0f375 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: libvfio_user_dep)
 
diff --git a/hw/remote/trace-events b/hw/remote/trace-events
index 0b23974f90..7da12f0d96 100644
--- a/hw/remote/trace-events
+++ b/hw/remote/trace-events
@@ -2,3 +2,6 @@
 
 mpqemu_send_io_error(int cmd, int size, int nfds) "send command %d size %d, %d file descriptors to remote process"
 mpqemu_recv_io_error(int cmd, int size, int nfds) "failed to receive %d size %d, %d file descriptors to remote process"
+
+# vfio-user-obj.c
+vfu_prop(const char *prop, const char *val) "vfu: setting %s as %s"
-- 
2.20.1


