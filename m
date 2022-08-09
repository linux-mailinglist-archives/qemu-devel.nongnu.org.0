Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B371958D7C0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 12:58:43 +0200 (CEST)
Received: from localhost ([::1]:55694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLMwc-0003x5-6A
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 06:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oLMv9-0002UZ-7x
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 06:57:11 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:52396)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oLMv4-0006NS-Tl
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 06:57:10 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2798uNaR023196;
 Tue, 9 Aug 2022 10:56:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=UgUV7P0oovELYyCakSHFBOsZdbTX2wY1YVoRirQDqnc=;
 b=VIJ4UvGSNPtR5UAP+BVbIr4hrBPRS6JRRwF5NudIDMcVTtFT5y/+Horq5cC2kxIcsB28
 aXQNY4CwuLkveOfAFl/IJ5ZstDh1t2Bb+m+ONKFb+V8YFllePhgw8dDV77j5/AtoUXzR
 Ov6VYUuT/4yQeCmPASGjhkCrXDOqxqi4QTPtH0UKobtdPoo8UPnQzzwcm/MQavuI54Hl
 6lvOv7V6SC4YVxOnqs33+oiswRxLOQ0Ow/yqEWZ1v6v7Sm46FDq5g4AZxqJ/rDKT36+j
 UFH32wOXNfXr2ldI46z9wnD/IooerKUlN/KpB1QZk3FVd4OJgWTOCa4LM27O7KbzAHLw 8Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hsgut65xk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Aug 2022 10:56:59 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 279A76GP011603; Tue, 9 Aug 2022 10:56:58 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3hser2jh62-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 09 Aug 2022 10:56:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaWYUn0/mOraVu0guQGeYU5/okngNmHuBsq03sTa2iy7Fyfta/E/Gg5yPF6R+zSOp6+7au11ASdWPvv1vmNdqepJZgjn5H3XQ3m5co4h7ZBLsF50lR5NwvzUzCKOnvl5eNTtipV5rKmtxfcJZnbGuALcd4LxpdtpzluDtC1oSkGY1MIb5IREjzFkXnvhhQRXl551yvcrq1+Ga2BOETYCwzhFAWh9w8QIxzNGXylPHOinvOV/jcqeZOLp2psQiIDdy56yw+TDogTSBPbcDoAmAnAoVOstr8Os/qRzDMKqAnKxVL6al2PI8Y9fP8JXq9X/OJP+AZjWCZy7kLMV1OhDKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgUV7P0oovELYyCakSHFBOsZdbTX2wY1YVoRirQDqnc=;
 b=KFMlcRnK09kKJpZCz7tHSf4umPRvibWJ2+8DdcfiQfXsWwOvi8LWjfeyWmFFQq+fTOD+37mnG18PfggePKIlggG8tcGez2X22id5RreBW9IHwjIrnyub7+a/z1MeZoRVrBu3LdHdSwxI40LFx/mxrsoFP3VeP4tHUZSicMFsGj0wYf+GdTXXrwt+lyoYyDGBQcK+VyM0FtSvMIkO5NHe0pvrRlkQ+/YKwFr73hXLQJB1e4hILYYaRBv5vhrb8syQsoZte8uOf/diYs79dpX8O7h+DetF389lcM5gtYpmSTi+qFfFZVOzx392efyWsdX8CI6qNuAK60cyDAxGKAuZmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgUV7P0oovELYyCakSHFBOsZdbTX2wY1YVoRirQDqnc=;
 b=XwrwDkFaNAm1vHcNyTwaCoGTI/5vxTfsUCf32fKYBv6j2AYLn4IRKWar5KzognI2rvgV+PJ2XnYRRQM9vCsDJoY9UFSJ6ChnZRFYim62DvqZvhPVscejq7ss3YQ8IuVOChZk6ogmi0EyOlCDy/6CcaaSIwy+LRtSoUV5uV+PpR8=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by SJ0PR10MB5788.namprd10.prod.outlook.com (2603:10b6:a03:3df::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Tue, 9 Aug
 2022 10:56:56 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::89:b21d:7dc4:24d9]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::89:b21d:7dc4:24d9%7]) with mapi id 15.20.5504.020; Tue, 9 Aug 2022
 10:56:56 +0000
