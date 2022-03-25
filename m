Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCAA4E7A61
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 20:21:40 +0100 (CET)
Received: from localhost ([::1]:49086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXpVD-0000Lj-2n
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 15:21:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nXpTQ-0006sE-4h
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:19:48 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:1644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nXpTK-0002jH-7m
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 15:19:45 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PHEpxb031408; 
 Fri, 25 Mar 2022 19:19:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=UYRxq4EeZvhESrwroCLsbsMgbgnqgnPs/ivwBL2nStA=;
 b=kg5NxUC5YJxZ0VZ/m/SEim4nMXiH7tpFh+tX36yoLp2/8jlm9ZadXtxZqThVORdDUwQR
 C4zh3yBkpSLrhbTCnPTIT69V1q5cx6ssUXmMa/mq1CL4VTM/h65loXvX57mnAeYu8FH1
 7Ykm7kAOIJl5MARcnsMxIYV6iDDAtvakrDUuMmKFnTXreVx83EVdPmfis+cNG3c6Fi7M
 5aAkIFg1kVNOAGeg9up9nJRXvT/lzmqlVT1BhJ0OynO47au9kpNc6Kqz+jmIaYGIxNG0
 PdPORmu8ySTS000BS+8NiRxEjUPYhFIHsRbqCOPU46peIalDJ4Czb7ydRhOnyYapknrY Eg== 
Received: from aserp3030.oracle.com ([141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew7qtgb0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:19:28 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PJGRbJ013941;
 Fri, 25 Mar 2022 19:19:27 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by aserp3030.oracle.com with ESMTP id 3ew5793uy3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 19:19:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QHcHQtKz1Y4X84bdAZHZotQEGqSBjOVMaw0cM+zRx1bi6sgcbMThQQj1+kORT/kK14Lv8DmRTnldaH8sTcGe0Jezyqs+7czgAWHxpjrHg7B24pBnTOZgHkKikDoKhNL4hq8TtY9d1uzq/ZNczHzmBkp0OnrXVnZax8xBFYPLbeNI9y7/wu2Y+uYtqnpCJBoP923a85vAfoj7KBPNPIKbKaXMTDBPcuAF6kir/wy0PfpepkSn/6VTZgbExEEpPU0/xH+bCmJ+kpmg1rTcf5Q7r2AQMEKodo5+xw0q17cava9Gts+oUP7JpJ7596JxiD7/iVwQZUazpBlmTQYJPACvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYRxq4EeZvhESrwroCLsbsMgbgnqgnPs/ivwBL2nStA=;
 b=Zlz1fG5rFLkzCwWZy/dgDnBBEuSAUOvBZCwhHPYvUN+/QY2KiCvDIzT9/sJjVkMwtaOfbKBQ4E4N6COLKmiAkRE4BQDSEV+cS2g9gk6+zPDAu9hnIN4DqWPvbEkZz6Q3E5H0jzYD631TJ12MB4+NtwhwPGutB6bEKlFjCb53CrSuNRmc9MU7Hm8ZipIh5aztC73AjQkIlK+U6bDOOTdGtE1chp3P27oRem+89AaZ01C0m+xtbfkBIqk38yfo2J7V/V4lTwysTA+D4+d4jeYWzew1pn9iqTiu80TwhFzzO0u1oP8VyXNqeR9u+D27ZiKB7CVPZcHuSdx/5uh3jxWEOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYRxq4EeZvhESrwroCLsbsMgbgnqgnPs/ivwBL2nStA=;
 b=UlSLb4gtgYDyTFEJUx4C4dPKu2zm4ZivHz+rrUslr+RO2zVSNIsXlHL4C0Jz5HIu4Xc5dijE7EWrFJ7XIjBmJA462T01yDIMtdfFy8UpEV2Lcir1he+Gp5Dm/6f9TWYKA+5Tqcv3Rt3wRCMyDMP9NlzVS+bOyhZnfqYdpmHCllw=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by BN6PR10MB1284.namprd10.prod.outlook.com (2603:10b6:404:40::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Fri, 25 Mar
 2022 19:19:25 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 19:19:24 +0000
Message-ID: <147f9a71-4ad8-5fc1-b2c0-4ea7072f3174@oracle.com>
Date: Fri, 25 Mar 2022 12:19:21 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] vdpa: Avoid reset when stop device
Content-Language: en-US
To: Michael Qiu <qiudayu@archeros.com>, Jason Wang <jasowang@redhat.com>,
 08005325@163.com, Eugenio Perez Martin <eperezma@redhat.com>
References: <1648024966-5170-1-git-send-email-08005325@163.com>
 <CACGkMEsjQp+gjHV23ntJ2oTBCdt-1TT0GGn-PFDjOvETz6sQ7A@mail.gmail.com>
 <df7c9a87-b2bd-7758-a6b6-bd834a7336fe@oracle.com>
 <fe13304f-0a18-639e-580d-ce6eb7daecab@archeros.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <fe13304f-0a18-639e-580d-ce6eb7daecab@archeros.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0202.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::27) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dd66e3c-fe45-4957-fe5b-08da0e945f7f
X-MS-TrafficTypeDiagnostic: BN6PR10MB1284:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB1284427E7C025BB2BEE40B87B11A9@BN6PR10MB1284.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gS3ldFFMlyniYiktVY1H0tvPxW79qL6AL28XhIjZvKXRxyt3Gf6QRUfIz2x9alFGpsk5A3MExr8FCOZUhvidbgZApttnQfyQFs/yEW61FFqb25KhqGu3gLKtoTJI3Vk1TBbzqPK+fnxhkfOSkKUSMnB2C8NfqaN2dMZNx73J4tzF8D1IV9ta2C79Va2BH2i/GnpZ1RFOH+tJ9vCz8/H7L5wGE6mdPLZFIDJgvKo7fp1ubj4Vz8a6T1qwtkCRGR9g8LElzeocx0yQVGrMGdTpb/Vo9YTBg4New5nIE1+ixJYaGVU8d2JSTZ2z8KBRuUctMlKSXs1DEG9PawyOSVSvzOCmykET/8HuNsx2l72dMlzD7LvLD0vkjltCB1x6CXXTj7c4yLN16fR+d+j8dMllfz2dXoeSN8CD9DzPYFKqoeVxI18CmcKHzWYVSGejI1xNCCvKSYVzeuQ4WAp3kPmR/yAVBy6gsqDlXRCvSs636N0che3+nzcZT+cZOe3GXiQnpY1D1EXMkZ89H73hWaneA/nr2MKdve5TxoO2j1YpCLmYTgbXlxUV+pUby6vQW8Ru9vUAduzzIm4XFLgYu+x0IzTa4aHZAKl9WUSN/fSb4sYOLdtV55E84RLqPllmzLRaOvAy84eNqxCadMb23fhKboclMP/KZ6EntkbFWz6jzZeZ70ZbGe5OqWlOiBIYgF8ziKN4otPWDycKBz7m2QQ5oQIQrNCllJKHFMPBjbmUMqk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36916002)(6506007)(53546011)(2616005)(6512007)(186003)(508600001)(26005)(83380400001)(4326008)(5660300002)(8936002)(8676002)(6666004)(110136005)(66556008)(66946007)(66476007)(6486002)(54906003)(38100700002)(316002)(31686004)(31696002)(86362001)(36756003)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWQwTGNnSTJmN3MzMU1YT2lya1ROV0JtR0xzSkJnbUEyTTBzdzY3NWxUbDZi?=
 =?utf-8?B?U0prMi8wZ1JCSXJzU3NPdlBMK2U3N3dvNVRKN05WSXJPbXJ2UkFhZjJVd0pP?=
 =?utf-8?B?N1RqR0ZkN0twVk1Uc1d3TUNRNHpMQmx1S09PSTVKTUdDcXpTSjdjb1FFQk0x?=
 =?utf-8?B?Z1VKNFdiREZCOENSQThiTjB1bUFXalNsT29UZDNUM0w3SHcxR21YTS9SUkFR?=
 =?utf-8?B?RmlMUnZqYVU5WEIzczhvaFJic0hSMnJIcGFvZ25hWnBSRW91MkFuUFAyR01W?=
 =?utf-8?B?Q0l2ZktVck5QZkc5TGZEMUQ4Z1cxODRsSHFHVFlxd1VVdmQwK0F4Y1pTemRm?=
 =?utf-8?B?emNpOWE4QU5WQ2ZnMFdrVVVjM2FSeXNyZmhWN0xINVlXNmUzVy9QNlVJQ3F5?=
 =?utf-8?B?cWc5cVF2bzNLaUhyRW1aNnJveDRtemQvczVxejNxUWNSR2NJRHlhREhUQ1dJ?=
 =?utf-8?B?ZzFnOVU5OHhsRFFjK255ZWxCTmljWW5PM1lTRy9lOC8xc2RYZGtndUFZZVdU?=
 =?utf-8?B?ejd2QmJMT05KdnJMc3FDbjB0Q1NGaGRIVkE3WHZPZW5OZ2ZodjRMTjQ2NmFI?=
 =?utf-8?B?ZG9SbTZHQ0cvcUpoY2JzMUk4cVk2Q2VBc1dIUjRFNm5iSHlsZzV5ZW5GZGJo?=
 =?utf-8?B?eE4rUnNHQjNVQUk1WVNqRktUb2p4MVh6c2krSHBwN0NHOHBSWVFtZ09QZEYz?=
 =?utf-8?B?U1B0L0lPUjlUcjBoSzBEMDEyWmVDOXA0TFkyNnZGeHRrR2I3enJ3OTN3R1F5?=
 =?utf-8?B?Q082L1JacnRISjNEU1dBZlJJdUdibnBnRFFsMm9ndXV5V01pMGk0bFVCek8x?=
 =?utf-8?B?OUpQUFpYbW8yZkYxaHIzSmJRblFQNkNucDZMWHVNQVZXdjlVcDhUMlpRRHhj?=
 =?utf-8?B?amg3M2gwUmF0c0tGazdPMEg3dHIwaGxBc2ZPdHBqQ3VPdG5LbDRHUTYxNFZE?=
 =?utf-8?B?TzNPMW12aUxyQ04xUytrK0srbWR4TEpRMWZFT2FCQzlkSGs2bU16SXMrVnNS?=
 =?utf-8?B?TmlwaVlYUkhNb0llRU05Tndoc1p2QnZYQUNkc2NJcWszRUg4bkNDaXVYcFRT?=
 =?utf-8?B?aGFmakEydjlsWXZrbXgzMG85V1hlTlVVTkEyd1dJRmtVOHlNMEhZdytqQTky?=
 =?utf-8?B?bTVxK0NNc0EycGF5OXM1TFZnWERqYjY1ZmRTR25mbHZVVDlTVVB0dld5cTdt?=
 =?utf-8?B?bVhWdkRDYUVacXRxTk9waUF6NTA2a2RtalhHTE1oMzhBd3o0YzlSV2FLeFNS?=
 =?utf-8?B?d0thT0c5bUZ3ek8zKy9OKzgxQkpkK3NzUSt2TnZqQkxkcjVYeDBWZGV4Tnpl?=
 =?utf-8?B?eitXd2VoOFgraDdFSU9JNHpoemZaanlrakFObWxYaG5YSEx4ek43eDhGNThI?=
 =?utf-8?B?Qlh1RDF3V0FQUEdSdUJ4YXNqZUJJTVA0WklmaCtEZUlzNFRVU1d3ZTdIc0Jw?=
 =?utf-8?B?TXEreUQ1NS9yN1ZDQ2Z1Q3hyRDNrY2hVRUxKNmlRYVFtVVhxUno5NVd1SERt?=
 =?utf-8?B?TkdUR3ZDQTU3bEFFTFNFUm5OdkpNRDdKdDR3YWxFWFJwbGR6RXB6bjNDQ2dZ?=
 =?utf-8?B?ZlRrZXB4N21vZzhOT3k5b3R5LzBLWHJTbTY5Lzk3ZDZyeHVzOHlhVG92cDVt?=
 =?utf-8?B?a0FJNkVoUlppTWx3dngyRUpOWUQvNnZyR2FsdVJ0V29WZ1UwMVVGaWc1UDFJ?=
 =?utf-8?B?RUgzanRrUi9rZ3gwc1UrTXBzN241L3dhcHkxUWR1WkJ2NEJIMElsV1hHeExM?=
 =?utf-8?B?QzlWV0JhckZ1bXVrbFR1d2d3MzZEbjRqYkZOM0V1YkNqanZIMXZjSUhwaWI1?=
 =?utf-8?B?eWtIVWFJa0Z6aEN3M0wyUXhxRGJ5eStoRkltL0RrU1pLMjZsVE9ob0J5elgx?=
 =?utf-8?B?YlhYSEg0OG1IdkluKzdSUGRnVGFhQTB3b0lwVDYyZHBrY21mV05Idk40TkZY?=
 =?utf-8?B?aGJtNzdNMldUYmFFbDlNSUJVV0hNSVg2RW5TL2lUb2NxTlZSM2orZ3gzODJ3?=
 =?utf-8?B?QUFMVnhyYXFZVWNibVZSR2VtQk10KzFKbUEvb2I2dFlqWHVCR0owYXVqSVMy?=
 =?utf-8?B?cGtydkhZNjV5UmZWWjNQNHMySHhPN0ZxNjVhZzA2elNSeXAzcGhwMzd6Nkho?=
 =?utf-8?B?MmszaWxPT0dwN3ZRS2dNWkgwUVpEd09YQ0pLdXBuN05jMDU5VjJmSWVQSXZZ?=
 =?utf-8?B?cU0yTk53aWllVVFRUUhYdVU1T3dUK0FFbkdwREhwcnMrMmswNFBNOC9DOVoy?=
 =?utf-8?B?K2w2TGs4eCtWS2lvZmd3ZXcyVzZpUEpyQm03TnI3T1BMdXN6Ylk5Uk5zOWNU?=
 =?utf-8?B?azBhZVVNUG5FQUUrbDU5b2pPamlmZFUvNmhQRk9Jd3N3TVRyV2pYdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd66e3c-fe45-4957-fe5b-08da0e945f7f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 19:19:24.8237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +EKquNhGg5AT4Ga0RPj3/SBVhrAxnpopnwCiycC3eTgYBP76D4/0d/iNJdcnSejpbjM2KpkhWHhWtjNKR9U37A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1284
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203250106
X-Proofpoint-GUID: ZEjHbSYZvYhxyhbYeiCMSsmcKfsDgj5g
X-Proofpoint-ORIG-GUID: ZEjHbSYZvYhxyhbYeiCMSsmcKfsDgj5g
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
Cc: Zhu Lingshan <lingshan.zhu@intel.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cindy Lu <lulu@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/25/2022 2:00 AM, Michael Qiu wrote:
>
>
> On 2022/3/25 14:32, Si-Wei Liu wrote:
>>
>>
>> On 3/23/2022 2:20 AM, Jason Wang wrote:
>>> Adding Eugenio,  and Ling Shan.
>>>
>>> On Wed, Mar 23, 2022 at 4:58 PM <08005325@163.com> wrote:
>>>> From: Michael Qiu <qiudayu@archeros.com>
>>>>
>>>> Currently, when VM poweroff, it will trigger vdpa
>>>> device(such as mlx bluefield2 VF) reset twice, this leads
>>>> to below issue:
>>>>
>>>> vhost VQ 2 ring restore failed: -22: Invalid argument (22)
>>>>
>>>> This because in vhost_dev_stop(), qemu tries to stop the device,
>>>> then stop the queue: vhost_virtqueue_stop().
>>>> In vhost_dev_stop(), it resets the device, which clear some flags
>>>> in low level driver, and the driver finds
>>>> that the VQ is invalied, this is the root cause.
>>>>
>>>> Actually, device reset will be called within func release()
>>>>
>>>> To solve the issue, vdpa should set vring unready, and
>>>> remove reset ops in device stop: vhost_dev_start(hdev, false).
>>> This is an interesting issue. Do you see a real issue except for the
>>> above warnings.
>>>
>>> The reason we "abuse" reset is that we don't have a stop uAPI for
>>> vhost. We plan to add a status bit to stop the whole device in the
>>> virtio spec, but considering it may take a while maybe we can first
>>> introduce a new uAPI/ioctl for that.
>> Yep. What was missing here is a vdpa specific uAPI for per-virtqueue 
>> stop/suspend rather than spec level amendment to stop the whole 
>> device (including both vq and config space). For now we can have vDPA 
>> specific means to control the vq, something vDPA hardware vendor must 
>> support for live migration, e.g. datapath switching to shadow vq. I 
>> believe the spec amendment may follow to define a bit for virtio 
>> feature negotiation later on if needed (FWIW virtio-vdpa already does 
>> set_vq_ready(..., 0) to stop the vq).
>>
>> However, there's a flaw in this patch, see below.
>>>
>>> Note that the stop doesn't just work for virtqueue but others like,
>>> e.g config space. But considering we don't have config interrupt
>>> support right now, we're probably fine.
>>>
>>> Checking the driver, it looks to me only the IFCVF's set_vq_ready() is
>>> problematic, Ling Shan, please have a check. And we probably need a
>>> workaround for vp_vdpa as well.
>>>
>>> Anyhow, this seems to be better than reset. So for 7.1:
>>>
>>> Acked-by: Jason Wang <jasowang@redhat.com>
>>>
>>>> Signed-off-by: Michael Qiu<qiudayu@archeros.com>
>>>> ---
>>>>   hw/virtio/vhost-vdpa.c | 8 ++++----
>>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>> index c5ed7a3..d858b4f 100644
>>>> --- a/hw/virtio/vhost-vdpa.c
>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>> @@ -719,14 +719,14 @@ static int vhost_vdpa_get_vq_index(struct 
>>>> vhost_dev *dev, int idx)
>>>>       return idx;
>>>>   }
>>>>
>>>> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>>>> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, 
>>>> unsigned int ready)
>>>>   {
>>>>       int i;
>>>>       trace_vhost_vdpa_set_vring_ready(dev);
>>>>       for (i = 0; i < dev->nvqs; ++i) {
>>>>           struct vhost_vring_state state = {
>>>>               .index = dev->vq_index + i,
>>>> -            .num = 1,
>>>> +            .num = ready,
>>>>           };
>>>>           vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>>>>       }
>>>> @@ -1088,8 +1088,9 @@ static int vhost_vdpa_dev_start(struct 
>>>> vhost_dev *dev, bool started)
>>>>           if (unlikely(!ok)) {
>>>>               return -1;
>>>>           }
>>>> -        vhost_vdpa_set_vring_ready(dev);
>>>> +        vhost_vdpa_set_vring_ready(dev, 1);
>>>>       } else {
>>>> +        vhost_vdpa_set_vring_ready(dev, 0);
>>>>           ok = vhost_vdpa_svqs_stop(dev);
>>>>           if (unlikely(!ok)) {
>>>>               return -1;
>>>> @@ -1105,7 +1106,6 @@ static int vhost_vdpa_dev_start(struct 
>>>> vhost_dev *dev, bool started)
>>>>           memory_listener_register(&v->listener, 
>>>> &address_space_memory);
>>>>           return vhost_vdpa_add_status(dev, 
>>>> VIRTIO_CONFIG_S_DRIVER_OK);
>>>>       } else {
>>>> -        vhost_vdpa_reset_device(dev);
>> Unfortunately, the reset can't be be removed from here as this code 
>> path usually involves virtio reset or status change for e.g. invoked 
>> via virtio_net_set_status(... , 0). Ideally we should use the 
>> VhostOps.vhost_reset_device() to reset the vhost-vdpa device where 
>> status change is involved after vhost_dev_stop() is done, but this 
>> distinction is not there yet as of today in all of the virtio devices 
>> except vhost_user_scsi.
>>
>
> Actually, we may not care about virtio_net_set_status(... , 0), 
> because in virtio_net_device_unrealize() will finnally call 
> qemu_del_nic(),
The reset is needed because guest can write 0 to the device status 
register to initiate device reset while VM is running, that's a very 
common scenario where virtio_net_set_status(... , 0) has to be invoked. 
Quoting the spec:

-----------------%<-----------------

2.1.2 Device Requirements: Device Status Field
The device MUST initialize device status to 0 upon reset.
...
device_status
The driver writes the device status here (see 2.1). Writing 0 into this 
field resets the device.

-----------------%<-----------------

That being said, remove vhost_vdpa_reset_device() will introduce severe 
regression to vdpa functionality, for e.g. you may see weird error or 
panic once guest is rebooted as the device state may have been messed 
up. As indicated earlier, to fix it in a clean way it would need to 
involve serious code refactoring to all callers of vhost_dev_stop, and 
converting those which require device reset to explicitly call 
VhostOps.vhost_reset_device().

> see below:
>
> qemu_del_nic()
>     -->qemu_cleanup_net_client()
>         -->cleanup/vhost_vdpa_cleanup()
>             -->qemu_close(s->vhost_vdpa.device_fd)
>
> In kernel space, close() action triggered release(),
> release()/vhost_vdpa_release()
>     --> vhost_vdpa_reset()
>
> So it will finnally do vdpa_reset, that's why I said reset will be 
> called twice in current qemu code.

That's a minor problem as nobody cares about the extra reset while guest 
is being shut off.


Regards,
-Siwei
>
> Thanks,
> Michael
>
>> Alternatively we may be able to do something like below, stop the 
>> virtqueue in vhost_vdpa_get_vring_base() in the 
>> vhost_virtqueue_stop() context. Only until the hardware vq is 
>> stopped, svq can stop and unmap then vhost-vdpa would reset the 
>> device status. It kinda works, but not in a perfect way...
>>
>> --- a/hw/virtio/vhost-vdpa.c
>> +++ b/hw/virtio/vhost-vdpa.c
>> @@ -564,14 +564,14 @@ static int vhost_vdpa_get_vq_index(struct 
>> vhost_dev *dev, int idx)
>>       return idx;
>>   }
>>
>> -static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev)
>> +static int vhost_vdpa_set_vring_ready(struct vhost_dev *dev, int 
>> enable)
>>   {
>>       int i;
>>       trace_vhost_vdpa_set_vring_ready(dev);
>>       for (i = 0; i < dev->nvqs; ++i) {
>>           struct vhost_vring_state state = {
>>               .index = dev->vq_index + i,
>> -            .num = 1,
>> +            .num = enable,
>>           };
>>           vhost_vdpa_call(dev, VHOST_VDPA_SET_VRING_ENABLE, &state);
>>       }
>> @@ -641,7 +641,7 @@ static int vhost_vdpa_dev_start(struct vhost_dev 
>> *dev, bool started)
>>
>>       if (started) {
>>           vhost_vdpa_host_notifiers_init(dev);
>> -        vhost_vdpa_set_vring_ready(dev);
>> +        vhost_vdpa_set_vring_ready(dev, 1);
>>       } else {
>>           vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>>       }
>> @@ -708,6 +708,9 @@ static int vhost_vdpa_get_vring_base(struct 
>> vhost_dev *dev,
>>   {
>>       int ret;
>>
>> +    /* Deactivate the queue (best effort) */
>> +    vhost_vdpa_set_vring_ready(dev, 0);
>> +
>>       ret = vhost_vdpa_call(dev, VHOST_GET_VRING_BASE, ring);
>>       trace_vhost_vdpa_get_vring_base(dev, ring->index, ring->num);
>>       return ret;
>> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
>> index 437347a..2e917d8 100644
>> --- a/hw/virtio/vhost.c
>> +++ b/hw/virtio/vhost.c
>> @@ -1832,15 +1832,15 @@ void vhost_dev_stop(struct vhost_dev *hdev, 
>> VirtIODevice *vdev)
>>       /* should only be called after backend is connected */
>>       assert(hdev->vhost_ops);
>>
>> -    if (hdev->vhost_ops->vhost_dev_start) {
>> -        hdev->vhost_ops->vhost_dev_start(hdev, false);
>> -    }
>>       for (i = 0; i < hdev->nvqs; ++i) {
>>           vhost_virtqueue_stop(hdev,
>>                                vdev,
>>                                hdev->vqs + i,
>>                                hdev->vq_index + i);
>>       }
>> +    if (hdev->vhost_ops->vhost_dev_start) {
>> +        hdev->vhost_ops->vhost_dev_start(hdev, false);
>> +    }
>>
>>       if (vhost_dev_has_iommu(hdev)) {
>>           if (hdev->vhost_ops->vhost_set_iotlb_callback) {
>>
>> Regards,
>> -Siwei
>>
>>>>           vhost_vdpa_add_status(dev, VIRTIO_CONFIG_S_ACKNOWLEDGE |
>>>> VIRTIO_CONFIG_S_DRIVER);
>>>>           memory_listener_unregister(&v->listener);
>>>> -- 
>>>> 1.8.3.1
>>>>
>>>
>>
>>
>


