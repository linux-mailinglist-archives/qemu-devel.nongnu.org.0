Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7630C4ED0E8
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 02:33:54 +0200 (CEST)
Received: from localhost ([::1]:56372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZil7-00025l-IS
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 20:33:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZiTM-00047P-Jm
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 20:15:33 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:43192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZiTI-0007gq-EB
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 20:15:32 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UM4DZU027072; 
 Thu, 31 Mar 2022 00:15:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=JixIh82K0FmYqo1gyCr0dI0WPgZqfBxK+yrNo6Mwchs=;
 b=CwCZlnYAyX3LPEbL0b66IVWuGLuCvt1yq/Syg98tFSReB2GS51BxYjZO9pYslIYBcb21
 4Kp7+tBRxak302ZC+wGF1Qf0ca5YJgtlz4LGPilbPeK5eFTq78b/8uSNDqY0AIF41tvk
 X2nUhu/Ksbtqh2xky/TxzuWtNfavbFRajGHI0BtW04s1j9Cmb6s6iHfT/bguR5lOeEnv
 lEm4Kjl/jP63MsvB9AjvEXU+mnnwuM5L75Sams5r0Uag9m7izrBQ16/l3QcW4tfKIhrb
 tSRWe/yQK/UezIV5ADRhf+kJPs5JWSEd6qnXxYDq190ttln/9YOl8VeqoeyqZHpfVHHA LA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1s8ctnyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Mar 2022 00:15:13 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 22V0BIkO036049; Thu, 31 Mar 2022 00:15:12 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f1s946rww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Mar 2022 00:15:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W0xXsuPu3fs/Rp4oUsx/Vqj41kr0VE4Hg6N1crI2Ygtnx0TV+kk+VvClHMEhx+zL/hzDOiPcuqqx1WR75Cho/L1HSfHmNmalaOfjwSn7kd+nPWRlV8vMXZgH4fiDHvcMuKx+TnvOw0nTD5YbH2eqnpQCkIn+rrl7DZfae5s/OkShdkjS+gnBk5xyCboSFhJ0YoG5TwXa5Z6YePTTtDhGs46q00Z5IjUM3GxnQ4F7jIW5jIZfnX7PLh9O0SDVXX5W9mRdJo2PKEepFm1979f4nTRN1u8nU5oM168VGcc47h/06nCdTn0Rz+yGJ4xUzIIbpWrutHln5j4nJ4HDYMjnIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JixIh82K0FmYqo1gyCr0dI0WPgZqfBxK+yrNo6Mwchs=;
 b=Qj41X2LbOEatfeJsAGrqjfuPsod7uAvrrpw+AW/grbvc/76h4fhkEbpAybxqlFZeIsJHJgMo/r2wZqddXGU2zsPFxal/EuUHuXvX9ojv4wG8RpPWKLxlUIWm+pYXCpfOcA1m11rVw7fMl0IW4XL8+wAv0pKm47qQkrTtEvNZzswHNbe1aKe1a5dFq0JrqiF+zRdiVCWwi+DxPI3joRAtqdiwCM0szc193kFZDd+cKT8EdGHjV97hmJwSR6XR94P3guyzTPPQZub0fOZWjOgNh68tzbuU2MgDQQKT1XJhI3ppZgCAFTX14F0Bw1dhfSuiG/1PskKYOuofu2mmaJx7XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JixIh82K0FmYqo1gyCr0dI0WPgZqfBxK+yrNo6Mwchs=;
 b=eVRoNN+itQxQ8ZjP6klHgvuv+VvX2ytey/sl1F66XQeZUmcvAMPA5HMHXI36ZBl4X4ZN/K9DxSfASqAVsivt5Zd2bxVDLPtU+X8MrHW8/u9dH5yr3ExpoeTd3EU+st4fIpNP9GmY5h1xE1ooRV0vr6UwuMC/Y9wqFfq62Ud5iX0=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by BN6PR10MB1731.namprd10.prod.outlook.com (2603:10b6:405:b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Thu, 31 Mar
 2022 00:15:09 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5102.023; Thu, 31 Mar 2022
 00:15:09 +0000
Message-ID: <2796fe2b-969e-f545-b835-d4a46fade0f2@oracle.com>
Date: Wed, 30 Mar 2022 17:15:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] vdpa: reset the backend device in stage of stop last
 vhost device
Content-Language: en-US
To: 08005325@163.com, jasowang@redhat.com, mst@redhat.com
References: <1648024966-5170-1-git-send-email-08005325@163.com>
 <1648634561-12504-1-git-send-email-08005325@163.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <1648634561-12504-1-git-send-email-08005325@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0105.namprd12.prod.outlook.com
 (2603:10b6:802:21::40) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64cf24fd-f5b3-4046-5502-08da12ab845f
X-MS-TrafficTypeDiagnostic: BN6PR10MB1731:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB1731AE77B921045B375EE22AB1E19@BN6PR10MB1731.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7NToIev/pfpKzdNOArw9yoSzw7qltdi7JSTcDSWwUxlHIS4DwYQYKCbE3pDR1nD2LklNB6LKmHAwj3SFWMRCeCJx9i/NpB9jkDbFTMZjL2QeNl2o7MtkXcpgga937yXRE72VpN2VZuEY/wYBnqYkS/raJd94gl1hgoub8hmkr6S4VCAUHIb1fbHY33IHt29rfxqd6k4Er2heNR+ulWgGkcCtVysJRAEt4Lhi6gxLNJn81rRVG0J99jHkJm2Dgvgmg9JHnv7tjxyC67d1Se+M+DnFiwFD/MXejDtfDw5XDFqejVST8NfBf3axivAvpnZHBg+2ZiZsMVxKViEOOJc8WNXXrafghoXzeaX4Y6h7Gg2Zot1yNGPK0kxygeL18rbbhitH3KNfpDNYFnnSp+QtHqindiG+sLLErv/foUghuMujVaMw+d/NttRU1sUBPc8WJKvJNN6wEmXA6UtWlR1iJ2Uryn84qlTUJtX6Y/jLQ+jc2SH7qOCOcRNUupryhZVtFs+DWwOvPOYkmpd8lph7yZuU62ThbNqtfO8sQWvJBanZWq2U0TiP0LLdbnLQCYeTZsUcCQXNv5pAkypdT2OopiyFIY8EKu8Xuq6Xs9VRehs6ifRsRtCVPB6swUmJn4p+VQ5qjRAPKo+lQgLWF/dAPNojP0Q970Trquh8fJ+3IIYJH1C76H+n5NOOwz89R7cFMvSPJ5P7EMwwVxYjvH9VMdmctRbe3dWPjSPyveSyehssQK/u1zD4zEEM+STx+wB8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31686004)(66476007)(86362001)(2616005)(508600001)(4326008)(8676002)(316002)(83380400001)(66946007)(38100700002)(66556008)(31696002)(6486002)(5660300002)(6506007)(36756003)(8936002)(53546011)(2906002)(26005)(6666004)(36916002)(6512007)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWlrOXh6V0lRQjc2ZzhsZjE3b1d3a0ttNHR0eWhMdCs3Z1NIdWozMmNZdjNI?=
 =?utf-8?B?SEkwc0JUMWRyTURuaFBrZ3NGR1NGd1dsRGlacU8vWnVZT2c0ZkZlOHRubkti?=
 =?utf-8?B?eDQzWjZDN1pUK1JiOGw3MnU1b0NzanljcGxKbWc0OUJjMmFyZUU5MkRmaUZo?=
 =?utf-8?B?U3Y5cTlTVExCZS9JaDg3WDVpSG1lYVprbllkNm5HZmZPS2tSbVFnNE9kOXU3?=
 =?utf-8?B?bjlqQkFTSnZHbDI5NXByYlBBMG5aTG5lTy9oK2RFak9jSUgxR3dLT2Y3aVZa?=
 =?utf-8?B?VlFuN2xBZk0zVFlrL3Q5MTViNE80ME5ncW5GNGdMNkZvanVEdVVGK05RdmRZ?=
 =?utf-8?B?VHlNeVpVSTVyaGZ0NlAyS1g4UU1iSG9WeFhEQ241MmRJZ241MHRNZVFnMVNV?=
 =?utf-8?B?U0dCY0VTQThNSHlXTStBcjNMeVplaTl1Y0oraGYzZU5SRUpjRHBFWmFCL04x?=
 =?utf-8?B?SlhGTHcwVDZObjdpVHVKRkZsWmVJMy9hWHh5SC9taGZMaURFeG9MaGFBNEpT?=
 =?utf-8?B?VlhpN2Y3VFlWSDNVVkR5ZVdVSVoyQmg4M1g2WnRGOUM5V0s0VTI4NkM0c3pt?=
 =?utf-8?B?Q3hKUmUwNGNYdEg3a2IyOThGbG4yLzA3NFB3ZkJRdURLWnZ3M3FVR0VWbUMx?=
 =?utf-8?B?TEc4RGtwY3E4S21tSmFPdWh1dEJkVFEvU3RUbGM2a0NaV2ZCOGN1Zk8yOTBk?=
 =?utf-8?B?KzBOYUlVT3VJNkRiRW1MbG9QZnhmRVFFMTFvRFFqbkU1amgzZkZQQ3REaElP?=
 =?utf-8?B?WEpmRU1QbGxTMXBOL0FneXhyUlNDZUhlWFlHVDFjWVV3Q1ZuQUhPM3VDNCt5?=
 =?utf-8?B?Z2lyUFh0V2dpVm1FU2NhVGhNYXIrd0xQL2E4WDVqWTBQU1dzc0JJOXhtOWVW?=
 =?utf-8?B?eGlKUGNtTHZENFBlV3FtOWJ3WXIra3NsNW1DQ21Ld2l6OVdJYmVuZStqa3hI?=
 =?utf-8?B?ZUtkYmNIR2NHU2lSNEF4YXNpd1luQnRoMEtENGhlQmMxM3ZibVJOMk01VHhx?=
 =?utf-8?B?RjJkSUZtTXlMQ0xHREdWVkQ2UE05bFVhM1NCUXdPTk5TdE1sSFRhUk5ia1pK?=
 =?utf-8?B?TGtZc2YyNnEzczhNc0lzRzJFYnBBTnJ0c0hkbURvREVWeTFVVFo2UXpTSlJO?=
 =?utf-8?B?dG9EUXRPZFVBcVNucGxuZGlkTldxK1Q5Zm9nb1ZRYXV2VW9sdzh6ZFJIbVZO?=
 =?utf-8?B?RU9iNDNhMmJaNkY4Zk1TTGRHeHIvT3VSQjh4U2VCeXE0QjduL3BqeGxsL0Ew?=
 =?utf-8?B?bWduc1FlWFJCVEM5cHhuVkdSL0kvRmxna3M5RytxcUNaM3VSelEzMHBnMjdG?=
 =?utf-8?B?ME9TMVdtVm5CdjA2YlQ3L3pyZnFWZitWMmdaK1RZei8vWmtmRTFNaGoxd092?=
 =?utf-8?B?ZzdnSkMrU3ByalNGMytKUUd6OFkzWDBQYlVJV0tIQ1R6czl2T0wrdDIzMEt4?=
 =?utf-8?B?OFRPc3Y2WTJkc3RVRUtsMVRZU1lrYURvaVFwQUZEMlJJTzFWVFlBWmVMUkpy?=
 =?utf-8?B?RzNnVWJsbXBwdHoxUGJ2ZVQ0MGtpMG5HRXVMbEI1eWFwVG04VmltbmY3bVNl?=
 =?utf-8?B?VkRBRC9wYlpEeTY1dFp0S2RML2FnSEpXZDV5bU9sK2VHbm9OaUR3NGIwT3Ro?=
 =?utf-8?B?UDBPY2J2bGhleldYMXVLNnhlU2tlK0hvUFFGZ0V4ejNWbEhzaXF1M3d6cjhV?=
 =?utf-8?B?ajZMWDNmMlpVUWx4V0l2dllLdnVJaDJmTzBZeHdhWTBhRndNUTJGK2VrYzFj?=
 =?utf-8?B?QTVxdTR5VjN2L05veGxVdGZJTFBSQWVOQ1dUUTVmWFdtcGV0MkJaRnFkZXBS?=
 =?utf-8?B?Y1AvbVg0WjB5REw4Y1NNeTVGeUg0MWtZWEFnRFlncGNLRUtKdXBUT29hUnJJ?=
 =?utf-8?B?ZjFMS2M0c0UrdEVjak1NcHVjdmJPdlFpeDBVbnl3R2JVOTFxTXlFVzVlbHFl?=
 =?utf-8?B?Mk5ZRXBCUldjUDRWNGptZjg2dU00b0JmclBYbXlZbnZDd1E4U1ZoS3hQNW5I?=
 =?utf-8?B?dklvbS9FMmw0Y1FFeUwzQkpoZzh0NzMwUlhqSVNHVVNzdWtjUVJkWGNYelAw?=
 =?utf-8?B?ZG5BVmpjY3dtR1V4YXhyVjdQbGRJQXIrR0tvNnorN0xBS1I5R0NKY2FWYmJu?=
 =?utf-8?B?WG84enpGZDA1UnpLaTJhdHZnblBjNjZ3bXl4bnRoMEJXdjhBRms2Sk1USitG?=
 =?utf-8?B?Q3hqY3Rua2dkeHIrOXUrYnMxRm5iZm5LZENEWUFFU281V20rTnp2ZTF5OHJC?=
 =?utf-8?B?MFlHSllpWUprRWYrVEtIQXpDMHQvR1FDWVdMWGNsU25hTHFIWlJ0YWpqT3Fi?=
 =?utf-8?B?RXVwSTB4azJCQkNQeWY3TjdMaWNaRFBXTWMxNUZCR2NXMk50SHZEZ2YrRHZj?=
 =?utf-8?Q?sDWIEdi7ZcBpRxGE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64cf24fd-f5b3-4046-5502-08da12ab845f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 00:15:09.7144 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QF4AIxBfvbR2TdK4I1/17FoDLvMkioPLdNU229ixaNroseJGitwPZOnACSEXWMnLgzD12+X/36Vj+PfPLG18uQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1731
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-03-30_06:2022-03-29,
 2022-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300116
