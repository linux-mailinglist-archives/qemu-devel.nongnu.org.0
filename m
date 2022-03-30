Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB98D4ECFE6
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:04:32 +0200 (CEST)
Received: from localhost ([::1]:40070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhMd-0000o2-Bt
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:04:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZhLd-00006k-6P
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 19:03:29 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:39958)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nZhLa-0005Vz-L3
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 19:03:28 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22ULCI6P032352; 
 Wed, 30 Mar 2022 23:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ZHnYDE3uv27vP+GIwJlgP9BG3I061RUDkP+9/eFsFoI=;
 b=gRfE7UoTteD/P1Grfm+fujj2hdAXM6msoPQy8c0bmAmvieC3jb8ZHrf3ZXW8n3RQaD5R
 8Iqt09GRKfPt4Uh9Ed1rCkdu4pj4eqn+eRNUDB2RR9aRs+K+vae7QB8CL5T92ilfyfBG
 tCHxtkShCWXSyKO9Pf2FKqXpY+EE3uu3+cjZXva5QsdJ79a7SX9xagbSOt7t8ud1x0A9
 K4aXA227I9BaIVS9ca55SuNtGEgsT80yA78BQ18s8P75UgSNE+4JUQn79pR1RfkiCvoE
 1nRO7n5umIXgWs4zqhVBj2Q81n00P6b1+/XnPEUSdB3IVFrKZDhn7daMWEItJXBH97Eo 6A== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com with ESMTP id 3f1uctu1qr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 23:03:19 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 22UN2OZV040709; Wed, 30 Mar 2022 23:03:18 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3f1s978sms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 23:03:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXVyrQLRG1DZlVX7D/zMbxpR9e54yIrMytB+9kRcvb9DQDaaQEQfrtQr32XiBOR3HDB4ImkkboaGDfsYpWLrH5fcVFcmNiVYDKwiRIEEAylP09zKeV7feScs9Gye+3faCOanM7IvqPbfm3N5HFmQ8uvYwQlXTscCCN6aWrgbYqwJb5uruHX9tSseHp5lQXn0PafhQWi9stlZhy/16sln7o//sKyoSapRl+MzkwLfcnSmAW5X46ioa13zGmp9U+C6fEmMxBrX9QTEmXW1Go+cqFW6GpG3H73LrR45UT8kBCDpMR5V8TeyQNG0Aq8GnSYEpQhMQUvNpChSzexCSl18UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZHnYDE3uv27vP+GIwJlgP9BG3I061RUDkP+9/eFsFoI=;
 b=kYvH6lttzVWuF40uD7jZvhFzbVl8CvG7sWY86kgqPAzd+Ba8O3gquDXGkinNwamF3Y7Jc423NrYFqW3su/MI0mFK5TS6PlSZCqBU0JVizkCzjpPIBOsVzSzUGEpuAY0pBh9hdOoVw6BicLeHmBclHQiPXju9JMKaAu9vVP9YavxzGSF5hh9YpoipeRrny50JLbkNp/dg52oFgXsgX7HXC8yrLAsvY1x090fhWViIUZ29rD6EBvw4OLacVZvO1yHHjcO9a29wsfN3C52RzwWEyCxqK1aXyftqIxmqmkm7hMdpbyIhTL6ezyuNq1mKB8Q7vIGktNQni4rEwQ4G4lV2lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZHnYDE3uv27vP+GIwJlgP9BG3I061RUDkP+9/eFsFoI=;
 b=Z6v68k3xHgJp6Je3k7icjYlAPjcexU3G73/wLz4eWje2i/Kiuw61vVnRzd+QtfAKyEPtu3RBdve2uziqBIzEhSHdXXLHwPVDUBdWmLyjULkoa30xfk18uDtLnNiFcQGIShSt+wJOdK5hQsXG9AkvmDZYtjS0xjs+nJkGOu4BvfE=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by MWHPR10MB1998.namprd10.prod.outlook.com (2603:10b6:300:10c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.21; Wed, 30 Mar
 2022 23:03:15 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 23:03:15 +0000
Message-ID: <f8ace3a3-8f86-841e-c056-271528d5ba9c@oracle.com>
Date: Wed, 30 Mar 2022 16:03:11 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 7/7] vhost-vdpa: backend feature should set only once
Content-Language: en-US
To: Eugenio Perez Martin <eperezma@redhat.com>
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-8-git-send-email-si-wei.liu@oracle.com>
 <CAJaqyWdF55nKD05C54OOvM5-mmsCG7FMixKLguPGNR4Ostqnmw@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAJaqyWdF55nKD05C54OOvM5-mmsCG7FMixKLguPGNR4Ostqnmw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::30) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68ef5962-6685-4df0-23b9-08da12a178a3
