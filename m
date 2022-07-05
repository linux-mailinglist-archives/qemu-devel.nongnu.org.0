Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC6A5676D8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 20:51:26 +0200 (CEST)
Received: from localhost ([::1]:45192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ndt-0001qw-MW
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 14:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nJ0-0006gk-7u
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:29:50 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:22918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nIt-0002cp-97
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:29:49 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265HEWWA009160;
 Tue, 5 Jul 2022 18:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=8DmTn68tP7pLyrzjEZKLK+1tYvBmDZNwb1/YDKO2K6k=;
 b=sAiK+b0F6dyCN6pSPJrbFekAQFyMBWy1L4D3LV4jZX90eo23vF222FriB/PaZJO+viCs
 8phOu7orXmDVYJ6ZweNEo3+JicgLNDfQM9XLJ9/Vdb6mlYqaYjVNz57kmhf6DUt9XAyH
 Yxukof03Jp2YD5//ctFePEvHUBY7whs14x8xJr0//hIjc29mwlpSXTpxqtTNRXE0TNjJ
 rGbqqH/e2IhQLkHQlKo7bkYBWLiF7aBzE1d+vi27FEh7RgPbYUQmQXquEqdvNqz6p8Eq
 Xy3YedSu0sc6Z0AG9RVvfINQ5sdcOYG4+5PV5EdOoYYzHVuZf8teF6FVCLftD/lfOL/R MA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h2cm0q350-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:29:31 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 265IR4Qs018975; Tue, 5 Jul 2022 18:29:29 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2172.outbound.protection.outlook.com [104.47.73.172])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h32mjg0ja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:29:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJWouDVWS9qWMJJXGS7R8Zp/oDDS6VIrVZ8VMGKZCcd5WkX/+A2Zj3lg0l0zR4wIAjPZdkQhNWTkKTc3vDUz3dRG2ZWjCpy6WzTuWm5jHvVnCv/AYMh04zFaE+4nKeGjPGv0S08Wv1XuyVgVLYWRSKmXuo0PRsZibgM59nkofAMcQ5QTebvmIoli+PiS4Xc6KKDK/D3tNmxAyajTeQgOExXr7xrdGDQ6Hlig4GO/kiHFtPUL0jvz//TYTZQcOKKh+1jLFOvcqkgfJRCkw4weDXXOkuxh+bTohdmZt5HeOvhVk32F7RS8SuXDp/mLPC/RTKJ28NQEPQnu54RudhtoFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DmTn68tP7pLyrzjEZKLK+1tYvBmDZNwb1/YDKO2K6k=;
 b=CKGzTAqk6BR1vqGHHeCoets1AgVaxXFBk9FlD1VGiFHGheRafFe40kDk4ZYUfdSAW9+R19WGqeAks/oB+aBmDRcHY8a43UQ/bCWCztSqUyKgQiVIRfrzHOgIvtU44qgNx+8/PVm981OSDuRkwD/0MXeYHqjTh6ry2JOSM2uegTk9UMaNAj463yhRoEfqzGzlSTXusg3hfWBALypm6oJimzQpYvmEWZtIWkEqfyB/2MaAndYCGNLqYW7o/uJst/va1LPNsn9d482sPzs5jOhOZX+8C2TA6Vr2ClpTBo7etLeSxB+yP7c8Oq2taB6Vd+GkoKiKSWgxkwvOExE2F5Qd1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8DmTn68tP7pLyrzjEZKLK+1tYvBmDZNwb1/YDKO2K6k=;
 b=dGreDRMJg9E5yQS65HqAiR0+D7ilQZi28lc6kMK6RgiFvt8w0++Pz4pRZBc+zYOLMbc95NIjgyBUUrCORfBHOJ1uWqP2VBNTTe2m+3ZwtmIkbuMofy7B1BVKxLnaMY+MmQEQdWk8GXoA4134y3Jr+Ugaa+zYY/v33+8wdLnKT7s=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by DS7PR10MB5341.namprd10.prod.outlook.com (2603:10b6:5:38d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 18:29:27 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9%6]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 18:29:27 +0000
