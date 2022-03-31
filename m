Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BF34EE32F
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 23:17:39 +0200 (CEST)
Received: from localhost ([::1]:46240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na2Ak-0000rh-PK
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 17:17:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1na290-0007Q3-RX
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 17:15:51 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:36898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1na28x-0005SR-K5
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 17:15:49 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22VKelgb032372; 
 Thu, 31 Mar 2022 21:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=kksqY9a3aIbwuVojULt5UlTV8sYpqJMlldiBH20Di6k=;
 b=roHwj53AHrjmriXLN+CtO6/jeMV6qXjdPkR5nNLEqBNLdU/i1NeWcUsrKWIDl8rWvTZk
 kMQ2e2pJqwEEMCdPzoIROJUjC1aZ9UuuU6EEvDD6TmoVpGmj7srl0l0Sj1p0BCTIWEX4
 oVXNp2/OUK4oo9A+TVbh3RfIkguWBJBiDafF+uVLeSyk9tJaQTQu8akvlN4+PjAZDYmm
 +UTqKRRrNCfX1J6aYHkQKgMIWehNCfy3WNOECRiPUfGDcTG1+vARB7TvtJlvGqzsoZCA
 G1E1m0D+See+O236s+bR3c5HjKP9j9nTROC81OCtw8083OXOoC+0yoVeWjtJ29tZLNvO 5w== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1uctwryr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Mar 2022 21:15:38 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 22VKuZdr006693; Thu, 31 Mar 2022 21:15:37 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2044.outbound.protection.outlook.com [104.47.57.44])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f1s955buk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Mar 2022 21:15:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxzTmwT0fXJr4NMutUF6MFOTNLHMA8P/RaMLgcvWWYhyzU9KwLUmZdKISdh3V9wgW+4QOfYzIBPYtToC1Ybsir9Ol3V2/rbazm4lqORFA0EObgw3Pm0np77jjt1bdfClCMAPh7sc/XO6vEBoQFnp/TC3sjKjFHsJ3vpdri6/J3vSjZFMqWdnOZ3azDBdJ3Y/yPgyJHu421r5qNAK0j5rmCP0pFgCtudIpmp9fwPcrbVRyGIMQgu8H8LTayI05bctX0qK8raX0HYzpih4KuOGeomWvHpoIatm6KDhdWgASiArz4AZMNYqnC73boXeMUeYLzkI5ri18/RUelP5NQlOhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kksqY9a3aIbwuVojULt5UlTV8sYpqJMlldiBH20Di6k=;
 b=I+2+zpxwDxi+AmlvgeZK06TDlu08NxHhEEHkaumFXMUQvtPqc3KbUJYMx+8QJpOBhhoPUh8pL7S+aB5V8c49Lh4BIyqid7FHcb/UNMY+egRxiyZqzAo/KFKQweTeGsgMQAF/ny//9JZAyYZXP5kiAk6o113sBNOAIm8D2+AezeM+W0hg9hZI86hFZqaWXNhC8cht3BdnZHIB9yOKiaN94vMKbyONkGZZF/H3XV5TRZTzD5DUHDisb+RGrV3fPPJ381Y1gOmw+uJEZLK37nmL2XfZTutrdSbHsfu0aqbJ0iLE3HV3iot1frg7ZHmKKS6rm3l0NZh700cXgStWdnsbxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kksqY9a3aIbwuVojULt5UlTV8sYpqJMlldiBH20Di6k=;
 b=vRL9fxbyV076L0SAPxsz0Seiqid/QZ6wXKXMhZsaB+b9wCF1IkmRFvMx33rK5/1H0O3AFsFqDSKPuyZhPC1a0AuTzMWYSMRfhSKCdUhJBC0Y/mWXFjtmXuxlhkpA7QBsbf5DiYC5TnId9hFaxi3SYxWz4kdVdkEgpck0fXqd07Q=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CO6PR10MB5396.namprd10.prod.outlook.com (2603:10b6:303:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.19; Thu, 31 Mar
 2022 21:15:35 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::9d4f:2df4:8bd8:f468]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::9d4f:2df4:8bd8:f468%3]) with mapi id 15.20.5123.023; Thu, 31 Mar 2022
 21:15:35 +0000