X-Proofpoint-GUID: 0ghvNLMqwpY35q_CrYWp1nuMJowdBKM0
X-Proofpoint-ORIG-GUID: 0ghvNLMqwpY35q_CrYWp1nuMJowdBKM0
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0b-00069f02.pphosted.com
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
Cc: lingshan.zhu@intel.com, eperezma@redhat.com,
 Michael Qiu <qiudayu@archeros.com>, qemu-devel@nongnu.org, lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/30/2022 3:02 AM, 08005325@163.com wrote:
> From: Michael Qiu <qiudayu@archeros.com>
>
> Currently, when VM poweroff, it will trigger vdpa
> device(such as mlx bluefield2 VF) reset many times(with 1 datapath
> queue pair and one control queue, triggered 3 times), this
> leads to below issue:
>
> vhost VQ 2 ring restore failed: -22: Invalid argument (22)
>
> This because in vhost_net_stop(), it will stop all vhost device bind to
> this virtio device, and in vhost_dev_stop(), qemu tries to stop the device
> , then stop the queue: vhost_virtqueue_stop().
>
> In vhost_dev_stop(), it resets the device, which clear some flags
> in low level driver, and in next loop(stop other vhost backends),
> qemu try to stop the queue corresponding to the vhost backend,
>   the driver finds that the VQ is invalied, this is the root cause.
>
> To solve the issue, vdpa should set vring unready, and
> remove reset ops in device stop: vhost_dev_start(hdev, false).
>
> and implement a new function vhost_dev_reset, only reset backend
> device when the last vhost stop triggerd.
>
> Signed-off-by: Michael Qiu<qiudayu@archeros.com>
> Acked-by: Jason Wang <jasowang@redhat.com>
> ---
> v2 --> v1:
>     implement a new function vhost_dev_reset,
>     reset the backend kernel device at last.
>
> ---
>   hw/net/vhost_net.c        | 22 +++++++++++++++++++---
>   hw/virtio/vhost-vdpa.c    |  8 ++++----
>   hw/virtio/vhost.c         | 16 +++++++++++++++-
>   include/hw/virtio/vhost.h |  1 +
>   4 files changed, 39 insertions(+), 8 deletions(-)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 30379d2..3cdf6a4 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -299,7 +299,7 @@ fail_notifiers:
>   }
>   
>   static void vhost_net_stop_one(struct vhost_net *net,
> -                               VirtIODevice *dev)
> +                               VirtIODevice *dev, bool reset)
>   {
>       struct vhost_vring_file file = { .fd = -1 };
>   
> @@ -313,6 +313,11 @@ static void vhost_net_stop_one(struct vhost_net *net,
>           net->nc->info->poll(net->nc, true);
>       }
>       vhost_dev_stop(&net->dev, dev);
> +
> +    if (reset) {
> +        vhost_dev_reset(&net->dev);
> +    }
> +
>       vhost_dev_disable_notifiers(&net->dev, dev);
>   }
>   
> @@ -391,7 +396,12 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>   err_start:
>       while (--i >= 0) {
>           peer = qemu_get_peer(ncs , i);
> -        vhost_net_stop_one(get_vhost_net(peer), dev);
> +
> +        if (i == 0) {
> +            vhost_net_stop_one(get_vhost_net(peer), dev, true);
> +        } else {
> +            vhost_net_stop_one(get_vhost_net(peer), dev, false);
> +        }
>       }
>       e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>       if (e < 0) {
> @@ -420,7 +430,13 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>           } else {
>               peer = qemu_get_peer(ncs, n->max_queue_pairs);
>           }
> -        vhost_net_stop_one(get_vhost_net(peer), dev);
> +
> +        /* We only reset backend device during the last vhost */
> +        if (i == nvhosts - 1) {
I wonder if there's any specific reason to position device reset in the 
for loop given that there's no virtqueue level reset? Wouldn't it be 
cleaner to reset the device at the end of vhost_net_stop() before 
return? you may use qemu_get_peer(ncs, 0) without hassle? Noted the 
vhost_ops->vhost_reset_device op is per device rather per vq.

> +            vhost_net_stop_one(get_vhost_net(peer), dev, true);
> +        } else {
> +            vhost_net_stop_one(get_vhost_net(peer), dev, false);
> +        }
>       }
>   
>       r = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index c5ed7a3..d858b4f 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -719,14 +719,14 @@ static int vhost_vdpa_get_vq_index(struct vhost_dev *dev, int idx)
>       return idx;
>   }
>   
> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, unsigned int ready)
>   {
>       int i;
>       trace_vhost_vdpa_set_vring_ready(dev);
>       for (i = 0; i < dev->nvqs; ++i) {
>           struct vhost_vring_state state = {
>               .index = dev->vq_index + i,
> -            .num = 1,
> +            .num = ready,
>           };
>           vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>       }
> @@ -1088,8 +1088,9 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>           if (unlikely(!ok)) {
>               return -1;
>           }
> -        vhost_vdpa_set_vring_ready(dev);
> +        vhost_vdpa_set_vring_ready(dev, 1);
>       } else {
> +        vhost_vdpa_set_vring_ready(dev, 0);
>           ok = vhost_vdpa_svqs_stop(dev);
>           if (unlikely(!ok)) {
>               return -1;
> @@ -1105,7 +1106,6 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>           memory_listener_register(&v->listener, &address_space_memory);
>           return vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_DRIVER_OK);
>       } else {
> -        vhost_vdpa_reset_device(dev);
>           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>                                      VIRTIO_CONFIG_S_DRIVER);
Here's another issue (regression) got to address - the added 
S_ACKNOWLEDGE | S_DRIVER bits will be cleared right away by the 
follow-up reset in vhost_net_stop_one(... , true), which in turn will 
cause virtio fail to initialize e.g. vhost_vdpa_set_features() will fail 
to set VIRTIO_CONFIG_S_FEATURES_OK.

