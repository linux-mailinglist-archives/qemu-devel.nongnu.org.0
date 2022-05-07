Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C876551E389
	for <lists+qemu-devel@lfdr.de>; Sat,  7 May 2022 04:31:07 +0200 (CEST)
Received: from localhost ([::1]:41252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnADq-0007W7-Dz
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 22:31:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nnABT-0004st-9S
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:28:39 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:10142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nnABR-0002Sw-4d
 for qemu-devel@nongnu.org; Fri, 06 May 2022 22:28:38 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2471hpwT024581;
 Sat, 7 May 2022 02:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=corp-2021-07-09;
 bh=ON5MeHet1FQvtMPhi5WnhVxxPzCtFwDPQfL450SDfZ8=;
 b=y9CwfdbD+tFEIBEB3yItnCp0Zworn4v/qkaT7jXshXiS5+LAv2sIV/BTQ+xv3CJCZIRc
 7U9kRaAOrQBdPrmGzpKRzU9kYLBvpW6nyBXzFmOYPR+/rd0Gh1P94Uo7EmW9rSFGO+Q7
 TI6gdRcRc2d3Z1pFannyn5BAuOi1GWU2w5eFzy2aYXFC0c+sIwPOi7AWNW87Uf0ZFl/0
 2fORBXiOFepFqjxjnLcfCttrIyH2Oi9d18BRO2bvDnO+/9TNjVchAVwhjN5npOyKinyM
 b4pwEM8u3Zg1qBhNvS39IKBlK8TKDF7q7I0JpN04d/I5al2EfYjYr81y9h3J1JmUXlBd qQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3fwfc0g0xn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 May 2022 02:28:31 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2472B11N033723; Sat, 7 May 2022 02:28:30 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2044.outbound.protection.outlook.com [104.47.51.44])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fwf6y8vjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 07 May 2022 02:28:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQuvITICiSGCpCYUgTAQPMoIA8ySNd6sJIbRsBewPCmRsXBZgmAV8cpMDwD6jLriilzhurEGsy3o0XIQs/ccBAIrkL9DvdL8DquVNSiRSFxsLxk0DA7t2ZqLTxbFws9UBYyrmqkAEf6nEbqTMqc2kK9AP6GXS1jbAz8boTv85a3cAQNlDjHulPijFkj3JkJ3hDtwHlX6helUzp0Voq8lRBooVQuqsT7Fwoqw3RuLaDj/R4iAPIkS3lBPNYmB3z9/q+4bu86YYM6hgoZaGQVZnGK6sMfu48WdrSrbgUTNDSsQluK2/a1JNXd7W2M+XVvn5KdmZ+ZC/xUPo7RhBTfTfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ON5MeHet1FQvtMPhi5WnhVxxPzCtFwDPQfL450SDfZ8=;
 b=cQWOga068KxYBQs/VdQC1QjilzlvhRRq1g+sEyCqwqYr6wiLTWB5WwdCi2VQfd7qk9yKZucMFniDC8Roxo4LO0OYu4H9RzmtY+Y+4axB2bg4I5wEw2CLIZd8qFpYTr93K8EXGmjX7ptei7gSLX6MCfUQSSPkSe/7oRTL1mFeB97ckG1o1ia0PW6UTIakz4hYdi26hf+tb/JaYguM7VS/oITqeAR8GAQ2KwNGHr0yxzrTaQ5wkJUCh4E7EfHKnF7l/8lB+O2g8GPSpSTMEZAp5FMsy/wmOwnZqWh3xDIjncdzuo+KDc3pO6m749Ksa1MY9GhJ83HIlvMnqRsWzZQ0gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ON5MeHet1FQvtMPhi5WnhVxxPzCtFwDPQfL450SDfZ8=;
 b=uKVTa47h54Rsh/5McY81HR11lBSwPsa6AMeFdrzAzXqKQxVCZmq/2SNCSkXvGwRi+X7P1OqvGDMJ9QWLchVqX3ZoeX/6+MGLXEpQDIg/D/jlkYe7GsNvG1I59BEuWaIaXELzXjtCuIT1k8Fmp+VhgN/6K32tmuMS9VdkDDYSA6E=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by DM5PR10MB1370.namprd10.prod.outlook.com (2603:10b6:3:f::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.24; Sat, 7 May 2022 02:28:28 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::c89:e3f5:ea4a:8d30%2]) with mapi id 15.20.5227.021; Sat, 7 May 2022
 02:28:28 +0000
