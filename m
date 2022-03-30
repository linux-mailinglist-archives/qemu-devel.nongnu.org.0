Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8334EC9D4
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 18:44:05 +0200 (CEST)
Received: from localhost ([::1]:49414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZbQS-0006Je-2G
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 12:44:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZbNc-0004VR-3B
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:41:09 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:46074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZbNU-000335-AG
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 12:41:06 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UF8BAZ032372; 
 Wed, 30 Mar 2022 16:40:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=QnlTBkmLJ6ydrQM3fcrYFIvEGq6btu89NNZ8IUVWxGk=;
 b=DWE30IrqOcPT5toEpm9bHo8X5MQeOFqkuhuLSe4GHYKeVju0LDykjXZe9sdeGVak53LM
 dEWbvTMtGVZ/UQXlAFnT1EoNaQtDLd5+YCcrryaCF9oYos21Gx7W1jgxSYYKsc5yFVtu
 3vhWeQESbraKMge3h4LG4DF7jWZvdK7LdR4ISatvn+wuLA191eiCUQdjkG+xqatXSbn6
 PqrP5AGMQpAeSXp2LFK4DafzaafT9B9eDLOKv/bve5Fb1tUznCgrfR+ZTCPa+otSNEa3
 HtzgUXXB2CEbGBvo3XC1X2hoq2PoIgj8bHLkAeY6ViXCn4OchLMgUqjft6nwTzK50FII ng== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1uctt81h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 16:40:55 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 22UGVUW4039557; Wed, 30 Mar 2022 16:40:54 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2168.outbound.protection.outlook.com [104.47.73.168])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3f1s93t8t0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 16:40:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5LRprwayFIT+a3OWK7q2D/xyUXipGOTrvUeWNYe1YLZ534VUuLVFaNRw2QnZEbOiqe1B+wznlqIRvKGIVloW0h3uUf3lncKG/ejSIwQZr+SlaVj7SXp2CVi3Clt/QYt+pESbS2EJvug+pDsW/n8GyKtLcOnakMDOIG/uM+EvJ50ZajA38c2Inz2x1i8QYyXa2+y+Nc/RleBhI45CUmQ+a5vC0q7DlW2Yj043xk+eVtpIE3NeH6BQr3PQY1m4fH72LXAit7Vz2oyHfG2XlVfjm9PumfGNLQyZ9Oo8TxNKQm22UrNkfi1UnWCJWJ8xLeKsWJhV0BIV2f2jojyve7h2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnlTBkmLJ6ydrQM3fcrYFIvEGq6btu89NNZ8IUVWxGk=;
 b=Uz9SDO6+9gWvum3nYhRnuJo/tGPKvXa8JQD4wQ3QEhTTTW0bJpXpZhM0LUXmKyhvH9MgWCB4nA+w882FpT45YV32AO/sacK3j/DrRpL4+0v4DpFKVbPNRMNZXOApavaMlweLm19jfp+81rHnihcJ15Q0Ce78OnRCsi1fKrAAtOitbJ8Gpq9ohPROJRMLflwlC9RAZ5g4G0+1K/kZTq3gIC4f3CNFtmWZMoFH6jECf4I9lVCM9ijrnNcnY3jCACwL2MjAzjI+qGN2qx2F3+9y8//TjzywAp+RCPx7CId6sSZO0MXMCB9NBbklyoYW+9g5DRVwuppaz15g5J5MnvKcmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnlTBkmLJ6ydrQM3fcrYFIvEGq6btu89NNZ8IUVWxGk=;
 b=t+Gcdzf0UILtJpLWq1ia4xTgwUI30I4GCDhwjw+95IlYz3/DKW2ydSQJ2Go0j9DI54xaUj6UOnscJyZjZZgzEiLMh9UGO9AAJatabrN+DkqwSoIqFKvGAzjwCG/thfCo6iX78inSrCSdzKcHj/zimHgwOts+qK+/MFcrQHUGuNg=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by BN8PR10MB3730.namprd10.prod.outlook.com (2603:10b6:408:b6::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.18; Wed, 30 Mar
 2022 16:40:52 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 16:40:52 +0000
Message-ID: <4f2acb7a-d436-9d97-80b1-3308c1b396b5@oracle.com>
Date: Wed, 30 Mar 2022 09:40:46 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 4/7] virtio: don't read pending event on host notifier if
 disabled
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-5-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEt=Bs7XPWQaMOQB5iBece1CH9HJZ69YEF_m-e2Tj95qDg@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEt=Bs7XPWQaMOQB5iBece1CH9HJZ69YEF_m-e2Tj95qDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9P221CA0026.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::31) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f049b3e5-f8ae-4ad6-46b7-08da126c0d43
X-MS-TrafficTypeDiagnostic: BN8PR10MB3730:EE_
X-Microsoft-Antispam-PRVS: <BN8PR10MB373004B45EBA349EBE0F8C87B11F9@BN8PR10MB3730.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dO1YwhiR/wMIo4kTFskAxmEQX8ed5mo2nhFHl9rN2pBiwcNkA+6QcPh45hPx1YNIDpaD31kuwBJCBvFfV9u+BU0yGGlw+Ed1OanMBTzyo/yuJixXa4cLskyBUAb1dw/eVPbJ908TpupEvbON6L1MO2I0DDHR1qjS54/XVNGFanpDfiCwKS0+QW3c2SaLURr64Rgagfp4eyP52OLEDO2EHyU/6DoER69LLKZ//eHzTuUauWvMXRRGuAx9sDfuKX/wJispWg8iC+rI01qhFbvxHpM/PLlA9ZV5kSdlJcfafEh/qkZWAbVg9VyEFwzYEUnvOcP00TDCEIEcHbO9Pds8VCuDMmAHEYwIGBSQroOrZhV1F0eknWew6B1bR37D0JnoboJ2EIZ1ly4r18wdlCftdSEm+VIOCn8IwgTJ8KPf6k69UdjNMHPbpMpKBF5+8rsXE8/wVlsCqwzZEhcU34Hi5oexXo+N9jDlnHfboH8x7Zv+LMnG1gcl2LdFKT7VsuHymQrljddYjkkC768EV1vBd04l9jzNKIx2a3J3oE3WHYSSPXYGz/9Kp/zoVL7Xfrx80Z4FSOFsmtUDeTx8r48ATJnUJT/r/dF2gzyYALNybT8IfP4bwLjPlj1ux4fPzQWMlpcN739kEnSz8MjmXzFp8O46iHqQW4tGE/Oo166fg6qRdpZZ+gBgl8Qh9zNZQ0+yVy2iKwgwAF3Me1KY52yQIcz3QF0xQaca3tjOAgsOjSz7iCeWfuJdhS3gFPG1AWU3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36916002)(6506007)(53546011)(38100700002)(2616005)(6666004)(6486002)(2906002)(6512007)(66476007)(4326008)(8676002)(66556008)(66946007)(26005)(54906003)(31696002)(31686004)(83380400001)(508600001)(86362001)(186003)(36756003)(6916009)(316002)(5660300002)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzNuS2dDaWM0L2gwN3RvUzlYenVOaDdOTEt6dVVLZ2lVa0V6WGZVUjhwMDZq?=
 =?utf-8?B?VE4zak9SZGw3V3FQdllLU3F5bUhvMmY1ck1FRzgvYWJmc0dnMnNzT2RWbzNy?=
 =?utf-8?B?cjc4SDRJZWloUWtIUE1rUUw0MXFEQTFuR0E5QmlhOWtUY281UFZDV2xma3dP?=
 =?utf-8?B?OGtneHhES3VYaGJPR0ttK21zQ2E2cXJtbTVvQy8ydDVnbWJJMEVUU3ROUHNM?=
 =?utf-8?B?RXVhRnFma0R1dm84QldvNkhxb01POW1vbWhMMy9RdjRVWXFpVENiSGtZNzlv?=
 =?utf-8?B?SGppZWZkNWx5NTFYeE5PZW5vUU52ZTNkZTMwSERnK0huMXpldTZaYU1aNzdZ?=
 =?utf-8?B?dFNKUWo2UzNJNHhsR28xSkUzVks1K01GS09ITVpzQm93Y1RWTldnREE0Vjh2?=
 =?utf-8?B?c3pVVERIZ2xPbTRvRmVSYzlKQVR6UFRoTEM1TkJBN21vVzFwTUZ1VnZhZU9W?=
 =?utf-8?B?cVoyWHA5cjR2bzBGeXJsbFc1ek9sWUhNZTF4NE55L0ZrOHp5T0dsb0N4SVIw?=
 =?utf-8?B?aHAvK3RITDA2SVpmTGZWQmVQUi9pdVpaenpkbC8vREo5ZzdUbGZTVGJXZnNB?=
 =?utf-8?B?aHZQalNRbEdCa3c3dXZsUkp0QlU0Y0VvenNCeHhUTXRTTlFRVm5TUDdHS1A2?=
 =?utf-8?B?TTE5V3ZzNDMzazZ4VG40bnRFLzVURGw2MnJ0VHE0aEtjbVVyNkFtMldDemlK?=
 =?utf-8?B?Z1VyQVl5OGJYMkpiY0JoWGlIRk8waERnWEtWY1RnV1dmMkdBRUtEOFhza3BP?=
 =?utf-8?B?UEk4NGxWNXNtak9BSXoxU0FpOGNxaFRqbzVUZlVnRWpBaWptenNLeHhSdlFD?=
 =?utf-8?B?cktLc1RiODBBUzJwRFh2Tmh1a3lTVVVOL0h1WGhGczZvWEdxYTdLaml0WGo4?=
 =?utf-8?B?NTFKSDRCYjYzWmtNUkp3cnlsTFdXMlFYeHJCYVNSUHZ1OVBLTzRVQWgzdVpH?=
 =?utf-8?B?Q0RKQVIyNXNJU2g4OW1pRUFsZVdFYzVNYWRvS2M0MXkzTWZ1T0wvazN3MENu?=
 =?utf-8?B?aWNkRlJiekNFTkpwL1cyc1lMcENvUnN4ekhsTTIxdnBTVmh1MEsweVZ0ek1X?=
 =?utf-8?B?K0lWL2IwRzlHc1JRQm1aR0U2SXBESndZeXNwMDhwUTllVUIvRTBGb1lTYjh2?=
 =?utf-8?B?Z0lZdnNhcmFvTzcyTkFmMWVCeG9KWFo5M0hRdndQU0g3WlhFM3ZZd2RhL0U3?=
 =?utf-8?B?UE1YSHowaWt0L1VTQS9TWnVlWWdYZW5XRkxxdk1oSU9PWjFQZzNMYW14d0ow?=
 =?utf-8?B?UjZPS21BUlFIbXp0WXNoWTBUU1paSFhUVFlxb2g1NFFWOTQrbW5CVGo4bEZV?=
 =?utf-8?B?K2pXWU1qWEt2VlR5STgra1BmYWdBTjZleGNUbE5tbWU4ek85NXp4NEFXaFpM?=
 =?utf-8?B?TkdmQjd5bFF1ckFvMDNMWFc4VTBFYTBVandDVHAxOGNSS0xJT0VrOWJCTjYx?=
 =?utf-8?B?L3BqYVFHemNDOWpmUVpsR2EzT1JRY21JOGJzQzc2dTZHZXNtRk93L2xXWllp?=
 =?utf-8?B?OHY3MjQ5dkZmVmxSMEJra2VsRzJJUWVzN2NPWnJucmMzWlBxOHZNN2JlMmM5?=
 =?utf-8?B?cE1OZW00ZW51ZE95OFB3ZlBjUlVXL2dYaHNpamE0RUZlTnVQUzFsSy9QVFRS?=
 =?utf-8?B?ZGI1M1RaSzI4Ky9QcVBHeEQ2cHVLT3RWa3ZoOUhVMzZENy91a2w4bWozcHR5?=
 =?utf-8?B?cEgxVmZDdnNqY3RVUGc1K1dmT05FMm1TTEVWOVFzdTQ3dUdRaFluK0NaWXFh?=
 =?utf-8?B?UTJpVjVyL28waFFUSmN4QkNyMHllVk1jU3pCeUlKaHZ3VzhGV1c3eFlSdk4x?=
 =?utf-8?B?QkxhU2NETE80cVRGNUJ0UHJmLzMzb00yQVZlQTZTWGtLV21FSjRIei9BR3Iw?=
 =?utf-8?B?dDhBdkl1QUNuRWhuQkp4VnFJeTNPNlAvL1JVVGM1ZjgzN28wbWdyVjh4dllX?=
 =?utf-8?B?S3ptUzgzdFVjY1hzSWswNnd3SUxTeXBGVFprTlRNNkFJZGxwMmhEaWZmZWg1?=
 =?utf-8?B?MmV4WHV0bFc2NmhQTHc0VUJiZWsvdm95ZmV5eTZ5NXdMd1U0a0ttRUVsU0Fp?=
 =?utf-8?B?TTRxRVJMT0xCeGl3NVFtbGJLNjlQNHd5NDNmN2FJeGN1WUttVWtFdVgrN2pW?=
 =?utf-8?B?cU4wbm14bmR4TXdxcDJCYU8xc2ZjWHZqV0Q1eXA5K2Z1RDBHVDJEWGVqSVNu?=
 =?utf-8?B?Qk0vajl2ZUhCUS9VL0RDb2h4QjNQWE5zRkgwaW0xb0pvcEpkdU1RU1p2WGor?=
 =?utf-8?B?ME9nNFkza0czV0Nla0pNaVB3RzcweS9yS3BCNlJ5TDhTSG5hUUx2UHc2OGFj?=
 =?utf-8?B?Si8wS2xlWXNpU0NUQkdkVGpqRHNhR244aXkxLzR1T2w4dkZieCs0eXZIQ2Uv?=
 =?utf-8?Q?QdXt7VkxyA6H8sXU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f049b3e5-f8ae-4ad6-46b7-08da126c0d43
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 16:40:51.8845 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rrcU/yMGo4za2gR2rrrk5XnC8YTL5GpPsMUhmsdvTSUeyo667hvjc4DWIIkSlrIbXdDUrQlniHzCSrsGgs+v4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR10MB3730
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-03-30_06:2022-03-29,
 2022-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 mlxlogscore=999
 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300081
