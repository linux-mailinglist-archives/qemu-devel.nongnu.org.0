Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1A33C27A7
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:38:09 +0200 (CEST)
Received: from localhost ([::1]:47290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1tVw-0007C3-BI
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:38:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.christie@oracle.com>)
 id 1m1tK2-0002ZK-QR
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:25:52 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:2692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <michael.christie@oracle.com>)
 id 1m1tK0-00089O-9X
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 12:25:50 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 169GGfDK003038; Fri, 9 Jul 2021 16:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 message-id : date : content-type : content-transfer-encoding :
 mime-version; s=corp-2020-01-29;
 bh=01ybZruS3p1NoHd5hSmadZrRmsP/A3nJmqSlJjzIeYw=;
 b=Lwyqf86qRiA4gsiMmV/1jmxQQ8oRpGtFlbr37jkahsstm+TPaOGNetMxfG4VD+B0URNm
 oe9PMHitOaijxMONDpSxlOU5IIHXQ8GRcKbfmTRwG31l0bHFrBJOQYdnNZiI2yHNIcLH
 Yih0tGjaBzj/ZwT/LDGO39ElQMNmcdGPLL8cHTdc7wefZxayxboUqjYxaZu58ybNTcrH
 UY8W4wE4J36lQKxbgrXRkWRSeV4EkaSXaQX9xp/K+dB7wUoX4PNgHnAh3uRl5ic8gNsZ
 OVjNI5uY4Zv/yRpL31Rq0HkRZAuAGzuKToDQ5a+vAG+Z4CHUbcZ0I14PiK5rEznsH+IX Iw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 39npbyksua-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Jul 2021 16:25:44 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 169GGGmO129681;
 Fri, 9 Jul 2021 16:25:43 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by userp3030.oracle.com with ESMTP id 39jd1ak18h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 09 Jul 2021 16:25:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e01vVHYTzwvBsEQh0GI6EOaCWCCzTmiz8DwGNqhRmAvWjTB2zrV22qWdNCPbkWj05N61KtbziQIYpt7buQJNCy1IEj04MLNGOIoG8aWxarBhEud6Ir04OCX3PCs97y0GunlMpe+38bBgNI5CYgNVhSSgKC+i41WNpKHNktheieS9y0+2Lxb3RuWeQnxjMKrAA8sazJOG/LoiEWYXHwbSLxht0iPqw6859YCEfGGdgG7ESL3CZALt6YdXeLkDwjoZNXBMFvBiCXRHf/4QhiDfAk7wvsdBqPRu+jCiQKaPVxpWu88tRSuSpOHw80kdXu8n5xZojuh37m3VMVR1rjvBWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01ybZruS3p1NoHd5hSmadZrRmsP/A3nJmqSlJjzIeYw=;
 b=Jfowmbts3A+92scO/qkMbL9j4AwIDweLlXvT6UNth4kAPnzIh8IjCfQDRSgpueKfQE8oDy73+iHvS+Ct3WUUXeIHboiIKJ7uIrjkOxpeoMg+ELrqJkdKF9HVXKPgdayRJDe5WFWWQLIGtJqpB+dHcmKUtdVXEUPJ9dGiHExMSehQi7Y0J3zE9zoUSiEiAVFYsYSD3AiR5GmGNwCh7tHX5yfDn1JaRTmnGwl0RcN7Y+pMbyM1eJ02MQJSp5Nz7jvwGpJ9dr+PBve50h3E/dj62MNFCfqCyaCBA9gd1TnajN3oadkMiZ2hdQ7IN3xw2sG8UrtyPFeVhGCUCr4UWavwfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01ybZruS3p1NoHd5hSmadZrRmsP/A3nJmqSlJjzIeYw=;
 b=vOlnzxItoDuxO2eSmRIMin4zyXOrKmmxbZbfdke7zCMajxET8RNdqKKSx6KuLl23E6R5CtU9hm3EhJQViH6i4vUM8/wAb54QMXerFiIqUK+nHTPZaAaL84At0PV/xBO/CYVJXJMtPxIjJHpKUtiqNmO8c+lleLMTJ6LPCSVpO4M=
