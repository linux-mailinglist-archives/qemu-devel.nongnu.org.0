Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1911554F85A
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jun 2022 15:34:36 +0200 (CEST)
Received: from localhost ([::1]:55038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2C7O-000656-NX
	for lists+qemu-devel@lfdr.de; Fri, 17 Jun 2022 09:34:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o2C6J-0005Ir-4K
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 09:33:27 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:38838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1o2C6F-0007yI-91
 for qemu-devel@nongnu.org; Fri, 17 Jun 2022 09:33:26 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25HC0KHZ009842;
 Fri, 17 Jun 2022 13:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=yqCZJBN+mV155FSbC7aex6skGvCvo6IX38ORwScE/n8=;
 b=K4+FChC9SwhzqNZdykWVWVL+fVMcB70d2xcjT1spsC6HP199BMMRW95PbMptmiNGkD6f
 xEVNtn+WXXmXiM8QApvD4BcgaEONLnmopSDIaib2l3Ffb4lsqxp04Rh0OIVNPahnmPsx
 1+1P11ThrnuNMv4hpz5zPJPBl6mYhuBV6NgsKZgxamhtD3eFRWm8ecLuMJefeZd2yxsO
 FIUNluiinUYX7ut+2+xHTwKOu7mDwqiDlZAO3Seug0/39YZ1IJZP2NbWCrna7WK3lF+3
 p0CkCpzTel6xjQdRd2vBO72h35QDW+lmIRb0dUEw2gj310dDi7PKtEQ9Wg0lSpnVtBAj Xw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmkktnvpd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jun 2022 13:33:13 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25HDVpRY031334; Fri, 17 Jun 2022 13:33:12 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gpqwd7f05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jun 2022 13:33:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C32dhdWc4fwbqp5VB8VpPp/lZxvGUa5GEhW6CCXZEByD1k57M5huO3TuK995MH3acvNeD3rXS81xKF2UUMCuSOdrbtEcSZbVlR9SWdm9xfo5bIIruhGnVBJ7Lc4qd37m6dEa1UuDaMCyNQJxBjT8bFJqQjBE1eHWh+Vzobaidznn/TLQ9PomE7qapXGXUc4VHWGUA4+E64eTIMhlzcGTWEMx2NCrdnsf1leW5z/FJZmFtUgSF/cgvcJzNpIa/dQBWP7G/y7L9i3papLkccI/qddYMBh8Z6I/GVY5JZXdP3kbKMbb6mXenbWJahMYKFnjRTlPko+EQZtDG1Y4Hq8TUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yqCZJBN+mV155FSbC7aex6skGvCvo6IX38ORwScE/n8=;
 b=F2AQsFtQoF2cTufFCtpId2GiNLOhMrBLdWdVQUXTT6QayYwLUoj7KcIcsqwWy/imhbLVNzv8mVWGodjxAQUZeqkmrb6uUrOotL82FZ66194mUQEH+C7AGN3oYQZhvWpEbtfv1OKwM1dsnek7j/dMFLwXpkOEqJb2nMQgq3W6Gju4c9VBL9E4XwYocI3+i0U6V+/K4UaqsMP+yoOz3CWJ8G2thjLgA0v/mBZ2vpTLmVoIU0GIT9qNOqGLeplQOg+GAfulaUYxWPAD+68TmmMlJH1ZuHbBDu5rkclstwYKv5mgJNH3VBddLlEW2GwmZgV0bGulIlTrM33YhWdYyShq8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yqCZJBN+mV155FSbC7aex6skGvCvo6IX38ORwScE/n8=;
 b=aN84XLX637Ky2yFFn+A2iWBe1H9YDx9YM0/Y9ZN2mSZJem+V602CoEI8Yes/m/7ttaxRwMZsnvLdItodZs8L5hI0lxjXADTvOw/K1avJn0bo4ycFnMq7tDt99seKEjts2PWsk7cX9mki0V2pP+bzgi7E5CxzxSRbeRbola+yUmc=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by MWHPR1001MB2384.namprd10.prod.outlook.com (2603:10b6:301:2d::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 17 Jun
 2022 13:33:09 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5353.015; Fri, 17 Jun 2022
 13:33:09 +0000
Message-ID: <4f3e051e-fb13-5860-b39f-5ace782cdea0@oracle.com>
Date: Fri, 17 Jun 2022 14:33:02 +0100
Subject: Re: [PATCH v5 4/5] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220520104532.9816-1-joao.m.martins@oracle.com>
 <20220520104532.9816-5-joao.m.martins@oracle.com>
 <20220616162328.64138d4f@redhat.com>
 <bc50bb88-5330-a839-bd50-ca49b0edec9d@oracle.com>
 <20220617143251.5f064694@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220617143251.5f064694@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM8P251CA0021.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:21b::26) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7da7d324-0e60-4caa-872f-08da5065eadc
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2384:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2384CA5E418BE82EADC661AFBBAF9@MWHPR1001MB2384.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uQQ/AVK/rk6QOLh9GBPlPDl/7EjGTV466EZGX1PxmsoZ1UyVJDnzHloWXRGbRG1HS2YLgLissrnvCXPe89vvHRVw1nziZFvM2byGu+5Tu1u2iY+5oNdFpV0TmXypEI/NdXFOmrG8/ZHPpUyMhn/fpGDZlzOyvK7u/o44apjhfmIP+jCLD1Q8sVaNU7eB/pwjBbhj9SoRevWO1/Nz08bIwYGcyuZKRH/4UFi28/hR1RV/AHNySDTinNGbMZPvlkjWbOY7bSB21bvcH5hVH/ywRce1K3n5DWsPFE1OEQonL3kSizg/t0OfCBVZtcTdbqZ9OYFMamzv7R4Pq5Ln3S42UsyU06dl4M3NKi15f+7TGorc+x3W/p+m8E6/VcXlEqZdmCEy1OS7XzHI6PpjyBrYIYHx6Y3aBSneEcOI/7s290ShWEGkrdQUmDAyVc0mjfp6TnRf/EZHvoqJ398FOloV36/mZaSQvsc+an73MAarnVHocd3wCUnTellmZsKWIvThD6oRuPPt+xIlNS+T/p1ysEoia/sICxGQKi0T7fAbqczCDc6lOmMfYT96jWTxTaVjtQaYFW5ztt/3iNh8XIVl8VLWjfbcm/gQeLYJdAFwV5H7koLiz//wFg7dMcDug659A2WwfrrkEnZy4kvSQmYLQAEbW/ScIpTV+9SrAJsGZU6aQV+lxc5PDsg7n9RVHOIVPEDifUUuFI+auFh1sMIiw4OVraWTximfFFMMpvVGwMGlDMnQjCSw32C5oLPubOG66cvo7UmUHHqk4L22JtAE3gBiy8N1QOeI4ANSOm+xYkw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(38100700002)(86362001)(7416002)(966005)(83380400001)(498600001)(6666004)(66556008)(6486002)(66476007)(31696002)(8936002)(66946007)(26005)(6506007)(186003)(6512007)(2906002)(2616005)(36756003)(8676002)(4326008)(6916009)(316002)(31686004)(54906003)(53546011)(5660300002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzdSaENMV1laeVZZY0ZWa0Rmc0g4RnlGd3duTTk3RlFwQTBCdXlJSW9Nb2Zx?=
 =?utf-8?B?bU96Q2UwN2dpU0RXbDJSRi9vV1h6eHBoMlFRb2ZTRlVTWGE3MThsd1FsRmxv?=
 =?utf-8?B?TXg3YWpXVTJ0RVp1YlN4NHpxK3Q1Uk5lQXU1WmUydEwzNEM5Y3Jwd3VNVHZn?=
 =?utf-8?B?VTBlWnFBY2lKb2pOZUpJTU5ISVlnOENXKzd0ekttQXFPVTZScWJGKzg4aGNv?=
 =?utf-8?B?VDFmbWQ1SFZDWUNSR1ovNG5HNUM0WWZPSHZDYkJVNC9XQUxXVkNjUVJmS09t?=
 =?utf-8?B?VUozdGhaa2FMU1RpNlRlUnNnRlJVbmIzdHZMTGpRcXdFRzBHNFJYaGZ4anFB?=
 =?utf-8?B?emVzOEZVdkNRclZXeFg5dm01SzdBek9Tb3F2ZnZFK2JkODJwc1ZsL0tYZjJ3?=
 =?utf-8?B?UWlFditNNy9IQ3dkTG5rSTExdjlPQWtFM2VNSGZ4cENBQitzakNqenRDUjFI?=
 =?utf-8?B?aG1SV1dCeUVUc2ZTSFJUN2NBR1ZCQnFaWXZxYzhDREVEL3d3UkVnRk5zUHZa?=
 =?utf-8?B?d2ZZaGR5aGlHZUF6cmMxTXFOQkJySS9tNVRzc1NzaWRyU3J3TU5xbFJxM2xM?=
 =?utf-8?B?dmowS1ZUbVNmRW9DK05EdHVFVUxZbzFoTXdzRW5XUnAyU3laQmVmN3hOTVo0?=
 =?utf-8?B?cFJrdEhSM2JHR1dKczVWRTVlVnlYamxpU1F4NzB6MmdYbWxOV1liZHA5QWdM?=
 =?utf-8?B?Tk9tYVVCQVMyUHZuQjhpeGNmbFFQWHhIcVdEa0d0Mnh3aGl4ckhUSDZhdWJK?=
 =?utf-8?B?TUEyUnI5NzJXRUNYMW1QQm1WWVl3K3pCbEN3MTM0ODZ3Y3hNSlE2YWlFVmF3?=
 =?utf-8?B?TVJCSS9hQ2dabE10ejA0MFJvUHdrKzNaZFFMZ1pOMUVocUhFT3lHc0pBajJw?=
 =?utf-8?B?cWFaNjN1SnpBdENiSkI4dS9rajVhVkpRSXlzejh4ZkljaThvaUcyNlhPNFNu?=
 =?utf-8?B?enAyWHpZOWJGa3JiYUdTWnV2ZWdjbzFURVVUL2JGL3FJTHdxd21ySjRFQ1Zs?=
 =?utf-8?B?MW54dG16aWIza1YwSm9sSVkrYW4vbzhFbi82cTNyejQrVnRNaSt4eWVSTmJ5?=
 =?utf-8?B?YjF2c2ZOaHR4WFI1YVFjM2lGZ1c2bkJQQjYwRDNxNkZ1OUVRLzkvcWRMMzNz?=
 =?utf-8?B?eFI5SkpBMHh3ajhVL2dLUnlYUm1ZclNkcUYyR0VmaG0waTRPU0kvOHRocUNk?=
 =?utf-8?B?cXQzNkdHVVl4SXhFaUlxckRTOTIyY3M4T1RHQmJCZlNzSjBjbll2WnJlSjc5?=
 =?utf-8?B?Z0xEVlNhc0NGdjNCb0Q0S3NadmhJZDFFSVB6V2RnT3N0NWJIQU9IcVNNM2xk?=
 =?utf-8?B?K2NlOHYzMGhhTi96MVRHRFoyb2Nkb3Bza2tYSzAzQjB3U3A2NjRGRFRrUlZ2?=
 =?utf-8?B?RHhHSXY1RUd3UlY4bXZZUWxrMC9mT0MrUDg0SUlybkl0SXlMWWpDdDhLSG9q?=
 =?utf-8?B?Z0tYNm9wZDFIYVlxUTQvWStlbXZva0pGbHBCWFhxeHlqRWxWTG9HK1FOVXYz?=
 =?utf-8?B?bUZ1ZFc1WEZzN1dEMFNFWWZMYmhNQXpMRDJEQm1GTHlzL0V2ZTB1UXNPb2po?=
 =?utf-8?B?cldLaHJTSVRCNWY5cXY3L05TVGFFM2VXdzB2QkZZcml5R2dnWHVEWEhZUlFo?=
 =?utf-8?B?TlZyN0pUaVVaY29Udlc5RkVJTDk0SE9GKzZxaWw0ODMzcUVVbTY1dTBVQ3Bz?=
 =?utf-8?B?YkpqTktmbWJ3NWtoeW9XNjYxNVhBVTVCVUZ5TmlhTlZrKzNZdS92cnQ3VFlV?=
 =?utf-8?B?K3JzOG5EeTZpRzkwWFIreDY0OEF5dXJ1SlNPUi9XcDAweHd0RnRhZE04YlBK?=
 =?utf-8?B?NzdvYXNNSzVHdmN5TlZUVXNTN0ZPMzl6M0tvdWxhSU9Pb2xrdFl0a0ZTUTM5?=
 =?utf-8?B?ZHBjNjJkd0JBc21lN3pmL0psNWRqRW0zSm55OURKeWM0N1FoK0w4ZjNwSjR5?=
 =?utf-8?B?R3ltQ2p3K09vRGNoellBV1RHOXFacGVrb0daMW1mL1ZNN3hLL2ZkUHV0Y0do?=
 =?utf-8?B?WXpvOWtjbkdFb3FaSWNmTmx3TmMwSlNuUlMxZCs0WTJ3eWxKeFVtMUJ3eDRx?=
 =?utf-8?B?cFdkeTV1MGphUGRjbXVTSmhEOHJkN2t4dEs5WDZRYlQ5b240MEIyQUVPTE12?=
 =?utf-8?B?RDlvaEl1U280ZzRlR2NVdXB2d0k3NnNWNXJIM3NzS3AraWhoUFNpd0ZwNTR5?=
 =?utf-8?B?WmNvS0ZiY2J5TjZseXZ0alNUUkNabnR1UGxaTEhjT0hjWDdrcHV5aHRNcFha?=
 =?utf-8?B?aGM4TUJBS284VHVFZmtnNE85eTQyNnBYZWpjUi9rMFlyLy93L3EvcU84Tjg1?=
 =?utf-8?B?eWVMSUJjYTBtd2RuamRsbmNBODJBVWl6RTA2TGlrOWVxbmtQQ3pRaFhLL3lJ?=
 =?utf-8?Q?5UJgup8OxgC2Zo8M=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da7d324-0e60-4caa-872f-08da5065eadc
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 13:33:09.0461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tF1yzIOkeTi7YgRfjnWEs3G+610+NOwLjA3RynrR9ko6RkVqBOyiOToJ5hNMqMESZublBT6BwKyuUtYsixK2ut5qdy71Hmh0j8HQadxDiPs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2384
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-17_07:2022-06-16,
 2022-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0
 mlxlogscore=892 phishscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206170060
X-Proofpoint-GUID: fvrQetQnppm5Svf7Ecca6Py9x1aJ9ZUw
X-Proofpoint-ORIG-GUID: fvrQetQnppm5Svf7Ecca6Py9x1aJ9ZUw
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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

On 6/17/22 13:32, Igor Mammedov wrote:
> On Fri, 17 Jun 2022 13:18:38 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
>> On 6/16/22 15:23, Igor Mammedov wrote:
>>> On Fri, 20 May 2022 11:45:31 +0100
>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>> +                                hwaddr above_4g_mem_start,
>>>> +                                uint64_t pci_hole64_size)
>>>> +{
>>>> +    PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>>> +    MachineState *machine = MACHINE(pcms);
>>>> +    ram_addr_t device_mem_size = 0;
>>>> +    hwaddr base;
>>>> +
>>>> +    if (!x86ms->above_4g_mem_size) {
>>>> +       /*
>>>> +        * 32-bit pci hole goes from
>>>> +        * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
>>>> +        */
>>>> +        return IO_APIC_DEFAULT_ADDRESS - 1;  
>>>
>>> lack of above_4g_mem, doesn't mean absence of device_mem_size or anything else
>>> that's located above it.
>>>   
>>
>> True. But the intent is to fix 32-bit boundaries as one of the qtests was failing
>> otherwise. We won't hit the 1T hole, hence a nop.
> 
> I don't get the reasoning, can you clarify it pls?
> 

I was trying to say that what lead me here was a couple of qtests failures (from v3->v4).

I was doing this before based on pci_hole64. phys-bits=32 was for example one
of the test failures, and pci-hole64 sits above what 32-bit can reference.

>>  Unless we plan on using
>> pc_max_used_gpa() for something else other than this.
> 
> Even if '!above_4g_mem_sizem', we can still have hotpluggable memory region
> present and that can  hit 1Tb. The same goes for pci64_hole if it's configured
> large enough on CLI.
> 
So hotpluggable memory seems to assume it sits above 4g mem.

pci_hole64 likewise as it uses similar computations as hotplug.

Unless I am misunderstanding something here.

> Looks like guesstimate we could use is taking pci64_hole_end as max used GPA
> 
I think this was what I had before (v3[0]) and did not work.

Let me revisit this edge case again.

[0] https://lore.kernel.org/all/20220223184455.9057-5-joao.m.martins@oracle.com/