Message-ID: <c513a2a3-bbdd-246b-e0e2-ca6f7d87d780@oracle.com>
Date: Tue, 5 Jul 2022 14:29:21 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V8 24/39] pci: export export msix_is_pending
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
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
 <1655304746-102776-25-git-send-email-steven.sistare@oracle.com>
 <20220627184410-mutt-send-email-mst@kernel.org>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20220627184410-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR02CA0069.namprd02.prod.outlook.com
 (2603:10b6:5:177::46) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f344460-45de-49f2-084d-08da5eb44adf
X-MS-TrafficTypeDiagnostic: DS7PR10MB5341:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5tV53dxuCKSpQJmn2vEAt/ua7Kfgf5MUVAMz2de98cNwYURq5yUMXJltEAE1FXC/E4QSP1c/rwNajSXr1/UHjhHL6MF2uiJotECDFhPGA+zA5eGXlaBVz821A4Rv2Lc9NenIEttWshRXX0PHrOprwhXouFps9UKo/dJQ+hoh6yRVYMSO/n2r4+tE6lgjVqdIJ5F1IeLqThIwJvgtWbiE+6bXrkKPTlFhYFaptRjcTb5bLhP8j1LPag+GVkkiHN+84fzIm9pE2IXlmrmNvmoD+MDcayOTphs7atRrI4XlCwbqSM70lUAJ3WXtmSopBMcTtkuj7Fr1GT6G7aph/95+VmQzwBNsMBwPs3WQzOyZfyLtKMCYbciuMVZYUupqYeQcBsDHw9Z6bgGBdERt2T3KFoPopc0yZzzMkWV7mBmJxnTSzXKQtJ4NmzeMPEbwax6EJHLKXzGFll4/L630SmdoLS2uLcStv7wGmzcwKbto4YKoUp+UjBOR2Vt15Q+32vXUfSIXlqpPBNweCDoII7YFDzKqU8ZiZqorZBX7LPCWZF45lOv8OZZ2Bat7LGGMtTZyjQjlqUN9KSGE+sB4aLiW8ms5LMqfArJkLSTbKJxOMSrTtJ7ayubm2NGFGGO4AibA/3yF8QFAQzKqnU3Phhxdv72zaOzthssYsryZu5u2sqfHz4mzUDkTa4dc8uaF2jaUij7JiET36cIdhhr5wQTsXrm/4gUQwXzgTxD2C1cHmxDawl3sG6AW9E0adUz0JWc7dgXkRkY2s0odDeg8kPoCMsEbxh0LUzgDIYKI/2OwDR+qZCcjDHoV2OeKGt+2sjbcKuzpNXYBFyKziKAjwXnSwA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(39860400002)(376002)(346002)(396003)(36916002)(8936002)(7416002)(5660300002)(54906003)(4326008)(8676002)(66476007)(66556008)(66946007)(41300700001)(86362001)(31696002)(6666004)(6916009)(316002)(186003)(6486002)(26005)(36756003)(6512007)(2616005)(6506007)(2906002)(53546011)(38100700002)(44832011)(31686004)(83380400001)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YllNRW5Ra0xWNUlaV3VwY1RNT1puYm5FRzVzYmN4ajNCNzdrV1JScG9EaUVW?=
 =?utf-8?B?L1BvT3ZaYjdZNXhZQXlVRzFKaE1kVVYvQXRzRDhsekthVmtBbG1Xd0RiNUov?=
 =?utf-8?B?M2lmdkNLRmZsM1BDbi9NYTRlU3UrT1V1QnV1OFlYWDR3S0dLYm5yUENJMTc5?=
 =?utf-8?B?cXBaaUVSaHhWU2lSeE9MMUt2UlpWM1hORFg0TzdkUDJtamtoMmJFZlcvZUF6?=
 =?utf-8?B?RVczUTZuNmt0MVNyQ3JFMnJoSjhkSlczWGVoeEhra0JhR1pvbHJ5aWhBT1dW?=
 =?utf-8?B?c3hBVEdJT08yTEZiQ05ydkJFaWtDbTBOcyt1UnVPYThPQzJMeTlSbEZsNW5N?=
 =?utf-8?B?d0NxQnhCQ1dyZCtzZUc3aTBXWXNXanIyWkhnTllJalNjRnY2ekQrWVNLcTZW?=
 =?utf-8?B?ckl0cGE0cDgvQ3JLWTEvcTFtMENuZzFYWTR4MUFnWElxNzdFUVhkYllIT1c3?=
 =?utf-8?B?ajJqZUE0MDFyRm9TSzE5NEEwZkc3d3YrMTkrOVIvdzM0U2FaTDFtTGsvdGhZ?=
 =?utf-8?B?WndhU2xmbmo5NzM0akZRTEdqU0E0TFZjSngybUZrMWxqZExqNUlYbGo3cVl4?=
 =?utf-8?B?MVhITXNnMDExdG9YbDR2cmlnWWhSTm5IYXhEVXB0SkFKdGloTDB3V1NjUE1r?=
 =?utf-8?B?ZTREMmp0STJXZXdUYUNJSjhBOFNIVnBDYmtjNTJjL1Rtd1d4WDFhd1d1L3Zi?=
 =?utf-8?B?d1Y1QVpNY1hEUmhpTVhZeWFVajVUK08xdzRXa3RuTWdjeFgrc3ZiUUsyWlN1?=
 =?utf-8?B?QTlTOENSQ3pJaHFiZ1lrL2FQaSt6bWZDTzM2RDNnMUFsVTltOW8wTUd1VlRh?=
 =?utf-8?B?Rlo4YlhLYkVMYWVIM3pYVGg3YjV1eEJ0cExmYjRlVXRObzkvOHVUWjc5QXlN?=
 =?utf-8?B?cm9vV0hGRzB5WXF5MEVKdWIvcWMxRm1OUnRYMW1QTlRJV1h0QUVwRTlJczlB?=
 =?utf-8?B?ZHB3M0FLajgrclRvYnVKS29UNGdQL0FmdjZnTmYrY0I1VHI1WjZFeUI2SjMz?=
 =?utf-8?B?RGorNFFoL1QrSEdoa1dKZERwd0I5Q3U2bWdlcEpwc2hCMm9IWlMzdFEvTkR1?=
 =?utf-8?B?cGYybnVzb3FzM293dnBMNXY1dnJxcWs2UUdianJtQkVWUk1DZXZCYUlnUEJy?=
 =?utf-8?B?NmxoNm5WZTRIZXJuTU9QWWw3MjZxdytZSTBOZThSVC9HZzVKY0drT0hsdkUy?=
 =?utf-8?B?UnU4UzBYWnFqT0tXTnZibWZXTk5TNFpKUGZJN0p5ZURGUFhiMHhrVUxCSktW?=
 =?utf-8?B?RXBEWDI1TFd0NER4TmlicWVvak15RXZaeUc3TXdLQ1FwRFNYUmZiMnRGOWR6?=
 =?utf-8?B?N1J6by8zWk9Xb1FoM1R6OExUYlV0RzUwTk0zSUIwaHNFcStHZFpESkEzVHZM?=
 =?utf-8?B?SUdUSFRhY211N1FROGk5b0wvMFE4ZWdmNEVjdGRCa3M4SFBjSnFXT1FReEVV?=
 =?utf-8?B?SllyRkdkakw2RklqaWxxenZueGFoaUZhUnBoOU5TazBYSlVUeDNkV3ltVzFY?=
 =?utf-8?B?WVNlUUFJRzY2Nlh1UXp5TEl5V2pUZU03VGhJdWV6OTM4ZkovK0RYdlVDT2Fp?=
 =?utf-8?B?SWVpR3U4UjBUUUlKYk9YUzhuS0t4R2hVbzdwYWtENDdudTFUS3pHWlIwNVA3?=
 =?utf-8?B?V3A1ZnJaaElpQ3V2RVM2c3lBTWlST0h2NXI5S1ZVNzcvYTFseUV2ZnVjcjRw?=
 =?utf-8?B?QlZvL0lJOFo2d3RFMlhwdjlNOTVoNVc3dVpBRmQ4UUtnMFRPamoxMGRseEtO?=
 =?utf-8?B?R01kNmdLVHQvbmo2bk95cnBZUXJvLzU0ODF3V01iSnpUUkdkbkNVc0ZTWFNH?=
 =?utf-8?B?cU1nYjJYQWVjY0RnMjQzSGV6eXAxOFZQZ2ZsWDkwZzVrNHlsM3MrbEw3aEww?=
 =?utf-8?B?VGxvL1VZMkR3RHY3ZS90MWx4eHkwc0NmTVBPNUpXd3V3UzYzL3ZpWjhZa005?=
 =?utf-8?B?VklBQVNsYWg3Tk0xRTVDbjVITWtYc1dmaU9UUmpxczRvYUt6WEJva2RxVG01?=
 =?utf-8?B?eE83SkxYbjN5eCtmcTlrcGdxUlJRS0MyZGhMN09pazhYK25vTFlJUG8rVWtw?=
 =?utf-8?B?NmFvUitrMjdZU2VyOEQ1amJyS294Z011OUgySDBBOTZHOEJteTNQRjVLYlBU?=
 =?utf-8?B?L3lJZXlXYlByN2JkWlhiWUpGYlVybTV5UW83eUpkTHdCUWxsaTNhbmhOaTJO?=
 =?utf-8?B?Wmc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f344460-45de-49f2-084d-08da5eb44adf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 18:29:27.4132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ha017SCGaP5YKpGFR+dKYrd2IntFwo2Uizl9M+cGem9oA2tkfyGoFK+DM3hlkS2nRdrAhqJT1hJWWG6Ii8BkblYJn8Q4zhlJ5nl9qfa1R+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5341
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-05_15:2022-06-28,
 2022-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 mlxlogscore=999
 malwarescore=0 phishscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207050079