X-Proofpoint-ORIG-GUID: HlKMq7iVezbVrjI5xmO1PDobv1AYNJCA
X-Proofpoint-GUID: HlKMq7iVezbVrjI5xmO1PDobv1AYNJCA
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



On 3/30/2022 2:14 AM, Jason Wang wrote:
> On Wed, Mar 30, 2022 at 2:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>> Previous commit prevents vhost-user and vhost-vdpa from using
>> userland vq handler via disable_ioeventfd_handler. The same
>> needs to be done for host notifier cleanup too, as the
>> virtio_queue_host_notifier_read handler still tends to read
>> pending event left behind on ioeventfd and attempts to handle
>> outstanding kicks from QEMU userland vq.
>>
>> If vq handler is not disabled on cleanup, it may lead to sigsegv
>> with recursive virtio_net_set_status call on the control vq:
>>
>> 0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
>> 1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
>> 2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
>> 3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
>> 4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
>> 5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
>> 6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=0x558f55c01800, vdev=0x558f568f91f0, n=2, mask=<optimized out>) at ../hw/virtio/vhost.c:1557
> I feel it's probably a bug elsewhere e.g when we fail to start
> vhost-vDPA, it's the charge of the Qemu to poll host notifier and we
> will fallback to the userspace vq handler.
Apologies, an incorrect stack trace was pasted which actually came from 
patch #1. I will post a v2 with the corresponding one as below:

