Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E93CE56769D
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 20:37:58 +0200 (CEST)
Received: from localhost ([::1]:54086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8nQs-0005FY-0p
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 14:37:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nFo-0001fm-Ar
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:26:32 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:18632)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nFm-0002Kr-E5
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:26:32 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265HEEnB002444;
 Tue, 5 Jul 2022 18:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=vVuLXgrpyQCJ0+82osYCAHdHnU0quGwDoJy96tsfiWg=;
 b=bJrM6FV04zDsObVKFJRLomN9G0kRlpisiHkz7EuY32UB1bSJ2R4Rf/mkMVBje2xYUCHp
 lZ9W4XzXxstucIy3xgy9Fwm684gJqt+67dzwurDLnddm/neqwYGKSd2uRIjrJWbVbQ/7
 8NI+MgZoJXJI134SFoUXwZHuL329f+xL1u9b5sczP2JQilUHYo4JWdSa7uFNCndOnVnf
 l7dBGQ+ZUkzH1OZSwzuZCuiX3vd+GiXrkqC9xxYp3ejkwInTpWfJzcuLp8ARMVfmb7MI
 L2AMW+kmEHjbeUhIJ3Hm3XC/DzhdoQuPxbaFIHXJuJ9uonZ/8JcmTnIjaGw+WWi9PHYK aQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h2dmsxwyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:26:18 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 265IBKBh004900; Tue, 5 Jul 2022 18:26:17 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h2cf2kq40-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:26:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8Y8Lekx3yPXZ54bKzGJi9CLSlJ70HyKaY8Tx4Cv0QZSwtfILbeCm2uTjTDZj1idB0z3JQUwfgJzeKoW0cnFfvk0EQ43a42AUZx1EcZpxFsInagvQa2qkgmrQZIer8QTyF+maHYPbOwkz02iNbc/gqHKfE56V6RwYYF6+tP0o+kZKw38o5k6LxgBezqxkGprc2qAIpC+YIcczkdrnRXJyyG1u34Mxhx8nEhpeoim7Dz+KG9VTBegUgMNbxTjnFa0+hLS1ldTI3nWyjUX0uz9+akEWrRkCxG1Y8df6kC0E5DIKDBHxZgOP/t5IszqannSqYw/jdy2P5zzmodvtzsjLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVuLXgrpyQCJ0+82osYCAHdHnU0quGwDoJy96tsfiWg=;
 b=jnICWMYpfAOAas8ovt3Qfpy0/67+Rh69RgVxGihVKLrLtJwPlTky9v3ox1h6HVrYWaF/8thRmR6Bn7X9fE550m2tyYN95iw/E6fDFil2/r8YZFTN1GoFX6Uu0NOWtfMLYHr5fhJf2fVoH3Oj+eevTo3LmTCTAQs1Iyp33wOF96/3/h29eQYEQ3rfPV6DQPh9fqves0ue93gTq/ZQKprG0qAEHmuONeCRYvmjnPXVCHSD+abPQ1ApEgffXrbGx6yA2bUs5A8A7tXLI1HHj6wA4G7C9UOpR3P5s4FSk4VbbwE4wRKJFZXy+SklbaKoCaALDA/PZFvZFMXfB39eGQPTjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVuLXgrpyQCJ0+82osYCAHdHnU0quGwDoJy96tsfiWg=;
 b=XgNqEp6szwdFZoluJ2lFCWnRPHMtbHJkjH+IyxZIARX9d1giBkMpKU3e5KNbSBAg+ZKtIpU5amduxD1cmi/U/hc4j6QQv0GB7w5wBs6dtGryp6ee6dB3QE5TIHYcJi7HEXH61HwIBuqA9DR8SGB8FhLtnnTCfGXV5Ckfyo0vbms=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by MW4PR10MB5809.namprd10.prod.outlook.com (2603:10b6:303:185::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 18:26:15 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9%6]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 18:26:15 +0000
