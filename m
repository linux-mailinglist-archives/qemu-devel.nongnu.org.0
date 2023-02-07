Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 066AB68E307
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 22:33:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPVa0-0001Q6-Dn; Tue, 07 Feb 2023 16:32:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPVZy-0001Ph-AH
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:32:42 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1pPVZw-0005r1-MH
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 16:32:42 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 317KSfxJ021539; Tue, 7 Feb 2023 21:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=Y7U4vkqoSgt1QhvaXyNgWrAyJQJe1W0d5uKqK4AJ8IQ=;
 b=gyV57vuriUcvfZnm95qMVKYI6SZUFrxCZpXkXM6DGJQA1vZ2WwaB7NlTg78kIpZDbFDL
 IyNp0PEOhjfqhLu0vaRs8vF1pzv9isl4WwHsbAcGbqEYGCRfU1x1fN97xSkrb10oaYS6
 aSeLGDs8NAQKmyBuFXMCREPMyoRErqJSRq4U/+81f//NhQK9zoD1wd0uQNN7dG3f2qGV
 BsZqYJAeYPDmokmLYLA3AYNJmN7x4KhHCp0T76ZqiUtygN8mD4l8xMxerNCtFWrSdfaM
 gcsW86u5Qdvlm+3HRAvu0gJcVlyTNGfpnqdYTZ8WeWKnEm2YiM1ekwMYZPJ5WjmFy650 Sg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nhfdcesx3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 21:32:39 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 317LFxLQ025735; Tue, 7 Feb 2023 21:32:38 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2049.outbound.protection.outlook.com [104.47.74.49])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3nhdt69hwp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Feb 2023 21:32:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GkU29lAPNIsMqoktrcvjJqx4jcx9nGbwrWa+6Jhdyr9hYSNvNb0P41GhqaOM6jeSBeeiHvIirWv3+eQuXBfAIzE2EPbGR/wsK0MqYBMLOZl/gTV14+igIzwf4hKm9+bm6UY3F60J03uge18bh73+V+ef/UUdLs7Oc2Wbd8LkublgyS2DgrbbW7QPFsox58CDx1Fh8Du/PgiEeBnS/uiGifDxAdYV3vC/qMjWIRRWnmjClch/zvoZqjXOsqJp74AshDBtdPTUrxvOKYOAspz3upKAz4S3oVEu7Gv/Wawvny9tissIl0m6jpYQuriqTZc9nm4+epvEza5+/lrSI6N/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7U4vkqoSgt1QhvaXyNgWrAyJQJe1W0d5uKqK4AJ8IQ=;
 b=QhzI/vBH86iRa2GIlQZG8VmvqnrkndjiS9afFz8M9GUuT8xSV5qK0OBVk/6TvpOystg3/rTV4eGDJA8/akabsEz32rjpijSPr7nEmLF6wSJOk7FtGavFeXiZ5hQzpAQWU1BIE7c6paTPSezFHn2ZeABzK9D9QZpRe6yVoEiwcBW7m1XvBrxqpIya3Qik8f+n5g/L3KSXXsj1mkiZB6qYM43iDtYvrlQZCp1tXUfRXzKVfEixpIhgw6RZYX4kW5T2TThLpH9GxjH4vzFIWzlzn/mc080mFT8Zh5vm8egPfsIvgvOHU0F3SzwZDIqFRAEdky4m7N6Jx647GrBqeMbqNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y7U4vkqoSgt1QhvaXyNgWrAyJQJe1W0d5uKqK4AJ8IQ=;
 b=pigBp66s9rmhjQUOpnPCvhqkwCdYwfznkiLSg5Sjgb5sR1c3YfO5t4nq51YOtdGwX2JGsda104CnfJbuoPygVB30qQutTBq1PfsczFl+8Pnvzc5N4DTtpVlv3XrcrE7lRkbsq/1mpDUD0lvYr4hvk/KEvvDj+Nm2DcX0v7tblyo=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by PH7PR10MB6652.namprd10.prod.outlook.com (2603:10b6:510:20b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.15; Tue, 7 Feb
 2023 21:32:35 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::ed27:2f6f:22b1:39c%9]) with mapi id 15.20.6086.016; Tue, 7 Feb 2023
 21:32:35 +0000
