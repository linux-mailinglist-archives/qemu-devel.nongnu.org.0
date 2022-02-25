Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2294C4DB2
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 19:26:29 +0100 (CET)
Received: from localhost ([::1]:51062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNfIR-0004cA-Re
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 13:26:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNeaQ-0005Gy-Q1
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:40:58 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nNeaM-0001pA-Vk
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:40:57 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21PH3S11008229; 
 Fri, 25 Feb 2022 17:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=v3wgY1HADFfjh1z9MzNJQD419F+B5pFx5YRmR+9wtt0=;
 b=nXolcpFJP1w+sHLwjx5pRuuyi5SiyLeOGVSPkAMZBbgZ8LHfKBbSGQxaPCKWMhXkqplr
 6y+EMXjnr+qPYx3OhKxUx3i7WNQAdKqxESMWeNfDuZgGw1nNY22MFQ++j38B8GAEoALm
 pIL+ZzR8lDb/ttsKrAE5u4hJW1mG9wECkVz+Y1GhX100YGvjumG/CUMFfzNmE+NKzSLB
 +rDikLQeWd7UeSlRvgf4qWjIcbYoXrIt5kJdyqFd2zad2WtBhRJTaAwgIcpMHSAG8rxy
 BMVNyxCQ5QMOUvAIsVFgmwW/vCTP1vAlT8Q+35w5f63d/sFh2b5u8KQ4VNAuqYbLAna4 Tw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ef09pruem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 17:40:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21PHV6Yf062794;
 Fri, 25 Feb 2022 17:40:41 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
 by userp3020.oracle.com with ESMTP id 3eat0saqc7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 17:40:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UslnC8sZ1wCnbwNLC/GP32OC1y5XhQnUyns/lsP308ra103xyaDcwfzIVLj1zfiVUjS0tRiRsI8loz7vElPJIJIJFCDLpXrdt4URrDQ7v8O9kFCbbOIE0x2mE4dP/u1e3u8BU9L68J+iLfP3DQfT0OnS+k3v7M/54Y1P05TN3rjvDGT9bg1gtio+ndebXRC+qAoDF2bfd5aT62ok3moRv/Tkc9S/25Iurqnkw8gT9YWdaqPND+VgBUcrPQi2xP66aqTuAPRlJntPd4NsDR8Sr/XEoY4qMiHuHyr6LkC2xUM+usr+yHmFQnpfJ8KZ/AxZpx7uina6mBe1KbQSw4yZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v3wgY1HADFfjh1z9MzNJQD419F+B5pFx5YRmR+9wtt0=;
 b=P/MdikpxnErOdvynD520Rf8BeNWbofhcp1BFO3/EKT06o0iPajHuMXcwbib4LHMmeei204P+iGdb8xkJSwGqx09DxWCORW5nJpe3CrQOfGyNFkkSd0GKHfWOSBeJ06oiBFt3D2cyAH9gP1nU3bQIJlMuYW3CSU6fmThrfD+XHkRgSoo9/3+1QXp4x9CF4h4b1ZQ7tY43bUfuvcccN5Pkhgcer62t1RfF1+483PpPb1dxzYTe1DMwCrA3csKZyZVTa1MKyZzzia3XNj/J4jWZ0kHUMo26XY/7yf/RaffrY5u/j50ZANnbsY6sAnO+wTESdKzSCKqLbUrjK7Oglm9UeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v3wgY1HADFfjh1z9MzNJQD419F+B5pFx5YRmR+9wtt0=;
 b=bJt5WaeEsZYNHNH+QKmDKCqd0JCUsX3rj74gnfG6H58Yq83tKr9GVvTT5uMj/9xPzgPhMlZtrgQqZpRPNdmZV5qUECGNZXH1kMWpgzs1D11WILuB77R6QBeVzBH1DU57lwqYYEWYosYCJV55hNfOqAjmyK13ngY8/dvYMOiQp5g=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BN7PR10MB2706.namprd10.prod.outlook.com (2603:10b6:406:c5::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Fri, 25 Feb
 2022 17:40:39 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::750f:bf1d:1599:3406%6]) with mapi id 15.20.5017.026; Fri, 25 Feb 2022
 17:40:39 +0000
