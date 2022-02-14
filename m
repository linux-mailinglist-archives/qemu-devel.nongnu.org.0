Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2964B55FB
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 17:21:30 +0100 (CET)
Received: from localhost ([::1]:44204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJe6T-0000ih-83
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 11:21:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nJdb9-0002vc-DR
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:49:07 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:46514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1nJdb4-000825-Qy
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 10:49:07 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21EEL53u003692; 
 Mon, 14 Feb 2022 15:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=KVMKSYzlEZfmUJ7FkdjBxtlMHlxUcQNWmm235IJVLl4=;
 b=PoBIBEWgZdjyKkVBJSnirr8lW2RPv0y4Trvi2os4JaXlJguW2DXoNmIePinw9Q7Sv6eV
 v8HTTMrQlEIbQY3ReZZvcx0O+SiQCZVaM2rLiRJHUrzoGstPWF1rEGjBiq4OanHv9kam
 lTDXOTkQPrwaYIHLbIr1YpcyV1Yq4n/D9j7rmjdEyJNsaYZjUFvcyNC73RFMKILzMNw6
 Obnj6Gv+u36oip0c5bz4eLyUxNzKMc6n3V00mrCVpzrYK9MaXYERKJj4hYRHaYqvkG1x
 W1fT7L5dL2hsRSPEVCqLsLkJNzDzCJZBN+Ghjm+8+g4Y+RIkUoRxJCOClKVUgYdk25PY Ug== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3e63ad4uth-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 15:48:55 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21EFkPc0048113;
 Mon, 14 Feb 2022 15:48:54 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by aserp3030.oracle.com with ESMTP id 3e62xdacru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 15:48:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ewm6bS49Wc6h2sEWpN3Gk7cpiAPhu1qM6VV2/dvtqQjcKuTxTRaxUzFTzz2Us+QzJkSAYbBx+sAAuYyt8Ek2Avp6EJtsipCNFw8kLrRRo/cBkue84YbAF4CNYeDhbKQ/PcCpg0lew8idyksQeSaM+nqwGHs2v7LBceVavJ1KVw6gs0ZIrydMNJkRjH87pBYwgLiHlrm18/fO03v8EMe6aXd9Z5chszR9joUTLsSTyp1eqlfXKDlFeejzGn0YJBWhCEZNQa/ZQTjSh65WL1Ofu38Zy4il6oU+IjRIa/vBigLevWrzyI4psJzh7/szrPOTVZ+oa9Q4doD8PoGZQXJgmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KVMKSYzlEZfmUJ7FkdjBxtlMHlxUcQNWmm235IJVLl4=;
 b=ZzsW9t49ICwzOqwT/KdzrAdjXWPZS9k9TSdSPyI6GZU1VijGLmfoT5vX/FF1IEw+CBrQOMDMtcazdyziEYrL4UyB7arVtu6Nitd96UptzgQDQpiTUVxA6mecM5M6W+ueqB8/hsvuKLmNu9AB1nwUrIpo6K8JcHCMslevVl2LSDf8p8FK/kSgecC6ya399/XiRaxRIovLCcv93qte++hxLhtlbI0YEgZfLEgmFCfSdJDY+NL/BMWK2QGInd13AjvfyoYPhbUSqcJR/W2VPbvFgnW9OmAXMVWG21kAUEj8z7N3UwqVBCd0t2rOdSqYLIUE7/HzR1IbBb1iKHyPJb9YJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KVMKSYzlEZfmUJ7FkdjBxtlMHlxUcQNWmm235IJVLl4=;
 b=Rm/gf+bMb0NaufijAY1Ygh4BcrtfudTIMTaSwzxOurliJj2rUwd8/WI9Cjr7u8rdXGaJDKqh3jPxcwgCSld5/TMAR/qR3sFQxDhGSHRxLg2vaI2YAuTF4lrvPjvYQ3wLD9FPA14FE/UOmjtzdc6dMyE3l0nPJI96noAdcTV97cA=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CY4PR10MB1909.namprd10.prod.outlook.com (2603:10b6:903:11f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Mon, 14 Feb
 2022 15:48:52 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::4910:964a:4156:242a%5]) with mapi id 15.20.4975.019; Mon, 14 Feb 2022
 15:48:52 +0000