Ideally the status bit should be set whenever the corresponding status 
bit is set by virtio_net from virtio_net_vhost_status(), or practically 
it can be done at the very beginning of vhost_dev_start(), for e.g. the 
first call before vhost_dev_set_features(). For this purpose, you may 
consider adding another vhost_init_device op, which is symmetric to 
vhost_ops->vhost_reset_device in the vhost_net_stop() path.

Thanks,
-Siwei

>           memory_listener_unregister(&v->listener);
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index b643f42..6d9b4a3 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1820,7 +1820,7 @@ fail_features:
>   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev)
>   {
>       int i;
> -
> +    printf("vhost_dev_stop test\n");
>       /* should only be called after backend is connected */
>       assert(hdev->vhost_ops);
>   
> @@ -1854,3 +1854,17 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
>   
>       return -ENOSYS;
>   }
> +
> +int vhost_dev_reset(struct vhost_dev *hdev)
> +{
> +    int ret = 0;
> +
> +    /* should only be called after backend is connected */
> +    assert(hdev->vhost_ops);
> +
> +    if (hdev->vhost_ops->vhost_reset_device) {
> +        ret = hdev->vhost_ops->vhost_reset_device(hdev);
> +    }
> +
> +    return ret;
> +}
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index 58a73e7..b8b7c20 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -114,6 +114,7 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
>   void vhost_dev_cleanup(struct vhost_dev *hdev);
>   int vhost_dev_start(struct vhost_dev *hdev, VirtIODevice *vdev);
>   void vhost_dev_stop(struct vhost_dev *hdev, VirtIODevice *vdev);
> +int vhost_dev_reset(struct vhost_dev *hdev);
>   int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
>   void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev);
>   