X-MS-TrafficTypeDiagnostic: MWHPR10MB1998:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB199853B7B1C1269A30884D61B11F9@MWHPR10MB1998.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uXb9TSyk+M651todPRlk+Hl8m3e/5TazDLm1Vqheojli/6/mJ+wdI0T+ymFz2U7+U6tcMxqhGKPpLThSmEW22XV6jEdoKSQa9x0FyVfayZfoe5REW1tZkTBw1I/fYtgc3W0dnmqYwM8aQU1oISaATRo/ClmBDAaGj6KluQfujjQgT0Ft+3iZR623A5nDUBbIaUIPo4anuRrwi9T5mkfzENncyQnKR6A4N1PJ1LXZO6ZGUNBPD4G51WZVNIKgDiU9EqByUWro37YEJVWWxTMlXi3gDM9jq+zhUrhSz5Dlh4f4ChQhbgKbv5F+4yInqlSRB1UHDRwLfbKZa8dNaTRPvSkuI/ySbpGtBR5n1AHGRh2uExHJKEyYJZr+y712/km86C0DxeHqj4W2iy4Lbu8O+nyr3F29XEghvj3WRkVfqOwSPprYD83s3DoZK6C8XsFAIWUlYR2gqh3mQWA6S3iWEM5gilzkZAP25S/qU7+kbsqE2iDzn9TWcXVnzRnest0SJybZUdQiUBpJvTlPe8fmVhWA70V+ABz/hrAtratpgtAXKFcXSG0YRUJ+Bc40VSt/KfKbumxjTX0hjTKDd1uxbxzpGwPBWGkLYkIM45fqh5GL0HTbJO3hzobF1W/PCT7o9vC7ujQ7Wi65ZCR40hjYt8F0KIyBpvxbD3ntlv7sU0BZO8ObDH1yELZILfswkI1c7qyd27zMruJAFVDe8u8usNP4RNdAPpUqcidiEuacdlhQrJ7GZut2wmcZPmx77G5o
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(8676002)(4326008)(186003)(66476007)(66946007)(86362001)(2616005)(54906003)(26005)(6506007)(6916009)(66556008)(31696002)(316002)(6512007)(508600001)(53546011)(6486002)(36916002)(6666004)(66574015)(2906002)(31686004)(38100700002)(5660300002)(36756003)(8936002)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnF5bUNpalZMUENRbXdUaHprS0dNeTQyNWI5QlA5L3hVcWFIVVEzRU15a2Vq?=
 =?utf-8?B?akdESXdpaTNuaXd1RU00YmRyNGdIZ2dIWUJQdEEwSDIzTW1IdTJ2SHVJaGk1?=
 =?utf-8?B?bFJsbTdkQmxjeHBaeTFEei9HWGdydEZPSncvbk9yMWo2Mmt6NXR6eURGWXUr?=
 =?utf-8?B?VkpUQ0ppMGttQ0grYk1WOStaUW1uNk0yR0lzaHUvZzVxVFNhcEdGTlowVWVR?=
 =?utf-8?B?RHg1K3ZyNUttWmRIVlBzaEVpY3RYbVdDaXFrTXJSWWRHUFZobGpXeEF0Y2Fz?=
 =?utf-8?B?bnhOTyswL0o4VTV3MisxdDFLNkxBR2NwMC9RZVJlM2ZscXVHbThacWRPRzZ0?=
 =?utf-8?B?T2JkV0g5MWlTaEJOS284ZXMxNnBKKzhTVkZXWXZGVW5PN0c0Ym1TMnJiNkp6?=
 =?utf-8?B?ZFRMNWlSQzdMVGFCUFRaVkMwWlFGTnprc2JlaTFWRFJIQWo0QTBwNkJUZnpO?=
 =?utf-8?B?Q0wvSWhwRFR6USsvZWNBbEorcDg3RkZjMnErWEtpREZ5RDY5VGVaS1JYVDlH?=
 =?utf-8?B?VUpoWGN5Y0hXTysvSFltRU9yZTVUNkIreFhzclZJTEh4Q3c4ZTFLZ1hDdXJM?=
 =?utf-8?B?NElydmZ1VGloUEQ2WGhhUytqYXlnK2d1VWdhMU13Zlk3Z1BIRm1GYktVTTJ3?=
 =?utf-8?B?NndUU1M5dnNLNEpwN2RCWFZ5OXhtTVlMay9SYTRzd0UyWndMYnpJVG1NUS9Q?=
 =?utf-8?B?UnRlMkJ5Sm5qZGE4YThCcU45UVVsY2NEUDkwRlZaWWxyR1V1WUMyYm9ZeG8z?=
 =?utf-8?B?UW9GcXhLSWdwVlFjaHBiNXRRekl3SHlYaE9Hem1GdWZxNk14cjdRS1RaalF3?=
 =?utf-8?B?b0k5Nm8vUzJFZ3hwakM0U1Jna3NEaVZSaVdFaWpydENMQmk3TzZCVkRrZWtW?=
 =?utf-8?B?YU5xR05Pa05tdDN3dFo1ZDNkMFRVSkNhY010SkRsR2J4OWZsNTRPcU5PR29u?=
 =?utf-8?B?RzdPakdTRC9Bb2RnMkx4cVhuK05vbDVOSTZaQzd6cjZ1clczSlRmelZsK1hY?=
 =?utf-8?B?L3A1aEc0eE5ObVNJTUN3b24zcEloVVA1NTFnWkI5aVJKSVRhaDFkOUhnRkN1?=
 =?utf-8?B?RTN5SVlBcy90TU9aaWFOYUErb2YzN1JYZVhmTUEySERsYjV2ZVRDQVc1VHJN?=
 =?utf-8?B?N0FEcUJiUEkvRS8vdXBFTXVUVkMxQlFramNldVRnSDNvK1R2TFd5b1BtWkxT?=
 =?utf-8?B?UTBXbE5PbzdSOWhwS2JIS1hqa1BQcDVyblAvOEt4Z3NaaEFjOTM3TnloNWgz?=
 =?utf-8?B?QUVLZGoyWmdRYVYyMDV6MWJUeENHY1FJZHBjWHlkcjc0MW81QTMydFIra3Q4?=
 =?utf-8?B?L09zcEpUZ2RiZTVhTXdoVUI0eUU0UFpPNmhzTW1RWkRVTzF6RTIvNE93QjZj?=
 =?utf-8?B?Y1Y5MzhncTJBd0MvOUlMdXd4TUV4YVczOG5SaURVcFJVb2JaZE0wYWZndW9x?=
 =?utf-8?B?WGFyQW40SUMxU3RDUVVpWmZkb1JPWXUvWlRCZFZiUUhZZ3gveXdsMllXdzdU?=
 =?utf-8?B?OVhwMTdWU2JvKzhhSzNic091WkY3MDB4NXJFR1RzMElicHVlWVNpSWlDb3Vn?=
 =?utf-8?B?bjUzNnpmSkZTcWRCMFVKUkFqZFBOYVNkbHRhYk1PRzBHUjJSMkRlbGlVanpw?=
 =?utf-8?B?a3JNV3BsNi9Ic2tPU0hNYjB5MnJPM0JVMjdQZzZqS2FpNEcrYUhyMjRROHRE?=
 =?utf-8?B?cGt3OXgvMS9hUTJQV3E1S1JKZ01tb1R3TVBFcjFYUmYzQTB5di8ycUt0QnFl?=
 =?utf-8?B?Y0pBNGNTQUsrV2pHNHcyVjQwZ1dJQk9PUnhiQkhWTjRjWG9EWHVPVzFmNUx6?=
 =?utf-8?B?K3JUb2NlOGhNVlZxMFEwT2UvL25KQ2pzTXRJMEE5UTlMa29Yd1UwdmFUTFE4?=
 =?utf-8?B?bXo5dFloZlVybHkzRGJyZ2xKN1JzQXhGVnNUa05LSlJNczJ4bWVZOXJMc25G?=
 =?utf-8?B?Uktna3Fra3kxeHVIK1pXcVM1ZzJLemcvQ3g4cXpRcGVISjNLSkVFSzBiSVVh?=
 =?utf-8?B?TWx5YXZGRWwwdXVlWVNGbzBXSzVxZ1BmOEpJQ1o5dU4vV1pmWks2L2dWTE9D?=
 =?utf-8?B?ZVpOY1JJcDZCRFg5RFo5Q2JrQjMvemZ0eWhnUExVWkdPTXRtaEVPYnF4T0ZF?=
 =?utf-8?B?R0F2bEZWRFNTUHNPN2t3M1oxSTJ5cWFtVGhJdHRRbDJKNTZPNlNLT0RyMUQr?=
 =?utf-8?B?Mkxmc0FsNFRvNVhsTDhuTHVoNWlvUVlUVldqN2xqNExhU3d4UTZRVlY3eXQ1?=
 =?utf-8?B?eTIxWURwbW1OL0oxVk9GdldPZVMrVXJEZUI5dXJSSVF4eHVDYTdVdEtiNGZY?=
 =?utf-8?B?Sm5sZnFsS2dDSXFwSy9uaXQ1QnBZOVJsdGV2cDJURFZ0TFBlVHZsc1IvRGx2?=
 =?utf-8?Q?I7J2ryS554R9t4Zk=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ef5962-6685-4df0-23b9-08da12a178a3
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 23:03:15.0119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 43dC2k8FYeTilov05Gm2pnk4DRXNue0arxVRMqmgTeL44KoZ4VOwnCotmCAvapDHZoa3OTTs4jkldPy/492kDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1998
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.425, 18.0.850
 definitions=2022-03-30_06:2022-03-29,
 2022-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 mlxscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300111
