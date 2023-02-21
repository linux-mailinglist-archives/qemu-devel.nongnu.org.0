Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0854E69E0CA
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 13:51:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUS5Q-0007zl-JI; Tue, 21 Feb 2023 07:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pUS5M-0007dq-QY
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:49:32 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pUS5J-00084i-IR
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:49:32 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31L3i9nc011840; Tue, 21 Feb 2023 12:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=/nn+3+XXtofxc65ZWC0h6rOHibOVPVVsvI5LvcolG8U=;
 b=MA2y1rcjTGEFBJoOYfy/4Bq8MnqYwkg1Z2K8Jc135P9z2oFM927Pxu9cFFSdW57ko8Ai
 ilmxkXhvMrdjs1NvEZfceN94aHVNRVl/fhC0XMOhvNhJzhS0kiGbAc4nyZAlWT14cApY
 3n6nmvfSYvVrcdSeLSVa9UWdeaYM3DCUG0PZOkJ+6d43YQVMvZjEAqpyxo0N/c/7TkV4
 QvceqAizdnMRNMwih+ki6zU1koCVPbMO+Tk+fjD8TLQ0CFvXVw0vhYNrHTra5UL3XSRo
 U9YofPVK+UVGfCgcMiPFIqaOyDSsQg7qjIvDg/lWw98Fq1Znvu8WC6ggY2MrXp2VjU4+ Bw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ntnkbn1g6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Feb 2023 12:49:24 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31LBKhd5012873; Tue, 21 Feb 2023 12:49:23 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1nam02lp2040.outbound.protection.outlook.com [104.47.57.40])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3ntn4cbgcd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Feb 2023 12:49:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iYCB7rQnxUFmKF5OVkCqZjs9vTlpnnuvnXn8r9M9vcmSo+ALTna+UbeILNNvbQtxs+/Iff9V/U5f2LOpJN1vFSsWCHz6Cv7WugkMKrLsXShHqzfRiDXsxStR1nNsQxa1xToJY7funhWps2S+/JUZCjnPG6h0XnpRAdt0z6+hcIxYxBtFjLvBZcO243Ydzy4019nRYnoT4RJ+DsrKMrzzAWfGCcj7Dw7rR07lCMx3BHGHcnPpReQbXBAxjGLrKn5k6BlJrKL0Gygxc/U69lZElbBr+NnNIKCB7AYWorrh7rBlR46z4+8cKcQEXX1prcwYl8mIH2cRFu4kkky1lEDINQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nn+3+XXtofxc65ZWC0h6rOHibOVPVVsvI5LvcolG8U=;
 b=mvgJKOJHzj+0udgklOUwT/JT70UPKBw3Cx4OoY+CKvkTnP9VJn6VkXpdpKiVoYugP09iMukR2F/cQJa1iLJd8sA4sHRpKjWjuRXk8IU8lqQhSXelS6WpngAIUcGJwBfuwyKZm7SW22GuxkgWjtfktto1aCBYkqZxjSwxWaFHRNUtpxpzOmZQ63vDdsm42TYw9wpifsEeAL+MkpPaunB+GkfS1KCG9hit6qGB+Q97AKHgzrmvvAFkz3QUCO7gKmx25/gC4iDvez4ckdsWAAeLpDMgD0ngpnEiv9IoYzWRnFdHWfWq3/AWz6GbVpkNHjtrcRkOaE/pt0qpi8Tit60/2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nn+3+XXtofxc65ZWC0h6rOHibOVPVVsvI5LvcolG8U=;
 b=b9b0hGXgEnrXjqhRc52TvcjGkwq8yMSKaqd2ulbon6Qz+RiKaWeMQe/Z17/vMOk+g7mEk514YLV6PGbMhX3p9cAxOvozulsjbylRbgK4ZyJSfioveF0iteBM+whZfhBdc4lJLCUjbpQQL1NMegbOx4ho6OWZDYTyb7/rzHG0w6E=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by PH0PR10MB4437.namprd10.prod.outlook.com (2603:10b6:510:3a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.18; Tue, 21 Feb
 2023 12:49:21 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c%9]) with mapi id 15.20.6134.017; Tue, 21 Feb 2023
 12:49:20 +0000
Message-ID: <b7ef43c7-ec3a-483c-cea8-176358578200@oracle.com>
Date: Tue, 21 Feb 2023 07:49:18 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH V2] meson: fix dependency on qemu-keymap
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>
References: <1675708442-74966-1-git-send-email-steven.sistare@oracle.com>
 <2bbc1ede-e2fa-d2f0-c77d-8c66d0130a5b@redhat.com>
