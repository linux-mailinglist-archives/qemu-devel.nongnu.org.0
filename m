Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E425458D4D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 12:25:32 +0100 (CET)
Received: from localhost ([::1]:56898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp7Ry-0006lT-84
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 06:25:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mp7KJ-0005hQ-4T; Mon, 22 Nov 2021 06:17:35 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:49908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mp7KG-0004Cb-7m; Mon, 22 Nov 2021 06:17:34 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AMAYEwC017078; 
 Mon, 22 Nov 2021 11:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=NAVWT5wS9BsoMxK4zbUI1Orm3iU6orS+R7pDU6Wfe7g=;
 b=c/NVE/tP6uvaoaTgty8N95ZojyWQuLTPk+PAuIQ8DXWsi+hPmkjhNIcQXaJetWehZsyw
 o6Awahhb6iNrOLdUfcRouVXGqCwxO+8rbY0Ia88OQZn/eHCwIioiUjMf9tljSo1Df1nC
 uxkbMGa33VYqvrE9DE85KEDX38/qThKyjrm+4SItC5wBnv4Igm24haJ+wVnT6L5WECeS
 tAGNrtg+dVHnV7YpMUMEV8GHxL3M7N2qJOfi1dY24vpa0dot5Jyq9F5gjGPNHNXw1b3E
 TmybTQEw34QxihlmfaRuc6tBjIPClmfRg2UAnNWBB5RY30WzA4/zU8m6UVA1HTPqL/yg Lg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cg46f1j3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Nov 2021 11:17:18 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AMBAXRv173719;
 Mon, 22 Nov 2021 11:17:17 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
 by userp3030.oracle.com with ESMTP id 3cep4whawv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Nov 2021 11:17:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iMbONrHimPtjbyhDb/wWrcsWO9v4PNiNqYHOyCplwoTLCq/JtCFMg2/iNLnjZWVIyHSVbieVQ95Eav+/+MWCKGjYWS0QYHFkOVAOKYkeHJBVXXyCgVnzb4I5BSXQxwxbhJ/DxkdXHsVFmOc79eXxptk28d0UPcr5rspYadyciSVKkFQvDDu8cpPrINJzsllv8HrlPXTnJqGYvPkscPIAdfV91jzhzmH0rYc237bBM02TGP4GaakeJlWorvE4wuC91N57QPrldtzINd9dgTsnuWlxLDjmOLMx0/BUJVPi81VrqAK+jNUEjHoRysEqTkSCEmtOw2QFjyVp/c59Fc9fpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAVWT5wS9BsoMxK4zbUI1Orm3iU6orS+R7pDU6Wfe7g=;
 b=eZmEi3T/u6CBzRTRxILoaT6ZAlO4TKjlKB3OP6Q8Dnu/vyNmjFepKW1rVSrxGpnICF/nctMu2z9A8qDp2zSYvU0++gBrzG7V8lsdTb1VbuBzoOlEMos3MQ4CxrqOhNIyjTpvt3RQ+4QZFx8TIt50A7ncaV+mSFSAEAG6CC/06wqTvYjwUxWLqMO7HMphJhG7hOVZUSMplbtLPXNOTf8m+OiGQbwMQmk3AwWYaCBnu6iyy3F+iKog9wU1OmlbqjzVR4siWJDwHGJ+Pa5RH4aqmV6JHAqAV2BgzdQvKbMuHQmSCD+6P2sQSm0aU5/eWkyP2RINx3AXGLFHtDvQA0wH2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NAVWT5wS9BsoMxK4zbUI1Orm3iU6orS+R7pDU6Wfe7g=;
 b=WGhYNqlvPrd6wKvJjj6grck8BRZENYssTg0lqUGpwtUKlSKOxrNe/XSi0YEo5/pJYffg1F+4DXlEVPfNeaqPOwZo3NSkrbaqdHHAPGAZiPdsFMaZSmTS2qtukTD3/Tme8Mu2IumOrmVSwCpF4OBZyJsKb3gU0pqHbdgH8UgW3VU=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by MN2PR10MB4334.namprd10.prod.outlook.com (2603:10b6:208:1d9::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Mon, 22 Nov
 2021 11:17:14 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9418:7fcf:86ec:e0f4]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9418:7fcf:86ec:e0f4%6]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 11:17:14 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH-for-6.2 0/2] hw/scsi/megasas: Avoid overflowing the SGL
 buffer
In-Reply-To: <20211119201141.532377-1-philmd@redhat.com>
References: <20211119201141.532377-1-philmd@redhat.com>
Date: Mon, 22 Nov 2021 11:17:09 +0000
Message-ID: <m28rxgigne.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DU2PR04CA0278.eurprd04.prod.outlook.com
 (2603:10a6:10:28c::13) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