X-Proofpoint-ORIG-GUID: CNaTm6XkZu-oXem9dEnA8V3DxneiKfXp
X-Proofpoint-GUID: CNaTm6XkZu-oXem9dEnA8V3DxneiKfXp
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
Cc: Jason Wang <jasowang@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-level <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/30/2022 12:01 PM, Eugenio Perez Martin wrote:
> On Wed, Mar 30, 2022 at 8:33 AM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>> The vhost_vdpa_one_time_request() branch in
>> vhost_vdpa_set_backend_cap() incorrectly sends down
>> iotls on vhost_dev with non-zero index. This may
>> end up with multiple VHOST_SET_BACKEND_FEATURES
>> ioctl calls sent down on the vhost-vdpa fd that is
>> shared between all these vhost_dev's.
>>
> Not only that. This means that qemu thinks the device supports iotlb
> batching as long as the device does not have cvq. If vdpa does not
> support batching, it will return an error later with no possibility of
> doing it ok.
I think the implicit assumption here is that the caller should back off 
to where it was if it comes to error i.e. once the first 
vhost_dev_set_features call gets an error, vhost_dev_start() will fail 
straight. Noted that the VHOST_SET_BACKEND_FEATURES ioctl is not per-vq 
and it doesn't even need to. There seems to me no possibility for it to 
fail in a way as thought here. The capture is that IOTLB batching is at 
least a vdpa device level backend feature, if not per-kernel. Same as 
IOTLB_MSG_V2.