Message-ID: <778d216b-dba6-0783-177c-cbb766c8f12a@oracle.com>
Date: Thu, 31 Mar 2022 14:15:30 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 7/7] vhost-vdpa: backend feature should set only once
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-8-git-send-email-si-wei.liu@oracle.com>
 <CAJaqyWdF55nKD05C54OOvM5-mmsCG7FMixKLguPGNR4Ostqnmw@mail.gmail.com>
 <f8ace3a3-8f86-841e-c056-271528d5ba9c@oracle.com>
 <CAJaqyWfb5=bEQGiGHamwqgBAvQf2FKEr8SwgVsa1LM2N-v48oQ@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJaqyWfb5=bEQGiGHamwqgBAvQf2FKEr8SwgVsa1LM2N-v48oQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR07CA0085.namprd07.prod.outlook.com
 (2603:10b6:5:337::18) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b5fa033b-e509-4032-2e78-08da135b9889
X-MS-TrafficTypeDiagnostic: CO6PR10MB5396:EE_
X-Microsoft-Antispam-PRVS: <CO6PR10MB5396188ADD6CE75AA90DC35BB1E19@CO6PR10MB5396.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qx+2TKEgnyP11Ph3oxwYhR9YnfmLUEZ3kZs/SZNivhyLIPYyaxLh8XElSKCsBhZvPw7FdbWVMb6yIcHNFRSAgOxKEluBaqjsqRnb0taRtItcRTGRmDvJw8bLPwpUe3WqrZkWjkETu5ajDe0zx9SMWz3OvkPlca+I3lP+tfWYNfaD8muL5HPpXUgNI5hfL5S0ERgcgYY/AST6BRojEvVoNLoQt2INaedzvYM9s7JJnuQMQh7+WEErPQTb/PHOpjjZulKK7wYMkc+hpahdiYmSkEGy0w5efXd3lU6RfF0IXGMdN1lMrzKf4gV1nntRdPRWjk4/hggZ5gxY6WVPOh4Hv84/pTpfqc+zC+hKQznRHX+Ii+t/3VeEbHlaAl4+pXK0YlTsqjcOUeBAkVwnqAajSdhldvObn0QPN4BFBQXqxseryKeYGvEjOxCvE+DhrxrJNK6YJvvTcvNqOkh5V2r49IrLLO9fWSPxrzVLp9mP4qc35jeb6oxlI62014QG0Pd0Myfdjkcr9XKAVYzg0WvObVYdGu6yh7r1mIeY8bCHvcq2OVi4dHL3WDYIaopT/Mj/0JWI3ROSz/f6BY1ZqgnWk8rJ/M6lTkf7BZs35sr9vpmYd/koi6wv7I9MtvKbI1nZ6CDSMjwT8KnnBMsScnh1b7FjaI85V9PJktx0hpW25SN1xBDSgNmjMUYSSIT/Uv4RUkbOqAr/xsjhUbj6ct5vu+/poBr/eN/SDv7ygkj7COQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(6512007)(54906003)(66476007)(66574015)(66556008)(6506007)(5660300002)(83380400001)(6666004)(316002)(26005)(36916002)(6916009)(53546011)(4326008)(8936002)(2616005)(186003)(66946007)(2906002)(6486002)(31696002)(508600001)(36756003)(38100700002)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVQ2MS9jNDJTYzRIQWNqajJ2cmxzQ3YwYlRtUUdMcE1TL1lzRHpZVFV3UGR2?=
 =?utf-8?B?TlZGbnBZYmRqWm81MWErTnBQclg1Y0w2M3JQMTRUYWtOS3ZJdCtmRi9ha1Uy?=
 =?utf-8?B?dkR1ekZuRVMySHllbVBla1ZTdzQrWktlNWVUVVg4MXplUjZqWTdVSWdYMUxz?=
 =?utf-8?B?RXVyRHA2bVVjcXVHUzBWbnNmL21VMUFzaHhGSXRPajhUNFdiZWxYemJwUHZ6?=
 =?utf-8?B?dW53N3B4VlovN2tuTnpERjRRd3VQZ3lldndsTm5CQmMxaFBzcFc3T1ZnZjlr?=
 =?utf-8?B?TUdqeWlHTFZEcXYyeFVaN09tekxTa0V0YzB6dm1YYjd4M3RwYWxIVjNZaE1P?=
 =?utf-8?B?anhMNzlOK21HQW9lWnFGSEVRT3o0aTVEbFprRzlCeHFiMXMxZDM3MXZQcWxG?=
 =?utf-8?B?SWRhMEFmRFEzRk9tL3E2cDd3ZStvZGJ1NEo3cHluVStCWTk2ZmN6dGlqR1ZU?=
 =?utf-8?B?S1c1RnJBTllaUXFPb2VXTmJ0WlU0Vld0TUY4cUFOZENjZUxRT2RoKzRLdFhR?=
 =?utf-8?B?WGFTT29HNGV1cmZEWGVDNEFvZlplVjJjQmNZWU1jem9UdnVnckpwTnBxZ0lV?=
 =?utf-8?B?eDFoNzR3MWtSWWwwQnljanpkVUswZWxRZ0JhNEUzVnQ5UDFqbVNoVjJwYWFi?=
 =?utf-8?B?MCtEY1hYckVQbkJrbHlTRWVUMk5lSVkvaW9rRVRhdTgySUcwVG5pVEhMLzBp?=
 =?utf-8?B?bThJUkI1bXpSVzBwSHhrZGREOTF0WVM0aHQ5bDFaRjE5U1pxR1lSdWNxeXNW?=
 =?utf-8?B?WURRSHA1Sk5ObDM1M0EwV1lzbUVFUHIxa2lNT3A0Wkt5dXAwYnNOOE1Ma0h4?=
 =?utf-8?B?eDFTOFYwZ0xQbkozbU1hZkNUY2Vtc0VRUzBrV1ZaaFBEaWY4aDc0dmwyTTNk?=
 =?utf-8?B?YXAxNmUwQmhKTCt6YXBpaVp6N0xtd1FjYUFGSXllYWNNa05MQ1pxVTRSTEhJ?=
 =?utf-8?B?anBRcnJVYkl0UUpHQ0hvTmg1K0owcjR0MVlTb3dvRXdJNGd5UDFpMVJBbDlT?=
 =?utf-8?B?ZzhoQlNCcEJtaEtwK0xXWjY4SzAzMC9XZnRPNDNPOFVpM1l3Z2RWdnc5T0JO?=
 =?utf-8?B?NkU1ODFncUVzQ1VjVHJTN0txS1FFbDJRU3hjZGtZNUtEUUx0KzNvT3B3UUhK?=
 =?utf-8?B?b1owQW40eWxsRlhYeTZEc282bnYxVkViSUV4ZEt2aEhEZXVHL2J5MlJ6Wmkw?=
 =?utf-8?B?SXRGMHkxK3VSVzJ2T3RTcDJvTmhmVkh0MUFSWllSREdidWFkM3FEM2MrWG1l?=
 =?utf-8?B?aStNSWpGOXpseXM5eE1SV3FXei9peHRDenRJYXFRYnZvQlVERWdPQVhFRXMz?=
 =?utf-8?B?ZFhqZ2FpcmZVRWNwZE5ZbTZJYlZFTDYvRFc4T2ZzNzZESTlZazZVcUdZSkRu?=
 =?utf-8?B?RzhhcjZUR0xMQ3lBNVZhRXd3MnQvNitQbXVlUCs2b3BZZzBkY2h5c3BOZ25Z?=
 =?utf-8?B?RFdUcTFMYXZoYW5Hc1VReE42cU5KL2JvWGhVSjIvRlo4YkNMTnkrQXNKVExu?=
 =?utf-8?B?Q0xXdlhYWmtVeThSSTA4Q0NndEF6VElYQlhxOWJvaUE1eS9MZkI4ZGhEV0NG?=
 =?utf-8?B?MmxKUmpKcDZDV3pNS1pKNGVWcHlUMG1PSDZ3aWErY2V5UXorbkR1ZjZNRVlv?=
 =?utf-8?B?MHdNaHEwWjZKUGt4UUR3by95NjJkN3crdU9nenJXTmZ0RldPTitYakRsYVJB?=
 =?utf-8?B?SzhkUG1TenZ0Z2kxeXQxWmxCci9mYm1SUjdRZDI5eXh1VDZsQlZzMlVIRGlQ?=
 =?utf-8?B?cHBUYjhZMmIzc3poNzlXMDB6WDY2RCtqZllMd1ZHMWFkeURSVTdhSTgzMjF4?=
 =?utf-8?B?cEdqb1ZnNHRRQThpMG0za1A2Qi9yMzluODl1a0picXlwcW10bThtdWo0ZlV6?=
 =?utf-8?B?QmlPOWNmaHhqbENQL1pyVWpOcFZ4TzZ5bFpXRkRwb1JkOSt0a0M1S00wTCtx?=
 =?utf-8?B?ZUNqRUx0USsvSExmaXNFLzAza1RmZThOeDBOTnhhYm9tNGFSRkM0eUZqUEZx?=
 =?utf-8?B?RHpvWXE0dmsvV2N2dzgra3BXdGlsU1hPZDFUaHNINTBuNGRud1lmNVUzNjk3?=
 =?utf-8?B?TEVXdTlsemp1ZFh4ZTl6a2svMDAyZmtRWlhUR2JDM2x0VDRCOWhqemhzdHFj?=
 =?utf-8?B?ejJnV1FyK3VzOTBiR2hrbHFDclU4L1NqSFliV0FiS1U5RWxTSDg2bkEwMnNr?=
 =?utf-8?B?MnBJb0VZNzRJR2gzbEJyUFk0dmJrcTAwWFh6L1o1YXVnVkFXalVSNWgzSnZ1?=
 =?utf-8?B?MmRvN1hPUmFkblN1U0tlV0pBNHRBMys4N3ZFeTRtdGZwbE9ENHVQQVlpK3FH?=
 =?utf-8?B?ZG9MNExzcnU1dXJRdkZzYld2VUZkcysvRC9yZ040clRhTmZiUWxMUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5fa033b-e509-4032-2e78-08da135b9889
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 21:15:34.9987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3T5hEvpa7JIseYdHyb5IPdgE9rkBDt4/I9bl3NA6TyhEU/lrs9QbMT0JZKFydMQVvcrNLgBbEWnUGVqk14Hrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5396
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-03-31_06:2022-03-30,
 2022-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 spamscore=0 mlxscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203310111