Message-ID: <f8ab5723-07ba-f418-3011-e7850324adc1@oracle.com>
Date: Tue, 9 Aug 2022 11:56:48 +0100
Subject: Re: [PATCH RFC 0/7] hostmem: NUMA-aware memory preallocation using
 ThreadContext
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>
Cc: Michal Privoznik <mprivozn@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Mark Kanda <mark.kanda@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <20220721120732.118133-1-david@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220721120732.118133-1-david@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0550.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:319::20) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5942a310-c165-4f0a-79e6-08da79f5e057
X-MS-TrafficTypeDiagnostic: SJ0PR10MB5788:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zk491NafhnnKHtUOK3JyApVoRKQj9H1atFzbZo1bSHg4KQzAwKFI7rEZSSgR6pNFCcIOFNhUGmbklDNKSmSHpZo4kRf3bDEKeWx7/7APtfglX3lKHCflx5nh0aM7P4lOoEi+5pjvgW3NVK70So+pyzTlc1xaD2r4BGVCJCCdihfMtATlXau6fp+9ulMNGmd7GWSJTpPH9pdNcHCQJyphRPVb2zmJCwj1MQJDzd8bVZi+QWZE3oDlWHYuhJphFdPAnSG3RJro5bndgn2piwI60nMJTVEryrq4NqIo3W0cFRFno6lh3GIGgwKgJId+YPs5Q9/BrQtrozDMuR55P9sSzPMXdw28HDlSRbKJKyQmOVgNSibwC7Plm1+50WvQ6fmX8sdSuyy0pNcq9O/lg/qrWLK5TLmvYC9Hau30nIGajJM4VTRSWq9MV7AwKPNBoXCKKXHjn/GzGLLLGYj5fwZzLrQt+7yNeFikHLz+5R+FaxfdGatdB4mrVEnZMAfqbSsgHAbhp8NnjmjjWyvRe2WXkO4xGKkigSEqRXTF+2ivibO4xbNtLk6a71XSZbwhnUfKhQIXyPUMPhaHogxJCcBU3GVVMBJ/QN/i8xwfzllH5PAvlvh2dnHmYRUI7aOt3bZhIiZ4NXqc8YKsRQOYKy/yFst/92+GUOJEq5Be+nTutSQg8W3JnOy71IvjfK74l5YpLrIq++97TC8POblktTjfJYOKUVag/cEZiCtH0PzNqIjsz/030mZcr1kINZxWn4qT+OaaqPRax7OezxcFVOcTpZuUPZi6TnO2gPMBe3tJ2HQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(136003)(346002)(376002)(39860400002)(86362001)(66946007)(186003)(2616005)(41300700001)(31696002)(38100700002)(4326008)(66556008)(66476007)(36756003)(8676002)(316002)(5660300002)(6916009)(54906003)(2906002)(8936002)(6486002)(478600001)(6666004)(53546011)(6506007)(31686004)(7416002)(6512007)(26005)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1VTVENPSUNzRXo0SlgxQXd1cS8wZ3V0ZkVNZCtMbWwwTTRwTnhiKzh6Sk1v?=
 =?utf-8?B?UUdJVm11LytqakJ0MTR3Q0FRd0dTRmNUVnZFK1U0Y0ZGQ0RIT2g2bWpZRTRV?=
 =?utf-8?B?a21uYXhqQ0tMSG1tMFBGSSs3TFpSK2FSdVdlYU1mQXZIc0w4SEw2RHJLeGVj?=
 =?utf-8?B?ekM0ZldyNFI1SHRHREVXOGlnT2hOdkx4VUU1cnN1RlNXcGpML0pxNC9NSEUr?=
 =?utf-8?B?eXc5T3BUZzA1MEZUS1J6a1pscDczOXM2N08rcUhVbGRMOGtGK3ZGWmZneWFw?=
 =?utf-8?B?bFZqNmZFcU5aWVl1RUk5d3Z3SWpic0d6MThRNWRoYk9tZ0g0RHRBNWQ1eDlh?=
 =?utf-8?B?eDY3VS9iZlJUZjIyeW40d25ST3VDcnlKRWtWMUFUbmMxT2hrNG1zdFlmeVh5?=
 =?utf-8?B?RVAyT1FRc04rTGUzY05qMzJNTmJYVVJHbTY5bXBsVGJWNGJGNjRjcHR3bEty?=
 =?utf-8?B?QytsZ2ZjaXFnNkJ4bmMwM0ZMUUl5a2t6eFdyUWZsUFNCdU9xcGVzRnVKdGVt?=
 =?utf-8?B?TGNRaGNIMnAwc01rSHF0MVU5N3VXSEE0V0lMZ0l3NEJmV3QrSWUrTlU3UGJ0?=
 =?utf-8?B?bmdNSm00RXhaZ3NWUGh3NER1dk4xQUVmdFJZVEtucUJzcXo2bHhEcU9GVGE5?=
 =?utf-8?B?Vm03bDJtR3FwOHJIVzVOU25TcXpiQWVabnNMSTV3eC9yWmpVdnA3aVdUeWR3?=
 =?utf-8?B?NWdtUExCWU1Jb3RTQW5OQndUb2w5bVRVa2hHOXFXSWx4MzUyVExCQ29vc0w1?=
 =?utf-8?B?emhnOGJrVTB1bWgvZ0R6OElNVVZLOGtzQUdIQlVCV3pqU2NMd0dVSU5URnV6?=
 =?utf-8?B?V1FFL2pWWUg0c2RMd0NyVEhjSzF0bDZ1UUpZWW05Ky9lNkZ6TWJwcVZKUC9T?=
 =?utf-8?B?aEwrYUtTODB5NUpNM20zNFFvckZrcUNFZEk5ZHc0ZUQxRjRuVi85YU5DbzJC?=
 =?utf-8?B?MXFtSXBGRlpsc0xMNkdkVUg4WDMybzVtQmVLNlBJQm8yNmw3QVJ3aUpTNW95?=
 =?utf-8?B?WnRPL0dyODBSUjd0YWxMYkJXZENQakcveWVySEFBN1g1MnljdE5ROHExb3RD?=
 =?utf-8?B?aUQrdVJ4dWVqd2JiQWs2aGJzUU5pTzdvbWRURGNEQS9DOTA3Mm5uVW91VXlw?=
 =?utf-8?B?YUQwUlNVbmdKWVJFYW93RDY5SW5FUDF5S2ZNYTlVWk5tZk5KQmJsT004QUdJ?=
 =?utf-8?B?MW1zT0RhOWxQWDFKOXN0c3FVOGlSQkRuWWVTS3VVYkVGSGM5clUxcWlZb3JT?=
 =?utf-8?B?dC84akJOTVdXazd2UmJrMGdWckgvenlsNlg0cmN1STg1RkZCYnRaUVFrL1Rq?=
 =?utf-8?B?bFUrd3YrbHMza3FyMzdYOXhmRFhGRFVVWTNGMHNWaDNzTXp2bzUyZitDWEE0?=
 =?utf-8?B?M1ZlY0c4cXF0ZWZXU3lVTHlKc0NGOGZ1MDM5b3g1MDZDS1lkSlJOQnFJNkVJ?=
 =?utf-8?B?U052YUZiQlB5YUtBUTE0cG1xQ0ZBZjEyY1dNVDFQemNac0NKZFZXRFNObU5B?=
 =?utf-8?B?TkJVTlNaTEtQWnlvdUF2Y09MMkgyZW9JUmF3bFRST2tlVkJMQVFyd2RkeG42?=
 =?utf-8?B?MjM0SlVWMjkzQW80d05wOFlybGJHU0puM3dYUmprNVpmaFZlRnZzNmk1azM1?=
 =?utf-8?B?K2VhZ1lMcmNsQWFBM2M0b0VVN2hONGNKQWUvZkdhc1hSaFZ2VW91SjRVTXNx?=
 =?utf-8?B?cjI1cU1nUktacmhWTDRiUVNYZGtqNnZuMVBMNW55WVh0T2dEenZNQkJvUkN5?=
 =?utf-8?B?RENzK2dDOXlBcW1SWGh3WUoyNjEzSHgwb0lsdFFIckpCVmtmMHBrM2FBN3Mv?=
 =?utf-8?B?a1JlQnBrUWM3RWtiQXRVb0dNWExUeTZqaUtWcWFwLy85dWZGS0paNS9QYTI0?=
 =?utf-8?B?MzBHM1lwQkhDcGtmOHYxSm1LaVRGVFc0dHpON3pZTTd6dERRc0hGUDNBOU45?=
 =?utf-8?B?ay9UWkxtcEJJcS9zaTJ0NkJ6cG0wTDMrcVFReGRuNWJWNVdmc0tpekRackZU?=
 =?utf-8?B?NUxPUWNaeXdQZEZibkI4clBUbkoyNk5KeHZGRU9CNmZwZ1E3V0c4TVZPTFlu?=
 =?utf-8?B?RlYzemZWRG90RDBUWVRHNmY3cEFGNmVZNWF6bGJnaTJESmVSbFVhaXo5R3A3?=
 =?utf-8?B?cVV4bUlCWHRGRzBwbm1JeEJBbkNtQzZ6c1UxOXhNUkhaalN3aGdoajNVOUZn?=
 =?utf-8?B?Q0E9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5942a310-c165-4f0a-79e6-08da79f5e057
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2022 10:56:56.5217 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rzOjmu1kOfc05Da+6HF91pQM2vhwm43j8RRjSwbtmAPFMl52AjtlrZIs9VGubQHt2Zf8v62CoS24jQ37Poq73DiVrOaebWvOJS8d4sn5ENc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5788
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-09_03,2022-08-09_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208090047
X-Proofpoint-ORIG-GUID: Mp9e6G_FTOSbcZqDlNhqVkZjxAtLoIC3
X-Proofpoint-GUID: Mp9e6G_FTOSbcZqDlNhqVkZjxAtLoIC3
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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

