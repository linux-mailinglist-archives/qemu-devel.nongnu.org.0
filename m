Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9DB567736
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 21:05:01 +0200 (CEST)
Received: from localhost ([::1]:39788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8nr2-0000en-F1
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 15:05:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nJt-0007dT-Ue
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:30:45 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:12776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nJo-00034f-Nm
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:30:45 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265HEFl1012834;
 Tue, 5 Jul 2022 18:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=MwQSCdqmNYhDEeDPFKEllXZDf2dtdH8hqNWsEeB4qsM=;
 b=PGm4+51Fvkm9TyC7lN3SSwCZwGZwUOJEqG2w+RXrzxHxHlA2KP0n/SF9+TX5aSIY3fMV
 /R0huOxROqlD6RfwAMSK5SFljydbAtnxPVF4wVIOuxVn2MJSqZGLdTy9yv6HW8gxzQ5N
 uScteRfPt663mVsAElagcsF9Stge7bHm92zHelRYNeaU0TUx9R29Zu8LkkgrbQNH91ma
 FEzgDAPwEsCVYRSlbvTwb6CceE4maKOEraZbgvmtxO7ue+LNbcIaH9wfoktgJLYkoZDi
 +4FMBJseWoCemCrT0dGFEnG/t0sPanFxK1rZhX4GVhoJ3e0248oUHC+c4CgZCFdYhMER sw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h2cecewdb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:30:24 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 265IPqKF014388; Tue, 5 Jul 2022 18:30:23 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h2cf2kg28-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:30:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGRkdkrKNbp8EQPdOGuECKIkL//prLNZs+kcHOT6nQ4sRRh4t+MiGPXgHttSObwrf79rjKWr3EDHMvqiDAgOOLqunhO3/CwE/vlBoxxW3eG0h3t5b4dhen19ttM7AgVY84WSnpNVO5LU73AGkn48xlF2XVW66X5CuucNECMo6jif8VUMdR6Qummze9TQWzSPdtnW4/HADHE7VzRZRS6v8HsMZem+gqDKtQYMzhqBaF9ZkUyv3SXHLD2t4XkLqa2u+HhDjRjEC9WCB1arBqD953z3F1KcYk6rswU55v5Riuo+ZrAeiD0d7+t44MWXwFqkz1hjZhPSrS76EUMWENSo3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MwQSCdqmNYhDEeDPFKEllXZDf2dtdH8hqNWsEeB4qsM=;
 b=SVOKu6egIWu6EcTUDcwAxZdc9oKri1tkdbnC6Kw2CF2l6DY1Ww49asnJtWBs1ZFOS5UOnznu1I1n+QWAjraPdjf90Lfm3TH7sKyrb3T1CGiTmkJwwlBcjkWMkmcdYovxGP0hLy2cpjmVInVbRyNwoxr6szY8hmIqfTFJWIF6uUUsweNriGOnDdgiH6Z9l7/OicwvAgBIjnZ4TS9wcSzY0WunqWpec36hB/TwA8I+C1LRwPeHYhn8QYKGVozxCfkyd2B/9XDbjsINYYBC0qe53bCMuYyv2PS8x8WoAPLWPnSRDw5NuEi1J4GTWfnZDTsj+RAa8wywPfogHsMv6YZmTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MwQSCdqmNYhDEeDPFKEllXZDf2dtdH8hqNWsEeB4qsM=;
 b=Qb98G0er25iZ0SvjBe9LPBVnaZTlDBVJqwYlDsdN6HK1yI9ynvZAsGTIN95WtjNiSEvOmAXdWrZT3FSvdZtUxIwZBClYTYY+qyw1K4kC+1kENd+37z0OEnOmCLx8CfM3zcqPdd+/IHSRF3yt2OBcu65k2q4CwvxZtz2zRIfqYmI=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by MN2PR10MB3327.namprd10.prod.outlook.com (2603:10b6:208:12d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 18:30:20 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9%6]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 18:30:20 +0000
Message-ID: <128379b9-c6d3-d3d8-b7ca-7788600bed9c@oracle.com>
Date: Tue, 5 Jul 2022 14:30:14 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V8 38/39] python/machine: add QEMUMachine accessors
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
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
 Igor Mammedov <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-39-git-send-email-steven.sistare@oracle.com>
 <CAFn=p-bhH5=KitjvJ3+sW0y1vwDbF0hRE8orLu8xNOhzG8o_hQ@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAFn=p-bhH5=KitjvJ3+sW0y1vwDbF0hRE8orLu8xNOhzG8o_hQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN2PR01CA0033.prod.exchangelabs.com (2603:10b6:804:2::43)
 To BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 208a51b1-74f8-44ff-b3aa-08da5eb46a56
