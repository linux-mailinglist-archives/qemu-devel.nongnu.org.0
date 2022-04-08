Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDD74F9BB7
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 19:29:33 +0200 (CEST)
Received: from localhost ([::1]:45572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncsQO-00012M-0q
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 13:29:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ncsEw-0007PH-GW
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:17:43 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:23212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1ncsEs-0007rc-Ra
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 13:17:41 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 238F40cL005378; 
 Fri, 8 Apr 2022 17:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=yEZ9t7182WRAfMhoS2ZtxGraaYAtPiRPdWsZtMVV+2k=;
 b=IVFol8zSNkT+WECvDix+oh3tezhmrb4DRAPMwnNcICh9QjJjz62X0KZ6r6n3Pi5RBXDB
 7nlA0M+VVKUzyKnjjpIZUgzvKaRK0+3/7nDCFmzUAa9cqy+pKereUlKL9K7F+GiLFxUk
 bCKcimmYlKR1Hs36I27zWo1950bWSP70UEXFDutnFpj6vOGvel52ldsEEaDsMOeImVY5
 lFmuSJaoqu8LrUsEHGw2Bp6ofv51B1RRr2gj4Ydk1GGN+4KX6POjP/M3bI3Nibi0dtuz
 S7wXOHbea6Y+2FMW3g9flMvmNQ0ieHNFhClIxMzYlmbIkK/4Ubc5OpkVzjIzZezJWet/ 5g== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f6d937rrf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Apr 2022 17:17:26 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 238H5bgB009609; Fri, 8 Apr 2022 17:17:24 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2042.outbound.protection.outlook.com [104.47.51.42])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f97uyb6mh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 08 Apr 2022 17:17:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y3LWyaljCqtgsx1+SX89+iq28SrILXiJEL/197buBgaploTK1YXYg/JZSJ537/hWOeC7Q5XJmXLJuaif0dX/OK8LNAdspqN1Mr8/o8sQTr4zoUb0c9weCg+xA7JDxY/Xzu8oghhnGCp+4xU9knmBhOZ3U756RwcK+4cyqAg/Cd04NGRVMInWn6o2q3q/ExuTXEKIBl/EjJkVUU/NltQFpwfjPWlLMlKRBQsoRXsvrL9XOyjo8B7M12HUO/OqdrfuOm+CDgIP1t0pxZy/IB3DeBDNJHrV8VCfI6/OBroE1RuUnvGVqohJhcT/77JXUr/PiJ7yhs6EwIYdrhM83vk9NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yEZ9t7182WRAfMhoS2ZtxGraaYAtPiRPdWsZtMVV+2k=;
 b=R+DAdwvB9VJ4OrOWGmh41TtdrZmjRcPMHej45v9d71crNnaP6JeQ82wq5XUVKEk+t6W0YDlhWTGTQ8xES+PJFK0nZZHCyW/uCcbttrZnurSlEci67X01MxpNO3EXq2K+WW/8eTaiOwkblKtYL11gBhiAJvGGSD/J+Bw+QlILe8rt71H3+DWQCKKuci2aFPwrM94YpdXQdYDAS3YQN/i+A7P7K2RDr1RYQKtcihnwrLlAEgWuMjH7E5u5i87mr3A9uCBly1QmgPB9iMsObqfeKRXqaYtxSBCPwcGawG1rWosfi9aXEsNINAsTPe/nI8B0XWRb2ce+h8ZojWJrqPc8xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yEZ9t7182WRAfMhoS2ZtxGraaYAtPiRPdWsZtMVV+2k=;
 b=NmIKJDSYpVYBALoFKPoIyjIs8bgGwU223OZtVTgFclqEoczqlMtpWICaqnOETNfNfysGSzi5qoNb4PXo2FBW07ek/DsAyNIbyTENC5gonmyB0q5f279qodxMzxbFrMKCA/pjxhojlPQyzrDCiUVdAy5TarywN83aquC1qXZuIL8=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by CO1PR10MB4548.namprd10.prod.outlook.com (2603:10b6:303:97::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.26; Fri, 8 Apr
 2022 17:17:21 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::fcff:70e5:ceb0:4947]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::fcff:70e5:ceb0:4947%7]) with mapi id 15.20.5144.026; Fri, 8 Apr 2022
 17:17:21 +0000
