Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 103336AC925
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 18:05:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZEGw-0000Gp-91; Mon, 06 Mar 2023 12:05:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZEGZ-0008Q3-Ar
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:05:01 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZEGV-0002d1-BO
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:04:49 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326GwuHY018427; Mon, 6 Mar 2023 17:04:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=vJS8jAEER11GCRC5sntJJSMmkT4lVsD0LEeNq+nLoVo=;
 b=dySRn/C5kUa7iVDLgh7ZmyyCurWih2FbcFxRQX0II95SvU23HxZw2yHqG7iuNYXgJaDd
 Vaeufve6nooArq/BhTyrddZENSSLuM/dZRwi+XEODX01VyUiR4IjJ0qTPA+RhzrKtq8O
 oin/SqCknzUFFxAWng0YEpk/Qons2cdxO+UaVewS0L7Ptua+W5ErqWhJNRU6KM2SZ6eJ
 KqHyfkhWOzaW1WoxNvAseouvGZ/PYx1pRmMTPtMiL/G3M9or5Z8L1ATyIvjkC9vWrpLN
 Xjwak88hny/WYNknRPwE/MHDLojn912CpfbHj+2iWDm/fa2a17SqhEpfcr4Gcofp/mo5 ZA== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p416wke99-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 17:04:45 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 326FcXfE023172; Mon, 6 Mar 2023 17:04:44 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u050nmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 17:04:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTcf3zYXZ8PsrOOpl17fOqAF3+s0izId5sA1hHFRPZ30k+0UVzKTMF3u7F2iKgCh5jJtCFxHOEvQtcCuADWuXlj4NAvR2nQCXEvAr6PDfc5fpOmVhFRZnxo8/nLkG5KWDjOfi+s4xsVVPPS/NtKMfN4sT7zUPkgBE/f5I62koCttggHHRilb1kiuz+vzjpb8T7zoCsaezk2AM3+OCqL973///RzEGweGxW3FsUEGlqvEn9rsNw2rOT8+FWwy0vKfMHCnqFpfAczPYRaLJjaaBxPpBl3Cu9tAYgX1bqAhm4u+sj3s0UzvdtMoiXbz6VkF4josJGuvynfHEVhL6rOnOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vJS8jAEER11GCRC5sntJJSMmkT4lVsD0LEeNq+nLoVo=;
 b=HWZsXN6jvbnwZHjfkirAS8YKT7l9AzAyHC8WDVxHp+gouo/JOCugKhDUFpeTaQrOMPSs6HL+e5y3oXRip5O4+nkyBUFC7W52LVmbo2DypcOChgIFH0vSVEBR7hL4YdeB4i3HxKxnByAd34z/Qu3fT0iZEYl0FNXpqNxcAHFeYBhtEpLaj5ScRjxW366Md2VjKCkhiptXBPTlsKXsBPY7KNTAc7B0/+tvAGb73Eltmmawu/EGqY58MjC+oT4DYCfrUoNxqhx8Hpy3w82nC3xjAL2V9E1ixGmkkmYMP0FCphsQsFrXAQooW3s8V8NYdpwZA/Ogm4hsLqXOHsxf+OGrpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vJS8jAEER11GCRC5sntJJSMmkT4lVsD0LEeNq+nLoVo=;
 b=B3wDzPSDZK0RmBPLUDt4WXl0O5S/p2bKLMvKUCr7YjOUtftHK/NBNy5zFRNmUFRo982YYYqQ185/nHL9wOosCDyk8SNeMesCMbEcsR0GFfROqwSG77d+vFFNGoMJc+zErD9eBmBnzkFmH7S60dhJtF8WaayPGpzUNY85EOK5PPM=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by PH8PR10MB6669.namprd10.prod.outlook.com (2603:10b6:510:221::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 17:04:42 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::9b30:898b:e552:8823%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 17:04:41 +0000
Message-ID: <d5112a8d-33bc-e1b7-1f92-16b97a6c70b3@oracle.com>
Date: Mon, 6 Mar 2023 17:04:35 +0000
Subject: Re: [PATCH v3 11/13] vfio/migration: Block migration with vIOMMU
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-12-joao.m.martins@oracle.com>
 <fed2d4f0-ee67-9cc6-9294-28c81cb2bef7@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <fed2d4f0-ee67-9cc6-9294-28c81cb2bef7@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0037.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::9) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BLAPR10MB4835:EE_|PH8PR10MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 127a8867-dc64-4c9d-9f71-08db1e64e086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MXdUjlqgAoamE8nBoKCybAO8gitvs8f7psTTI7ElbJk5CF9jUYVL3rekk1/us59g3ntcW4R/bF91XdNuPSDqa0JzztT1K8DQL8Rte0J5vzgIDVCEmQpU0E3jXUilIM6EgxP1dWCm2DETrigPAhfu7Sa47/cago8c9Ef8eWPc6KxjPbFSCmLukRKAqR/X5p8AfqT80xQyuPUVKgtt4/nxy3n81v4sshwlky8lkj/17w44zk+LVQYBBxs39z6tVLg2xtTWgVDdspsHet+VPvjpLxoSWXiCrKUMIbDfgG2OFwcopUNBh7B7pf6qJRHv2aONLNf0WqeNUw65k/3hB1lVJ1C2P0AHmOodn4lLnS+/leVzmMLPTvXvbSlhyhDXnm3Zqy/ArvRgTdC7PwnaGAQVMTqOz67pwf6o+m8Kbec/6KuNuS1w2/hdS/zm7A3/l3alIY0AWUhomjldXHCFUUkUkkvm2ispOyzIweN/DVpTxsWp0lZmVi+mTDwbqyu39S2pxAe1szSlQf4OEQTKcopByjlExeQxBx/8Z5kw2tEYaLnc5ns6ZHiF4vS3pQjkx5ELXYiVWUNvjm+CgwhmjIlQ7DNs1+sdChq2EG//v0B59oyIZMFv4CukvCe3j07KXIC6nbqdP0SxCXLrnuK+oUi1yzd2CCu34aeOxVZk8aoE7JOtKbaMm6bKg3loJcxEcGivI3iz60Hgg8vZUb55e+bxeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(396003)(346002)(39860400002)(136003)(451199018)(31686004)(36756003)(4326008)(66556008)(41300700001)(8676002)(8936002)(2906002)(5660300002)(66946007)(86362001)(31696002)(66476007)(38100700002)(6666004)(26005)(6486002)(478600001)(54906003)(316002)(6506007)(83380400001)(6512007)(2616005)(186003)(53546011)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0Y5ZUpRSXY3akM1RnB6R1VOMnQ4VUpOQmlBRlFNMEYxY0F4NWR2d3VySW5s?=
 =?utf-8?B?TDlOMnJJQ29LTVJHY3VlbDV0SkFOcm9BeWJyaHFSTjdLZmZ5TlhSclFiVmo0?=
 =?utf-8?B?czFhdWsrUUwybExtL0diaS9vL3ZHbGxNMUdsZlVxZVFFd2NuWjNYclZ5N1NH?=
 =?utf-8?B?WHhMRnc4dW1DalZ6TUVkS250SDNDZklYUW90Njc3a1Rwelo5U1VwRlB1dlh6?=
 =?utf-8?B?dGhFeHhJaTVFSTJUaXdPaG54ZjBIQy95cVd6bEYrMnJKVk9WQ05pNXoremk2?=
 =?utf-8?B?S2JsOXpOZ2hTTldMTDFuTXFESHlOekRRUEN0Qkk1MXhjSTcwek80ZGdSTE1W?=
 =?utf-8?B?MFhLMkh3cHdKQ05vL1RKYm1WajdCWi96UjdNMXljdG1GUE0yQnZSalFIQmZU?=
 =?utf-8?B?ay9xKzlzT01KWFAraTR2aFVnL3BzTjZZMGdIbUYzMVFaSkVBZzlxYytXVWZp?=
 =?utf-8?B?Qm5BZnBzZENkeFpJeUhuTm92SWcrZlFWYWlSV1J6eEljM0trRzRxdEJtaEtv?=
 =?utf-8?B?VHZkaG1IelhJRzFsdzN3bGMya2NmcFdudzNtb1ZDa21lTTNNY3ZDT3g2SmhO?=
 =?utf-8?B?S3RIbW5LbStNcmRIMHZyQ01TQ3NpM05nS3dHSngxV2o0Z3dua054bmZlSlFX?=
 =?utf-8?B?OGFSbUF6R2VNYUtIRHUvR0RDeVhCODYrZnRTa0JleXBkRWY1TGtCcFB6Vndh?=
 =?utf-8?B?akZaWHpyR1Q4TFhKS2xYTFF5cVFTc1JweE52bzZ1T0NBTmozanZ1aTRLS1RG?=
 =?utf-8?B?MkNiSDhvZzhCd0VZU2laTzdRR0MzeXdWMlhxeWp3WlBQWXgvcmx0UUREVGtm?=
 =?utf-8?B?by93TkhMZUJhZ1VRY1Znbmc2VmgzMjkvaTdaRnE1aUZRTWsyMnVwMUtvNWI5?=
 =?utf-8?B?V0hoQndEVXhvVlN0TG9xWVVDU3FkdGtqbEphQ01rVkNXNVU3RmpueDh3Zjdl?=
 =?utf-8?B?TjdiSWt3ZVdPMVd1SGp2SGkrNFFMbFl2RU41TFB6dEdBZndHbSs2bGl4RlQ5?=
 =?utf-8?B?MVBneUE1VFFHejN3RTJucy9QQmc0eEs4TDZjQzFEaWtWVFVoY0xZRldXb25W?=
 =?utf-8?B?dndkUjFiRmFlZ0ZrQURFYkN2MHRaNHdqTUdUaWZZQldBNXpIQVNwL1J4SGdu?=
 =?utf-8?B?aXdhUHBHS01XQmo2UXZsSytDNGlJYjRsQmRDSnZhNXIwdkZwTkFhaWEzUy9j?=
 =?utf-8?B?YlI1UnZaWUJhQ0xSVjgxVG5aVmhUbzdFWjFYbm53RERmZWw4dEk2cXo2OFhS?=
 =?utf-8?B?Wm9GdlRQN1piSy80ZjRCVlBOZksvYmhCbGRCVjdTMHBtd2dkcmg0YkkwNWVh?=
 =?utf-8?B?ZFlRLzdCRUkyYjdUcUJDY24zRTZOZVBQVUM0R2ZzWmYrbzA2eVhPKzRta3Yv?=
 =?utf-8?B?aVZQM2kyTTIzMFliWmEvbXNDY0hzNG8vMnN0dE1OcnQ1SndwNTZYN0svWkRi?=
 =?utf-8?B?OXBTY0RKcmFEQTM2NngyRkY1TUNUWXIrRTEwK1krakVuQS83aWJNS2JWYTA0?=
 =?utf-8?B?dHlEUnkzRGZtV0F5YVJuZmVHR0U3MGphVWdTNmw2TnZPZkNZaGRoUDJFU3BW?=
 =?utf-8?B?K2pmb2d1WTNDYTdSQlNFQUpoaE8rZlpzSG0rUFR2VG16MVZKdEE1MlhVdEww?=
 =?utf-8?B?UTBsWFhCaDYvYnhiU25oZ014M3VVVDJpOGpCbDF1aVBudTQ4Q25yQWszb3JC?=
 =?utf-8?B?blZpbCtVVStLV0NodEYwLzR0R1Bzek82WUxSTmVkRnh6Y0pYL25FaWNJK1Bp?=
 =?utf-8?B?R2RQN09yVVE5QXZDdVoycGhOMUJJN01YUnlUVzBzeldaMTY2cnBPREtqWktr?=
 =?utf-8?B?K1JRN04vQUhSMmFncEcrVUk3OVdrSXlzdFB0MWZ1czZ1d3RvREFrRnQxYThT?=
 =?utf-8?B?TkVJZ2NVNW1abUhybUR1RGdXNHBOS05ZWWRuSm53UE03WDAxaUlnRTJKd0tE?=
 =?utf-8?B?TnJoM2NZT0ZvUXJZSjBtRUtLNXdUZUdaVlVXVVN2K3F0K2tzaGllSm1jVDBw?=
 =?utf-8?B?Y3VNNWEwanA0bFdlYVhJNGpwNVlRL3V2djdqWDVNMlB1d21xc3Vxa3FRcEVr?=
 =?utf-8?B?TnBjaE1KVlcxMXBYV1h6U3NMSjNEMFZvUWJyb29ISUx0SHc2M0pXZUdCNnln?=
 =?utf-8?B?R2VWem5NSnZRQWNjS2F4WFpFYjZJMlhNT1hXOWdMU1dTMjVWS21OVDMrUFVh?=
 =?utf-8?B?UlE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: WLBSd8XOnfJpTzAEBGJFl0IPw5kzLQ2MNm2HeF6oKwz/3GWRx4in0ifUlx5YW/rIai1QZk42YVV+ox7GuPJ2jYWWMNs2sAtuf209hMJX3m685sfDa/RvEr8IVdh4p9Kj2h2iSAQcpNAR+/Gj+j4sxsV5ca/z6UiRXzCcLkJl7YBiUj2H1FFj2bJqZVOnK7O8JKN8n+PU7rWod+aFHng/GOsX0Hvb97IUrkwZSJVIX1maQHGLNLTJbvhkYvQ6qWTXFLnqTKf5+bU3QsIcx/Hs/iNx75CBmCVs8LfOQGlmdoYm6PBX1CMorGW8NwKWB+gdZb+q8+3vTYtA+HOU57LoNkp+Ulx5pLgzu5SYXRPkELzBYupks7vBC4fSXVrSJ1ezrwOlLfdOOh8nfw61v5PV8gLz84G38X/m2+psr1lZCl4Nb+v7r5v3NKyRRfmw7hCUIICxB6ZmyPIalkDb6QCUOj2GQ2Lnt6Loq6T3iqrnq8B4VglGsg3If7oNsnji0gkF22KpLdJ5yGHQJWpYTWQQLAwW7Z3dJgOADhMvT4OEQ8o7x4pxxUPq8GKxewXOl6+uZKb+g7PyXulIrD9cKrBFNfNwTD4ckLRRQ+AtZ7X0CdeBTkjtF5OTMJIR6i5J4jkLtbSA37XAM72IxlnCClXMnmr/DDvxIiaujLu+nZ6qFoqz9uH8UYqOVaS9YkHcs+X+Y9q198km+F/WKl7xBUkMhSIs1k6XedEXLltGljdOW7VXde5mY7OhqQ0KolIp8cV1Vn/EtMYfZrEufx3yCktx6uDawGg62KuAY44tTNFlTf0mw5kKkXfgv4eeN7tfQNaQ
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 127a8867-dc64-4c9d-9f71-08db1e64e086
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 17:04:41.6945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qIOf95HgrQ1kSO1CoEDx3LeWjQx9m1/zWjndla6UmRyDva8X8lCMz2X4PKv8JYPVR0wu3mMPK9c4a6qcv2vrOHa/dsDE0DweXAYgdM8KJKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR10MB6669
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_10,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060151
X-Proofpoint-GUID: jPj6L9z7xlRnxwSpTc4I6T8LeaMfhZwD
X-Proofpoint-ORIG-GUID: jPj6L9z7xlRnxwSpTc4I6T8LeaMfhZwD
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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

