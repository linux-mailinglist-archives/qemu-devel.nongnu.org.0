Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0705186E2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 16:38:31 +0200 (CEST)
Received: from localhost ([::1]:55294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nltfa-0004SK-WB
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 10:38:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLY-0000TI-Kj
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:48 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:12830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jag.raman@oracle.com>)
 id 1nltLV-0001QG-Kr
 for qemu-devel@nongnu.org; Tue, 03 May 2022 10:17:48 -0400
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 243DEwCx004092;
 Tue, 3 May 2022 14:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=3pNimpuQZqiwrCvFuPMHL0mRMAp6gHodfV5qtEbdfa0=;
 b=QXqT32uSINYtcjFpCi75h7UyX/x924/OKneoQhZyiyau8xeTCq4HXfUtxykjm0orr2B4
 pJy4mpfttt7HcdP0/AxYZJUZj2MYmOl5kWWRr++rBfMAqlw3kLetSY4kh6q4LPW/UBnk
 kh6lut4Ej5kjyrrS1sl314FsK/CGE070Mmn76JKVMMOtE1Ev3FZWkEzPJNQd/9GA4Ry6
 tpTBMKqEHK/ka4sKmvDSqQj74H0ox667dCjL1HhXVfQpF+pdWx0nCshdCVFjd0WhWFSS
 +O4ZQdXfpZ25wuPuYZIxzcmzkHgw5riGackAuXov8DpjmlrtnrSZwg+5P2whJGUijjE/ CA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3frw0annj7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:41 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 243EFJLw032022; Tue, 3 May 2022 14:17:40 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2044.outbound.protection.outlook.com [104.47.57.44])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3fs1a4r3ww-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 03 May 2022 14:17:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ffjC+wmDzaQZ1QnHM0H3xjYX+mWaazCG3KeFrgcV4xE5PJq0XN+ASC64XsKJMHxCbS3gqLsTFgwZSCQnVS4rEq9CwLf/BP+vbEBqHB2JZ7uhGptr3zwouODj3TWGF4kLnXUJ69hAEU7ohtkVdPRYoMsQX2ES5d5btCm/UjM+BGZnf/oAbb2cgog7l5A1oITRurASnuNtrHTXD65BN1eXCwGNnQEo86ukjkC9phiLFo+Mab4leQ6xZJRJMPuNj85+mVTlsv1EZAYmt6Uv7zFQ5d4Ju9PYWewo9atMCxa0zVUqAzfUctvg9Oy8dIB1kDmom6N4dkZQw+4cPZtYW31QRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3pNimpuQZqiwrCvFuPMHL0mRMAp6gHodfV5qtEbdfa0=;
 b=L6iyMvTIPuQozVfAc7EZC4biIATdfVBtkNVAjOh3etXWNzGcch8qh4bGvcYDtTbOp0rVr1qzDYKuuiWwaRIZLy1niXsM+SZJoAPg6Q4gTJhI1hovsjryTkY+66Fo1sD4GSNHi0N80xaMS9iFyL9zosWCOGCv332MPBIBiSRug2Aa5i5WzmkNq4boP1pNiJecLPIkC1p7lx3CgMgmVHxMdsM4dXy83RvPp3ydrkaHeXFZRME7TNhtYgfJYx/+tKz9PB7FHI7ABbUCzMuGZq0ElpizavYjXPxmTxwE7KZD1Rfz2n98ChuC4DgbmnnxH3nF2XeJvmdgjLeeMxdKGhyCBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3pNimpuQZqiwrCvFuPMHL0mRMAp6gHodfV5qtEbdfa0=;
 b=vP+fIVpJymuvUdzt1J4Oqc1iiwcFsA09RY3kBNVVLK8XMjFv/BQNsIiYjYViTfU6UbmJZ9d6U+c7awl1PQZavViQSOFreMpQe7T1mVWs8EEifx1FEc+PBzBh1OFrmJNuLEWr2Dxg7P6XZu1FgTHMoDSzuTWrfjJZcTdPQ/yjk/Q=