Message-ID: <e501e5f5-44ee-163f-833c-3d5643455dec@oracle.com>
Date: Fri, 25 Feb 2022 17:40:28 +0000
Subject: Re: [PATCH v3 4/6] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
To: Alex Williamson <alex.williamson@redhat.com>
References: <20220223184455.9057-5-joao.m.martins@oracle.com>
 <20220223161744-mutt-send-email-mst@kernel.org>
 <5fee0e05-e4d1-712b-9ad1-f009aba431ea@oracle.com>
 <c28ade30-fbea-4d3a-3b11-356c02abaabb@oracle.com>
 <20220224122146-mutt-send-email-mst@kernel.org>
 <7afb8caf-5c98-d6db-d3e5-6e08b2832d57@oracle.com>
 <20220224131607-mutt-send-email-mst@kernel.org>
 <f19dd8be-f923-fd7d-c54d-a54fd775dcc5@oracle.com>
 <20220224144800-mutt-send-email-mst@kernel.org>
 <37df5f3a-283a-a016-311f-8281bbacda19@oracle.com>
 <20220224150626-mutt-send-email-mst@kernel.org>
 <5cae0afc-df3e-5dc6-d11b-2f7d931ba5e6@oracle.com>
 <20220224144053.3fbe234d.alex.williamson@redhat.com>
 <eb699dff-09d3-e9ba-2c35-3c91966efa13@oracle.com>
 <20220225091523.66b3b2c5.alex.williamson@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220225091523.66b3b2c5.alex.williamson@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0082.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::15) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 77f713c8-4936-456c-c8e5-08d9f885eff9