From: Si-Wei Liu <si-wei.liu@oracle.com>
To: qemu-devel@nongnu.org
Cc: jasowang@redhat.com, mst@redhat.com, eperezma@redhat.com,
 sgarzare@redhat.com, eli@mellanox.com, si-wei.liu@oracle.com
Subject: [PATCH v4 0/7] vhost-vdpa multiqueue fixes
Date: Fri,  6 May 2022 19:28:11 -0700
Message-Id: <1651890498-24478-1-git-send-email-si-wei.liu@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR03CA0041.namprd03.prod.outlook.com
 (2603:10b6:5:100::18) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e64753f-4d86-4a52-6a44-08da2fd1450a
X-MS-TrafficTypeDiagnostic: DM5PR10MB1370:EE_
X-Microsoft-Antispam-PRVS: <DM5PR10MB1370622345E15F481AFE567AB1C49@DM5PR10MB1370.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Swlm3TPamnYf7h2k4TMLjUVzFqlGbis9ncUB5dTY3wzKVztpHwWB1NzkgYB//1cO2l1tdMb9n/O38wUx1NRve33TQ6z8RVfzRKRWUI04mvV27+N5yNHuz5Xnwx1/yv3dAXgjFSZc8v6VJdatr8wbQiearR6BQPmEbp73kBx808RSm2Xao/9xtWFqVIh+S9BrAYMmCId6QJqvrenX+oOX4rr/f4E97SJFY0OmRGeV9yq/4NvsmnAY7dqzZcUAuNPlNGunNKb9YQC2rnz3keP39/v7SsNKi7Hpiq76u1tiJhaytXXcrcqBHVH4tuRynj+FqMPd6PzKgM1IkgwUE6O47FHz+037pyqYXZ7WO3vxvnuGlF2EHGmBtP2DCAmwN4dbLrLU6ILxnuJuEGRSbBqDjnsJGgRufOfaQs2LHi2WoV5wCf1oe3MkD8zSQwkDCw81g7AjO8XjuKSjZvGhoYW1Ftk8My6issNl2S42GfxiANU1txjgCh1z6ONqj9mgNlNEMRzaOaoKI5JOn7b9/lBQw7rl0lppov6n9RC0XARwgSM9s0o2j8dUbF/RhzDZf+FFiRKn6GcIK/DQO0jxThzTepcjVoVlK3yGjNT6IycJVlQXBABOfKKIwIdYLwVTmGDJsOtsrOIEkUyItEOUWEqOVtx2RWCNJxP1jhKITNWq7mbro0gKp75KfGIwH0DK8s4wkaAFGXO0O5itkWtiwNu1KW4ayuxN2fqfIz/9PLuNdRiArYUqVEEPTUOzgfwIFWy7rkdo1VFN9M070mB2LK1fv4sF6PGBchATIej3CapZAQ0eoveP7l8f3r1SmxRID/mXIlGdbSwrt7Vj4ZUgpnVQJw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(83380400001)(52116002)(6666004)(966005)(508600001)(5660300002)(6506007)(6486002)(8936002)(186003)(86362001)(38100700002)(38350700002)(2616005)(316002)(8676002)(6916009)(66476007)(4326008)(66556008)(2906002)(66946007)(26005)(6512007)(107886003)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEdwajBabkxFS2dxSGF4VWMrazhKMUJzSDNVc3VzSFFjQUVTRGRzamhrclYy?=
 =?utf-8?B?dzJlWTE2cjVSZGNYN01oSHY5dmVGeHZZMTl6emNLcTdFd0p5dzM0em5MZE1m?=
 =?utf-8?B?NEg0WTV3MURheEN3QWg4QWFCZmxwRTBZTFBKelRCU2JGRUFuMWh5ZFpraEJ3?=
 =?utf-8?B?ekRaN0ozRGlLSFhSeWg2QzJxM1BNd0E1QWx2VzM2NHJTWWpHWE9yOXNJVXFm?=
 =?utf-8?B?c2Y5dGpkNFZpaVBYSGI4NXRnOEJWWDdMM0o1L1hrNHJiQkl4TnAzTmFBcHIx?=
 =?utf-8?B?WkdyUDNmMEFISC9BN2tweWN1N0NMb2dINmgwQlBOQ2JRQU0wbjJONVZwK2Rp?=
 =?utf-8?B?WlJJTGQrWXczWEN6US9ud0ZPaUxsTy9INHlITThlUEM3MGxIOVE0UnZJYTRT?=
 =?utf-8?B?cmtyamdxTVhrTW0wSE1NVXJ0OUxmeUV1Szl0RFh4UHZRUVJFQllSQ3Iyb045?=
 =?utf-8?B?Qk1EK2JESWNpS0xydXVyR3h0QW5EMWFtZnNUMlc2VStlNUFFTUcwdlVhd09x?=
 =?utf-8?B?Z1Nnc3p2L1VFMWRkVWE0VDN3K0dkdWdOYmRlVFFEZmhFaGhrR2xhYUlmZ2lW?=
 =?utf-8?B?a2dvcmRwZFA0Vk1abU5wTC9WYStXL0lpZXdYNWlQVFZQaFViY2JvTi9LdVIr?=
 =?utf-8?B?UHZQM0s1NTNsZ1RtRXlOWVlEUlE2T2lEdDRZVFVaYnFVZjJvNEgxc1lIcWxM?=
 =?utf-8?B?Mm5JNENMY3Y2Zk52eFNvMEFNTDFYTGNZT3Y5NEJoZVZ6QS9Vcm5UY281bTZT?=
 =?utf-8?B?RzFKbGErR2kwM01jbktISEhBOU0rZDZwcEtHTjArOU1LOHNRTVVQbzZLUk11?=
 =?utf-8?B?TzlWblI3RlRJZzRsTWMzQzRNNG5hT2tMSi9Ld0xQSXBvRkhFcURMd3BhSldE?=
 =?utf-8?B?VTQrcHd0V05zaHBBbXdiZUswRHlaRlJtVGpxU3ZMb2Q4ZVoveGQrUXBIaERQ?=
 =?utf-8?B?Q3hmZTM0aVpmenkzTGFZWVY0T1FxWjZMTVpadVRaQXB1WTFSZDg2eitBbFAz?=
 =?utf-8?B?VVpCUlpwUWJkeVRLMFlEZHc2UkVyYjI2RXlOUWFEZDdRZlJYb3ppd3RIaXVI?=
 =?utf-8?B?YkZHTXBZUkpjT00vSHZHbVdka2Era1YyWXNFdFIvRUlRbEpabnI1Tk1SdnRn?=
 =?utf-8?B?elJkUlJtT3Jka1h3bUVZVHBybDFqL1dKenZKRGRCaWoyRU5qNDhNcmpaTnBj?=
 =?utf-8?B?aGpUSFRuTHFqTW9DNG04K2lNdGxORmMzbm5HclVwTG1mNzZ0Qm9XUlQxYnBE?=
 =?utf-8?B?cWJpc21ldDlxbHB0NUVsR2tMK1RHTGVGdUhUa0ZLdE1md2RZZ2xJVmVTeElC?=
 =?utf-8?B?bk5MR2RjUEF3eVYzMWI2MDdCLzYzTUpqQkFJZmVBNUtIOUVMY0xVS3VoUFNF?=
 =?utf-8?B?Y2d6bXFJN0dWbjBjcFg1ZlJYZUNYbFRLK1lhTStXQUdCZVBLL1l6bVlkemJs?=
 =?utf-8?B?OGI1ekxuSnB5NGpON2plRTlpM2lnb1RaUDA4SFkrNHJUS1dGOGZYOHA0UGwz?=
 =?utf-8?B?b29HK0VJMEM2QmZKTkNxWjhwY1FYakRscHBsbGZhYituNHBYZjhUekh1bkFL?=
 =?utf-8?B?TXFnaTkrRXBraE5GekU3d09kbUtTSUhxV1dVUk95b3c0aWQyNHFvS2M3YUhn?=
 =?utf-8?B?NGJESTlFbkFWYWJINHN3RXYyM0gyNzBhZUZJbEQ2MVZuSTBqQmdZVXpIQTJL?=
 =?utf-8?B?THM0cGlJZUx6NlBSYUlhd25EeE1MWUxIK3QwWUdUQythR2xybUFGc1VKV2p1?=
 =?utf-8?B?MFRuZ0tTNDZmaXlsVzgwTjJOVU52Z0dCb0ZYMXlpVjZZMFJKOEhoaExwR1RJ?=
 =?utf-8?B?YmxIclJDMk4zQk9qYWMwYlNiMElUYWJXNFdUNG9tS2d5OUxQT3A3bFJtQjJj?=
 =?utf-8?B?bGJOREVUQUNGZXJwMEQxN1hwckZYcjU0OTRIYTR5UWljaDFOZk1GRW5Dei9o?=
 =?utf-8?B?a2RtSnFMZEEwRXFab1gwY3gwMkFhMmRpQk9Ta0RyL0VJbGVzcEhtNW52aHFM?=
 =?utf-8?B?U201c1EyTEZubUZBcUpOQW1xNWRNYkZyR0pNakNCUkFrdU40NFlicEFnZERx?=
 =?utf-8?B?WTdXTzZJd0ZyWEl3VHVoUjZRWnB2a0t2SVg3dGJ0NmgwNzYvdXNZbnlOOTcz?=
 =?utf-8?B?ME5JaXpZdmJnQ3gwSFYyRGlRZHdPMkVxeEpyWXhFWGlMUEJERVI1OWJqRVpt?=
 =?utf-8?B?QlRsTHI5NWR5MWNlaCs5KytERHFTY2EwRFU1QVdhalFjREVucDV6eFpJU05q?=
 =?utf-8?B?WnZ2SWJNdUw4M3YzRVlWamc5eUpKV25veG9rVmdUMEoyZWhuSDY0c01GUzh0?=
 =?utf-8?B?ZXRVZHBBNEJEZHkvS0IySlpxeGlkWGpvQTJFWWRvdmRBa1p4ckJkdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e64753f-4d86-4a52-6a44-08da2fd1450a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2022 02:28:28.1202 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sxtidCNgz7OEED1xS7krUHwECJHgGFhSRjhU6srceGdbV52+r2Hik11Gi3d07kIZ2GAK7ffuPoMJASX4/bpfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR10MB1370
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-06_07:2022-05-05,
 2022-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205070012
