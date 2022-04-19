Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EEF507CD1
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 00:48:31 +0200 (CEST)
Received: from localhost ([::1]:55596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngwe6-0007tS-Dr
	for lists+qemu-devel@lfdr.de; Tue, 19 Apr 2022 18:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngwdA-0007CR-P8
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 18:47:32 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:43194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1ngwd8-0003xr-To
 for qemu-devel@nongnu.org; Tue, 19 Apr 2022 18:47:32 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23JIPdAf024809; 
 Tue, 19 Apr 2022 20:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=TTytcwBs3sC/ZBTlu4Wy3DNcmkSqW1CaZzbotzrSEgI=;
 b=NoZNpfeUbbSu+4V5eFN/EbABU1T90puNAIXMH0u9s/zvxU0OrhY2lVYfcO2PSLEbzMh5
 vCczz90fVe5revMGMg91i1IVYytmAPGC8dmPQ757ReYZLoL4o/JGyaPJAJObjLDnSsqW
 OpY19mN2Hozw/yN51v7UmmOPQffJ+Kwbm8BZih3DzkngXORMJDeb1ObKKpEEDjYizt28
 FhbqgPTGs1lNrdj7YDYuBoZ1D1VzLNPetSm7Diwwcnt6PoD73hgKx4DlkHsMEqfn4fnD
 MQvymcTzlejt8VoneAWTkarLe88vhldYF1VA/xZ8sGz34rrxKlrKVTMVqB4cmBOb2uwh xg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ffnp9f29x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:44:38 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 23JKZj3F034097; Tue, 19 Apr 2022 20:44:37 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3ffm830c1a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Apr 2022 20:44:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqTV0rjeQZmIxXjcMLxT5TE/9kHOs6eHgPCB1U6f85bDb3VESDPYGSiZZ7ko4L5bYz/hqcF5mSB6UjrgtViWFa/f/AtWjDXcOdscd3X+yuLP4/MSbmWUVmtWhAcO4Nm6jTW2O/6BD6KhDQ/NKHQUtzfZ/sMqjLDvNpUT6/Wxk+a7h655Be9owg1fpKTsBkM0aJ45cCXyIpFykIE2d22t507YyIKtRtIhlxaZYDpbyLUbHw8dHdD28y58xSwrlpbk+habK/0zkZc5ceqbMYXzZQnDeKeEGbkImmVfGakfk8wXwUhsPV0itx4lkmZlEIzuyuGsV018YxvYolOBZ2LmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TTytcwBs3sC/ZBTlu4Wy3DNcmkSqW1CaZzbotzrSEgI=;
 b=P7MbJM97bIwCL54EYHKRc25X3PGjf2P4aefV8LeMVT2cb1JVOt8qpgXjBYc33zXZjTNzeORjuOGrLAYoZUIiBlvfVxTW1Fnm6LAZorv35k+/ry1+FIxNIM/thV9hfBqsz03ncyoE5CWzoOS8KxearSbmzBPoLLLtvxADRztb4eTjOjWIpxYElNlPtwNRe/KEt676+pZGLc4dN6l7vw0vEBgyruTpJwUcpCuaSn6sqPtmC7h+L4zGezK+GHWr/X6EzwH9LrOAH5yu3tL8c8ykMs5ioZb5mmzny5qEvyFyYc5BzrN5CkNr+VvzMZOiLUjRicSkoQ+25KDX5zddYN/Ujw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TTytcwBs3sC/ZBTlu4Wy3DNcmkSqW1CaZzbotzrSEgI=;
 b=To5dEuTa/S9uK1+x1wvf9j4iGVjnBFdycHrbPgf8t98WP3yIk6QyBIf7kgdncxX+0VRdOGaERQD1MbJ942W6KfbvQ9iQQ5mft39yAlikmwj8608gePWYM9ztSOn3e0vIoxn6k4yrf64ZIwjJovqILw0cSCBimARKKKYtijbNISo=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MWHPR10MB1998.namprd10.prod.outlook.com (2603:10b6:300:10c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Tue, 19 Apr
 2022 20:44:35 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e104:96ca:aa5c:2bac%4]) with mapi id 15.20.5164.025; Tue, 19 Apr 2022
 20:44:34 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 01/17] tests/avocado: Specify target VM argument to helper
 routines