Message-ID: <bb765372-673f-d848-6d99-ed4e4b3c2812@oracle.com>
Date: Tue, 7 Feb 2023 16:32:32 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH V2] python/machine: QEMUMachine reopen_qmp_connection
Content-Language: en-US
To: John Snow <jsnow@redhat.com>
Cc: qemu-devel@nongnu.org
References: <1675796605-235646-1-git-send-email-steven.sistare@oracle.com>
 <CAFn=p-ZCA42VAMEkg8xQeTQBTMqn1AA7RjptkWD72uwBX+iKPA@mail.gmail.com>
 <020941fe-f01f-ed97-6fd1-9ad217c698eb@oracle.com>
 <CAFn=p-YMhJVfjUSUHiEhomkKBKM6LfLB=TXn+ii7n=cWwvyAKg@mail.gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <CAFn=p-YMhJVfjUSUHiEhomkKBKM6LfLB=TXn+ii7n=cWwvyAKg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0235.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::30) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|PH7PR10MB6652:EE_
X-MS-Office365-Filtering-Correlation-Id: a3e39885-75c3-4c46-6090-08db0952d412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +bGDp1HZxN3nlC/WOrJw98K1xPqeXk+lOfwoQRUrJ2QI9++V2iKGXkCubsZbbuMMkJELhBaRHe4T95HQJ0wfjrDQ53xZz+WzT7wcgb3+drfsiuM3Mo3+U+jZD7vnSulO+qreK4Fm2x4DvEf3j7E/hmxm9fp4SJi2DMdApFYEWSejwELRsWuxETtCYbg6+dNfwHLPi/SGlbRviQAGxfefozqgVMVCgtUZoMDli+ZTXU7vR/V34Aj97v1v+YV/SL2nQiv9CHwh5yQqH6BJ/wkM/c/yWBQtL3bjzh45HWjrAS7SigBaV5JUlU68ESSlWkautvC6e9gEbZ1ysoOwuXXrjSu7wJ3ZVMOtNDZ+xHMssshKC6STGD89MoIeKdM2UH5BmEwOgoQAG9GIUWMaqofgiHv+MbcrkM6KjxHm0v9S9wROBmQlXXojKbr1BrTaGNYw4QTbSe4JgKNNIOuZEsrbGmR8LsE6Z/3Dl6hI+3zM1d0ge17zF+GwOj+NG97UJKOtFf3WqedvR7a2fh0Pp6cKi5S5ehIydrrPqWAstEcV7K2iRHYTAoZB+9w9nCswe/3SiUg1d/98/P7Lw1U1Ltw01c+I77qlgfN0QSxIZmF84N3Ov+It/HQ/5r+pWy3dsuy/hFsJaXrBHaXBFgz163KtqGPETba7aJI8WayMkF3kGBpLY5pTJKmF9zMqvdfrfbcS7hnGPaIZN9rjDMToezmmPn4Sfuh3f8j+U0Vz+gMkJEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(376002)(39860400002)(366004)(396003)(451199018)(31686004)(5660300002)(66476007)(66556008)(316002)(6916009)(8676002)(66946007)(4326008)(41300700001)(8936002)(86362001)(38100700002)(31696002)(36756003)(53546011)(36916002)(6506007)(186003)(6666004)(6512007)(26005)(44832011)(2906002)(6486002)(478600001)(2616005)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDRBR2Q3QVFrbkRVV3o1dUx2MEh2dHgzKzhxdEFBdHhyVXp5QzNBcXJYbmhk?=
 =?utf-8?B?SHhKbG1zZVU4N2ZXVU93SjJFM21FcXl5Snk0VWM2bitxMzhleFFJdFBaUlZG?=
 =?utf-8?B?Qjl0QWRYZzFHcmg1ZlcxYkU3QkZKUjVCQ2VlQURGVUoyZHhEYXk5WnIveDdx?=
 =?utf-8?B?ODVUMU9uUnR0enFHL2NoelROd1orY0hoc1paR2VHV01IOGljN1pmZFIzaDFm?=
 =?utf-8?B?RGNXclBjeGoyOCt4d1VRUHQ5UFFSWjllYkZSVTd0cEZrSEZnVU03M25pS0xO?=
 =?utf-8?B?MW9IYXp2ZG9sV0RjMnhaeXIyWWplaDNvUXMxdWlEMStJSkVBTDhDNmFzOCt2?=
 =?utf-8?B?NVYrY3pmSGZKWnJrT2xtTFVOeVdRakx5U01pUDVJT2VUTHBLQlJxZmc5Q3hQ?=
 =?utf-8?B?UGErRzZKNkRGdXNmQlo4YktiL3VQaFVwZ1lVaCsxdS9jQ3MzWkUzMkpPRjdW?=
 =?utf-8?B?aytCSjRiNmJCUm50QllaRnNZcWpTOWdhejNyZFk2NjArLzhRcmVQOVlCaUcx?=
 =?utf-8?B?OGloWHFrNklONzFkOGszb0I1QzRhUGRlUTZ1YlVKTHBLM3k3cXNRN0VoTzF5?=
 =?utf-8?B?Q2NHSFk1bFo0NGQrT1ZyYmZVUHRieW53Mm44dStJOUdlVzc0UDRMYjJYdmVZ?=
 =?utf-8?B?eGJyN244c1pGRllFZTRnNE10VHZpaUg0cHFLd0hSdU9wajUvNi9SK2E2aXBL?=
 =?utf-8?B?Vi9oamVpRENBMFRWVHFqQjRaVko0KzRRcFRwdVlEYlN3aElHbTByV1lGU3h6?=
 =?utf-8?B?UTRMWkFidlhKY2pNYThqczE1TWo1N3F5MVpDZ1E3SVFkdHFibndnQTFubnJ1?=
 =?utf-8?B?czZVcHVGRVJHUFN0MFNBT1YzUXBkVUkxa0UzQ0ptUzM3WmE2RjJ2R081TVVn?=
 =?utf-8?B?VlczK016T253MjhiYmQvSjdNblh3dlBLTjRIMm1aTC9XSlk3OEg3eDE5OThB?=
 =?utf-8?B?eVZkNENWL1EzMUVIQ3dsZFJGN2NiRTlCeTIzNnhEY3F4Zk5DeDM3Smg1L1hv?=
 =?utf-8?B?bVplM1VDRkd1djA3UmVVL1FxMk05aU5MOTJ3RGlEWHNFOWNtd2FQNTVpVXN5?=
 =?utf-8?B?ZDZ1czVlVmVRVURBWjAzaUpiQjZOc1oraW1zUG9RU0xSRzRwdGx5Y3lJWmFJ?=
 =?utf-8?B?aWtWelVieWpvUjNFRGpSQlRXMDArR1V0WVlqRVRvVGxRbkt0eWRMZ2l1aWh2?=
 =?utf-8?B?Y1hqQVpod0d3Vml4MjZDUVR4d3FldmU0OWxodEVOeUYrb1lDL2NDMUlwSVZv?=
 =?utf-8?B?S0pmMDZ0T2hFbnpNYzZkQzVDVWRwZkU3WE1NeEUwQXhxNW9YYnRrS2gxcXQ5?=
 =?utf-8?B?bzdCT3dCcDJZVTF5dkpFRElJUmZPWXhRWTM5eHdNWkd6QUVqUkRpSWZoZ1VX?=
 =?utf-8?B?eEVTb0htZjZOT0diUmpLcEJMUVR2VC9BeUtPVERSMm9SbGo1RzJPeStINTJ2?=
 =?utf-8?B?cXVDSVJVQjFCUkU5SnhpTnBuV1JnYjM2K080YkpTeFlLTldFMmxzL2hidkdn?=
 =?utf-8?B?dE0zQW1JZ3JrQkQrc014K2xwRHRaQzR1UXpiWUlvai9lUXk3bkMvajFzSlJp?=
 =?utf-8?B?OUtsNm1QRHNBcU9ZemtaWU5aWHdZYm9Lbk5yNk13OHo1RmwydjZwL1JlaGxJ?=
 =?utf-8?B?L2pTekZ3am5KbmtGa1o3OFN1MzF1dzEvbDF0MXh3SmZuMG9yZmdQMHlxTmFp?=
 =?utf-8?B?ZnQ4Wmx0a3hJRUh5cmNERUhuOTgyTG5lYk5KbnpST1Q2WVp0c05iKzFySUVh?=
 =?utf-8?B?bzVKTlRzUGpmbzJLby83TmhKWU9FLzRkblNVUlBRU2tiRFJtME1nS0UxTm9x?=
 =?utf-8?B?RE1LQUdrWTQvQVJ0YStUb1NoMUhwNElUSGEwWHdjS3AzREYzeC9PV3hDazRv?=
 =?utf-8?B?eDJyVC85Y1hDYmdkYk1Ed2EwNmcwdnM5cW9lN2pPUUVGVU5DdnduZms4VjZt?=
 =?utf-8?B?Sm5McTMzMmdpNHZvc2wxOW45bW1wL2dqRUlhcXd5TzVjM2dRRVRFT2dSREdK?=
 =?utf-8?B?eDZ2Z2NVQ0FzUlRnekJUdXkxdzkxUG9QT3hEbjhIRWx1Mjh1K1VCVnliV29D?=
 =?utf-8?B?R29FOHE0bVV5My9ENndLSVQ1QXpGRmhKYmIrMFV0TE1xQlRQYTJBMW1UMUVz?=
 =?utf-8?B?UU1WVU9KR1p5Nk1iRFIzNjhWSTFIaVVQNjc2TWRubGM3NWlHSGFBUWVBNndt?=
 =?utf-8?B?NXc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: rG+Z391u0z5ko9oXnXX2lizKazXQwvcJFiwGs03kLvyeW1re03c9WB3f85oI0X8N0rNr+I3qyVu+QWsZALMSNs/mcGzdBd9zUSmYVTLv+988q3YUT6tr0CQV9vW5Uo5O7dGz2u7x5aN4QnuzlcqA+am9RnHW5HvBfjkFp9+uNtwiip+5pF2KsTeK+TCiW++gyX+/sLgUkIUgpjc5ktfYZrPi3xuD1gexYr1UtgcGY4uvlswpOajHv7gOv8JfYxTlS+ALs+3suDzeo8L/Gk78hMKhTIfOgPi4UJOBBPLDSsNtrjGVLvugKQ7J2A3WTlCISy8xDhbuqlir9TMs/htUcbfQZWTm3TxKLkFKu3J9rXDGLM4dJi7gQlMhqL+AdDSMBY12Vm0DKRODrSvK8DZz7jfJ4djxVSj/zLnGa/XddBTHWlZLF6W+7eOTZQeeGQnMlyIBvomptQVC9WKTpr7qswGcNx/jGqmM033DoyCO/Xr7r2s/19+RXiUtTNhAriBT/ViPD4W5r7eb1h3Gscy9HE/JPMBHEZ6K86No6hZe0gJ6C6YIaF9ivdB8e9bhXb4kjm2Ys0owsO4zHDCqg8UY4zU5bzDpNn3qEzL2usbLDHCo1p1YSa3uWfSMzN+/HG3Le6uhC6Q8XClgdLKvXkkoujTChLnmljxNniol9rfZwBlvqCaUzAh84ycbFryOFWSpNPpsafsMQ3nnXQkBZN+C+U+OkH+JnMF5zm9yMxmHYgokdHUuUR4HarxECg2UOqx7B52rMmP3EDMoc5nM3IDSDw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3e39885-75c3-4c46-6090-08db0952d412
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2023 21:32:35.4405 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3PocOfuokD+jnvsDTOVzVrkrnZPgCcdwPn+IJQkAI89uiQCjDVNN0bqv6YY+eZOQ3X86vyiveuqPw4Q7LV8VhddPunsdMzHDrzoaYkh6MU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6652
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_13,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 bulkscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070184
X-Proofpoint-GUID: IBvhKHQWEcchPGApWgSpnlN42xXqqcHU
X-Proofpoint-ORIG-GUID: IBvhKHQWEcchPGApWgSpnlN42xXqqcHU
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 2/7/2023 4:23 PM, John Snow wrote:
> On Tue, Feb 7, 2023 at 4:04 PM Steven Sistare <steven.sistare@oracle.com> wrote:
>>
>> On 2/7/2023 3:28 PM, John Snow wrote:
>>> On Tue, Feb 7, 2023 at 2:03 PM Steve Sistare <steven.sistare@oracle.com> wrote:
>>>>
>>>> Provide reopen_qmp_connection() to reopen a closed monitor connection.
>>>> This will be needed by cpr, because qemu exec closes the monitor socket.
>>>>
>>>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>>>> Reviewed-by: John Snow <jsnow@redhat.com>
>>>> ---
>>>>  python/qemu/machine/machine.py | 10 ++++++++++
>>>>  1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
>>>> index ef94dcf..557209a 100644
>>>> --- a/python/qemu/machine/machine.py
>>>> +++ b/python/qemu/machine/machine.py
>>>> @@ -501,6 +501,16 @@ def _close_qmp_connection(self) -> None:
>>>>          finally:
>>>>              self._qmp_connection = None
>>>>
>>>> +    def reopen_qmp_connection(self) -> None:
>>>> +        """Close and re-open the QMP connection."""
>>>> +        self._close_qmp_connection()
>>>> +        self._qmp_connection = QEMUMonitorProtocol(
>>>> +            self._monitor_address,
>>>> +            server=True,
>>>> +            nickname=self._name
>>>> +        )
>>>> +        self._qmp.accept(self._qmp_timer)
>>>> +
>>>>      def _early_cleanup(self) -> None:
>>>>          """
>>>>          Perform any cleanup that needs to happen before the VM exits.
>>>> --
>>>> 1.8.3.1
>>>>
>>>
>>> This code is still mechanically fine as far as I can tell, but I lost
>>> the plot on why it's needed - Can you please elaborate for me on what
>>> you mean by "qemu exec will close the socket"?
>>>
>>> (R-B still stands, but since I am rewriting machine.py to be natively
>>> async, I should be aware of your new use case.)
>>
>> Sure, thanks for asking.
>>
>> During cpr (aka live update), the old qemu process directly execv's the new
>> qemu binary.  The monitor socket fd is marked cloexec, so the kernel closes it
>> during execv.
>>
>> - Steve
> 
> Oho, I see.
> 
> I wonder if you are helped at all by some of Marc-Andre's recent
> changes to use socketpair() for QMP connections with machine.py.
> Depending on how those sockets are managed, it might be possible to
> hold onto one of them without having it closed alongside the old QEMU
> process. Or, if that doesn't help, double-check that it doesn't *hurt*
> you either. It should be the default as of about a week ago now --
> instead of using a local unix socket, we use socketpair and pass the
> FD to help alleviate some race conditions.
> 
> (Again, I'm fine with this patch either way, just a heads up.)

Thanks.  Preserving the monitor connection and state across exec requires more 
work though, because of buffering, partially processed messages, and other 
state.  I tried and abandoned that a while ago.  Re-opening has been robust.

- Steve

