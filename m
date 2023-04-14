Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0C66E270F
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 17:32:00 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pnLNl-0001X8-J4; Fri, 14 Apr 2023 11:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pnLNi-0001Wf-DS
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:30:34 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pnLNf-00086g-Ej
 for qemu-devel@nongnu.org; Fri, 14 Apr 2023 11:30:34 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33EEmv6N032177; Fri, 14 Apr 2023 15:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=Cvcvu6gCNsT1gYkxdMZ0W1qWXt3rrxgYqmorgOw/d8c=;
 b=DwOpE50tRnpJPA2EKsUgwyv/7/CNhY5NTq5IWQ/KIgf8ddjfbJLWG+/vKjjYXizduJ7F
 7BFYjtp07S2DzOz7qdCq8/cAObcbOVBg4sutJNAy+Jh36iNqNbdKY1Z5USq3nZduWrFW
 VMti8F4ZAmvYT86XAEY8W6EwaEwAeVbYq64ROZ8sOMhbHVvYQD5pblDWDB79pjO0f+DG
 bUaLDw/b7fAnpqHC2pMVjE6Pt+tc3S97OKYVBM3QfHX76vgJTrrq/Z3kG78lctpmwZ9n
 /9VDaZwVeXhQ7jlILJrlcyL3/r6bvGoBzxeEWAyqUORMTEHWvjHcWFhuCaDwhIwXq3Mt 5Q== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pu0b369fm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Apr 2023 15:30:25 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19)
 with ESMTP id 33EEPCQr040365; Fri, 14 Apr 2023 15:30:24 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3puw8c1fgf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Apr 2023 15:30:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAeTEyxihn3LYxgLapgVX9XwdZhQ3+v172aaU+DH584aGE7+j9ZgnfcmZDzowYfXb6gtGuV9vO+gvoKXEIi4vQwYcZ0utf1VbWhKxc1BBY3FVLTHdM0xwwPh2JSdVCrbSdRe0XZCv/dhsJAAfFtnzHa9SJVE3jvmt/TD0KmqFoW9u6ahC7jOpFstP7eqcMg71zTVS3MvDS9Nl8w1fpBf1raMDjMRI303kNTQmqdFlBTHGnFjyE3uvg1KKWy1XzUBQ8SywZD7SgMa6hSt9W7NGMkX0bKuMFaUM+wf3UXhXLG+8CMQgXzgbyiL4iBkrZ6cp9hXdM+v5s0tWMoR8J9Izw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cvcvu6gCNsT1gYkxdMZ0W1qWXt3rrxgYqmorgOw/d8c=;
 b=l1PMThw7bl4h6A7ixC6BR2iCXxyNG98z8eV+0Fi7Yi5uaRvgaYZumEjwTRemVL0qQwAn5qqnVDjgaT9Iyf863z1vK2L5xktOGX2AWCWvLx0JrzJw/QRNq/28VUa/0JzKdb7PpQol9y9ptK+/bRkq72kj6UL63DiBkzkLqTQZAk4vBQJl/XUPcbxoyrKJdzZzhs3u74AXHVdlFmPeNIz+WbPHGYMN8G7mZllhUhTdaC69JpPd6HO6YJhZvJkuH6NhGTwV8Gs4mpHE2ecKtYLJX3YgzXVcOMAckm/wecVaXElo5yz7xNSBVSq60pCjZ3NNjaqqNvtRi/44HcHruCeKAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cvcvu6gCNsT1gYkxdMZ0W1qWXt3rrxgYqmorgOw/d8c=;
 b=uP+CoAcycToWdC+rgwfZK77vkEyHi2oJb+Rcvp1ngvD5G4dQ59wqLxA5d0P8MHpejH3McTZJpRenPcoDma+6v57vSgXCJH8Tkg3mq/sbu+NqAwvZn23bAqiCmHYLTnu9p28JB3hrY7QfCvdvC66q5ptnP2MhBvrBUYmN0YTJfiI=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by BY5PR10MB4275.namprd10.prod.outlook.com (2603:10b6:a03:210::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 15:30:22 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::7361:8416:8d4c:7733]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::7361:8416:8d4c:7733%9]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 15:30:22 +0000