X-Proofpoint-ORIG-GUID: d8iQMCXIuP4yTrLUs2iAJqZmz_nJRi0I
X-Proofpoint-GUID: d8iQMCXIuP4yTrLUs2iAJqZmz_nJRi0I
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
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
Cc: Jason Wang <jasowang@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-level <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/31/2022 1:02 AM, Eugenio Perez Martin wrote:
> On Thu, Mar 31, 2022 at 1:03 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 3/30/2022 12:01 PM, Eugenio Perez Martin wrote:
>>> On Wed, Mar 30, 2022 at 8:33 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>> The vhost_vdpa_one_time_request() branch in
>>>> vhost_vdpa_set_backend_cap() incorrectly sends down
>>>> iotls on vhost_dev with non-zero index. This may
>>>> end up with multiple VHOST_SET_BACKEND_FEATURES
>>>> ioctl calls sent down on the vhost-vdpa fd that is
>>>> shared between all these vhost_dev's.
>>>>
>>> Not only that. This means that qemu thinks the device supports iotlb
>>> batching as long as the device does not have cvq. If vdpa does not
>>> support batching, it will return an error later with no possibility of
>>> doing it ok.
>> I think the implicit assumption here is that the caller should back off
>> to where it was if it comes to error i.e. once the first
>> vhost_dev_set_features call gets an error, vhost_dev_start() will fail
>> straight.
> Sorry, I don't follow you here, and maybe my message was not clear enough.
>
> What I meant is that your patch fixes another problem not stated in
> the message: it is not possible to initialize a net vdpa device that
> does not have cvq and does not support iotlb batches without it. Qemu
> will assume that the device supports batching, so the write of
> VHOST_IOTLB_BATCH_BEGIN will fail.
This is not what I see from the code? For e.g. 
vhost_vdpa_iotlb_batch_begin_once() has the following:

  140     if (v->dev->backend_cap & (0x1ULL << 
VHOST_BACKEND_F_IOTLB_BATCH) &&
  141         !v->iotlb_batch_begin_sent) {
  142         vhost_vdpa_listener_begin_batch(v);
  143     }

