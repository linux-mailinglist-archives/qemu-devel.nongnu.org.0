Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAB74EFD83
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Apr 2022 02:47:22 +0200 (CEST)
Received: from localhost ([::1]:53294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naRvE-0001Qv-QO
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 20:47:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1naRsh-00005h-VG
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 20:44:43 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:25374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1naRsd-0003xe-A8
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 20:44:43 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 231JmYLv014686; 
 Sat, 2 Apr 2022 00:44:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=8JNZq4Fy6NWGd1oCL+e0JWkRVrZsDcjVXuLlVHMi+xE=;
 b=kqhYy49inVz6OiY5gYDr3x6xHI+dcek4GJLjmNc/5pquQk1+TOoTxalxM5TtCsxey/Ub
 mbJvCRTcKii1KsMMTtMb4VhjJnsUdxe253VLrLag9GFiH0YRlQc9waaWEy4BliVcQDFs
 nxJs55VUAj2uF6IZQqVMYXj+tc/5wSE5ifkeIkkmyuAQh7Rlt/kq3mDBE0HRw7RP+Qbf
 bMLF30h5OQmBf32zSu1/owCQB7V9KIXUpngeLrvqE3zGtzhq9Ot9FacS5LhMZpC4zkYF
 PramS5JClzn+f9Nht+uBWK0jnbKHfW2aO1JHh5SPE0NCWdqx7nC/QZ1ZMmqgFVY6J1jb hg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1s8cyusk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 02 Apr 2022 00:44:29 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 2320ghiN036696; Sat, 2 Apr 2022 00:44:29 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2101.outbound.protection.outlook.com [104.47.58.101])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f1s99g9ar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 02 Apr 2022 00:44:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vsum3G3R1gI3Bk4z83FHyVNORhxQ5lY4j19A12Y9M78JSbmnqKBlLO5CxVf0NMct4ogYuQHwQ0rAKIMYqy7igqKJSLuGRn2Mb9J5a9Sg3YmdMDEECVhGULVJNozw8oTILqEDUQtvp0El73hz6aIK/IzwrT96/tyshljkxZ+XYl/N/ue3xU1VFt/i4rM1mDAmcE7mysWGCHKLyJqu26Ov3JcblFq0cB0tE+Z7BpRULCdqioA67YJyoKF5FIXr7zYU+zOZFIRb0Gz0XNxId4A2tgAG3oXXEylHFXpAR73qGerRO/V9iO4aFzj3aJr9wzQGMTzpbeWfzm81Hxob3Fb/vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JNZq4Fy6NWGd1oCL+e0JWkRVrZsDcjVXuLlVHMi+xE=;
 b=YFQmnv2vUDwLFdbnrbjzrw/uKeI7/o6F1WHmb8yGZgU0G3t1ysKxxlenXvZsce315CMQhRB7EhqVELdZ2MRxcVnhGsVB7XCfC0W25UGNSeJqzTjpAQoilV1ewRltRfTRYHvPrO5A4EhaOH0NRK6j+4KlKLWOmuvDC7nu3aX7GmztJXOfhPkOawXyvHPUdn5femYYmsvxITJloRtithOcv5jooo6iOKy6Me/gCG4or7wLicfinma3LCHeFQfOyLrXEUwLEtp4FRfv/6kTTkXW1g5Dc699YtvNeiI6a2xG6gwQKTRsEwlR+hdUDes96Kodh994OXaYf+b+hWK6xhAnhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JNZq4Fy6NWGd1oCL+e0JWkRVrZsDcjVXuLlVHMi+xE=;
 b=T1MbhPamHp5fBFyjj8SHoTxoD/C519dAiaBsBoENdJtk8HyU0AOR/P1sDWmwSIM48OuNH+C5HUKcUmSK/fevZL0eF8+cl/pEXgfQd4/Pl9y6oXlq27VcIL6RL2QP325Y9gh2zzb7iSGm0cuatLe5IxIIQudyFF+87gc0uGgJdQQ=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by PH0PR10MB4806.namprd10.prod.outlook.com (2603:10b6:510:3a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.26; Sat, 2 Apr
 2022 00:44:27 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::9d4f:2df4:8bd8:f468]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::9d4f:2df4:8bd8:f468%3]) with mapi id 15.20.5123.023; Sat, 2 Apr 2022
 00:44:26 +0000