X-MS-TrafficTypeDiagnostic: MN2PR10MB3327:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HrvGpzZZYxpKA1NxidnKYdoztxeJcHm7WngyxlEgBqb7Beh4ctbqM4bUKFYtdgLkYJ2kr5LZNx3Dz3mz5DTD9bYtjsyEPIbHf7LYrzD8UMGwkELYhhLku/ODvOoM8e4BUU3FuNb2/2Pw2aUINkM5fHXx+8hM44hshH2VNXW/j9asbTpsiCZhAuWFW5ABK5HCHyQmtmZ8wAkcFlhkiR0khA1bfEE7qRol41Wmz5kLAtKWJowvvtkGcTnndAg77L2sHVeFe/kG6VGNsCKanjKMAZaA259Xx4hVhqfMeRKJBR673M6byafgNjju352rNDzpaqbEqwOehsVy6ThM2XEN9LEAtCu2ZRAEXJAgJOvgy4ki/Z6A4uAPExYcD+0K3axY+kM4KfEDfnrwlaXmwoDc8n+ug5wsJnzKAZBygKSGwIFqzAiklgnM77+IkXPaJYR+BXv16ZV75nbEDu7H2VMExVchDRRJpOXAMLSMoxaSzmhi33rwPGiKb4uzYtIaDrL5bzTsH2glOm5hO3DQrStd7z0AmLvz3FG1/lu1mZXnm6GOATTPa1ihEkp4NT+7dMYATR//I3x9O2cDfM979qFDd8mniVeowY5+eLSvVhaAfPWlWOoNb2onRXsJCzZ0k60P8QP9WigFY/qthxOttXJpT3YloUSpK5djRm84E0AT5j33iHy235K1Bbsas5W8Ti549qsYLLpPu9v5DwrLeN3y9U/W6DDCzRybFe2CbOrfrQwGSHPfOA/6J83//8M52L+LEWmqoXHhMKc8kIIewFsyTNdV31+iC63PM6WGfOGb+GqAON/sDoyvQdY9C6uOm97EWDos9q0updJlzjecIbYe9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(39860400002)(396003)(136003)(346002)(2616005)(186003)(31686004)(2906002)(44832011)(8936002)(36756003)(7416002)(5660300002)(66946007)(66556008)(66476007)(316002)(54906003)(8676002)(478600001)(6486002)(4326008)(6506007)(53546011)(41300700001)(36916002)(26005)(6512007)(6666004)(6916009)(38100700002)(31696002)(86362001)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmliQUZZTy9pM084aEQ4NDd3VDVRWWZUTm5JdkhXcDk5bFdTYThqOEo2ZXoy?=
 =?utf-8?B?dHFZY3A2MnZuMUgyUkxibzRpbGR4N0F5RGRUQ3h0S3NCc3I5eW1kVjJpUDIy?=
 =?utf-8?B?TzRyUkswcVI5SmVTTldCN3pNSmx5ZEcxbFdkTklKUnFabzdvYkxEaEQ2c3JP?=
 =?utf-8?B?WUFGQ0xJckJiTys5bGVnSUlGMERqNWplVFhxeFJ2SXl6RTVJL1B0bm4zSmlB?=
 =?utf-8?B?S05ZYlA0UEFhZW5qMU5iYW92QkxRY0ZaSXdianBKcjcxY0dWM2tMeEdQM05O?=
 =?utf-8?B?MkdMMTFBN2o4b1FmK2VzcjNWR09Iamo1TFIzTlVrRlZJUmc1N085dFh2VGpY?=
 =?utf-8?B?aXM5bllDUDZUbURZenlQZFJ5K3RiTTFMRHVoeS9kQThsakM2TmplR0FPbWtY?=
 =?utf-8?B?ME82TkJVOUVZSm5iZ2ZRYzRQanJHazNxbXVpQkgzZVFEamFhQU1UZVhUWFdC?=
 =?utf-8?B?Z3FHdlk0ZFlib1Nhdit1T2o4R0cxeGE3eDRlT0hyZGxRTzdmQW93OHpVdzR3?=
 =?utf-8?B?OUNweEFIUEN4ZHowaTZLbDRlbXhFNkFMSWpJSVRKWVdKelJuZXVwYk5aWWR1?=
 =?utf-8?B?WW94ZFkvSEk4dlRRRlhlSm1Qdm5yenlDRGZzdEx4Z01UV1JjUVdmWlNlSzBy?=
 =?utf-8?B?bkJaTCt2djJNekdxemQ4L1J2Q1VSQmdRWjJDbUNPWnZZTzRzSWcvb1c2aWRP?=
 =?utf-8?B?ZmRoclEwSDNWMjBNQVlFR1NzdFFCdTJMbmRUd1JKRUt4S2NWVUlndld6TUJy?=
 =?utf-8?B?RkgrSUdqd3cxVDY5NDhDR3VtTW5YM2JNUVRkMVhVTzlMS0RXcjc4bUxBK0F6?=
 =?utf-8?B?WEVOS2Y2U1pEZUVmNkdCY0JUNGE1aElFYzhTSXdHcktrak5Nd2lNdWV1UDEv?=
 =?utf-8?B?aDNZRVBHcFVDd051b0NrejJFOHcvbmdQRVowTGovV29VeHl3RkR4VUZkSmRU?=
 =?utf-8?B?amtSZmVreDF4MzlKTnhQOHg2MHZUZXk1Zjcxd1ZWbENZcUEvU2QvdkwyeDAw?=
 =?utf-8?B?bGxqQXFmVG1Da0xGS1VuZEtGQ1V3TDg2U3NvVUdnU2Y2ZDNjaS9SemdoenRQ?=
 =?utf-8?B?TDdCNy93YVkrbW1USzVLZlJEaWtkbjBRRkpHTm8rdTJzOGM0WnI4di9VMmox?=
 =?utf-8?B?bHBMVEV3OFBMdTFsWkNNcFlvYkpkYWRvK1oySWt4SE5RaU5JWE9MTlBkeFox?=
 =?utf-8?B?bjlmSHdtN0RUczhKbHpzQkI1cGs4cWtXd0EyeEszUElNZEZ6NS8xMTRHSWpT?=
 =?utf-8?B?clRWRDdrbUpnb3hkZElzc3NKWittSDl5a0xpSDVhWGswYUI0cDdNVTR6UlpE?=
 =?utf-8?B?dTh1aVV1VHp5eWtJWUJuRDRLQ2NVVFQ1MkRFbTg5UDF2bnBHaU1ndWdXVEVy?=
 =?utf-8?B?eHBLZlppdUFZdUhjbjlGS2Zjak5NUGJpU2YveDFNR3dnMEZqYWxVTVBBelZx?=
 =?utf-8?B?WEp0TXRoaGRVN0VudlRTK0xqVXRZWndEL0ozaDdaL0Q0ODhBNHBjb09UWG5r?=
 =?utf-8?B?RTRwSlM1dXZOekMzSlhoczhPMVMvNHFvMmIvTFdQY3k0QlNKU05rRytUMUQ0?=
 =?utf-8?B?VEoxNEJvTVZwbWo2N3BlQ1ZvOVgwYVdVb3p4bGRYMkhka2w2YVFabFRjWDVK?=
 =?utf-8?B?TlcxWHZva1VJSUR4ZjE5cDJNRzhlN1h1OEVtZm12QmR4aDFQNmJLU0hiT0F1?=
 =?utf-8?B?TnZRNUloMUpNU3dGV1JpNXRBOWVRd0ZabWlIbnJyYlc0UjF6d0ltSE1DUFJG?=
 =?utf-8?B?NHhNZmI1YlRhSHB5YS9aNFFBak4zQTlXcjl0T0kzWDVSZ2I0SGhOMndkZ1Zs?=
 =?utf-8?B?TEhzcC93TmpnTEd1MlMwN0ZiK1RkSVJweWNjYituOTB1SVFhZDByRThDMjZR?=
 =?utf-8?B?R1ZVdXRMMFM3VHI0cUVKeWN2Umt1Z1JoVWFXQmEzRHpzSUpIZTJ1KzNJTE5q?=
 =?utf-8?B?UzZFTnVYbnhJdnBkVHZmVStBL3lJT1A5M0Z1Um8yRjNhZEhtQmNWUlp2L0NH?=
 =?utf-8?B?ZVlNRkw2OG9aVUg5cWE2LzRCMm1uRnhzWEQ3QkIxNGRkNmhDRU5wb2lReEcw?=
 =?utf-8?B?NUI3NW03ZElIYXFJTGc4MXRZaU4wd1VmTDRzbForNmNIU3B0akdpV2tzbDdB?=
 =?utf-8?B?bHJHMnRnQldDbkQzVkorTUFDUFJyYmVTbEFKWFEyU096ZnFoSFh0SzlmY1d0?=
 =?utf-8?B?RXc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 208a51b1-74f8-44ff-b3aa-08da5eb46a56
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 18:30:20.1599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNmNN/4cBjmTgrShJVERjEBAV6dGfJOqDgN4QnMRWzGY7Qr1U8CfhRauLddSPzkMKP2LVZEmRAXLBmm8tSCBhjmTpjUGtnZcWYI1kIxwgGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB3327
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-05_15:2022-06-28,
 2022-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207050079