Content-Language: en-US
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <2bbc1ede-e2fa-d2f0-c77d-8c66d0130a5b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR01CA0036.prod.exchangelabs.com (2603:10b6:208:10c::49)
 To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|PH0PR10MB4437:EE_
X-MS-Office365-Filtering-Correlation-Id: 02f0c57a-9594-45bf-f165-08db140a0d1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fclfsqDU4+Cr2T4bR9eQVwGWUg4vMCnv4i1x19UkfP+qc+mh9F1jwWAce4rrk0dQFkw1rnUzb/p+KboFwyGRPLhB2H/0yn9yaOX97Tyr7arK5pJ7fMUeAK3Ya4uGdRFndtGzkOImFJ7qIM8CGglOClN9gEHXeOoELzvDs1uh+qxWCaMAsvhKKqHQ6yMXaFmhcbcf4X4C1evWlTqOQxKsoH7DaJDcOYT/SdBilcSCiO0UA02r11tqFG3V3l5uIU+ZnnQ8sWrwUUbAMj4Di8CQ9HnxnMNjjR0rtmEp/SyWyEzutI3K7dbGhCex4ehXxFKTVO263BraeSHo1S5nZeCRapzF9Bg1nMwHPZeMZA0Z1Q7lSBLWj2VGwRlySf2zCQ4EhHZmkuw/8/ho6hv0vx3n3NLRhBg6jqkMAR9q6HS/HKvPW2oetsDahRDCg+EMrd/xXtuagCOY60Dcz+u4vUafyNVF1L9rqB9h36Vvg2GaxVJGi9atg7M9x6M2l0uaRdcWALuHpiHomtdbWfM626K0smiO83PJ2HiJ3lHL/mdByjiod8HQaVbKZBS+es3leAItZPBtMo+ANqCoPmo7sQJ0NTyh6pVxM8Puk6YwFCGNYy2eg7betknbBbDp3QmyWsBkdA0+K3g3wBPw0QZSHMQL55ZEYRmeMOW0cTqdCsTAFfJpsvwop2ZYLEZjtDtNcYsp0FgaElCT/sXnWJIb3TKdb9U4LNXYo/kcU+INYrTT5wA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199018)(31696002)(36756003)(2906002)(966005)(2616005)(4326008)(8676002)(66946007)(66556008)(66476007)(44832011)(5660300002)(6506007)(6512007)(8936002)(86362001)(31686004)(41300700001)(6486002)(53546011)(38100700002)(54906003)(26005)(316002)(186003)(36916002)(478600001)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0NnSHR5U1FZcnlkMStnUnNlUFg0VzdJU3EyY3lvMHhHWnRjN1J4aWJlU3B3?=
 =?utf-8?B?eHpQa0xPSGY5MDVEU0g1ZTh6N2JaNjdmN2tkQms2NWVETU4wd09hdGpWZDNk?=
 =?utf-8?B?UU4zTHpnRFFCcHNvK3hwMGVjOFBkM25RczNOVmUvK2JKblJKN0JNY0gvSjJZ?=
 =?utf-8?B?SlIzbERQTDVzMWFwZkdZWmJXL3VmZ2hWU29HTVBvY2tjS3lrTTNjZjFPUGhI?=
 =?utf-8?B?YkRZbzJSK2NQeENNOTNpRUdQSUluQVpXY1R6UnNyclBLbDFaQ2ZaWUxvbGZt?=
 =?utf-8?B?NHExR1kvWnJYZlQzRmQ0bE5hZnJGTCtnRDFaTmdMWGViVHIyaFVhREF0ZXZt?=
 =?utf-8?B?dmJmZFdVWStMR0loU3B3U05HRnRlOUdyUnFIdVVXZFlhUzVYNHBaTUdSQ2NS?=
 =?utf-8?B?TW14TWRKVlhSellXV0RqTFQyUHVCUCt2dnBGT0J4SzZXS00ya2NUK0prcFhr?=
 =?utf-8?B?RlNpdXp0Qk9RY0FHU0lkd2t6T1cvTlN3Vmc0aHd2Tk5CVjFvam9UcDRGYjRk?=
 =?utf-8?B?elExajF0b2gzaVI5YjlSa3F0VnVWeWE2MjFhTmVXM00zYTF3UE12ZTl4N2Zn?=
 =?utf-8?B?V0svSTdPR0hOaEVRaUd0RXAzVmRHaU9sUEx5ZEFWVGZoUXlZOFlpTVB6ODNn?=
 =?utf-8?B?cFZvNkk5bVA0SkpkOFNTUXV1czhraTZLSGtjc1RIbGl1TlhmalNTTGFvdCtt?=
 =?utf-8?B?a0gxTGNFNHN4OHlHUm9PRlhpVTFzTmIvYjZmRlpsVDhYSndaTVBkN2RMeUdw?=
 =?utf-8?B?QTN1WUcrTkZjTUZPZEdhbk1HU1ZoRlZLMDVBMkd4cmV6M0ppRHhIY0ZONEN4?=
 =?utf-8?B?NXJKRTJGejkyVnl5bnlkZXc4SThMZ1FaM3FCUzNjYlBwY2tsWFFBcndncEpW?=
 =?utf-8?B?VU5xQlZUa1RQcEplMlA2S1pzaDN4d1Z6ZWlHT1ZrdjVmMUxQWERVNnR2U2JK?=
 =?utf-8?B?WlF3VU5ReVhjYks5Vlp0dzVoUDNoTk81VVBsL29GeCtEajJHcFhoSE1GYVk1?=
 =?utf-8?B?T3NocGhBL0dzMGVWcUgzRFB4R1F4RFRjTXQxQ0tUckMwOWhUcWJGMnF5TVd2?=
 =?utf-8?B?RTRMaHViWFZYbkZzaWhCWFVId0l0NFFwVjlLMEtrV09FK0d1SlRhUnQ5TTNL?=
 =?utf-8?B?WUZFbzFoQXVTamlSaktoTUFwcEdTWTgzODhzQUhSRy9hSTkwdGFCQzY3cXNL?=
 =?utf-8?B?cTN4QWg3U1VJNE9LWUprYVRUelRWM0NTVHZWa1ZYU2pWNG5OZ2ZtcDh5WEdv?=
 =?utf-8?B?MjRCTnBxMUUrTEhycGRKTGJPb1R4RU05NFlRV3lGVVdjbFhkUUU1eXJSZE91?=
 =?utf-8?B?RzE2SXdzdXNqTXJ4V2tNdWpLczlJKzJiM2V5bTNEZDBDbk0yNGVRQTFuQ1k0?=
 =?utf-8?B?NUMwQVBRYjRQRExxY01UZ0ErUFVIV0xZbUhUZlRDMTQwZWZVRVNwOG1qeHJJ?=
 =?utf-8?B?cTY4ak9jbnh4RjJIVnZjY2VUNWxJN2ZhTzkzM0pLVm5LSFh2Nm4zV2hTSTR3?=
 =?utf-8?B?aWtCa1hDRnVSNUpHOEt0Qm5lMG9FK2JSdHQ0YUlJeWJxUDlaMGxhYkgyMUlS?=
 =?utf-8?B?YmpzYS9EQ3FVa25EblQ1U25JdWRUM2kxRzZUR1ZCSEJPNkZpRDZYWjV5WUh1?=
 =?utf-8?B?bEM4Q3QwMTA0VlFrYVFYcytvdjZxQkxHSmI5L1BjZVhTVXlOaHRJSDJWUys2?=
 =?utf-8?B?NjRHZFZ5VURPblFySC94a3BzSWRHaWl5Y2U3SUNERXFQc3NVanRsRnF2eURp?=
 =?utf-8?B?RVRTdHZyOHlEa2t3R3UrNVY1MGlmdVVycXNGWWcwWGRwL3NjVThYVmdldVBz?=
 =?utf-8?B?cjhjc1JwY1VLSlgxMzQ0QnkvL0wza3VjbFRPRkdRSHVRSWtKWTY3RnBxVFNM?=
 =?utf-8?B?Y2phRUtyTW5lZ2ZDbXBjOGVuZUJDNHl4Slh0UWtpSUFha1BOM3Y3K3RGSm5n?=
 =?utf-8?B?dTVtcFBJTDR5L1hSclJMemJsRDc1NWNDRzAvdGV2Y3VoUUpyT3g3Z0g5dVpR?=
 =?utf-8?B?MDRHcndxWjlUWHpXTDBOdng3UEt5SmNXTm9MT3FzcjlXOGFsMVNPTFJlQUlj?=
 =?utf-8?B?N3RoQlNzSWhNcFpPRmMzdUU1R1hjVUJyQkRnWTJrKzJFelVGVHNlZG5KdlhB?=
 =?utf-8?B?K1l6eWY1R3Y1eXVqeURpdHBwVGY0Y3lPa1hpd3dJaVNQTzlLVElQREJreFo1?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: lLS6S6F57Jh7ZbF+QIzHbed+PMh2yANFEhBFOT9vKXLCMGc7UIcDlwS7wEK93rHAlQ/YRRsmo7OBcArXUEQqvwe4JVVDYoUkS/tFvI+v4VW7K9ayRuznnZjmxNAWAiakV9877SQMVVIzmObUFwg4XV3EpsbAw3eUL95f9GG7Iq7hfYGAoEEadXQLNhlFfiSo1QiUG7wZCNfdoHkFCckm+btCf4NrK78Pjcil/5COeIMvT53vCyKhELo7gnZj2m3Awk7fQoS8sZ7seY4yQdItxstv8Gu6xYDy0Vd7zLEj/WsnoJKJhbR9TkkgTl2WKYTUg0v/y+3sb0SOWM0FnRHHspsfpvY5PYLxiSkp+okWc2DlWCmqVjAknQ/ynQrWaQyBf7Eou5WQoUF3d1SdldLVxqgM36ukblMzR16xG8t+QMSDFpHTeGrNlJT9/wQWV1mDQNgo/sRlV4v2fM1cbKT/lSLjS2TonwATeSHNdC4feFacwV76BOv5+fET1uMJ9vb5mZi4gNCLmVvwGAN7UIHO+GMdeQmebBMYhIdUMW0z8Dyj1C5r3FWOca1XWe4312CLRa5KqWujdFL5JzC3qbi1qOyG/M7Gd4fZuHMOsqjfYbpMcThwFBiU/7XwBEbtUq3cuUl0ImeFsariJsHn9ZldIWkuRYIMXueMUnX9XkNSsFixshivnQ34bOlCgt5pz3qQAjUhAVJUyPd7B/Ujsb+Jaywyd/3A7/yKI4mNSntliUfFht6dKkRdcmS4kPptTM1KRwZ71k6/JydobDWon0HFDRC9mJeaQjTpsVFCsx+byy5ElN6VrCt6yZrRb1tgPE/g
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02f0c57a-9594-45bf-f165-08db140a0d1b
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 12:49:20.7251 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7v50a1XsGP+awYQvTmBv5pw1pJYnUxofgU9/FAizwwBxuoOhIQmFmOTs+wlFJ+OdRwa9sv+OjNo4BXLo7U07gD4fyC0zfoqVeH8fOBBDKTA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4437
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-21_08,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302210109
X-Proofpoint-GUID: tnC-8wiG-gv8ewpLAfKnK4BfPKR2aUiC
X-Proofpoint-ORIG-GUID: tnC-8wiG-gv8ewpLAfKnK4BfPKR2aUiC
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 2/20/2023 1:35 PM, Thomas Huth wrote:
> On 06/02/2023 19.34, Steve Sistare wrote:
>> When qemu-keymap is not available on the host, and enable-xkbcommon
>> is specified, parallel make fails with:
>>
>>    % make clean
>>    ...
>>    % make -j 32
>>    ...
>>    FAILED: pc-bios/keymaps/is
>>    ./qemu-keymap -f pc-bios/keymaps/is -l is
>>    /bin/sh: ./qemu-keymap: No such file or directory
>>    ... many similar messages ...
>>
>> The code always runs find_program, rather than waiting to build
>> qemu-keymap, because it looks for CONFIG_XKBCOMMON in config_host
>> rather than config_host_data.  Making serially succeeds, by soft
>> linking files from pc-bios/keymaps, but that is not the desired
>> result for enable-xkbcommon.
>>
>> Examining all occurrences of 'in config_host' for similar bugs shows one
>> instance in the docs, which is also fixed here.
>>
>> Fixes: 4113f4cfee ("meson: move xkbcommon to meson")
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
> ...
>> diff --git a/pc-bios/keymaps/meson.build b/pc-bios/keymaps/meson.build
>> index 06c75e6..158a3b4 100644
>> --- a/pc-bios/keymaps/meson.build
>> +++ b/pc-bios/keymaps/meson.build
>> @@ -33,7 +33,7 @@ keymaps = {
>>     'tr': '-l tr',
>>   }
>>   -if meson.is_cross_build() or 'CONFIG_XKBCOMMON' not in config_host
>> +if meson.is_cross_build() or not xkbcommon.found()
>>     native_qemu_keymap = find_program('qemu-keymap', required: false, disabler: true)
>>   else
>>     native_qemu_keymap = qemu_keymap
> 
> Seems like this is breaking in the CI:
> 
>  https://gitlab.com/thuth/qemu/-/jobs/3802437551#L2356
> 
> Not sure why it's only happening now, and not before...
> maybe the build was picking up a locally instlled qemu-keymap before your change?

Probably so.  I see you have already submitted a fix, thanks.

- Steve


