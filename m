Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9996DAFD4
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Apr 2023 17:46:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkoGt-0008Ry-9d; Fri, 07 Apr 2023 11:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pkoGn-0008Rn-8G
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:44:57 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pkoGk-00005x-Ko
 for qemu-devel@nongnu.org; Fri, 07 Apr 2023 11:44:56 -0400
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 337CeAmS008812; Fri, 7 Apr 2023 15:44:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 to : from : subject : content-type : content-transfer-encoding :
 mime-version; s=corp-2022-7-12;
 bh=QYOqKRa8Y2Ah0yGkoygM9g0zDAixVqjdqXb5B/Wisqc=;
 b=kNhyQ6mczyFDM6nyp2DEMSH7692kTL+tJtfJpHu0I//Oqp9yMF4JqtuM2PMICLkT+xuw
 c/l8hfon3gTbLAhGlfmY2l1F8J9vSGknNRQ5RJNLb0rwq1Reo3zRnR77DISecaKrth8D
 ET2BgDObO0/3BsN/UqxjBhSuyP1EBImwJ9LC86Qr+Y9aRXhmZqWntzbEALEbTLjPPI5v
 ErqHOmYkoJ/3e27uOBW8bBS9L8tUdIsmLSDWmjoIaWrmQY+O5IJRLJh9RfyJ+iKUa2YK
 Nqd+3RJRUhPnTLdmonLkVyo73MSvZuOhEuDHjmZnadmfBcyiqxOsUrMA2b0dv74sS13F 4A== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ppcnd5fgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Apr 2023 15:44:49 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 337EOX8n027428; Fri, 7 Apr 2023 15:44:49 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3pptuuu03f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 Apr 2023 15:44:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RvgLIFHFieURbM9fIWhESXdHsJLNBoKruEjfslkkquYrKR7e2tgRZLzPwcwHoZcnsLMkPc8L4L8Ctwiuf6QLiWwKjfkMNX7UjZXjIByQ3i8F2gAYa2tnbwf6z75YQJrXo6n8Gfhqgez7TIYkCoHpON2TqbSodvu5E8cALFOvIquoJGWkKQh0oD1WNGghO7M5iWW+b5KFG/E70zQOVSvy4rCqqeaMa8Yg2Ee6fZrVy7XUOmWG+H+uXu9lbmEWGIbTttg8hYhlaHXgkSDAJiMWkA6gb3ze/KxGHRd/7DiQFKkS2U76e7gvVInFJuE2YXbrrdVkhv68Wf9QIww0vb5U3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYOqKRa8Y2Ah0yGkoygM9g0zDAixVqjdqXb5B/Wisqc=;
 b=LF6pDMLeGi6bcKrnnzykeU3+GR1lY0UKa6I09z9UjqHJYkjHJMBPqKRK8Y1mBBfvrwCF2wKMztBIHBSfwZWdC7At6uuWFwCcFGoIzrmSozvZASb/bKYB5mUzbcqAfQcUp2wUQw72noold0K2NnbP3hwZ7M1WRpls4UgwEf9ilo43w1GKPmRs+Qalr5itnhmMaqpD4xeCjY9xWaNYV02WyWwQ0BMCdnn9bZR4Gem08a+3p6/3hIU/rvJJtK6tSxBW7ZzXb9T5TqVuSzkszsu05VzEyspU4FBVe7zaHodkEj7adalZ649zoO7V9/oy2yBhKsJfcZP93YfRo+AeCbLMLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYOqKRa8Y2Ah0yGkoygM9g0zDAixVqjdqXb5B/Wisqc=;
 b=NF40iPe9zrjtatIocCdWghiVS4MZJ2KX+nNlAg+MTdY6g24KzDjdqPwxfEIzM2yA2ZvlcrM3AEHcS3NokEnd6GFIZuQpaDhamZiZmiyJeLQ01Tq/GnjGMokmz48as/3uEH4o/4Z3HhI+ilRbd8H0vOcqpWmKKgUxSVA9o/aoKDE=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by BY5PR10MB4178.namprd10.prod.outlook.com (2603:10b6:a03:210::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Fri, 7 Apr
 2023 15:44:46 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::7361:8416:8d4c:7733]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::7361:8416:8d4c:7733%9]) with mapi id 15.20.6254.035; Fri, 7 Apr 2023
 15:44:46 +0000