0  0x000055f800df1780 in qdev_get_parent_bus (dev=0x0) at 
../hw/core/qdev.c:376
1  0x000055f800c68ad8 in virtio_bus_device_iommu_enabled 
(vdev=vdev@entry=0x0) at ../hw/virtio/virtio-bus.c:331
2  0x000055f800d70d7f in vhost_memory_unmap (dev=<optimized out>) at 
../hw/virtio/vhost.c:318
3  0x000055f800d70d7f in vhost_memory_unmap (dev=<optimized out>, 
buffer=0x7fc19bec5240, len=2052, is_write=1, access_len=2052) at 
../hw/virtio/vhost.c:336
4  0x000055f800d71867 in vhost_virtqueue_stop 
(dev=dev@entry=0x55f8037ccc30, vdev=vdev@entry=0x55f8044ec590, 
vq=0x55f8037cceb0, idx=0) at ../hw/virtio/vhost.c:1241
5  0x000055f800d7406c in vhost_dev_stop (hdev=hdev@entry=0x55f8037ccc30, 
vdev=vdev@entry=0x55f8044ec590) at ../hw/virtio/vhost.c:1839
6  0x000055f800bf00a7 in vhost_net_stop_one (net=0x55f8037ccc30, 
dev=0x55f8044ec590) at ../hw/net/vhost_net.c:315
7  0x000055f800bf0678 in vhost_net_stop (dev=dev@entry=0x55f8044ec590, 
ncs=0x55f80452bae0, data_queue_pairs=data_queue_pairs@entry=7, 
cvq=cvq@entry=1)
    at ../hw/net/vhost_net.c:423
