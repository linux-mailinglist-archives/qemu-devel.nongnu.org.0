Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CC45676B5
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 20:41:52 +0200 (CEST)
Received: from localhost ([::1]:59360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8nUd-0000QF-9e
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 14:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nG4-00029q-UL
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:26:50 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:53476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nG3-0002Lm-4l
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:26:48 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265HEGi7004798;
 Tue, 5 Jul 2022 18:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=IivREShnDi6bJaXgrq1qxDPZCDofkpQftq0i+iZ2C34=;
 b=EGqMp/m53I9zRJPKFTXUZKqEpkNlNnCZoUvvZ5i8gg0/8i4Stn1om87QjZNPMVznEx59
 luGym2uX2ESbMo7eb06GmGdZXoFpp4oTbDtUMnu00hNpOMew9BvrDDav9LTWShx4kXhZ
 ri+/jTbNOTXCmmGvzTo8MRHCPKb8AwboRK0hM88CRN/pqEKOn/87ceUp9WPSA5CZzcjn
 n+4fkAYk07Dyq+kLldRCBN4WvLbe1JngkjMPetNEGjF8p5+y6oetsDHCouTHVkIOBUV9
 uFqIbj5QBmy7WU6TYrpsu0dQcsCkDCOnVhpwFEv6sZZ5Gk1A58qr3OT7mqrT+xWv9j9v BA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h2ct2f0ha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:26:35 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 265IBFRa004728; Tue, 5 Jul 2022 18:26:34 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h2cf2kq8u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:26:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZRphgWjfTrASyTU/gaM/mHNRzbDosoy1m6MudS7PKow/eaaCLBFbHRUNZ4y/XiIEX9CXtDU4LLYMmAd/XSyFB+c8QsBsxPrZCsuuNQ2EiaxCo8TY0ftE5FC2Bdgmb0qmhr1LkZ7ueKTbJBrQBhLZNLQr3hsaRBivrz7ZKGL6bP510czuZ8JrbEU4+PEJJ3BhqDMy8ef9GOPg6QqR716tnMA80WgwLSYvKe9vP8NNvxtQ4Oge2tlAe7US7VPT6C7w4WcE+XUHySnrjBHN844Lmxzcz2M9XIX9JscVUSPEso45KsdQDuwoUnFey+Ab2SFP2aqsLLUqYBgJlC+QLhlEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IivREShnDi6bJaXgrq1qxDPZCDofkpQftq0i+iZ2C34=;
 b=ZH8yBBqlXhVtGZ8oYS58i+jvjemn8pix1fyf/fOAbq5Gxsm6/zWyWJylW6Uo8XslZJRJv8xK7AVTX2cnhmwt0Yaf5T6LMY1qI6tcLatmMzMgKPl5KDMTTC/rWIj8SpZ8O9cqoUkWmkKsWl99tcZTzoGeA6QC2DfxRo9cXZX+eN0gMpiQ4VrwphcyM4/B+GNq/t0T5h+sDf826zIbEveWCt+HMA6fbBvac/CfINoltcNWKyWzWAaOEcuO53THEWwWgLgBKe3SboVq0H/QRRpr1T9sywiGu/fdX51HQftKYvIGuxMJjX9aLJNEHbBgZVBt1y10QrEfExjcLj36ByCVqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IivREShnDi6bJaXgrq1qxDPZCDofkpQftq0i+iZ2C34=;
 b=WhKRLZK3iJq/Gg2D+Wo37xqAsjOcpkI/tA+lz9nF+whXJmIwQIpue6ch/PfpvzEIy6+EYuTYByQllqjSKgIwj1+WPrqIPmWGLEp7A9dyKvaNF6T6TQzf7jYKGgdwx3JX/vmMqa34GuLEHpmjYXYTbZSclTMfQBBomvD1bAW+ueQ=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by MW4PR10MB5809.namprd10.prod.outlook.com (2603:10b6:303:185::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Tue, 5 Jul
 2022 18:26:32 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9%6]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 18:26:32 +0000
Message-ID: <94e3eefa-c370-f533-0497-c37b7e6ab22c@oracle.com>
Date: Tue, 5 Jul 2022 14:26:26 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V8 06/39] cpr: reboot mode
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
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
 <1655304746-102776-7-git-send-email-steven.sistare@oracle.com>
 <YqsPk3EH60Ud/FP/@redhat.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <YqsPk3EH60Ud/FP/@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:208:120::30) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c458bef-428c-43df-2b88-08da5eb3e294
