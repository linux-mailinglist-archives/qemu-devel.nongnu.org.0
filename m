Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71227487DCE
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 21:42:36 +0100 (CET)
Received: from localhost ([::1]:46360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5w4J-0003xi-96
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 15:42:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n5w39-0003E0-Hs
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 15:41:23 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:37080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n5w36-000099-Am
 for qemu-devel@nongnu.org; Fri, 07 Jan 2022 15:41:23 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 207HaIRV029039; 
 Fri, 7 Jan 2022 18:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=W5ntMyONmZzmcy5KSPB7vHEZ4LreG5aErLW1VX8/mVQ=;
 b=Mu0y8Wj3LokTxuZHVplOHSt2ZxMcRffbD0myPD0iJl5M93vsqgKb9o+Tj+t4N0ogbdoL
 9kLi5lb/ac12fZljEn2EcJD8bXjSfjkFY3KaMCGIV9/7fFeVj19rrBbOiv7d1CaNcAO6
 w5Es0LycIjmugscQPqjirM8+YyAgDoerYxR6xEjwyc2Z43ghLu2ttJXMzPfJehUA65CE
 eYLQNq6KUZ6ez2zmhlOIrddCkUmUE/HKGxysQm7RDeInh7XmYwTWCVnGVAfQA89IkbVA
 T8HNlV4XlKkPt/vWiFQ7BPzs6lhp/oZj5yOjAr7QgUuwYe72P2KvtOKilJ6nqgPd3VPH sA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3de4vbasny-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jan 2022 18:45:14 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 207IQ2fR029042;
 Fri, 7 Jan 2022 18:45:13 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by aserp3020.oracle.com with ESMTP id 3dej4t5jja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Jan 2022 18:45:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oX3mcal9W3Vs++u+8oitTfWzfhUv35q6SNHZ+Go5dsaqZtd4sUiAf01A6fh/Sg96kkOBaohrPdnyhmUjdTok50OK2bobwivKt4RY/OAOfEb+pOcZuOa3CqCSV66cNi1/rmC6ibHrl4Tr+cZ14CuT+0B3MBUBEJ5TU/YBWAEQtxY7GB7KOyvrys7vXHsr02WoWuHwqVl3EIhNcfFkxs6COi0VQ9m+w83OTFLNmR1QSSYCknEmDasn0fuhfuPmj9K5+loUL9NR8pDgkMBoj38QH2Es/7QOFgo+MIdPIIPP5nFDvFXz97zdkarBytloIQi1vsoYgHGCrN+WW5Pi/+tSng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5ntMyONmZzmcy5KSPB7vHEZ4LreG5aErLW1VX8/mVQ=;
 b=LubP1WVk3pn0FjiNQK80PeQ+4RP5sTd2szYLP4UhUdxBCy0PCLwaOI8gMPEqTApUWr1eCBwgaqDQQOehsQfvkMadkTcchGEw3tBYnvTEhvhLIfhxjkxOJXN6K+iI/rVHU5G940PZV00ymYkqlaTWgwtaU5i+9n0XvHw/bcvxmOGgimYR8GG97k/NFioexItY7nUX7n7cFSKG+SL+30ScqLApRk/f3CrIKrs22kIVc1m8udaNe/0JxtL2yVZsGgYaZ6zAaACKtN4UAdhO2pQPnIKp72YgYE3JfhGab3J44Qw+toJ4Sue/7GVECU497wyEQErpdjzkPh0+gbq/1G0maQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5ntMyONmZzmcy5KSPB7vHEZ4LreG5aErLW1VX8/mVQ=;
 b=MW6/poc84mtM3z5t+2AKWffCD/IQfaIlx3Sk8B1/x30YHHWJqWKDx0WW7shycFWLFk5OnONab1oQA+1xcHCC/SbxGTnyTQwUWYGKkGMIxn6hUp9+FjVFv9rbKpJwYf+3M82ig5HVmh310ZS7XB4eixVbdgtQz1Lmcocj4LB0f10=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BY5PR10MB3793.namprd10.prod.outlook.com (2603:10b6:a03:1f6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Fri, 7 Jan
 2022 18:45:11 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%5]) with mapi id 15.20.4867.011; Fri, 7 Jan 2022
 18:45:11 +0000
