Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BFC4EC8C5
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 17:50:13 +0200 (CEST)
Received: from localhost ([::1]:33420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZaaK-000490-3h
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 11:50:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZaY6-0002CV-If
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 11:47:55 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:30700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZaY1-0002We-8k
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 11:47:52 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UFL5mf029851; 
 Wed, 30 Mar 2022 15:47:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=r7Islm4Wi4UWz1/FQfP/a26jbuNzrCPertIAQJ60H5Y=;
 b=YWywHRbk5+RTaqLhUgUCbwBoMpaEjOy9eszA/GFwBhLAYEzNgVfDXmHtDiF0sCFsDRf0
 XTZP1e1FXlkEBPX/oTFHuAb39sEtq6pv3oZhQxgGFsfAtBELKaa3degyZZAoqjanhwfa
 njOmwNtL44TdY2yxQ1kqCL8EP5BiWi7eZ4pnYqTh2E3zkWbVuZjfM4ZkkstVTjKlYO7L
 qy/bcveXoDex8N1WqrNRRw7okA5TjV1TjKcWtOuyk3OV05UpvGClunjzZmuPbfEsfGQJ
 47z+6NVof+PkuRAt+jkRdAVzhtGJYTnq6ofqaHHx5c8mQP9DvR5XlhtAApGWOV7JCmQx qA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1tqb9rsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 15:47:41 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 22UFgNEY033840; Wed, 30 Mar 2022 15:47:40 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f1s96u79f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 15:47:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZSOzriGsulBI1hYqcPR+VuOmqIiy1YhrnhyVG1H3sO3vZ/myJRVc3JKhn5lDtcQ/Z3XJTl5i+xKlQHsYByHCr+DLzD6/xSh6S7by9Srs2e2zFsaMdgICh9doK61jLQWkMfABJX35dfG6mU8UNMnfMCu7kWUtQdxkQvh7/c3jQw7/aI2FFcUqV/5DNow39hgtOfLIrQtFYf7QU9OriJ1Qhk94Xq3BMccPF68T6JVqj4M9sXp+V1HgQbF6anXCVxZXcG7X2Ir5i5QDmj8PIZ/tegTVObaX19fPsaxECZv3unsCVjFNN4TcKMxisPrHB97p+jcR9DoleFJZ5NgX7v0pZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r7Islm4Wi4UWz1/FQfP/a26jbuNzrCPertIAQJ60H5Y=;
 b=htfx4yIfSQbtKIpWoBXNSgoKgZJNfn2nG1tX5Kig2DbAUVKPPyofiRQ24hSqEhDLne5qNDoKjntTwmfrLxQIZ0oa3GcW0osH6B1j/MHFKoV7Xc3UZHA8lA/uRGH3eEgxfPPGwBGllr82dHOYLgdASRUtYgxlNJaBNzHUFCp7W6NVDfC+cOJUDlVmBpZPmOjO6cCZnCZffn1V6uE9V2tD2vbf0MjuauNjVpsp6ESWJdEUEa67JpDcbxVXQHTd4TBQ4GeD2hWZ69gZ8wEOM+idJiyIZD84BkHsIvr8aUE87SlcgWzX80JT0gubJlWBZtHyQMCppS4ox+H+LxDYcFIpCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r7Islm4Wi4UWz1/FQfP/a26jbuNzrCPertIAQJ60H5Y=;
 b=FjwnT3oFAJLgOXGLBUKnZztXQTUNSZUqPbKh29Spv7MqqU57YJ0JOMgWyeB4R4DydGGKwjOdab90iId9bwvZxWTpbEPIU2aDYKIpR+iJnzddB6jyDOsp5IqsP3dxHHhSbIfGRPqbfySjNLrk8D8rqBk8DVqhloAOehSTVxiZJnU=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by SJ0PR10MB5406.namprd10.prod.outlook.com (2603:10b6:a03:305::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 30 Mar
 2022 15:47:38 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 15:47:38 +0000
Message-ID: <2e9ec844-952d-b43c-7ed3-499eeac6b7cb@oracle.com>
Date: Wed, 30 Mar 2022 08:47:35 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/7] virtio-net: align ctrl_vq index for non-mq guest for
 vhost_vdpa
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-2-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEv=bhGFHqv=Mi7FSnwvDZU4GAvFw564piP6nr3CHD+-Wg@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEv=bhGFHqv=Mi7FSnwvDZU4GAvFw564piP6nr3CHD+-Wg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0013.namprd05.prod.outlook.com
 (2603:10b6:a03:254::18) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5a0c05b9-f878-4528-a58f-08da12649dca
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5406:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR10MB54065871027B82158DCED1D2B11F9@SJ0PR10MB5406.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ekoQiONBA+YXFcsKLCueYggdvEIHub6YBRkUHmZepTpZULqJ7tTkGcUvBM5lfHe73ktR7ZhwpMb4N8ccT0BbWJjORqDuz2W46GTcL4XII/Uul3jr8ozfIpbVCT0klJ4VJvG3FK9wLLLR1Rwzq/hkk3UpmzsNH0qhcrSYGDPLFoCgKaP0ZLcHP5/dkgP3SOTIGpXOpCROsyaxvwOiGSKWGoMIcU8hgPcYtRk+dO5nhoEfUl75zEp11/0kuqsb8mBwm3p/koEn4CHYBdarvxH9yOMXEARbrooum7+VCqLU2p/tWIWOmEvv43BK86I4oupOgamuTCHBSogo+PTUqrU9ewFQRC+evenOiDkb12GxhVbkZWzrO8ftJpoCxOWrbRF05/+3jcEIC3xqhYiwyxIPzokSA5M+MGonnoxdX0MhuWOGQdLgHkGA9jOKXoD52Tu28jmK+VObnE/H2jw+WcE4sRCtY7eQkE4vyeJ6wlKksyVjrXWv3HYTSby43TfuXm60PdBORG6WNrcpMX9vDvomyCgV6cQ9cq8yaFR583DbPMpFJNSZ7TAOGiMBP5C3Gv57557BMCh/JeCq+TfaH6lgYNQ2rOq8os/X3gHAeJPkHlai5Aqs2xk9Clw3VNfJcErHTiXT3NtASdimMd8PJ61p+mBVdf6HQVTi2vBNeZIdoEJ/2j4mLcpUF6su3qsTsFuU9Wi3wYbjgXBcgIyxDsIw6cfOhSThsp+oibVFKMfJOrM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(53546011)(6512007)(6506007)(2616005)(186003)(6486002)(316002)(31686004)(6916009)(83380400001)(36756003)(36916002)(26005)(6666004)(4326008)(508600001)(31696002)(8936002)(38100700002)(66476007)(66946007)(54906003)(86362001)(8676002)(66556008)(2906002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm5MaHFzY1k1a3B6bCtBUmN2TXhhQkdUcDFtNEhOQ0hkMzBGbzl6L0JkNFIz?=
 =?utf-8?B?aGhVNCtxZDFuNEtkQVlzV1RaYjlvTWl4RzJqbE5DWjlZOG56RE0yZkxJVnBp?=
 =?utf-8?B?N3Z0ZWlkR2YwNnhXQzY4RitiMGZwZWEzV3FLNU5HQlo3b3JBZFVNei81Wlov?=
 =?utf-8?B?Y0hCUjU0YU9ZbFJCWVh3aXJtM3dOb3NYeGxBM0hFa2hHaGNBOFBsSWpudW5W?=
 =?utf-8?B?TGVmSms0UHVFNGtCdDBrUWE0My9yWlM0RnBzR1FDY1ZBT0JVQUNBaDUzdnk4?=
 =?utf-8?B?RGxSSmViTHJScXd3VE9OTVh0a3dPNmN1N2V5Y29vMlp5dnZiMkxYT08vSzE5?=
 =?utf-8?B?aVBtaGt2NWVwUktJdGFEdUQ2NjI5a09DNHVuWitwY2VMRS9LNDJiTkZpWjhM?=
 =?utf-8?B?eGxMZTRuY01aNllRTUNqaXM1V3BDTGFBZ2FxaWpVT25ZZ1llZm9PS3RFb3dn?=
 =?utf-8?B?UGVyaTJ3cW93cVo5dUJieUMxelJsSjFpMmw0YU9zZVBMYUZNUjJKWUEycHJW?=
 =?utf-8?B?SkFtL1Bpd2Y1bVUwcVR2b0ZKbUdDNGVSYjl5VkJ5RzA4NVk1eENqZGF1T1NL?=
 =?utf-8?B?Q2tCanRobVh6NDJoaGp3d2xyblU0Mlo0ZEZraVA5RElQWUhvbXRtQXZXeGM0?=
 =?utf-8?B?UDBGa3pOejRlWUJBMEQ2N1YxeUIzU29tMGQ4WXdxV3FzeGZlcjlsTThXTVpq?=
 =?utf-8?B?RkkwUnI2Lzd1MVUyLzJxWjEvd3Fkb2FmUXBzelVRQnp2dFArSXhBVXVmSUlJ?=
 =?utf-8?B?MHJxVUVvZU5DVGZiOUF2RUs2dmpTQjFMdklTQTJrR2pwWTh2Q28wMlRQRFYx?=
 =?utf-8?B?SEdGQkRzWWJrakRJY2s5QVN2alQ2VVVBTS9BaG45Mk1TKzl6YjhZMml5YVRP?=
 =?utf-8?B?Q1pWODNyTWZGRGRCTElWN1NOaVVSR0w4Wk1vVURLeERLTHl5aFVGa2d6QSt4?=
 =?utf-8?B?Nnk4TUF4VTNlN3M4Qjdld1llRklFWGd3NDU2cmdwa1Mrd0RwWDJpVjlJRDRH?=
 =?utf-8?B?dmVWcDJLT0UySWVCcThSbkR6ZWJST3Y1eVRjaDdET3lmVElKU3c1clNnbFhE?=
 =?utf-8?B?d1hRb3B3OFpNRHduVEZiOU11aTNFNm45V3hlRHRtS2RROGtyVzJOTDUxL3F1?=
 =?utf-8?B?Slg2RWhCQjh3V3F3THR2S3dWd1F1dWhpU2QzUWxGYkNaNEk1ek5ST29Eckwr?=
 =?utf-8?B?d0hGWG4wRDB6TkdYSmtWSTdiVTRFWXNLc0ZFYUlhRFBsUGozWVhDSzU5dmJx?=
 =?utf-8?B?S25mbWlrQmhQUW5vMnR6NjQ4c3FJKzFLU1dWYTFWKzRFU245RkVvQllkTWVl?=
 =?utf-8?B?Z2tKemNRaTRmMEc2ZzJmMHZDclBlQnhHNmkydURoNDNMaU01Z21mcmZuZ3U4?=
 =?utf-8?B?ODdXWTVndUp1TXZNdWhQWG8zejVRQ3NPMnRSVkNnMVpXUVNqTEJONkxhREs4?=
 =?utf-8?B?WitwM1NRdUpYNnNqbGptVUFnMS8veXZaUHE4c0FHZVEyVzZaWUs1ZDNwTFhs?=
 =?utf-8?B?VnlHdmw0RHBKRmJPbVV4UVJsTlNuUWN4cHI0VzBmRGNLREpoUkIrVVNZVW5I?=
 =?utf-8?B?UUo5emhWTTVLYy9BSnprbStibTdZWExMY3lQbi9tQUw2TEpTS2FQOFZRYVYy?=
 =?utf-8?B?UnpicCsrbWJyYzU3dUF4ZE54UkVTYWNTL0U5R3E3SlZGVDF2WHBVUGw4UU5B?=
 =?utf-8?B?YkdqbTVjSFdMaXIwOHIzNkVvY081MmlrMHdLQXBiejZqYmRvNjh3Tmc5b1Fy?=
 =?utf-8?B?TStHc3VwaVZjcTgvcUJmWUJvejNjWmpXL0d0ZEl4dTZHeml5TDd5UzlEeUxH?=
 =?utf-8?B?MGN1aHBNZEVYNHcrOEtqckJ2eERScitCK2liSFJjWGlWa0NBMkFiZGJySVFB?=
 =?utf-8?B?b2h0NERqWVp3aEw0ZWp2NERPODQyRFY2ZmJLcVhXcmFHOThGWEllQzVwbFVF?=
 =?utf-8?B?bmRpS2hyaE9HTGo0ZDRFV1JxM1JTdEJXb2RMTnE1dEFNNStKWXVvN0wrWGFC?=
 =?utf-8?B?UGUvRXFsMGtKOEpPbTJGTWo1VG83S2JNTTg2WktiVVpLejNrVWhObzI1cXJ5?=
 =?utf-8?B?aHRkTGVmL2tBMWdrSVYxMWZNMXVLZjZSQndaN2ZhZWx0OWR3dHZ1Qzc0MGVJ?=
 =?utf-8?B?VkR0SHBoV01xS3UveGgwRW1nVU5UcmdrTEI2RzRoZDM4Um56NE5vT3RZK2h4?=
 =?utf-8?B?dlBxL0E3TGJYdkNQSjZWa1ZnQUdKSlJEaXpFNTJpUExkRlRkeDRBTzdsTFVW?=
 =?utf-8?B?WGIxRGhIeDE4TW4xSm9sYVJYYjdjYmFuZ3ZVWVQ1YXp1TXZvQ3ByQWRtVHVG?=
 =?utf-8?B?UndOcTZtdHozcWE1Tkk0Tm5ndU9yUEozYkM1ZTVMenhZZUZROUNtUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a0c05b9-f878-4528-a58f-08da12649dca
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 15:47:38.4366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UOWrKgiMdBC1ZukpCJ6RX9LmNh8vB63d+iugR+yhKagy2MLwvxItRRyxtlnibgSLC/QMTNgcUkH+LLplre6acQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5406
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-03-30_04:2022-03-29,
 2022-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300076
X-Proofpoint-GUID: COlADQMeB2mtYRcsCidCzEyNj6mOzwg_
X-Proofpoint-ORIG-GUID: COlADQMeB2mtYRcsCidCzEyNj6mOzwg_
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
Cc: eperezma <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/30/2022 2:00 AM, Jason Wang wrote:
> On Wed, Mar 30, 2022 at 2:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>> With MQ enabled vdpa device and non-MQ supporting guest e.g.
>> booting vdpa with mq=on over OVMF of single vqp, below assert
>> failure is seen:
>>
>> ../hw/virtio/vhost-vdpa.c:560: vhost_vdpa_get_vq_index: Assertion `idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs' failed.
>>
>> 0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
>> 1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
>> 2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
>> 3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
>> 4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
>> 5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
>> 6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=0x558f55c01800, vdev=0x558f568f91f0, n=2, mask=<optimized out>) at ../hw/virtio/vhost.c:1557
>> 7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier (d=d@entry=0x558f568f0f60, n=n@entry=2, assign=assign@entry=true, with_irqfd=with_irqfd@entry=false)
>>     at ../hw/virtio/virtio-pci.c:974
>> 8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers (d=0x558f568f0f60, nvqs=3, assign=true) at ../hw/virtio/virtio-pci.c:1019
>> 9  0x0000558f52bf091d in vhost_net_start (dev=dev@entry=0x558f568f91f0, ncs=0x558f56937cd0, data_queue_pairs=data_queue_pairs@entry=1, cvq=cvq@entry=1)
>>     at ../hw/net/vhost_net.c:361
>> 10 0x0000558f52d4e5e7 in virtio_net_set_status (status=<optimized out>, n=0x558f568f91f0) at ../hw/net/virtio-net.c:289
>> 11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=0x558f568f91f0, status=15 '\017') at ../hw/net/virtio-net.c:370
>> 12 0x0000558f52d6c4b2 in virtio_set_status (vdev=vdev@entry=0x558f568f91f0, val=val@entry=15 '\017') at ../hw/virtio/virtio.c:1945
>> 13 0x0000558f52c69eff in virtio_pci_common_write (opaque=0x558f568f0f60, addr=<optimized out>, val=<optimized out>, size=<optimized out>) at ../hw/virtio/virtio-pci.c:1292
>> 14 0x0000558f52d15d6e in memory_region_write_accessor (mr=0x558f568f19d0, addr=20, value=<optimized out>, size=1, shift=<optimized out>, mask=<optimized out>, attrs=...)
>>     at ../softmmu/memory.c:492
>> 15 0x0000558f52d127de in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f8cdbffe748, size=size@entry=1, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x558f52d15cf0 <memory_region_write_accessor>, mr=0x558f568f19d0, attrs=...) at ../softmmu/memory.c:554
>> 16 0x0000558f52d157ef in memory_region_dispatch_write (mr=mr@entry=0x558f568f19d0, addr=20, data=<optimized out>, op=<optimized out>, attrs=attrs@entry=...)
>>     at ../softmmu/memory.c:1504
>> 17 0x0000558f52d078e7 in flatview_write_continue (fv=fv@entry=0x7f8accbc3b90, addr=addr@entry=103079215124, attrs=..., ptr=ptr@entry=0x7f8ce6300028, len=len@entry=1, addr1=<optimized out>, l=<optimized out>, mr=0x558f568f19d0) at /home/opc/qemu-upstream/include/qemu/host-utils.h:165
>> 18 0x0000558f52d07b06 in flatview_write (fv=0x7f8accbc3b90, addr=103079215124, attrs=..., buf=0x7f8ce6300028, len=1) at ../softmmu/physmem.c:2822
>> 19 0x0000558f52d0b36b in address_space_write (as=<optimized out>, addr=<optimized out>, attrs=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>)
>>     at ../softmmu/physmem.c:2914
>> 20 0x0000558f52d0b3da in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=...,
>>     attrs@entry=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>, is_write=<optimized out>) at ../softmmu/physmem.c:2924
>> 21 0x0000558f52dced09 in kvm_cpu_exec (cpu=cpu@entry=0x558f55c2da60) at ../accel/kvm/kvm-all.c:2903
>> 22 0x0000558f52dcfabd in kvm_vcpu_thread_fn (arg=arg@entry=0x558f55c2da60) at ../accel/kvm/kvm-accel-ops.c:49
>> 23 0x0000558f52f9f04a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:556
>> 24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
>> 25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6
>>
>> The cause for the assert failure is due to that the vhost_dev index
>> for the ctrl vq was not aligned with actual one in use by the guest.
>> Upon multiqueue feature negotiation in virtio_net_set_multiqueue(),
>> if guest doesn't support multiqueue, the guest vq layout would shrink
>> to a single queue pair, consisting of 3 vqs in total (rx, tx and ctrl).
>> This results in ctrl_vq taking a different vhost_dev group index than
>> the default. We can map vq to the correct vhost_dev group by checking
>> if MQ is supported by guest and successfully negotiated. Since the
>> MQ feature is only present along with CTRL_VQ, we make sure the index
>> 2 is only meant for the control vq while MQ is not supported by guest.
>>
>> Be noted if QEMU or guest doesn't support control vq, there's no bother
>> exposing vhost_dev and guest notifier for the control vq. Since
>> vhost_net_start/stop implies DRIVER_OK is set in device status, feature
>> negotiation should be completed when reaching virtio_net_vhost_status().
>>
>> Fixes: 22288fe ("virtio-net: vhost control virtqueue support")
>> Suggested-by: Jason Wang <jasowang@redhat.com>
>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>> ---
>>   hw/net/virtio-net.c | 19 ++++++++++++++++---
>>   1 file changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>> index 1067e72..484b215 100644
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -245,7 +245,8 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
>>       VirtIODevice *vdev = VIRTIO_DEVICE(n);
>>       NetClientState *nc = qemu_get_queue(n->nic);
>>       int queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
>> -    int cvq = n->max_ncs - n->max_queue_pairs;
>> +    int cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
>> +              n->max_ncs - n->max_queue_pairs : 0;
> Let's use a separate patch for this.
Yes, I can do that. Then the new patch will become a requisite for this 
patch.

>
>>       if (!get_vhost_net(nc->peer)) {
>>           return;
>> @@ -3170,8 +3171,14 @@ static NetClientInfo net_virtio_info = {
>>   static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
>>   {
>>       VirtIONet *n = VIRTIO_NET(vdev);
>> -    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
>> +    NetClientState *nc;
>>       assert(n->vhost_started);
>> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
>> +        assert(virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ));
> This assert seems guest trigger-able. If yes, I would remove this or
> replace it with log_guest_error.
This assert actually is relevant to the cvq change in 
virtio_net_vhost_status(). Since the same check on VIRTIO_NET_F_CTRL_VQ 
has been done earlier, it is assured that CTRL_VQ is negotiated when 
getting here.
Noted the vhost_started is asserted in the same function, which in turn 
implies DRIVER_OK is set meaning feature negotiation is complete. I 
can't easily think of a scenario which guest may inadvertently or 
purposely trigger the assert?

-Siwei

>
>> +        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
>> +    } else {
>> +        nc = qemu_get_subqueue(n->nic, vq2q(idx));
>> +    }
>>       return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
>>   }
>>
>> @@ -3179,8 +3186,14 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
>>                                              bool mask)
>>   {
>>       VirtIONet *n = VIRTIO_NET(vdev);
>> -    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
>> +    NetClientState *nc;
>>       assert(n->vhost_started);
>> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
>> +        assert(virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ));
> And this.
>
> Thanks
>
>
>> +        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
>> +    } else {
>> +        nc = qemu_get_subqueue(n->nic, vq2q(idx));
>> +    }
>>       vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
>>                                vdev, idx, mask);
>>   }
>> --
>> 1.8.3.1
>>