Message-ID: <341a71b7-ba4b-7ee0-38cf-a4720c08bc24@oracle.com>
Date: Mon, 14 Feb 2022 15:48:44 +0000
Subject: Re: [PATCH RFCv2 3/4] i386/pc: warn if phys-bits is too low
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
References: <20220207202422.31582-1-joao.m.martins@oracle.com>
 <20220207202422.31582-4-joao.m.martins@oracle.com>
 <20220214160325.62b6436d@redhat.com>
 <f627c202-5281-affb-c439-ea394c3ab70a@oracle.com>
 <20220214164127.49a08ce1@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220214164127.49a08ce1@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0232.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:b::28) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ebf6762-7caf-42aa-b3bf-08d9efd17fc4
X-MS-TrafficTypeDiagnostic: CY4PR10MB1909:EE_
X-Microsoft-Antispam-PRVS: <CY4PR10MB19090680AF643F96B56CB887BB339@CY4PR10MB1909.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4CEksK/mGZ19uiiegG3hVFv+IxEj4bQtg4s+d0PAOvTwNl0gkppDybPCAiGP97ZikN1OdTLB6Oyc1yomyhcE0C1fXumyawFPvvvJ03AELjcZBT1DLSkf7/edjtDpkFsO01LsVoiinlXzDds2TywRtyhe43FJjTSLJCkrcQHBhaSpLe05LCG2tvsti0lQ3Xbi8qXbrTM7hT6kP4cOV5Di0AX4yFWoXiicwDKnyTbwp0cEY7pwWvGa76TiwlMbHasCV0SsC7oKTr6LFkOJw5rHp92pbTPMtX89r/GMMuaKy+7LHCzPSSq18BkJ+VrFZbaR/X4OOBOwdT7AfJrQJVJbeDF7MxkYq/NnO1Q0r8Y1uWDmKYVEZOnUVZaz7+XQVh6j8OIkdb4govyartvkN53PXhG86uZzC1SvOqLzdj7xdSkRamfdw/m48PtN59Sw7T9DuXz6n0ofj6cVes5gH8eHWraG0wgrtZ3EiL6k93z8/UmPj6ZPFUXVuqwGjAvT5ZKB0pI7Jx3WEZVjN7kobVYqXVyWj05bVLjFYfrM/cNDWYgYpEDvyYEcHkN2WZ1gEMMYkLp/MwvvcZEbHflXO0cfIUrsKMVpC80XSD9jSCOc3ajsXpCg+P7z2AELbfkBp3MoBPX/s4ZSaMswenRdqaBDYnTs4TM/4/1QyPUscLatNEnUIqLXK0yzQiTHyZzfUAtnrgpMgoLnvU6UAd0nQeTE4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(2906002)(6666004)(4326008)(8936002)(66946007)(8676002)(66556008)(66476007)(36756003)(6486002)(38100700002)(31686004)(6506007)(6512007)(6916009)(316002)(53546011)(54906003)(186003)(31696002)(2616005)(508600001)(5660300002)(26005)(86362001)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUlkelMveHdJMVA5dTVqdlZjdXhCV1dnNWdNeklrYllkbVQxNjI2a1ZKS2c4?=
 =?utf-8?B?ZHh0SThyZVFGSDZGNlNCNFY5N2tKdjJaT0ZTRFMybXk5eVNiZzBlMmVlOTlk?=
 =?utf-8?B?T2xhblJ4QzNJSU0wSk5EencyZ1Bta2pvWndzRE0xcnY4VTZ5LzJ0VFVyTHlP?=
 =?utf-8?B?TU9RbkFDSTFPdWZVYjdlQUJmTEtoY1BCNUpmUSszRUFjRmUrZmtISlZ5alJB?=
 =?utf-8?B?NnptUGtFVHlGUWxiTFJPbWoxZkVWWlF0dmd3aVlwVUdLNk10N2M4Z0xMUW5C?=
 =?utf-8?B?ektKN1FMd0M0V0RIZEs0S1ZLUGF2dEE4ZHI2MkQvUWZLeU5NSEtEWTUvYS9K?=
 =?utf-8?B?Z3FlWDN3bHQ1Qko5Smk1RlR0cFNlRHpUMlF5ZjZQRXpLTzRuZlNmY1FoRWFO?=
 =?utf-8?B?Rm81SVJ2Wkd3NjRLcVFGMTdaK0x0UUV4cVl0a2pLbHlrZ05pRTlTSGVoeWhP?=
 =?utf-8?B?cG9Eek0vNkpWUVFGOGxWUmlPVEJpYzBzeml2dUNybEFXNExJdk5vbEUxU0pQ?=
 =?utf-8?B?a2FMZW1ua1UrK3IrakRDMjJtdnU3WUEvSmRKb0k5aktYTTlmUGR0SFNHclVw?=
 =?utf-8?B?YnZMVHFuQVZsVmU4UE9BZk1ZNTZXWlA3eFJJSHppWGh4a2luNHdrU2hTU2Jy?=
 =?utf-8?B?V1JNS21WbTJPRDMweTFDSnpVYklMMHErOGlKUTNYanVlNXdiSFZvU1o3NXls?=
 =?utf-8?B?bStGUnM3R3R6WCtTSTJLOUtRT3EwVnFjSlJKTG15TkhHLzhnQ1ZpUDJKVHZO?=
 =?utf-8?B?Tm1CL0VvUXQ1bkJueHo5eGM3OHZTb3FqM1MvYk5LdGhkNE81WkIrQTV2YXJq?=
 =?utf-8?B?Z3MrNTMveUJLYlEyeTlSR3g3Y2dKU1lwZEVNczBIZlUwYlk3bkp6ZjhIdXJG?=
 =?utf-8?B?d1dDaTNBTUYwRnlaS3BhQ2pkN2REYit1SHhucEJMSW43dkVVL1F5R1hubFZG?=
 =?utf-8?B?S1pmKzdOYTZUaVd1ck0xcTZlbGt6TXg2ci9xbmpjcXNJTnNIdmdkRmFSbzJv?=
 =?utf-8?B?Z0pvTldxOG9sbkNZeGc2UExLa3I5Zmx0N0xCRmR3NUVNVjROQnlleVA5M3E4?=
 =?utf-8?B?ZjBXdXJ1SHY4ZWJUbnRHMm5ldEI2UmNWUm5scG9ZeHhEa0ZBci9wVm4wdHli?=
 =?utf-8?B?MExCMkJjMnE2c2ZCWHFnNkV2c0JuOU1HMnNyNmdXYVB3eDMrMjhYT2ZSK2l0?=
 =?utf-8?B?cFkxcStjS0lXUlQvcU9YRW9jWXBFNHJXRVc5akRuT1BEVFRyS012Sm8xOUFS?=
 =?utf-8?B?UHQwOHZNVGplcy9FczVVckxQWXovV1pLMHpNUm9qNUhpRlpTeTdnUU14MjJv?=
 =?utf-8?B?cTZ1SHRlMUJqcUZLQ0Qwd3VyV0ZScUdnOWhsMjdnS0hreWRZckNLOEdPZWJi?=
 =?utf-8?B?czVCVUdwejNkdzdYWmhrK1ZlR1YzcnAvRVAvUUpxYlZ6YlJveWZLUUFPNTVW?=
 =?utf-8?B?bkI4YzJlbC9OVCtCRXIzTU1Ta2FId09SQWVJSVZ6dGUyMEJZWTF1a1hYcC9v?=
 =?utf-8?B?WU81ekhTWlBvb09VNllLTTZKNUVFN3hQNWtjQnZoNGhpeHE5MWZlTktiRWFt?=
 =?utf-8?B?aGV1eXRqNXdmRG85UFROSVB2L2xIQ2JPV082V0VZVCtxcFVPdlRZWno4Ry9m?=
 =?utf-8?B?bTZBYTRjNCtVVUxMSi8rM3dCcUtjOFJyZFZVK1FTV2FiQWk3N0RGNVh2UXhq?=
 =?utf-8?B?V0pPMnZ6cUdZQXRjeVR6NFU1S3hpZjd5L1JSckpwMFR3czVhcFVISEd3aEt0?=
 =?utf-8?B?WjY2N1VHd0p0aGh6SWZtaTlkaGNvK1dYcDVxMnBwT2o5WnI4SlRIcjA5bnV6?=
 =?utf-8?B?SGIvaHIrV3oyNUtSWGFDTWZKZnIyUFRlYVlCZG1hL1RkUUJTLzNJWk5yOHBs?=
 =?utf-8?B?RXlQZmNVbkZIK1hQY04wcUZjMFJlUVFxVmc2UjdEeTFraWtWMDVZMlVSYUhP?=
 =?utf-8?B?VUFyb1dWNzBZdy9vcHBDdnRBVzhZbVJ6RndkZVoza2RtTlJoS3N2TmRMYWNO?=
 =?utf-8?B?SkxWRmxnMlE2NkttbzdoZ3F3czBQUFh0T0N5elFiVXlCT2hsZnlRckRXenpz?=
 =?utf-8?B?TG4vemlhUHBJMllCQ3RzaUpia2g0L2diOGlCOHJPWXpaTFFDeHAra3pjYnhj?=
 =?utf-8?B?U01SM0NnRXVJMFRuNHhIRHNTWmZ5OUFFSG1MOWloWGRhZk5xNjM2clNKMVlU?=
 =?utf-8?B?Uks2WU5xSURISXdQbEU5Q0RTOUJWaWdJeHRrYjZvN0p0YWNMeXg4ZVNVbndy?=
 =?utf-8?B?NlEvMXhZVHRkSnJkbkdzSmpKSDVnPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ebf6762-7caf-42aa-b3bf-08d9efd17fc4
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 15:48:52.4967 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HgoGKmPhTvy/eNvXjLZX4NDabxwzHOBcy6LR12+yZcmEoUJeaQeaRu1jWw8S7tJA+y1ZAmAFaelV081iKkujL8XJFO6G7jW1JNlkx/nVcks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR10MB1909
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10258
 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202140096