8  0x000055f800d4e628 in virtio_net_set_status (status=<optimized out>, 
n=0x55f8044ec590) at ../hw/net/virtio-net.c:296
9  0x000055f800d4e628 in virtio_net_set_status 
(vdev=vdev@entry=0x55f8044ec590, status=15 '\017') at 
../hw/net/virtio-net.c:370
10 0x000055f800d534d8 in virtio_net_handle_ctrl (iov_cnt=<optimized 
out>, iov=<optimized out>, cmd=0 '\000', n=0x55f8044ec590) at 
../hw/net/virtio-net.c:1408
11 0x000055f800d534d8 in virtio_net_handle_ctrl (vdev=0x55f8044ec590, 
vq=0x7fc1a7e888d0) at ../hw/net/virtio-net.c:1452
12 0x000055f800d69f37 in virtio_queue_host_notifier_read 
(vq=0x7fc1a7e888d0) at ../hw/virtio/virtio.c:2331
13 0x000055f800d69f37 in virtio_queue_host_notifier_read 
(n=n@entry=0x7fc1a7e8894c) at ../hw/virtio/virtio.c:3575
14 0x000055f800c688e6 in virtio_bus_cleanup_host_notifier 
(bus=<optimized out>, n=n@entry=14) at ../hw/virtio/virtio-bus.c:312
15 0x000055f800d73106 in vhost_dev_disable_notifiers 
(hdev=hdev@entry=0x55f8035b51b0, vdev=vdev@entry=0x55f8044ec590)
    at ../../../include/hw/virtio/virtio-bus.h:35