Message-ID: <28d7c13f-44f3-c8d2-d8d8-1c70a723e159@oracle.com>
Date: Fri, 1 Apr 2022 17:44:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] vhost: Refactor vhost_reset_device() in VhostOps
Content-Language: en-US
To: Michael Qiu <qiudayu@archeros.com>, jasowang@redhat.com, mst@redhat.com
References: <1648776683-23739-1-git-send-email-qiudayu@archeros.com>
 <1648811173-15293-1-git-send-email-qiudayu@archeros.com>
 <1648811173-15293-2-git-send-email-qiudayu@archeros.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <1648811173-15293-2-git-send-email-qiudayu@archeros.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0196.namprd05.prod.outlook.com
 (2603:10b6:a03:330::21) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1de08d2-0691-4728-0880-08da1441f083
X-MS-TrafficTypeDiagnostic: PH0PR10MB4806:EE_
X-Microsoft-Antispam-PRVS: <PH0PR10MB48064629059CA512C81435B1B1E39@PH0PR10MB4806.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p60lKLGzY0CkKB78uCyIAQtKV0k7uaUcHxxjTYSQ4L7VEMgHt+p+g717fVTNC/SHZXJQd7By4cMOiecc9lEKV0eKXxIXXe66rUqCDGEjvtWffQnjUHzga8SMcLVVwAuLhq79p0ma0PelBy42T3XGvmPi9oVNd4lVWqAh0ojLJZgrf6PQ3ge4ZGMbjSA7SZ5oPOtVyyLkdhtbJykoIQEXLxCm1iOgdhLpC5jRmt54RcRGJFQwNzF40zQOHhbIlaz052ikpkBwWkGSV+2NqlgmyXlmZFd2/BDpXxj+G5Wun6B8suctF+kdF3oq463PYea0bnIsVzdtPDmVO3mFo5IqgHeFsdRcmAXWZ/MBjDlb4yqjDmWxti3xzpf7ZjBVVzwSLjs8iSewN3d3fs8pxhO4GC9u1nl96m1aze8Q3YRMYhcO7OwoDz42Fk4Wz/ZWuwaLfQY/D24njM4Ey0eGm00TgVhp8BukSQ/DR5KdCRJjJutumy3n3O7i8IlR8zSLCgwjTI6+7zeQxtGnod1BxF2fLEjG6TMgQedMJ+DULtrhbJ5npiL2O0Mn+C9vtwCX9Xsen5dbDrGP7t15zxY1yMjuCzBhWvgUR5NgMUkV8aSrJhO/JWgVAgJEJIhgMLkMTSTikarDhYudRZpRGI7f7NdEBj5NNKVbNSry48b3zdp5aAm29/jBhsxzigyeiYj80FO+2NTNuJLSnOITeTKwRARgj6JiGVb7xwIPv4FrLG1vt6147ARw+2qrnknNqffSwXwz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(31686004)(31696002)(2906002)(6512007)(8936002)(36916002)(2616005)(53546011)(6506007)(38100700002)(5660300002)(86362001)(66476007)(4326008)(6666004)(66556008)(26005)(66946007)(186003)(83380400001)(8676002)(316002)(6486002)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?enRsYXIySkp0dWd3YTlPb1ZIODkrMWlxMWNScmVndEg3S2Q4RU15cGtWL2hY?=
 =?utf-8?B?dDVYYXRtaGF4VzBoYjd1NElCbGlIcW1QaFkwL3ltYU8zZEljUU9OOC9oLzFu?=
 =?utf-8?B?MldpOTZobXFOcUhYeS9xcEswem1jU3ZOUWVpVEdUSUhoaGNoT0wxOFVnMnJy?=
 =?utf-8?B?bjlHSXhlY1VHQWlaLzA2YUJFYW5wTy93ckxENk1MdmJJUHJoUmFKa2s1WDdn?=
 =?utf-8?B?MlZzbklJTzlFR3lIbFYrOVRKU1BzYlRZalJUYUY0ZTRCSW83UThCazdyNXYy?=
 =?utf-8?B?QnhPb2I1MHNHcXduOFFkenRGYTg3UXNYZHBUbWh2OWVYSnlMYTNicFFqeUhU?=
 =?utf-8?B?MEZqUThLblp2ZkN1c3pHaDhkUjViWEtvNWxCSUd1RHRhY1FiUmVLZHBrblVo?=
 =?utf-8?B?SmFZMEtUODF1THRRMks5U3Ivd0N6WVdMbFd0MnVXTUZhN3NRZ0NJUy80a01R?=
 =?utf-8?B?elp6RVY4NWhWTS9WSCtyR284eGRsTFVYVjhTMnhBWS9Hd25RdVpqYUYzMmxG?=
 =?utf-8?B?bUFRSUJ2NzlWODRPUWRNaDZmZGo3WG9HTTJROHdrUlJvRVYyR1JJQndnZjJa?=
 =?utf-8?B?czJMSmhLQXZLQS8yRGM5Mmk1c0hDOHYzcTRaL1M1MVc2V2Nmb2czdVVYR0ly?=
 =?utf-8?B?R05QdzV4eEpEVElhOFBPZEFoKyt6d3ZWVmE1b1dkV2JBSXVYZFVuZ3ZyWlkz?=
 =?utf-8?B?K1dHc28vWUl3WjNGUUFzR2lqUTcydmx6VEVlRzdZMU11MUx6TGlnQnFma3dS?=
 =?utf-8?B?VVhDNUpPajkwMC9hM2NteEJqcU05M3F2QVcwbU9XR1NWWDdaQWl4WVpqQjd0?=
 =?utf-8?B?RXVqVDJWL3NTcm16VjNjdHFmV0tFaklDelJramNDa1VaLzgxNm5KQkx0dnNw?=
 =?utf-8?B?dVhwY2NuRm1DWlYzY1hWcGRKSy95MGMyOE41blhkTUJpU0daWTJON0s4YTJF?=
 =?utf-8?B?VjdvL044b3pmRHN3V1ZqY3NlaDFzQlJnOE1UNXlTemNRZXBJa293OW8zblpE?=
 =?utf-8?B?ZHBCMkYzVG1qMWI1WFpGQStyWm02dFBYdXBZcnhmOXdZZENHNHlHYjNydW5H?=
 =?utf-8?B?Y1FGUnVkN3hFem1QT2tRbGRRVGQrNERFcUloT2Y5SmdaVUhJeS9sTFJsWk13?=
 =?utf-8?B?VGhZdys1cUEwcWtqUkNSS054WWhnRmlVQWhlSDFBRE5DdUJvdm01OGdlNlhz?=
 =?utf-8?B?UFpNTVJhQnc3T2w0WjYrRDl3SnVCMnNCS0pwRytNODJSSHEyM3F1Ymg3elhY?=
 =?utf-8?B?VFBWRWdLVXE4SkNKK0xUUWRwd2NMZElENUU2K1VlL3lQVnlva25MV3FTVEdO?=
 =?utf-8?B?RUh3TlRoRUhXWERBRUVoYkh1NVd4ZEYyMW14RzlJc3hJMWZYdS83SVlROHBD?=
 =?utf-8?B?S29TbWg2UDJZbGM3WFM3TkxZc2xWWGdjWkxaQTBWdFZZK2p6LzJTcnpWc1hz?=
 =?utf-8?B?VlNIOXpQVmVFc0FzaFlYMm5kUlBuODhvNWNBZ3o5NDhDWmFVNit1NVIzZ1lJ?=
 =?utf-8?B?VzlYVUg0UXdPNk4vcEplQW9PY2plTUhUdVVqQlkyeDlNenIwM01oeTFxMksv?=
 =?utf-8?B?YjBTRWZsSjhrd3pJTjhranBnREpBanBqOVV5R3ZIZEZUeTUzTWVJQ1JQWHlp?=
 =?utf-8?B?VUFtckNFWmNLdlNkS05iS1owNkRjSEVpdG83ZWNrMFFZZ2Y5M1hjVjJDN1Ey?=
 =?utf-8?B?VUJJMEVHUlBnaFBBVm12U0Y0SHNQYUI0YURKQmwzMllCYzNpNjROdGF0Ujgw?=
 =?utf-8?B?b1RWZXdzWGRaaDlqckdLUGlCS09meTRpSkpVVDZDM2x3VXh5VndncG5DZW5M?=
 =?utf-8?B?ZjdId2FIQkdDQzdWU2hiMmNDTlFYYTFRMi84V3hGaURoY0lzOUZoSUVGdERK?=
 =?utf-8?B?ckhWUFQ2OXBnMHI3U2hsY3NVVGFqMFI0YW9zZFhmZW9DbTdOKzRpQ0g3cUY4?=
 =?utf-8?B?UFJsVnp2bCtHT0RGWURtZFZNQ0RRaXVYQjA4TjVoNzJ4MjVMWnBTTTltNEpO?=
 =?utf-8?B?Rm9tQ2dGcjdINC81TWtYMjMzclpicG8rdHdmMmlCSmh0OXFKU1pXV0pNR1Rq?=
 =?utf-8?B?SnlwTnNmZUJyU2I4cUpSRHRZRm1CRVAwNit6bWpkRnVJaTVGYUg0RUJzWlNp?=
 =?utf-8?B?ZlpMcDdHZ3hKSFRhMHFlcVVSRkpMS01YOHFlVWRtRGtOMno5STFPUmFtUkdY?=
 =?utf-8?B?S0FLWFREVUxUMmh3UWZWalhEZG4vZTY4MXMwWklramluMFlCSjBsVnhSeGQz?=
 =?utf-8?B?bXdXTWVFVkVGUVFxaVB5YWpRajEyaG1DOThvQy9QN3R5S1JEdkZuVUF6dHRr?=
 =?utf-8?B?YmRDK3BTTldySW8vbzdKWWJhcUVteWpzWmRXZEFwNER5TjlUVml5ajJ6dy9n?=
 =?utf-8?Q?VgE4Il542G5M9NaE=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1de08d2-0691-4728-0880-08da1441f083
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2022 00:44:26.8301 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3GAaOQPbPjsYEsHUhnvmCWUXITkkkJlJrS39QD9hAlrX16L461vQUelhHBkJSCsXpFlX+93CO5zrKHMrP+b5ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4806
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-04-01_08:2022-03-30,
 2022-04-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204020001