X-MS-TrafficTypeDiagnostic: MW4PR10MB5809:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K2sXObWy7yFoQTks1cI0xViiiLlF24b/m2OakkpsVd6MTGeCVyyNkg1Mqkl31J18PgVxfCUNYL6tk7IDvqryXC1bFYL8SBJE3xRo+8KfR5mi1vDlRZ2OcEVNdphziGSoJmGvEWsFgXQrHwEYaIto8/dbjyUYQ+f0ynqqLPDSiOK40M1vKSER78SNJVdLhCJSS86QN7N67ajAPlD6EXib1LEV7pv5HoKx3QZwGL2jX0HvAkf+57hScQTSeRL428wApNFlaPjUp0l6bz44Y9ih47l44KuPC6EHhhMwndHX/KKAU7uKegupuhrha9gkHMUsjYTRohk/vrpzpWEy30fSx4UNUyA6kz4StQI0MPGeTHuNV6DfS2M0RKNG/N0oxEgMJ3BDaWKo4zCgz0drZyNXwv3iwW4XotjB6DPqLO6c85ED5RutO8Q79a4pFZiD7RQOnn8lGXQ81XPKDpz4XQYMkZxBvbOgXr+PZOmibrYLLLY7J7N0O2juNcj4CISrx6abz2wYvau1r7LU1nK5rpql9tx+9bMP/WggZUCSMfT6ihq2YGP1QbFlRowLi6Ep5at2i4E7DHsMQqhPr0qYHHVBhS3m27JDTszJLRiaxXGWkFAKEzF3USaJxZVuoHYQ8/2MBsf2hR6AcEqr5pl8F0w6ZqXlkwECX+wrkdJdEMKiQB95GoAwlv0AvR7IM/VDqbxrdADKmS+Xxd1KWbibSlCzuoc/S9PhEI2Fa4oZFzTuzhilfDSmf4UhBMSS4TVkontAuHz/+Z+oQxt8IHkOn/hhFDg+m2hODk81LAkf/kj8TAg4jKsmJa+Z5uAWwh449XkX2chsTKY8fggmqgj6DS/2lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(39860400002)(366004)(376002)(396003)(38100700002)(66556008)(8676002)(66476007)(4326008)(54906003)(66946007)(316002)(86362001)(31696002)(2616005)(6916009)(31686004)(6486002)(41300700001)(6666004)(2906002)(478600001)(36916002)(8936002)(6506007)(44832011)(186003)(53546011)(26005)(83380400001)(5660300002)(6512007)(36756003)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QW5La05xSEVhbHIybXpHZUxiMDR5QlBYRjJzbzRnQ3M5eUt0dW5seHJzM21O?=
 =?utf-8?B?dkNWOXQ3a0JxWTdLUjhQZi95dGVXdjA2Qm5xWFpLQlljNDNsY0ZpeTFvZUxm?=
 =?utf-8?B?Vmd5eGFvR0ltUDNTUkNUU2ljaWZQSC8vUlBLN0hJZXFoZ1hpTGdYeDFpRGpI?=
 =?utf-8?B?ZUpWdUJ1cWN6allCRVhBL3NYSEUrN2cyS3pTdUgxMHVBWFNlTkx1R0QwNzFz?=
 =?utf-8?B?VDZDRzJRZXR5MXY5NDVYdUI5RTgzcVJ3cDY3UlBLdVlkMFBUTnBUYTVLTU1x?=
 =?utf-8?B?M2h5VmFxd1VJbTdvTThRTTZyWm5Xa2kzenVvNUhkWnUzRnp1Sjk5d0xXVGhp?=
 =?utf-8?B?cFlxY2NSYnJWVUxDUU5TUlM5bnFXZUNBK0tUSjNNT0hTLzAxRUJZR2ZsNnN4?=
 =?utf-8?B?T2xQNGFnMjNJM3hlbVRaWWQ0UTZMMDgrR21HaFFJOGE3L1JpK0lTZnREbGFB?=
 =?utf-8?B?Z0NBRFlIeXBrSE82Z0RxYStpSENzVnIrb3g5NWJWcTFZNHBjQXQ5YlBkbWFu?=
 =?utf-8?B?REw3QzJQN245MFFZaVhmUlZNZFQ2ZXl4SGlzbnlSZTA1NkZ1c2t5eFpEUHZY?=
 =?utf-8?B?NjZwNEU1bG9BbXErL01Ha2wrM2VkakNEQ3RPTFRJY1NER080dzV1RDRhTGlO?=
 =?utf-8?B?Zzc5RGIrenJuMDBGMEZMY3ZtVGVodXB3b1ZZVnpVTjZpNVcxNnJVaHRkc1Er?=
 =?utf-8?B?dzY1M2tjUWozSFZEZFNZbFR3TWhtQU9zWjZTNithN0p2OTBwbmEvaXdSMjVi?=
 =?utf-8?B?MkJMYmsvQnc5bkhsWHBpUWQyRlFmbTZ3OGFPOTFuc05hTWhXU09Zc3JWSjlt?=
 =?utf-8?B?dTNBVU9CN3kxQ1MrSlFmL0FaQi9LTS9BVmNCZEdrZ3VmeXdaUkFRemVvMloz?=
 =?utf-8?B?RXdVNEZndUpkRmtiNzFzalhIZnlQS0hDdDRBVisxSk1JZ0ZVUWk5YXhZbUlL?=
 =?utf-8?B?eUorNFREQ2RidGF2S05kdjVqRnlQNWFYRXp5S0ljVnlQZjBRS29QZ1kwM1Zy?=
 =?utf-8?B?YnpJUFZ2dFh2RmdKMGM4UkhkR3MremJPT2NtSHpPR1NoOUZVRlYxZm1IMDN1?=
 =?utf-8?B?Ly80WUJLajM4Z2ZCUHRmSnAwQ3p5NDhrR2c0TFljVE8vMUdjWUFRR3JsNE9T?=
 =?utf-8?B?T2gzSjk4b3dYcER1RDlzZU1zWGRDcnhaR29UdHlzYnBEQWExS2tKNWo0SjRq?=
 =?utf-8?B?M2p1ZDJPajRDc3RjRGpSeFh6eXJSaVp2Y3dkTXRkdGRuMTJtMXkwZ2RKemFJ?=
 =?utf-8?B?SVJUK0VmRThxdU1XeUVrQkNJV2U4R3NoTHl4UjVyeGVIbXhobHBQeGxuV2tq?=
 =?utf-8?B?aGJ1OFlqaWEyMDAxYnRaR252WnNwZGxkazEyY2JFelE0dDFwdU1hdUFaaFVE?=
 =?utf-8?B?U2dsQVkzWUh3Umd2KzltZzNaZnJFd1BGQTNtUGd0VWpuYzVQcUI2Y0NLK0Jz?=
 =?utf-8?B?Zm15MEZLdmVXQis4OGVBcGZIa3VXc05KRDBzZkFvR2ZJeXpRRHU2VVVxbWZV?=
 =?utf-8?B?VGgyMGZQVjVsQUR2ajFKR0NqUDZnWGRoYzBKMncyOVdLVHQ3V3NXM0NhaHpI?=
 =?utf-8?B?aDE4TnNaWHhMa1FCZzNoNjcrRUp3eWNEZXhrL0tZaXUydkdOYTFkcVVEYkVU?=
 =?utf-8?B?OFVtTDE4b2U5d2JuZW5BWmRBMEVvNHF2S3NTTjdZZXRjMkorM2ZNbjRyajNM?=
 =?utf-8?B?aVdTaXNzTTR5bmdDQkJTbUtYQ1BITXFWWVVNTXdyNDlEc0ZzSzcxU1pQaXgx?=
 =?utf-8?B?RmVRY2xya2M1bGhpQTg1Wk12dUJjTm9iZ1BMVXBiT2ZabTBMYktGRUR1UHNM?=
 =?utf-8?B?MFVHVE9LQzJCb3hwTmRvSmRSNWc3a3hQMnFnVzNlTkZnVm1adTh5a1BHOC9v?=
 =?utf-8?B?MDNMZFRXZ3VsdDZ3Um5UeU5wSXJSUkJDNk1remlKVHNVbnh2VVE4WDlITWpv?=
 =?utf-8?B?b21vUWxwNHV5WUQ2YmdtT2Fnb1BvN3RwQjJGNm5IWWNHb2t1cFpabzR5T3oz?=
 =?utf-8?B?SXg2ejVkWkY2R1ZQUkhzZml6OHV0dE9ERnpQSDN4ZGFKSHl6eXZaM1lFYVQ2?=
 =?utf-8?B?d2ErQU1nZkFxaWNKQndja3Jna3pqalZzVjV6UUh4WWR4U1dySUljTWNTbGRM?=
 =?utf-8?B?Wlp6d21vKzZLNExBOWcwRlREOFRHbzJKRmQxSk5YRnlvUlM0NmFDSE9UQ3Jo?=
 =?utf-8?B?ZVE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c458bef-428c-43df-2b88-08da5eb3e294
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 18:26:32.2520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K1ZsHwFX0SLfpWR1rVpe3WfIP2lf7khOXRzcQiT6l3GB/cK4HVXqJLOogdEh4FfmhLks5hnfWxsZ3AtAa/YrF5M9YAem2w+1yUCF1PukkWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5809
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-05_15:2022-06-28,
 2022-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 spamscore=0 adultscore=0
 mlxlogscore=467 bulkscore=0 malwarescore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207050079
