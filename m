Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0108438C99B
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 16:58:30 +0200 (CEST)
Received: from localhost ([::1]:49938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk6bd-0004ER-3R
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 10:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lk6aP-0002pS-Kl
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:57:13 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:21030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lk6aN-00017V-Mk
 for qemu-devel@nongnu.org; Fri, 21 May 2021 10:57:13 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14LESHdx001945; Fri, 21 May 2021 14:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=62hUgpFaDCPmMUR+c/myw0vsq9QqBwR5shtphwoJBbw=;
 b=S23bCoSkhn80KzUMhShAwpsFha7AEYqm3ju4+7Njd8PhpaKZvNGbdL2B3GawQSPFQ+vN
 6sYIej1xeqyHIR2gL7ryDSiVzCqyZgNd0/HMP9krR16aekS5pq5djZ+3g3MM5v5EQdqP
 Zwj6iSzNObkbW3yO1yA0x+QJScVKKDfxs82STOIHJpi4/1qb+OywsSE5L1+XK4speW2M
 WejvzLE3CxQlBbJk+rKWx2qEgs8O9vIi2VInzpqGTO722WequuJVniYFdywgVKEScawi
 23GGPoNlB/KaS0tSlR52TOMOkBkGpW3YqKztK2fey6cy/wzHfcp/nbhCCBgsh68VQz0E mQ== 
Received: from oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 38nhjfrmme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 14:56:08 +0000
Received: from userp3030.oracle.com (userp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14LEqGWq080445;
 Fri, 21 May 2021 14:56:07 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
 by userp3030.oracle.com with ESMTP id 38megnmdxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 14:56:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiD9i5k6iyOwKVqbRmZXxELN5K+weTzSDWMFIBps2rnjzZ1AAJV5FzUMNlKLv7bMLQx+AnZlDScDxd/qkhwDYZsSuxCEcxJULLAywPsdehbmeSZHuijuAHebcqfG3CKL7d6Mvv1SGNftvPPV6PGHxrSUgvUOF38kyGTgWD4jKBNb2/HLG+bFynXGy2MVYZuaXS+Q4MUBa2I12LrCsUwd09TH5nWMgkmiCUM1lAHo9G50lQbBeIVFRzhDxftJvPxDUfSBlFZbbMVi9zWnOdfK0v32bS39jW7M+t4ZnT/iMfSAhjG/uoSWCDjX/DFn2YV10Za5iZiBQL+ZlvPabJXfCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62hUgpFaDCPmMUR+c/myw0vsq9QqBwR5shtphwoJBbw=;
 b=XAsIDuEnArRXeTXgd2PgEm+96LQ2W7GLttQKOUBeM7qqXyRDzJCza1zzirlniMsEgQJnh0yCukZ0pJLtF7TFb0RMJ0LcD09hI8A1KVJlu7xPQEnTPnG0edJpr+kpilrLIXZiAZ+BcExWf+USHS9kHw8twIfvtQ5pDc7K6bQmD2+TffERHxY8icDhshIEM8NSzOhv3Gl2sosAWducNnRkvFuI/7vmYFy+rKb7J38OpaPGaKvKU0vhnSwmA8EniD0zYoe0+1C4FxBsFGOBtr8Y8qCitVcmKXoVQxSbEJ3s9d7Iw+SLGs6pf+MlsBmRmt//SAsO7BH2gAuQ/TSq0QGGXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=62hUgpFaDCPmMUR+c/myw0vsq9QqBwR5shtphwoJBbw=;
 b=QpSEK1b0unGVFsspe/H6lrZZ28jpxoSc8zWhOEKZsGlfPA/wnv6YhlGzbKlpA16SmtNy8QQJOv4aGyww5hZsg15czr0TMZruiOmEqX7GBrbfomRLIqWXibkLULfk4w52uiGGM6Nv6g2zz+mwKZgmNa4UrtUxK8P8CygVXFGn1bE=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2808.namprd10.prod.outlook.com (2603:10b6:a03:8d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Fri, 21 May
 2021 14:56:04 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4150.026; Fri, 21 May 2021
 14:56:04 +0000
Subject: Re: [PATCH V3 00/22] Live Update [reboot]
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <YJwFkhlYISA9INwO@stefanha-x1.localdomain>
 <4d3dd5ff-5180-16df-ab48-11de610dd396@oracle.com>
 <YJ5kokhzyA5tCom3@stefanha-x1.localdomain>
 <29356c3a-0b3f-2773-4f9f-18ff4ed4d5bb@oracle.com> <YKOPnkefxgRZ8PoQ@work-vm>
 <a1d3dfea-d15e-35a3-a216-3ce65600f2d6@oracle.com> <YKQULUn5F+x1wrYI@work-vm>
 <38dc91ab-b96b-1cc3-bf8b-84ff77b334fd@oracle.com> <YKZdcSt0ltCBqVsz@work-vm>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
Message-ID: <5dc94efc-cb95-d7ff-cad3-391c90b3264f@oracle.com>
Date: Fri, 21 May 2021 10:55:59 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YKZdcSt0ltCBqVsz@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: CY4PR22CA0095.namprd22.prod.outlook.com
 (2603:10b6:903:ad::33) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 CY4PR22CA0095.namprd22.prod.outlook.com (2603:10b6:903:ad::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.24 via Frontend Transport; Fri, 21 May 2021 14:56:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d1fdd0d3-51e7-4398-4ae6-08d91c688df1
X-MS-TrafficTypeDiagnostic: BYAPR10MB2808:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB280897948C674F6AF9E13DE4F9299@BYAPR10MB2808.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LqAlvPp875ECZmGrls6Fov8yIGccTCp43MwThoGiiQ4WmU3ykQR1HBN0/4a4f4YPRE6FhO7noo23Ao3aw3jBpPsTDfo+kBvLF13mnXPO2UHVSUZOc2n4yz4qD48o7xt5bxhTy46LsyLpdLc1UhdrQy28TJ7wLJeXepOd83GOrJ7EBv0/NZQVEatmPL3s3MA24iKvfUxTCav0LLYIBPuHfPiRl7wzcQqLQCl1CavI3SV0YfERzlAU/ua6HPrtvy+QsYJ9eHvilSOWUgaXgsm48Rdz8mBQMsaGUm+vwqRUQKZaaOtbrfEZ8cWJ+egYqnEsDJOSeBGAcfNTOImUcrQgUzD4m1aN62oUYraBdEgAONrPW5KBSsc3EJmzt21Y1mcAdw78jbcev74GHkoetULUWREFFbnS3APi3CcRWD7xWZN+gVmTYi1uTVoOcd2uIEg4nsn1uaDZYEH4M6Jq28b5hUksOsaXFdBiCFUxeOy3AmtN2oiy6Nn9OzarHUAvKIQuekulM35Ig2aNC9eBBbeOtyLasQHDp0IEjPZLNVZ23DoVjK1V+PBZU9CoHwZ+Ywb+LbJuc3emq/SWmkp3bdl8y+pza5j9wI29kVyWErZPUJY6hBlVs983D1OuPnYxkQ2KGlQkT505YYGLsND4D9sOFeBYO+PCZouAmoK73PFenMASCNKikJ95jn5uIzhQxeQA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(39860400002)(366004)(396003)(136003)(346002)(316002)(16576012)(36756003)(31696002)(31686004)(54906003)(7416002)(107886003)(38100700002)(4326008)(186003)(36916002)(5660300002)(8676002)(8936002)(16526019)(66946007)(2616005)(44832011)(66556008)(2906002)(53546011)(6916009)(86362001)(15650500001)(478600001)(956004)(66476007)(6486002)(83380400001)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?THY3SXRCSXRMSVliYmZ1NVZFdmpTR0pQYmNhTGVvQ1hvaE5vT2VBeHFmZWY1?=
 =?utf-8?B?S0VTV1pkTGZKUGZyUkZOZWhDWVc1YTUvaTZoazRoWW1wQWlvdytZb1pvbmt2?=
 =?utf-8?B?d0w5dXFDRUE5alNES0czOGQySkNoVGV0N3pXQWRQaGJXbzBtU0NkVm5Xd2Qr?=
 =?utf-8?B?UGMvVyszQXJEcHRVSW5sNktCNUczZlFQNUU5OEQyNldIQXZXTUxPTS9pejZV?=
 =?utf-8?B?NmhPRWduM0xFMlZUVUFxbm55UUJoUXpXRkFSZHpEbC9vTzRDZFlxVEZ0dlUx?=
 =?utf-8?B?VkdnN21oMHp3US9TUEV5LzNOdDdKNFBMZUloVGE0dGJrS21NNmpMUlhjZ2NJ?=
 =?utf-8?B?TzZHZ1gxR05laU5GQXdoLzRVVDdCaWZQZDY2ZlRzREc5RzVGRSt4R0tZeGU3?=
 =?utf-8?B?WW5CYVRGbVA5OGxncExHZnlWc05tSE5Zd2VZdFJSaVNXSzhHNzdvREFJenRo?=
 =?utf-8?B?STNWTTBwTVpyWTJUaHpxVkZNNElIRUk3NXF0NXgzK013MmhDc21XSXd4YzJI?=
 =?utf-8?B?Ym9uM3hDNWZMWjYzV0lYem5oNVNUMW5tN0FtZTlVbDRxVW84ZmlLMndHZ1lH?=
 =?utf-8?B?LzlmN3NDSERvV2FSNU11dGV6MFNGdk5TWWhjVUpNbUYwdEVWS0QxSG44bVJV?=
 =?utf-8?B?U214aitSdW5FbGY0c0VzSWRDaWZvV0hzQ0VKV3gyN2RNNm91WUdSSXBVVStU?=
 =?utf-8?B?dmltaEpLWUtITFIxczU3UWs0MVFsZ0xwZnhZd1VIVlhxcDQ1NDdZQ0R3bGFw?=
 =?utf-8?B?c0R1eTF2enFIWHV3WCtwSzFoTG54RnU2ZDR5VWV0bmgyYVJNMnlZbW5XWGJ0?=
 =?utf-8?B?RTFZZ0VwUVZYRnhZdUk4Y1ZXSU5hRk9pczRUTHZIZjYxTUx2UVVKaTA0U2Zv?=
 =?utf-8?B?c3NoS05lRnYwbUlBZy9IOXZnM1psODNnTFhySERuZUpMem92VjVqbHYvVDM1?=
 =?utf-8?B?c0FBTFRHVDk4ZnZQRnY0b0ZhVnVwR3RZRDdlWDZVYngrOGFsaWFTTnFSL0tY?=
 =?utf-8?B?RXE4UU41RmsvWWxtSHJLZXVHUFpzVUpoWm9PL0ZMaEVSTUcrZjFLQ0VndWFY?=
 =?utf-8?B?eVdTL0grZkNzZHRBUkVpT3phSncxYjdGYkhFT3ZRcVVTa0hQNmI2Q2E1U0hJ?=
 =?utf-8?B?SXZKNTBteHlGN2N2SXhiYWc1akZrM3dLRGRxaUVhQkdXNFR4ZUpWeW9ySnkx?=
 =?utf-8?B?aHVTSVdYYVpKWmNGdUNnUHZ6RmljZWV6ekpvVmNyTHhYN001cW9yMnYxUmpW?=
 =?utf-8?B?QXVVSnVaWDNSbUxNY2xMRzJCWXBIZXpsZDZ1aE1yOXF4OXZCMmlHbnY3em8z?=
 =?utf-8?B?OUlEdHUzY3JmUm5IMGtqa0IwMGpNUGpXU2cvNjFFOVliTnNsWFAvVGszS1pS?=
 =?utf-8?B?ZmhsQ2ltckFGTzdBTVJ0K3JYbE9UYjBJODk2NGowYWFSUThzem9NR01GT2tO?=
 =?utf-8?B?Q0Y2SGJYZk14MGFqSUJ4MGNUZEZFWFhUV0trQlErdG1hbVRmM0lwRXhwbWxP?=
 =?utf-8?B?NEVOK094NTVScVJzNS9RYlJidVJ5clJBeGhhNTVUUFFmV3VNZkRJL1hZMEpy?=
 =?utf-8?B?UjF0WUQ5VkZrQVNjakZWZ2lrbXNhNmlrMU1UcFJUSXdkcUsvdzRDcDFQSldD?=
 =?utf-8?B?VlhWcHJjWGJqZi8zQVEwNXlMWkN0d1hiY2hkY3FCSWNIOG5EWldRajcvMjg5?=
 =?utf-8?B?RGpmeXdWNHRrWkZLdldRLzBaWjFoblk0dEZTT1NyeFBzSmEzL3Vacmg4RGZT?=
 =?utf-8?Q?621bn9PpAUg45+vZg1E9YFuFC1SvVjYslOcBApw?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1fdd0d3-51e7-4398-4ae6-08d91c688df1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 14:56:04.1768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f2nmQB83EvHwS18+eSP5xwescpsXa7pVhCwiziMkUvyR2fddyk5r3rdo/GXydkc0xVCXzNJOTuXiEtpNq5c+vs1fbjyU++R/Ybzbh+quC/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2808
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9990
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210081
X-Proofpoint-GUID: Y_q-8_WwarD8tCyKS-_QEid_b-ytiVgx
X-Proofpoint-ORIG-GUID: Y_q-8_WwarD8tCyKS-_QEid_b-ytiVgx
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/20/2021 9:00 AM, Dr. David Alan Gilbert wrote:
> Hi Steven,
>   I'd like to split the discussion into reboot and restart,
> so I can make sure I understand them individually.
> 
> So reboot mode;
> Can you explain which parts of this series are needed for reboot mode;
> I've managed to do a kexec based reboot on qemu with the current qemu -
> albeit with no vfio devices, my current understanding is that for doing
> reboot with vfio we just need some way of getting migrate to send the
> metadata associated with vfio devices if the guest is in S3.
> 
> Is there something I'm missing and which you have in this series?

You are correct, this series has little special code for reboot mode, but it does allow
reboot and restart to be handled similarly, which simplifies the management layer because 
the same calls are performed for each mode. 

For vfio in reboot mode, prior to sending cprload, the manager sends the guest-suspend-ram
command to the qemu guest agent. This flushes requests and brings the guest device to a 
reset state, so there is no vfio metadata to save.  Reboot mode does not call vfio_cprsave.

There are a few unique patches to support reboot mode.  One is qemu_ram_volatile, which
is a sanity check that the writable ram blocks are backed by some form of shared memory.
Plus there are a few fragments in the "cpr" patch that handle the suspended state that
is induced by guest-suspend-ram.  See qemu_system_start_on_wake_request() and instances
of RUN_STATE_SUSPENDED in migration/cpr.c

- Steve