X-Proofpoint-GUID: dR956fhoLvCMaUqeBtka7dmohNNtzfbs
X-Proofpoint-ORIG-GUID: dR956fhoLvCMaUqeBtka7dmohNNtzfbs
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
Cc: eperezma@redhat.com, lingshan.zhu@intel.com, qemu-devel@nongnu.org,
 lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/1/2022 4:06 AM, Michael Qiu wrote:
> Currently in vhost framwork, vhost_reset_device() is misnamed.
> Actually, it should be vhost_reset_owner().
>
> In vhost user, it make compatible with reset device ops, but
> vhost kernel does not compatible with it, for vhost vdpa, it
> only implement reset device action.
>
> So we need seperate the function into vhost_reset_owner() and
> vhost_reset_device(). So that different backend could use the
> correct function.
>
> Signde-off-by: Michael Qiu <qiudayu@archeros.com>
> ---
>   hw/scsi/vhost-user-scsi.c         |  6 +++++-
>   hw/virtio/vhost-backend.c         |  4 ++--
>   hw/virtio/vhost-user.c            | 22 ++++++++++++++++++----
>   include/hw/virtio/vhost-backend.h |  2 ++
>   4 files changed, 27 insertions(+), 7 deletions(-)
>
> diff --git a/hw/scsi/vhost-user-scsi.c b/hw/scsi/vhost-user-scsi.c
> index 1b2f7ee..f179626 100644
> --- a/hw/scsi/vhost-user-scsi.c
> +++ b/hw/scsi/vhost-user-scsi.c
> @@ -80,8 +80,12 @@ static void vhost_user_scsi_reset(VirtIODevice *vdev)
>           return;
>       }
>   
> -    if (dev->vhost_ops->vhost_reset_device) {
> +    if (virtio_has_feature(dev->protocol_features,
> +                           VHOST_USER_PROTOCOL_F_RESET_DEVICE) &&
This line change is not needed. VHOST_USER_PROTOCOL_F_RESET_DEVICE is 
guaranteed to be available if getting here.
> +                           dev->vhost_ops->vhost_reset_device) {
>           dev->vhost_ops->vhost_reset_device(dev);
> +    } else if (dev->vhost_ops->vhost_reset_owner) {
> +        dev->vhost_ops->vhost_reset_owner(dev);
Nope, drop these two lines. The caller of vhost_user_scsi_reset() 
doesn't expect vhost_reset_owner to be called in case vhost_reset_device 
is not implemented.

>       }
>   }
>   
> diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
> index e409a86..abbaa8b 100644
> --- a/hw/virtio/vhost-backend.c
> +++ b/hw/virtio/vhost-backend.c
> @@ -191,7 +191,7 @@ static int vhost_kernel_set_owner(struct vhost_dev *dev)
>       return vhost_kernel_call(dev, VHOST_SET_OWNER, NULL);
>   }
>   
> -static int vhost_kernel_reset_device(struct vhost_dev *dev)
> +static int vhost_kernel_reset_owner(struct vhost_dev *dev)
>   {
>       return vhost_kernel_call(dev, VHOST_RESET_OWNER, NULL);
>   }
> @@ -317,7 +317,7 @@ const VhostOps kernel_ops = {
>           .vhost_get_features = vhost_kernel_get_features,
>           .vhost_set_backend_cap = vhost_kernel_set_backend_cap,
>           .vhost_set_owner = vhost_kernel_set_owner,
> -        .vhost_reset_device = vhost_kernel_reset_device,
> +        .vhost_reset_owner = vhost_kernel_reset_owner,
>           .vhost_get_vq_index = vhost_kernel_get_vq_index,
>   #ifdef CONFIG_VHOST_VSOCK
>           .vhost_vsock_set_guest_cid = vhost_kernel_vsock_set_guest_cid,
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 6abbc9d..4412008 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -1475,16 +1475,29 @@ static int vhost_user_get_max_memslots(struct vhost_dev *dev,
>       return 0;
>   }
>   
> +static int vhost_user_reset_owner(struct vhost_dev *dev)
> +{
> +    VhostUserMsg msg = {
> +        .hdr.request = VHOST_USER_RESET_OWNER,
> +        .hdr.flags = VHOST_USER_VERSION,
> +    };
> +
> +    return vhost_user_write(dev, &msg, NULL, 0);
> +}
> +
>   static int vhost_user_reset_device(struct vhost_dev *dev)
>   {
>       VhostUserMsg msg = {
> +        .hdr.request = VHOST_USER_RESET_DEVICE,
>           .hdr.flags = VHOST_USER_VERSION,
>       };
>   
> -    msg.hdr.request = virtio_has_feature(dev->protocol_features,
> -                                         VHOST_USER_PROTOCOL_F_RESET_DEVICE)
> -        ? VHOST_USER_RESET_DEVICE
> -        : VHOST_USER_RESET_OWNER;
> +    /* Caller must ensure the backend has VHOST_USER_PROTOCOL_F_RESET_DEVICE
> +     * support */
> +    if (!virtio_has_feature(dev->protocol_features,
> +                       VHOST_USER_PROTOCOL_F_RESET_DEVICE)) {
> +        return -EPERM;
> +    }
I think we can safely remove this check, since the caller already 
guarantees VHOST_USER_PROTOCOL_F_RESET_DEVICE is around as what your 
comment mentions.

The previous branch condition is to reuse the vhost_reset_device op for 
two different ends, but there's no actual user for 
VHOST_USER_RESET_OWNER historically.

Thanks,
-Siwei

>   
>       return vhost_user_write(dev, &msg, NULL, 0);
>   }
> @@ -2548,6 +2561,7 @@ const VhostOps user_ops = {
>           .vhost_set_features = vhost_user_set_features,
>           .vhost_get_features = vhost_user_get_features,
>           .vhost_set_owner = vhost_user_set_owner,
> +        .vhost_reset_owner = vhost_user_reset_owner,
>           .vhost_reset_device = vhost_user_reset_device,
>           .vhost_get_vq_index = vhost_user_get_vq_index,
>           .vhost_set_vring_enable = vhost_user_set_vring_enable,
> diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
> index 81bf310..affeeb0 100644
> --- a/include/hw/virtio/vhost-backend.h
> +++ b/include/hw/virtio/vhost-backend.h
> @@ -77,6 +77,7 @@ typedef int (*vhost_get_features_op)(struct vhost_dev *dev,
>                                        uint64_t *features);
>   typedef int (*vhost_set_backend_cap_op)(struct vhost_dev *dev);
>   typedef int (*vhost_set_owner_op)(struct vhost_dev *dev);
> +typedef int (*vhost_reset_owner_op)(struct vhost_dev *dev);
>   typedef int (*vhost_reset_device_op)(struct vhost_dev *dev);
>   typedef int (*vhost_get_vq_index_op)(struct vhost_dev *dev, int idx);
>   typedef int (*vhost_set_vring_enable_op)(struct vhost_dev *dev,
> @@ -150,6 +151,7 @@ typedef struct VhostOps {
>       vhost_get_features_op vhost_get_features;
>       vhost_set_backend_cap_op vhost_set_backend_cap;
>       vhost_set_owner_op vhost_set_owner;
> +    vhost_reset_owner_op vhost_reset_owner;
>       vhost_reset_device_op vhost_reset_device;
>       vhost_get_vq_index_op vhost_get_vq_index;
>       vhost_set_vring_enable_op vhost_set_vring_enable;


