Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC71555165
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 18:40:17 +0200 (CEST)
Received: from localhost ([::1]:52942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o43Oq-000427-IX
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 12:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1o43N8-0003Fv-1l
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 12:38:30 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:56440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <darren.kenny@oracle.com>)
 id 1o43N5-0001pV-9P
 for qemu-devel@nongnu.org; Wed, 22 Jun 2022 12:38:29 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25MFV9tH009498;
 Wed, 22 Jun 2022 16:38:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2021-07-09;
 bh=R57rm+rBRYjYYELEDEZTK1kNmkpTzYjdwQjqgxnZ72s=;
 b=J1dxJgvCYtGEbbPszCUFYZRYvecRrfCWL+3UjF4oHYM+QR/9DIkNNrmQaVZ/1VFBzxNe
 H7naYiHEmvy2tqy973eyWGjCMVN32WVgSUJJLu5hAdj4CiezzWHrWTOmM9Jax8R3/BvI
 7/medmrlVoEHzXK9OTPM1r6hvQOhMx05TmFUqsY+7cYcbjFv9cv0B32/LssiYQ7eENOR
 qychcbZ/LjvnGTh+sqi3LghhpTrO3GiuvaVmENzqC19c7eGVJFN2+OgCdLvjjr7B6uW5
 A/tmJ49Ycj0R4zNv2iqW1rWel6qUTSGd+up1h74S75FUSuuEbFTmvIK6xs1lEg+z14j6 yw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gs5g212ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jun 2022 16:38:23 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25MGa1El028640; Wed, 22 Jun 2022 16:38:22 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2044.outbound.protection.outlook.com [104.47.74.44])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3gtkfvtdca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jun 2022 16:38:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZFsHSxj66TtQmOmczaz8hbGPx2Ty/1OX7mC8U2oYhSsGrgK155xBWMuBMKiWe9XcJruZdquNV3SUu9hJdJhld5gu2IE6xfNJMOOqiRpRkoizKZYercJYRSio6QHXEYV6IGIzH2qoCCno+6theQrI8e8EIlCho5hCKDem4LjubmBaqGt8+3KSh9fiIyRggzgsaJAx8HQ8s9DY1NpUUnEDGBo5ZWd2itZnVCXe8AtYeUB6vI6sT7TiplxsCjAwA+fdkQZaNMLvAbG+kD5polL+rJXB3rlfhukfJ6xuHWZ4uCmN5ioofFxtKDDLXI1oURPdfpWL5fBIc735pfiFGzyiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R57rm+rBRYjYYELEDEZTK1kNmkpTzYjdwQjqgxnZ72s=;
 b=A949pzC2iarf2drkif0c4X3RyNAWzTOJM1866DyyxLUOz6K9Cp4ZMZNcKNjOoarh1ypD9+HGrcNu+VuEHaRTP7gllrtlunHmm+vY3+trjSxdndUFaKXZqh9T9Xf8aeGZBzx9Icra60FHBK5ty7bGx0aPC008jL0U1VaicTOZPtDL8fRf6SpewxsImUhuWEBQj8jn314/u45Pjjsq19zZFPD0/cA9kdzVG01cRgD/gObZ48abrngBbLbZukbe5ncdSSWIImztniTwb+CK+P7k3UvNP0ljq/7xnkfUJdOTADYVCD7HfeS+uDvWs5W/6jN0ffe954yD+uq10JxdR1o9+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R57rm+rBRYjYYELEDEZTK1kNmkpTzYjdwQjqgxnZ72s=;
 b=pCtAl/7de6iwSRnTgq1mjW9clr8aNyJHJdrKm8wASNYvjCLkmLhzblqccNn9JDYwLPB2rpALYukggSyufbmmEI+WHCQUEjhJWhIccVqzBtbsT0ebcmfAp3+kD3soDRzOoC/sl07UWF5o6LMzOy4Gmbr9K6lSMCY72hKp1B7x+/M=
