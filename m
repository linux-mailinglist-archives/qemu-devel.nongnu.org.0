Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9249063159C
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Nov 2022 18:54:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owoVd-0000Kq-9z; Sun, 20 Nov 2022 12:53:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1owoVa-0000JC-Bq; Sun, 20 Nov 2022 12:53:34 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mihai.carabas@oracle.com>)
 id 1owoVV-0005CO-6t; Sun, 20 Nov 2022 12:53:34 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AKGljqH029574; Sun, 20 Nov 2022 17:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=7wg9NGO3mlg5codfrS4yzNV0TUDr/4fSUxGQYQsScvc=;
 b=wqA3BbsEy3yv9j+rzp4Fih2kE75fwwpSs4NtE6LTYsGQPGoSUJ7S2OPT8/KaysC7ysmT
 3G8e8mEPJ/ZZuuKmtBAGk9vq6pRajA1KhC69zuqZNwJJSyf223rCkBFA77s+eUx9EXWq
 MvZVnbkW9Qy+V9oetAcNk/WNzVdoI+X5HYkDbrG4q4wUPC4HS+7SOTJpKCRur/D+vVth
 8eMZbXWypjZY8zjax7vZWt2tVddI5B2eR54SkAcCTllsIDgspQh2Qe6I4zkclVGzvsV/
 s9PxMbuwgoz1JDQehG6K5JnWgCPJaTUeir/Vnvcfw+0f6g919yVuqXaS6zDObOe+/pLZ 4Q== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kxrfat2fb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 20 Nov 2022 17:53:23 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2AKFbpBY031433; Sun, 20 Nov 2022 17:53:22 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kxnk2t67a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 20 Nov 2022 17:53:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mBn9Nmnx7O7iQsC9WWdpDAUsSCL2NdX2ym1ZhCpnzv1evgvyJlg7ppT7sLZlFzeBY2HSWLxoxZDanQ5xa4aTMXINRlWK4+TJ84SByb6mSwEnv7XnxaOKLhgfgXod69dk8orbmYyQS72gYErSTumdMiqLgzI8/pVK1/jQAWf0yBbMnLiMpgmbKF67PK+lQ42xgwng06p44Kue1/u5S/nZdGRZsis/DCA9pTUGpLkCnmEluLO2o/6pZZca8+XRQb4xLbl2IJnIuhizfKvIbWj7pwCVWVVDGtVlXEbpe84zKx3rx5txLkA4HPtigJT87Z+X4STLXwlQilKnJrdOW0WMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wg9NGO3mlg5codfrS4yzNV0TUDr/4fSUxGQYQsScvc=;
 b=P2dmof4QqENS1GjvHEGf7Cu1WcBSdeK/YSyaDv9TcX1JP5ywUkFkkTvCos0nW6TIjWWwJOW4XTZRN+XxLFU4MWuSujJ+327IVG6dyOFfzIgmVZEGN57HgpbZkQr1Kvqlam2GY9C9VxPE0ENSbgMLriroekd0uTQQzwXZiuirnNhOCq68EeTqeierPAL8URhOpVCKjP1a4HkniTsAlDmuZkWRG9t1AENy6yxgL9yqORK1r+JmNEfoxaqhRyoKJuPFnqk4rQCCjGrRatitwvBMnn067Ch57E7cH2LHaU0fvyuQ3Ie3Gmb3sXws3G8raINVzADtjxZAuoOWwtLCMN3G2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wg9NGO3mlg5codfrS4yzNV0TUDr/4fSUxGQYQsScvc=;
 b=zUpFHTRQ5IDsmcl4+io6c6di/Fo8T28LXP3dLlaT2WBbhj0UJgWSTp388gmLUo+m8VoSKQDhbr3C1tJ05QmrozOlR/Oq26r5kI3DAqRNpXuU8EIDut4EAWm6Ufi6T9CASHRSlDkeqbEBRSBdGmDo5vEbIdpu9XMaNp7pDPJJUU8=
