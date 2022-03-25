Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A35FF4E7B21
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 00:18:22 +0100 (CET)
Received: from localhost ([::1]:45174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXtCH-000113-6q
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 19:18:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nXt9x-0008RC-Bk
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 19:15:59 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:55596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <si-wei.liu@oracle.com>)
 id 1nXt9r-0004HO-0j
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 19:15:55 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22PLh7Oa031405; 
 Fri, 25 Mar 2022 23:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=/o1Sqqh8ebRLOsfVWnFbOtHMdog6hDN75IU5ynuifBo=;
 b=clzm20Ap6cnKQkpE50HQrhU/PORualHG7cUVaocmR0a0eLYYVSiwrtDhJJf17Gkat50y
 veSx9ifMihPn2uG18CKF7PsyUjpa3KM72C4dyPoEZ3Ot0+cN7KO25oOvO4oF28K404QW
 kmt1ruoXv/WOufVu20Yfe1qKuOBzYK4sFUiQn4ju61dOOMpqPvY86SiXYfYssfTTTBmx
 WtGw9wk8JgEZc4S+Twr8KKR74Jl0o1Fv5Jz8YYCRxh8POWDfGzcZ6o0Ml8T/zlMrYjyi
 YVWtn4bR93LSnfbn5hmCOo63fVMWUcBcHAlUjhTnqukyUFywKxdX+2O6xwGcpDBBVEU6 dw== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ew7qtgp37-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 23:15:37 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 22PMu6aJ178989;
 Fri, 25 Mar 2022 23:15:36 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
 by userp3020.oracle.com with ESMTP id 3exawjjtn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 23:15:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ntdf1zLHn81R+XR10LvM68HIBQyZH03cSmz0u2A6LSx4rnLCjvkZsfO7bVpVH+Bg9VfrQQyAU3de2UDbR1GaRYXIvcXtTD6GTIyV/u5KmdAdgrAUbFqaeg8XX5cl+lip1zPRm5P40IbeK+3TM9aU07z8TtRWxxCYzywrILzfp3MeDaVuilIWFF4SJc+7roWLjALvgnNGU1GT0RgtUfSjZ/7nPHyNO3GmLj8REqN4RZKPecjmyq82TzaOMbOVUYQx2E+qCWWYSo2y4ivWJOisYxIRonFTwynEaeh0hOhGeeaMfNSBl4tz0MAWrsuTHfrBtsMVLgvG16EZtctZRsUGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/o1Sqqh8ebRLOsfVWnFbOtHMdog6hDN75IU5ynuifBo=;
 b=EtQu4etMFTTERGx7shPpQHkKg/IMYhDyCPB2sCs1vkStDHsJOfWVN+VKaPbb7AebP9WeS+mZKGLKPTHI8UOCzwufRp8/XUUcIp4ZV3VQbpkuaMOhCjzcY+f9kwRBna4advUuurO8b/tj20q7UI6t0FVsYSvaaIl2YP80eI1UXvSuQJL1Q7owgkpHU133GlB+DiXWFwcr4tXggkrZIcqLE4f1QUutScXeqgqATmBqNcogpqY2BkK2a+QSTWj2fZJ21BYZlHyXN/G1xBcl/a1VbmvhPAA/PR0IQCcXA+kc+ht8HyJJgsQ1vsBM1HJ5y/S4c51Bcj09LWXrqbCzJ7amZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/o1Sqqh8ebRLOsfVWnFbOtHMdog6hDN75IU5ynuifBo=;
 b=qNF32NBp4F+c3cRpE53m8n74110TfUTq31bI63cH7Q//cgOuR4uWK4URMBeMfHeGqc8iCO6IKZKY7h0aZyZdqUfR1pvwjfKlIbGYCW2qUH1ktaUcgLmJ3lNpPs1UseB5pr6bfvlqaebA77LD+OPVrMkkBc2zViJ29DTpUKSO0dw=
Received: from BYAPR10MB3287.namprd10.prod.outlook.com (2603:10b6:a03:15c::11)
 by BYAPR10MB2901.namprd10.prod.outlook.com (2603:10b6:a03:83::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Fri, 25 Mar
 2022 23:15:33 +0000
Received: from BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96]) by BYAPR10MB3287.namprd10.prod.outlook.com
 ([fe80::e478:4b5e:50a8:7f96%6]) with mapi id 15.20.5102.018; Fri, 25 Mar 2022
 23:15:33 +0000
