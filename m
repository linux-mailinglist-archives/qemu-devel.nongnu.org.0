Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D71D5575219
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 17:42:57 +0200 (CEST)
Received: from localhost ([::1]:56644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC0zQ-0003pi-So
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 11:42:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oC0wa-0000aF-L6
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:40:00 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oC0wT-0007oV-KE
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 11:39:58 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26EDcjnZ000875;
 Thu, 14 Jul 2022 15:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=frUOUR7gktZ8RpZPR+VInZh+xzQKfMtrLUTE9NBSfJU=;
 b=zB/oC+uEHQ6vgA5XV9LhaJHy5cPWTzROP1bxa8odC8g+erC4u3BPLbBKgjvof/ivm9N6
 jlqYyg/LVXIJ6yfJOcpLzhJfpEhNvGL1nWLhN/jESYTnvwo1P9yx335sEQW0la8FnpW3
 vfjRmyrS93U6gjUSoFDkyrF5b6/CF6lKJQau54rKmMtN2yVcmU0TOz52at8rvssRPaWZ
 xI9/7j0X7aumpvR1yztuBgdmg76B2YMsxhgD4JLte64zHpoiwZmYVQhGz8onTwx5TeyD
 cd+tfiT4gT0qmfVnsCmgY82Bkhmk6hLsNHSAN6k/Pf/7RJ8pqVh1YSJo64s3ZriQtxwp Ow== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71xrnhue-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 15:39:17 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26EFagRV015845; Thu, 14 Jul 2022 15:39:17 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2109.outbound.protection.outlook.com [104.47.70.109])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h7045npf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jul 2022 15:39:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WC/jbzGqzaZvnPosaENXZbe5Uib6ST8ntKuDisV/3lTJi9uwTGeni05YvQjVhAGddHrQibpyFyTW14LogzEHgvBjLMMNXVLMN2nPSRsIzCVlbmWW5zbWGwnhoa5irEH017TSkKZ/+ebt91fj/zfp87uZnOqcPfmhx9nANkzR+eUL6akZRSo9hRKGRlGpXTa9MoUXyiz3rNst9tI+koJNGLL4BroJ3frZO5xbvOBU0pR/bk4HHJR9wDhGoZWRmHL4D6uE8bqj8s9IciH5rGI7rKbFfrT9o3CuzUoZ9pfRH90yz4o6GtCY6AbA1pr7P6NFzLxZKsFardhMP6CBEgIuhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frUOUR7gktZ8RpZPR+VInZh+xzQKfMtrLUTE9NBSfJU=;
 b=aHGPWQMx9M/3C1HoWUJFwc3SN6VFkt7KJjhY+CetkME8vYMNP+A/HFns5GuNzExgehYBqyODis6721uhVwUqhSgO4pWeLiBhD1mUC942So7m+2v6sCCyQiO4oGdnXBwRTormkUfZkRcxGAISwxXV3BtIXF2GLwxhNG3XArdW6VMFC47fD/AjlTw2ac7D43r6imEkSEdGwdhMzlBfsJ69ssgi1IcjmzdxAF9lF9kZ83FFoL3zmZhTSZ/FxphV68uuLJ3oNxJZVo7cN13LdaYFcW6ibj7On+c71gR1J2zXvFU9b3Ahj+eEic5VYqAs0UeM31f1MOicuSgtoCf8uSy32w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frUOUR7gktZ8RpZPR+VInZh+xzQKfMtrLUTE9NBSfJU=;
 b=na8L+cSQROZi91l1dJkPfq6Ub8LwHuGewTlfWVLjrbmwOxWbuG+EWAzZ15xx4z4IZgxpQeNC+cPKDXxkzLMtwdTjcd3O1KYCXHYLsY6rBTKr+/yAIOb3gi70bd3LiWBMTiG2yygTF9uFsrbhoEjx/j90xt09w3+rlP+5Fohgg4s=