On 06/03/2023 17:00, Cédric Le Goater wrote:
> On 3/4/23 02:43, Joao Martins wrote:
>> Migrating with vIOMMU will require either tracking maximum
>> IOMMU supported address space (e.g. 39/48 address width on Intel)
>> or range-track current mappings and dirty track the new ones
>> post starting dirty tracking. This will be done as a separate
>> series, so add a live migration blocker until that is fixed.
>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>   hw/vfio/common.c              | 51 +++++++++++++++++++++++++++++++++++
>>   hw/vfio/migration.c           |  6 +++++
>>   include/hw/vfio/vfio-common.h |  2 ++
>>   3 files changed, 59 insertions(+)
>>
>> diff --git a/hw/vfio/common.c b/hw/vfio/common.c
>> index 5b8456975e97..9b909f856722 100644
>> --- a/hw/vfio/common.c
>> +++ b/hw/vfio/common.c
>> @@ -365,6 +365,7 @@ bool vfio_mig_active(void)
>>   }
>>     static Error *multiple_devices_migration_blocker;
>> +static Error *giommu_migration_blocker;
>>     static unsigned int vfio_migratable_device_num(void)
>>   {
>> @@ -416,6 +417,56 @@ void vfio_unblock_multiple_devices_migration(void)
>>       multiple_devices_migration_blocker = NULL;
>>   }
>>   +static unsigned int vfio_use_iommu_device_num(void)
>> +{
>> +    VFIOGroup *group;
>> +    VFIODevice *vbasedev;
>> +    unsigned int device_num = 0;
>> +
>> +    QLIST_FOREACH(group, &vfio_group_list, next) {
>> +        QLIST_FOREACH(vbasedev, &group->device_list, next) {
>> +            if (vbasedev->group->container->space->as !=
>> +                                    &address_space_memory) {
> 
> Can't we avoid the second loop and test directly :
> 
>   group->container->space->as
> 
> ?
>
Ah yes

> 
> The rest looks good. So,
> 
> Reviewed-by: Cédric Le Goater <clg@redhat.com>
> 
Thanks!

> Thanks,
> 
> C.
> 
>> +                device_num++;
>> +            }
>> +        }
>> +    }
>> +
>> +    return device_num;
>> +}
>> +
>> +int vfio_block_giommu_migration(Error **errp)
>> +{
>> +    int ret;
>> +
>> +    if (giommu_migration_blocker ||
>> +        !vfio_use_iommu_device_num()) {
>> +        return 0;
>> +    }
>> +
>> +    error_setg(&giommu_migration_blocker,
>> +               "Migration is currently not supported with vIOMMU enabled");
>> +    ret = migrate_add_blocker(giommu_migration_blocker, errp);
>> +    if (ret < 0) {
>> +        error_free(giommu_migration_blocker);
>> +        giommu_migration_blocker = NULL;
>> +    }
>> +
>> +    return ret;
>> +}
>> +
>> +void vfio_unblock_giommu_migration(void)
>> +{
>> +    if (!giommu_migration_blocker ||
>> +        vfio_use_iommu_device_num()) {
>> +        return;
>> +    }
>> +
>> +    migrate_del_blocker(giommu_migration_blocker);
>> +    error_free(giommu_migration_blocker);
>> +    giommu_migration_blocker = NULL;
>> +}
>> +
>>   static void vfio_set_migration_error(int err)
>>   {
>>       MigrationState *ms = migrate_get_current();
>> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
>> index a2c3d9bade7f..3e75868ae7a9 100644
>> --- a/hw/vfio/migration.c
>> +++ b/hw/vfio/migration.c
>> @@ -634,6 +634,11 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
>>           return ret;
>>       }
>>   +    ret = vfio_block_giommu_migration(errp);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +
>>       trace_vfio_migration_probe(vbasedev->name);
>>       return 0;
>>   @@ -659,6 +664,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
>>           unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
>>           vfio_migration_exit(vbasedev);
>>           vfio_unblock_multiple_devices_migration();
>> +        vfio_unblock_giommu_migration();
>>       }
>>         if (vbasedev->migration_blocker) {
>> diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
>> index 1cbbccd91e11..38e44258925b 100644
>> --- a/include/hw/vfio/vfio-common.h
>> +++ b/include/hw/vfio/vfio-common.h
>> @@ -233,6 +233,8 @@ extern VFIOGroupList vfio_group_list;
>>   bool vfio_mig_active(void);
>>   int vfio_block_multiple_devices_migration(Error **errp);
>>   void vfio_unblock_multiple_devices_migration(void);
>> +int vfio_block_giommu_migration(Error **errp);
>> +void vfio_unblock_giommu_migration(void);
>>   int64_t vfio_mig_bytes_transferred(void);
>>     #ifdef CONFIG_LINUX
> 