Authentication-Results: ubuntu.com; dkim=none (message not signed)
 header.d=none;ubuntu.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3573.namprd10.prod.outlook.com (2603:10b6:a03:11e::32)
 by SJ0PR10MB4639.namprd10.prod.outlook.com (2603:10b6:a03:2db::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Fri, 9 Jul
 2021 16:25:41 +0000
Received: from BYAPR10MB3573.namprd10.prod.outlook.com
 ([fe80::5cdf:33ab:8d17:9708]) by BYAPR10MB3573.namprd10.prod.outlook.com
 ([fe80::5cdf:33ab:8d17:9708%7]) with mapi id 15.20.4308.023; Fri, 9 Jul 2021
 16:25:40 +0000
From: Mike Christie <michael.christie@oracle.com>
To: libvir-list@redhat.com, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 Christian Brauner <christian.brauner@ubuntu.com>
Subject: question on vhost, limiting kernel threads and NPROC
Message-ID: <b6d181c2-ec7b-913b-3eea-142fcce7c104@oracle.com>
Date: Fri, 9 Jul 2021 11:25:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0010.namprd04.prod.outlook.com
 (2603:10b6:610:76::15) To BYAPR10MB3573.namprd10.prod.outlook.com
 (2603:10b6:a03:11e::32)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [20.15.0.204] (73.88.28.6) by
 CH0PR04CA0010.namprd04.prod.outlook.com (2603:10b6:610:76::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Fri, 9 Jul 2021 16:25:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1763f503-fa22-4d5a-fca6-08d942f630d5
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4639:
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4639C2AF02B189775C13A1A3F1189@SJ0PR10MB4639.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ySBjtSu8xPgtPEVMVFs+P80r95xhXiaPs5GqYZjmTVYkqi71wAuAoF7dpw4fxwpeK/Qs0zVnKv7Ox0uSHPGynAyIBW7EqtI6uElrj33bLrgTH8Dab4uz255a/cdO7YHNMoCvUWWiuVKD96RqmsWSQHk5H+7Bs9NTDZ/U7S2/+pB3zIR3EHsNpOSNNIVSfozKnSsbf3rnkRfth7Nv53uzB+e3qx/smOuUPtmmZ1wmOUsmi84G52cjT6HcmjSN3Q6C9aYYQUnOMOHpc/PjRgnkjCKytneO5SbXgC1Y+DDoum23nUQtIey+R1jiLICQOIfvrlwExy1z+Q8MaWb9UKxZlpi4AuvXGRPZChqaTPROQb43gyfCrBUdQYlC7JTKFbDOs5ZQjJN8KXnk5rKkeUwKpxQ0GynOoglbKLtMhVnjxShgXKsY4jjMwBu8RosBoKYgUVTsfMtXEcD5C8S2vmQwqxEqj+G1P6CRzT7ty3oDhVBQJqbww+wwhwynpThupWZWa/jImbs1XNZDSmphGrz4qa8uP/Gxc105itaKAdIIl3F8XP7nSCOFfMKBih6S/z7ye7ZE135I5baaoAdZO7O2K4u2qqD7nw2C33drv1z/JnU3KgPPF8fZEAoUL5+QrKlWS2TIfVYVMq9OI8a10DZLt21D1lAFYbkZtPSulhoUYDmx7AMcZlbRl0CIFdWR0ckMQdej0bXw7h8/x+/iu5gNo7zJLDXvs2oBRbEI4w261+5ke58xCffpB66C9HAmRB1493+vlFpAOLyNmoYNr0JK2WRfUlm1vRbMrrMk2qB978/UzDrd7te/UXbF/zDrvSZsELMkKpvifjz/WjrxBfJzpc5ZN4EgDntQrvAHUlqmoer2ZQeGzbMMmNkGUyfLU67S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3573.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(346002)(366004)(136003)(39860400002)(376002)(478600001)(110136005)(38100700002)(5660300002)(66476007)(83380400001)(186003)(6706004)(966005)(16576012)(316002)(26005)(6486002)(31696002)(66556008)(66946007)(8676002)(2616005)(956004)(86362001)(2906002)(36756003)(8936002)(31686004)(78286007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmR2dzRLVi9QOURyMDNxcWMyK21iSnRLMSt4LzFKc1VYOGh6TXNlL2VDSU00?=
 =?utf-8?B?RFZiU3hFdDlodzNFMG5VOFhnU0RySVp0eHBWVS95TllCM2FnVUlmbkU2blZ0?=
 =?utf-8?B?ZWJiaDZvL0hrQm9EUlJUNkJVRGUzaDMvcWFnbG9OWWNxMzE0aVBnQWpPTXBL?=
 =?utf-8?B?MmFPYThOdzhJdElGakFaZE5rWGIxdkRHd2Z6dmpDYyt4U1lBMHNtME1CV1dU?=
 =?utf-8?B?OVhJZE5sR0NaZ1BLNkpIMCtqL0RXNUtqN3gxTE53cG9iR3FxcEpOR1E3WDk0?=
 =?utf-8?B?QWZlc2xIVEU4VFBEb3NQVjlIbEVXTGFsblhwVHBiZ05ZY1RKWW01eS90Wmh1?=
 =?utf-8?B?UmNRcGcvSE1XdGdMQlpCdFdOT1V5bFJLemx1emlkUWZNYTRVR0tacXlLeGs0?=
 =?utf-8?B?V0V4NURIOVJCRmoxZURnVFh0azB6bjczRWtqSmNJVmVBNFlXRHpWOXJvL1BG?=
 =?utf-8?B?ZHJYbDVBSkpmVzNVQkxmUkg3bjR6cUNFMDl6Vnl1YSttRy9sTEZZVVZ6Vjgx?=
 =?utf-8?B?REkwVlFOemJjRGp4MzVUWkVUZXZFekVDb3llS2RTUFlTNCtINit3QitZUE1z?=
 =?utf-8?B?T0Z3Lzd1bkhrL1VCczhIak5CaklwZlNITng1dnR5dGpYL1FWUHlINGRTMlF2?=
 =?utf-8?B?VS9LSEllSjVhWHFvcGw1eTBHcGJDMm0yUnoyYk91N0NxYWRPY2FOVWJIZXpz?=
 =?utf-8?B?TmRqM2JyK3BGSnVCZVgwaWdwSWlNeGZMMUhUTHdaUVNQUVg0RGZWUjh0ZFpH?=
 =?utf-8?B?Z0l6ZFJQRUNxVmVJM2lIaGY2THVBb3VJcnYzdkU5SFN6clJMdklsVUtZTUZi?=
 =?utf-8?B?MzZKUk0veUttQ1F4VmIrOW9DOVA3ZkxuQUx0emtwdDZyVFIvK3RHbi9HMHdT?=
 =?utf-8?B?TUowemwzaWttWnY0QlZoRFZTUjlRbDZHRDlHWEFoU0NCeGpaSmxhQzhqa2c0?=
 =?utf-8?B?SWdESk9JUzE0QytpbGxIbnV4MFFkc2IxRDh1dGhLOVVBVFkrSGZ3YWpRdHdt?=
 =?utf-8?B?RVl3SXhrU0I2TER4NzFoc2hOVmp3ZmNDN09FYlZ4QUxIQm1nTjVaOGlQSDgv?=
 =?utf-8?B?L1A3bG84QWJMOUdac3NRNVlEUFREYW9jd0hJeTBUOUtiT2tiQmh2VU1sNDFx?=
 =?utf-8?B?cDRSSTFwNGZ1WU1tZ2lKL1Q2OC9VY1c3VVIxb0ZyeS9BalRtK1pQZkxGdVBB?=
 =?utf-8?B?L3oxQ3JydWs4OFlRbmFwQVN1OExWdVNqd0pmK0J0MzVHS091dGNLcWxFMnYr?=
 =?utf-8?B?WUl6UW5FODRoYk9DWU42OU1RT05zbEM2Y2F5UDlIejlSNkZxS1RwZ2tzUVN5?=
 =?utf-8?B?M2REclJobGtHQWRwaElLVGttSFQza2JKYnlqSWh2RS9XWHF1dzdONHNNSnRN?=
 =?utf-8?B?VHVzNG16S3lGNFltWXBDSHhEdkFXb096WFpSLy9NRVRYSjNkcitST3lwdFh0?=
 =?utf-8?B?SWdLTWdWeGlrQUFIWjlTdmxGRk9aNVNZaFhzTWk1NGFOcGxQenFPK1pPUmI5?=
 =?utf-8?B?S1NuRURVaS9wZEw4NHhUbnFPYWp3ekVOUjRjRTZFbXQwYVJwbWdEb1dpeGlL?=
 =?utf-8?B?L0FWTnNSSXNYdk5DMkMybE5aeElGaWdpNFZSdHIxR21IY3o5c3NCR0NndVJF?=
 =?utf-8?B?Ry9hR0dFNTEwT0U1VjNzWDNaeVBydGlUWGVjZG83djhWZDN0NXFJLzNUWUZH?=
 =?utf-8?B?dnpJTGJ5bzg2ZGRxQUk4YzZkbU93YWlRclQrTmE0ajcvYk9LZjZxek1xWGk5?=
 =?utf-8?Q?RbNHiRn2weWTOxiXKEgMJLbyoLVtmSjlIVrsX/e?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1763f503-fa22-4d5a-fca6-08d942f630d5
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3573.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2021 16:25:40.5020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lHSzxMC/V7ScRDES9h14kAiXRAgMtb7ddUcBmi6LnT2VZ1BOU8ZXvnKlW1q+syMyQWj9SJuPN3tYOgFCLquSlnLjTEaD8YKdvaXURJeaoGk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4639
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10039
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107090082
X-Proofpoint-GUID: 6pzYIKtGgNX8MQV0LcVmeqOG-2sEWUAN
X-Proofpoint-ORIG-GUID: 6pzYIKtGgNX8MQV0LcVmeqOG-2sEWUAN
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=michael.christie@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

Hi,

The goal of this email is to try and figure how we want to track/limit the
number of kernel threads created by vhost devices.

Background:
-----------
For vhost-scsi, we've hit a issue where the single vhost worker thread can't
handle all IO the being sent from multiple queues. IOPs is stuck at around
500K. To fix this, we did this patchset:

https://lore.kernel.org/linux-scsi/20210525180600.6349-1-michael.christie@oracle.com/

which allows userspace to create N threads and map them to a dev's virtqueues.
With this we can get around 1.4M IOPs.

Problem:
--------
While those patches were being reviewed, a concern about tracking all these
new possible threads was raised here:

https://lore.kernel.org/linux-scsi/YL45CfpHyzSEcAJv@stefanha-x1.localdomain/

To save you some time, the question is what does other kernel code using the
kthread API do to track the number of kernel threads created on behalf of
a userspace thread. The answer is they don't do anything so we will have to
add that code.

I started to do that here:

https://lkml.org/lkml/2021/6/23/1233

where those patches would charge/check the vhost device owner's RLIMIT_NPROC
value. But, the question of if we really want to do this has come up which is
why I'm bugging lists like libvirt now.

Question/Solution:
------------------
I'm bugging everyone so we can figure out:

If we need to specifically track the number of kernel threads being made
for the vhost kernel use case by the RLIMIT_NPROC limit?

Or, is it ok to limit the number of devices with the RLIMIT_NOFILE limit.
Then each device has a limit on the number of threads it can create.