Message-ID: <7973f736-8950-c853-7333-101e69bb40a9@oracle.com>
Date: Tue, 5 Jul 2022 14:26:09 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V8 05/39] vl: start on wakeup request
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
Cc: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-6-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CLZrnj=AXb=-C+MOU5xB7h_4YUqrn4W+rV6yoUax2ur7g@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJ+F1CLZrnj=AXb=-C+MOU5xB7h_4YUqrn4W+rV6yoUax2ur7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0240.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::35) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1c0d155-5401-4508-e2c8-08da5eb3d83d
X-MS-TrafficTypeDiagnostic: MW4PR10MB5809:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zEqjbJ9zenB8K78TLyBGdnosuWVm8MN5HAT2h5lM7gT5ww6HFEh5Ji4PqztnRJbS2CeUHuAs/Eta5XXFd++LTxGFIv7SJe7awoWzsSiP/LZQHD5WXk5a0LNJCgJ7yByIvAGXqGxw3Ve+YNZuoBJ0u/EerhCEjWLpW9cW+G8K3bAk+biFlTg1bJh5VPnq/E7BGC7A4XSfhpslV5w1DlwiqeJYhiMhrri2ybOXtWbtDCOPJBnGMuKi/AZk5Tmy+GIvhe1jkrw28PauavgS/mIcvKSVe/PtaphxviX6zGg1lGFV7jCI1qdFXSLU8DZrybt0G1jPP1Tko62EEEGW007PABe8cU94Cjm2zRvwtdiJSILKqy8PCf2oyEbZ1zfeDBAuqo1Er2z31rC403WEUaGr8P7o2MFuIUvuL/nNwwiIZOW5kvtX/jF5MgAvHD9vUWyTu3NA37goxG6vaDBlo6gYwy5B1+nnVLfDTV8WD1kGbj6Ab1pcyDXYeHPx8kPtaU3wCiDqawy8a9tDa0kV6OG8ppJ0xAQeKskMMHI3mdUD+z5NJyn8caqeKgehYK9bdIGp+TyO0JXaQ+LwWKzJ6spnfRhRFbfZmhR4ffxYJF/oQpnkFFrpyNyMAsR9ThvMgI4jD0Te3bQ2c9MozPtLgdKRkh2zHqRsofj66Geojtb+mO2KRSdXetL2zPTVFcgpE4zJYo9dvZ1BXbednZVt4lK/AHPqWQhepgmE9ABMNVciQ4A8e/E33K76LaDFuC7uojN4EjblW6SRnGnkMP+1ONsr9x6/Z7Nn9Lj6UgAC6iPUMKGiHUwVWTWos3GkVm9B6xzuY8h2/Dckz/4wR2dRgIBfgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(39860400002)(366004)(376002)(396003)(38100700002)(66556008)(8676002)(66476007)(4326008)(54906003)(66946007)(316002)(86362001)(31696002)(2616005)(6916009)(31686004)(6486002)(41300700001)(6666004)(2906002)(478600001)(36916002)(8936002)(6506007)(44832011)(186003)(53546011)(26005)(83380400001)(5660300002)(6512007)(36756003)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXZZTTNpc3ZkRFZHWU01b2kxc0g3a1lsckFoK3VCM25NM0RoZlp0S1JOZ25E?=
 =?utf-8?B?d2ZOUXI0MUpOMnhrbzYxeWxWU1hqc0dxcmFHSStXUTRtYkRmb0ZTamVraVVD?=
 =?utf-8?B?TEpVS3VCcFVqQkhYVy9HcnFDbndvSXB5YWNsNWNDeGRvTUdPNXBXREN4QTM4?=
 =?utf-8?B?SnJxNzd2OTJmbGxhZ20vc3hJTytlbWNzbkhDTGlxb3YvVXAzOHlFOUpwOEc2?=
 =?utf-8?B?NExSK215NjVZZjNYMEsxNS9xT2M1RTN3b3VnWC9DWTNFc1lkU1h5dHI1aFlH?=
 =?utf-8?B?QzJMQ1NQa28xZmZlSyt2TXBzM2M4OUFTTlFRakN3dFZZVmI1N2FsL0V4NGJv?=
 =?utf-8?B?TEV3NlZXNG96Sll6WWZtZ1N0QitJTkUxZWtQeTFpL1ZlbnVRelZGYnlJeCsr?=
 =?utf-8?B?QWxrajlVWkZ1ZU1vZUlVYTZMZzZVR2xsRGIvVXFBRldYVlp6WDlPK3c5T2Vo?=
 =?utf-8?B?Vm1pckRLTVJCNVh0WkpnQVVhWXQxOUdBeC8rV204QTFpcFJHb253bUJUQVlH?=
 =?utf-8?B?dFo0UytKKzg1SDBneWlGRS9EMnptT2duUTRiK3E3VVNic1hVQy9Rd3V6UEJU?=
 =?utf-8?B?KzF5eTNaVjBtUktYMUtLejRRcWZ5YzBRd0syU2t4b09IN3lxR2VzckFwb0po?=
 =?utf-8?B?UWZCc1dST2FqdldkSkpSRkF6TEhRWFBobEdEWjNyWjMxWkc2c2ViRVBYb0Y3?=
 =?utf-8?B?NW5oVzBRQTU1dWtXdHF3UXJoYnI3d09KNFRZNENEUTNQcUZpKzdqazQrRkVV?=
 =?utf-8?B?Y1pTbzd6SUpGR0FEemRFejU4ZEdZVkFRZnRUTTB3LzIrZDQ5Z25SQzdqOHFy?=
 =?utf-8?B?M1VNcVJObS9sNmNRY1RRUitSSHBxcHVUbEJCejFISDNxOXBZbHFUejB5TWpT?=
 =?utf-8?B?cWtLL3doVElVWTNaU3puODMxdTVOZitXZ0wwaThETUpQODc5OHp0SjFQTlpy?=
 =?utf-8?B?WjI4K2ZMWDJpeGN1RWsxL2NKTnFyYVhBajdGeGFsd1pBREIwa2pvYXp3ZnZm?=
 =?utf-8?B?QURUZlZ1WUFYcS85QVVER3hUSCtYYlFRZ0lmNTQ4SjNCM2R3cUR1T2V6aWpD?=
 =?utf-8?B?NXFJUEVJb0ZqVkw5djRyMWxhWTV6Z1I4VlBBdkdPb0l2alFyaEVrSEpZZ3Rr?=
 =?utf-8?B?VytNM01pZTN4dXNxN3BVeEZBWWViczZkWGZpcFJoQzZzRitnb05meHd5bU9y?=
 =?utf-8?B?RGRhRjJYemtiTDVmNVM2SE8yVVU5b3hlUUgwVjZ1V0J3VkpQRHRVc0daMWY5?=
 =?utf-8?B?eFpERHNIaTdkMTJYZHd3MmR2dXc1eStCNUk3QXR3OEdlWncxU3BkeGViTHAw?=
 =?utf-8?B?djB1MlY5bVFWRkNaeHpQUEQ5N1RoMm9MK2ljdE9EN2xleU5qREJ6RGxkYndq?=
 =?utf-8?B?a21tcitBTFlYdTh4ajRkL0xlZWlDc1BuTGZ3VURnRTVzUFp5blprVUVyMExx?=
 =?utf-8?B?bENIV1ZuRVIrS055SlNsUkk5d0E0VjJqSGJYeEo3RDE1UUptY2NQM1VoZGZD?=
 =?utf-8?B?QlpnaEcwaVo3MVFEbjFOUHVVSkppbWdnWkhjMGtnK3Q2UFdwbG5oRE5aQWtv?=
 =?utf-8?B?d1FNUW1GUXdPNWx4RURwRlBBRTNmZEp1Uyt4NWpNdmZoVTVQMmdML1Y0U1p0?=
 =?utf-8?B?SlpCUmdWQ0tiekd6LzdGV3pobGNEMGxqL1pxVTdtaWxPaGtLbHpuK2xNK3ow?=
 =?utf-8?B?dHBma1NBMDdJdzlzb2N0dGZqRERDWG45bkowWkxTZ1FobFJrbWhvRnNQNEhv?=
 =?utf-8?B?clJuT21KL1FBSkowNkpDVWNHWWh6dld2dXNFVjRZNFB5dUs3WHY5cTVzYXFV?=
 =?utf-8?B?U2xaTG9rTWZqSFVPKzJSbHJhcUNkbnlBTW9tV1p3QWZjMGpkeU5iNURXSm1p?=
 =?utf-8?B?S3haL1Q5RHVjeWF1a1dpRStVTzBIOHRaRWpZZmhsL1ZwTEtxRmxGdlBOdnB6?=
 =?utf-8?B?eVE0QjB4SFZtYUZ6cVpUV3V2VkhXblhaU1dPY3N3b0Q1U2RCUGpmZDZ0OUNm?=
 =?utf-8?B?bDhrNitGR3hQakE5bkxuZVVzZ0tBWnA5ZEVzeW02eUZYOXIwT0lvQUhhTTNr?=
 =?utf-8?B?RFZ4SUVOZS9lWVhDS0xtTmtGK29PRTBVNFYzc0tWRGxBMTQ0Z0UvYWM3bmkr?=
 =?utf-8?B?UkxpVWwvYlJkZnQrWTFBQVFRb1d6QXdSZ3N2SFRpYThncWFNb1EwWHcybzlS?=
 =?utf-8?B?Snc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1c0d155-5401-4508-e2c8-08da5eb3d83d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 18:26:14.8625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vbU59nsJX59WMMFukyXIyL+Gbwjn2zLuJcbrlmYSwJk2fcHGcvhnSrmADQnGMk6133iPAyJ3ffuCGCJqYuJgL1Y6p/efoUImwtmlWNLURTo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5809
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-05_15:2022-06-28,
 2022-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207050079