Received: from PH0PR10MB5894.namprd10.prod.outlook.com (2603:10b6:510:14b::22)
 by SJ0PR10MB4542.namprd10.prod.outlook.com (2603:10b6:a03:2da::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Sun, 20 Nov
 2022 17:53:20 +0000
Received: from PH0PR10MB5894.namprd10.prod.outlook.com
 ([fe80::6d72:4f59:e5d5:1de5]) by PH0PR10MB5894.namprd10.prod.outlook.com
 ([fe80::6d72:4f59:e5d5:1de5%9]) with mapi id 15.20.5834.009; Sun, 20 Nov 2022
 17:53:20 +0000
Message-ID: <eea06d91-492b-3c1a-6e0d-5e52507b3b1a@oracle.com>
Date: Sun, 20 Nov 2022 19:53:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] target/arm: build smbios 19 table
Content-Language: ro
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <1668789029-5432-1-git-send-email-mihai.carabas@oracle.com>
 <CAFEAcA_H8UEcp4HNFe1CwaheLxg7453QQBjTa9wSnsW6TgsRKA@mail.gmail.com>
From: Mihai Carabas <mihai.carabas@oracle.com>
In-Reply-To: <CAFEAcA_H8UEcp4HNFe1CwaheLxg7453QQBjTa9wSnsW6TgsRKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0454.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::9) To PH0PR10MB5894.namprd10.prod.outlook.com
 (2603:10b6:510:14b::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5894:EE_|SJ0PR10MB4542:EE_
X-MS-Office365-Filtering-Correlation-Id: 973b1795-49ca-44a6-cf5c-08dacb201b9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LFp2n/3LDfaFlmceniGn7goSmLgpjUHGcarRrOfuevXkSHOxgHwpew0fG3jicMoB5hSMsWrtHy23sj1B3vwRb4h1uv9JCXWSge1kLGR/L4DtgtEya049oREyQWcOvasdc8tS5Tf3OYTex4btgCq2d/MhWwwSQIlGZ7q5QibuOp7+YI/EHg4x2T0UjWGqKBVUnbidtKWvGDCKjU4MW9MEga+PHntIzOLFWVJKT92Af8q4pIIry4uuxBjm4lyaP3FgUqYoXRhHXAByKy4+6tLbD3hMiEKjPuRTmXABawl6F6t/r0l7eMCPU8iMU+mveiTLdzZR0VBsZGdgf7TNgtGUfufriqRqn9MzGOoXQ20BhfK+3GkS8DazYYlqPxKrJcy9bdMju7tmuXfePYgeX/+WTt4/eeLG3mQxO/i1xdUb5s5P9BJzug2ghZv1ZhLOamLpwLaTEB8HGV8lpxBe7ZyXETHy30Phe/c/k/NrXiCjRgaMYWbaVmexIKZBIgXl9s9NScfPy9xRDAL/d11aQK6nQ/omH7pVZCgfOo75AYKckYT9TnF2iLl0a1+zFW7g0IxPy5hjSPGK/VIMSSyq/ZKJQXHwkMs4TpKeQdFL5hsgvyUag3bbxRThA1oplMrfVq73yqvCnEGFdYQORpfqxlXQeB8g2roxz8mSr3bgFbbzcqPIcADz5wT5SoFdAH2+WOcxFl8EWCv2KYGWUkghWWLwJeibvFg0+PyEIzZ278v7dJLHjoAVC1XZihwPzgXz/bSz5G/qrs/fngLrOBx8jS7WZ7RFR1SbsairRLcu6SeJTHA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB5894.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(396003)(346002)(366004)(39860400002)(451199015)(38100700002)(6506007)(86362001)(31696002)(6666004)(186003)(2616005)(6512007)(8676002)(26005)(316002)(6916009)(66946007)(66476007)(966005)(4326008)(6486002)(478600001)(44832011)(5660300002)(2906002)(66556008)(8936002)(83380400001)(41300700001)(31686004)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjFTZk9DMnVKaGRkd1lqUlQxWWUwczR3NFNWNFllSm12c1V0bXdvNmdHOUNX?=
 =?utf-8?B?eXhCQkVIckZpbUk0S3BjMXZEZFdLcE5SUjlDVElkdkk5S0FnSHhoZGRqR0NP?=
 =?utf-8?B?SHdRS3B1blZEUC82U2ZGOGJjNjBieS9XU1VlWldTTE5SVk9HdFpGZTBBZkkx?=
 =?utf-8?B?MUtJckh2akhRaTFIZXA4c0h1TzJEQ24zRTNjMERVZVIzUUZQVkJGNk9QbWFU?=
 =?utf-8?B?TUJBZ3hHSE05dE1DZTRNVmdKN0xYbzkza0J4ZWJKamZJWWdxcXhGZTNUU25Y?=
 =?utf-8?B?Qm0yeGlPQWRiQjV3ZXBNZE50S3NkeXhuT29TZEVDbGk0ekNKVFdxQjZkVy9G?=
 =?utf-8?B?cmF6YUg5QmtKblpVYmVWczFVSDF3OG9EZmE2dDBMR05pUGMvSGRpNEY5QnR2?=
 =?utf-8?B?WTFQWEdvQWhDTU54QUo0eXdPMlBteXpQNTVmNndyS2FuMjdHc2VUU0hqNTBP?=
 =?utf-8?B?Ymk3emthcWJMYjZ4UGJWdDBUcVM0L0x5dkJnWmYyeHovOXVsL2R3VU9OZzVl?=
 =?utf-8?B?cDk2UHc4cmI5U0dsQVNwb3NuakZtbjRGTE9WYUNMcEdHSnQwM3VmUEp3aXpZ?=
 =?utf-8?B?eDFrM2ZBSmlDN2RUMDNxRnd3bDhTVDNPZ1lsM2hMTnFBZFNpdDZwMGdZL21a?=
 =?utf-8?B?NTk0eGxPcnNNSS9aaTNBTVBZL3NuOXVEL2JDY0c1bkRnVlN3aFpUUGxpd0lo?=
 =?utf-8?B?WVFNTmFXdHhub2ZLK0tMa1dVMFFvbmpiNjFFQjNDYkI2d0pSbUQ5djFUZHRa?=
 =?utf-8?B?bWx2MERIVmY0RnF3WWJMd2JYYUJuNDBSWTlNT2l1UWFTdDVOM2U0dExkdVU3?=
 =?utf-8?B?aWFMeEM5UFdQYkpEWFg5R2p3YkNUd1V4NzEzZ2dUeVYyQklkNHozdGFodlFV?=
 =?utf-8?B?UVErd3pVYndSUmJoRC9uUFFRaUtJYmR5KzVkWmlHOVovemhrUzlpNU1EU3BY?=
 =?utf-8?B?OGN4OFRiczdJUG0xbWc2elFPTVVKRFh4T0dHRnlKTDlkYTRZaExMN3RMdGlR?=
 =?utf-8?B?NVlBQnh4OFdIeDQvSjR5bmdCNWtTeUwyOWRqN2grSUcyOEhOb2lTZzBtUkpW?=
 =?utf-8?B?dXNxQ2dleS9FMERicUZUSWRRY2xidi9GSkJQcUZzclg2a0tyV2QrMXgxU1F2?=
 =?utf-8?B?bkt2cnlYSGhoZ01NZVBaZUcyRlIrYmFwcXVLeGlwNmM0a1pwZXBhY3VKa1lu?=
 =?utf-8?B?RVpEWmx0ek9pbUtiaytKRkwrbWhxams1dXBBWFRlNlNhaGUxNHhRb3ZRNi9a?=
 =?utf-8?B?a2VBNVRDWnI4OEtyY01FYzl2c1FmYVl0a0N1OEZWeldSM3BJaGlXV0p2akR2?=
 =?utf-8?B?QkZ3aFlncXI2OEhBNWZ6dmNlNjUxTnhNbURBUzF3dmtYdG1ORjRlZXN5QXkz?=
 =?utf-8?B?WXNnOVNNeG5xdmZNWnFmRjBVU1dXZVpXbUl4UDl3N1YxOEYvRVdseXZiYkZq?=
 =?utf-8?B?a01QdlNXUHY5VHJpYXF2dTBBYkFGVnd5SWtUSjg3ampkUnhRYndNSnpSd1Jx?=
 =?utf-8?B?QXV0R0FLdTQzTUZVWmdYQ1ljOC90L3VTSGgyNzVuaEttYlhGWjAycWpuUXF0?=
 =?utf-8?B?Zk1QYVYycW5ic2tLRzdFb0YvNkV3ZXA5UG1KNDZkVXhTcFk3QnVRRXpmb3Fz?=
 =?utf-8?B?dlZ1Y1ExMmpLdDlxdFdFbGdWQ2s5TTkvT1lsTUkzUWZwekZSVnNpK29hT0VL?=
 =?utf-8?B?MEVrYXhWRTdkbFVJYlVlSUF1ZEI2Mm5BWDcza0tPeFcxZkhhVTAzL1Rub1o2?=
 =?utf-8?B?MkszYTdESDNWUngrVjRyMjFVcjlJa3hWTlhNZTVhcXFEY2ZjeHJDbWJwMHlM?=
 =?utf-8?B?aHN3cmVKS3JIUlo3UkZWOWU3VkZESDhsTDZQaHNES3NpRVJoU0p0UkFkM29t?=
 =?utf-8?B?QWJUc2lpc2tYZkFrZ2Z3QVFxYzQvOUdaVDJnRFNHT3g5UVdXQXloZURhVWht?=
 =?utf-8?B?QnNFT1EwLytzZ0RzN3ppNGJlNi9ieVdOUkdQN1dZajZMUlRacVR6bngxd2NZ?=
 =?utf-8?B?L0krSmd0SXdlMUJFempGT2MwUFZtaEhvaU0ycktVWUpUaWxrZWlzRDJUdkRD?=
 =?utf-8?B?bk5aTUlkQjh6OUorYjA4R2VWVzJFeTJBUlZ6cityRE1WclczendJTnMzemtD?=
 =?utf-8?B?U0xpOE0zbmVUd25wajdlOXd6NzJUNEswY1NaRTNHK3VwMzA1K1RSQXVzY0Ru?=
 =?utf-8?B?aVE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 5ax3u7tVzmlMcaHAANegbSjeEAhCoeoB26s7MVT07RNO18kzM9/xnQVGF9MHwFdAb4vXRK4b0eF5TWjC5A4KJY5Owki5UNnb9VVyG4b32K1g/dS75cIY7jVQoUyFouEzf86R9P2qSWl2rmp5Tsrrqx9N/gG+8emjH9vI5LWAnxsylIIe6qcj/K2y2gkAyWCq68vNFcCMNoWYOeugPoA+O4byfMywjgU4zPKuIo2tdzTqd1MrMfegnuwkGW10EvaWV/IXDBEEo2CyIM7xXJ1Br043tCo8HVVZFgY9vuB2FCsTo9bl6wjhLzbg27IQqopByTTOvexBeqAGCpYMniKMEsTy+9ytgNR0BIdUGot4WQIo67Q5MsgZCi/idjHYAk5NRg5rR3GOXecZ7/sARav8kACf3fg0IYzqdb7SS3ZGqD9qVT9ju/XQ/PcDMtFBVS/4CFWJTRASQnrRsWcZBBVGBd+bJfiLKZOLG6v6ofPVhVOZD1fUXeCJbRku5VAOO3gtkUI83CzAFGxNT1JiM2awXk6Tp4nsA+KgEx6X+prrg9jbvZeHjNgvebGCe+oPcyNZ4prnDNFpCKGWySdU3FnbkbwGxdMhI804yZ8UtA+IFtYNh3lN+wd25fj5n1GZ9ouOmU7t/vwB6zpG1dSqmxwZPsQIxUQz+Z9jGRLKR73KlC0duBV9BDJUifMDsmJhX/GkbKDoUNpoi/qS3r5K/d7Mt3ej8e1ZmSVuWBMdYHfrlSFPSY+qVjgNW4D6CyOrv2FW7KF7e4d6ftk7sjkfx3oZPj3YWbUObXCN3M/Xg5aTTxLUZSHcaus6KQxK/Zq/nTR/
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 973b1795-49ca-44a6-cf5c-08dacb201b9f
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5894.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2022 17:53:20.4818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vX4acyEdV+fIvqBUkgXsOdSMqO306UPhS4CtwZ0bLdKmu6tAiMWWfUNXbQvMqamZFxwi5dE/Xa0CpUYToXAW8k/7bGYm8po19zvLp5eD7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4542
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-20_12,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxscore=0 suspectscore=0
 malwarescore=0 spamscore=0 bulkscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211200152
X-Proofpoint-GUID: qLF4O-qvJRxcScHdDe-5uJpDbbbEAcwT
X-Proofpoint-ORIG-GUID: qLF4O-qvJRxcScHdDe-5uJpDbbbEAcwT
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=mihai.carabas@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

La 18.11.2022 21:11, Peter Maydell a scris:
> On Fri, 18 Nov 2022 at 17:37, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>> Use the base_memmap to build the SMBIOS 19 table which provides the address
>> mapping for a Physical Memory Array (from spec [1] chapter 7.20).
>>
>> This was present on i386 from commit c97294ec1b9e36887e119589d456557d72ab37b5
>> ("SMBIOS: Build aggregate smbios tables and entry point").
>>
>> [1] https://urldefense.com/v3/__https://www.dmtf.org/sites/default/files/standards/documents/DSP0134_3.5.0.pdf__;!!ACWV5N9M2RV99hQ!KF2xmQw9nxPvqvNCgDleyVHv4MoZseoZFHmR1veww7O2BmRxSH1spOCNWX-c-FvzcaR_o8PunXSWWH2ECvFqlR4E7vw$
>>
>> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
> Is this a bug fix, or a new feature? What are the consequences
> of it being missing? Is this important enough to go into the 7.2
> release? (My default position would be "no", given this has been
> like this on the virt board for a very long time.)


This is required by ARM SystemReady Virtual Environment [1]. As 
described in the Arm SystemReady Requirements Specification v2.0
  [2] page 9, 2.5.1 SystemReady Virtual Environment (VE) v1.0 
requirements,: "FirmwareTestSuite (FWTS) must still be used" -> fwts 
checks for the presence of SMBIOS type 19 table and fails the test in 
this case.


[1] 
https://www.arm.com/architecture/system-architectures/systemready-certification-program/ve

[2] https://developer.arm.com/documentation/den0109/latest

>
>> ---
>>   hw/arm/virt.c | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index cda9defe8f09..855b6982f363 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -1607,9 +1607,11 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
>>   static void virt_build_smbios(VirtMachineState *vms)
>>   {
>>       MachineClass *mc = MACHINE_GET_CLASS(vms);
>> +    MachineState *ms = MACHINE(vms);
>>       VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>>       uint8_t *smbios_tables, *smbios_anchor;
>>       size_t smbios_tables_len, smbios_anchor_len;
>> +    struct smbios_phys_mem_area mem_array;
>>       const char *product = "QEMU Virtual Machine";
>>
>>       if (kvm_enabled()) {
>> @@ -1620,7 +1622,11 @@ static void virt_build_smbios(VirtMachineState *vms)
>>                           vmc->smbios_old_sys_ver ? "1.0" : mc->name, false,
>>                           true, SMBIOS_ENTRY_POINT_TYPE_64);
>>
>> -    smbios_get_tables(MACHINE(vms), NULL, 0,
>> +    /* build the array of physical mem area from base_memmap */
>> +    mem_array.address = vms->memmap[VIRT_MEM].base;
>> +    mem_array.length = ms->ram_size;
>> +
>> +    smbios_get_tables(ms, &mem_array, 1,
>>                         &smbios_tables, &smbios_tables_len,
>>                         &smbios_anchor, &smbios_anchor_len,
>>                         &error_fatal);
> Does this show up as a difference in the ACPI tables? If so then
> the bios-tables-tests will need updating (and this would probably
> show up as "make check" failing).
In ./tests/qtest/bios-tables-test.c we have test_smbios_structs which is 
checking for all structs present. Also it is looking for mandatory types 
and 19 is one of them (base_required_struct_types -> 19). I think we 
cover everything. I will re-run make check to see.
>
> Do we need to care here about pluggable memory devices?
> (We seem to do something with them in the ACPI tables
> via build_srat_memory(), so maybe not?)
Here you are refering to the fact that when we hot plug a memory dim, to 
automatically update smbios type 19 entry/entries?
>
> thanks
> -- PMM