Message-ID: <fcdf8dc1-4b71-1bf1-9e57-a372679c3de2@oracle.com>
Date: Fri, 7 Jan 2022 13:45:06 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V7 00/29] Live Update
Content-Language: en-US
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR18CA0008.namprd18.prod.outlook.com
 (2603:10b6:806:f3::32) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 49a5230e-05d0-4449-8615-08d9d20dd4be
X-MS-TrafficTypeDiagnostic: BY5PR10MB3793:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB3793F57E21B881B2E14C827BF94D9@BY5PR10MB3793.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kPQW7qRavpLK/nlwABHyy1dmeC+wBxnfdyyqsuIKFsffFU34Vl+3Q+0DbFPwWlwEBesh4lTFBDNMwrAXBu7gu7dqLw5KnR0wTnrg3B1ufCBVLt3QKTVbuu2a2tAwbPjNtPvZCfT62vhB+ml5pA5TFemN+SX4iiQKHZmLJ0e0ZMnotj6LqTkfL4tnkCK8f4IikJ6/st56L0t4Ml5tB455GD2JxygG7mYNUlB0nT3cwT5m0xzegl5Vkctb8aJTpKJ6jwEGAKYUG5vAFwYEgi+0E45XUuzd2+SfoZxKy2R8TYE9Q9qEWBm9BuapcvXZfQdVLV9ez5Pr3lxuLjvw87U8cdSxSYsU/uOK0J1yLu0EcG+GLrg9zCsFfpJF8YtSAtb3z0wWPGqc4y+gH7kTMPjs+IpWDwL4MZ9w4UVRBrfrp9I+GA69xX4ytYe64TjLHn98AWaIoXplEXs9Oigb5F2sI0+rgOCSfAVK1imLN9PVFJSAUGMWgthjF6MZ7urfB/ovqHUoOtxfwky1dvIpPT81ar2e+mkLBG4SA5+XSxmYwK74rFiE6K7zCWMBfz8E3mwXZqx1DYaul2x637dDsuJaaNtjMaUtJLF2ZV7AZNve8G9QvrOoPMFudPaqFU8gRBlWAEjgjC0R6Y5z3Cz1wIbCli4Us+zjthlKJbC4wRP29XEPmaoIfZePo0KejeZMXD5t9gWDwDX2cKZiXdxNoNUBVqsVnl2VTuFtl3QBO8QkXe0PMO278b+5CxV/IzTMs5dMsdOqkKPACDESKv2pdwUj12wYp3ZF87ZQY98UePWcqvtdHH+R50Sol0AsNmeJlpPLEkMc2kKWaDR7tCXUG+uDZ64Mmg7ipgc54TLE6FtAIHg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(44832011)(26005)(30864003)(6916009)(53546011)(66476007)(8936002)(6506007)(7416002)(66556008)(6666004)(15650500001)(86362001)(6512007)(6486002)(54906003)(36916002)(2906002)(5660300002)(508600001)(66946007)(4326008)(31686004)(36756003)(31696002)(2616005)(966005)(83380400001)(38100700002)(8676002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEFUS3RXWDJ1M2w0SzZqNHJVMUtyVy9XYWJjOE8wQkFZR3ZsY2VBb3EzbVJo?=
 =?utf-8?B?TGtYc09IOGNCSGNpYUtUc2Rmc0FySzVmOFAvVVlEQTlpcVRPQnU2aVBLUEFl?=
 =?utf-8?B?cVQ5VjdtTU1PcDNrV0UwU2g0WHB6UWc5K0UxQVNYL1F2YnRjTEJ0ZUhqNkkv?=
 =?utf-8?B?MFlmM3QvMXA3YmZDaWFTMGpsa1paZmNibHVaR3JSa0cyRHZzSUl6SnFWc0or?=
 =?utf-8?B?Tkh5czNLYU9xNTZLVkhLSy9zQkFkUEd2YnE0S2N2YmpLUWQvSURyMmZQOGNx?=
 =?utf-8?B?cG16bG83dk93d1dpaUE1L0o0RmRqVEhZNW9aKzRkUEd5TThZUlFhNnhYL0FH?=
 =?utf-8?B?QzJGMCt5VjJscXFYVUVMbUgrbSt2M3lNWVpZU3NuZm03VTg3dEZtT2QrUk1Y?=
 =?utf-8?B?V0NrY3lUeXVZRmJGTGE2Z2xLMnAreTRxVHFBbjVaUzYxU2RlZzdMMWVRWkht?=
 =?utf-8?B?NmpiVm9BbVMxb2NVdVpEYnN0bTA2czYzdm56NFlvaFNBeERmQ1RuZHFpbHl0?=
 =?utf-8?B?cTJ6OWtFR1lrL1VWSnk2RlNwRTB4bFpqdW5PMVF0dy9rN3Y5bjhCZzRMUEYz?=
 =?utf-8?B?NkdRWWxFd09tZmZEdGV6REhHSFV2YzhrNW9XT2dXRkVMWWVlQW5PTWRJNzlF?=
 =?utf-8?B?WDdJdy94bDdxK1lYV3FVYmlKK1duaHgrRXFkZXhTU0JkK1EyNEpxRXFJNlNE?=
 =?utf-8?B?QXZxbWNsN1FwNzdsYk1BUERHUXB1YXljVEdvZmJtTzQ1Uy9sWWNPU0hZdFpJ?=
 =?utf-8?B?M3pNNGUycVp0RW9qUzB2ZzVDZHBpaUo1Y2IyVVJ0TzU1K2lFSEFET1dqZWZJ?=
 =?utf-8?B?SHBWdkloY2xjRzlDL2VnV2dqYndQdWxTUXU1SFYvOGpKTGV3ekJaVHZKUU5R?=
 =?utf-8?B?a01iSXB4SHNWQURVMUphT2RhRWZWbHkvSnpubThYeUdwVVEzcklyQkFCZHht?=
 =?utf-8?B?NGkrRDZ5ejFNQlFWc04rVFJvZkVmYXNCSE5iVjJ4cndPZEVlSFZ0d0tPZzZE?=
 =?utf-8?B?Y09xZUpiOU8yZVo2dzFFV2oyVzI4M01oS2dha0E5dXdJVHc4NzVoUmxqQUtn?=
 =?utf-8?B?NDcwaGtjSXgzM2k1WGRJNFhIR1VoQ0xQenJ0QVVTeGYybDlJU1EzRDJRcHEx?=
 =?utf-8?B?YTJhcDgzQTJKUjdqNEYzUURtRDYwYVFVT09FbWZlTmpIKy8wdmcxQlh1SXM0?=
 =?utf-8?B?MUxIczR2OVdwb0VWTjN2V2N3TFZEOXg2cGZEWUFjTGhYQUpWM3JWdjVNWjND?=
 =?utf-8?B?amVla3BWS1poQnJVK1dMWFE2MFhIUzRqQmwwdURScVBqdnVXUUFJWGxvNm5I?=
 =?utf-8?B?UWY4YnFNYXV4elFBaFdLVGtsRk12TjBONjdwVEdJU0UxMEs0NGFOL0p1ekUw?=
 =?utf-8?B?dzB0MmxTck5Uejlwb2RVbnlqQUVmQ3pzMzFSYmFmUTV2S3FvcGFjQ1pHVk1Q?=
 =?utf-8?B?NG5EMkV5OU50UTg0NldWTEJ0ZjhzdkNYRnIvMmlVU0R4eURPK1FkNWpXN3o4?=
 =?utf-8?B?cEtVczg0MHFhSzRiOFNnVGNZbXBvMWhDOVN6ak5FREtWRWZkNG9manV3YWVH?=
 =?utf-8?B?YzJITVE3V2NvMlNXZmRQTGQ0SkpvY1JHTmUrNjJDb09qZUJJWmVBYVphNkVv?=
 =?utf-8?B?cmZGdDVrSG5pek1YbGtmUW4xWlA1ZWdMYTUwMHNrUFFSQ2V1alFZTUZkUEha?=
 =?utf-8?B?VnoyMWE1OFB2MHBtNHp2RkMrbXlENTNSR01JQkUySWNuTVp2OTB6Umpycmhp?=
 =?utf-8?B?R0FLTGNSMWdmQXl0U1N1MTVJUDE1aGRjRVZZek5IU3NuWUQ5MlpGajBCNWIr?=
 =?utf-8?B?aEt3czVxbm5WOGZjc3R0dE5yWlgvVjc3WW9pVmExVzlIQUJRZkZXbHQvcE16?=
 =?utf-8?B?Tlh3QVFwMEx3MHhEbTg5VS9admlkVmxEQlZ6SG50NVNDcEFHdm9pbWloa2RW?=
 =?utf-8?B?OGM0aGhPNVREQlRDdFZDRDFTbFlTSTlzWlp1ZXMyS3RtWGR0K0JPWUhVK3Jx?=
 =?utf-8?B?VTZ0d0FsTVRMMDlHTjlHdWRzRi9TbjJLcTlKbjRRRHNCSEphV2wyQXFrQlMx?=
 =?utf-8?B?aC9CcTVJMDF1Zm50ektVVjJQc0VHbzM3TEZhNnZpcHpxRGVCL2t2YU5RQVp6?=
 =?utf-8?B?VU1FR0lDbHpha01WWktGcW5KUXlIdk5UWEdsaFRsS2Y1WnI1WVlsNzZ0RDg3?=
 =?utf-8?B?OW1oOThPSmUxektJaDFmMERDNmE3cGVPZFcxQ3NhWnFvdEpkM0VKZlg2U2g1?=
 =?utf-8?B?VDd2c0RYSjJrS3ZrTXVQYWJwT0lnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a5230e-05d0-4449-8615-08d9d20dd4be
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2022 18:45:10.9986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HwhiQ8yUXU3moMNqZt/DXX5sI7YDN+Bplz8UmdO5S8ezH7zxeAaMYCS5YJjD1GS3s3w89d8TqKOMtEO1JtVkc4ubGI4zpqO2uNvv6L1Yj60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3793
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10220
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 mlxscore=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201070117
X-Proofpoint-ORIG-GUID: xYtmEG43PDOBlgrRX0o6ORw08Pq_xYy2
X-Proofpoint-GUID: xYtmEG43PDOBlgrRX0o6ORw08Pq_xYy2
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.691,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Dave,
  It has been a long time since we chatted about this series.  The vfio
patches have been updated with feedback from Alex and are close to being 
final (I think).  Could you take another look at the patches that you care 
about?  To refresh your memory, you last reviewed V3 of the series, and I 
made significant changes to address your comments.  The cover letter lists 
the changes in V4, V5, V6, and V7.

Best wishes for the new year,
- Steve

On 12/22/2021 2:05 PM, Steve Sistare wrote:
> Provide the cpr-save, cpr-exec, and cpr-load commands for live update.
> These save and restore VM state, with minimal guest pause time, so that
> qemu may be updated to a new version in between.
> 
> cpr-save stops the VM and saves vmstate to an ordinary file.  It supports
> any type of guest image and block device, but the caller must not modify
> guest block devices between cpr-save and cpr-load.  It supports two modes:
> reboot and restart.
> 
> In reboot mode, the caller invokes cpr-save and then terminates qemu.
> The caller may then update the host kernel and system software and reboot.
> The caller resumes the guest by running qemu with the same arguments as the
> original process and invoking cpr-load.  To use this mode, guest ram must be
> mapped to a persistent shared memory file such as /dev/dax0.0, or /dev/shm
> PKRAM as proposed in https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-anthony.yznaga@oracle.com.
> 
> The reboot mode supports vfio devices if the caller first suspends the
> guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
> guest drivers' suspend methods flush outstanding requests and re-initialize
> the devices, and thus there is no device state to save and restore.
> 
> Restart mode preserves the guest VM across a restart of the qemu process.
> After cpr-save, the caller passes qemu command-line arguments to cpr-exec,
> which directly exec's the new qemu binary.  The arguments must include -S
> so new qemu starts in a paused state and waits for the cpr-load command.
> The restart mode supports vfio devices by preserving the vfio container,
> group, device, and event descriptors across the qemu re-exec, and by
> updating DMA mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_VADDR and
> VFIO_DMA_MAP_FLAG_VADDR as defined in https://lore.kernel.org/kvm/1611939252-7240-1-git-send-email-steven.sistare@oracle.com/
> and integrated in Linux kernel 5.12.
> 
> To use the restart mode, qemu must be started with the memfd-alloc option,
> which allocates guest ram using memfd_create.  The memfd's are saved to
> the environment and kept open across exec, after which they are found from
> the environment and re-mmap'd.  Hence guest ram is preserved in place,
> albeit with new virtual addresses in the qemu process.
> 
> The caller resumes the guest by invoking cpr-load, which loads state from
> the file. If the VM was running at cpr-save time, then VM execution resumes.
> If the VM was suspended at cpr-save time (reboot mode), then the caller must
> issue a system_wakeup command to resume.
> 
> The first patches add reboot mode:
>   - memory: qemu_check_ram_volatile
>   - migration: fix populate_vfio_info
>   - migration: qemu file wrappers
>   - migration: simplify savevm
>   - vl: start on wakeup request
>   - cpr: reboot mode
>   - cpr: reboot HMP interfaces
> 
> The next patches add restart mode:
>   - memory: flat section iterator
>   - oslib: qemu_clear_cloexec
>   - machine: memfd-alloc option
>   - qapi: list utility functions
>   - vl: helper to request re-exec
>   - cpr: preserve extra state
>   - cpr: restart mode
>   - cpr: restart HMP interfaces
>   - hostmem-memfd: cpr for memory-backend-memfd
> 
> The next patches add vfio support for restart mode:
>   - pci: export functions for cpr
>   - vfio-pci: refactor for cpr
>   - vfio-pci: cpr part 1 (fd and dma)
>   - vfio-pci: cpr part 2 (msi)
>   - vfio-pci: cpr part 3 (intx)
>   - vfio-pci: recover from unmap-all-vaddr failure
> 
> The next patches preserve various descriptor-based backend devices across
> cprexec:
>   - loader: suppress rom_reset during cpr
>   - vhost: reset vhost devices for cpr
>   - chardev: cpr framework
>   - chardev: cpr for simple devices
>   - chardev: cpr for pty
>   - chardev: cpr for sockets
>   - cpr: only-cpr-capable option
> 
> Here is an example of updating qemu from v4.2.0 to v4.2.1 using
> restart mode.  The software update is performed while the guest is
> running to minimize downtime.
> 
> window 1                                        | window 2
>                                                 |
> # qemu-system-x86_64 ...                        |
> QEMU 4.2.0 monitor - type 'help' ...            |
> (qemu) info status                              |
> VM status: running                              |
>                                                 | # yum update qemu
> (qemu) cpr-save /tmp/qemu.sav restart           |
> (qemu) cpr-exec qemu-system-x86_64 -S ...       |
> QEMU 4.2.1 monitor - type 'help' ...            |
> (qemu) info status                              |
> VM status: paused (prelaunch)                   |
> (qemu) cpr-load /tmp/qemu.sav                   |
> (qemu) info status                              |
> VM status: running                              |
> 
> 
> Here is an example of updating the host kernel using reboot mode.
> 
> window 1                                        | window 2
>                                                 |
> # qemu-system-x86_64 ...mem-path=/dev/dax0.0 ...|
> QEMU 4.2.1 monitor - type 'help' ...            |
> (qemu) info status                              |
> VM status: running                              |
>                                                 | # yum update kernel-uek
> (qemu) cpr-save /tmp/qemu.sav reboot            |
> (qemu) quit                                     |
>                                                 |
> # systemctl kexec                               |
> kexec_core: Starting new kernel                 |
> ...                                             |
>                                                 |
> # qemu-system-x86_64 -S mem-path=/dev/dax0.0 ...|
> QEMU 4.2.1 monitor - type 'help' ...            |
> (qemu) info status                              |
> VM status: paused (prelaunch)                   |
> (qemu) cpr-load /tmp/qemu.sav                   |
> (qemu) info status                              |
> VM status: running                              |
> 
> Changes from V1 to V2:
>   - revert vmstate infrastructure changes
>   - refactor cpr functions into new files
>   - delete MADV_DOEXEC and use memfd + VFIO_DMA_UNMAP_FLAG_SUSPEND to
>     preserve memory.
>   - add framework to filter chardev's that support cpr
>   - save and restore vfio eventfd's
>   - modify cprinfo QMP interface
>   - incorporate misc review feedback
>   - remove unrelated and unneeded patches
>   - refactor all patches into a shorter and easier to review series
> 
> Changes from V2 to V3:
>   - rebase to qemu 6.0.0
>   - use final definition of vfio ioctls (VFIO_DMA_UNMAP_FLAG_VADDR etc)
>   - change memfd-alloc to a machine option
>   - Use qio_channel_socket_new_fd instead of adding qio_channel_socket_new_fd
>   - close monitor socket during cpr
>   - fix a few unreported bugs
>   - support memory-backend-memfd
> 
> Changes from V3 to V4:
>   - split reboot mode into separate patches
>   - add cprexec command
>   - delete QEMU_START_FREEZE, argv_main, and /usr/bin/qemu-exec
>   - add more checks for vfio and cpr compatibility, and recover after errors
>   - save vfio pci config in vmstate
>   - rename {setenv,getenv}_event_fd to {save,load}_event_fd
>   - use qemu_strtol
>   - change 6.0 references to 6.1
>   - use strerror(), use EXIT_FAILURE, remove period from error messages
>   - distribute MAINTAINERS additions to each patch
> 
> Changes from V4 to V5:
>   - rebase to master
> 
> Changes from V5 to V6:
>   vfio:
>   - delete redundant bus_master_enable_region in vfio_pci_post_load
>   - delete unmap.size warning
>   - fix phys_config memory leak
>   - add INTX support
>   - add vfio_named_notifier_init() helper
>   Other:
>   - 6.1 -> 6.2
>   - rename file -> filename in qapi
>   - delete cprinfo.  qapi introspection serves the same purpose.
>   - rename cprsave, cprexec, cprload -> cpr-save, cpr-exec, cpr-load
>   - improve documentation in qapi/cpr.json
>   - rename qemu_ram_volatile -> qemu_ram_check_volatile, and use
>     qemu_ram_foreach_block
>   - rename handle -> opaque
>   - use ERRP_GUARD
>   - use g_autoptr and g_autofree, and glib allocation functions
>   - conform to error conventions for bool and int function return values
>     and function names.
>   - remove word "error" in error messages
>   - rename as_flat_walk and its callback, and add comments.
>   - rename qemu_clr_cloexec -> qemu_clear_cloexec
>   - rename close-on-cpr -> reopen-on-cpr
>   - add strList utility functions
>   - factor out start on wakeup request to a separate patch
>   - deleted unnecessary layer (cprsave etc) and squashed QMP patches
>   - conditionally compile for CONFIG_VFIO
> 
> Changes from V6 to V7:
>   vfio:
>   - convert all event fd's to named event fd's with the same lifecycle and
>     delete vfio_pci_pre_save
>   - use vfio listener callback for updating vaddr and
>     defer listener registration
>   - update vaddr in vfio_dma_map
>   - simplify iommu_type derivation
>   - refactor recovery from unmap-all-vaddr failure to a separate patch
>   - add vfio_pci_pre_load to handle non-emulated config bits
>   - do not call VFIO_GROUP_SET_CONTAINER if reused
>   - add comments for vfio cpr
>   Other:
>   - suppress rom_reset during cpr
>   - more robust management of cpr mode
>   - delete chardev fd's iff !reopen_on_cpr
> 
> Steve Sistare (26):
>   memory: qemu_check_ram_volatile
>   migration: fix populate_vfio_info
>   migration: qemu file wrappers
>   migration: simplify savevm
>   vl: start on wakeup request
>   cpr: reboot mode
>   memory: flat section iterator
>   oslib: qemu_clear_cloexec
>   machine: memfd-alloc option
>   qapi: list utility functions
>   vl: helper to request re-exec
>   cpr: preserve extra state
>   cpr: restart mode
>   cpr: restart HMP interfaces
>   hostmem-memfd: cpr for memory-backend-memfd
>   pci: export functions for cpr
>   vfio-pci: refactor for cpr
>   vfio-pci: cpr part 1 (fd and dma)
>   vfio-pci: cpr part 2 (msi)
>   vfio-pci: cpr part 3 (intx)
>   vfio-pci: recover from unmap-all-vaddr failure
>   loader: suppress rom_reset during cpr
>   chardev: cpr framework
>   chardev: cpr for simple devices
>   chardev: cpr for pty
>   cpr: only-cpr-capable option
> 
> Mark Kanda, Steve Sistare (3):
>   cpr: reboot HMP interfaces
>   vhost: reset vhost devices for cpr
>   chardev: cpr for sockets
> 
>  MAINTAINERS                   |  12 ++
>  backends/hostmem-memfd.c      |  21 +--
>  chardev/char-mux.c            |   1 +
>  chardev/char-null.c           |   1 +
>  chardev/char-pty.c            |  16 +-
>  chardev/char-serial.c         |   1 +
>  chardev/char-socket.c         |  39 +++++
>  chardev/char-stdio.c          |   8 +
>  chardev/char.c                |  45 +++++-
>  gdbstub.c                     |   1 +
>  hmp-commands.hx               |  50 ++++++
>  hw/core/loader.c              |   4 +-
>  hw/core/machine.c             |  19 +++
>  hw/pci/msix.c                 |  20 ++-
>  hw/pci/pci.c                  |  13 +-
>  hw/vfio/common.c              | 184 ++++++++++++++++++---
>  hw/vfio/cpr.c                 | 129 +++++++++++++++
>  hw/vfio/meson.build           |   1 +
>  hw/vfio/pci.c                 | 368 +++++++++++++++++++++++++++++++++++++-----
>  hw/vfio/trace-events          |   1 +
>  hw/virtio/vhost.c             |  11 ++
>  include/chardev/char.h        |   6 +
>  include/exec/memory.h         |  39 +++++
>  include/hw/boards.h           |   1 +
>  include/hw/pci/msix.h         |   5 +
>  include/hw/pci/pci.h          |   2 +
>  include/hw/vfio/vfio-common.h |  10 ++
>  include/hw/virtio/vhost.h     |   1 +
>  include/migration/cpr.h       |  31 ++++
>  include/monitor/hmp.h         |   3 +
>  include/qapi/util.h           |  28 ++++
>  include/qemu/osdep.h          |   1 +
>  include/sysemu/runstate.h     |   2 +
>  include/sysemu/sysemu.h       |   1 +
>  migration/cpr-state.c         | 228 ++++++++++++++++++++++++++
>  migration/cpr.c               | 167 +++++++++++++++++++
>  migration/meson.build         |   2 +
>  migration/migration.c         |   5 +
>  migration/qemu-file-channel.c |  36 +++++
>  migration/qemu-file-channel.h |   6 +
>  migration/savevm.c            |  21 +--
>  migration/target.c            |  24 ++-
>  migration/trace-events        |   5 +
>  monitor/hmp-cmds.c            |  68 ++++----
>  monitor/hmp.c                 |   3 +
>  monitor/qmp.c                 |   3 +
>  qapi/char.json                |   7 +-
>  qapi/cpr.json                 |  76 +++++++++
>  qapi/meson.build              |   1 +
>  qapi/qapi-schema.json         |   1 +
>  qapi/qapi-util.c              |  37 +++++
>  qemu-options.hx               |  40 ++++-
>  softmmu/globals.c             |   1 +
>  softmmu/memory.c              |  46 ++++++
>  softmmu/physmem.c             |  55 +++++--
>  softmmu/runstate.c            |  38 ++++-
>  softmmu/vl.c                  |  18 ++-
>  stubs/cpr-state.c             |  15 ++
>  stubs/cpr.c                   |   3 +
>  stubs/meson.build             |   2 +
>  trace-events                  |   1 +
>  util/oslib-posix.c            |   9 ++
>  util/oslib-win32.c            |   4 +
>  util/qemu-config.c            |   4 +
>  64 files changed, 1852 insertions(+), 149 deletions(-)
>  create mode 100644 hw/vfio/cpr.c
>  create mode 100644 include/migration/cpr.h
>  create mode 100644 migration/cpr-state.c
>  create mode 100644 migration/cpr.c
>  create mode 100644 qapi/cpr.json
>  create mode 100644 stubs/cpr-state.c
>  create mode 100644 stubs/cpr.c
> 