If backend_cap doesn't contain the VHOST_BACKEND_F_IOTLB_BATCH bit, QEMU 
shouldn't send down VHOST_IOTLB_BATCH_BEGIN...

Noted in vhost_vdpa_set_backend_cap(), VHOST_GET_BACKEND_FEATURES was 
supposed to get the backend capability from the kernel ahead of the 
VHOST_SET_BACKEND_FEATURES call. In which case of your concern, at least 
feature VHOST_BACKEND_F_IOTLB_MSG_V2 should be successfully returned and 
stored in the backend_cap, even if the VHOST_SET_BACKEND_FEATURES ioctl 
was missed in between. Hence the resulting backend_cap shouldn't have 
the VHOST_BACKEND_F_IOTLB_BATCH bit set. What am I missing here?


>   I didn't test what happens next but
> it probably cannot continue.
>
> In that regard, this commit needs to be marked as "Fixes: ...", either
> ("a5bd058 vhost-vdpa: batch updating IOTLB mappings") or maybe better
> ("4d191cf vhost-vdpa: classify one time request"). We have a
> regression if we introduce both, or the second one and the support of
> any other backend feature.
Sure, it's not that I am unwilling to add the "Fixes" tag, though I'd 
like to make sure if the worry is real upfront. Thanks for pointing it 
out anyway.