Received: from MN2PR10MB4013.namprd10.prod.outlook.com (2603:10b6:208:185::25)
 by MN2PR10MB3358.namprd10.prod.outlook.com (2603:10b6:208:12f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Tue, 3 May
 2022 14:17:35 +0000
Received: from MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191]) by MN2PR10MB4013.namprd10.prod.outlook.com
 ([fe80::e9cb:e1ca:8189:f191%7]) with mapi id 15.20.5206.013; Tue, 3 May 2022
 14:17:35 +0000
From: Jagannathan Raman <jag.raman@oracle.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, mst@redhat.com, f4bug@amsat.org, pbonzini@redhat.com, 
 marcandre.lureau@redhat.com, thuth@redhat.com, bleal@redhat.com,
 berrange@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, quintela@redhat.com,
 dgilbert@redhat.com, imammedo@redhat.com, peterx@redhat.com,
 john.levon@nutanix.com, thanos.makatos@nutanix.com,
 elena.ufimtseva@oracle.com, john.g.johnson@oracle.com,
 kanth.ghatraju@oracle.com, jag.raman@oracle.com
Subject: [PATCH v9 12/17] vfio-user: IOMMU support for remote device
Date: Tue,  3 May 2022 10:16:53 -0400
Message-Id: <29948a10c3f2db09686fb6d257e31e4f873cb7d5.1651586203.git.jag.raman@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1651586203.git.jag.raman@oracle.com>
References: <cover.1651586203.git.jag.raman@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR11CA0005.namprd11.prod.outlook.com
 (2603:10b6:806:6e::10) To MN2PR10MB4013.namprd10.prod.outlook.com
 (2603:10b6:208:185::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af69b0b7-78fe-4020-1eaf-08da2d0fabb4
X-MS-TrafficTypeDiagnostic: MN2PR10MB3358:EE_
X-Microsoft-Antispam-PRVS: <MN2PR10MB335830CB1E25C0855963378D90C09@MN2PR10MB3358.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: voQ0cPQczoTjhRLhzWhqyQwwOVS4vYMQkiGtY4QbClD1V3FWYVaSTBFpcRiec5b6K4lOosqnkQAEu0Ya0cjQWGXwmB7WMPKZFEaqKYGkJGyfPW0P+pD9/t72JoIDPrnGh/1K2O16GqKjnCUUQLJZ3wGnJtJ0ZhVjCPgjcE2ehHhu2VgZ1gRTvpzzoXnm9EncIjtfjSJ1I6LfSiYVvoGQsxnJtMkbnGCqJAzLxKHoFGUAk5SL5JYxZWIJjpQL0GAqdsUCxmsyCvcjU1lwkvIdmWoVIaORjeOiUaNk0OiSrhYRo/E/ho30UDkQDb3IKnHRtMshCAoEPVhL1l9DxomE9ItuSgRSqf+5UHP4t7cuxX7OMDR+fgiuXNUo7zCjW35u5Ml2BPa3qUFPWCEB66u9+POOsMIr70bH3k/YWoXGRB+esRA6wvgkQRwF8GLjYr1DmQ7nBrtEp11mYCGKY7D8/u71X6xpUk5d0wLwACdfp4hGfc9nKPgmB8wZHMlY4pjJC4RqZqfisd7VdbOhA3Q3WPsr3XastPpj18Y31qo9GuMrsnUpqesAh+pJTyYEieVyMFAacPgT0IdK0JQN39Fd/JrBk1H+eW8axKOKgbqjDyH/2rD6wwlZ3nXncviaVnlr1rYtV4kfLJAzGOraYB5LdtqyEfIdKGcFA5ES0BzF4jGnUuq8/aCcQS1DhYYEuBUo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR10MB4013.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(83380400001)(66946007)(2616005)(6506007)(186003)(107886003)(2906002)(6486002)(6916009)(316002)(38350700002)(38100700002)(7416002)(5660300002)(8936002)(6512007)(86362001)(4326008)(6666004)(52116002)(66476007)(508600001)(8676002)(26005)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aFR4L21JN1c0MWszalNRWWQzTTVya2M4VzRlUVJLOUduelFYVVExTU0wZVNl?=
 =?utf-8?B?aER6YVlTWjgybWk1ejh5KzNkWm9raTlJbjhCMXNwRVp6enNKZWNYaGZLZVhj?=
 =?utf-8?B?aGpqc1dVamgvd0pSRE5qejhBSS9iOFFMa3FyVlNmN2NzbXNKY3ZnajEweCsz?=
 =?utf-8?B?YkZ2YnJKa1FrS3BHeloyd1NKR3hhMURMNzRtdG9EY2hKMGlCclVTNjJ5UkVJ?=
 =?utf-8?B?UXZKR3BDWmtzMGh2bEVkNSt0bjN4VlM0WWRoNkRyYjUvbCtIUzhxeTdKZEhj?=
 =?utf-8?B?RUQ0bU01dkRMZVZmZGVsWjcwUElyR0g3Y1JxdTdRSk5zMVFKQnVWM3IrNTJQ?=
 =?utf-8?B?dFhXKy92K0hZOWkyM1ExOGZQeVdhNXlTUUxxN1lKV1U3bHlzUzBJUDhUK2hH?=
 =?utf-8?B?enJVMDh6em1UWCszVHdpY1BsVm40KzMwRGs0RXY1cFJUT1BzUUswYndDYVVS?=
 =?utf-8?B?NksxdUR0QytQNitNckhHbjJUWmJhdGNxajJUbjF5M0NselB0cUp1cmswa3Ns?=
 =?utf-8?B?UFhnVm43KzBVV1Y1NzdUOGoxUTU5c29RdThiMnEvL296c2hQY3VUdE1GWVgx?=
 =?utf-8?B?Y3hBR1U5VXBVcElTT2VsTjNxV1ROcDE4TnhKWGM3NDFyRlFlYVN6cnFlcXRW?=
 =?utf-8?B?Ym41a1I1K1BWZURycXROcTFObmVtdlVaaUdZd212cFE0d2dCUEpLVGJmdk5j?=
 =?utf-8?B?QzhnNWNLa2l2VDZoWUZlaXRUdGxVc3loa25QYTErWEI2QXIzbDZXeVNQWERP?=
 =?utf-8?B?ZGxnZStEdndNayt1dy9oeGhxckNGN0xCMVJvQWs2Zk0yT1RLcnJqd1pnN1JE?=
 =?utf-8?B?UklXRlJGcmY4WnVtUUFzM1VrVlpSeTFqNDBLVVdPLzFPTnZDKzNRd0xVUnlU?=
 =?utf-8?B?VUozYkszUUxDMDdJbXdLN3N0Z1dWMldiT2RSSS9FSlNCQnpMb0Q0ZXBmakpl?=
 =?utf-8?B?Vy9nVTBqOElzb25BK3h6K040V0orN0ZoeElnSk5iUCtWbjNHMFVjVlAxeDdn?=
 =?utf-8?B?UDlpbXdmUElucTB2K3pvSEpxZHBCdXNOTlg5WjZJU0lZNUlOdlZLUmMyTW9h?=
 =?utf-8?B?K0hpWnVzYUpTcFBheVdHM2owQlQ4RFVQeTNpeW8ySE0vc3VWc3lqVXI1clEy?=
 =?utf-8?B?eG1VOVQ2K2dFY0xtbnNhOUlmTnhJR29jUVkydS9zT3A2RGFHb1FLelJsSEFw?=
 =?utf-8?B?amtzVWlCbnNxWVE2TjVoV2JTU2hxNDc4RkQ0dW0wUVlVRmFMMjdoRUJDd1h3?=
 =?utf-8?B?R1pHMUtlNnoyVG1yTVN1RjdNdjRveXZ6cXRhdFdSZ2F2Y2puMUJnSGpwVGdt?=
 =?utf-8?B?QTYzTElkMnF2VXZoSjBUbVR3aGRVbnJLb0Zva0ZjRVZlWFBpZk81S3lmRTJO?=
 =?utf-8?B?ZjZrZXJkMEc4dEFrVDRQbFpRdTlRakF1b0dxYU5xenZWU2pxOUxKdG1PdTZV?=
 =?utf-8?B?Rmo2ZHhtWTNIRXQ2NnB4UXhJMmF4b2p2OUNsaUZ2N0l2QTAxQVd6c2p1R1ky?=
 =?utf-8?B?WkV0L0R0bzhhc2R4OTZNVE0ydDFzUTE5STN6cE1kTTFvU2JrUG5NdVkyS1da?=
 =?utf-8?B?a3pBK1Z5eFVaSDd6SE9Uc25LM0hZbmNZRUJjbG1rOUt1dkRwcWZVdXZsVzVK?=
 =?utf-8?B?bnBiTTN6dUVmWmFObGtobmlQWWhvVEx4QUdSSEtxM1N1bUtPR3F6eGxHYnVK?=
 =?utf-8?B?VkxxbGhlb1BRYzI0eS9mQW1VMzdOSWswTDZZUnJ3VmZLalovVTk3bFhYcFoz?=
 =?utf-8?B?ZjMzVDdSUmpFNFVVV05DT1ozeXVDOExWdTZBcWtHbE5LUU14Yk1JTk8rTjdn?=
 =?utf-8?B?OUhCaG4rSDdyT1JIYURZMGxDN3ZKQkZHQzZFakF2TFpPU3ozVlZGRlhWNUhs?=
 =?utf-8?B?QWFYWE5XdkY5Z0wzM0QvZnVwU0ZNUWpWdFdPVU50aUhmOTZZOEFwWWs3anlI?=
 =?utf-8?B?Q0RUS0EyQlhPcldxT1U4MGl3ZnlQSmhIOGY1RWxFVGJTV0NyS01JZkJHK3k3?=
 =?utf-8?B?ZnRPMk12S1c5WGJEMVZHV25INklsOThaNDlONGx6dFdzVXA1d3ArV1UrSGhh?=
 =?utf-8?B?b1I4UkZpWHk4NFVncjJ3WUZMaEFEYzRYV3diOWRlZXlMUGc4b3dlajF6a2NB?=
 =?utf-8?B?S2dBTzBKbjdRSkpZVWNTUlBaUWpzNFBpeU9HemgzZmNEVzNJc2FsUldSbXVk?=
 =?utf-8?B?Y3hac3RKT0Zxb2ZFVXY4R09BdjVFczlOejZ4Z1F6ZzVGazFvSnJSTHBRTGhY?=
 =?utf-8?B?a3BZVHZFVmpDeTlWQjNlSXdRR0RqajNuS2U1U2JhaExuZUN2T20zUWQyVzR3?=
 =?utf-8?B?b1BpTHFpZTduVXd2UGxHRXBrRnpJZlYrU3d1cllSMkZjcFM3U0hEdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af69b0b7-78fe-4020-1eaf-08da2d0fabb4
X-MS-Exchange-CrossTenant-AuthSource: MN2PR10MB4013.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 14:17:35.7626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkxNBtUYfPjxu2gdIuvXAXahGnWwUdyFZs3dOvAxbej2i6bogxprvnDxvr4ehSQPgHBCqEA9uAWPjHwgLwvwxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3358
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.486, 18.0.858
 definitions=2022-05-03_05:2022-05-02,
 2022-05-03 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205030103
X-Proofpoint-GUID: T2rHEvokVdlIloDLQRrr5mvCIjRj9LPT
X-Proofpoint-ORIG-GUID: T2rHEvokVdlIloDLQRrr5mvCIjRj9LPT
Received-SPF: pass client-ip=205.220.165.32; envelope-from=jag.raman@oracle.com;
 helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Assign separate address space for each device in the remote processes.

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/remote/iommu.h |  40 ++++++++++++
 hw/remote/iommu.c         | 131 ++++++++++++++++++++++++++++++++++++++
 hw/remote/machine.c       |  13 +++-
 MAINTAINERS               |   2 +
 hw/remote/meson.build     |   1 +
 5 files changed, 186 insertions(+), 1 deletion(-)
 create mode 100644 include/hw/remote/iommu.h
 create mode 100644 hw/remote/iommu.c

diff --git a/include/hw/remote/iommu.h b/include/hw/remote/iommu.h
new file mode 100644
index 0000000000..33b68a8f4b
--- /dev/null
+++ b/include/hw/remote/iommu.h
@@ -0,0 +1,40 @@
+/**
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef REMOTE_IOMMU_H
+#define REMOTE_IOMMU_H
+
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
+
+#ifndef INT2VOIDP
+#define INT2VOIDP(i) (void *)(uintptr_t)(i)
+#endif
+
+typedef struct RemoteIommuElem {
+    MemoryRegion *mr;
+
+    AddressSpace as;
+} RemoteIommuElem;
+
+#define TYPE_REMOTE_IOMMU "x-remote-iommu"
+OBJECT_DECLARE_SIMPLE_TYPE(RemoteIommu, REMOTE_IOMMU)
+
+struct RemoteIommu {
+    Object parent;
+
+    GHashTable *elem_by_devfn;
+
+    QemuMutex lock;
+};
+
+void remote_iommu_setup(PCIBus *pci_bus);
+
+void remote_iommu_unplug_dev(PCIDevice *pci_dev);
+
+#endif
diff --git a/hw/remote/iommu.c b/hw/remote/iommu.c
new file mode 100644
index 0000000000..fd723d91f3
--- /dev/null
+++ b/hw/remote/iommu.c
@@ -0,0 +1,131 @@
+/**
+ * IOMMU for remote device
+ *
+ * Copyright © 2022 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+
+#include "hw/remote/iommu.h"
+#include "hw/pci/pci_bus.h"
+#include "hw/pci/pci.h"
+#include "exec/memory.h"
+#include "exec/address-spaces.h"
+#include "trace.h"
+
+/**
+ * IOMMU for TYPE_REMOTE_MACHINE - manages DMA address space isolation
+ *     for remote machine. It is used by TYPE_VFIO_USER_SERVER.
+ *
+ * - Each TYPE_VFIO_USER_SERVER instance handles one PCIDevice on a PCIBus.
+ *   There is one RemoteIommu per PCIBus, so the RemoteIommu tracks multiple
+ *   PCIDevices by maintaining a ->elem_by_devfn mapping.
+ *
+ * - memory_region_init_iommu() is not used because vfio-user MemoryRegions
+ *   will be added to the elem->mr container instead. This is more natural
+ *   than implementing the IOMMUMemoryRegionClass APIs since vfio-user
+ *   provides something that is close to a full-fledged MemoryRegion and
+ *   not like an IOMMU mapping.
+ *
+ * - When a device is hot unplugged, the elem->mr reference is dropped so
+ *   all vfio-user MemoryRegions associated with this vfio-user server are
+ *   destroyed.
+ */
+
+static AddressSpace *remote_iommu_find_add_as(PCIBus *pci_bus,
+                                              void *opaque, int devfn)
+{
+    RemoteIommu *iommu = opaque;
+    RemoteIommuElem *elem = NULL;
+
+    qemu_mutex_lock(&iommu->lock);
+
+    elem = g_hash_table_lookup(iommu->elem_by_devfn, INT2VOIDP(devfn));
+
+    if (!elem) {
+        elem = g_malloc0(sizeof(RemoteIommuElem));
+        g_hash_table_insert(iommu->elem_by_devfn, INT2VOIDP(devfn), elem);
+    }
+
+    if (!elem->mr) {
+        elem->mr = MEMORY_REGION(object_new(TYPE_MEMORY_REGION));
+        memory_region_set_size(elem->mr, UINT64_MAX);
+        address_space_init(&elem->as, elem->mr, NULL);
+    }
+
+    qemu_mutex_unlock(&iommu->lock);
+
+    return &elem->as;
+}
+
+void remote_iommu_unplug_dev(PCIDevice *pci_dev)
+{
+    AddressSpace *as = pci_device_iommu_address_space(pci_dev);
+    RemoteIommuElem *elem = NULL;
+
+    if (as == &address_space_memory) {
+        return;
+    }
+
+    elem = container_of(as, RemoteIommuElem, as);
+
+    address_space_destroy(&elem->as);
+
+    object_unref(elem->mr);
+
+    elem->mr = NULL;
+}
+
+static void remote_iommu_init(Object *obj)
+{
+    RemoteIommu *iommu = REMOTE_IOMMU(obj);
+
+    iommu->elem_by_devfn = g_hash_table_new_full(NULL, NULL, NULL, g_free);
+
+    qemu_mutex_init(&iommu->lock);
+}
+
+static void remote_iommu_finalize(Object *obj)
+{
+    RemoteIommu *iommu = REMOTE_IOMMU(obj);
+
+    qemu_mutex_destroy(&iommu->lock);
+
+    g_hash_table_destroy(iommu->elem_by_devfn);
+
+    iommu->elem_by_devfn = NULL;
+}
+
+void remote_iommu_setup(PCIBus *pci_bus)
+{
+    RemoteIommu *iommu = NULL;
+
+    g_assert(pci_bus);
+
+    iommu = REMOTE_IOMMU(object_new(TYPE_REMOTE_IOMMU));
+
+    pci_setup_iommu(pci_bus, remote_iommu_find_add_as, iommu);
+
+    object_property_add_child(OBJECT(pci_bus), "remote-iommu", OBJECT(iommu));
+
+    object_unref(OBJECT(iommu));
+}
+
+static const TypeInfo remote_iommu_info = {
+    .name = TYPE_REMOTE_IOMMU,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(RemoteIommu),
+    .instance_init = remote_iommu_init,
+    .instance_finalize = remote_iommu_finalize,
+};
+
+static void remote_iommu_register_types(void)
+{
+    type_register_static(&remote_iommu_info);
+}
+
+type_init(remote_iommu_register_types)
diff --git a/hw/remote/machine.c b/hw/remote/machine.c
index 4d008ed721..cbb2add291 100644
--- a/hw/remote/machine.c
+++ b/hw/remote/machine.c
@@ -20,6 +20,7 @@
 #include "qapi/error.h"
 #include "hw/pci/pci_host.h"
 #include "hw/remote/iohub.h"
+#include "hw/remote/iommu.h"
 #include "hw/qdev-core.h"
 
 static void remote_machine_init(MachineState *machine)
@@ -99,6 +100,16 @@ static void remote_machine_instance_init(Object *obj)
     s->auto_shutdown = true;
 }
 