X-Proofpoint-GUID: 0Ayso6vSjYVlEczCV-uWKkzWnpA0jPDW
X-Proofpoint-ORIG-GUID: 0Ayso6vSjYVlEczCV-uWKkzWnpA0jPDW
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

On 6/17/2022 10:16 AM, John Snow wrote:
> On Wed, Jun 15, 2022, 11:27 AM Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>> wrote:
> 
>     Provide full_args() to return all command-line arguments used to start a
>     vm, some of which are not otherwise visible to QEMUMachine clients.  This
>     is needed by the cpr test, which must start a vm, then pass all qemu
>     command-line arguments to the cpr-exec monitor call.
> 
>     Provide reopen_qmp_connection() to reopen a closed monitor connection.
>     This is needed by cpr, because qemu-exec closes the monitor socket.
> 
>     Signed-off-by: Steve Sistare <steven.sistare@oracle.com <mailto:steven.sistare@oracle.com>>
>     ---
>      python/qemu/machine/machine.py | 14 ++++++++++++++
>      1 file changed, 14 insertions(+)
> 
>     diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
>     index 37191f4..60b934d 100644
>     --- a/python/qemu/machine/machine.py
>     +++ b/python/qemu/machine/machine.py
>     @@ -332,6 +332,11 @@ def args(self) -> List[str]:
>              """Returns the list of arguments given to the QEMU binary."""
>              return self._args
> 
>     +    @property
>     +    def full_args(self) -> List[str]:
>     +        """Returns the full list of arguments used to launch QEMU."""
>     +        return list(self._qemu_full_args)
>     +
> 
> 
> OK
> 
>          def _pre_launch(self) -> None:
>              if self._console_set:
>                  self._remove_files.append(self._console_address)
>     @@ -486,6 +491,15 @@ def _close_qmp_connection(self) -> None:
>              finally:
>                  self._qmp_connection = None
> 
>     +    def reopen_qmp_connection(self):
>     +        self._close_qmp_connection()
>     +        self._qmp_connection = QEMUMonitorProtocol(
>     +            self._monitor_address,
>     +            server=True,
>     +            nickname=self._name
>     +        )
>     +        self._qmp.accept(self._qmp_timer)
>     +
> 
> 
> Unrelated change, please split into a new commit. (Sorry.)
> 
> Seems harmless enough, though. Happy to give RB and AB to both if you split the commits.

Cool.  Will do, thanks.

- Steve