X-MS-TrafficTypeDiagnostic: BN7PR10MB2706:EE_
X-Microsoft-Antispam-PRVS: <BN7PR10MB270656F1666363F714135485BB3E9@BN7PR10MB2706.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RApNNnDV0kI+PNxytWpFggX5gmecF97Z5zzdeA92NI2VIBqZTQjPC92gptwUlyiOnIU6JagPl9F9kTHZa75Z6wpe7t3ZdFmla8GazmWZu7fFsYbW9Ig7B2kPkGPHYDaGujF8D3E9WtE7bYRDIZmiNUG4bb2NGeeUS4meNf0hS1x1vU41H2M+pIBCkB/QPzrT1J8hsFtWU8bA7UFLLaNVNLwysPW/tK5ougb4QPZullqwfghTDUha5O+pdEuhZpyFZUTR32+2ElEfwe376YQfhI912TJBn1kqpMBBGAYjvc4zTBRXDkCooLh4g4bM0kCN7hqRhUSl5a8ANXVZujtDy41bn9USIJxZjVV+FCw1bvpqM/cxrBGR7Pvk3+c39IiX3JFkjM9+zXVtPDqOrDiP5EAJUHT8ZEEJxDBvzwnF3TfUKiXJaJO2gWBj2MLV5L1zHno+hHgmmjhc+Ze4ZKuJozETaJRK3GZQP6+nOemVUjcrfUTCFpQs67Lbwt/qwikBKlZaJsFfKyzn1u1mWx0NjGsuXYqbpB+Qqy7xQwr2bek7TPBZ8BOsbkr4J4bnwPqWZIL0rlYNjWXVtmQ201Gq9OdIFIsGBwiykJUKz+rPWilyTV+EbZXOg0aM24R3eMSPLu8KXy17KZBXou6dUVPTQaHNqVQXk6+DtNFxqlc7zwHgCJ4k4eE9Nj5hmCbA1bQplCfEZQCQZCYgXwpwmymIhhhPYx8GUkzpyC+9mcLLEbk9vtAtbnqqrsx4oO1xK7nayKLBu8mFlZn8sX4yLFXM+rNa9giUYJmeaD8pp0i2ttU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6666004)(8936002)(53546011)(2616005)(6486002)(6512007)(7416002)(66556008)(8676002)(4326008)(66946007)(6506007)(2906002)(66476007)(54906003)(186003)(6916009)(5660300002)(26005)(86362001)(966005)(31696002)(36756003)(38100700002)(508600001)(83380400001)(316002)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmNqaFlCQ3J3ekpZbWhaQmNtVGtDNGg1NFhUajROMFVYSjhkNU5RL0ZxeGVs?=
 =?utf-8?B?bm5NN3RaSDRNV3NwV2c4d1puYlZIQmgzUENRS2lxTXBpY0VZSGhLYmFRL1Iy?=
 =?utf-8?B?aVBOdEt2MC90RzZOSmUxazlkVEhIbXhUSkpSTU5vK2dSU2krM2F2UkhIZWdI?=
 =?utf-8?B?RWxKN1BSYVphVFlnK1BicjNtZG5ET2w2SVVRdm5JaEdYSjl2d012MWVLa0Ji?=
 =?utf-8?B?MnFVZTVVUVhuWlpHOUtMYVY5YUN1OWpYL2tyeEpRcGdHeEE0YjUzWnF4UGkr?=
 =?utf-8?B?ZWxFMkZoMGgxbFRsSnB4NGdUWENKOHMxMENOWGtISitZVHVmVEYzeTNzTjk3?=
 =?utf-8?B?dkNXRVNJajZMZ0cxUHozZ200UjlsR3MyMDk5NXg3TWIzSWh5Nllaa1VZU3hO?=
 =?utf-8?B?bjhlbGZFa2p5ekJ4SERtWEM3SWc3UnhiQzRHdy8xSzk3MDFVeTAvQVI5d2Rp?=
 =?utf-8?B?STVKNUNNWUU3K3FJcGZ6NHpVUmdaekpuNlF0UkF5dFhZalIwanBManpYb1lP?=
 =?utf-8?B?M09jT3JSTDNueEx4TmI1QXdKd2c2b0Z6aVE4ZFhEZFlzcVdoMEJUdEFGSzk1?=
 =?utf-8?B?VE9uMDlVd1JyWWFKY3JCZEJlZkNTYWlYM1N2ZEFpVGlyR0M5aWJZZGRncUg3?=
 =?utf-8?B?S0hHNkkyRUVFUHk3QnZYMjFQNHR0OEZYeVA2TTFxK3RBOWpQZmNTanNwb0pK?=
 =?utf-8?B?UzlSNnZONkE3NkFFVW80WnUzdStWYzJ1N1puS3RENFlKZis4MS9rZlQyTlQ2?=
 =?utf-8?B?ZTF6ckV2SnR1VW1TZjdwb1lDaFNqK2FzdGVYUWtzbmpWVTQ3c3lXMnBHUWly?=
 =?utf-8?B?cWRITStuU2pwR2xNeEhOR1VwdE12bERHaGpydEhFUmZtS3dqMjByQ2NQT2o1?=
 =?utf-8?B?V1pUM0pVYmVRbWoxRkdvUWZXVlhJYno2dmgyY2drM09sOXJBN1BsdUZ6UGVG?=
 =?utf-8?B?OHRjeFgzWHd4VzlpR1BpaTN6OFJ4Z051VXBRSk1KR2xKTGU5bEw5d09TSkdp?=
 =?utf-8?B?dXY4akl0bnlTcXozdU52Uk5WL3ZjOVd3UndxemgvbTFDT2IyMmh3eVBhMmVS?=
 =?utf-8?B?S20wcmtMWEFxdXN0cFkwR0srcjgxTnRiUm14VnlaRVBBa2tmVlp5NEJrTloz?=
 =?utf-8?B?U0YrQWl6STZBYS91R09YR1k1b0ljKzVQTENYZ1ZwZFJCTCtqZVZweU5XQ2NE?=
 =?utf-8?B?SDZDNXFoaUpHN2pwdFNhSlh3QzN3Mml1VmdSWG1ob0xhZW14Ums3cE9RaU5s?=
 =?utf-8?B?ejNJZWUya0VaYjVmVENSM3JqdWRVVHMybTRnL0dxdUkwU1FXcmNUL1dydnBT?=
 =?utf-8?B?SW8yd3RxREhlaDR4L2twdFJpZnlUa3Mzd0dvVjlpTTRxZURQY1FmdE1jdkpP?=
 =?utf-8?B?NVRZVVRWdlNRUEJRYmlYRW1CYW1FRmpJSVBrTzcwSFVyWVRSdFQ3ZS9kcTdv?=
 =?utf-8?B?UmRhWk52bzVHUDloK1JaOFd1NnBYdktVSjhBRjlYYkJXQS9GOEdxZEljTnF2?=
 =?utf-8?B?WmpaR0JXdFBWZE84V2pqcDNXZmJxUHJ4MFlZQkgzZFhnd3p0UVFwNHhhLzRI?=
 =?utf-8?B?a3hoemJjaWNDZnd0NnNqT3BQTmdjQnR3TVNhQUVDMlBDeWcyeWtQWWh3U3lv?=
 =?utf-8?B?RXBQY1JpcjRtb0JJR1NrMzZHMlJUWTZKWStsQVZrSUV3RnJwY2o4MWU5MHNq?=
 =?utf-8?B?WXJUTXZiWStsejJ0YWZyZUdDVGhsajdzem1ZZDBWYm5xK09maVNjZ2lPUGV2?=
 =?utf-8?B?NUcwRldiSE9GVkFpVU5wNFBJNXlNb0NZdHI5TU80Q1BZeFZMRXV0ZmtDMFkx?=
 =?utf-8?B?MzVja09tQ2FIQnVteWp1c2xDZEU0dTlTS0hsWVhTOTRXSG5kQUNPMWI1MlVv?=
 =?utf-8?B?OElkUFN0bUU1QVRkZVI4U28vdk1XOWE2MVBSQmh6d2llajVocU5iMTYxQlZW?=
 =?utf-8?B?UU5Ea0swSVltbjhidkM4bWdIYk45NkFOcTZkT2N3bndUN09rUlU0NmsyYjRM?=
 =?utf-8?B?a09VM0dZSXpyMjNVS3NMQThLamZTRCtZSkFZZ21kQWhXdGpTUGIrc0xsQjJ4?=
 =?utf-8?B?dlNhTGt4R3VYeTlUZDFkbnZsSzBrdTRxeW1DVkJFc0RIQzdTZnlqa3JDVmsy?=
 =?utf-8?B?L0hEVGRRRnlWdUZSU1d0ZmJzU1hiUGY1UWZ5UmxqN1JsU1F2aXBwU0hoV2F4?=
 =?utf-8?B?ejJYMjhpTVlqaVZOWThlTUJpVmpBQ0w2eUZVUmtmbnFKVzRGWkY5eVFWWTR4?=
 =?utf-8?B?MEJvUmhkVjNPd0k3d05wR2dqeW5RPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f713c8-4936-456c-c8e5-08d9f885eff9
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 17:40:39.3060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08bcRZTlUKjNjoNaLlgT8ZwaqPZdqODoWvpIuT5P9Yfpc8pQCV6t3JV4AW2mKE/CjPECPy9Id48cF+JUwdpBoPAKP/k6yGbRVufRYhuIMkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR10MB2706
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10268
 signatures=684655
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202250100
X-Proofpoint-ORIG-GUID: Jx_-Nlmsc-pnig8g7WMhkK-PGvNg5lLk
X-Proofpoint-GUID: Jx_-Nlmsc-pnig8g7WMhkK-PGvNg5lLk
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 2/25/22 16:15, Alex Williamson wrote:
> On Fri, 25 Feb 2022 12:36:24 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> On 2/24/22 21:40, Alex Williamson wrote:
>>> On Thu, 24 Feb 2022 20:34:40 +0000
>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>> Of all those cases I would feel the machine-property is better,
>>>> and more flexible than having VFIO/VDPA deal with a bad memory-layout and
>>>> discovering late stage that the user is doing something wrong (and thus
>>>> fail the DMA_MAP operation for those who do check invalid iovas)  
>>>
>>> The trouble is that anything we can glean from the host system where we
>>> instantiate the VM is mostly meaningless relative to data center
>>> orchestration.  We're relatively insulated from these sorts of issues
>>> on x86 (apparently aside from this case), AIUI ARM is even worse about
>>> having arbitrary reserved ranges within their IOVA space.
>>>   
>> In the multi-socket servers we have for ARM I haven't seen much
>> issues /yet/ with VFIO. I only have this reserved region:
>>
>> 0x0000000008000000 0x00000000080fffff msi
>>
>> But of course ARM servers aren't very good representatives of the
>> shifting nature of other ARM machine models. ISTR some thread about GIC ITS ranges
>> being reserved by IOMMU in some hardware. Perhaps that's what you might
>> be referring to about:
>>
>> https://lore.kernel.org/qemu-devel/1510622154-17224-1-git-send-email-zhuyijun@huawei.com/
> 
> 
> Right, and notice there also that the msi range is different.  On x86
> the msi block is defined by the processor, not the platform and we have
> commonality between Intel and AMD on that range. 