X-Proofpoint-GUID: TPhiDaa2j13yo2xyGc0rQ9BqYQgB6kNK
X-Proofpoint-ORIG-GUID: TPhiDaa2j13yo2xyGc0rQ9BqYQgB6kNK
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 6/16/2022 11:55 AM, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jun 15, 2022 at 7:27 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     If qemu starts and loads a VM in the suspended state, then a later wakeup
>     request will set the state to running, which is not sufficient to initialize
>     the vm, as vm_start was never called during this invocation of qemu.  See
>     qemu_system_wakeup_request().
> 
>     Define the start_on_wakeup_requested() hook to cause vm_start() to be called
>     when processing the wakeup request.
> 
> 
> Nothing calls qemu_system_start_on_wakeup_request() yet, so it would be useful to say where this is going to be used next.
> 
> (otherwise, it seems ok to me)

Will do, thanks - Steve

>     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
>     ---
>      include/sysemu/runstate.h |  1 +
>      softmmu/runstate.c        | 16 +++++++++++++++-
>      2 files changed, 16 insertions(+), 1 deletion(-)
> 
>     diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
>     index f3ed525..16c1c41 100644
>     --- a/include/sysemu/runstate.h
>     +++ b/include/sysemu/runstate.h
>     @@ -57,6 +57,7 @@ void qemu_system_reset_request(ShutdownCause reason);
>      void qemu_system_suspend_request(void);
>      void qemu_register_suspend_notifier(Notifier *notifier);
>      bool qemu_wakeup_suspend_enabled(void);
>     +void qemu_system_start_on_wakeup_request(void);
>      void qemu_system_wakeup_request(WakeupReason reason, Error **errp);
>      void qemu_system_wakeup_enable(WakeupReason reason, bool enabled);
>      void qemu_register_wakeup_notifier(Notifier *notifier);
>     diff --git a/softmmu/runstate.c b/softmmu/runstate.c
>     index fac7b63..9b27d74 100644
>     --- a/softmmu/runstate.c
>     +++ b/softmmu/runstate.c
>     @@ -115,6 +115,7 @@ static const RunStateTransition runstate_transitions_def[] = {
>          { RUN_STATE_PRELAUNCH, RUN_STATE_RUNNING },
>          { RUN_STATE_PRELAUNCH, RUN_STATE_FINISH_MIGRATE },
>          { RUN_STATE_PRELAUNCH, RUN_STATE_INMIGRATE },
>     +    { RUN_STATE_PRELAUNCH, RUN_STATE_SUSPENDED },
> 
>          { RUN_STATE_FINISH_MIGRATE, RUN_STATE_RUNNING },
>          { RUN_STATE_FINISH_MIGRATE, RUN_STATE_PAUSED },
>     @@ -335,6 +336,7 @@ void vm_state_notify(bool running, RunState state)
>          }
>      }
> 
>     +static bool start_on_wakeup_requested;
>      static ShutdownCause reset_requested;
>      static ShutdownCause shutdown_requested;
>      static int shutdown_signal;
>     @@ -562,6 +564,11 @@ void qemu_register_suspend_notifier(Notifier *notifier)
>          notifier_list_add(&suspend_notifiers, notifier);
>      }
> 
>     +void qemu_system_start_on_wakeup_request(void)
>     +{
>     +    start_on_wakeup_requested = true;
>     +}
>     +
>      void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
>      {
>          trace_system_wakeup_request(reason);
>     @@ -574,7 +581,14 @@ void qemu_system_wakeup_request(WakeupReason reason, Error **errp)
>          if (!(wakeup_reason_mask & (1 << reason))) {
>              return;
>          }
>     -    runstate_set(RUN_STATE_RUNNING);
>     +
>     +    if (start_on_wakeup_requested) {
>     +        start_on_wakeup_requested = false;
>     +        vm_start();
>     +    } else {
>     +        runstate_set(RUN_STATE_RUNNING);
>     +    }
>     +
>          wakeup_reason = reason;
>          qemu_notify_event();
>      }
>     -- 
>     1.8.3.1
> 
> 
> 
> 
> -- 
> Marc-André Lureau