Thanks,
-Siwei

>
>> Noted that the VHOST_SET_BACKEND_FEATURES ioctl is not per-vq
>> and it doesn't even need to. There seems to me no possibility for it to
>> fail in a way as thought here. The capture is that IOTLB batching is at
>> least a vdpa device level backend feature, if not per-kernel. Same as
>> IOTLB_MSG_V2.
>>
> At this moment it is per-kernel, yes. With your patch there is no need
> to fail because of the lack of _F_IOTLB_BATCH, the code should handle
> this case ok.
>
> But if VHOST_GET_BACKEND_FEATURES returns no support for
> VHOST_BACKEND_F_IOTLB_MSG_V2, the qemu code will happily send v2
> messages anyway. This has nothing to do with the patch, I'm just
> noting it here.
>
> In that case, maybe it is better to return something like -ENOTSUP?
>
> Thanks!
>
>> -Siwei
>>
>>>    Some open questions:
>>>
>>> Should we make the vdpa driver return error as long as a feature is
>>> used but not set by qemu, or let it as undefined? I guess we have to
>>> keep the batching at least without checking so the kernel supports old
>>> versions of qemu.
>>>
>>> On the other hand, should we return an error if IOTLB_MSG_V2 is not
>>> supported here? We're basically assuming it in other functions.
>>>
>>>> To fix it, send down ioctl only once via the first
>>>> vhost_dev with index 0. Toggle the polarity of the
>>>> vhost_vdpa_one_time_request() test would do the trick.
>>>>
>>>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>>> Acked-by: Eugenio Pérez <eperezma@redhat.com>
>>>
>>>> ---
>>>>    hw/virtio/vhost-vdpa.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>> index c5ed7a3..27ea706 100644
>>>> --- a/hw/virtio/vhost-vdpa.c
>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>> @@ -665,7 +665,7 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
>>>>
>>>>        features &= f;
>>>>
>>>> -    if (vhost_vdpa_one_time_request(dev)) {
>>>> +    if (!vhost_vdpa_one_time_request(dev)) {
>>>>            r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
>>>>            if (r) {
>>>>                return -EFAULT;
>>>> --
>>>> 1.8.3.1
>>>>