X-Proofpoint-ORIG-GUID: gGNFKkQolb3FW6fj5lP52xolcRnJ_1tw
X-Proofpoint-GUID: gGNFKkQolb3FW6fj5lP52xolcRnJ_1tw
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This patch series attempt to fix a few issues in vhost-vdpa multiqueue functionality.

Patch #1 and #2 are the formal submission for RFC patch as in:
https://lore.kernel.org/qemu-devel/c3e931ee-1a1b-9c2f-2f59-cb4395c230f9@oracle.com/

Patch #3 through #6 are obviously small bug fixes. Please find the description of
each in the commit log.

Patch #7 is a workaround fix for the QEMU segfault described in:
https://lore.kernel.org/qemu-devel/4f2acb7a-d436-9d97-80b1-3308c1b396b5@oracle.com/


Thanks,
-Siwei

---
v4:
  - split off the vhost_vdpa_set_backend_cap patch

v3:
  - switch to LOG_GUEST_ERROR for guest trigger-able error
  - add temporary band-aid fix for QEMU crash due to recursive call

v2:
  - split off vhost_dev notifier patch from "align ctrl_vq index for non-mq
    guest for vhost_vdpa"
  - change assert to error message
  - rename vhost_vdpa_one_time_request to vhost_vdpa_first_dev for clarity

---
Si-Wei Liu (7):
  virtio-net: setup vhost_dev and notifiers for cvq only when feature is
    negotiated
  virtio-net: align ctrl_vq index for non-mq guest for vhost_vdpa
  vhost-vdpa: fix improper cleanup in net_init_vhost_vdpa
  vhost-net: fix improper cleanup in vhost_net_start
  vhost-vdpa: backend feature should set only once
  vhost-vdpa: change name and polarity for vhost_vdpa_one_time_request()
  virtio-net: don't handle mq request in userspace handler for
    vhost-vdpa

 hw/net/vhost_net.c     |  4 +++-
 hw/net/virtio-net.c    | 49 ++++++++++++++++++++++++++++++++++++++++++++++---
 hw/virtio/vhost-vdpa.c | 23 +++++++++++++++--------
 net/vhost-vdpa.c       |  4 +++-
 4 files changed, 67 insertions(+), 13 deletions(-)

-- 
1.8.3.1