X-Proofpoint-GUID: LHFhacmDmgzZUvQoeSL-jPT00K_EJ90s
X-Proofpoint-ORIG-GUID: LHFhacmDmgzZUvQoeSL-jPT00K_EJ90s
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

On 6/16/2022 7:10 AM, Daniel P. Berrangé wrote:
> On Wed, Jun 15, 2022 at 07:51:53AM -0700, Steve Sistare wrote:
>> Provide the cpr-save and cpr-load functions for live update.  These save and
>> restore VM state, with minimal guest pause time, so that qemu may be updated
>> to a new version in between.
>>
>> cpr-save stops the VM and saves vmstate to an ordinary file.  It supports
>> any type of guest image and block device, but the caller must not modify
>> guest block devices between cpr-save and cpr-load.
>>
>> cpr-save supports several modes, the first of which is reboot. In this mode
>> the caller invokes cpr-save and then terminates qemu.  The caller may then
>> update the host kernel and system software and reboot.  The caller resumes
>> the guest by running qemu with the same arguments as the original process
>> and invoking cpr-load.  To use this mode, guest ram must be mapped to a
>> persistent shared memory file such as /dev/dax0.0 or /dev/shm PKRAM.
>>
>> The reboot mode supports vfio devices if the caller first suspends the
>> guest, such as by issuing guest-suspend-ram to the qemu guest agent.  The
>> guest drivers' suspend methods flush outstanding requests and re-initialize
>> the devices, and thus there is no device state to save and restore.
>>
>> cpr-load loads state from the file.  If the VM was running at cpr-save time
>> then VM execution resumes.  If the VM was suspended at cpr-save time, then
>> the caller must issue a system_wakeup command to resume.
>>
>> cpr-save syntax:
>>   { 'enum': 'CprMode', 'data': [ 'reboot' ] }
>>   { 'command': 'cpr-save', 'data': { 'filename': 'str', 'mode': 'CprMode' }}
>>
>> cpr-load syntax:
>>   { 'command': 'cpr-load', 'data': { 'filename': 'str', 'mode': 'CprMode' }}
> 
> I'm still a little unsure if this direction for QAPI exposure is the
> best, or whether we should instead leverage the migration commands.
> 
> I particularly concerned that we might regret having an API that
> is designed only around storage in local files/blockdevs. The
> migration layer has flexibility to use many protocols which has
> been useful in the past to be able to offload work to an external
> process. For example, libvirt uses migrate-to-fd so it can use
> a helper that adds O_DIRECT support such that we avoid trashing
> the host I/O cache for save/restore.
> 
> At the same time though, the migrate APIs don't currently support
> a plain "file" protocol. This was because historically we needed
> the QEMUFile to support O_NONBLOCK and this fails with plain
> files or block devices, so QEMU threads could get blocked. For
> the save side this doesn't matter so much, as QEMU now has the
> outgoing migrate channels in blocking mode, only the incoming
> side use non-blocking.  We could add a plain "file" protocol
> to migration if we clearly document its limitations, and indeed
> I've suggested we do that for another unrelated bit of work
> for libvirts VM save/restore functionality.

OK, I'll give it a try:
  - delete cpr-save, cpr-load, and cpr-exec
  - add file uri
  - add argv to MigrationParameters for the execv call.

- Steve