+static void remote_machine_dev_unplug_cb(HotplugHandler *hotplug_dev,
+                                         DeviceState *dev, Error **errp)
+{
+    qdev_unrealize(dev);
+
+    if (object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
+        remote_iommu_unplug_dev(PCI_DEVICE(dev));
+    }
+}
+
 static void remote_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -107,7 +118,7 @@ static void remote_machine_class_init(ObjectClass *oc, void *data)
     mc->init = remote_machine_init;
     mc->desc = "Experimental remote machine";
 
-    hc->unplug = qdev_simple_device_unplug_cb;
+    hc->unplug = remote_machine_dev_unplug_cb;
 
     object_class_property_add_bool(oc, "vfio-user",
                                    remote_machine_get_vfio_user,
diff --git a/MAINTAINERS b/MAINTAINERS
index 1b5719cd89..f257afcf8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3600,6 +3600,8 @@ F: hw/remote/iohub.c
 F: include/hw/remote/iohub.h
 F: subprojects/libvfio-user
 F: hw/remote/vfio-user-obj.c
+F: hw/remote/iommu.c
+F: include/hw/remote/iommu.h
 
 EBPF:
 M: Jason Wang <jasowang@redhat.com>
diff --git a/hw/remote/meson.build b/hw/remote/meson.build
index 534ac5df79..bcef83c8cc 100644
--- a/hw/remote/meson.build
+++ b/hw/remote/meson.build
@@ -6,6 +6,7 @@ remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('message.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('remote-obj.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('proxy.c'))
 remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iohub.c'))
+remote_ss.add(when: 'CONFIG_MULTIPROCESS', if_true: files('iommu.c'))
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: files('vfio-user-obj.c'))
 
 remote_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_true: vfiouser)
-- 
2.20.1