X-Proofpoint-GUID: 83X7mWeXvIz_P8LqTVve0KfzI1dnv3KX
X-Proofpoint-ORIG-GUID: 83X7mWeXvIz_P8LqTVve0KfzI1dnv3KX
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
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Daniel Jordan <daniel.m.jordan@oracle.com>,
 David Edmondson <david.edmondson@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Ani Sinha <ani@anisinha.ca>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/14/22 15:41, Igor Mammedov wrote:
> On Mon, 14 Feb 2022 15:18:43 +0000
> Joao Martins <joao.m.martins@oracle.com> wrote:
>> On 2/14/22 15:03, Igor Mammedov wrote:
>>> On Mon,  7 Feb 2022 20:24:21 +0000
>>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>>> index b060aedd38f3..f8712eb8427e 100644
>>>> --- a/hw/i386/pc.c
>>>> +++ b/hw/i386/pc.c
>>>> @@ -842,6 +842,7 @@ static void relocate_4g(MachineState *machine, PCMachineState *pcms)
>>>>      X86MachineState *x86ms = X86_MACHINE(pcms);
>>>>      ram_addr_t device_mem_size = 0;
>>>>      uint32_t eax, vendor[3];
>>>> +    hwaddr maxphysaddr;
>>>>  
>>>>      host_cpuid(0x0, 0, &eax, &vendor[0], &vendor[2], &vendor[1]);
>>>>      if (!IS_AMD_VENDOR(vendor)) {
>>>> @@ -858,6 +859,12 @@ static void relocate_4g(MachineState *machine, PCMachineState *pcms)
>>>>          return;
>>>>      }
>>>>  
>>>> +    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
>>>> +    if (maxphysaddr < AMD_ABOVE_1TB_START)
>>>> +        warn_report("Relocated RAM above 4G to start at %lu "
>>>> +                    "phys-bits too low (%u)",
>>>> +                    AMD_ABOVE_1TB_START, X86_CPU(first_cpu)->phys_bits);  
>>>
>>> perhaps this hunk belongs to the end of pc_memory_init(),
>>> it's not HT fixup specific at all?
>>>   
>> It is HT fixup related. Because we are relocating the whole above-4g-ram,
>> on what used to be enough with just 40 phys bits (default).
> 
> what if user starts QEMU with amount of RAM that won't fit into
> configured phys bits (whether it's default one or one that comes from host)
> and not on AMD host at that so no relocation happens but we still have
> broken configuration. What matters here is the end address that might
> be used by guest (pci64_bit hole end) is reachable.
> 
> That's why I suggested to make it generic check instead of AMD specific one. 
>  
OK, I see.

If I'm being dense, that would require replacing AMD_ABOVE_1TB_START in the
comparison to something that computes the max used addr -- Let me try that then.