On 7/21/22 13:07, David Hildenbrand wrote:
> This is a follow-up on "util: NUMA aware memory preallocation" [1] by
> Michal.
> 
> Setting the CPU affinity of threads from inside QEMU usually isn't
> easily possible, because we don't want QEMU -- once started and running
> guest code -- to be able to mess up the system. QEMU disallows relevant
> syscalls using seccomp, such that any such invocation will fail.
> 
> Especially for memory preallocation in memory backends, the CPU affinity
> can significantly increase guest startup time, for example, when running
> large VMs backed by huge/gigantic pages, because of NUMA effects. For
> NUMA-aware preallocation, we have to set the CPU affinity, however:
> 
> (1) Once preallocation threads are created during preallocation, management
>     tools cannot intercept anymore to change the affinity. These threads
>     are created automatically on demand.
> (2) QEMU cannot easily set the CPU affinity itself.
> (3) The CPU affinity derived from the NUMA bindings of the memory backend
>     might not necessarily be exactly the CPUs we actually want to use
>     (e.g., CPU-less NUMA nodes, CPUs that are pinned/used for other VMs).
> 
> There is an easy "workaround". If we have a thread with the right CPU
> affinity, we can simply create new threads on demand via that prepared
> context. So, all we have to do is setup and create such a context ahead
> of time, to then configure preallocation to create new threads via that
> environment.
> 
> So, let's introduce a user-creatable "thread-context" object that
> essentially consists of a context thread used to create new threads.
> QEMU can either try setting the CPU affinity itself ("cpu-affinity",
> "node-affinity" property), or upper layers can extract the thread id
> ("thread-id" property) to configure it externally.
> 
> Make memory-backends consume a thread-context object
> (via the "prealloc-context" property) and use it when preallocating to
> create new threads with the desired CPU affinity. Further, to make it
> easier to use, allow creation of "thread-context" objects, including
> setting the CPU affinity directly from QEMU, *before* enabling the
> sandbox option.
> 
> 
> Quick test on a system with 2 NUMA nodes:
> 
> Without CPU affinity:
>     time qemu-system-x86_64 \
>         -object memory-backend-memfd,id=md1,hugetlb=on,hugetlbsize=2M,size=64G,prealloc-threads=12,prealloc=on,host-nodes=0,policy=bind \
>         -nographic -monitor stdio
> 
>     real    0m5.383s
>     real    0m3.499s
>     real    0m5.129s
>     real    0m4.232s
>     real    0m5.220s
>     real    0m4.288s
>     real    0m3.582s
>     real    0m4.305s
>     real    0m5.421s
>     real    0m4.502s
> 
>     -> It heavily depends on the scheduler CPU selection
> 
> With CPU affinity:
>     time qemu-system-x86_64 \
>         -object thread-context,id=tc1,node-affinity=0 \
>         -object memory-backend-memfd,id=md1,hugetlb=on,hugetlbsize=2M,size=64G,prealloc-threads=12,prealloc=on,host-nodes=0,policy=bind,prealloc-context=tc1 \
>         -sandbox enable=on,resourcecontrol=deny \
>         -nographic -monitor stdio
> 
>     real    0m1.959s
>     real    0m1.942s
>     real    0m1.943s
>     real    0m1.941s
>     real    0m1.948s
>     real    0m1.964s
>     real    0m1.949s
>     real    0m1.948s
>     real    0m1.941s
>     real    0m1.937s
> 
> On reasonably large VMs, the speedup can be quite significant.
> 
Really awesome work!

I am not sure I picked up this well while reading the series, but it seems to me that
prealloc is still serialized on per memory-backend when solely configured by command-line
right?

Meaning when we start prealloc we wait until the memory-backend thread-context action is
completed (per-memory-backend) even if other to-be-configured memory-backends will use a
thread-context on a separate set of pinned CPUs on another node ... and wouldn't in theory
"need" to wait until the former prealloc finishes?

Unless as you alluded in one of the last patches: we can pass these thread-contexts with
prealloc=off (and prealloc-context=NNN) while qemu is paused (-S) and have different QMP
clients set prealloc=on, and thus prealloc would happen concurrently per node?

We were thinking to extend it to leverage per socket bandwidth essentially to parallel
this even further (we saw improvements with something like that but haven't tried this
series yet). Likely this is already possible with your work and I didn't pick up on it,
hence just making sure this is the case :)