Received: from BLAPR10MB5138.namprd10.prod.outlook.com (2603:10b6:208:322::8)
 by SA2PR10MB4634.namprd10.prod.outlook.com (2603:10b6:806:114::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.15; Wed, 22 Jun
 2022 16:38:21 +0000
Received: from BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::f0d3:c8b:c303:e02e]) by BLAPR10MB5138.namprd10.prod.outlook.com
 ([fe80::f0d3:c8b:c303:e02e%5]) with mapi id 15.20.5373.015; Wed, 22 Jun 2022
 16:38:21 +0000
From: Darren Kenny <darren.kenny@oracle.com>
To: Alexander Bulekov <alxndr@bu.edu>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Bandan Das
 <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Thomas Huth
 <thuth@redhat.com>, Qiuhao Li <Qiuhao.Li@outlook.com>
Subject: Re: [PATCH] fuzz: only use generic-fuzz targets on oss-fuzz
In-Reply-To: <20220622162635.eacnjindlfolsoqe@mozz.bu.edu>
References: <20220622155028.2086196-1-alxndr@bu.edu>
 <m2sfnwk7nl.fsf@oracle.com> <20220622162635.eacnjindlfolsoqe@mozz.bu.edu>
Date: Wed, 22 Jun 2022 17:38:17 +0100
Message-ID: <m2pmj0k612.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: DB6PR0402CA0016.eurprd04.prod.outlook.com
 (2603:10a6:4:91::26) To BLAPR10MB5138.namprd10.prod.outlook.com
 (2603:10b6:208:322::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4687fa91-cb66-4169-cdf8-08da546d9e23
X-MS-TrafficTypeDiagnostic: SA2PR10MB4634:EE_
X-Microsoft-Antispam-PRVS: <SA2PR10MB4634F8CE5900EF12AD17EB28F4B29@SA2PR10MB4634.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 32RXVKxKw7iaQFFCM4pkQYe8ySTOg8iqIwCiG4OuOcjPwEmiT7oqWdrpY4/TGrZsuW9NqOVglosdr4It+CzVpEI0yHOA1dOuqksjsyzORldATfxn38ugj32sRhzhVwAXnjQ6sCvUUN8eSZ+uCC4l16YbKulE1yzv6sUHKr+DRz1eeXNTXIeVW0SLCOy07fIlmExHWSTZd9PNWXN7vH8PSAU7W/UoyuvpEHT5tLQ/OvRbJeCNx4Sp4mbEJT7MSh3a2FNUTuzoIfc37p/u8JkrbR0RxMJsH45pElfkz8EbXt/wA6gpcbObxtv8ojQhAUgwVa5bPn2pfhbMG8W2hcagTApdd6TdwQVDdjtOQub5BXuYPqgBLaog4d75m3nzuF9EpOXKuKTApLxPNGlTO162ZEZA+57VqvLP3V02LOz1rBAA2dezt2C3t+nd8dXsYeKNIo29E03ANlM2kOUG7r6Va05DyO9qoLQLdh6Z61KI7866Qc5qXR2+d5iiU298iWCiI7TFmf20H0aySaT9VG5oFSk2OTzmR0xBAmTyktDwOxHkvW8s1km/Yb3J7wweAp+KqUaiuc9KeWxvb57EmTrIqaoYw5b0O47bdS0yghDigA4bO4LUMYaqVrp8aDscOCso3rRQyf2WIuboOTQ4/QyMhYtHTaF821h8u9po1o7LVV3GZB1PBWqz1LFralKl5QXIHoTKuv4yT7jpgZZ0P6dvnEiQjBg43Ln+c5ilGdRi1ZAYxsHWmISkfN8rV3u74Jz9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB5138.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(39860400002)(366004)(136003)(376002)(396003)(8936002)(478600001)(6486002)(83380400001)(186003)(5660300002)(41300700001)(2616005)(6506007)(6512007)(36756003)(54906003)(38100700002)(26005)(6666004)(44832011)(4326008)(2906002)(66946007)(8676002)(6916009)(86362001)(66476007)(66556008)(316002)(41533002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ylTpFz5STjxGLHX9eoa9A3Ysd6DGRHzWMR9KHRRjTqt48vOQFdNgsfrFpQYO?=
 =?us-ascii?Q?Gua24Sjr4lTlh2agObojcuHNFkvLz+BsLyCW+wZ78QDqHFMiRS700iea0HjH?=
 =?us-ascii?Q?yDg57dSk48367Xz7hRq/nmgGn/8inY/Os/qRTFl0dS8ICnBPi/Gc9MxR0qfd?=
 =?us-ascii?Q?L0sb5NNxPxh0T452WU4Rx74Jsxt8zoeUAwqQtpkA/PgeT6AZe4jw1QoNDLzm?=
 =?us-ascii?Q?oTGyWv++4HSOYVqQe2+Z0o3yVTOVZxop5xwFKuhGzz+0QQvtva5PbX6DfJHd?=
 =?us-ascii?Q?608lADuWnJ6EomSWmtuCqRFC70JdKq9+iT+gFE88xwUGFl6G3+q0z4DMxOPz?=
 =?us-ascii?Q?4s9b5bYVv7vmm7B8BU2TtAIJRaqYTwv5WbHiMbGuFDcpSWs6D/zeTJ/w2uIg?=
 =?us-ascii?Q?V3QodT8RaZqccuaixGUpIKnWOKuZC4Lx8UC40uuZStZ5TWsuPwC5OVcqLAjg?=
 =?us-ascii?Q?lgKXr6RKv+8Pk+rfCRMlQqMNw83f4iDDtPvLCZcvo7v8fN4yI7m7Nv2mwF2q?=
 =?us-ascii?Q?PbFv5I/lby3mXKyIy+1J2qkHr3/TSzT9xMYaltO9nPjUIMEM+nDPR1fPsg4Y?=
 =?us-ascii?Q?pEGtpTOzHxrYacRGRSfYopWRWfy3f9O6S1T/6XUdQ5pMqdth/8iGAS3F64fP?=
 =?us-ascii?Q?bMMpyKpms20IEFTKCvVw8zyXA0ChI7020MOLfD9cRsvd6dmOLOYUZ34qWrSL?=
 =?us-ascii?Q?2HBws7mw+7yclYO0AZniCAIIlRaBpMq1Y+y1BbDzxRQ7k1RduiEdPofycfur?=
 =?us-ascii?Q?xp2Ohi0bYbFtkGVww/QlTidbG3FjiL/CyIfUgYzZOKLJfl6AZxFvnRKku8KX?=
 =?us-ascii?Q?MB+b6S/nw/nFCz1m2M9+ejLUVEELtd/koQMXGnPQp/C8vKcUYZLzcQDQSVMN?=
 =?us-ascii?Q?GZ1DxxnM4tWLbCjOot/HQHKl6d5wHLbrqJwmMq4NUkRkmFrkMtE6CVFj0vIq?=
 =?us-ascii?Q?F3dSuKWnxr8fGEnZCMBYjL9CWGnhSw6lrwkNjVGySQuUNa2bUW3quPR5SHmb?=
 =?us-ascii?Q?yTqa6cvxX1/4nnKL4oh5kXydyIfnCbfxlt5grTqYxNwwWojJspbBQDzTHkom?=
 =?us-ascii?Q?ZcRPJmZWCxIiy8cBoWitlRSrytJvSuuliYUl/VVCen3h5Xj366eJOZdjn9B3?=
 =?us-ascii?Q?qO4k1rhQ8rVvCFvrh9FCmyt6i5Vo9lqDjSDJgXOmEWa8Dfn49mKwPzqX8EP3?=
 =?us-ascii?Q?v6V/LlC+LDnWW503yHu6R7oR5DlhCZHcVpuqUW08g8VAH+5fwoYvT0xl6Ww5?=
 =?us-ascii?Q?AQa2ghuBJir1V8Kb75KMrlwl0AMXuFLG2sncY9m9T2hx1YTB8Jxw/f5Io/aE?=
 =?us-ascii?Q?FpTHO2uIgSKZx+rHZfvpidfvwZNJ/gPaQc/hKXTn3XTYw8fog55X3UGL6NVz?=
 =?us-ascii?Q?vpY8oRb4P1XV2kokBvv39eOm3aok7jBhykwDQEXsvRnkl+/Txv310upiqfId?=
 =?us-ascii?Q?DYwJX+qISfv7dJvUzA0GoRa3wFqqb20jdBFtxTzeaUvgzKFQXb2thOTRgTDl?=
 =?us-ascii?Q?1wSxx59tnb+iUS1f5CwyGjxPiJpVkhr00ux+6ikeyNFm6wiU0KTBJ8E44UaN?=
 =?us-ascii?Q?mPdvOHao27FfLYnPShXx3o6WmPy7vDXIXUeUeZvldQdMk60P08T1L4bT3cIV?=
 =?us-ascii?Q?f3a6bxWn/Of/fX2rmVLv6hL5D4CvWlanM32oizEXBa3tHKNucR1/v0dMBU5j?=
 =?us-ascii?Q?VACQOHdX5KER8KGBg9HwxS0lLeRm5iUJWe/w72nNo3xDnPCn4yUkqf0UhQDv?=
 =?us-ascii?Q?7USpJu+aFBNbUJb85K8EJZDRPVGCXvg=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4687fa91-cb66-4169-cdf8-08da546d9e23
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5138.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 16:38:20.9548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3y2SbZju8sLI8sKHCGr7pP8MXwL/MaPAvEGylBFOhgQ0rNMjA4T1kP99BPtWVixIwDoRwoUkWEqSz/4z/hZETg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4634
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-06-22_04:2022-06-22,
 2022-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206220080
X-Proofpoint-GUID: rcnlQbx75tfxZMgz7ghVot7HU-dSY5Ou
X-Proofpoint-ORIG-GUID: rcnlQbx75tfxZMgz7ghVot7HU-dSY5Ou
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=darren.kenny@oracle.com; helo=mx0b-00069f02.pphosted.com
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

On Wednesday, 2022-06-22 at 12:28:40 -04, Alexander Bulekov wrote:
> On 220622 1703, Darren Kenny wrote:
>> Hi Alex,
>> 
>> This looks good to me, so:
>> 
>> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
>> 
>> But, if it is at all possible to use Bash glob in a '[[ ... ]]' test
>> such as:
>> 
>>   if [[ $target == generic-fuzz-* ]]; then
>> 
>> that might read better - but it seems the default is that we don't
>> assume that, or am I wrong? (This is probably a question for others on
>> the CC-list)
>
> That sounds good to me. Should we change the script to #!/bin/bash, to
> be safe?

If it is acceptable to use the '[[ ... ]]' syntax then you'd definitely
want to ensure that it is bash that is used.

Thanks,

Darren.

> -Alex
>
>> 
>> Thanks,
>> 
>> Darren.
>> 
>> On Wednesday, 2022-06-22 at 11:50:28 -04, Alexander Bulekov wrote:
>> > The non-generic-fuzz targets often time-out, or run out of memory.
>> > Additionally, they create unreproducible bug-reports. It is possible
>> > that this is resulting in failing coverage-reports on OSS-Fuzz. In the
>> > future, these test-cases should be fixed, or removed.
>> >
>> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
>> > ---
>> >  scripts/oss-fuzz/build.sh | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/scripts/oss-fuzz/build.sh b/scripts/oss-fuzz/build.sh
>> > index 98b56e0521..d8b4446d24 100755
>> > --- a/scripts/oss-fuzz/build.sh
>> > +++ b/scripts/oss-fuzz/build.sh
>> > @@ -105,7 +105,7 @@ do
>> >      # to be configured. We have some generic-fuzz-{pc-q35, floppy, ...} targets
>> >      # that are thin wrappers around this target that set the required
>> >      # environment variables according to predefined configs.
>> > -    if [ "$target" != "generic-fuzz" ]; then
>> > +    if echo "$target" | grep -q "generic-fuzz-"; then
>> >          ln  $base_copy \
>> >              "$DEST_DIR/qemu-fuzz-i386-target-$target"
>> >      fi
>> > -- 
>> > 2.27.0

