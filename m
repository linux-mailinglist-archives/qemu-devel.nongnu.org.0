Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 334C7455FAB
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 16:37:30 +0100 (CET)
Received: from localhost ([::1]:42068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnjTc-0004hX-T6
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 10:37:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mnjRA-00025v-7R; Thu, 18 Nov 2021 10:34:56 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:32924)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1mnjR6-0006uL-O3; Thu, 18 Nov 2021 10:34:55 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AIFKvFI009987; 
 Thu, 18 Nov 2021 15:34:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=74Qb4dot220Gxni+lytSQDXFn3ewqSYOgiDAQZl/8ZE=;
 b=vf+IoczyxNxy4k8UvdnZ7Nbx425gtbGC2onScTxUNVukOPDz4xD3bA6KI7fxnk2PLXMK
 snH24UqmL9ydqyQxRuaSF7tLDPtuQ+cxIpCbWHBVR+VrkPF45tPpbJyRW/mzGJ4NW6YT
 6zDfoRb8Nbd5X9yu2hCVRrG0+8D03FLRMFHDqvCX08sDWt+pPe5eB/xPZAGD39wcEKCB
 JER8IVvGN5xZceGsXz7dxkjtUzdU7f97MJd6xH4uTfwrY7H2k8mcxo9H9aJGFTe5BROt
 mhWkCEJ6FOx/bZ55PB1hTrzT9cfZ7iYj9CPzCAtoV8KvN37M6cHUDCbfLgUPmQjYNcQm Ag== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cd382gkhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 15:34:46 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AIFYQO1048802;
 Thu, 18 Nov 2021 15:34:31 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by userp3030.oracle.com with ESMTP id 3ca2g0p4dx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 15:34:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZhrMYeNfjBfgVM6WmNtNtxjX0rvSuWWKkqK5x6fqXVFDsTkjTzDlYXNOq754/mLJkhnyddQps9cco7ZpnKa9P5QP6FrZhx8wv2S64oYZFfy+daoKDNmGdVpgBpKDp/uDr8yisB2QyYpw9JWK1KHmVKxZuTsuYiT/YlgLb+o6fnpLLR8piRKuFH92ZE88A3pLiPtHB3TEXxOhdmzqmVnMsEoLSkY1GezCsMalur8DB92keYwjIKRUUpTdCg4jIygwESGHiNdeEXwdJzdZBVVRHcwgDI87xFs26EdPyLyxoTBVsRBcmJdbu6lFDQPIuZM0zNfqdy3NA7EdIn6gRYzC1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74Qb4dot220Gxni+lytSQDXFn3ewqSYOgiDAQZl/8ZE=;
 b=XW+Lb7QnCAFN/vGc8onUZ5ab0Ikkn43WKXEKH8rss4l0ysqWC1oC2lUZaHgc5ZSnYyzmhjJmv21Np2RozZQNE53ogQVVF/YMJ6H40OVlnrk8PQ0qk9onLdBTNzFBRtFbE5HIMTfU/gSfImFtOpfWIde3u9eHKii20yAZwf/jgoI0yVFooVc5O2dk1MMnDltdqDWylzoplIFO+RzVceCYyazuh5dq4jgPOLnVPAmtPpjZ4AHh3K47njuclp6xfoAiEeam5ezK/PCfLBt6fzFAwZC93kDCw3Qs6ck2qSeP9QkF2H5pv3SX5/Sqj7CXARiJ9s3Pwwbm8uFyXzc837bF+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74Qb4dot220Gxni+lytSQDXFn3ewqSYOgiDAQZl/8ZE=;
 b=SCcVdA9V49Nison2RLr4droPt4QQ06/KYl1L+ao4/YVP6kop2FC+JJADSVch0S+xEuvwnMNhUgBcd26Jwridk8bpscnAMVi9I78/aj+rR4b2uXi/1vVCqHvEr0rBe5KowsD+9Edx3b463GWJRJGgopVR1/uJqrDM+5lTia0xW3c=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by BL0PR10MB2801.namprd10.prod.outlook.com (2603:10b6:208:74::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Thu, 18 Nov
 2021 15:34:27 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9418:7fcf:86ec:e0f4]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::9418:7fcf:86ec:e0f4%7]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 15:34:27 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH-for-6.2?] docs: Render binary names as monospaced text