X-Proofpoint-GUID: uLbocIJAmWz-YATWFptjoqt2ouiibvBY
X-Proofpoint-ORIG-GUID: uLbocIJAmWz-YATWFptjoqt2ouiibvBY
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 6/27/2022 6:44 PM, Michael S. Tsirkin wrote:
> On Wed, Jun 15, 2022 at 07:52:11AM -0700, Steve Sistare wrote:
>> Export msix_is_pending for use by cpr.  No functional change.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> 
> the subject repeats export twice.
> With that fixed:
> 
> Acked-by: Michael S. Tsirkin <mst@redhat.com>

Will will fix, thanks! 

- Steve

>> ---
>>  hw/pci/msix.c         | 2 +-
>>  include/hw/pci/msix.h | 1 +
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
>> index ae9331c..e492ce0 100644
>> --- a/hw/pci/msix.c
>> +++ b/hw/pci/msix.c
>> @@ -64,7 +64,7 @@ static uint8_t *msix_pending_byte(PCIDevice *dev, int vector)
>>      return dev->msix_pba + vector / 8;
>>  }
>>  
>> -static int msix_is_pending(PCIDevice *dev, int vector)
>> +int msix_is_pending(PCIDevice *dev, unsigned int vector)
>>  {
>>      return *msix_pending_byte(dev, vector) & msix_pending_mask(vector);
>>  }
>> diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
>> index 4c4a60c..0065354 100644
>> --- a/include/hw/pci/msix.h
>> +++ b/include/hw/pci/msix.h
>> @@ -32,6 +32,7 @@ int msix_present(PCIDevice *dev);
>>  bool msix_is_masked(PCIDevice *dev, unsigned vector);
>>  void msix_set_pending(PCIDevice *dev, unsigned vector);
>>  void msix_clr_pending(PCIDevice *dev, int vector);
>> +int msix_is_pending(PCIDevice *dev, unsigned vector);
>>  
>>  int msix_vector_use(PCIDevice *dev, unsigned vector);
>>  void msix_vector_unuse(PCIDevice *dev, unsigned vector);
>> -- 
>> 1.8.3.1
> 