Received: from DS7PR10MB4846.namprd10.prod.outlook.com (2603:10b6:5:38c::24)
 by MWHPR10MB1551.namprd10.prod.outlook.com (2603:10b6:300:27::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Thu, 14 Jul
 2022 15:39:14 +0000
Received: from DS7PR10MB4846.namprd10.prod.outlook.com
 ([fe80::e9cf:32d6:d427:b8f9]) by DS7PR10MB4846.namprd10.prod.outlook.com
 ([fe80::e9cf:32d6:d427:b8f9%5]) with mapi id 15.20.5438.014; Thu, 14 Jul 2022
 15:39:14 +0000
Message-ID: <4fa0a14e-8695-a8b1-b6c2-0173a6184304@oracle.com>
Date: Thu, 14 Jul 2022 16:39:05 +0100
Subject: Re: [PATCH v6 09/10] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-10-joao.m.martins@oracle.com>
 <20220711145627.2c318ba6@redhat.com>
 <5179013f-a2b6-b5a4-a509-42657dbde25a@oracle.com>
 <65ea8b7f-37cb-55dc-3306-fd32880aa0fb@oracle.com>
 <a731592c-4e42-ea23-6fe3-550b8a07af11@oracle.com>
 <20220712110615.09c3e303@redhat.com>
 <2228436c-2271-ec27-96ee-67825ac1b13f@oracle.com>
 <addb6d9f-5d04-0280-a0b4-79edd888faeb@oracle.com>
 <20220714112820.2cf526ea@redhat.com>
 <19de0ed6-f29a-2f59-658d-aeb694043038@oracle.com>
 <22b27ecb-3ce4-bd47-90d5-4784468a8776@oracle.com>
 <20220714135000.0b669b2a@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220714135000.0b669b2a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0326.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a4::26) To DS7PR10MB4846.namprd10.prod.outlook.com
 (2603:10b6:5:38c::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6eb7605c-7ea7-44bf-8c16-08da65af014e
X-MS-TrafficTypeDiagnostic: MWHPR10MB1551:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZFmIs/kJ7nnenVPMUgN2MHCeTGCWkSgkmBnVSiR2LIRyoSv/O4dMZajddBUfcarJJ86sQE9TeCT/b5V0upiz4sXo/aPAd04okbo75JYAiy8XP5ffev07aTtsW4lS25GmvXN3uX64A+Gdt98jdjVz6Cgh9u75gzdK10Ors+iGFNXh+PXdKgHGStVqnwVHzioXf+w8CZLQoJXHosv00MZ4TePwqLR3QVHxF5S6jPi5ZlMImpzGjlne+Spl0Fh/VNZkSO909UkoemMOz2qCgYOOAprb3/VuYuKagfZHAR3DICpKlkiCbYSoInd90ONF5twZNNnPIUW/l1goURKHim2USIdulWJP2PkcoUke4K3KNcdxnHaE0g4Wmc+0LQHu5Dal1z1n1xSJrQS9oU7AzFYeNvxM9WJy9obeBGK4NPx/JNeDpwn5iQ13fbFVKyHFf0oGS+td7kIylgwLutmpJfnXBoDRRLCGgcVv/+WtjjeVXIfomVY8rtLd7mOkw1rAt1oBNWZGlhTwsZrcqHwRZh9FOxP5ZF55BCo3RNZel3K4olXTrJv78u/ECP+uRM27K9Zg8Y6dWMljtS86hOtCeWLGFv5QxVMDUnzDKgDL3nOGWMXBsZ03B/LfMZJwlCzeH0oD13IgWkjWe8AyHLcACW324nsnfVjwOGXC+tGArUuQ3m0RHK5cK/OOyLgjCvyL6xOOb4zHf35v7KoERFTJ0yg0SqhHdQ5WBVvuVf/OpyzkTkWV89llr1xTgtbfSFtNSTt89SnO72Sd5ae9DVITay+tFJfXSQJSdky733KRc8DHoIqUAC7/Ps14MOuimWStH8cZ3Udee+PtKoasCbkwOFTS5ma7xJTGzMNREasKiB6unvUDZQwiurMbc9hqbZglsBjhyduH8VW1tf+QXpyP/X8fNQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR10MB4846.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(346002)(136003)(376002)(396003)(39860400002)(30864003)(7416002)(478600001)(186003)(6506007)(966005)(6486002)(26005)(6512007)(38100700002)(316002)(6916009)(86362001)(54906003)(31696002)(53546011)(8676002)(4326008)(5660300002)(2616005)(8936002)(31686004)(66476007)(66946007)(66556008)(6666004)(41300700001)(83380400001)(36756003)(2906002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODFlRGx1dnhnNVB3bTJUK0JpKzBBcjZ5M3ZIbTJaMDB4c1ZMamdTQ3ZQaW85?=
 =?utf-8?B?czVLQXFzYWdVZVpQRXBHVUJvL0RrV1d5Z1BuakNpVnFrZGREbDN0eklFR0hM?=
 =?utf-8?B?R2ZsUWt2RmZ0V2xjMndqMFR0RzlYTEJ3bDc4NEdBaFBBWWVFNzUybXRHWkVF?=
 =?utf-8?B?bHo5TkY2NGJPVzRMTWpxOGtWMWV4TkltelJuSk0zcFJTOHFtV2xOZnNpTE1h?=
 =?utf-8?B?YkI2RzNTdWVHdzhWaFgzTUN3MmlOT3F0OVArVFBjOUU3b0VRbG1odU1UYk5M?=
 =?utf-8?B?RXhVNVlSN215ZFp5Z0JVT09NL0ZVaCs3MUJrY2tvTExTWGcrZFg3RldaOVIz?=
 =?utf-8?B?Q3o4VzRRYjJBUkEvUlpxQ3BpMi9vSkhVdU5PQitDdEdzY0JHVGZ5ZVF2U0c0?=
 =?utf-8?B?VS9DcHo0SUxiNWViTnVTVjZhUlRZcmx1dHkvNzVGTThySFJaRmtnQklwdnF5?=
 =?utf-8?B?NkNDSEV6amVrRjRVTjNnVVJwSEU3V2RRSklqS29vQjlwdzlGa2wvbWp2YzVM?=
 =?utf-8?B?Y0x2QURtV2JYWHlIa0duUS9EYXlwc1Q1UjNKVU9Qa3BjZ3E0UURzcmdLOWhh?=
 =?utf-8?B?MlJJZDNER29ndWhyOXpRbUpmV0NET1dFditBK3RCemUxTjRnZXI4WTRaandT?=
 =?utf-8?B?UlFNSGpLMGpUT3dCb1RPeVlpMXA3eHFsV2YxRU5RM29mbEJNUXpyNUxPajFl?=
 =?utf-8?B?UE9kVEpmTFN2QVBjRW1mV3VkQ0JVeHJYYXNUWGh0eHl0UDJtUGEyWFQ0RHVP?=
 =?utf-8?B?dTN2Y0VHdW1sd2RUR2xwOTNIM0NxZm9ZR0FZN2dlYzR4dXJuY3BPVk1IRzc4?=
 =?utf-8?B?dlFSaFZHV05yWW4zVmZUdXkzRDU0MjNiK3Z3aGFiaktwT3ZPNU5icCtaSzEr?=
 =?utf-8?B?V1I2YjhJWHhVT0R2bmdoSmcvR3FyOXVITytMSTdkcWl6RDBOSTUwRFZMZlBx?=
 =?utf-8?B?ZkFZV21xZzRJUW5rbmtvRHUyVkEySWpOWktOdWFIQnZocjgyZDByTnlRMGpX?=
 =?utf-8?B?bDQrd1d3cW5PKzJDTUVrZkVYa2VmbVFIZ2dVSmorUjN0V2ZWS3hCekJGQjN5?=
 =?utf-8?B?TXEreFBOaUJHRFYvb1k3NXowWFVaU3l6b2JuM3NBaC9PczNlWk9TN1g1Mm5B?=
 =?utf-8?B?NHJRcm9mbVAvZVdmb21tMFFIWmpMeXF4SW1DM0JwMGpUeEdDdW8zMXpHeDFn?=
 =?utf-8?B?VGFzbndoMU1xSk1QUHlmMkhjcUVVbytQdFdQd3h4NTVoQ0FlaXZ4WGVjazA1?=
 =?utf-8?B?S2FNcW1WaG9mNVZWekU0d3RIWE5DM3YxU3RZTFVNNW1qaGh3ZzE1RzlsT0My?=
 =?utf-8?B?R2VrOWdBQmQzMTduaDY3dVBZTW16WGtCL1c1NmRUdk91cm4zUTdwK1V0bWlu?=
 =?utf-8?B?YWlBaWR3Tk1tNkN6ZWRKT1hGZzFHeTNKY3NSN3diS0h3ZUpRY0dOZkczTDh6?=
 =?utf-8?B?dzQxMkRGM0puUVJnRXhWMXMrOXF6Mnlxc091aHQ3Zyt5M0QxcXVuRDRGNVV6?=
 =?utf-8?B?MHdUc0pLSHgyWGw1Y09WcDZrejdiQVZ3SkFPa05uZ2pOTnRCQXk3WFlHbWpa?=
 =?utf-8?B?TlNuN3hHUTV4TFppL0VVdHhZeXZFWjMwOWtsYXY4WEgvcHhJTTV0T1VQN0lF?=
 =?utf-8?B?MEE5SGE0bWNONGdCanBRUlNPMVAxK3FvYzVFRk9LWVlIUW05ZnRuQ0lSTU41?=
 =?utf-8?B?OW9kQ0NUTHJoN2Zjc1djWmYwNklzWVZyRlVhcDM2S0cyWjlocEdETnNIQkpq?=
 =?utf-8?B?SWc5eW9kMVVIZDluSmJqL0M5bkRXcmx1bWVVSE9MUnE3YS9aWXlPaWV2L3dw?=
 =?utf-8?B?dWFjT2hic0x3KzViM0RhQ1BZNU1PQTZWWE5FQ1d1VWRIWnBDL29abURuMVZq?=
 =?utf-8?B?Zk01My96bFVubnB4VzR2V3YrdnQyaTBPY1dhV21IZ1lLVDF6a1lLbHdxU3hO?=
 =?utf-8?B?TTB6Nllib0Q3cHhkYVNUNkRaRTR2enl6TGFiUGRLdTJlQ0p0YVQzRjlsQ1Ir?=
 =?utf-8?B?NHliRkE1RmYya3A0SkxncTl0a3N6SE5WUHhJNlFsblQ5eU5FYzZRNmVJaHpQ?=
 =?utf-8?B?REdRaHU0UnVFbEdMRkRXZkZzMm5lSXV5QlhRRkVVRkgrWVcrSFpFVGFrRHE5?=
 =?utf-8?B?V1ZVNjNRVGNSaGU2YXRzNE1ocldXZzlHTURyc2M3ZVdVWE5idlpVZzc5bU5w?=
 =?utf-8?B?aXc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6eb7605c-7ea7-44bf-8c16-08da65af014e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR10MB4846.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2022 15:39:14.5546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vamHI9xbhcf2PxtjWbNcWZH2NMcJX2PK58+4NGSbloHjyrWwnwVCdr/sv5+3JIB56tBPQN1TtrAPwNGyM21n6Uz6kicr8Z/sT23wSO+sfbQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1551
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-14_12:2022-07-14,
 2022-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207140067
X-Proofpoint-GUID: ljrJpFDqeUfiNjVQw4XN7q-ZRHiO7U96
X-Proofpoint-ORIG-GUID: ljrJpFDqeUfiNjVQw4XN7q-ZRHiO7U96
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/14/22 12:50, Igor Mammedov wrote:
> On Thu, 14 Jul 2022 11:47:19 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 7/14/22 10:54, Joao Martins wrote:
>>> On 7/14/22 10:28, Igor Mammedov wrote:  
>>>> On Tue, 12 Jul 2022 12:35:49 +0100
>>>> Joao Martins <joao.m.martins@oracle.com> wrote:  
>>>>> On 7/12/22 11:01, Joao Martins wrote:  
>>>>>> On 7/12/22 10:06, Igor Mammedov wrote:    
>>>>>>> On Mon, 11 Jul 2022 21:03:28 +0100
>>>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:    
>>>>>>>> On 7/11/22 16:31, Joao Martins wrote:    
>>>>>>>>> On 7/11/22 15:52, Joao Martins wrote:      
>>>>>>>>>> On 7/11/22 13:56, Igor Mammedov wrote:      
>>>>>>>>>>> On Fri,  1 Jul 2022 17:10:13 +0100
>>>>>>>>>>> Joao Martins <joao.m.martins@oracle.com> wrote:    
>>>>>>>>  void pc_memory_init(PCMachineState *pcms,
>>>>>>>>                      MemoryRegion *system_memory,
>>>>>>>>                      MemoryRegion *rom_memory,
>>>>>>>> @@ -897,6 +953,7 @@ void pc_memory_init(PCMachineState *pcms,
>>>>>>>>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>>>>>>>      X86MachineState *x86ms = X86_MACHINE(pcms);
>>>>>>>>      hwaddr cxl_base, cxl_resv_end = 0;
>>>>>>>> +    X86CPU *cpu = X86_CPU(first_cpu);
>>>>>>>>
>>>>>>>>      assert(machine->ram_size == x86ms->below_4g_mem_size +
>>>>>>>>                                  x86ms->above_4g_mem_size);
>>>>>>>> @@ -904,6 +961,29 @@ void pc_memory_init(PCMachineState *pcms,
>>>>>>>>      linux_boot = (machine->kernel_filename != NULL);
>>>>>>>>
>>>>>>>>      /*
>>>>>>>> +     * The HyperTransport range close to the 1T boundary is unique to AMD
>>>>>>>> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
>>>>>>>> +     * to above 1T to AMD vCPUs only.
>>>>>>>> +     */
>>>>>>>> +    if (IS_AMD_CPU(&cpu->env) && x86ms->above_4g_mem_size) {    
>>>>>>>
>>>>>>> it has the same issue as pc_max_used_gpa(), i.e.
>>>>>>>   x86ms->above_4g_mem_size != 0
>>>>>>> doesn't mean that there isn't any memory above 4Gb nor that there aren't
>>>>>>> any MMIO (sgx/cxl/pci64hole), that's was the reason we were are considering
>>>>>>> max_used_gpa
>>>>>>> I'd prefer to keep pc_max_used_gpa(),
>>>>>>> idea but make it work for above cases and be more generic (i.e. not to be
>>>>>>> tied to AMD only) since 'pc_max_used_gpa() < physbits'
>>>>>>> applies to equally
>>>>>>> to AMD and Intel (and to trip it, one just have to configure small enough
>>>>>>> physbits or large enough hotpluggable RAM/CXL/PCI64HOLE)
>>>>>>>    
>>>>>> I can reproduce the issue you're thinking with basic memory hotplug.     
>>>>>
>>>>> I was mislead by a bug that only existed in v6. Which I fixed now.
>>>>> So any bug possibility with hotplug, SGX and CXL, or pcihole64 is simply covered with:
>>>>>
>>>>> 	pc_pci_hole64_start() + pci_hole64_size;
>>>>>
>>>>> which is what pc_max_used_gpa() does. This works fine /without/ above_4g_mem_size != 0
>>>>> check even without above_4g_mem_size (e.g. mem=2G,maxmem=1024G).
>>>>>
>>>>> And as a reminder: SGX, hotplug, CXL and pci-hole64 *require* memory above 4G[*]. And part
>>>>> of the point of us moving to pc_pci_hole64_start() was to make these all work in a generic
>>>>> way.
>>>>>
>>>>> So I've removed the x86ms->above_4g_mem_size != 0 check. Current patch diff pasted at the end.
>>>>>
>>>>> [*] As reiterated here:
>>>>>  
>>>>>> Let me see
>>>>>> what I can come up in pc_max_used_gpa() to cover this one. I'll respond here with a proposal.
>>>>>>     
>>>>>
>>>>> I was over-complicating things here. It turns out nothing else is needed aside in the
>>>>> context of 1T hole.
>>>>>
>>>>> This is because I only need to check address space limits (as consequence of
>>>>> pc_set_amd_above_4g_mem_start()) when pc_max_used_gpa() surprasses HT_START. Which
>>>>> requires fundamentally a value closer to 1T well beyond what 32-bit can cover. So on
>>>>> 32-bit guests this is never true and thus it things don't change behaviour from current
>>>>> default for these guests. And thus I won't break qtests and things fail correctly in the
>>>>> right places.
>>>>>
>>>>> Now I should say that pc_max_used_gpa() is still not returning the accurate 32-bit guest
>>>>> max used GPA value, given that I return pci hole64 end (essentially). Do you still that
>>>>> addressed out of correctness even if it doesn't matter much for the 64-bit 1T case?
>>>>>
>>>>> If so, our only option seems to be to check phys_bits <= 32 and return max CPU
>>>>> boundary there? Unless you have something enterily different in mind?
>>>>>  
>>>>>> I would really love to have v7.1.0 with this issue fixed but I am not very
>>>>>> confident it is going to make it :(
>>>>>>
>>>>>> Meanwhile, let me know if you have thoughts on this one:
>>>>>>
>>>>>> https://lore.kernel.org/qemu-devel/1b2fa957-74f6-b5a9-3fc1-65c5d68300ce@oracle.com/
>>>>>>
>>>>>> I am going to assume that if no comments on the above that I'll keep things as is.
>>>>>>
>>>>>> And also, whether I can retain your ack with Bernhard's suggestion here:
>>>>>>
>>>>>> https://lore.kernel.org/qemu-devel/0eefb382-4ac6-4335-ca61-035babb95a88@oracle.com/
>>>>>>     
>>>>>
>>>>>  
>>
>> [...]
>>
>>>>>      /*
>>>>> +     * The HyperTransport range close to the 1T boundary is unique to AMD
>>>>> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
>>>>> +     * to above 1T to AMD vCPUs only.
>>>>> +     */
>>>>> +    if (IS_AMD_CPU(&cpu->env)) {
>>>>> +        /* Bail out if max possible address does not cross HT range */
>>>>> +        if (pc_max_used_gpa(pcms, pci_hole64_size) >= AMD_HT_START) {
>>>>> +            pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);  
>>>>
>>>> I'd replace call with 
>>>>    x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
>>>>  
>>> See below.
>>>   
>>>>> +        }
>>>>> +
>>>>> +        /*
>>>>> +         * Advertise the HT region if address space covers the reserved
>>>>> +         * region or if we relocate.
>>>>> +         */
>>>>> +        if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START ||
>>>>> +            cpu->phys_bits >= 40) {
>>>>> +            e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
>>>>> +        }
>>>>> +    }  
>>>>
>>>> and then here check that pc_max_used_gpa() fits into phys_bits
>>>> which should cover AMD case and case where pci64_hole goes beyond 
>>>> supported address range even without 1TB hole
>>>>  
>>>
>>> When you say 'here' you mean outside IS_AMD_CPU() ?
>>>
>>> If we put outside (and thus generic) where it was ... it will break qtests
>>> as pc_max_used_gpa() does not handle 32-bit case, as mentioned earlier.
>>> Hence why it is inside pc_set_amd_above_4g_mem_start(), or in other words
>>> inside the scope of:
>>>
>>> 	if (pc_max_used_gpa(pcms, pci_hole64_size) >= AMD_HT_START)
>>>
>>> Which means I will for sure have a pci_hole64.
>>> Making it generic to /outside/ this conditional requires addressing this
>>> earlier comment I made:
>>>
>>>  our only option seems to be to check phys_bits <= 32 and return max CPU
>>>  boundary there?
>>>   
>>
>> Here's how this patch looks like, after your comments and the above issue
>> I am talking. The added part is inside pc_max_used_gpa().
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 668e15c8f2a6..2d85c66502d5 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -881,6 +881,51 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>>      return start;
>>  }
>>
>> +static hwaddr pc_max_used_gpa(PCMachineState *pcms, uint64_t pci_hole64_size)
>> +{
>> +    X86CPU *cpu = X86_CPU(first_cpu);
>> +
>> +    if (cpu->phys_bits <= 32) {
> 
>> +        return (1ULL << cpu->phys_bits) - 1ULL;
> Add a comment here as to why this value is returned
> 

I have added this so far:

+    /* 32-bit systems don't have hole64 thus return max phys address */

>> +    }
>> +
>> +    return pc_pci_hole64_start() + pci_hole64_size;
>> +}
>> +

And also a - 1 in the calculation above as this was off by one.

>> +/*
>> + * AMD systems with an IOMMU have an additional hole close to the
>> + * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
>> + * on kernel version, VFIO may or may not let you DMA map those ranges.
>> + * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
>> + * with certain memory sizes. It's also wrong to use those IOVA ranges
>> + * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
>> + * The ranges reserved for Hyper-Transport are:
>> + *
>> + * FD_0000_0000h - FF_FFFF_FFFFh
>> + *
>> + * The ranges represent the following:
>> + *
>> + * Base Address   Top Address  Use
>> + *
>> + * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
>> + * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
>> + * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
>> + * FD_F910_0000h FD_F91F_FFFFh System Management
>> + * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
>> + * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
>> + * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
>> + * FD_FE00_0000h FD_FFFF_FFFFh Configuration
>> + * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
>> + * FE_2000_0000h FF_FFFF_FFFFh Reserved
>> + *
>> + * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
>> + * Table 3: Special Address Controls (GPA) for more information.
>> + */
>> +#define AMD_HT_START         0xfd00000000UL
>> +#define AMD_HT_END           0xffffffffffUL
>> +#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
>> +#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
>> +
>>  void pc_memory_init(PCMachineState *pcms,
>>                      MemoryRegion *system_memory,
>>                      MemoryRegion *rom_memory,
>> @@ -895,7 +940,9 @@ void pc_memory_init(PCMachineState *pcms,
>>      MachineClass *mc = MACHINE_GET_CLASS(machine);
>>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>      X86MachineState *x86ms = X86_MACHINE(pcms);
>> +    hwaddr maxphysaddr, maxusedaddr;
>>      hwaddr cxl_base, cxl_resv_end = 0;
>> +    X86CPU *cpu = X86_CPU(first_cpu);
>>
>>      assert(machine->ram_size == x86ms->below_4g_mem_size +
>>                                  x86ms->above_4g_mem_size);
>> @@ -903,6 +950,40 @@ void pc_memory_init(PCMachineState *pcms,
>>      linux_boot = (machine->kernel_filename != NULL);
>>
>>      /*
>> +     * The HyperTransport range close to the 1T boundary is unique to AMD
>> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
>> +     * to above 1T to AMD vCPUs only.
>> +     */
>> +    if (IS_AMD_CPU(&cpu->env)) {
>> +        /* Bail out if max possible address does not cross HT range */
>> +        if (pc_max_used_gpa(pcms, pci_hole64_size) >= AMD_HT_START) {
>> +            x86ms->above_4g_mem_start = AMD_ABOVE_1TB_START;
>> +        }
>> +
>> +        /*
>> +         * Advertise the HT region if address space covers the reserved
>> +         * region or if we relocate.
>> +         */
>> +        if (cpu->phys_bits >= 40) {
>> +            e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
>> +        }
>> +    }
>> +
>> +    /*
>> +     * Relocating ram-above-4G requires more than TCG_PHYS_ADDR_BITS (40).
>> +     * So make sure phys-bits is required to be appropriately sized in order
>> +     * to proceed with the above-4g-region relocation and thus boot.
>> +     */
>> +    maxusedaddr = pc_max_used_gpa(pcms, pci_hole64_size);
>> +    maxphysaddr = ((hwaddr)1 << cpu->phys_bits) - 1;
>> +    if (maxphysaddr < maxusedaddr) {
>> +        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
>> +                     " phys-bits too low (%u)",
>> +                     maxphysaddr, maxusedaddr, cpu->phys_bits);
>> +        exit(EXIT_FAILURE);
>> +    }
>> +
> 
> it looks fine to me
> 

Cool, let me respin v7 today/tomorrow.

>> +    /*
>>       * Split single memory region and use aliases to address portions of it,
>>       * done for backwards compatibility with older qemus.
>>       */
>>
> 