Message-ID: <931be929-55c7-8856-3345-c132a228cf68@oracle.com>
Date: Fri, 8 Apr 2022 10:17:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] vhost: Refactor vhost_reset_device() in VhostOps
Content-Language: en-US
To: Michael Qiu <qiudayu@archeros.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org
References: <1648776683-23739-1-git-send-email-qiudayu@archeros.com>
 <1648811173-15293-1-git-send-email-qiudayu@archeros.com>
 <1648811173-15293-2-git-send-email-qiudayu@archeros.com>
 <c8e8459d-32b5-55ff-44f4-1f03edb8a597@redhat.com>
 <6247dc22.1c69fb81.4244.a88bSMTPIN_ADDED_BROKEN@mx.google.com>
 <8740bef3-bf55-ac94-a2a2-a0776ae5f5b6@redhat.com>
 <4308c7ce-b370-654e-1d04-42cd4e11b647@archeros.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <4308c7ce-b370-654e-1d04-42cd4e11b647@archeros.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR11CA0063.namprd11.prod.outlook.com
 (2603:10b6:a03:80::40) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7154399f-5578-482c-777a-08da1983a428
X-MS-TrafficTypeDiagnostic: CO1PR10MB4548:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB454888D4CFDCCB1C31EB5952B1E99@CO1PR10MB4548.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N5tBxMZDS0NHJunMGhBTCH7IQ4FFAC05czJs0ekEG0EpNSSYz3xNSAWM5toELq4GoQmwIyPCxXDJsMyq+cN+WomFABLkktTrpOwptXBckpkpaYMBtccz+AcfkG7m/rAjGDTdkpBrf9A/MMxrJAF2g1PAq1w4RPrOpc73AXn7vNByZj9SzJ0ObEuIb6ZahX3abNVZc6BAHMNIMLPZLx2/9ZuEAHeC+Xf2x5EJrvVKJw2UIoC9NvLxbo1MxX773Kn7NGmkk9Y7FNyqqWPo96huuNdSPTghwRZRe2+YgTvw4IP8GncrY6VcWDz3SWQvSXtUljT9BEp00U38zKMenUA4+7ToiDRKPtPsKOXpWFnmKv4zTqWb5wrJjEbGAOliwXuhP4JVB5cDnFsi675W145vgKqM+DA55pTIGnYoEW2Bx5SBUlpKQ/VNsuFUIq15pmEHRnwgK5zx2eABTZEtBx3g0HT4pWfQmRTXfxOBeu4WNks4FtREdYY1UpE0TzZ0moEUw5h64cP5K0J/08LP3wTlUuEXmtx198ASwfCB72/Yy+CgtQ+WtPbeMljjlh6eNsGgaPQdBMAfvR+6pRjnBw1TQj7RvGIFsqq6UMmLbnrma1lrJLBOIBHDk0bawTuy7Ht4SN9Akhkcw4do1NiX4mokzInpJ9eleHsl4SxIisyA/SVXcwusF/f5cO3TfW6YLKa0EBa4Rm5bhKyWBS8zBDVXnRgwflVLBCXeTCLV8wQ7CjxfOPMhLPj85CjgPVb3Kj+tYOCiWdduQldnEtahUMhIkt6vZj5zWrAMQGa53JUejeNK8Xfzxub8g/Sqq+Y1NGMT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(38100700002)(8936002)(5660300002)(66556008)(54906003)(110136005)(66946007)(31686004)(36756003)(316002)(6486002)(6506007)(4326008)(6666004)(66476007)(966005)(8676002)(86362001)(53546011)(31696002)(508600001)(6512007)(36916002)(83380400001)(2616005)(2906002)(26005)(186003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ymt0UjU3Z29QK3ZBOW1OSXhvbThmRk9ISXBjN2RKSXYvZXkydXIvYThadVJU?=
 =?utf-8?B?Qnc3cS9Dd2FlaDUyTm9mZFdiK2ZxUThqNzV0cU9OMm9kblQ1UWFuMys3NjRB?=
 =?utf-8?B?aldjVjlETGdVZEY3b1BoVHk2RGJXRnNqWFFWT1BlVFNxb3NQYmZzM2VYbkRU?=
 =?utf-8?B?c2pFNDBBVUd0SWZvS2xtdDI2UGtSbkMwQzFNVkN6WjU0a2RTdzB0SFl4c0Ja?=
 =?utf-8?B?ZjlXMklZbmhLZ3lOQ2x6WTE2dkQwR29QdjdNYWd6bnJ1TTBzNExjM2t4MlU3?=
 =?utf-8?B?Z2xZN1RPd3BHY2F4TDNWdk5EUkloZ1ljdjZKbGsrMVlaTUc4VFd0cTc5RWUw?=
 =?utf-8?B?WmgzSERuT2k0MjFYWWd2Y1RjNGJGaUhFYkFjRlJna0hGUzc4K0dEeHRoRzIr?=
 =?utf-8?B?VEo1Zkl6QzhNcE5SUnN3SkQwNGw2ZXJKQzNMNmNhYmx0dXcvRGVnTWw4ejhk?=
 =?utf-8?B?Q2x5c1IrK2JCTk5SMWpTc2dSUEo3Rk5oMVBwUGxtN253dGJpY2VzcFNvRFpN?=
 =?utf-8?B?L0JxWnluSXk2UDhhSGo4VkQ0OHVVeFJZclNDdjBjaWZadzBMb1ZRc3orUFZz?=
 =?utf-8?B?OWxZdGtJMVJ1eDFCQVFPZFB5M3dJR25KVVB0bHFzTEM2eUIxbHJuQVlCZXFO?=
 =?utf-8?B?c0MzRGZOZEt1RG12ZzNGWk9WM2pZUGVHYXZ3bm41bGRnenhZVm1RTHlzVFo0?=
 =?utf-8?B?WHVBcDRmZW5zeTJ6M25WZ0ZZTEJ4SmVGK2c1cXdVQjJFbEZsR2lJRjFQeXl4?=
 =?utf-8?B?N3FiaEdZYVAwQURWOFM4SWxJcFhKT0hib1h3d1dlQUhRRXF5RzFmSFNWS3Mz?=
 =?utf-8?B?eHg1ZmxXSzdSNjVuUzNIRkRIU1ExUnA5Y1IwSGNOU1gvWlFucVNZVndyVDkv?=
 =?utf-8?B?TXAvZjI1V28relUwemdzdlRPemlZcmRWQjJqaEtLNFRIU2I1R1lZMUNsdkhF?=
 =?utf-8?B?b1BONWpHeDY2a3NOTjgrbXlBdnBrUVo0d0s3Tzk2ZmpNYWRUMm83dUFLVTBT?=
 =?utf-8?B?eGFUT2N0aXh0YkJwSFNkbVlMYi9nandnZjFSK1NoZ05VNWIvNWN3U1VoS0o2?=
 =?utf-8?B?bTY3WDdDU2gyWlUrYjB2SGRUN203dHZEWWlYUXZCVEt2Zy9LWDBBWkJlOVBw?=
 =?utf-8?B?WXJYcmFsYXhCY0g1MDAwV2g0R2VGSFQrRTlQU2R3V0xObUFGUjVDS2N2LzNa?=
 =?utf-8?B?UDdqVUtWeENiN29pbnA2Z0xlK1FBSHZCWXU5azhXQS8yMU9vb2I0MHJobmc4?=
 =?utf-8?B?cG9PeHhnZzA1cEhwMEJhWFdWdlFHU3h3bnhKZGV1TnBkRS9NZ1NYZGVVQ1Yw?=
 =?utf-8?B?clR2RjVOUGhtVHF6OENKTW5lUkpjZEFLQVhETjlRTTRuR1VEYmM4ak1iZHRV?=
 =?utf-8?B?OWdHTFB2ejMvM0dlakJYL1YrbDVXUTNJWExYQVBFRkt2UHV5RHpSNVBqdkQy?=
 =?utf-8?B?MmhnaVh1c21JR0ZxQk1jK2Z4c1Z1dUVmY01ST1M4QzhHa05tM25nRTlxVHFz?=
 =?utf-8?B?UitPamxJV0Y1U1dkcEdEWW1oeVR0V25ET1RhdkZkVU9NRDBlMTEzWHpESHEy?=
 =?utf-8?B?MGVBbkFCTmp3czBMcFJqQkRwdU5Sc1dmTFRMNkhTSFRBSXlUMVEramkyKytC?=
 =?utf-8?B?NW1OQzN2a0hieExtNnlKT0FqeHByQndVOXZrQ0ZYdzNNdkd6VHpaNVhadzhO?=
 =?utf-8?B?dktzUTBxbDNpUGpNSUhwZU13ZWtnbGFsellmb0krSHBUdUJVU1RDVUloTFNo?=
 =?utf-8?B?NElFVjNZcW9yRS9STkxjUXVteTlia3VKUnYvSXd5TkJHTlBmVng0TXFOZzRp?=
 =?utf-8?B?NERMM01XS0lHcGhiNkthdnFjdTdaenhzU0Y1ekZoYktZZDJvQU1sUFJBYWhI?=
 =?utf-8?B?cUxlYTNyNldObGpPdksxRThyOVpQSCtuTnJLZnpnemxWRkVubWQzNm1CdTFG?=
 =?utf-8?B?OElGdjBjSStxMjluTE4xRzBFbGJ6bUtBanlNc2dEKysvQUMvbWZzWlRBMERs?=
 =?utf-8?B?VGVNaEdqSWdIU2dZMkRFSDRJbjByYlBDUWVrUkJPd2dCSWNEQ3lzNkVPbW82?=
 =?utf-8?B?QTlmZWFPZTdPSnZQOWdyTjhyZElaMTdqc21wc1p0aWQwQ0Nxc25PaXplR0Vh?=
 =?utf-8?B?TFpYZlJrb2RIelVVYXE3enI2d1pQSUNHYnlDL3lFRXQrUDEyb3dlbmF4TXBQ?=
 =?utf-8?B?Vm1qT2JlelpqR29rck1iZWtQYzFPZFZvU1NhYnpHdmJxNDR4Nk4zNVFGOExV?=
 =?utf-8?B?cE5Ybmt1cUt6UnVZeTl0VVBmT0VkUWxBMkk3UElmUVVVSGJ1M1lkQm4wT01F?=
 =?utf-8?B?aDRZMzFIZkRDNkdvN2dzU3hVTHEyRWNyRjd4MnlaWnprcW9hSGNTUT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7154399f-5578-482c-777a-08da1983a428
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 17:17:21.6871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFcQIKWhwMhff6ra7SYSnMGiMNVwuJiIut4yo44ZJL9EN0ZZFewZDKEd2zYIKvRgca4VZkUmmUIG41lBomGbMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4548
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.858
 definitions=2022-04-08_05:2022-04-08,
 2022-04-08 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 malwarescore=0
 bulkscore=0 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204080087
X-Proofpoint-ORIG-GUID: SwORLFcxscg8PW-8jWHspX2tdRck0-pl
X-Proofpoint-GUID: SwORLFcxscg8PW-8jWHspX2tdRck0-pl
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
Cc: Eugenio Perez Martin <eperezma@redhat.com>, "Zhu,
 Lingshan" <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/8/2022 1:38 AM, Michael Qiu wrote:
>
>
> 在 2022/4/7 15:35, Jason Wang 写道:
>>
>> 在 2022/4/2 下午1:14, Michael Qiu 写道:
>>>
>>>
>>> On 2022/4/2 10:38, Jason Wang wrote:
>>>>
>>>> 在 2022/4/1 下午7:06, Michael Qiu 写道:
>>>>> Currently in vhost framwork, vhost_reset_device() is misnamed.
>>>>> Actually, it should be vhost_reset_owner().
>>>>>
>>>>> In vhost user, it make compatible with reset device ops, but
>>>>> vhost kernel does not compatible with it, for vhost vdpa, it
>>>>> only implement reset device action.
>>>>>
>>>>> So we need seperate the function into vhost_reset_owner() and
>>>>> vhost_reset_device(). So that different backend could use the
>>>>> correct function.
>>>>
>>>>
>>>> I see no reason when RESET_OWNER needs to be done for kernel backend.
>>>>
>>>
>>> In kernel vhost, RESET_OWNER  indeed do vhost device level reset: 
>>> vhost_net_reset_owner()
>>>
>>> static long vhost_net_reset_owner(struct vhost_net *n)
>>> {
>>> [...]
>>>         err = vhost_dev_check_owner(&n->dev);
>>>         if (err)
>>>                 goto done;
>>>         umem = vhost_dev_reset_owner_prepare();
>>>         if (!umem) {
>>>                 err = -ENOMEM;
>>>                 goto done;
>>>         }
>>>         vhost_net_stop(n, &tx_sock, &rx_sock);
>>>         vhost_net_flush(n);
>>>         vhost_dev_stop(&n->dev);
>>>         vhost_dev_reset_owner(&n->dev, umem);
>>>         vhost_net_vq_reset(n);
>>> [...]
>>>
>>> }
>>>
>>> In the history of QEMU, There is a commit:
>>> commit d1f8b30ec8dde0318fd1b98d24a64926feae9625
>>> Author: Yuanhan Liu <yuanhan.liu@linux.intel.com>
>>> Date:   Wed Sep 23 12:19:57 2015 +0800
>>>
>>>     vhost: rename VHOST_RESET_OWNER to VHOST_RESET_DEVICE
>>>
>>>     Quote from Michael:
>>>
>>>         We really should rename VHOST_RESET_OWNER to 
>>> VHOST_RESET_DEVICE.
>>>
>>> but finally, it has been reverted by the author:
>>> commit 60915dc4691768c4dc62458bb3e16c843fab091d
>>> Author: Yuanhan Liu <yuanhan.liu@linux.intel.com>
>>> Date:   Wed Nov 11 21:24:37 2015 +0800
>>>
>>>     vhost: rename RESET_DEVICE backto RESET_OWNER
>>>
>>>     This patch basically reverts commit d1f8b30e.
>>>
>>>     It turned out that it breaks stuff, so revert it:
>>>
>>> https://urldefense.com/v3/__http://lists.nongnu.org/archive/html/qemu-devel/2015-10/msg00949.html__;!!ACWV5N9M2RV99hQ!bgCEUDnSCLVO8LxXlwcdiHrtwqH5ip_sVcKscrtJve5eSzJfNN9JZuf-8HQIQ1Re$ 
>>>
>>> Seems kernel take RESET_OWNER for reset,but QEMU never call to this 
>>> function to do a reset.
>>
>>
>> The question is, we manage to survive by not using RESET_OWNER for 
>> past 10 years. Any reason that we want to use that now?
>>
>> Note that the RESET_OWNER is only useful the process want to drop the 
>> its mm refcnt from vhost, it doesn't reset the device (e.g it does 
>> not even call vhost_vq_reset()).
>>
>> (Especially, it was deprecated in by the vhost-user protocol since 
>> its semantics is ambiguous)
>>
>>
>
> So, you prefer to directly remove RESET_OWNER support now?
>
>>>
>>>> And if I understand the code correctly, vhost-user "abuse" 
>>>> RESET_OWNER for reset. So the current code looks fine?
>>>>
>>>>
>>>>>
>>>>> Signde-off-by: Michael Qiu <qiudayu@archeros.com>
>>>>> ---
>>>>>   hw/scsi/vhost-user-scsi.c         |  6 +++++-
>>>>>   hw/virtio/vhost-backend.c         |  4 ++--
>>>>>   hw/virtio/vhost-user.c            | 22 ++++++++++++++++++----
>>>>>   include/hw/virtio/vhost-backend.h |  2 ++
>>>>>   4 files changed, 27 insertions(+), 7 deletions(-)
>>>>>
>>>>> diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
>>>>> index 1b2f7ee..f179626 100644
>>>>> --- a/hw/scsi/vhost-user-scsi.c
>>>>> +++ b/hw/scsi/vhost-user-scsi.c
>>>>> @@ -80,8 +80,12 @@ static void vhost_user_scsi_reset(VirtIODevice 
>>>>> *vdev)
>>>>>           return;
>>>>>       }
>>>>> -    if (dev->vhost_ops->vhost_reset_device) {
>>>>> +    if (virtio_has_feature(dev->protocol_features,
>>>>> + VHOST_USER_PROTOCOL_F_RESET_DEVICE) &&
>>>>> + dev->vhost_ops->vhost_reset_device) {
>>>>>           dev->vhost_ops->vhost_reset_device(dev);
>>>>> +    } else if (dev->vhost_ops->vhost_reset_owner) {
>>>>> +        dev->vhost_ops->vhost_reset_owner(dev);
>>>>
>>>>
>>>> Actually, I fail to understand why we need an indirection via 
>>>> vhost_ops. It's guaranteed to be vhost_user_ops.
>>>>
>>>>
>>>>>       }
>>>>>   }
>>>>> diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
>>>>> index e409a86..abbaa8b 100644
>>>>> --- a/hw/virtio/vhost-backend.c
>>>>> +++ b/hw/virtio/vhost-backend.c
>>>>> @@ -191,7 +191,7 @@ static int vhost_kernel_set_owner(struct 
>>>>> vhost_dev *dev)
>>>>>       return vhost_kernel_call(dev, VHOST_SET_OWNER, NULL);
>>>>>   }
>>>>> -static int vhost_kernel_reset_device(struct vhost_dev *dev)
>>>>> +static int vhost_kernel_reset_owner(struct vhost_dev *dev)
>>>>>   {
>>>>>       return vhost_kernel_call(dev, VHOST_RESET_OWNER, NULL);
>>>>>   }
>>>>> @@ -317,7 +317,7 @@ const VhostOps kernel_ops = {
>>>>>           .vhost_get_features = vhost_kernel_get_features,
>>>>>           .vhost_set_backend_cap = vhost_kernel_set_backend_cap,
>>>>>           .vhost_set_owner = vhost_kernel_set_owner,
>>>>> -        .vhost_reset_device = vhost_kernel_reset_device,
>>>>> +        .vhost_reset_owner = vhost_kernel_reset_owner,
>>>>
>>>>
>>>> I think we can delete the current vhost_reset_device() since it not 
>>>> used in any code path.
>>>>
>>>
>>> I planned to use it for vDPA reset, 
>>
>>
>> For vhost-vDPA it can call vhost_vdpa_reset_device() directly.
>>
>> As I mentioned before, the only user of vhost_reset_device config ops 
>> is vhost-user-scsi but it should directly call the 
>> vhost_user_reset_device().
>>
>
>
> Yes, but in the next patch I reuse it to reset backend device in 
> vhost_net.
I recall vhost-user has a different way to reset the net backend, so 
probably we can leave out implementing the .vhost_reset_device() op for 
vhost-user as Jason suggested. In that case vhost-user-scsi will call 
into vhost_user_reset_device() directly without using the 
.vhost_reset_device() op.

-Siwei

>
>
>> Thanks
>>
>>
>>> and vhost-user-scsi also use device reset.
>>>
>>> Thanks,
>>> Michael
>>>
>>>> Thanks
>>>>
>>>>
>>>>>           .vhost_get_vq_index = vhost_kernel_get_vq_index,
>>>>>   #ifdef CONFIG_VHOST_VSOCK
>>>>>           .vhost_vsock_set_guest_cid = 
>>>>> vhost_kernel_vsock_set_guest_cid,
>>>>> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
>>>>> index 6abbc9d..4412008 100644
>>>>> --- a/hw/virtio/vhost-user.c
>>>>> +++ b/hw/virtio/vhost-user.c
>>>>> @@ -1475,16 +1475,29 @@ static int 
>>>>> vhost_user_get_max_memslots(struct vhost_dev *dev,
>>>>>       return 0;
>>>>>   }
>>>>> +static int vhost_user_reset_owner(struct vhost_dev *dev)
>>>>> +{
>>>>> +    VhostUserMsg msg = {
>>>>> +        .hdr.request = VHOST_USER_RESET_OWNER,
>>>>> +        .hdr.flags = VHOST_USER_VERSION,
>>>>> +    };
>>>>> +
>>>>> +    return vhost_user_write(dev, &msg, NULL, 0);
>>>>> +}
>>>>> +
>>>>>   static int vhost_user_reset_device(struct vhost_dev *dev)
>>>>>   {
>>>>>       VhostUserMsg msg = {
>>>>> +        .hdr.request = VHOST_USER_RESET_DEVICE,
>>>>>           .hdr.flags = VHOST_USER_VERSION,
>>>>>       };
>>>>> -    msg.hdr.request = virtio_has_feature(dev->protocol_features,
>>>>> - VHOST_USER_PROTOCOL_F_RESET_DEVICE)
>>>>> -        ? VHOST_USER_RESET_DEVICE
>>>>> -        : VHOST_USER_RESET_OWNER;
>>>>> +    /* Caller must ensure the backend has 
>>>>> VHOST_USER_PROTOCOL_F_RESET_DEVICE
>>>>> +     * support */
>>>>> +    if (!virtio_has_feature(dev->protocol_features,
>>>>> + VHOST_USER_PROTOCOL_F_RESET_DEVICE)) {
>>>>> +        return -EPERM;
>>>>> +    }
>>>>>       return vhost_user_write(dev, &msg, NULL, 0);
>>>>>   }
>>>>> @@ -2548,6 +2561,7 @@ const VhostOps user_ops = {
>>>>>           .vhost_set_features = vhost_user_set_features,
>>>>>           .vhost_get_features = vhost_user_get_features,
>>>>>           .vhost_set_owner = vhost_user_set_owner,
>>>>> +        .vhost_reset_owner = vhost_user_reset_owner,
>>>>>           .vhost_reset_device = vhost_user_reset_device,
>>>>>           .vhost_get_vq_index = vhost_user_get_vq_index,
>>>>>           .vhost_set_vring_enable = vhost_user_set_vring_enable,
>>>>> diff --git a/include/hw/virtio/vhost-backend.h 
>>>>> b/include/hw/virtio/vhost-backend.h
>>>>> index 81bf310..affeeb0 100644
>>>>> --- a/include/hw/virtio/vhost-backend.h
>>>>> +++ b/include/hw/virtio/vhost-backend.h
>>>>> @@ -77,6 +77,7 @@ typedef int (*vhost_get_features_op)(struct 
>>>>> vhost_dev *dev,
>>>>>                                        uint64_t *features);
>>>>>   typedef int (*vhost_set_backend_cap_op)(struct vhost_dev *dev);
>>>>>   typedef int (*vhost_set_owner_op)(struct vhost_dev *dev);
>>>>> +typedef int (*vhost_reset_owner_op)(struct vhost_dev *dev);
>>>>>   typedef int (*vhost_reset_device_op)(struct vhost_dev *dev);
>>>>>   typedef int (*vhost_get_vq_index_op)(struct vhost_dev *dev, int 
>>>>> idx);
>>>>>   typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
>>>>> @@ -150,6 +151,7 @@ typedef struct VhostOps {
>>>>>       vhost_get_features_op vhost_get_features;
>>>>>       vhost_set_backend_cap_op vhost_set_backend_cap;
>>>>>       vhost_set_owner_op vhost_set_owner;
>>>>> +    vhost_reset_owner_op vhost_reset_owner;
>>>>>       vhost_reset_device_op vhost_reset_device;
>>>>>       vhost_get_vq_index_op vhost_get_vq_index;
>>>>>       vhost_set_vring_enable_op vhost_set_vring_enable;
>>>>
>>>>
>>>
>>
>>
>>
>


