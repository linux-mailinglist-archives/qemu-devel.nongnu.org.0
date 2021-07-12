Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBCA3C6190
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 19:09:50 +0200 (CEST)
Received: from localhost ([::1]:35492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2zRF-0003Kw-22
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 13:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m2zPB-0000bg-O8
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:07:41 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:41954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1m2zP9-0005tT-QC
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 13:07:41 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16CGv7SR003719; Mon, 12 Jul 2021 17:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=SOIvKYqP6X/f8D83JXvWk3WDHhV3EP9X6Ooym7XD3sc=;
 b=voAb6QFCHcE32F9ERtvW9F+W5gY201obgvmH7hXcy9dDWpLPs3tqZ5JxaG/e598j9+uP
 MVre2sviLXdZJ9kACRlAb1vFgLKy9GV7/LoRT/nKtQcefqWsA5qz5S2goQX8K0Njwuxd
 BZs/oJ3lWqHAgLpboXZ5dKp+oLwHCDsKlKyyifKOvNUYTdoGnsfOhfofMvJ00/rhUqWW
 U+IPPqyqMof0G8hebhIdTYShZcc5UKGZmsDwtACaW6Ty4j3GheXpy+cqG3zzCCYIQwwI
 j/TYZXHpSGpWAvrmhq8RidHEgCl4MAqNnILdse7bNoKvXa8TSZPLMY6mlDQuIDZwmOy4 AQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 39rqkb0cyw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 17:07:34 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 16CGt2ew186601;
 Mon, 12 Jul 2021 17:07:33 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com
 (mail-dm3nam07lp2044.outbound.protection.outlook.com [104.47.56.44])
 by aserp3030.oracle.com with ESMTP id 39qycs8ywq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jul 2021 17:07:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XsU6nfRB9h+0qp1enqVAZB/PGJPJQ5HfnCULPmN2iDlekmSElhnhISsYMl3u3kbow8leJBDOGSsqDu2skqDiBLzCdptC6wxIzbw/d/Gq8QLO7AHHXyaZHRg4wBrZQpMJkE9EKJfH5BZCp9qZhmQgcAfTyrXfHol9KF2zup9b1/hzI1hAm7DIf6z98TlwH54T76AyoZ29/fA2bgUm/rQr0k2/9CWKZnHYGouctH8SnoObuGSIOZXWJYQUVqs+c86Fu3BrylZPq3g4vUUMlfaWTdmsVB1pSUid+KWyirSUqMX8NC2kJOcaadhDBuEJlpI3hKN1XX4GB4kNCn34ea6R/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOIvKYqP6X/f8D83JXvWk3WDHhV3EP9X6Ooym7XD3sc=;
 b=ZDt548CSi1mYlzTon+OHDp8J9EmYLyFBV4ZNuD9qX+O+WmimmWRiU4XBXIu38EYR5LVcFJ9rP6+LpVbo4Rs0f5efT+1FGYyOAEM6El+09wW0TVDlIFlQ72iDM0sH4Y5OmkSIdzgRwwPRBXGMRYQetOMIKb/HS92Rg2RnTykEFqb4M0NcWjM0IjWQBuGxUQPgHhETcLZS1N+9tzTQDJuLjNZ7zslaj67WjYX0PT4LAxG5mxOS/xGKKEHZxi1w0RjrTJCOspwXHoX6U7/yZTZ2PhnmXx83T9hPq1CrxXcFjrwECGnEERhSAfyrTx5AytQXgFFK153kUzlr1hsd4EMozQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SOIvKYqP6X/f8D83JXvWk3WDHhV3EP9X6Ooym7XD3sc=;
 b=cjVmR5bMOqSjprbf4bmZ0MhkY24ctJtXdL1Vw3cyL4Q+isfAdfKlCFBv9NVsvLhaqI6amMpakC29YBPANxrq47Zcqaai6TUGiKwxHndXXW5vSYF1qJALaKlsRllJnhJ5v3vxJDUoGF0X3NDL6QUyZ80bWoDEFxdyZ9t0zAtF5Gk=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4734.namprd10.prod.outlook.com (2603:10b6:a03:2d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Mon, 12 Jul
 2021 17:07:31 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::a00d:eb40:2bf6:8812%7]) with mapi id 15.20.4308.026; Mon, 12 Jul 2021
 17:07:31 +0000
