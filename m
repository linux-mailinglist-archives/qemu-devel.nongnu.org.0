Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1557F570712
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 17:28:16 +0200 (CEST)
Received: from localhost ([::1]:48392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAvKY-0004gg-Vs
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 11:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oAuqV-0003po-R8
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 10:57:11 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:58052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oAuqS-0003Xb-Ii
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 10:57:11 -0400
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BDoSC7019414;
 Mon, 11 Jul 2022 14:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=ZEYzgWnEjMwBuyqA0rvHRCazeXo0RHT0zFJp3xu38+Y=;
 b=I3WPuqOfQqiSFUA8p1dwvJsBY+mvOMxbjrIXMHBYb+sqwHXkT8ZFLRWCh87SW4Cvrs82
 y8+kyUhLiOpvjbj2MBSGVi8leisbjDmjfmUYIOTp85APxysptk0Cxf18zwmCiX+MxxsU
 oyzVlp8OeriYfBy1UzNNDbJl2pwHWgKbBZ3v90F12GDy44fmg5vqv6PBAxO5+cnasWL0
 61g55Kfzk61wSynRbtf5nffxi8LwcdYADC05e3Ow6qfjsCfNyQEOH4qGK0mp9aoI0XiZ
 AYj9GZ6fc6AQJU0JvTei4aPCfKYpcqZI12nEZr8A3vN2/DV5qLkg18KbZZf0Dba5GXnZ dA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h71xrbqpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jul 2022 14:57:04 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26BEoiOp015007; Mon, 11 Jul 2022 14:57:03 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h704245up-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jul 2022 14:57:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTeVgBzM1E+Q26v5UKx0geI37B0ZOGlg2YUF0IEym0IgTxKpjdKLz7wyRt+LrEBTVXeS0GQnRs6yABHF+pO/VkMldzZwg+VXG8BuxZ4exNGVWFNyvS7ReUF4PHvk35Yi+i53Bb9wCVpLb9cWp0Zh0TE+OTbzDOByYO16h3SkOyNb3gCjriTcMeqGm9+MuRwV/MlWvOJmKI7B9NKG5+I3tGNKYw5NV8sk2pruZGFQkmqXHaJDw3c6zNKm5gEcArWpDOZxxLuvmPZT9XrW7TLmY3cf5TfmOoVg3KrEKecSaS2Wo6tp0nItGttKIWfpEEonUr2J/NMmUnpBt1Th68H7KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZEYzgWnEjMwBuyqA0rvHRCazeXo0RHT0zFJp3xu38+Y=;
 b=nFWSA5w+1/+zwG7dvDNFq42KdHF5LGr+4AROEsoCPGiLJXAZ08wVs79bpqbBByX70avFhjcwj5VXpbvjRjd53QrjAOsAUfoCuW/NbNs04hLDAh+y4NCWkL9keOznPdEkTrfJHHlmIdvCciXUIeevAJ357T00sNSs8w7gC2py6wc76GHHJWMlN7iSbz1puE/4A17piIN9C8r+3wf+IdsmL/sw7aM2zKIiITLrMGxL24r4WqvhgvK1QLD7LQn9dF1Dz3fKNqEBasyQS+rvsX+qFd6MidNOGO0Jaa11g5m61P56h81mhdE8RsJhYvdyNf80uM6eFcj0BqDTdmoc6KRwtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZEYzgWnEjMwBuyqA0rvHRCazeXo0RHT0zFJp3xu38+Y=;
 b=mVFFSg9PegOCJd2QTwY0cNtaQb1+dOt2kbTNDt3mB/ADMJnNFHoUR5rurDns3kFcOHzj+NXe28VvE2P9eNgeEV/48nmb3ugeR+2Xx321q9g/I9z5F+WMOf/o8mIg6DdIbASkHNfHA+AbQ5nMijf1muqfYdHu6qSzP0hghkqT8Ro=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by BY5PR10MB3939.namprd10.prod.outlook.com (2603:10b6:a03:1f7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 14:57:00 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 14:57:00 +0000
Message-ID: <2a8be468-b867-b9f5-e29e-8bc9e1b9b922@oracle.com>
Date: Mon, 11 Jul 2022 15:56:53 +0100
Subject: Re: [PATCH v6 10/10] i386/pc: restrict AMD only enforcing of valid
 IOVAs to new machine type
Content-Language: en-US
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
References: <20220701161014.3850-1-joao.m.martins@oracle.com>
 <20220701161014.3850-11-joao.m.martins@oracle.com>
 <20220711150301.0909b023@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220711150301.0909b023@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0306.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::30) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2647679-ce2f-4a98-8d25-08da634d9b5b
X-MS-TrafficTypeDiagnostic: BY5PR10MB3939:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6dpDbCj+y0jSHYiLYhrpnUfsgmBlE9fKPrr48pZLmkTuUeoDAarvUkGmzwbTdvauptJS+vENF7oANcDXR1h+dG4woYdGggL2TB4zDW9E1rzlCOZiWV7B14Qpb1RT9V/i0D7MeInZz8GdirsJkll8ksHZIXg89LwXIiGNa2UIx6C+9/GZdvLwhedRv2rN2wLGGXZfZ7h1aDMbGdthEHyXmgxt9xsX2ZD6FM64/LkRBrt4w7MkOHmhsAtvScG/qwTUNV3i/h4mKSDV6rjLqOF52k7ZCkZxzEcs6sWNTsaqibLfZfjAYG2UAzK3uVfBRCT1mLk3daI/Fqnc3SMpbNE/KOGtezNv7TYYLBjMztoBhuaaKocoIYkW4pojKldQR5x/7gnBqgBC6o0o4WC41P4r/ni24+X5jAJbcsr9bdqG/dzKmQo5PBLTkccrTWIkdH5i8Kw4wlGCaolqiPHvq0u62jd06lLSzXtLWJvYrLhTZsJIafTNK/Cy351CHodUVPjWOZTFEX/XTXHA2719TZtdiu5f2+T50VsZLfgtdxrIKnkYSFq3d92B6a680TAU/dguX65A/N3nax+uzsvqF/K7pNJiA9S4hcqfiI8WE/dKvTWKHGGZZtFBifIXDwKBpnWS1zGVQrfcW7VqC/nCb1X8TiRxGdSQd167qpNKRWiAJmlvm+IeDmwyy4Nyx7Po7VnpA2JZ6hHR2gvwy9hUBtT+SgV7sC9dCEY1mZ2mWvFTZx+hmNJR05YiN3zUUpWUYHklugM9lXXLIwZ9ZaNjHRK5Q2GQRe5tQNrvNKv5DkR5esKjdFzFiHZVfo2ohVY7Zjrc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(39860400002)(366004)(136003)(376002)(396003)(66476007)(8676002)(66946007)(4326008)(66556008)(8936002)(478600001)(186003)(26005)(6506007)(53546011)(6512007)(2616005)(6666004)(83380400001)(38100700002)(41300700001)(6486002)(316002)(6916009)(2906002)(31696002)(7416002)(31686004)(86362001)(36756003)(54906003)(5660300002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVZxSnpsWWx5ZFg2VklUY3lQMVE5Qmd1MkR2aVhlbzZyOVNxeVlndWo4VkpE?=
 =?utf-8?B?anZTVEtqTVYzNUJEWjRpYkFoM21nQXRHTDhkOFJ0bjBSNjdLclJnSEc4RG1Q?=
 =?utf-8?B?UXdIVlJ2M0txcFRTNzNZaTJnR3NWK0FpSjU1QVA2N0JaRTVzcEhoaTRCYXlR?=
 =?utf-8?B?aGpmemZqbFhDUDd0b3hBbXZxYjg4ZStwSGplSkV0VHVHWVVYK1hCZmVFblFq?=
 =?utf-8?B?QTVSTHVlV3dEQzJSNGJHRVFzRjgxTmprVTgzQUZUWDVsUkJoam5PTXRvRmg5?=
 =?utf-8?B?cXMybGtFTHBPTGkvVTVXbGhwTjV0QmNWQVRkWG1EblJxY0Fkb1p4czVVQVJF?=
 =?utf-8?B?QXQraTRIaDlnM1B3Q25WTFhncVdVRnZ2SWxKMy9FSWV4QnJPUEU3UDZTRlZK?=
 =?utf-8?B?WktTaDVFak55U1k3dGxzRzBNZ1VnNWduQzdROHhybnBvdThYeDdYZkhJd01s?=
 =?utf-8?B?b3ZZYm1WMHJWaEZma3BVYk5xdUwwQ3o4cUNUSjBNTmJkeEZWbndXcXpPY1I3?=
 =?utf-8?B?U20zSU9wYVM1TUJpQVpwbjgxTCtCRFFidTZKQnFJNkhwK0sxalFqVWYydDhi?=
 =?utf-8?B?REdNTVdxdm5qMzVkeEtuWlhmTHFNOUpMOFdlTng0VC85Sjh3VCttT0lPSnFY?=
 =?utf-8?B?MzRNdVYvRmtyOHYydUVOUzZHbVRXT3FXdWY4bkpLVnZweU1TTXVRVzlCcFlp?=
 =?utf-8?B?YmJNQ0dXeStwQ3VGZklta1NZV3RVejdvSG9wS1hsQUc1RlJKYmNra3F3ZXgy?=
 =?utf-8?B?SXJLMnlGUDNoNGVKTTlEaUxCd3BFOWFzZytMdkZUMW5WazFzTjI3SWJCWnhL?=
 =?utf-8?B?aVdYVnkwek1KdFFRbDZlcjl0WUZMN0UyeGEzaUJrOHZuTkJ4TGk3MnNwZkJr?=
 =?utf-8?B?ZGcyZFBGam9MbEkrYUQzb1dGTmV4ZThMTnNVYlNHdjVvVVVaYUp6ZGIyZVU5?=
 =?utf-8?B?SUFwcHFGaDlMSGRhZ282dTFaQVhoMTlxTHFhYnlWN2pwd1A2N1BXRDZsRGxz?=
 =?utf-8?B?U3lMNC9wM29mdytZb1FzWjhVRFIyNnV1SzVlTFdCSlArNUp5bEN3T1ZkOG1C?=
 =?utf-8?B?UTV2eHVKNzZ4Nkp6MUFMRmtGTEd3NW40Qk9MRUtNTWxzbnJQVjJEMHVtaVhr?=
 =?utf-8?B?OGlURS9TaWpkWDhSWi9jQVFpUTladEFTYlI0WWpnVDVMNVhkb24wTlFqTVU2?=
 =?utf-8?B?djRtdzM2NDVFZjc0UkVsZU53K2o1L2xWWGlPRkRLL080eWlLN21abG5Zbkp6?=
 =?utf-8?B?dmUyVzdSV3A3cUkwcyt1eERBakt5SDFIK2J0NGhQQVh2ajNMUTFPL3lET0xs?=
 =?utf-8?B?eGJEdFk5a1ZJV0JUaDBSS1duK3BNUlR4d0R3d2FiV3dQeWNmSFZJY0xPVVdD?=
 =?utf-8?B?TGJTS3paWm96YUFNU1RiUUxNL0o4ZWkvZGgyOFUwVVE2SE4zcWVsekRpN2NQ?=
 =?utf-8?B?WkU5bWRlNDRBTVExdW1JeThCS2hEeUF4M2ZHeTZjSVY4R0x1Smw4UnJ3UEJz?=
 =?utf-8?B?K0tuc0RHY0dYbjFwUHNoT2JQeWMvTEFJMC9adHZrUDAxRUdZdnhub2w2c1g3?=
 =?utf-8?B?MTRqeXFLRldMc1kvTnNPdEZpK1FRYnQvUGdBQXAveXRwZlhSV3RsYXVLYzZP?=
 =?utf-8?B?REtqQ3BYc2lzaE00bWdKTjZabnlicER3U0xKN0FvdThXd3ZteEJNaWdUcS9N?=
 =?utf-8?B?UjV0NDlWRVlSUWdYTmdYcnJVRXRvaUlVaXNQS0ZKbFQ4T3pFQTI0NVkwYlNr?=
 =?utf-8?B?bmxDeGIvWDN2MXAzcEJ1d2ltblBjejlGL1Rhdlk2Y3JxMC9DcERieWxQano4?=
 =?utf-8?B?bHZCOGNURHlDaHpGeWZLTTJ3cFE1WVozTFlKSkpIYTFiQ3VmQ2JmTm9sZmww?=
 =?utf-8?B?OW9SQ1hERWQyWUl2K09zeTh6a01XTzhFTDYyaTgyY0lEdnp5VW9qeWJxUlp6?=
 =?utf-8?B?MW8xbGNRaFZCOXpOMlV0TitsNE9MQjlrTCsvV29CVWlnM0F1R0lWVEdhYWsw?=
 =?utf-8?B?NE8wZEhvRW5tTHdjeWNoWER6SFRoZG1pWDl3ZXRLVVZRUVJ3VFhTYS9vVjlW?=
 =?utf-8?B?dHM4WVQ5eHk3ZTdlTG8xLzBHRUN2Zm1lRWV5ZkFoYkpoOXZzSGhpV3FQSnJV?=
 =?utf-8?B?b2Y4K1pOdEltQjRpSGZ1Nk1QUVBtSGZuOFpUazRxL0dQNURuOTI4NEV2RzNC?=
 =?utf-8?B?SUE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2647679-ce2f-4a98-8d25-08da634d9b5b
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 14:57:00.4570 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyaOMI/1wOlhsaP8gUFrBGfyfTY+TrTZT96gYhLvvMGodbKBzetfnnFXXpTJHqk/nv4slBGWklKFal9RvIwKcjUREHuiWhh6e7dCghJpOU0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3939
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-11_19:2022-07-08,
 2022-07-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207110063
X-Proofpoint-GUID: UoKA09MIzz11YAGrn7a7a8n7uhPuogVu
X-Proofpoint-ORIG-GUID: UoKA09MIzz11YAGrn7a7a8n7uhPuogVu
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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

On 7/11/22 14:03, Igor Mammedov wrote:
> On Fri,  1 Jul 2022 17:10:14 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> The added enforcing is only relevant in the case of AMD where the
>> range right before the 1TB is restricted and cannot be DMA mapped
>> by the kernel consequently leading to IOMMU INVALID_DEVICE_REQUEST
>> or possibly other kinds of IOMMU events in the AMD IOMMU.
>>
>> Although, there's a case where it may make sense to disable the
>> IOVA relocation/validation when migrating from a
>> non-valid-IOVA-aware qemu to one that supports it.
>>
>> Relocating RAM regions to after the 1Tb hole has consequences for
>> guest ABI because we are changing the memory mapping, so make
>> sure that only new machine enforce but not older ones.
>>
>> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
>> ---
>>  hw/i386/pc.c         | 6 ++++--
>>  hw/i386/pc_piix.c    | 2 ++
>>  hw/i386/pc_q35.c     | 2 ++
>>  include/hw/i386/pc.h | 1 +
>>  4 files changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index 07025b510540..f99e16a5db4b 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -1013,9 +1013,10 @@ void pc_memory_init(PCMachineState *pcms,
>>      /*
>>       * The HyperTransport range close to the 1T boundary is unique to AMD
>>       * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
>> -     * to above 1T to AMD vCPUs only.
>> +     * to above 1T to AMD vCPUs only. @enforce_valid_iova is only false in
>> +     * older machine types (<= 7.0) for compatibility purposes.
>>       */
>> -    if (IS_AMD_CPU(&cpu->env)) {
>> +    if (IS_AMD_CPU(&cpu->env) && pcmc->enforce_valid_iova) {
>>          pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);
>>  
>>          /*
>> @@ -1950,6 +1951,7 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>>      pcmc->has_reserved_memory = true;
>>      pcmc->kvmclock_enabled = true;
>>      pcmc->enforce_aligned_dimm = true;
>> +    pcmc->enforce_valid_iova = true;
>>      /* BIOS ACPI tables: 128K. Other BIOS datastructures: less than 4K reported
>>       * to be used at the moment, 32K should be enough for a while.  */
>>      pcmc->acpi_data_size = 0x20000 + 0x8000;
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index f3c726e42400..504ddd0deece 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -444,9 +444,11 @@ DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
>>  
>>  static void pc_i440fx_7_0_machine_options(MachineClass *m)
>>  {
>> +    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>>      pc_i440fx_7_1_machine_options(m);
>>      m->alias = NULL;
>>      m->is_default = false;
>> +    pcmc->enforce_valid_iova = false;
>>      compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>>      compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
>>  }
>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> index 5a4a737fe203..4b747c59c19a 100644
>> --- a/hw/i386/pc_q35.c
>> +++ b/hw/i386/pc_q35.c
>> @@ -381,8 +381,10 @@ DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
>>  
>>  static void pc_q35_7_0_machine_options(MachineClass *m)
>>  {
>> +    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>>      pc_q35_7_1_machine_options(m);
>>      m->alias = NULL;
>> +    pcmc->enforce_valid_iova = false;
>>      compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>>      compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
>>  }
>> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
>> index 568c226d3034..3a873ff69499 100644
>> --- a/include/hw/i386/pc.h
>> +++ b/include/hw/i386/pc.h
>> @@ -118,6 +118,7 @@ struct PCMachineClass {
>>      bool has_reserved_memory;
>>      bool enforce_aligned_dimm;
>>      bool broken_reserved_end;
>> +    bool enforce_valid_iova;
> 
> maybe
> s/enforce_valid_iova/enforce_amd_1tb_hole/
> to be less ambiguous
> 
That's much better, let me change the name into that.

> otherwise looks good to me so
> Acked-by: Igor Mammedov <imammedo@redhat.com>
> 
Thanks!