Date: Tue, 19 Apr 2022 16:44:06 -0400
Message-Id: <f75f7584fdc5fc1aa8dd44425a4c94ee16369e89.1650379269.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1650379269.git.jag.raman@oracle.com>
References: <cover.1650379269.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0029.namprd04.prod.outlook.com
 (2603:10b6:a03:40::42) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bd319b6e-0d5c-4a09-8164-08da2245697e
X-MS-TrafficTypeDiagnostic: MWHPR10MB1998:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB199852A9F51DBD3B588E478890F29@MWHPR10MB1998.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jFaybOLvrH+OdTs1p+9yGsMbSBOOqzEO23dq4x7JyPUx2cEoatC4be+xk4Ko9e75GR99uq9EfEA3TE5Sbo7ZJ6t85Y0lpKFz789Q97UH+HHd5j6yODD8vnlOXs4v8jHdtFtE0boMiX8rOnjJCNOf/YJach7mMpR8Rj7pEvB1NLrqcwtqVdv28mV/gWjc7NJQz+B3nxgyka21mMEKAd0lJjNDVDEeS9pqGO27E2twoE6nU9UdaMelYupHoIe5Ely+OIvXJprdj8Y+cEAz1p46pGwF3IZPDgUUY3UNPalZNBmplURzkInf6QdjoWAWsWGXv+mjdoIerQwzz6P621AV5jWkGuOsLDN8VMYcE8SythyBopjPPYQrrFzHU/Rm0q7bw+louWAyOrADML10BNXnC76cJaLtzcANVlHOF9qFhSdbF1ox3srO5Pgn8xNVmB4+gAbjjh6bcxFgTqwxf2cXqI3l8gGojXE44qiozSLCRp71O8oL2lhdFGgQhsCjJeXHyE/v6ruyfoXmzmOatHRxFjSYSrmPrcaZ8zphBbXFwSVdlxPNO8qkbZ15V2yWMOSJglANatzDJzkOBNR0sQ9SXxZREcv26gcjTHejmgzae7nrqJT8HnJYeulQuWQt3M2Mgr8fNhLhNJz/KbizmDzKjdw/fvZ6aV5ggsfiJ55gPoESCpusz4VDZqPMQKjnYInl2u5qilaBgB/7n7e/n/ESVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(6486002)(4326008)(66946007)(66556008)(38100700002)(66476007)(8936002)(7416002)(5660300002)(8676002)(38350700002)(2906002)(52116002)(107886003)(508600001)(2616005)(186003)(36756003)(26005)(316002)(6916009)(6506007)(6512007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVhob29CKy91anZSS2g0WWRmY0d0Y01aSU1hcnJnaFBvZzdsV0lid0MxUEZp?=
 =?utf-8?B?a1Q0WDM3SVZodVBjd2JHN1F6MmRwRGJoQU1iSU5jbnpyWG1GWXQvNVo0WGx2?=
 =?utf-8?B?VHhoeGlDaWVSSDJIbXMwWUR1bzNOZm54d2FRaFZHL3dBdVBla0c0RzBma3ZI?=
 =?utf-8?B?aWw0WnpyLzYxNkgyRHd5WmRXYjY3dzBJaHNTR2V0T2ZVK1RHcUdRZVhNTjRu?=
 =?utf-8?B?ZUo3U251SlhYcmpoeGpybGVzQlRRL3hvb2plUGJDNVJLRUpNVHMzZmZYQUdN?=
 =?utf-8?B?VFI4Z1RCVVNrNHk4YXdWc1pTSytURnE4QkloTDdXSFU3TkdKUVovaDZNblJ3?=
 =?utf-8?B?SStWTkJjUnZ4dnkvT3AzNlgyeWdZSkFhN3F3V0xEQjBTMmFoSTVVTGc1cTZW?=
 =?utf-8?B?bFdrTzgwTHNrQjlHVUVxTVFtVnY5bENmQW16VVcvUVROaHNsYUZlMUN4U3Fs?=
 =?utf-8?B?eUdTZndvdlRDRHh6Q3hGNExPL1FxZ3QrdHdQb29PdXNzZXBqY29EQ29zWHV6?=
 =?utf-8?B?dG9nUGdCMG9mYWJWckhhL2lPR2JvdFJJZkNVKzZEQjFYc0RqelkxUVozalo0?=
 =?utf-8?B?SncrcXlLdnQwUktPUkpoamxkdmEwdE5UWi9jcDQvRldnbHVnb3ZGd3lyZWFi?=
 =?utf-8?B?akg1WDIwYXdPa1BRV0VHSEVjYzl3bFA4dHNNWXZMVWQwQnVlK2daZFRuOGd1?=
 =?utf-8?B?dlFsdXlhWWVJbGpOMmVsOVJnZ2NVNjVna0l4UzVSb252UXVTQjVmVFFJSTlK?=
 =?utf-8?B?OEhic3dWempGZHJjYzV4OERkMzBBTXFOY1E0dlNGVmd3RmgySlhXdnp2YVdB?=
 =?utf-8?B?OGRJYUM3UkcyczFpVlRnTzJ2dHQzRmlBVy8ya0R3UWdNc29aOXg5WUREY0tr?=
 =?utf-8?B?bzY2d3l6R0IzeDJGV2lheVNxTUpsZmI3WFd1ZnNud0NCWm4xQ3dOU0FQNCtr?=
 =?utf-8?B?eUpNbzI2RUxCMjZKOXZ3ZFUydUFYNjlmS2h0Z0pnUWhweVpkZWsvL2Q1VUtl?=
 =?utf-8?B?RUxRUExTaEVuNnh3c0NNQ2xQdnplSFV3SFZWUTE2VXphbERJUFZNZkV4L0V2?=
 =?utf-8?B?OGhQNlhOcnN2NlZjUjN0Njl3QzZDVS9RWXU1REFlblF4NEVOWkU2Y29yRUM1?=
 =?utf-8?B?dWhEM2RZMmpCTWo3OXhmOWRYaURtRHRnVWg3dUFnWGN5YkFhbXZVQmdMSWFM?=
 =?utf-8?B?R2V2VXdvZ0trNENVbjc5c0xLNTZQRW4wMDVkbXROK05lVEJUK3RaRGM0WXpX?=
 =?utf-8?B?ZUZmWXd5Szc1MHRWNUw5LzhTek9lTkpmOG1ZS3IzQ0hXRUNXRWJiZnFzRktZ?=
 =?utf-8?B?YitHY3dScnpLblJkME5TOGlsNlAxQUxqUnYxQVEzNHQvaVlINzFvSTNYQmpP?=
 =?utf-8?B?aDFkMkxVaXdlV0FvK2NLaDJiM21lZ0o2TExraTRBVThCZGVKWXpKWlBXUVRp?=
 =?utf-8?B?cnhFV0h4cVd3RS91MTRaRWdvSVJYVWYyZEc0SU9JZjhMQVltc3dab3pld0pM?=
 =?utf-8?B?MmNzZjBJcHdYclNSeU4yM1RST2N6cnFTOElPRDdvVjB4UENCY2NSSWdGYWVV?=
 =?utf-8?B?UTJtb0c1Q2VLOEtKOVdrQkFEd1dXdjd0TkdqaEZHVlpiVGo3Qkp2TE4rcENH?=
 =?utf-8?B?M0sxUDdUZGVKUG1Ic0dCQktUbDF2Y2NuajhrTWtFMXB3ajZSM3BabVdZai8v?=
 =?utf-8?B?eDNwSHdodXJhQjNmZ2l2NCtHdE9CaHBkcElDcnNqZ0o4cFA2UmVUL1QvTUhu?=
 =?utf-8?B?REpjdUUxVUQxN3NTMUQrU093alFsdkpOM3ZKK3poU1hyWEN6NitXeUNIenZT?=
 =?utf-8?B?QVF2eHVzMmhzRXpIam9DSGw0N3gvRkNWTGxmV1lYekhhY3Iyanc5OXRWK1J5?=
 =?utf-8?B?VVhOQTBJWGM5SlFPT2tmcHE5aWFOWm1jTnFNbmNxb2NoZTlYU2dzOHVxcXNw?=
 =?utf-8?B?RnpBRjZWYUdTWVZzRjFJYlIrbHFRbFlMVWpJVE1pQVJBalh0UVY4SllnSHQx?=
 =?utf-8?B?Vm9ENkdET0U2NlpFWjZoZmZyRzd2TUtTcEVPK3RkNUdyOUxTNGdKWUZqZU4w?=
 =?utf-8?B?MzduZlNldktRZkNsVzhGMHcvcFFNbEtiS1FHSERCZDlHSE9Qc2NNdE1YV0RO?=
 =?utf-8?B?RVh5bERWZ05jNnd3WUNDUUs1cGt3MFY5NTJZci8wOUpGZHcrdWZENDVUeFUr?=
 =?utf-8?B?U0wzcktnekd6R0NURytKY1F4bVNERmh2Q0F2c0c1bUFQR1lLN2x0OVU2bFNX?=
 =?utf-8?B?UVkxbExkMzhCeHpadWtkbTVmYXlzZzJYYXI2ZTg0K29sQ3pyUWtZaUhBVEc1?=
 =?utf-8?B?QTEwYkRwT2pveUF3cUtBc1E5SVlGQWtCZEdtNXl0MnZQWFIwakdTUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd319b6e-0d5c-4a09-8164-08da2245697e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2022 20:44:34.8707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eKuffJlx83iwVnEKCDMKU/IwIYFzXTK1QnYvrmYpbybnlJ/1yKxbL1pcetbEpyi9T1D0KA9tuwnUBc8HDOa36A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1998
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-04-19_07:2022-04-15,
 2022-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204190115
X-Proofpoint-ORIG-GUID: wyc4fTm_efrRa0Vg2c4xpFzoEXjaWiM1
X-Proofpoint-GUID: wyc4fTm_efrRa0Vg2c4xpFzoEXjaWiM1
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, thanos.makatos@nutanix.com, kanth.ghatraju@oracle.com,
 stefanha@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 jag.raman@oracle.com, eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Specify target VM for exec_command and
exec_command_and_wait_for_pattern routines

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 tests/avocado/avocado_qemu/__init__.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index ac85e36a4d..18a34a798c 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -198,7 +198,7 @@ def wait_for_console_pattern(test, success_message, failure_message=None,
     """
     _console_interaction(test, success_message, failure_message, None, vm=vm)
 
-def exec_command(test, command):
+def exec_command(test, command, vm=None):
     """
     Send a command to a console (appending CRLF characters), while logging
     the content.
@@ -207,11 +207,14 @@ def exec_command(test, command):
     :type test: :class:`avocado_qemu.QemuSystemTest`
     :param command: the command to send
     :type command: str
+    :param vm: target vm
+    :type vm: :class:`qemu.machine.QEMUMachine`
     """
-    _console_interaction(test, None, None, command + '\r')
+    _console_interaction(test, None, None, command + '\r', vm=vm)
 
 def exec_command_and_wait_for_pattern(test, command,
-                                      success_message, failure_message=None):
+                                      success_message, failure_message=None,
+                                      vm=None):
     """
     Send a command to a console (appending CRLF characters), then wait
     for success_message to appear on the console, while logging the.
@@ -223,8 +226,11 @@ def exec_command_and_wait_for_pattern(test, command,
     :param command: the command to send
     :param success_message: if this message appears, test succeeds
     :param failure_message: if this message appears, test fails
+    :param vm: target vm
+    :type vm: :class:`qemu.machine.QEMUMachine`
     """
-    _console_interaction(test, success_message, failure_message, command + '\r')
+    _console_interaction(test, success_message, failure_message, command + '\r',
+                         vm=vm)
 
 class QemuBaseTest(avocado.Test):
     def _get_unique_tag_val(self, tag_name):
-- 
2.20.1


