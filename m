Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 627874D6605
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 17:23:48 +0100 (CET)
Received: from localhost ([::1]:52098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSi3O-00043j-Tj
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 11:23:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nSi25-0002bA-3R
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 11:22:25 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:14576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1nSi21-0007Lo-U9
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 11:22:24 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22BFxVhl021518; 
 Fri, 11 Mar 2022 16:22:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=soVpnPpq/D+xF3gCJc3ldwft9H+OVxPHXzFP1gz7U8A=;
 b=kSPrtBp0Eo9xbJR6u+F0G3U3138Esae5XiZphusqXFSiqBSt29T8pIX6fDQ0n32N1Zjv
 zbszR6E4usOLQhLlE4LDU9hr4opqU/6WF97Fx9xWdjxBs1VK37369YHI8Qza0qs6RA1v
 c6eeToPtcbiWYgAwWkqU3npLXObP47j80qqkP+bOwRor4FVe8rnORBJ+aIaEnYl1GN4i
 TmF6TrlCVNEUsibvvsy5uXhwb/5uAK/yWiuadT4ch9NGaYgiTPsLlDOpbIOiYyJ5j092
 4mV946bk8NtYt0+chjJ1fHtRX9F98U2y1uByne/ttc7BL8nh/fRZjh9TD33qTiAOsBAA yw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3em0du9gdn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Mar 2022 16:22:12 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22BGBZWX157861;
 Fri, 11 Mar 2022 16:22:10 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2049.outbound.protection.outlook.com [104.47.74.49])
 by aserp3020.oracle.com with ESMTP id 3ekyp4ba23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Mar 2022 16:22:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQGZxqyWds3cReBX9YeBOZeZUK8w4TPrHsdG3kJEb9rEkIcmOwmTbKlNZ8vrUw5PR9g04R9sX0uUYBdCz13O9gDeyY8F9XK6KiK01eRnxnK3zjlm6BesB2fiRoMqOyl/3tOoEuyIIm9+nuh3jAk1rzM+XTkBV9g/EjKLvKJSopWntTsBswMa3Bk9p4UKj+QOkbUfa6/zEI8xULOKjrY7FWKdncGPSp/vfw/MMyMZ7arWV86UWCzuy31baO8ynUsfAm+A7pK9Vc4biXD+lMolHvxrkOHLTsS4uO2o2yPnLSJ5+Wn9UZXW0Zz7AB0fwTm5aOBGGjsVAS1wM7lkS0M8mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=soVpnPpq/D+xF3gCJc3ldwft9H+OVxPHXzFP1gz7U8A=;
 b=O6Qs3IQiXYGZaF6l6wanN13jwQ1nJ/Y6WN8timOavQjX8txcq5pK7ThOy0yfNPDJ7T9D5xgXpHSNfMi+UyIervsSNaF9Ox2ByZSeNuXoLZYA3PY7p1YYRrhPtZ1xdszfvDREkDJe4qNPN0+tHlpTKUQ78XP2eikCRLZGz5BXwMHc6dVzkpd7Xp7nmqUKB3wvrHrrU8RteSSfe87krQ1nBMR1OTqMTCSXdt5eZhBHiBqO20y9FN39fp4WOY3hsqRl1c3vVwtHG0Xh8olrKePlpcf20N8ivOhaSQb8fpCOh/XsCNcEzZcRafDsUs+kwY/vLtEP9p1IWIE1vLyAWrnl1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=soVpnPpq/D+xF3gCJc3ldwft9H+OVxPHXzFP1gz7U8A=;
 b=sg49SiOyPo/FJWKmj4pFtKa9ldrGJMxcg39w5ANFYby5f8QEfMBwnZvfyW9jdGXcL1pdoibBB4vsxlghvV1BNNXRnOyu6PI7xq3gjiDkb2TnkOVxMFxBby/vudFwjyl4++VcKP8shP1XiDPDD6pDTBtL/g7PvRFl9PoknX95LNc=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BN6PR1001MB2081.namprd10.prod.outlook.com (2603:10b6:405:2c::39)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 11 Mar
 2022 16:22:07 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6005:8b9:1b00:b0da%6]) with mapi id 15.20.5061.024; Fri, 11 Mar 2022
 16:22:07 +0000