Wasn't aware of that part of ARM platform defining it as opposed to
being architectural -- thanks for the insight.

> We emulate the same
> range in the guest, so for any x86 guest running on an x86 host, the
> msi range is a non-issue because they overlap due to the architectural
> standards.
> 
> How do you create an ARM guest that reserves a block at both 0x8000000
> for your host and 0xc6000000 for the host in the above link?  Whatever
> solution we develop to resolve that issue should equally apply to the
> AMD reserved block:
> 
> 0x000000fd00000000 0x000000ffffffffff reserved
> 
>>> For a comprehensive solution, it's not a machine accelerator property
>>> or enable such-and-such functionality flag, it's the ability to specify
>>> a VM memory map on the QEMU command line and data center orchestration
>>> tools gaining insight across all their systems to specify a memory
>>> layout that can work regardless of how a VM might be migrated. 
>>> Maybe
>>> there's a "host" option to that memory map command line option that
>>> would take into account the common case of a static host or at least
>>> homogeneous set of hosts.  Overall, it's not unlike specifying CPU flags
>>> to generate a least common denominator set such that the VM is
>>> compatible to any host in the cluster.
>>>   
>>
>> I remember you iterated over the initial RFC over such idea. I do like that
>> option of adjusting memory map... should any new restrictions appear in the
>> IOVA space appear as opposed to have to change the machine code everytime
>> that happens.
>>
>>
>> I am trying to approach this iteratively and starting by fixing AMD 1T+ guests
>> with something that hopefully is less painful to bear and unbreaks users doing
>> multi-TB guests on kernels >= 5.4. While for < 5.4 it would not wrongly be
>> DMA mapping bad IOVAs that may lead guests own spurious failures.
>> For the longterm, qemu would need some sort of handling of configurable a sparse
>> map of all guest RAM which currently does not exist (and it's stuffed inside on a
>> per-machine basis as you're aware). What I am unsure is the churn associated
>> with it (compat, migration, mem-hotplug, nvdimms, memory-backends) versus benefit
>> if it's "just" one class of x86 platforms (Intel not affected) -- which is what I find
>> attractive with the past 2 revisions via smaller change.
>>
>>> On the device end, I really would prefer not to see device driver
>>> specific enables and we simply cannot hot-add a device of the given
>>> type without a pre-enabled VM.  Give the user visibility and
>>> configurability to the issue and simply fail the device add (ideally
>>> with a useful error message) if the device IOVA space cannot support
>>> the VM memory layout (this is what vfio already does afaik).
>>>
>>> When we have iommufd support common for vfio and vdpa, hopefully we'll
>>> also be able to recommend a common means for learning about system and
>>> IOMMU restrictions to IOVA spaces.   
>>
>> Perhaps even advertising platform-wide regions (without a domain allocated) that
>> are common in any protection domain (for example on x86 this is one
>> such case where MSI/HT ranges are hardcoded in Intel/AMD).
>>
>>> For now we have reserved_regions
>>> reported in sysfs per IOMMU group:
>>>
>>>  $ grep -h . /sys/kernel/iommu_groups/*/reserved_regions | sort -u | grep -v direct-relaxable  
>>
>> And hopefully iommufd might not want to allow iommu_map() on those reserved
>> IOVA regions as opposed to letting that go through. Essentially what VFIO does. Unless of
>> course there's actually a case where this is required to iommu_map reserved regions (which
>> I don't know).
> 
> iommufd is being designed to support a direct replacement for the vfio
> specific type1 IOMMU backend, 

Yeap, I am aware :)

> so it will need to have this feature.
> Allowing userspace to create invalid mappings would be irresponsible.
> 
> I'd tend to agree with MST's recommendation for a more piece-wise
> solution, tie the memory map to the vCPU vendor rather than to some
> property of the host to account for this reserved range on AMD.  Thanks,

/me nods

Should we tie this to phys-bits, me opt-ing for a particular property of the
host (AMD IOMMU existence versus just AMD cpu), is actually to minimize the
span of guests this affects. The HT restriction we are talking about doesn't
apply to no-iommu enabled AMD platforms, regardless of whether the host
reserves that portion of memmap space for its own biding.

Intel hosts can still try to expose some form of AMD guest cpu -- but perhaps
I am being paranoid to consider that it's something people do out there with
qemu.