Received: from oracle.com (46.7.162.180) by
 DU2PR04CA0278.eurprd04.prod.outlook.com (2603:10a6:10:28c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Mon, 22 Nov 2021 11:17:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fc030347-d175-4446-142a-08d9ada9a2ea
X-MS-TrafficTypeDiagnostic: MN2PR10MB4334:
X-Microsoft-Antispam-PRVS: <MN2PR10MB4334BADFB1FCBE1152E0BA71F49F9@MN2PR10MB4334.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DcSQeUyg9Cwi/yAaiSXCNK9OjouwcqyvhNlMS/1nBYsvrmeFStVVNp41aFyDipmfaTEJF7ddxFv15IG3bNS+bUfIqCwYH4rOcaA8HbWv1FXx0IDhSfohyKD1PaVPoHe/hWakWuGNmwlHppvKwCC7rw3TPaeRC4cd+rqGazq2IafwSIkjMJd4eQNawGYqcppDyARUUyrDmo26ySYyFFxSq8sbYxjKjUQWKEfVJtZP+ThC7OZ14V+HM47sKcIHA4c4Svw0CmFq5VqZ3cUFpygy6TIW0OH1aLtMHyVeyeEOBJSgYuypASGNq+g+WHdhP3Hw5s3qySf0lepOu/MqOn/SpshhX4yXieJcN3WSdFAy9QuCadC+Mqre2wjRU7LpSBnBKRZ1MJB9QvnUR+ENG66HbdJNadUl9ByQsTENnCyhcBOUdOhJajrqCX/DQonGCncmznj7viB1+mLKXwqo1+K+YiT1U0cfjJBreIrYblqRy3ZdU9c44xfxg8VIMHJKmZqJf2HbcM5KGL2sbB1ml1LVh99We9srJaPTn0rWMH0KWhdFRIzYVew64FrccQBy5aJ2TmfrVswu4otsP60Tc1F79/a+4b+1vfRiguSA1vZ/yNahU8l1e3XGL2NcBOdR7HSSMZFFsN+5ICQ8HA4EwVkaMbW6DvA0PwuqwW29XV1L8iXXWLFqHbGjVsWO9bdYICkXe+me3udrGqux1fR4NcarqZcNrO6Us9jpaBR2BeLMgjTYuSogDLyEpnp6+sfP+P3hD74C0KK/RmYtUaZt8rO+4iA/+suOcR0Cjhu9sxvBpeY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(186003)(508600001)(66476007)(8676002)(66946007)(66556008)(966005)(38350700002)(38100700002)(2616005)(956004)(52116002)(44832011)(6666004)(7416002)(8936002)(7696005)(5660300002)(316002)(4744005)(4326008)(54906003)(86362001)(4001150100001)(8886007)(36756003)(55016002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3BtTXRUT1REd05GSFJ5SmFpckFYNEkrOTlkbkR5elRrSUMzTllTUFczdzlS?=
 =?utf-8?B?QjhRcnptb3JQSmV1dm5vazU4NWJHVFhzZlczZzNkd0NkZi9jL2FKa3M3K0pC?=
 =?utf-8?B?YWR2RExkQ21HT0dUbU8wTExiZTV5L29tT25WM003cEptTUQxNE1ha2p1Uy84?=
 =?utf-8?B?aE5JVGNYUXg2TVMxLy8wSnl5YWJwb3RieXcrbUJPanZFRWNON1pleWU2UERi?=
 =?utf-8?B?RG1BeElLdEYwM3ViUjFwa1FjS3ZiRnZ2dXd2cG0vSjdBd0o5UUZTNVdaOWx1?=
 =?utf-8?B?R2ZtQWphZi84cFFETjgzdkpqaG5hdUdEaEVlYklpZmpLNzR4RFJPbkticGNm?=
 =?utf-8?B?WStUMmdlQ3RWWThZVWF6TFphbTJxY29xVTV5NEF6MGFlNHUzalJFbDAwdmxC?=
 =?utf-8?B?NHhKMW83MjFmbitkNnpkQ0FtU3VlY2xHR2JzT2RTY2RhMTZlVlNieVhMWjNw?=
 =?utf-8?B?aUdlcUwyZGZQcVR0bEdxTEZBM0FDSHVlbjVlS05mbWt2Q0wzdHlNVDNYYTdT?=
 =?utf-8?B?STBSdFdOeTY4UHJiRjA4d09Fb2RyRDJDcXl5NVVsVWxOTlJCY1RoaW83K0ZN?=
 =?utf-8?B?Nnc4VjN5ZFhlZXRXNVBjTDJPL1JtTFRVM1huWmJQT3hlRzhGNVczYzB1RVVi?=
 =?utf-8?B?OEZ1QmFKMzlPcmZaZFkrUXlNbmN5blVpSFdGTjBBOXZQZG9VSFJUNTh0Q01x?=
 =?utf-8?B?RFAwVUxWWUVxaWJnRE9Ha0QybnBwQ3BhOUdLVUFCekpZSkEzUjBsRGxtb0hu?=
 =?utf-8?B?N1FRNXJJcVdyY2pOLzA4c2d3MTJOb1hFU2IvT0tGQ1Znb1JyaTNBTzlaVDJ4?=
 =?utf-8?B?dGdSMlhVZ01ETk9KVURqR1JCQkFienh5MlIzNVJPZHRmZ2drcHZiRDZqWldI?=
 =?utf-8?B?YXRldzNHVXpZNEpyY3UxZnZBQklRYk5IZUFFdTZ6NGV3K2F0a3puY25VRDcr?=
 =?utf-8?B?Z29aeEUxeXZ3NlBJRVBFNjRqVGpQK1FneWtFMlFSMVhxUEFCNUtMZFRNYXp1?=
 =?utf-8?B?UlBReXhWejUzenRHR1NHRkZBbTNHenE2YThvL0RjVWIrd0FJU0ZwK0ZnVmsr?=
 =?utf-8?B?QlJJTU9HeStOb2tZZzJyRlJsTjd6cmNTMGNlYWhlSWtjVnc4OURpbFN5Y0RS?=
 =?utf-8?B?N3cxS2RMcFpJVDE3bGFLNHk1Y05JVFg2RlpEYlJDWnlQRDJWaEF0SGRlTndw?=
 =?utf-8?B?WXJQeThtbmtNV01wT3VnNmp5RFNudVo2OGFQakZWZ1hBVGQ0UWJjV2VmemRW?=
 =?utf-8?B?N05EK2FUcmxvdjNVSXp1ZkY2NDdsR01IVWx4Njd6OE5pK3NrN25hUy9XWjlq?=
 =?utf-8?B?TGdIR1d4OVZJc3pCZU54eEdHZFRpSVRZVlVQQ3ZwYTVadkFQdGhjWWZ0bzRv?=
 =?utf-8?B?TjUyemU2QU8rdGFPZmF3MzVtbzNNb1c0RFBOUnF5MGhqczkzek1NRGYrRUpx?=
 =?utf-8?B?RDM0KzdaK0s5b1VXaVJ0Umg0eWYxTWF0ZnhjM2hZVloyYXoyR1Y4Z00xbHRX?=
 =?utf-8?B?TlgrTHNmc3M5N0VxZUVKSnFsYXIwa1lMVUlDOS9FMTZ0c3lXWkJjRlFjMFRi?=
 =?utf-8?B?SEpvOFdzMDEwdWdaWUFxdUpYQ0V0bVdudEIvUlZ5N08vK1ZGTzBNR1U0NEhu?=
 =?utf-8?B?SGVLYnpnY1VjU3ptSVJLd0s5cUVKcXJBbHJlOUhtd2hWNFEyd3FGM1dpcDAz?=
 =?utf-8?B?aXdvOGgwVC9MRE1wRVRLR2NFRHBidGZLQ252MUF2d2xaMDMrN2RZd2JyUStT?=
 =?utf-8?B?N1hnRTJ2YlZYRnhFTmNRdGRrbGpIZlBsU0tuN2pPaXhEaERJSzRmRkZwTklr?=
 =?utf-8?B?cDZVTzRGWHlvY2lXMFdBcVc0UU1zYU93U0tGNFNHOGpRamVXZTNWQ04vYlRp?=
 =?utf-8?B?ZGE3dnR5MlByL1N4RmRacnZaa2MxZEhnNkorc0oxVW0zWDFkUDI0c3VYb0tu?=
 =?utf-8?B?cFcrS3RCVnJWRDVTOUVTeUUyWWdjQk5vMnoyc3JVRDJKSFVTbUhnalpUcU4z?=
 =?utf-8?B?amlRNzRVY0k1SXZlU1lZS2wydFFEWGRBRFYyRFdNaWVSYjUwUEtWdHM5OXVs?=
 =?utf-8?B?dUR0VkFDbUJRWkxUSlVHVEZrN0hrYzFQYjIzV3ROSGF6cVBXVzJ4QXdMVWpw?=
 =?utf-8?B?NjBGUmQvaXFMdTVxUzBlVDUzWndheHNZcm1xcllJRVhKWm81aWlTLzYvdlNj?=
 =?utf-8?Q?5vVNNR7RnaqEirHoMAd7HjY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc030347-d175-4446-142a-08d9ada9a2ea
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 11:17:14.6293 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4b0lfkrzlWT8ppPEdWVxw5VRtOtOhkVrM6mN/ZYdVYhE9ZRXG8xxzpSPB4KDFfgP5KKxDAV5VRKZaew59fIMXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4334
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10175
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111220059
X-Proofpoint-GUID: ACh_eLvDQ10pxs0QDgllKk0QqZTJ7bNg
X-Proofpoint-ORIG-GUID: ACh_eLvDQ10pxs0QDgllKk0QqZTJ7bNg
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For the series:

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

Thanks,

Darren.

On Friday, 2021-11-19 at 21:11:39 +01, Philippe Mathieu-Daud=C3=A9 wrote:
> Fix issue #521 reported by Alex some months ago:
> https://gitlab.com/qemu-project/qemu/-/issues/521
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/scsi/megasas: Fails command if SGL buffer overflows
>   tests/qtest/fuzz-megasas-test: Add test for GitLab issue #521
>
>  hw/scsi/megasas.c               |  1 +
>  tests/qtest/fuzz-megasas-test.c | 30 ++++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
>
> --=20
> 2.31.1