Message-ID: <bb433891-8f08-626e-21f1-e002f7a842e2@oracle.com>
Date: Fri, 14 Apr 2023 11:30:15 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: clean after distclean gobbles source files
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <bafc456e-34be-f2a4-71fc-e52ed964484e@oracle.com>
 <5caa18b7-9920-7867-77aa-5d9770cbde14@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <5caa18b7-9920-7867-77aa-5d9770cbde14@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0054.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::23) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|BY5PR10MB4275:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c1afc0a-3c14-46cc-2b34-08db3cfd295c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yp2pi6yLFclQzV551WGWBPrp2+XP1b8Z+tcGgqqk3mhRWDsYLd3YI3UQNMJNbaf7wMgNg2yueUvzKiz6085QiH/NCUKfZ+OpQ29T97e561P5XmOzjMjcUory/BGOfglfR1bUJen4jg20iiW7xEiK8v4HIeZW2UW78qvaCyq7eoglarS161Q4sz1tRhrJs+S2NeY/SqgmRZ9TTXvY/uw0LO5z2edd780leIRotuNV1+el+TmezPKheDzsylSQaXDwHPpu817TFnBXfL0ADnijAuByzFXWgMyXOnMdwFYVQRnCGNb/QH/BrNIPoKh/TFB2OOIcln2XUbpUTwAK5SRKW8OdOJY01w6+i2MBbxoYm1qbt6HjX7MpnsZbk7jKoVI+/0d7Wm7CjLBp352zILVJo6QAXNdddMSNjVOfiat8uVkp7Cr3QlHRzK27kAAMSzsvXsNoweWKoFCdn9eADYUNGIpK6sor69a/8dpUALIjdEAX6rUKs4DxbeP8GmslfelOJxRBiX+DKqoGM8kXxtvRf894Yjrj/GZjFOavig4yM8Vw4UItbIlbbM4Xz6yER8wD1MROPw2KRkURPfPbsHe5zcqVhHpgxzPjBQjYzRVp+aupPMtAzVPSAMjBF7oxlMi87QE4FF/QP1XePw5HinAEXQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199021)(6666004)(36916002)(6486002)(5660300002)(66556008)(66476007)(66946007)(36756003)(19627235002)(2906002)(44832011)(86362001)(38100700002)(41300700001)(8676002)(8936002)(316002)(31696002)(478600001)(53546011)(110136005)(6512007)(6506007)(26005)(31686004)(2616005)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2czcWw4NjdlbXBUcjVTUDlOL3EvMVNZa0ozaUxQUWpMbW10ck4zbmN5S1E4?=
 =?utf-8?B?RTJGbjFwYXlIRU1zYnQwVk13SGNVOTBlQ3hUdlo5eUNGelJvNkdQNmRWclVJ?=
 =?utf-8?B?ODkySDZ4ZTJUZzNjTEhxb1p5WmlNSUZ5N3FQMk5iSjM5KzQzS0l5Nk82ZWJE?=
 =?utf-8?B?TTJqY1NPYTlBc045eElISUNDb20yZEozMXNpaWZBckY1QlMzTHoyb2JPOWFj?=
 =?utf-8?B?QjJjam5uV2IvSFQ1K2JsRFo3aHBiY09PcFdFU1lmU3R2MVNHcTV3V1VqRDNW?=
 =?utf-8?B?S3VKMk9BVUNBWFNNZXJjMERmeVhJWHBuUDl6cm16MDBoam5KK00xTUZ5V3Js?=
 =?utf-8?B?bk9ZTGJjZFB1NGVLb1BGaVczT1F6RnhxYlF2SXI4dXJTQVFpOGNPZEpDV09r?=
 =?utf-8?B?YnV0bWdVdFE2U3dlUWhwM0lZWTJqRHpYU09sTjJkYnJpbTE3eTRFak1yZDh3?=
 =?utf-8?B?cDBKeGZqMzFzZGFRL2pvS1FmZlZMQ2JCZWRUTnl4eDUreWlITmlNRHR1c29I?=
 =?utf-8?B?V3FrSlNaRm1Zano3Qk9pNld3OFdjQkRlVy9zc0ZmSi96bExrMjd1bkQyMDBw?=
 =?utf-8?B?TTZvZzF0V1lldDlxR29KdlVsYVRqUUp3d2VKc2V1aGc4VEMvZU9SUitlWXRK?=
 =?utf-8?B?Y2E1WGFCVnRUSC9HbU00cmJpUk81N2wrR0t0SjBKblN3djYzMG5yRWUwS01r?=
 =?utf-8?B?LzBVay9jREgxeDFCM1lnbjlWbkY2aitZcWpvSVJqWEVxbktpRzY5Um5oYXVW?=
 =?utf-8?B?bVBFS0wxL3Yya1NMN1N6TXdWTm1Od1p0cEhzSkdQZUt1eENmZUI2MjFQWHk4?=
 =?utf-8?B?WHJzRUJEUFVwQldZTktwa3BZL3plcC9vYzhETVpwODlpZlhLMWlwbXFWR0NF?=
 =?utf-8?B?eERZdWsya2ZCTy9PTlFJRVJWRW9FZ0g5Ukl5VktnOTUwR05sdHFBZG9VcWVp?=
 =?utf-8?B?cmh6U0ZTN1NiYXNITjNrRGtZZEFsMmtyc0JzSWxBayszZnVpQVpsaXlKbjRP?=
 =?utf-8?B?UHJmd2FQUzFBS2pucmt3UkFEdGNvYXQ4MkxvMlN2TGU2QUJlbmcydWVJMHB2?=
 =?utf-8?B?YmRvN2NwS1Eza3A3bmF3SDJRWTNyOEZyUXV2MkxYTlh2SFd1N2tScnhJdVFY?=
 =?utf-8?B?a2ZqSlVBd3dtZ1pxQzRkejlmbFgwK1l3cVJsNDR4dUpEUnBKelFXbUJpblN4?=
 =?utf-8?B?c3BwdndJM0VoZTVkd1NmcmQwMVN5a3NPeEN1aG1pT0oyUFI2QnhobFhoRFdQ?=
 =?utf-8?B?K283U1ZFUnZRcTM2cENab3ZmVFFtVWtMaEVrR1FpZk5sL1BVT2NMbmdMMzVD?=
 =?utf-8?B?R1dDdHo5anlFcklWNy9sclNEK0dZL1BVaDNQUU56Wno4aitZQlc4ejVGUTdS?=
 =?utf-8?B?T3JSRzlTSi9IazlYNlhNMWdmY1IrWlN3ZW1IbmREVE0rZ3oyWnNjSFU4QWsr?=
 =?utf-8?B?Rmp5eHB5bzdoallFWmkxTTMrTWxlaDF5M04zVzB5aG9Cdkx5VWRUY014UFJK?=
 =?utf-8?B?VEkrdWVBZDdMeHRrQXNkQ2J4bTdQRU94RDlhY2xncnVvY0FBSGtGSG1FbC9p?=
 =?utf-8?B?dHljSWFsUENWRmpRbkFxZUdXRXFYVzI3UVBSbVZvbVJoT0czbVZFSW5aenJv?=
 =?utf-8?B?Nll2NzQ2RFpKcUl1S3JMR2xyVk9QSWp1UHRna0V6c2pXa25iNjdGdW5pcHJl?=
 =?utf-8?B?WVJySXlZWklNTStrUmhzOVQ2YTJKYnN5VXZpemVTUk50MFB5MjhoM0FNYUU3?=
 =?utf-8?B?TE15ZUNnUGllRkNtZzJhd2VnYVlNOEZMdERLRm5BMmprNXFHblJIZk1zTmJU?=
 =?utf-8?B?d1N1U0xmSXd4NEF2bWtlKzlrdUVFREs1Uzg1WjVSNUxNZnJPaC9lOElYS2R6?=
 =?utf-8?B?ZzJyaGlUY0UyNjJmTlZ0UWMxSTdaWVQyUWgwNHAvT2tRRFd5bWxiT2VjMXpD?=
 =?utf-8?B?SUZIWmh6VDJiTDRnYVZFQUxSYkI4TmRnaHRnYnAycTdKSU1BMFF1K2JxWld4?=
 =?utf-8?B?RHlPeWpEWHdGU2EyME9SdTlhRk9yV0JwYTRuNFpGUHlTWUxJdmlRdmNTVFQ5?=
 =?utf-8?B?WEI1Mk0rUzBEWjZmYlo2NGpmZ2xnV1ZjS21rWGNGUzhVYjNTTEd4QTFYc0pl?=
 =?utf-8?B?dWFoVlpLRHpLelRuTnAwT2JLMFJTcjhyTGNXZU85ZkdOVUtoNXNabVVFVDQw?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 2xcMR4IQ/Bgdti5v6L29ILqw6reAk244sxlv4L+6np4HTs0GC2QMHvwTYE85hkeJ0botEFrgSm8UlkLMzXkQzt9eWBlUrjPS1l8AGEq8Uhbwq4lDVJ8YVDx14Nc3MJ9MYQinN96j0hr55jmjeOzsp+ROjGNy7mRB+qFtLW9fr7vN1zoUg7Npj5z7Jpz9R1NdT1yIgLsPggq9WZhOvzC+RuLu8MGDnzmVycGmH1fgTunzcdM5wSIE3M3a3Fa3gmkd/+lqfR1yayd6nmenTuhLiKUc8bJ/GlZ4gB0Z7VEqDJk7xgO99lXzDStXbnM8oZ7Dt9vJMKe49vLU6Nk9QAOPTcaZkT7LtqS5OQBN+0LxNQ6y92Ea/rAKnd67pe+puGo/faQ0P6pppF8lQtpagdxy7WFAHyFDI7yq6qB1mxxadPwuI8Bwv4AsAsaf9kkl2BgooRNmb2dJ7ByVeiivudqyIWeSahfZZRYybWqoTBDS9tgf1FAWyanmnkv21EHtzehVRm3dnXZeQRqDX2IvvUbOZV19symhgLJ/W+ljZjx092ECmnXbzDFnHijhbCti/8pHpByY9la1l1eGOfgATFPJSQLnqZmQVx2h+DFUQdRcrsDr+mANAtkTs2rkSRvVHMPP8PuMW0mqq8Q8sekZPOL8ySYk+oFR7Lon3w8XExBTLll0jy+XR5P4hXIhbJG/KCmnlSojmrzTC4yws4hnZNr8EUwSU5UvhsL2TG2VPfJqpTcD76EXWzxjaYjh9+D99vtWWkZ/uSbeKu7lVIYL6ovwIKdcgSjZXVuvEbqrR9mVl+/Sw2BLBt0itGieZ/ZHd71O
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1afc0a-3c14-46cc-2b34-08db3cfd295c
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 15:30:22.3652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6+t48XBgLnD3tUo2vBPIuYUkFCFWKPzKxro63CIUV8vj2OpAQaT0T3+RafbPq4WEkwk2uIQL8vzra17ozVBP1PUn0XmHd/pvIq6yFWv/Gfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4275
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_08,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 mlxscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304140136
X-Proofpoint-GUID: 1VbXRzdgz3maOpgqFc8-BTHwKSCRuTux
X-Proofpoint-ORIG-GUID: 1VbXRzdgz3maOpgqFc8-BTHwKSCRuTux
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.282,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 4/13/2023 7:41 AM, Thomas Huth wrote:
> On 07/04/2023 17.44, Steven Sistare wrote:
>> Run 'make distclean', and GNUmakefile is removed.
>> But, GNUmakefile is where we cd to build/.
>> Run 'make distclean' or 'make clean' again, and Makefile applies
>> the clean actions, such as this one, at the top level of the tree:
>>
>>      find . \( -name '*.so' -o -name '*.dll' -o \
>>            -name '*.[oda]' -o -name '*.gcno' \) -type f \
>>          ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-aarch64.a \
>>          ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-arm.a \
>>          -exec rm {} +
>>
>> For example, it removes the .d source files in 'meson/test cases/d/*/*.d'.
>> The damage could be worse in the future if more suffixes are cleaned.
>>
>> I don't have a suggested fix.  Recursion and the GNUmakefile bootstrap
>> make it non-trivial.
> 
> That's somewhat ugly, indeed.
> 
> We could maybe disallow make [dist]clean if running in-tree? Something like that:
> 
> diff a/Makefile b/Makefile
> --- a/Makefile
> +++ b/Makefile
> @@ -26,7 +26,7 @@ quiet-command-run = $(if $(V),,$(if $2,printf "  %-7s %s\n" $2 $3 && ))$1
>  quiet-@ = $(if $(V),,@)
>  quiet-command = $(quiet-@)$(call quiet-command-run,$1,$2,$3)
>  
> -UNCHECKED_GOALS := %clean TAGS cscope ctags dist \
> +UNCHECKED_GOALS := TAGS cscope ctags dist \
>      help check-help print-% \
>      docker docker-% vm-help vm-test vm-build-%
>  
> @@ -201,7 +201,7 @@ recurse-distclean: $(addsuffix /distclean, $(ROMS))
>  
>  ######################################################################
>  
> -clean: recurse-clean
> +clean: config-host.mak recurse-clean
>         -$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) -t clean || :
>         -$(quiet-@)test -f build.ninja && $(NINJA) $(NINJAFLAGS) clean-ctlist || :
>         find . \( -name '*.so' -o -name '*.dll' -o \
> 
> 
> ... or if we still want to allow that, maybe just make an exception for the *.d files:
> 
> diff --git a/Makefile b/Makefile
> index e421f8a1f4..0cb2a7aa98 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -208,6 +208,7 @@ clean: recurse-clean
>                   -name '*.[oda]' -o -name '*.gcno' \) -type f \
>                 ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-aarch64.a \
>                 ! -path ./roms/edk2/ArmPkg/Library/GccLto/liblto-arm.a \
> +               ! -path './meson/test cases/d/*/*.d' \
>                 -exec rm {} +
>         rm -f TAGS cscope.* *~ */*~
>  
> 
> What do you think?

Actually, all make targets are broken if we do not cd to build first.

This should do the trick.  If you agree, I will submit a patch.

diff --git a/Makefile b/Makefile
index a48103c..3d03101 100644
--- a/Makefile
+++ b/Makefile
@@ -4,6 +4,10 @@ ifneq ($(words $(subst :, ,$(CURDIR))), 1)
   $(error main directory cannot contain spaces nor colons)
 endif

+ifneq ($(notdir $(CURDIR)),build)
+$(error To build in tree, run configure first.)
+endif
+
 # Always point to the root of the build tree (needs GNU make).
 BUILD_DIR=$(CURDIR)

- Steve