In-Reply-To: <20211118144317.4106651-1-philmd@redhat.com>
References: <20211118144317.4106651-1-philmd@redhat.com>
Date: Thu, 18 Nov 2021 15:34:22 +0000
Message-ID: <m2o86h8old.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: DB6P192CA0018.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::28)
 To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
Received: from oracle.com (46.7.162.180) by
 DB6P192CA0018.EURP192.PROD.OUTLOOK.COM (2603:10a6:4:b8::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.19 via Frontend Transport; Thu, 18 Nov 2021 15:34:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0bf8537-df64-4b87-ccf5-08d9aaa8e7e4
X-MS-TrafficTypeDiagnostic: BL0PR10MB2801:
X-Microsoft-Antispam-PRVS: <BL0PR10MB28016F2AD4185CEC6D97AD3AF49B9@BL0PR10MB2801.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XFCg3wE1ykIsBh+GIH8ojr+8IhSywzFdrjOiVO/I8Bdav5n+yf0A65DMnX421juBNWX0wXIIIxTk7+HBkxpWuAyxWsgOauiXEi8tzlUcEpfCMghSGwkm+vmj/R7Rv2mOyvyb4lDfSlIQM63/u0KloZacYy0HD5vaKnGSQOgZMqQw1I85/Fm1BlOfbEzBokfMMnD07Bn+GSdkze/4W08fn+Pmg2M8Jz4Whj/rCQhe7JmdDIUejtfxHG7zJxjNgrYeQqVp+Wz4WQM2jsCJkjrm6VcyEFePIgVEaowxdW3ZdPoHkF4/zr+aafmM9+ibicUcY2uKTLz6C5YQKBlcWX08qHCRUOTbSRoT9hyKJb9W6uLIDJCpLNaIWulBvuLInJRpfEebUK+LAgJWWX449bTxb2n4TX+CaQMqriSgWrdn8E+4Qp5Yj9bZXJIajTEq2QSHpnm1riFLo0/TpH8kQF3upTNFPmug8OUX0K/TZ+ZKqAYLA3o359kcAk+ncmnHzdHGPePYIdESLgZTwY2ZfyXgknHyVb8me4LpvsiRUSGLDuiuLrfVjJuirbHpYV5ewAKi15YUKF2WXH9g/Sl3TRjKkOQSnRKUfDPHDnK+zqE1i7kCPJQ/o2OYYsm/2BIFdba13yJjIvSSzpTrlfaq1YqOJCR1ALF/ovgkL38FP4i27/MbJgYukhO4Et9n5A0GWGAeVvmUwqDH5u+iHRc3JQ65TW2In305gMVlzvQrc9sYwcchibIDJSi4xw+yC92/7Rcz8BsvMpdMbi8sbcyPTnrZkppPDZCLZQYUBbG3aOfK8s3HwktK2rks85S1OpMKjWlP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(26005)(316002)(7416002)(6666004)(66946007)(55016002)(38100700002)(83380400001)(508600001)(38350700002)(8936002)(54906003)(66556008)(66476007)(7696005)(30864003)(86362001)(4001150100001)(44832011)(186003)(956004)(8886007)(966005)(5660300002)(2616005)(52116002)(8676002)(4326008)(36756003)(2906002)(33290500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0hZMjB2TlRNWmNNVy9zTFZiZDFXcFhTYzJkK25nTzFrRWYwUEdZVmtXNk5z?=
 =?utf-8?B?bGp3ckVqelY0SnlzYkR2Rzlkcjc2T2d2c2RFMlQwM1VnWmR5WXhieDQzZkl4?=
 =?utf-8?B?VUxySFN5SktwTFNQMktiMEdmQllsODdVQmltMjBtOXE0UTAzQURhaVprbng5?=
 =?utf-8?B?UnZGT3ZnZmFQZVUyeDFrK2hOeHA4aVhSNXZ6THZoK1lPT0FYU2dEVXJJYWZ4?=
 =?utf-8?B?Tk55REhkNHVLdkVDR1FVeVdhcUkrUVQ3emR6cXR3NWhabzFqOFBxZlhteEFu?=
 =?utf-8?B?eloydjVkK0dacXdVRkRsUGNiRG1TVC9PcVB2QTlCMjlnYkRabkFmdmRqUUNr?=
 =?utf-8?B?WEdVcGs3ZFFvWDdqam13Q2dOMWVUOU53dS85cGE4R2lOM2xmZDcxcy9uajR0?=
 =?utf-8?B?V2FDODRLWTZFUmwxRzhTQ1J4c0Z1ZXBIR1FTYnZnY3JXRWhwSXpDL0o1Kzkx?=
 =?utf-8?B?Y3pvUE10WFFWU25MdHhhR2J0NGpVUmZERXdkek1Gb0NLdDBtc3I5eEc4Qkhq?=
 =?utf-8?B?dXFleWN1UnVKK0dTN3NyT0o4aEVXa3pZT2xFdHZXeWJObGVIc3YzRE8vTHZz?=
 =?utf-8?B?YkZqUWl0SjBFbmdpa2RXdDRNcVJBUmc2STJ1MVd2eXk0dE8rSGpxc2l6eEhz?=
 =?utf-8?B?dzZ0bUtWRENnV0RHcjJEbjNJR25lSWNUWlgrSloxeHpaOEt1TkVPblhFdjJw?=
 =?utf-8?B?UlFvdmF6SWxBT0xqQUFwT3dxNzNya3ByTllLT0JBZGdVTWM1ckxwb2M4YW8y?=
 =?utf-8?B?TWVUOTY3Q3daSlFLN3F5b2syWUxvdisvTW1WYzdSSlZlT0tDT3VzNVN1bC9O?=
 =?utf-8?B?aWNBbjE1V1ZLejh2ZzZEN201aERIZVZ3QURFOWxsdjhnKzNFZ3JaZHlya0w5?=
 =?utf-8?B?V0tzV3JZNHNvdHJCMUFZTjVtYTBFMlJ0TVhhRytSVGQ5RHQvRjV6TmxiM0RO?=
 =?utf-8?B?UmU3T09EV2h0VXZFNUNjbE45MENWTGZ4NWZIejdOS1k3bFQ3OTlyTEhueU5u?=
 =?utf-8?B?dGVoTjRhNURxbStMUnR3OFBVVnorVWoxTkVyZlQ1bUxKUUtIMGVQUmhjTE5S?=
 =?utf-8?B?VXA4QXJHZTJESXRZb2pZMllLaUM0OWlyT1BMNERxYzZOMlIzVE54T20vNXRU?=
 =?utf-8?B?OGJEKzdNdnBNV3IyMTBjbFNyZndhdzFhL09tNmRMdXZQcUFKVGNWblNFc0hJ?=
 =?utf-8?B?ZlFnczZwZ0NsZWtuemdGY1hpWkloQlhFVHNzZkpKQmM1UFF3SDl1SFIvU29I?=
 =?utf-8?B?dUlHWDlXVVhrbFhOaWphZEhnVURDQktJTzNOeGF6elBHa09VTldzUFhSd3p6?=
 =?utf-8?B?Y3dRZlVlZk5jL2gxa3krWTFRM0p2VXA2eVNUQlJpb09hK3IwYU9OTFRvbytq?=
 =?utf-8?B?OHl0ZHFLd0FBbUU1cHExeFNId0UwTWc4TlFRSk9xa1pPRDBvT2hybGcxU3Vl?=
 =?utf-8?B?dk9zYlpUQXZVVlZ5OGdjbml5VDNUM2U1dHhFT1BCYkNYNEV6eFB6WWpuRllN?=
 =?utf-8?B?ajcxbnpYZC9xSkJ6bWxzaTY3M1B6VHpqSHpUQzZWRDd6QnM4cXRzYkx2TFdW?=
 =?utf-8?B?UHJ6QXpKTkw4eHlhU3UwcXVTY0t4U3YvVzNBc2ZvTjJlVjVtZzQvcE5xNFlJ?=
 =?utf-8?B?aWxFZVdCOHlsUEVsQmRLT0trTzJHU0xLUnppYW9ZcjhrbXNhaXlkR2lBNnU5?=
 =?utf-8?B?TlVtay9hUzFiVHBRdWJxeUxDOEVZM2ZheDVWNS9YYm13UDlLM3NEcEdLZE0r?=
 =?utf-8?B?QXl2NE9sWjIvSnIwUjhlMlVNeFhqdnZnVjF0VTVod1V0Tm8wMmMyeU9uejlL?=
 =?utf-8?B?dG1vQ2xSKzgrTTlJVVVVbjFXek14OS9ZYzBjWTFVMFZkdUdyRGVzMHROeDBN?=
 =?utf-8?B?QnZZaEZVRjJaNTd2Zk0rWUNhVEw0OUFHYVVGWnlrTE45ZHBNaE9LODJpQ05Q?=
 =?utf-8?B?TTlySGZrNUFtWjN5cUkrYXkzdWQ1ZmFwOGgyUmRUbGk0dmtKZjd2eGxNaGUx?=
 =?utf-8?B?cFZiV3FTdmJ5U2tuYjBLS1hnQ3dZWCtCT3REcVM0STRpdFdmbHg0aEp2YVZx?=
 =?utf-8?B?U3dYWGY1UWtkdXJjVnM4Q3RGTWZvRDFtNHJHNEpMTEd6ZHR2VGc3ZnB6NU1D?=
 =?utf-8?B?ekRNZ1FJdXVpQjcrb1ovdHEweTRTeEo5bWtOeWlCQkhsczY5ZGUwMng2Kzcv?=
 =?utf-8?Q?sFtWQKOIddM2BykQ03gO5PI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0bf8537-df64-4b87-ccf5-08d9aaa8e7e4
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 15:34:27.3266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jjNjBIpRdRAwZxlax6QEqzJWX1VipRlEScr4L8Qt4gmap/m08mw3SZVMBaW2VPb+xS0QnOy48R9kEAUfPu/3mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR10MB2801
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10172
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180086
X-Proofpoint-ORIG-GUID: _dUo63RY-lESGqbiuAbb52Ako1MCjcez
X-Proofpoint-GUID: _dUo63RY-lESGqbiuAbb52Ako1MCjcez
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John G Johnson <john.g.johnson@oracle.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, virtio-fs@redhat.com,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thursday, 2021-11-18 at 15:43:17 +01, Philippe Mathieu-Daud=C3=A9 wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Darren Kenny <darren.kenny@oracle.com>

> ---
>  docs/about/removed-features.rst        |  8 ++++----
>  docs/devel/build-system.rst            |  6 +++---
>  docs/devel/multi-process.rst           |  6 +++---
>  docs/devel/testing.rst                 |  8 ++++----
>  docs/image-fuzzer.txt                  |  6 +++---
>  docs/system/arm/orangepi.rst           |  2 +-
>  docs/system/images.rst                 |  2 +-
>  docs/system/qemu-block-drivers.rst.inc |  6 +++---
>  docs/system/tls.rst                    |  2 +-
>  docs/tools/qemu-img.rst                | 18 +++++++++---------
>  docs/tools/qemu-nbd.rst                |  4 ++--
>  docs/tools/qemu-storage-daemon.rst     |  7 ++++---
>  docs/tools/virtiofsd.rst               |  4 ++--
>  13 files changed, 40 insertions(+), 39 deletions(-)
>
> diff --git a/docs/about/removed-features.rst b/docs/about/removed-feature=
s.rst
> index 9d0d90c90d9..c02d1f6d494 100644
> --- a/docs/about/removed-features.rst
> +++ b/docs/about/removed-features.rst
> @@ -658,8 +658,8 @@ enforce that any failure to open the backing image (i=
ncluding if the
>  backing file is missing or an incorrect format was specified) is an
>  error when ``-u`` is not used.
> =20
> -qemu-img amend to adjust backing file (removed in 6.1)
> -''''''''''''''''''''''''''''''''''''''''''''''''''''''
> +``qemu-img`` amend to adjust backing file (removed in 6.1)
> +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> =20
>  The use of ``qemu-img amend`` to modify the name or format of a qcow2
>  backing image was never fully documented or tested, and interferes
> @@ -670,8 +670,8 @@ backing chain should be performed with ``qemu-img reb=
ase -u`` either
>  before or after the remaining changes being performed by amend, as
>  appropriate.
> =20
> -qemu-img backing file without format (removed in 6.1)
> -'''''''''''''''''''''''''''''''''''''''''''''''''''''
> +``qemu-img`` backing file without format (removed in 6.1)
> +'''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> =20
>  The use of ``qemu-img create``, ``qemu-img rebase``, or ``qemu-img
>  convert`` to create or modify an image that depends on a backing file
> diff --git a/docs/devel/build-system.rst b/docs/devel/build-system.rst
> index 7a83f5fc0db..431caba7aa0 100644
> --- a/docs/devel/build-system.rst
> +++ b/docs/devel/build-system.rst
> @@ -121,11 +121,11 @@ process for:
> =20
>  1) executables, which include:
> =20
> -   - Tools - qemu-img, qemu-nbd, qga (guest agent), etc
> +   - Tools - ``qemu-img``, ``qemu-nbd``, ``qga`` (guest agent), etc
> =20
> -   - System emulators - qemu-system-$ARCH
> +   - System emulators - ``qemu-system-$ARCH``
> =20
> -   - Userspace emulators - qemu-$ARCH
> +   - Userspace emulators - ``qemu-$ARCH``
> =20
>     - Unit tests
> =20
> diff --git a/docs/devel/multi-process.rst b/docs/devel/multi-process.rst
> index e5758a79aba..2c5ec977df8 100644
> --- a/docs/devel/multi-process.rst
> +++ b/docs/devel/multi-process.rst
> @@ -187,9 +187,9 @@ desired, in which the emulation application should on=
ly be allowed to
>  access the files or devices the VM it's running on behalf of can access.
>  #### qemu-io model
> =20
> -Qemu-io is a test harness used to test changes to the QEMU block backend
> -object code. (e.g., the code that implements disk images for disk driver
> -emulation) Qemu-io is not a device emulation application per se, but it
> +``qemu-io`` is a test harness used to test changes to the QEMU block bac=
kend
> +object code (e.g., the code that implements disk images for disk driver
> +emulation). ``qemu-io`` is not a device emulation application per se, bu=
t it
>  does compile the QEMU block objects into a separate binary from the main
>  QEMU one. This could be useful for disk device emulation, since its
>  emulation applications will need to include the QEMU block objects.
> diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
> index 60c59023e58..755343c7dd0 100644
> --- a/docs/devel/testing.rst
> +++ b/docs/devel/testing.rst
> @@ -564,11 +564,11 @@ exploiting a QEMU security bug to compromise the ho=
st.
>  QEMU binaries
>  ~~~~~~~~~~~~~
> =20
> -By default, qemu-system-x86_64 is searched in $PATH to run the guest. If=
 there
> -isn't one, or if it is older than 2.10, the test won't work. In this cas=
e,
> +By default, ``qemu-system-x86_64`` is searched in $PATH to run the guest=
. If
> +there isn't one, or if it is older than 2.10, the test won't work. In th=
is case,
>  provide the QEMU binary in env var: ``QEMU=3D/path/to/qemu-2.10+``.
> =20
> -Likewise the path to qemu-img can be set in QEMU_IMG environment variabl=
e.
> +Likewise the path to ``qemu-img`` can be set in QEMU_IMG environment var=
iable.
> =20
>  Make jobs
>  ~~~~~~~~~
> @@ -650,7 +650,7 @@ supported. To start the fuzzer, run
> =20
>    tests/image-fuzzer/runner.py -c '[["qemu-img", "info", "$test_img"]]' =
/tmp/test qcow2
> =20
> -Alternatively, some command different from "qemu-img info" can be tested=
, by
> +Alternatively, some command different from ``qemu-img info`` can be test=
ed, by
>  changing the ``-c`` option.
> =20
>  Integration tests using the Avocado Framework
> diff --git a/docs/image-fuzzer.txt b/docs/image-fuzzer.txt
> index 3e23ebec331..279cc8c807f 100644
> --- a/docs/image-fuzzer.txt
> +++ b/docs/image-fuzzer.txt
> @@ -51,10 +51,10 @@ assumes that core dumps will be generated in the curr=
ent working directory.
>  For comprehensive test results, please, set up your test environment
>  properly.
> =20
> -Paths to binaries under test (SUTs) qemu-img and qemu-io are retrieved f=
rom
> -environment variables. If the environment check fails the runner will
> +Paths to binaries under test (SUTs) ``qemu-img`` and ``qemu-io`` are ret=
rieved
> +from environment variables. If the environment check fails the runner wi=
ll
>  use SUTs installed in system paths.
> -qemu-img is required for creation of backing files, so it's mandatory to=
 set
> +``qemu-img`` is required for creation of backing files, so it's mandator=
y to set
>  the related environment variable if it's not installed in the system pat=
h.
>  For details about environment variables see qemu-iotests/check.
> =20
> diff --git a/docs/system/arm/orangepi.rst b/docs/system/arm/orangepi.rst
> index c55694dd91b..83c7445197b 100644
> --- a/docs/system/arm/orangepi.rst
> +++ b/docs/system/arm/orangepi.rst
> @@ -128,7 +128,7 @@ Alternatively, you can also choose to build you own i=
mage with buildroot
>  using the orangepi_pc_defconfig. Also see https://buildroot.org for more=
 information.
> =20
>  When using an image as an SD card, it must be resized to a power of two.=
 This can be
> -done with the qemu-img command. It is recommended to only increase the i=
mage size
> +done with the ``qemu-img`` command. It is recommended to only increase t=
he image size
>  instead of shrinking it to a power of two, to avoid loss of data. For ex=
ample,
>  to prepare a downloaded Armbian image, first extract it and then increas=
e
>  its size to one gigabyte as follows:
> diff --git a/docs/system/images.rst b/docs/system/images.rst
> index 3d9144e6258..d000bd6b6f1 100644
> --- a/docs/system/images.rst
> +++ b/docs/system/images.rst
> @@ -20,7 +20,7 @@ where myimage.img is the disk image filename and mysize=
 is its size in
>  kilobytes. You can add an ``M`` suffix to give the size in megabytes and
>  a ``G`` suffix for gigabytes.
> =20
> -See the qemu-img invocation documentation for more information.
> +See the ``qemu-img`` invocation documentation for more information.
> =20
>  .. _disk_005fimages_005fsnapshot_005fmode:
> =20
> diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-bl=
ock-drivers.rst.inc
> index 16225710ebb..e313784426d 100644
> --- a/docs/system/qemu-block-drivers.rst.inc
> +++ b/docs/system/qemu-block-drivers.rst.inc
> @@ -511,13 +511,13 @@ of an inet socket:
> =20
>    |qemu_system| linux.img -hdb nbd+unix://?socket=3D/tmp/my_socket
> =20
> -In this case, the block device must be exported using qemu-nbd:
> +In this case, the block device must be exported using ``qemu-nbd``:
> =20
>  .. parsed-literal::
> =20
>    qemu-nbd --socket=3D/tmp/my_socket my_disk.qcow2
> =20
> -The use of qemu-nbd allows sharing of a disk between several guests:
> +The use of ``qemu-nbd`` allows sharing of a disk between several guests:
> =20
>  .. parsed-literal::
> =20
> @@ -530,7 +530,7 @@ and then you can use it with two guests:
>    |qemu_system| linux1.img -hdb nbd+unix://?socket=3D/tmp/my_socket
>    |qemu_system| linux2.img -hdb nbd+unix://?socket=3D/tmp/my_socket
> =20
> -If the nbd-server uses named exports (supported since NBD 2.9.18, or wit=
h QEMU's
> +If the ``nbd-server`` uses named exports (supported since NBD 2.9.18, or=
 with QEMU's
>  own embedded NBD server), you must specify an export name in the URI:
> =20
>  .. parsed-literal::
> diff --git a/docs/system/tls.rst b/docs/system/tls.rst
> index b0973afe1bf..1a04674362e 100644
> --- a/docs/system/tls.rst
> +++ b/docs/system/tls.rst
> @@ -311,7 +311,7 @@ containing one or more usernames and random keys::
>     mkdir -m 0700 /tmp/keys
>     psktool -u rich -p /tmp/keys/keys.psk
> =20
> -TLS-enabled servers such as qemu-nbd can use this directory like so::
> +TLS-enabled servers such as ``qemu-nbd`` can use this directory like so:=
:
> =20
>     qemu-nbd \
>       -t -x / \
> diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
> index c0a44431467..d663dd92bd7 100644
> --- a/docs/tools/qemu-img.rst
> +++ b/docs/tools/qemu-img.rst
> @@ -127,9 +127,9 @@ by the used format or see the format descriptions bel=
ow for details.
>  .. option:: -S SIZE
> =20
>    Indicates the consecutive number of bytes that must contain only zeros
> -  for qemu-img to create a sparse image during conversion. This value is=
 rounded
> -  down to the nearest 512 bytes. You may use the common size suffixes li=
ke
> -  ``k`` for kilobytes.
> +  for ``qemu-img`` to create a sparse image during conversion. This valu=
e is
> +  rounded down to the nearest 512 bytes. You may use the common size suf=
fixes
> +  like ``k`` for kilobytes.
> =20
>  .. option:: -t CACHE
> =20
> @@ -431,7 +431,7 @@ Command description:
>    suppressed from the destination image.
> =20
>    *SPARSE_SIZE* indicates the consecutive number of bytes (defaults to 4=
k)
> -  that must contain only zeros for qemu-img to create a sparse image dur=
ing
> +  that must contain only zeros for ``qemu-img`` to create a sparse image=
 during
>    conversion. If *SPARSE_SIZE* is 0, the source will not be scanned for
>    unallocated or zero sectors, and the destination image will always be
>    fully allocated.
> @@ -447,7 +447,7 @@ Command description:
>    If the ``-n`` option is specified, the target volume creation will be
>    skipped. This is useful for formats such as ``rbd`` if the target
>    volume has already been created with site specific options that cannot
> -  be supplied through qemu-img.
> +  be supplied through ``qemu-img``.
> =20
>    Out of order writes can be enabled with ``-W`` to improve performance.
>    This is only recommended for preallocated devices like host devices or=
 other
> @@ -472,7 +472,7 @@ Command description:
>    If the option *BACKING_FILE* is specified, then the image will record
>    only the differences from *BACKING_FILE*. No size needs to be specifie=
d in
>    this case. *BACKING_FILE* will never be modified unless you use the
> -  ``commit`` monitor command (or qemu-img commit).
> +  ``commit`` monitor command (or ``qemu-img commit``).
> =20
>    If a relative path name is given, the backing file is looked up relati=
ve to
>    the directory containing *FILENAME*.
> @@ -684,7 +684,7 @@ Command description:
> =20
>    Safe mode
>      This is the default mode and performs a real rebase operation. The
> -    new backing file may differ from the old one and qemu-img rebase
> +    new backing file may differ from the old one and ``qemu-img rebase``
>      will take care of keeping the guest-visible content of *FILENAME*
>      unchanged.
> =20
> @@ -697,7 +697,7 @@ Command description:
>      exists.
> =20
>    Unsafe mode
> -    qemu-img uses the unsafe mode if ``-u`` is specified. In this
> +    ``qemu-img`` uses the unsafe mode if ``-u`` is specified. In this
>      mode, only the backing file name and format of *FILENAME* is changed
>      without any checks on the file contents. The user must take care of
>      specifying the correct new backing file, or the guest-visible
> @@ -735,7 +735,7 @@ Command description:
>    sizes accordingly.  Failure to do so will result in data loss!
> =20
>    When shrinking images, the ``--shrink`` option must be given. This inf=
orms
> -  qemu-img that the user acknowledges all loss of data beyond the trunca=
ted
> +  ``qemu-img`` that the user acknowledges all loss of data beyond the tr=
uncated
>    image's end.
> =20
>    After using this command to grow a disk image, you must use file syste=
m and
> diff --git a/docs/tools/qemu-nbd.rst b/docs/tools/qemu-nbd.rst
> index 56e54cd4411..a1eebbce4fa 100644
> --- a/docs/tools/qemu-nbd.rst
> +++ b/docs/tools/qemu-nbd.rst
> @@ -38,7 +38,7 @@ driver options if ``--image-opts`` is specified.
>    supported. The common object types that it makes sense to define are t=
he
>    ``secret`` object, which is used to supply passwords and/or encryption
>    keys, and the ``tls-creds`` object, which is used to supply TLS
> -  credentials for the qemu-nbd server or client.
> +  credentials for the ``qemu-nbd`` server or client.
> =20
>  .. option:: -p, --port=3DPORT
> =20
> @@ -238,7 +238,7 @@ daemon:
>  Expose the guest-visible contents of a qcow2 file via a block device
>  /dev/nbd0 (and possibly creating /dev/nbd0p1 and friends for
>  partitions found within), then disconnect the device when done.
> -Access to bind qemu-nbd to an /dev/nbd device generally requires root
> +Access to bind ``qemu-nbd`` to an /dev/nbd device generally requires roo=
t
>  privileges, and may also require the execution of ``modprobe nbd``
>  to enable the kernel NBD client module.  *CAUTION*: Do not use
>  this method to mount filesystems from an untrusted guest image - a
> diff --git a/docs/tools/qemu-storage-daemon.rst b/docs/tools/qemu-storage=
-daemon.rst
> index b8ef4486f1e..3e5a9dc0320 100644
> --- a/docs/tools/qemu-storage-daemon.rst
> +++ b/docs/tools/qemu-storage-daemon.rst
> @@ -10,9 +10,10 @@ Synopsis
>  Description
>  -----------
> =20
> -qemu-storage-daemon provides disk image functionality from QEMU, qemu-im=
g, and
> -qemu-nbd in a long-running process controlled via QMP commands without r=
unning
> -a virtual machine. It can export disk images, run block job operations, =
and
> +``qemu-storage-daemon`` provides disk image functionality from QEMU,
> +``qemu-img``, and ``qemu-nbd`` in a long-running process controlled via =
QMP
> +commands without running a virtual machine.
> +It can export disk images, run block job operations, and
>  perform other disk-related operations. The daemon is controlled via a QM=
P
>  monitor and initial configuration from the command-line.
> =20
> diff --git a/docs/tools/virtiofsd.rst b/docs/tools/virtiofsd.rst
> index cc314028309..07ac0be5511 100644
> --- a/docs/tools/virtiofsd.rst
> +++ b/docs/tools/virtiofsd.rst
> @@ -136,8 +136,8 @@ Extended attribute (xattr) mapping
>  By default the name of xattr's used by the client are passed through to =
the server
>  file system.  This can be a problem where either those xattr names are u=
sed
>  by something on the server (e.g. selinux client/server confusion) or if =
the
> -virtiofsd is running in a container with restricted privileges where it =
cannot
> -access some attributes.
> +``virtiofsd`` is running in a container with restricted privileges where=
 it
> +cannot access some attributes.
> =20
>  Mapping syntax
>  ~~~~~~~~~~~~~~
> --=20
> 2.31.1