Subject: Re: [PATCH V5 05/25] as_flat_walk
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <1625678434-240960-1-git-send-email-steven.sistare@oracle.com>
 <1625678434-240960-6-git-send-email-steven.sistare@oracle.com>
 <CAJ+F1CKEec4=KH1kER5WmH2-LD+EshXhxQtPcXezCduuG7+_VQ@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <e83ce548-3945-37ff-dfb6-437f687a6a1c@oracle.com>
Date: Mon, 12 Jul 2021 13:07:27 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAJ+F1CKEec4=KH1kER5WmH2-LD+EshXhxQtPcXezCduuG7+_VQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR08CA0021.namprd08.prod.outlook.com
 (2603:10b6:805:66::34) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN6PR08CA0021.namprd08.prod.outlook.com (2603:10b6:805:66::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.19 via Frontend Transport; Mon, 12 Jul 2021 17:07:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb779b5e-602e-4071-a143-08d945578935
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4734:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4734EF72218ED13DAAE264C1F9159@SJ0PR10MB4734.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xyp2LyQvV7zbRLVsp7uScpAEwQM2SvAxIMYY5I7wDI/JAp5/Pxn2CuWr8DDSregzuC6u4+lsu+dGslB9owuN6ELlzJDmcxOjBjChxPk9ghMCBYMHvAfZUNwLGhkwQYA+8EzQV3OQFmrYhc9166xoVTVuILTT4pHr7m171IlEdixWzbVGX2d8h3bRXuNa9ZXDEyzg/DpmC3K6NKS1aBzVNx6rGYmH99wUz/c5vuGDB5Q0LBpsUePZwPXYJkmBdlvRbOzqz5GVnG5QOcr8yQWi00EuuFv8BwGza9s1ODUJrniyuLTjdvB7OSsMX/q916EEvwrK4Cjn4RJ9tgg3K45l7S+7yLHrY+a+DOL2cEZQmYJu+b5r0GOqWWwRS9rK50ZsK029SIu/2M7bCMmJQ9rLFClZpN3B1J/kLZqENzhN3PsqOSJ9pAkZm/V5Tyu71ctRffdMoQi+Lk/vjp1MPAymDOy3mWbL1xXt+BqUV/PpPwcaN7E3KQG1JeJLrEIGcjrcsN3kmIPOAYzwrURpVcKBfk6zOTDGCs03XSuqqscM8sERTyAH8tZSp5h4LYSdKkwLLUsLp/I1E+AghD3qP5D6QRDAMQwIAn1cPgHl194yinZ8CruOEzskeEWF1f9MBq5QQN7fPZyIvkIzDrNWxXLvvh3oT9zQImVwW7qu7NUQqO8ZaYj3Dw7YlkcUUJzKFTaCJ29c8WXN4useTtuXTyzRZRqT+14np5cp6rxlSKIZeFQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(396003)(136003)(366004)(346002)(38100700002)(6486002)(8936002)(36756003)(36916002)(44832011)(31696002)(8676002)(4326008)(186003)(83380400001)(6916009)(5660300002)(7416002)(31686004)(86362001)(956004)(2616005)(316002)(478600001)(54906003)(26005)(2906002)(16576012)(66556008)(66476007)(53546011)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTZLdGl3T1ZCMUlPQjZOZm1WaUJxbVlMU0JNQ0RVRkl5c1BoZHNhOTlNVFl2?=
 =?utf-8?B?aElBV0JkN3RXcStkYmdGS3U5cENPY2VRclI4VkVGQkl6bXdkNm82Q1F0QVM1?=
 =?utf-8?B?V1lHQkQ4Q2t2WGE0QTd1TU9Lb1Z6dHpuREkzeXRQOWc3MVcwR0JQc3pzTmVH?=
 =?utf-8?B?K3M4bUw5SzZyL0VUUk93Y3R6VnphVlRFYWxuamhzL3czUnJSKzIyeW9ZQ01M?=
 =?utf-8?B?K2FlL1FxV1BVdEVhQ2o1alNjTkpySm5abkxNeUtXYjBqY0dEUmdMaDR1cjVY?=
 =?utf-8?B?MkRZWC8wRkhaU1R2bzNxcEE4cTNGMmp4YWh1TzhiT0RkWkFxS2Fad0pFODVq?=
 =?utf-8?B?T0YwSG82ZGR4dmFMdUZ4MkNKZkY4Vzh3OHdYdXR1aE5qdm9YNzgyUTN3bXh1?=
 =?utf-8?B?Z2NNRXhVdzhQZGZoQUx6Smo2RzBLYjF1dFlLc3V0d1F2MlQ3OWRhMWYzNElM?=
 =?utf-8?B?V0NEa3QwNmIxQzB1SUE1Vnk5Wng4YXlzMHN1cGczSEd2aTJWVHpJVjNnaXhW?=
 =?utf-8?B?ZWtsc3hOK1RtRklibGJTRGRRaGdiN1AyZ3RqUmpIK0toRUxsN0xtTkFKa0pP?=
 =?utf-8?B?cFgyNmJFNzlkbjUwL3FsT0d5SEVXbCtMY0QxTzVtTDRPZ2FETGU0K1d2YThF?=
 =?utf-8?B?Q2I5bkF5L0d4THpSV0FwTFk1TVpURThlQkpvNVB3eVRrYy9waFZ3dFozMk45?=
 =?utf-8?B?Q2NyM2JKaDlXczNEMzFFdnhqUTd5bUVCcWZQL0VJbGhCL3JaTkk0d1AvSHpB?=
 =?utf-8?B?cEN2dTRmclhNMWpyM0ZybHEyTmZEa3kzQzVuN2RIUmVkRGExcmNWc1UrMU1t?=
 =?utf-8?B?czR2eGtsUlljZGtlZjhPVW1BRTdOQXhobnNnRXB2aVJUMXFiT2ZGQkVKMFJv?=
 =?utf-8?B?eVdiaXBCL2NGMHkrOXFvcHFaT3ZaemNMOHdNaFA3UVV6WC9GS0k5emJlMTBt?=
 =?utf-8?B?c2F6S1dYdXUxUEFkdldhNkpTKzBhSkR3cytMQ2szdnphb0ZqdlNPWUxscXBq?=
 =?utf-8?B?S2pDeUJUK3lOd0R3VzBqOHNQajlIcWhwMWVzVmhvYTUwWVBKUnJabkhLWk5H?=
 =?utf-8?B?cTV6OW9PVFllcVhtRS9ta1NlMFI2YUg1bkMwd3haS2tINkhNM0szOFFvcTNN?=
 =?utf-8?B?NG9zMmw0VXhMRm01b1I3dHlyWHFGNXkxYjQvTTFpMlNLMVA2R0grZXczUllq?=
 =?utf-8?B?b09HQzNydk1OUXJXU2prNTB5NnRuUjFybDZoRjZxVmMwS3Y2ek91TE1NVm5J?=
 =?utf-8?B?cGRvN1pDTGgwQ3QyQVZ3bERjc05QQnFXYStkak1mc0FXbHBISUJJRVEzT0Nr?=
 =?utf-8?B?Q2NhbGdRTWl1aGVKWGRMbjNjZ1VIbW5EWERiVmRYZ1ByQW9TWHNtQ0xYM05C?=
 =?utf-8?B?RmFJRGxmWG0wVHIxYlczQ0RMZmRuV2Fab1k3cnlzdjF6YklzcUlpemJ3OE5K?=
 =?utf-8?B?T1Jsc1gycUN2VDRJUHZVVmJaSWZTTXV0SUR1cUFlWTZaNGZ1dTg2RDlMSHF0?=
 =?utf-8?B?T3gxcDlnWWR4N2JDZ0tjbG91bVJIY3J5TGZZM1hkWU9WRkdObXNYZzdxOFYy?=
 =?utf-8?B?dGZwczg4RDlmc1dnOThJTXgxRWQwY2MvUHEyMDBpcHlHWGhocDJQWHczTXJX?=
 =?utf-8?B?dmJJV2Zxb3JhejVFQ3ZFL1NpcEZsZ1BDNWcxSXQ0K1czQVBOS2NwVTNVenV0?=
 =?utf-8?B?cGZCZ3g2UG9sUCtoSWdHZVZrSW4wTmVZS3lqSVpsZ1MyWEluejJXdlljVnZG?=
 =?utf-8?Q?jI+fFADBgiCPkdpzgC9sOrzWwAld0U5x18eUpPo?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb779b5e-602e-4071-a143-08d945578935
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 17:07:31.7279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFkdM2fVuh3coqOYd7PMBM0YO1tXJXa+mLjoyE0vH5yxiL0W+dZGiUhAeoE8gYvrlu/GQbLG7STOOBys9SSUv0v9lgcJeWoD7RTcRjd2BHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4734
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10043
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=999
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107120126
X-Proofpoint-ORIG-GUID: zn7NVhXqwypZiWkkfdmh-W01vWPqVf1p
X-Proofpoint-GUID: zn7NVhXqwypZiWkkfdmh-W01vWPqVf1p
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Zeng <jason.zeng@linux.intel.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Will do for all - steve

On 7/8/2021 9:49 AM, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Jul 7, 2021 at 9:28 PM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     Add an iterator over the sections of a flattened address space.
> 
>     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
>     ---
>      include/exec/memory.h | 17 +++++++++++++++++
>      softmmu/memory.c      | 18 ++++++++++++++++++
>      2 files changed, 35 insertions(+)
> 
>     diff --git a/include/exec/memory.h b/include/exec/memory.h
>     index 7ad63f8..a030aef 100644
>     --- a/include/exec/memory.h
>     +++ b/include/exec/memory.h
>     @@ -2023,6 +2023,23 @@ bool memory_region_present(MemoryRegion *container, hwaddr addr);
>       */
>      bool memory_region_is_mapped(MemoryRegion *mr);
> 
>     +typedef int (*qemu_flat_walk_cb)(MemoryRegionSection *s,
>     +                                 void *handle,
>     +                                 Error **errp);
> 
> 
> Please document the callback type, especially returned values. (see for example flatview_cb)
> 
> Usually, the user pointer is called "opaque".
> 
> Could it be named memory_region_section_cb instead ?
> 
>     +
>     +/**
>     + * as_flat_walk: walk the ranges in the address space flat view and call @func
>     + * for each.  Return 0 on success, else return non-zero with a message in
>     + * @errp.
> 
> 
> Suggest address_space_flat_for_each_section() name ?
> 
>  
> 
>     + *
>     + * @as: target address space
>     + * @func: callback function
>     + * @handle: passed to @func
> 
> 
> opaque
> 
>     + * @errp: passed to @func
>     + */
>     +int as_flat_walk(AddressSpace *as, qemu_flat_walk_cb func,
>     +                 void *handle, Error **errp);
>     +
>      /**
>       * memory_region_find: translate an address/size relative to a
>       * MemoryRegion into a #MemoryRegionSection.
>     diff --git a/softmmu/memory.c b/softmmu/memory.c
>     index e9536bc..1ec1e25 100644
>     --- a/softmmu/memory.c
>     +++ b/softmmu/memory.c
>     @@ -2577,6 +2577,24 @@ bool memory_region_is_mapped(MemoryRegion *mr)
>          return mr->container ? true : false;
>      }
> 
>     +int as_flat_walk(AddressSpace *as, qemu_flat_walk_cb func,
>     +                 void *handle, Error **errp)
>     +{
>     +    FlatView *view = address_space_get_flatview(as);
>     +    FlatRange *fr;
>     +    int ret;
>     +
>     +    FOR_EACH_FLAT_RANGE(fr, view) {
>     +        MemoryRegionSection section = section_from_flat_range(fr, view);
>     +        ret = func(&section, handle, errp);
>     +        if (ret) {
>     +            return ret;
>     +        }
>     +    }
>     +
>     +    return 0;
>     +}
>     +
>      /* Same as memory_region_find, but it does not add a reference to the
>       * returned region.  It must be called from an RCU critical section.
>       */
>     -- 
>     1.8.3.1
> 
> 
> 
> 
> -- 
> Marc-André Lureau