Message-ID: <53dd4ba4-9c7e-cc0f-eaed-3c884dd1b144@oracle.com>
Date: Fri, 25 Mar 2022 16:15:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [RFC PATCH] vhost_net: should not use max_queue_pairs for non-mq
 guest
Content-Language: en-US
To: Jason Wang <jasowang@redhat.com>
References: <1647663216-11260-1-git-send-email-si-wei.liu@oracle.com>
 <CACGkMEucw7GASmZwYEwwTYtNw3Bup_0huaDtoV5_FdSfW_4Cuw@mail.gmail.com>
 <c3e931ee-1a1b-9c2f-2f59-cb4395c230f9@oracle.com>
 <CACGkMEuh8S3ShJZRtDkjvykHMNSi4A1pO0PRJPuEKJL=uAhX9Q@mail.gmail.com>
From: Si-Wei Liu <si-wei.liu@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CACGkMEuh8S3ShJZRtDkjvykHMNSi4A1pO0PRJPuEKJL=uAhX9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR17CA0056.namprd17.prod.outlook.com
 (2603:10b6:a03:167::33) To BYAPR10MB3287.namprd10.prod.outlook.com
 (2603:10b6:a03:15c::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7943a004-c599-4208-f287-08da0eb55cae
X-MS-TrafficTypeDiagnostic: BYAPR10MB2901:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB2901C91B440398CCBD90DCACB11A9@BYAPR10MB2901.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JLjsiyQO2RGiVTrni9+pqBbgR98VlgnafcMEgc/13oMsjFLnp0lFt4PNl10rzS+8jXYsi8gdiH898WSE1/T9bvIH8mLzP/gIluSDASk2ICmbOfCmVgzZAcbm+FwvTcZ1o2VRZ02Kg1CFbeOcZzAZLlHf7hJhUSCLUQkGeOdS1Q47fHPQgUvUN/J765glBVTxaIQJfSRqjAxjf3EmfzRtKYkhKBZGYpY1dqIj2aaK3If2bZbG78zuuP/CMio7vd6xzwNG8wxVYscmpeFZ6pupLUyOklg4kdgH/XD+nXwx9BCXUD916MfARreaf2VT7UPvahoa2oCjUj3igWsbh49Xc5LZrgvzdp9dUWuM2Die4pAwJpUCsmg164fH2fUNlxQcR9/9QafkE8LGjduWwUmHruvmdl2puPRjyUQzDhX2HJKIcul8vf8LwVVE4ABXG4aG5huWHK6yhHADsJ+TO3hD0wUIOydfR812BpV0gmGXNrozQrTF+I6hwT6vd/52USAdDK1HVFVzQv4nkvATNZOX5LFlsAiN+JM8svNxX2Zq8fG42pQHH6gCHR4aeeiQYtAe/Sxjo/xenWp9t72sqjaU9JLtejwNmkRFuXoTe9ZaQ7uFIXAM/VtGtKuxImniVmvS6cNthut0rYoSKb0z8mQc0DJcFxPD+LUwZDr2mXNd/XeomqXfxkSC/tfqab3bVF3V+Ze9He/NUSkGKJRB48Bk+C9wcDnJ5B1V3NsjZicEVZw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3287.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(36756003)(31686004)(6916009)(6486002)(83380400001)(186003)(26005)(54906003)(86362001)(8676002)(316002)(31696002)(2616005)(4326008)(6666004)(5660300002)(30864003)(8936002)(36916002)(53546011)(508600001)(6506007)(66476007)(66556008)(2906002)(66946007)(6512007)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWt6ejNybUJyR29naitXaE9UQTJ0bytZWlRGYmlTZEdrTEd3T3dMdEhjUklz?=
 =?utf-8?B?bXRHR1Z3VXZhVnN0c0o4bjJWNmlrMnZ3NnBDZXRySnExcUFTRUc1eGZ2NVgr?=
 =?utf-8?B?KzM0ZmNzWThuM2MyUms0eHF1aG9pdlNyRk5aQVdiL1BkL0xJenhXbldVRkZP?=
 =?utf-8?B?MDVPNnExVVF1WDN1V3RXZnVYdis2a3BheWNPMHgwQWx0TnN5U1Z2RVl0VDI5?=
 =?utf-8?B?Y01wK0lES2lNb1YxT2c2bktwc3kxc3lLYlkrNGdJMW1PMkphcERVLzlUcnZq?=
 =?utf-8?B?M2NOU0dTWGxodldqcFV4ZTVmK2dMcDJSZ0xINkVmQ09BK0NheTA2ODc5NE8v?=
 =?utf-8?B?bmhGMDdTTzRFbUx2NjNJZXp5WXhJUTdxa0VCTTVpcGQydmkzZjdiengzaW5i?=
 =?utf-8?B?RXFNOWNDZFRlbW45TWd6VDNMQTZ1VHBQTnF5WnpBOUJQN3JqUHBCOGIxUTlH?=
 =?utf-8?B?d2VNOThBRkJaeDNSZGlROGFGSzdYUFpwZTVkWG44VHk0SWZTZmt5aFBaU2Vp?=
 =?utf-8?B?ZHpaZ0pCcjdTVStmNGxaTURMM0JwSWpiRXZmYTV3YmNnTnNTZ3UwbHdhTHJL?=
 =?utf-8?B?eDJMYXZ6bmltY3lZVkRJY3pHR0cwaGVpLzl3OUFVY3FQSGl2NzdZTHR4bHZu?=
 =?utf-8?B?eis1d2VxWmIwS2lvS29HTXBUdjVoRTV2ZTNZOERKOWpPWmlCZ2FHUkozZ2FY?=
 =?utf-8?B?cklMSUkrWGVsL3lhUkdvR3MwRUF4cm55NFIxRDRZdlExYkpzd0xTRTFiYmJQ?=
 =?utf-8?B?bVV1VlNPcEdpSDlIYk1UMHIyZnh1WTE0WTQ5cUJMMVE2R0JVeVpqb3QvdG9p?=
 =?utf-8?B?azEzODZKeER0N0FWVndudTN2QUovMVNCZ3BmTVJXNnhrb2xyVTZZK2tJVEVE?=
 =?utf-8?B?bUpNdDlCL0FZMHQ4eU13bjZ0a0FMb1g1aG5peUs1SEM5QmQ0V3U3alhkc3lY?=
 =?utf-8?B?cUdKZjcrcDJWSktyMDljR3BxZldYQWFSS1FRWE0vdVp0YkZxblllc08zVXNq?=
 =?utf-8?B?NzZOWlJNVUNyeUtXakQvNDQ3by9wS3NKalR5Wkpya01YSW9sT09pWEYvUHg3?=
 =?utf-8?B?L1Rnd0JiTTJuSHNOVmRuVUFzZXBqem8vMHhNcWJuUVNSRi9NWlNnKzR3QnAx?=
 =?utf-8?B?MDJ6SzN5RHhsNjJWMWFLSDJWY0JwVEcxVzFUS1B5anZOTUNhemxQYTNOYWk3?=
 =?utf-8?B?eERjRWJpNCtKdE5YT2M5WndLN1NMWk5tcm9MOS8wMk1OQXdscWl3ditFN3BC?=
 =?utf-8?B?NWk1T284K0FMUVJsZFlSVG1aaXFqQUREVldEWmtSMmZMVjNxNDEzdEpqaUta?=
 =?utf-8?B?RVRHZE1ua2FTVUFqTU9xNWNmQm5HTWNISDlOdUhaVUE2cStrbjBtWFUrWXZs?=
 =?utf-8?B?M25pU2VDVVlhd29RYzB5YWJtamZSdHNWYzY4MlBTY1UxRzk5MTNsQlZTTUxk?=
 =?utf-8?B?STRjaUdVMVdkTW1EbkVQTkpMY2lJS2FDb0hMRC82NU13ZERnM1BVcURjTy81?=
 =?utf-8?B?cC91b3JXQnNXUkV4anNWaWtnSWozdXJGK2lKTXdrcHZ5Y3A2NlN2eS9RWnlj?=
 =?utf-8?B?QkVJMWRTV2JhY2xaZ05NdUhhd05kZTA2bUszTGs1SnptNVd0NG5lNitzV2Rr?=
 =?utf-8?B?c1k0SnFXVEczNmFXQ0hlak8wQmROb2JFNUl4US94bFlOWHVmdzFEWlhHUGRH?=
 =?utf-8?B?dUN4dXlTMUNnK29rTk1WVWRQWGoxaDRpT0dFQ2Jna1lXcXJBOEVZUHVvYkp2?=
 =?utf-8?B?QmdzbWkvQTZKTWRQMUpvdzdodDVvNnhuWEpSM1V3NlU2V2ZsdEcwOGVITVJJ?=
 =?utf-8?B?TGJCR3QxVE1VWnE1eEEwVWVwUUI3NEVKa1RRVjdzRkx5cjhrbjkrcW1qb2NC?=
 =?utf-8?B?WXZxVXEwdVdXL2g2R3FHN0VCaE9rNmFpV0pGdy9SM3BKNkRaLzlycTNrQisy?=
 =?utf-8?B?WHBKWmV1U01nd0ZudC9rYjhaOGxvanJaY1dQUTYrd1lHR09oNUdsU1I2eEdN?=
 =?utf-8?B?alVMRWZndFVWM1JaTU5MMFNDU0tjY003QWVlejJxR2FqcXVUVHVQNlNvcGZ3?=
 =?utf-8?B?ZVpNOEJPdFhqdU5zZjVYTFZWU0ZHaXdWVFlhcEtuVnpENTNwbUdkUXM2N2pT?=
 =?utf-8?B?MWliQTRzVzNYcnRtZnl1b0tVamtzeGxaSThxUXRVNnAvM0R2NW93N3FDRXIz?=
 =?utf-8?B?cXpIdE9hczk4Njd2WVg0aWpZMVFJWVRmcnFUcFdaSVBYTTFCeEtrUUFrNmN4?=
 =?utf-8?B?bEtld3YzWTA0aURndnVhcjQ2YmMramN5dUVDQmhwbG1iMXh2UFJHc0wyTWRy?=
 =?utf-8?B?dkNGc0JMUXgzN2txWVlBWE1GTUY5aDJMZElrRXAreUM3NjAvK3Yvdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7943a004-c599-4208-f287-08da0eb55cae
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3287.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 23:15:33.5528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/CY6bctdCipL/7Et+UPExpJ0P/nxXL5/9KHjCNf6Jx/mfTF4WGk0rOZuDk9G34QzDa97FUe6Ltn0bLmJAhjgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2901
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10297
 signatures=694973
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250127
X-Proofpoint-GUID: T6-ySvtzLEYQhdvvCjlj4JRQ0H6Mmwuu
X-Proofpoint-ORIG-GUID: T6-ySvtzLEYQhdvvCjlj4JRQ0H6Mmwuu
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=si-wei.liu@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: eperezma <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/25/2022 12:59 AM, Jason Wang wrote:
> On Fri, Mar 25, 2022 at 3:02 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>
>>
>> On 3/21/2022 8:47 PM, Jason Wang wrote:
>>> On Sat, Mar 19, 2022 at 12:14 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>>>> With MQ enabled vdpa device and non-MQ supporting guest e.g.
>>>> booting vdpa with mq=on over OVMF of single vqp, it's easy
>>>> to hit assert failure as the following:
>>>>
>>>> ../hw/virtio/vhost-vdpa.c:560: vhost_vdpa_get_vq_index: Assertion `idx >= dev->vq_index && idx < dev->vq_index + dev->nvqs' failed.
>>>>
>>>> 0  0x00007f8ce3ff3387 in raise () at /lib64/libc.so.6
>>>> 1  0x00007f8ce3ff4a78 in abort () at /lib64/libc.so.6
>>>> 2  0x00007f8ce3fec1a6 in __assert_fail_base () at /lib64/libc.so.6
>>>> 3  0x00007f8ce3fec252 in  () at /lib64/libc.so.6
>>>> 4  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:563
>>>> 5  0x0000558f52d79421 in vhost_vdpa_get_vq_index (dev=<optimized out>, idx=<optimized out>) at ../hw/virtio/vhost-vdpa.c:558
>>>> 6  0x0000558f52d7329a in vhost_virtqueue_mask (hdev=0x558f55c01800, vdev=0x558f568f91f0, n=2, mask=<optimized out>) at ../hw/virtio/vhost.c:1557
>>>> 7  0x0000558f52c6b89a in virtio_pci_set_guest_notifier (d=d@entry=0x558f568f0f60, n=n@entry=2, assign=assign@entry=true, with_irqfd=with_irqfd@entry=false)
>>>>      at ../hw/virtio/virtio-pci.c:974
>>>> 8  0x0000558f52c6c0d8 in virtio_pci_set_guest_notifiers (d=0x558f568f0f60, nvqs=3, assign=true) at ../hw/virtio/virtio-pci.c:1019
>>>> 9  0x0000558f52bf091d in vhost_net_start (dev=dev@entry=0x558f568f91f0, ncs=0x558f56937cd0, data_queue_pairs=data_queue_pairs@entry=1, cvq=cvq@entry=1)
>>>>      at ../hw/net/vhost_net.c:361
>>>> 10 0x0000558f52d4e5e7 in virtio_net_set_status (status=<optimized out>, n=0x558f568f91f0) at ../hw/net/virtio-net.c:289
>>>> 11 0x0000558f52d4e5e7 in virtio_net_set_status (vdev=0x558f568f91f0, status=15 '\017') at ../hw/net/virtio-net.c:370
>>>> 12 0x0000558f52d6c4b2 in virtio_set_status (vdev=vdev@entry=0x558f568f91f0, val=val@entry=15 '\017') at ../hw/virtio/virtio.c:1945
>>>> 13 0x0000558f52c69eff in virtio_pci_common_write (opaque=0x558f568f0f60, addr=<optimized out>, val=<optimized out>, size=<optimized out>) at ../hw/virtio/virtio-pci.c:1292
>>>> 14 0x0000558f52d15d6e in memory_region_write_accessor (mr=0x558f568f19d0, addr=20, value=<optimized out>, size=1, shift=<optimized out>, mask=<optimized out>, attrs=...)
>>>>      at ../softmmu/memory.c:492
>>>> 15 0x0000558f52d127de in access_with_adjusted_size (addr=addr@entry=20, value=value@entry=0x7f8cdbffe748, size=size@entry=1, access_size_min=<optimized out>, access_size_max=<optimized out>, access_fn=0x558f52d15cf0 <memory_region_write_accessor>, mr=0x558f568f19d0, attrs=...) at ../softmmu/memory.c:554
>>>> 16 0x0000558f52d157ef in memory_region_dispatch_write (mr=mr@entry=0x558f568f19d0, addr=20, data=<optimized out>, op=<optimized out>, attrs=attrs@entry=...)
>>>>      at ../softmmu/memory.c:1504
>>>> 17 0x0000558f52d078e7 in flatview_write_continue (fv=fv@entry=0x7f8accbc3b90, addr=addr@entry=103079215124, attrs=..., ptr=ptr@entry=0x7f8ce6300028, len=len@entry=1, addr1=<optimized out>, l=<optimized out>, mr=0x558f568f19d0) at /home/opc/qemu-upstream/include/qemu/host-utils.h:165
>>>> 18 0x0000558f52d07b06 in flatview_write (fv=0x7f8accbc3b90, addr=103079215124, attrs=..., buf=0x7f8ce6300028, len=1) at ../softmmu/physmem.c:2822
>>>> 19 0x0000558f52d0b36b in address_space_write (as=<optimized out>, addr=<optimized out>, attrs=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>)
>>>>      at ../softmmu/physmem.c:2914
>>>> 20 0x0000558f52d0b3da in address_space_rw (as=<optimized out>, addr=<optimized out>, attrs=...,
>>>>      attrs@entry=..., buf=buf@entry=0x7f8ce6300028, len=<optimized out>, is_write=<optimized out>) at ../softmmu/physmem.c:2924
>>>> 21 0x0000558f52dced09 in kvm_cpu_exec (cpu=cpu@entry=0x558f55c2da60) at ../accel/kvm/kvm-all.c:2903
>>>> 22 0x0000558f52dcfabd in kvm_vcpu_thread_fn (arg=arg@entry=0x558f55c2da60) at ../accel/kvm/kvm-accel-ops.c:49
>>>> 23 0x0000558f52f9f04a in qemu_thread_start (args=<optimized out>) at ../util/qemu-thread-posix.c:556
>>>> 24 0x00007f8ce4392ea5 in start_thread () at /lib64/libpthread.so.0
>>>> 25 0x00007f8ce40bb9fd in clone () at /lib64/libc.so.6
>>>>
>>>> The cause for the assert failure is due to that the vhost_dev index
>>>> for the ctrl vq was not aligned with actual one in use by the guest.
>>>> Upon multiqueue feature negotiation in virtio_net_set_multiqueue(),
>>>> if guest doesn't support multiqueue, the guest vq layout would shrink
>>>> to single queue pair of 3 vqs in total (rx, tx and ctrl). This results
>>>> in ctrl_vq taking a different vhost_dev group index than the default
>>>> n->max_queue_pairs, the latter of which is only valid for multiqueue
>>>> guest. While on those additional vqs not exposed to the guest,
>>>> vhost_net_set_vq_index() never populated vq_index properly, hence
>>>> getting the assert failure.
>>>>
>>>> A possible fix is to pick the correct vhost_dev group for the control
>>>> vq according to this table [*]:
>>>>
>>>> vdpa tool / QEMU arg / guest config    / ctrl_vq group index
>>>> ----------------------------------------------------------------
>>>> max_vqp 8 / mq=on    / mq=off  (UEFI) => data_queue_pairs
>>>> max_vqp 8 / mq=on    / mq=on  (Linux) => n->max_queue_pairs(>1)
>>>> max_vqp 8 / mq=off   / mq=on  (Linux) => n->max_queue_pairs(=1)
>>>>
>>>> [*] Please see FIXME in the code for open question and discussion
>>>>
>>>> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>
>>>> ---
>>>>    hw/net/vhost_net.c     | 13 +++++++++----
>>>>    hw/virtio/vhost-vdpa.c | 25 ++++++++++++++++++++++++-
>>>>    2 files changed, 33 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
>>>> index 30379d2..9a4479b 100644
>>>> --- a/hw/net/vhost_net.c
>>>> +++ b/hw/net/vhost_net.c
>>>> @@ -322,6 +322,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>>>>        BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(dev)));
>>>>        VirtioBusState *vbus = VIRTIO_BUS(qbus);
>>>>        VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
>>>> +    bool mq = virtio_host_has_feature(dev, VIRTIO_NET_F_MQ);
>>>>        int total_notifiers = data_queue_pairs * 2 + cvq;
>>>>        VirtIONet *n = VIRTIO_NET(dev);
>>>>        int nvhosts = data_queue_pairs + cvq;
>>>> @@ -343,7 +344,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>>>>            if (i < data_queue_pairs) {
>>>>                peer = qemu_get_peer(ncs, i);
>>>>            } else { /* Control Virtqueue */
>>>> -            peer = qemu_get_peer(ncs, n->max_queue_pairs);
>>>> +            peer = qemu_get_peer(ncs, mq ? data_queue_pairs : n->max_queue_pairs);
>>>>            }
>>>>
>>>>            net = get_vhost_net(peer);
>>>> @@ -368,7 +369,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>>>>            if (i < data_queue_pairs) {
>>>>                peer = qemu_get_peer(ncs, i);
>>>>            } else {
>>>> -            peer = qemu_get_peer(ncs, n->max_queue_pairs);
>>>> +            peer = qemu_get_peer(ncs, mq ? data_queue_pairs : n->max_queue_pairs);
>>>>            }
>>>>            r = vhost_net_start_one(get_vhost_net(peer), dev);
>>>>
>>>> @@ -390,7 +391,10 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
>>>>
>>>>    err_start:
>>>>        while (--i >= 0) {
>>>> -        peer = qemu_get_peer(ncs , i);
>>>> +        if (mq)
>>>> +            peer = qemu_get_peer(ncs, i < data_queue_pairs ? i : data_queue_pairs);
>>>> +        else
>>>> +            peer = qemu_get_peer(ncs, i < data_queue_pairs ? i : n->max_queue_pairs);
>>>>            vhost_net_stop_one(get_vhost_net(peer), dev);
>>>>        }
>>>>        e = k->set_guest_notifiers(qbus->parent, total_notifiers, false);
>>>> @@ -409,6 +413,7 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>>>>        VirtioBusState *vbus = VIRTIO_BUS(qbus);
>>>>        VirtioBusClass *k = VIRTIO_BUS_GET_CLASS(vbus);
>>>>        VirtIONet *n = VIRTIO_NET(dev);
>>>> +    bool mq = virtio_host_has_feature(dev, VIRTIO_NET_F_MQ);
>>>>        NetClientState *peer;
>>>>        int total_notifiers = data_queue_pairs * 2 + cvq;
>>>>        int nvhosts = data_queue_pairs + cvq;
>>>> @@ -418,7 +423,7 @@ void vhost_net_stop(VirtIODevice *dev, NetClientState *ncs,
>>>>            if (i < data_queue_pairs) {
>>>>                peer = qemu_get_peer(ncs, i);
>>>>            } else {
>>>> -            peer = qemu_get_peer(ncs, n->max_queue_pairs);
>>>> +            peer = qemu_get_peer(ncs, mq ? data_queue_pairs : n->max_queue_pairs);
>>>>            }
>>>>            vhost_net_stop_one(get_vhost_net(peer), dev);
>>>>        }
>>>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
>>>> index 27ea706..623476e 100644
>>>> --- a/hw/virtio/vhost-vdpa.c
>>>> +++ b/hw/virtio/vhost-vdpa.c
>>>> @@ -1097,7 +1097,30 @@ static int vhost_vdpa_dev_start(struct vhost_dev *dev, bool started)
>>>>            vhost_vdpa_host_notifiers_uninit(dev, dev->nvqs);
>>>>        }
>>>>
>>>> -    if (dev->vq_index + dev->nvqs != dev->vq_index_end) {
>>>> +    /* FIXME the vhost_dev group for the control vq may have bogus nvqs=2
>>>> +     * value rather than nvqs=1. This can happen in case the guest doesn't
>>>> +     * support multiqueue, as a result of virtio_net_change_num_queue_pairs()
>>>> +     * destroying and rebuilding all the vqs, the guest index for control vq
>>>> +     * will no longer align with the host's. Currently net_init_vhost_vdpa()
>>>> +     * only initializes all vhost_dev's and net_clients once during
>>>> +     * net_client_init1() time, way earlier before multiqueue feature
>>>> +     * negotiation can kick in.
>>> See below, it looks like the code doesn't find the correct vhost_dev.
>>>
>>>> +     *
>>>> +     * Discussion - some possible fixes so far I can think of:
>>>> +     *
>>>> +     * option 1: fix vhost_net->dev.nvqs and nc->is_datapath in place for
>>>> +     * vdpa's ctrl vq, or rebuild all vdpa's vhost_dev groups and the
>>>> +     * net_client array, in the virtio_net_set_multiqueue() path;
>>>> +     *
>>>> +     * option 2: fix vhost_dev->nvqs in place at vhost_vdpa_set_features()
>>>> +     * before coming down to vhost_vdpa_dev_start() (Q: nc->is_datapath
>>>> +     * seems only used in virtio_net_device_realize, is it relevant?);
>>> Relevant but not directly related, for the vhost_dev where
>>> nc->is_datapath is false, it will assume it is backed by a single
>>> queue not a queue pair.
>>>
>>>> +     *
>>>> +     * option 3: use host queue index all along in vhost-vdpa ioctls instead
>>>> +     * of using guest vq index, so that vhost_net_start/stop() can remain
>>>> +     * as-is today
>>>> +     */
>>> Note that the vq_index of each vhost_dev is assigned during
>>> vhost_net_start() according to whether or not the MQ or CVQ is
>>> negotiated in vhost_net_start()
>>>
>>>       for (i = 0; i < nvhosts; i++) {
>>>
>>>           if (i < data_queue_pairs) {
>>>               peer = qemu_get_peer(ncs, i);
>>>           } else { /* Control Virtqueue */
>>>               peer = qemu_get_peer(ncs, n->max_queue_pairs);
>>>           }
>>>
>>>           net = get_vhost_net(peer);
>>>           vhost_net_set_vq_index(net, i * 2, index_end);
>>>
>>> It means some of the peers won't be used when MQ is not negotiated. So
>>> it looks to me the evil came from virtio_net_get_notifier_mask().
>> Yes, there it is. Where the control virtqueue first ever needs a
>> guest_notifier for vhost_dev.
>>> Where it doesn't mask the correct vhost dev when the guest doesn't
>>> support MQ but the host does. So we had option 4:
>>>
>>> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
>>> index 2087516253..5e9ac019cd 100644
>>> --- a/hw/net/virtio-net.c
>>> +++ b/hw/net/virtio-net.c
>>> @@ -3179,7 +3179,13 @@ static void
>>> virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
>>>                                               bool mask)
>>>    {
>>>        VirtIONet *n = VIRTIO_NET(vdev);
>>> -    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
>>> +    NetClientState *nc;
>>> +
>>> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
>> Hmmm, I thought it would be more natural to align the layout of
>> vhost_dev's with that of virtqueue's, not the other way around.
> The problem is that we need to make sure it works for vhost_net as
> well where it doesn't support cvq.
>
>> Not sure
>> how this vhost_dev selection scheme may work with additional queues
>> discovered through transport specific mechanism, such as the admin
>> virtqueue, but I can live with it for now:
>>
>> --- a/hw/net/virtio-net.c
>> +++ b/hw/net/virtio-net.c
>> @@ -244,7 +244,8 @@ static void virtio_net_vhost_status(VirtIONet *n,
>> uint8_t status)
>>        VirtIODevice *vdev = VIRTIO_DEVICE(n);
>>        NetClientState *nc = qemu_get_queue(n->nic);
>>        int queue_pairs = n->multiqueue ? n->max_queue_pairs : 1;
>> -    int cvq = n->max_ncs - n->max_queue_pairs;
>> +    int cvq = virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ) ?
>> +              n->max_ncs - n->max_queue_pairs : 0;
> Any reason for this line?
This corresponds to the following asserts:

assert(virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ));

If the QEMU or guest doesn't support control vq, there's no need to 
bother exposing vhost_dev and guest notifier for the control vq. Noted 
the vhost_net_start/stop implies DRIVER_OK is set in device status, 
meaning feature negotiation is complete already (same as n->multiqueue).
>
> Btw, would you mind to post a formal patch for this?
I would love to, there was a set of mq bug fixes sitting in my queue 
pending on paper work, but I had been dragged to other stuff earlier 
this week. I will try to post it early next week.

-Siwei

>
> Thanks
>
>>        if (!get_vhost_net(nc->peer)) {
>>            return;
>> @@ -3161,8 +3162,14 @@ static NetClientInfo net_virtio_info = {
>>    static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
>>    {
>>        VirtIONet *n = VIRTIO_NET(vdev);
>> -    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
>> +    NetClientState *nc;
>>        assert(n->vhost_started);
>> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
>> +        assert(virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ));
>> +        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
>> +    } else {
>> +        nc = qemu_get_subqueue(n->nic, vq2q(idx));
>> +    }
>>        return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
>>    }
>>
>> @@ -3170,8 +3177,14 @@ static void
>> virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
>>                                               bool mask)
>>    {
>>        VirtIONet *n = VIRTIO_NET(vdev);
>> -    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(idx));
>> +    NetClientState *nc;
>>        assert(n->vhost_started);
>> +    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ) && idx == 2) {
>> +        assert(virtio_vdev_has_feature(vdev, VIRTIO_NET_F_CTRL_VQ));
>> +        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
>> +    } else {
>> +        nc = qemu_get_subqueue(n->nic, vq2q(idx));
>> +    }
>>        vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
>>                                 vdev, idx, mask);
>>    }
>>
>>
>> Thanks,
>> -Siwei
>>
>>> +        nc = qemu_get_subqueue(n->nic, n->max_queue_pairs);
>>> +    } else {
>>> +        nc = qemu_get_subqueue(n->nic, vq2q(idx));
>>> +    }
>>>        assert(n->vhost_started);
>>>        vhost_net_virtqueue_mask(get_vhost_net(nc->peer),
>>>                                 vdev, idx, mask);
>>>
>>> Thanks
>>>
>>>> +    if (dev->vq_index + dev->nvqs < dev->vq_index_end) {
>>>>            return 0;
>>>>        }
>>>>
>>>> --
>>>> 1.8.3.1
>>>>