Message-ID: <bafc456e-34be-f2a4-71fc-e52ed964484e@oracle.com>
Date: Fri, 7 Apr 2023 11:44:43 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Content-Language: en-US
From: Steven Sistare <steven.sistare@oracle.com>
Subject: clean after distclean gobbles source files
Organization: Oracle Corporation
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR07CA0040.namprd07.prod.outlook.com
 (2603:10b6:5:74::17) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|BY5PR10MB4178:EE_
X-MS-Office365-Filtering-Correlation-Id: cf694814-5dd2-4ccf-3ce0-08db377f03b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IFfj4sNacEDVRlqPYKgJHvZ1kOhaDrHVY2u3+lew7PkNYkfe/agb+4MhV6bgo4QZZvJe2JTd41eS9zn9bc7ZGN/ByTn4ScMqbmQGemTrtyiwOkdqDliuSufoogLZV+w+vzQTs4kLcYGf68K1tLF3UNLwR8sypzPNI5PhcVLg9io02YXnqZwFCOHc33KS63DxtYEk+cAL7uSCX+GyCeEhMBTWDSOqWKmuJQ4W13s8LRn0PEGbBXxd+v0fFoOP0qNKjKk4xOKBXJVrOw0/ySnY1I0WpHXOVGDOdakLKcifM1+sedFSlQxI0doSOyf3uruuE80A9bPvUU6403AerC0lZyaCCGwctHXCUB1QFqpRGZrAn9k7tmfMui1tCgEVrqrnA9AvNCOyQ1+Uo8+y80o/t1VrqHkc7M0v5kQhdPPhRkWVFB9vdcpkpG0bHIz97LDw28PH6D+z+yH6iCFfCHl+Zgy7PJCIZfJueyOt4d+yt2+4T1UpSXNZCzKVfraySENkk1dyl7JytqFjYMPN7UOhJj/qqUyyge2O85zJYS2/eP5l7+WnS+aFhGtnHKy4BYE48zNxKTsn78bwGnh7PId/tj0a/Q0bm8RlwMGkEuCvLeCpUXts3M+REZMjG9K4zuJ13Fkv4AWVsuXXl8A+1yyKSuzM2VNEx16b3Lz5lQxLIrC4MM5dYCzF+wGPTWpvqWFqeJMtI4WoMBX0aJVWCw5bfQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199021)(5660300002)(110136005)(31686004)(316002)(41300700001)(8936002)(66946007)(19627235002)(66556008)(186003)(2906002)(4744005)(478600001)(8676002)(44832011)(66476007)(6506007)(6666004)(6486002)(26005)(6512007)(36916002)(36756003)(2616005)(31696002)(86362001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bEtSNG5qT2hxNk9mb1dTQlFydnJMN2JqYmEzVi9FZndIa2RzSHBKbWNDbHdU?=
 =?utf-8?B?ZFBJbSs5aklBZDZSdEtvcWhWZFF5b3R3c3JLS3dleHVjVlFoNlpNei9LYTNt?=
 =?utf-8?B?TFRicTZYdW9oWm1TRGh2RzByV3Y4RGhYejRMUFE0TmpqYWNqVFNHeGFFOEow?=
 =?utf-8?B?N3FXNkcyUS8vS3I1bUI0aUZIdzR4YjZCVy9WaGdLWHd0NTRUM2RSQzFKd3lV?=
 =?utf-8?B?QWdOZERsb293RDFQODJNbUNZUElHcVBpRGpYSmU2alZaaGtZVXhXejZBaXNK?=
 =?utf-8?B?SVdoem1SMTViRkJCa2txNmpKbXYvVDVHY0xqbDJCK1RZRHJoMXpFSHI0azdP?=
 =?utf-8?B?dzhvdEdxcnk4bkxnaGd3V1o4Qi9DVno2NTlHNG9LVWZObzJ5V3I5ZUdkdi9C?=
 =?utf-8?B?ODVDaEYrTEh5Zk9FUDdsQzZsUGVTeS9MbElmbjF1ZVA0KzVZaTA3dW9jdm5r?=
 =?utf-8?B?OUkzdiswYk5kekV0TDQyNWpvL0NVZ0dKMFlNVVRqbGpLWlhzWjNvNktuVnVG?=
 =?utf-8?B?cU0xaFN4Q1lQL3ZYMG9CMTA2ZWlUbVZrUy9WdDhSb0s0N3dVaG5qTEtKSTAw?=
 =?utf-8?B?RTgyOXg2Z2dmTUtCeERJZUt4R2s0eGVsT08xYjBQbVFhZ0pSVG50MEova2hX?=
 =?utf-8?B?b2hxUmRUQXdVSy90SWNEeklabmVZQXN4K1VVUlVQZmxiVWNSUlBxWS9DNnpJ?=
 =?utf-8?B?Y0dReG16akM1ekJtVHpWN3lFVVpZZnp1NGNzNElzTDNmalBGSXc0cFE3UlVJ?=
 =?utf-8?B?aXQ0ckthaEVuZmorTnllTm1GL2o1Y3ZJRVZjTkFZczZlNDlZaWE2UktYVUZD?=
 =?utf-8?B?MHFpSS8vYjJuTGJMMlI5NnNwN1hEMlo3SjZKSVE3YXJHcFJCTGV4TXVrTDBH?=
 =?utf-8?B?ZDVQZXl1dW85Q01iN0hMWTZ3NzhZQXQwNnIvblhFQmJBL3ljWUUzTUJ3Umlt?=
 =?utf-8?B?Ympmb1o5WnJQTm1IUWpML0pRcm03Z0pVV2d2cjhNeDdsblhOTVFKWm81dWJX?=
 =?utf-8?B?UVVFRXBXcCttU2JHMG83dW1tOTI3ZFlmZGt0emNEOEtlY3lqVDlSOWMxZXhr?=
 =?utf-8?B?VTNvWGZ6Slhmb0dEOS9RK0FWR3dXYWJhd2tPbzJoNzRpdWQxajRraHljNytI?=
 =?utf-8?B?OHZKT1JpaXhXMUUrR3NNYWpPVlF5VThYZDcvQ3NPMVZqTTl1TWZLNWo0Z2d5?=
 =?utf-8?B?MTRhRXhKYkFEdnBrMEFNaEg1ZGJ5ZHFHOTREWkVlbWRwc04rbzN0QW9YVEZN?=
 =?utf-8?B?QWppUC9VK05Wbk1SU3EraWpzS3l6RkwwVDM3ZGdndm5ZN0JiU1ZoSGVKRXo2?=
 =?utf-8?B?LzBqUnBhdHV5QjQ2VEdIL21yTGN5UHZGamgyUW41dVZjZ0swZVBqdDVOb3cx?=
 =?utf-8?B?UDBoN2lQdmovTnB0bThaTlFDUE5ERXlWcHNJcHQ1cUtiVmNGTU1BRXJDSWJW?=
 =?utf-8?B?WkpFbVp1cVZMajl2MTFEUlpXWlJBUnVLVDVPbFRselFDZXhGRlREd0RZRTJC?=
 =?utf-8?B?OE0zRHlwNUdobGJsM25lSTFRSVFYMVJxM2VZQnFrS3ZzVFAwdnlTcnowMlNl?=
 =?utf-8?B?TEQwT042NjF6ZC81MDJ0Vk9TWDFxaFFidnNoSElmNHdTNHBtbWlObW9XZHRX?=
 =?utf-8?B?L0QzZlNQVm9jOXlGU0NJVGNoSkJJcVBCNWFjTng3dWpod2pieWYrQW9JSjQx?=
 =?utf-8?B?SHorSGxNVG45QnZHNnBPN21pZFFEbjN0dlFBaUsvWlZHYm1WQit1NlhiZW9D?=
 =?utf-8?B?VGwzc2JVb3A2OUdvZ1U3N0RBaittOWxKRHRLaU9OWmpYSmpCMUpJQjZpZ0tK?=
 =?utf-8?B?MmNYaVZQWmtHbUUyTjN2S0Fua004K25GQmJvTEtuT1YrTFZnWjJjYW44SThm?=
 =?utf-8?B?Yk4rYk5EcXlmTXJ6Q0g3TnhjaUp3azl4cFlCb3RoZWFiL0pjRERHcXNjOEM4?=
 =?utf-8?B?L3JkaFNsSnRHUzVHQUJ5M0Nxb000c1plS3RBdzB1ekRTZS8vYWtkM0ZESXpl?=
 =?utf-8?B?eHF5MHdZUmtWRWxSc0J5NStMejBjZVRjMDY4L3pDbWFpcjZFQjdla0NLa2M5?=
 =?utf-8?B?ZHdZeFJlajZuSkNsZUwxd0hsMy9lNXBGMXRBaTErQ1c4ZzZPZjVRNTZiZ2VT?=
 =?utf-8?B?L1NXNy9yU1FDM2tlTDF1MjNGdDc5bTJtamx1QWtjaXAwSHJTT280MVlMWXo3?=
 =?utf-8?B?a3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: I64n/AmLFVt3dUprf0GqrLWeacOECAMNJ394KeDhFptHACIJ0vFBwDYTn7vJMsAb5Pf/pQAmw53SoVjf5LI1q3+lBFx56nTyHS819/kMT9DKdYxQGuk394UOHhXNLH6/ADIR0boZKUJAA/8grxjhaZ/8lCMJIOrar85h8DOLeHBawU+g/a/YXK03Vyzw8tsWUyTB+xh8Q/iqXaTy52UG41OtML4dcMK2oxbyxmE6wQW8itAaXxs/jtaWNvSJmV3uroDtZ2z8tOL2wSUbLRlZv+0Fa0uSKX42SW+NcrUz0aonvYun/kTWlmSC2NlwQtjHZDERqIZoyUFlkqxp54fhwefE+1pMNtoqi3Z2tvemvDFiOuAnBRktafZ7S9+ChoTxdrJDNK6z14XEwTEKREgREdrGPxN+HpCh7CuLgeBTAcO0KeyTv6JjtiCJ66dSvdU07RksDX0Z/ECWVY6W2SkMb2ZwuFcT2rWTGwnQ5rkL0CmlcANMws/QW3AAsq2s0EdjO8XGboMQdpf2Bt1L9nTB95emshtzzTlKrO1brUlmEtjQ6jZYGvlkWa4vrVnDO+vyAP8gCWjtcsdTB26N3kJ28inj+YehDXzbxTd7lG2yw1pCeLKuF5PJ0/pzUlAO2SwdEOpV1G1A8j43oQ/GrSJvwx2DO5rUmZTjBUcEmjPfevP9VW7T7AMjsE5wFetbkdkb+GkrnNGUjxrlZEnIZRjryWydC+Gne90yYr5aJwf4yPC3cgCR7H1N8k0IdntqGmLZadiHm3ggvoPr5IK7Pn/tVe3+6Wec4lmquNe+k34fQdjh+vgZSaWtbacqE71tAu+T
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf694814-5dd2-4ccf-3ce0-08db377f03b1
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 15:44:46.7185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QkM+GSWor6znI8NJBScsQPd03FnKSyjBkmMIa9sqi4Ioakpjmf4RCSxOxGadq6m4WTGPSrL9gMJKUQjo5mnuxO/GBxdokfaBRHM2/PgXv4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4178
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_10,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxscore=0 malwarescore=0
 mlxlogscore=938 adultscore=0 phishscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304070144
X-Proofpoint-GUID: aF1iF5ZKuZ33eXj86CzTmGaO4qlVuKIp
X-Proofpoint-ORIG-GUID: aF1iF5ZKuZ33eXj86CzTmGaO4qlVuKIp
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Run 'make distclean', and GNUmakefile is removed.
But, GNUmakefile is where we cd to build/.
Run 'make distclean' or 'make clean' again, and Makefile applies
the clean actions, such as this one, at the top level of the tree:

    find . \( -name '*.so' -o -name '*.dll' -o \
          -name '*.[oda]' -o -name '*.gcno' \) -type f \
        ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-aarch64.a \
        ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-arm.a \
        -exec rm {} +

For example, it removes the .d source files in 'meson/test cases/d/*/*.d'.
The damage could be worse in the future if more suffixes are cleaned.

I don't have a suggested fix.  Recursion and the GNUmakefile bootstrap
make it non-trivial.

- Steve