-Siwei

>   Some open questions:
>
> Should we make the vdpa driver return error as long as a feature is
> used but not set by qemu, or let it as undefined? I guess we have to
> keep the batching at least without checking so the kernel supports old
> versions of qemu.
>
> On the other hand, should we return an error if IOTLB_MSG_V2 is not
> supported here? We're basically assuming it in other functions.
>
>> To fix it, send down ioctl only once via the first
>> vhost_dev with index 0. Toggle the polarity of the
>> vhost_vdpa_one_time_request() test would do the trick.
>>
>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
> Acked-by: Eugenio Pérez <eperezma@redhat.com>
>
>> ---
>>   hw/virtio/vhost-vdpa.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>> index c5ed7a3..27ea706 100644
>> --- a/hw/virtio/vhost-vdpa.c
>> +++ b/hw/virtio/vhost-vdpa.c
>> @@ -665,7 +665,7 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
>>
>>       features &= f;
>>
>> -    if (vhost_vdpa_one_time_request(dev)) {
>> +    if (!vhost_vdpa_one_time_request(dev)) {
>>           r = vhost_vdpa_call(dev, VHOST_SET_BACKEND_FEATURES, &features);
>>           if (r) {
>>               return -EFAULT;
>> --
>> 1.8.3.1
>>