16 0x000055f800bf00b2 in vhost_net_stop_one (net=0x55f8035b51b0, 
dev=0x55f8044ec590) at ../hw/net/vhost_net.c:316
17 0x000055f800bf0678 in vhost_net_stop (dev=dev@entry=0x55f8044ec590, 
ncs=0x55f80452bae0, data_queue_pairs=data_queue_pairs@entry=7, 
cvq=cvq@entry=1)
    at ../hw/net/vhost_net.c:423
18 0x000055f800d4e628 in virtio_net_set_status (status=<optimized out>, 
n=0x55f8044ec590) at ../hw/net/virtio-net.c:296
19 0x000055f800d4e628 in virtio_net_set_status (vdev=0x55f8044ec590, 
status=15 '\017') at ../hw/net/virtio-net.c:370
20 0x000055f800d6c4b2 in virtio_set_status (vdev=0x55f8044ec590, 
val=<optimized out>) at ../hw/virtio/virtio.c:1945
21 0x000055f800d11d9d in vm_state_notify (running=running@entry=false, 
state=state@entry=RUN_STATE_SHUTDOWN) at ../softmmu/runstate.c:333
22 0x000055f800d04e7a in do_vm_stop 
(state=state@entry=RUN_STATE_SHUTDOWN, send_stop=send_stop@entry=false) 
at ../softmmu/cpus.c:262
23 0x000055f800d04e99 in vm_shutdown () at ../softmmu/cpus.c:280
24 0x000055f800d126af in qemu_cleanup () at ../softmmu/runstate.c:812
25 0x000055f800ad5b13 in main (argc=<optimized out>, argv=<optimized 
out>, envp=<optimized out>) at ../softmmu/main.c:51

 From the trace pending read only occurs in stop path. The recursive 
virtio_net_set_status from virtio_net_handle_ctrl doesn't make sense to me.
Not sure I got the reason why we need to handle pending host 
notification in userland vq, can you elaborate?

Thanks,
-Siwei

>
> Thanks
>
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
>> 17 0x0000558f52d078e7 in flatview_write_continue (fv=fv@entry=0x7f8accbc3b90, addr=addr@entry=103079215124, attrs=..., ptr=ptr@entry=0x7f8ce6300028, len=len@entry=1, addr1=<optimized out>, l=<optimized out>, mr=0x558f568f19d0) at ../../../include/qemu/host-utils.h:165
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
>> Fixes: 4023784 ("vhost-vdpa: multiqueue support")
>> Cc: Jason Wang <jasowang@redhat.com>
>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>> ---
>>   hw/virtio/virtio-bus.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
>> index 0f69d1c..3159b58 100644
>> --- a/hw/virtio/virtio-bus.c
>> +++ b/hw/virtio/virtio-bus.c
>> @@ -311,7 +311,8 @@ void virtio_bus_cleanup_host_notifier(VirtioBusState *bus, int n)
>>       /* Test and clear notifier after disabling event,
>>        * in case poll callback didn't have time to run.
>>        */
>> -    virtio_queue_host_notifier_read(notifier);
>> +    if (!vdev->disable_ioeventfd_handler)
>> +        virtio_queue_host_notifier_read(notifier);
>>       event_notifier_cleanup(notifier);
>>   }
>>
>> --
>> 1.8.3.1
>>