Message-ID: <c1d37dbf-6a2e-01c7-4eaa-9809d54f1897@oracle.com>
Date: Fri, 11 Mar 2022 11:22:01 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH V7 19/29] vfio-pci: cpr part 1 (fd and dma)
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-20-git-send-email-steven.sistare@oracle.com>
 <20220307151610.0d8b2269.alex.williamson@redhat.com>
 <a8de61de-37b9-b88a-ac8c-a94d51a0dc92@oracle.com>
 <20220310113541.47edeb9b.alex.williamson@redhat.com>
 <588ff54d-e1df-d892-60c5-ac7c143a6e11@oracle.com>
 <20220310153039.454fd21b.alex.williamson@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20220310153039.454fd21b.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR08CA0012.namprd08.prod.outlook.com
 (2603:10b6:5:80::25) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 425a33e3-159d-4bd0-fe65-08da037b483c
X-MS-TrafficTypeDiagnostic: BN6PR1001MB2081:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1001MB2081CB88379AD92277AEEEB0F90C9@BN6PR1001MB2081.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kawWhYYwZzADggxUH2E31HVfrcvDoUMJ5hIlwh/8Fbj7aUMMlgevtptYL2MrbPujFqD6x3vclLTSWYY0zYZSZ65XJ5mX0nauwMjKD3M2sJtLlBdkAv/dayVnhQmQPsOsIotIkOheqWI2tnmM66dz3O2gwN4V9/5Bzr8EvweZiilDaWOtvvJfuWAzVtGrh+5EF53TXgLb9Z4qgwfupWnb6KIh4Xk2u2DBGJWXoU/qB9FZpH5UFWpm3aROM4o/r/rBNL2EzdeyR45/fTdBuLSETSPf117hKIIBnQG/l0AdwFUs/mJ4Qrvg1W9ah/xp3evmpLOuBiuQpBR8g/cFxV36RL4U09iJtyoRdL79M6CPlb6xtL2rhnQRjIUF9MZzS4CRSb7ZXu5n3X48V643owJcjKrZ2+8gHSVWqhVRW+WttAR47zfj7525EaNtl73birPbJlNvA/YxYMSzUadEQsJpDZBWE4ljLbUFiGKMuVHK8ImrNPDQdOm1Atn0pPeDToE9EzSxvIR+taR2GQh0N7MaP4vWIEqu+MbzimH5UO01XdVvyLcUxShAIVXc57xb/Co25RBr4aS232JQQLt2m2BbMKH69dX8M83LIBeDdaasMylXG7ckzuJ8ooXV4TnoEZIX5VnTCTqqivH0L5hzJBHZZ3rekR8CNwCAaSHbyRL05Efc5D7lZCARpsszjKPbpqAcseESKaEDCrPQ6empk9zqQ3U5QtGSt6MQ1yhjStVyY7M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(26005)(2906002)(4326008)(86362001)(186003)(508600001)(31696002)(83380400001)(2616005)(36916002)(44832011)(6666004)(7416002)(6506007)(5660300002)(66946007)(53546011)(36756003)(66556008)(66476007)(8676002)(6916009)(54906003)(316002)(31686004)(38100700002)(6486002)(6512007)(8936002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmZVQ25GWXZZTEYwTWxkcTE2REd6bTZhdDZMb2RRei9pSjNOeUl3ZlM5R1hQ?=
 =?utf-8?B?VzZ2TDJsQjE2NGNaMFRSWnBKeHAzc2xRbEpJcGdxTGpDbEhlRHFyK1MxMW83?=
 =?utf-8?B?NXVjMlcrOVlLeEhCYU5Nd0pkU1hRTzc0T1BqcUhFeUpUZWlRYjdrNjNUUW5t?=
 =?utf-8?B?M3hJcXB2RkM1WDhWSkd5eGRFN0pCRUpxMnR1YUxCWFlWcTg5bVliajdqRjY0?=
 =?utf-8?B?akxKak01eW1STDlqdGVRTDc4OFU5SytYVzZaNFVTQWcrQW9EaDlRQ1ozSWd0?=
 =?utf-8?B?SUlWY1ZHdUpmeFVFYllaRWdIaFRBWVdVVjJYMUpCRUx5b2RjSTVUVlpCNHMz?=
 =?utf-8?B?emwxYTF4NnlTeFo4N3BaSHMxMERDOEEyRjAwa2hjcksyTUhGOURMMEY1S0xI?=
 =?utf-8?B?ek53ZE9JQ0hoTFhyNVFSNFdHTFJ2WUJEbitWWnRjMHpqVGF2UDB6VnlPd1Nz?=
 =?utf-8?B?dHk5akN0OVlzdk5mUGVMd0wyeDA5N3NRdkNrd0dnRlJsZGJSakE5bVlRVTJC?=
 =?utf-8?B?OG53VGZpcElMUVdTRk0yb1FBZlo1RTFFMW9OVlFLa3kvaUV5SFZJckJpakZ4?=
 =?utf-8?B?MVgxVm1ad3F3c2hHNnZlWXAvdG80Z3RiR3VKakJCVGZRSEc3aVZTSWlNN1hp?=
 =?utf-8?B?eFB5OFVIUWh2cGpoRXlJbGlqYmp5M1hOOG05NS93eEtFK1YvWnpIUWJDUmJx?=
 =?utf-8?B?NXA4MWpZa2JKS045aktZTnY1M25qODg1eHl2SEhTcDlBOUs3amdUVWtyV0Zn?=
 =?utf-8?B?clRjZnpnM2c0RlhsdGdMUXNtMkY2NFdpUHlQVUhtV01BbnB0R1dWWU9Ud3hI?=
 =?utf-8?B?a3I0MVJPVHgzSmpPeXUzd096Rk81TTFXV1VpVHVJcTd4TXpocUJpZUdmd2FC?=
 =?utf-8?B?VnRxZEtKMnllVHJ4em42bFVSVUszOHBjMDJTaWJYMmt4MUthT003d01FdkxH?=
 =?utf-8?B?c1gxN2g4Y1VBckZ2ZE9maThOTmJMSmVnMjE5NFc2M2ErL3ZPM3NCUENYVXJa?=
 =?utf-8?B?dHdzN1lCbmo1T2tqU1ZkUm0yRjlFQ2RFeEtMY1I5dXVpNGRFRU03dXNwOGhM?=
 =?utf-8?B?RUgzMmh5dGVONTZ5T0h3cWJ4OWlxZHNmUU5hamdiUXJJVU1QUXlxbVZrRnNl?=
 =?utf-8?B?NklYcWwxbFgzeGpwQnNSYnlkRWlpaWtpRks2TWVSd3k1MjdKTzBIWVFtZEpp?=
 =?utf-8?B?VXVCRFhlZldjQWk0dmczYUgrNG1zVjJsT0k0b2M4OG9wNHRHRm0xaG81akpU?=
 =?utf-8?B?S2dTZ0VRckJsTlJnaFB3UWIxcTBtclVVUWk5SHV2OTRudDFNb1B3U0EwWldt?=
 =?utf-8?B?d3JFaFNYcCszcVZUMkdxYzJEQStpYWxpTGRXVkJvYzVJT3B5V3hyY01ZQlVl?=
 =?utf-8?B?TDBmZWdvRFU5amtTeVd1dS9sTWN4dXNTWUtMek8zNlY0RmJmdEhubFVMRnp0?=
 =?utf-8?B?SCtiSVNrdXpxR0taQUsrVnRHWjJrK29xMjAvQVJ3eEduL1VYenpLaHNKamZG?=
 =?utf-8?B?TklBOStxQWM5SXJlbURDZ2F6N01ueUhLTVpydXVPQnJvOWRtVmdRN3BOQVpK?=
 =?utf-8?B?RlpGQk5BOXNSV3AxcVZjUURYbkxsTk9wd3hZVno4NHVXMS8vcG9KTTNvR2xT?=
 =?utf-8?B?ZjFTN2IrRXJOeFBQVW5HZDErM010aHdhY1dITHJmQUtRUFJlakYxc2gyZWxR?=
 =?utf-8?B?a2hqVUE2Y1M2NTlkVkp1c0hwOTFWL2pITnBTbkR2eUV4Vm9EckRWeit3c2Ji?=
 =?utf-8?B?V28vcjVPRHAyMkJZWHNvdkUvRTZqV1g5Zm9XQjRtdnIxV2FQbXdUQkFaaG5p?=
 =?utf-8?B?Yk9GaC85M1kyU3RZc0c1dlN1NmlRdmdDRC9aR3lpZjhWOU9OaUNHNmlSRXNa?=
 =?utf-8?B?RFF4VkF5RDdrQkVRc0hDdllrTUoxZFFQM2VUWkw0QkRJRGNVdkxMV1ZjcGt6?=
 =?utf-8?B?RTBuaUJVYmRYVngrT3M1YjhWdHpBZVhzaG9uRUhSL1FBYTNZRVE5TnhWa0tU?=
 =?utf-8?B?OHNRZXNydC9oazVNV2RURVcxRU9ieHlYcWxQMlBXeWltMU1WdFVwbnIvT0ls?=
 =?utf-8?B?QUl3dURvaTFYMmhHb1dYNzlBS3BuTFdMV2hDYktSN2VjdWlWb21YL01RVkJJ?=
 =?utf-8?B?M0F0c3QyaXVFRzh6ZjZUMWRuaDJqcDZReFJPYlcwWjg5LzU2SmVYa0VZQW9y?=
 =?utf-8?B?Y2dMU3NlNkVwbFZzMVVLeXRXSUw1ZDJnRmo0NFlIb1I0Q0hGdUpmWDAwNmI3?=
 =?utf-8?B?TkFXaHAwd2RpVVc2NkNwbTRGeDFRPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 425a33e3-159d-4bd0-fe65-08da037b483c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 16:22:07.1662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RMmkmXMo9vegXR2wEKHIeecyP0yhRRTQarQ+zwzNt7F6XJO/2kg0YaTO086q8PpVtKeeysCEDZ1GNE2ZRxtrKHUQ+tXzYrJtoQ6gHeP+Ioc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1001MB2081
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10282
 signatures=692556
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203110081
X-Proofpoint-ORIG-GUID: 922kPVyBhsLgmcaugEXppxMrIE0PT3We
X-Proofpoint-GUID: 922kPVyBhsLgmcaugEXppxMrIE0PT3We
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/10/2022 5:30 PM, Alex Williamson wrote:
> On Thu, 10 Mar 2022 14:55:50 -0500
> Steven Sistare <steven.sistare@oracle.com> wrote:
> 
>> On 3/10/2022 1:35 PM, Alex Williamson wrote:
>>> On Thu, 10 Mar 2022 10:00:29 -0500
>>> Steven Sistare <steven.sistare@oracle.com> wrote:
>>>   
>>>> On 3/7/2022 5:16 PM, Alex Williamson wrote:  
>>>>> On Wed, 22 Dec 2021 11:05:24 -0800
>>>>> Steve Sistare <steven.sistare@oracle.com> wrote:  
>>>>> [...]
>>>>>> diff --git a/migration/cpr.c b/migration/cpr.c
>>>>>> index 37eca66..cee82cf 100644
>>>>>> --- a/migration/cpr.c
>>>>>> +++ b/migration/cpr.c
>>>>>> @@ -7,6 +7,7 @@
>>>>>>  
>>>>>>  #include "qemu/osdep.h"
>>>>>>  #include "exec/memory.h"
>>>>>> +#include "hw/vfio/vfio-common.h"
>>>>>>  #include "io/channel-buffer.h"
>>>>>>  #include "io/channel-file.h"
>>>>>>  #include "migration.h"
>>>>>> @@ -101,7 +102,9 @@ void qmp_cpr_exec(strList *args, Error **errp)
>>>>>>          error_setg(errp, "cpr-exec requires cpr-save with restart mode");
>>>>>>          return;
>>>>>>      }
>>>>>> -
>>>>>> +    if (cpr_vfio_save(errp)) {
>>>>>> +        return;
>>>>>> +    }    
>>>>>
>>>>> Why is vfio so unique that it needs separate handlers versus other
>>>>> devices?  Thanks,    
>>>>
>>>> In earlier patches these functions fiddled with more objects, but at this point
>>>> they are simple enough to convert to pre_save and post_load vmstate handlers for
>>>> the container and group objects.  However, we would still need to call special 
>>>> functons for vfio from qmp_cpr_exec:
>>>>
>>>>   * validate all containers support CPR before we start blasting vaddrs
>>>>     However, I could validate all, in every call to pre_save for each container.
>>>>     That would be less efficient, but fits the vmstate model.  
>>>
>>> Would it be a better option to mirror the migration blocker support, ie.
>>> any device that doesn't support cpr registers a blocker and generic
>>> code only needs to keep track of whether any blockers are registered.  
>>
>> We cannot specifically use migrate_add_blocker(), because it is checked in
>> the migration specific function migrate_prepare(), in a layer of functions 
>> above the simpler qemu_save_device_state() used in cpr.  But yes, we could
>> do something similar for vfio.  Increment a global counter in vfio_realize
>> if the container does not support cpr, and decrement it when the container is
>> destroyed.  pre_save could just check the counter.
> 
> Right, not suggesting to piggyback on migrate_add_blocker() only to use
> a similar mechanism.  Only drivers that can't support cpr need register
> a blocker but testing for blockers is done generically, not just for
> vfio devices.
> 
>>>>   * restore all vaddr's if qemu_save_device_state fails.
>>>>     However, I could recover for all containers inside pre_save when one container fails.
>>>>     Feels strange touching all objects in a function for one, but there is no real
>>>>     downside.  
>>>
>>> I'm not as familiar as I should be with migration callbacks, thanks to
>>> mostly not supporting it for vfio devices, but it seems strange to me
>>> that there's no existing callback or notifier per device to propagate
>>> save failure.  Do we not at least get some sort of resume callback in
>>> that case?  
>>
>> We do not:
>>     struct VMStateDescription {
>>         int (*pre_load)(void *opaque);
>>         int (*post_load)(void *opaque, int version_id);
>>         int (*pre_save)(void *opaque);
>>         int (*post_save)(void *opaque);
>>
>> The handler returns an error, which stops further saves and is propagated back
>> to the top level caller qemu_save_device_state().
>>
>> The vast majority of handlers do not have side effects, with no need to unwind 
>> anything on failure.
>>
>> This raises another point.  If pre_save succeeds for all the containers,
>> but fails for some non-vfio object, then the overall operation is abandoned,
>> but we do not restore the vaddr's.  To plug that hole, we need to call the
>> unwind code from qmp_cpr_save, or implement your alternative below.
> 
> We're trying to reuse migration interfaces, are we also triggering
> migration state change notifiers?  ie.
> MIGRATION_STATUS_{CANCELLING,CANCELLED,FAILED}  

No. That happens in the migration layer which we do not use.

> We already hook vfio
> devices supporting migration into that notifier to tell the driver to
> move the device back to the running state on failure, which seems a bit
> unique to vfio devices.  Containers could maybe register their own
> callbacks.
> 
>>> As an alternative, maybe each container could register a vm change
>>> handler that would trigger reloading vaddrs if we move to a running
>>> state and a flag on the container indicates vaddrs were invalidated?
>>> Thanks,  
>>
>> That works and is modular, but I dislike that it adds checks on the
>> happy path for a case that will rarely happen, and it pushes recovery from
>> failure further away from the original failure, which would make debugging
>> cascading failures more difficult.
> 
> Would using the migration notifier move us sufficiently closer to the
> failure point?  Otherwise I think you're talking about unwinding all
> the containers when any one fails, where you didn't like that object
> overreach, or maybe adding an optional callback... but I wonder if the
> above notifier essentially already does that.
> 
> In any case, I think we have options to either implement new or use
> existing notifier-like functionality to avoid all these vfio specific
> callouts.  Thanks,

Yes, defining a cpr notifier for failure and cleanup is a good solution.
I'll work on that and a cpr blocker.  I'll use the latter for vfio and
the chardevs.

- Steve

