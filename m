Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 284465706C9
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 17:17:05 +0200 (CEST)
Received: from localhost ([::1]:55104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAv9k-00086K-1v
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 11:17:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oAult-0002lT-0g
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 10:52:25 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:59104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oAulp-0002Tf-MR
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 10:52:24 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BDodSc004693;
 Mon, 11 Jul 2022 14:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=0EUYnqH38yv5VoEbVR0/sXmRdU/rt0w8u0qpDyZQnuk=;
 b=LldhJ2Lod3PeoR26TgpMLKJetEQEqR9h7o05An7jJy1HYwgKUnOsHLBWokhOO3axeouu
 qDnFpuvUfVaZn43Npupb5JU++3b9r5SzPiBEc6Y+YS/ioUr8MntEwsFYeIX8Klf5NTzr
 jp+pOp6KEL/k7e5sVi3EOAwfHwG3MkXCvp4OlvwnAyiMnKbV8PZFk7tgVHdWWI11BeVu
 bN8evj67ORBDyeLWkOszqqIjPlwJ+AmcTRRNh7/tZu4v9RluGLJ3UzQdRCxJbz/FSQLW
 1ieyQDagzORKhv3qTNGJN9qPlrknI//+/8ZlshZCUfEiD07q7hKroEsMeSvFSH2lSpNj kA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h727sbs9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jul 2022 14:52:12 +0000
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26BEpWbC024427; Mon, 11 Jul 2022 14:52:12 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h70428wkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jul 2022 14:52:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RV305vGkkLzvtbaBBIxiE8DZ4x3CRHt7TamWn9wjHehL4FyeKDOdh9HqSoRPDYUVDA+ACjSxqBKtVAGx5P3y3TdUKdti3dJWzoPwWGnBpyJ4lFkq51oYRwpQZNz7UJckwVKDiy+zPbgi4Lp9axPIZrprv2kyakViiVC6O8XCd7a4qHw2qRTja2RDQGFFuFxCTuNtOJNfZSR8W6v+DZ1ofC/dsaflggdCl/0f0va3/i6PRoY+lkeCfI9agKyk8rz0JfbZz6gJuzsFIqzOp/bfEZyXiaaKhMoSlXwkllVPqcchmceEyZLhjq9Qbr0kbqbJ+chUeYpFOpJSzsk98t3PkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0EUYnqH38yv5VoEbVR0/sXmRdU/rt0w8u0qpDyZQnuk=;
 b=EpCI0IPbztNXS9FGj7utxV0tbkdVASwYjnlEibXf/MyW0CCON2WwqDPcQclQVPM1VKrNSW6gjgHJk6ov9huSuVrpptHwhTfnFH+yrQf0sk8XdXr+XBekNY0HbSkTX7EsIhEV4qgqni89W2xVAw95DDVvS95eqsPxU7BAcwRcVv4HTuCJxBa82MezAOTlmA7CSkxfnitJdUaZdUTnOnhUXxBXvyMOuUXRFF8AvRbmk8TKaMqsowPPup3s6d6dEKt2B+/SLPBK33N8R6jXGPXSbJkS6hOzqwBy2/1wIfCVGEzsDQDTroHtDqjinjWwZHOK/TxooZcDLIkntGYEUP15gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0EUYnqH38yv5VoEbVR0/sXmRdU/rt0w8u0qpDyZQnuk=;
 b=jxpjS17qv0mu6jhh7PbkzALQoEmHyWP6Tb45qQxmDLf5ZmsV23aEbvopaqEnXM/74v2es6lKiJ2jn2bJRImvkmJQtKNT9HwAVcJZsYjNQ8al540IaYzEN7NKCk8ZkR/Kt1mNJWEtHKhQFAz1HUJnWXQVrFrG9kb0QRV8KtWvUIg=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CY5PR10MB6071.namprd10.prod.outlook.com (2603:10b6:930:39::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.20; Mon, 11 Jul
 2022 14:52:08 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 14:52:08 +0000
Message-ID: <5179013f-a2b6-b5a4-a509-42657dbde25a@oracle.com>
Date: Mon, 11 Jul 2022 15:52:02 +0100
Subject: Re: [PATCH v6 09/10] i386/pc: relocate 4g start to 1T where applicable
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
 <20220701161014.3850-10-joao.m.martins@oracle.com>
 <20220711145627.2c318ba6@redhat.com>
From: Joao Martins <joao.m.martins@oracle.com>
In-Reply-To: <20220711145627.2c318ba6@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0039.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::8) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f91945e-c63d-4d1a-1983-08da634cedde
X-MS-TrafficTypeDiagnostic: CY5PR10MB6071:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eqvP6Lmvs05Zmu9zHHnAO3Gkw+T9gBNkDyYi4/Vs03Xf+3zWgBIckVikp2onRft5caTa1oiSSnyk61vsvJVBU2c1e3v4BsPFES5oUCZ65iXqrC+n8xEHC+jy8L8DY2Ma0vloS7D1ZuQARF/rksZRb3Iftty93pnDvu7F0VEGgUjRfw0CwlPWw9n5DJwqWdzVG0HWdkW2JwB2tHChVC7heHFiX9Fn4B8zppKv9w5e3izusRE+OUkSwcITGE2xWmqiqu8xLCdGmNAiPvsNv+kLi0S5JOfCgqEViXOQAYG9YQQC7bUDkx+bepYyevk73s81Pbu+9P/RjCsqZUM4z6PnIoS6hZVE9tipB5llEWjw5zWGB4/O5oMeDyYiIfyiQ++GCbn0xRZBXsdisK6Xs1xmznMe+G5cjau+RIEN4bVNCIwFXByE2zWBINuX5oK3NGOCuTjotY9SBMmArag4NZ2yfzBpn/yEy/icvbCG8dVhoeySZi2S5qtx1Mol3v5ONCDvGhMcrotHEZ9B0PSMYXYVNhR6WwzZ+G1UHXnTa2mVdCx6CDyyhAkjUMzYjW6JQnPOpI7N1VHEB0/OlJ/P8QX1hAGv1z0HD601U6E/RwIHDiK7TyJoBodwU59d2P3sEwHnPgi9Y23SHZkPW0YdZ5fAwD967iqcxWyLvLrVbLZlvngm9VtjfXy+M4pZkzi7ZEKdYUQtmGmA2vtPUnWsmHGHwqaJ/G+Tw0ZaoaHycd5El/WnLqgEuPt4fs99XH9VSykIIvrpTxHrdGGWwX5p2ubbDBTQNxBgVroaHw2WKBU7l/Y0+OTFMe+ridJHTJ0clGt2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(396003)(136003)(376002)(39860400002)(6512007)(83380400001)(8936002)(53546011)(186003)(4326008)(6666004)(38100700002)(2906002)(2616005)(26005)(6506007)(478600001)(5660300002)(7416002)(6486002)(8676002)(31696002)(41300700001)(66556008)(36756003)(66946007)(66476007)(31686004)(6916009)(86362001)(54906003)(316002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHdjSWFPekNoVlBXYk1mQUxpeEpPcGxhQktFeHNaTVFxTlYyRml6Uy9WNUxH?=
 =?utf-8?B?eGZpQXRDd1Y3UG9YMTAwQXBub0FkSC9LT05Wemc1V1FybTU2dm05bFFZaXlD?=
 =?utf-8?B?LzF3MlpxbWluYWtHVzJLTE9vNFI4Rzg4ZjFnd0VYdlZneFlyWXc0MmdzQ3BG?=
 =?utf-8?B?blNHZlpKMHY5OTZjdjJrazdmWVJCZGxaa1RCaW4xbkJhc3F3MTV5OWE3VWdX?=
 =?utf-8?B?TENKZEdqajM1cFZiMUQ5WDhsaGNrR013QXBYUHpKT1VBcnlTamZ1ME5iYVM0?=
 =?utf-8?B?RHRwbTNzZGVtZ0oyUDVRQWVlTEE0bG5IU1ZYTENPanNBaUk1UWwvb01GS3dU?=
 =?utf-8?B?S3BkTWV6T0FqYmJBRUNXTDNkVUtCSWFlZ1JWWGh2eGZoaHA4d25VNzc2dytv?=
 =?utf-8?B?eFE2LzFkdzBLMWxNYnAxUkl4amE5TTlXSCtlTjdkNUpnU25EQ2tOZUpRQkNT?=
 =?utf-8?B?SlAwa3VSeFFoRXVDVzNMdmFjMGVaOTUwVHBrajFEK3J5WDI3NWhYR1B1MDVu?=
 =?utf-8?B?YmdOQ1l3amlLbXZ0ZVgrVGxDMU9CZ2hrVjhwZjNPUDdUK2t3bDhXcXBic3BV?=
 =?utf-8?B?M3NZZlJpc3pmTkczaUFUSEJQRXBxSWQ3amw4NWVabFAraXphZHJuWldXYUhE?=
 =?utf-8?B?Qk04WlFQZmM3RFVLTk9mWUxnM2JlVlkwOTM1eXVnSWRPc21QenA4V2dxZVRQ?=
 =?utf-8?B?MVBGV0ZtaVlqajJxeU85dWpKV1M0K09mUVpET3NkWFdnWTdDZVA4ZkllRWVu?=
 =?utf-8?B?RHdwMWVXUGREUEVJWlV5bEVIMkxLdHBab0JsTFdXM0tKZ2NYVldWZW53SFFm?=
 =?utf-8?B?NHVIMS9JaHNoazdya1NzWkEvaFkxMnZtQ0FVWlZFR1J3dDRSakk4czVwaFk3?=
 =?utf-8?B?eGc5S1JTQnJOb0M0cllmdkNoQ2Z1b2RjMm0weDA0T2N6V3p5QUtMRzZwaUJz?=
 =?utf-8?B?ZFdkMUtBYmV1RVRwaFhhalNGYzVjemRua05ZeVZtenlHUkNoYW40NTg0RnpF?=
 =?utf-8?B?UFlJM0g0QkJVKzRMWW5TYzArdjFQT1VvMExLVHRCVWtuSDE4KzE0cUJuL3ZP?=
 =?utf-8?B?TVVTSXpNSmNXVXhvOXdqY1pVNmhFZWhlelJjVCs1ZU1BOUNTd3JpM0R1aFRn?=
 =?utf-8?B?T3ZkSDY1bG8vTnNEcFNFcFI4cmJTb1dxOEx6S3Q3VFpTRi9xWU81TkQvN1o0?=
 =?utf-8?B?a0lFR3luUXkvMmg4SElEWXdDbkRzNkFjcDRnT1MzcnN3Sk13RTR5RldNL2dO?=
 =?utf-8?B?UDFyUTErUFFwaEcrNFZOend3Z2ZMWlljS2lEU1JRT1FFRWNoK2NHcVI2YlQ1?=
 =?utf-8?B?T2doRDIra3lpZkFaMFlyUk5Ycm1Ea2VsakNtY1kyZGxJNW5LTXJJRmRWK1pD?=
 =?utf-8?B?OG5JUml4SnJ6Y0xsL1RFMFR6dEoyelMweFVoTE9XcS9xTTZKVGYrV2NCV2g1?=
 =?utf-8?B?UlZyZFhRQnlsY1QzbURuektvNjNxRUpzRHoxM05SMkhud3NMTTJnSWRxZldo?=
 =?utf-8?B?SWJQSEpUaG1BemdVejdVZFRYcmdSS252algvVllRN3NQR1FQamlMdWsxK1hl?=
 =?utf-8?B?UEJMM01pdjJLWEhydG50OW5COVZhaTEwRWhXeGhiYUgvQ2ZUTENyUEtyV1ps?=
 =?utf-8?B?U3hueHV5cWY1ZDV4THg1T3VaYzVvejRmdVd3cUdYUlROYkl1a245SE9pYndP?=
 =?utf-8?B?NVdQZkpISU1VVFpIY2xUcTlBMnlTRGF0MXNVOGh6dGRHWDB0b3FJYTRyOFZp?=
 =?utf-8?B?SXIxMlF4UVlBQkxMTFo1NjlhYXQvdFo5T3YrRjluRUFjcUpKTXorWElFZEF0?=
 =?utf-8?B?L3FGZDJ4QkVIMW1wTHdBV2JRTmV0bXg2ZzF4S0RuUyt2NVRlSGlWdXBpTnlX?=
 =?utf-8?B?RWJRZUNLb0RLYVVSaUV2VlFkOEVTL3dPaS94dEFnNU9PSEtsNUE5YkN3NzZO?=
 =?utf-8?B?N3JEcGt0SVBZVnF1MWZqTFd6VFFrZzRjTEFBWkdRYUhGNlIrQUJ2dDNCZDJV?=
 =?utf-8?B?aGtCeVRmTmVVQWh5ZEpVRDE2dVdyb1NUZW5qbWY3cWw3MVYxRDdYY0lCak1F?=
 =?utf-8?B?OGdQMXNIVW83aEVmNzRjcGc2QzNBanhXYTlLUnV4SEk1Rk1XSU16NGFqb3Nr?=
 =?utf-8?B?eEZCVTJHTGhyUS83ckdHRHJVbU1VN01wbVB2TW0vc1kza1RhWHFXUXUrdFhq?=
 =?utf-8?B?aHc9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f91945e-c63d-4d1a-1983-08da634cedde
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 14:52:08.7498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9Pg84yjA7PXllg/9cHKqGM/jkyz0wXahX6B5JnhEaEBn3cz3darAUDEgql/ESvYSww0SV9QK1nLbOvWjbFCakjyjPMWMNBgPbr0CO9Eor8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6071
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-11_19:2022-07-08,
 2022-07-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207110063
X-Proofpoint-ORIG-GUID: EEc0qdX-o1Y7OWkaawf0RJ-WPixe4haz
X-Proofpoint-GUID: EEc0qdX-o1Y7OWkaawf0RJ-WPixe4haz
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

On 7/11/22 13:56, Igor Mammedov wrote:
> On Fri,  1 Jul 2022 17:10:13 +0100
> Joao Martins <joao.m.martins@oracle.com> wrote:
> 
>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>> index a79fa1b6beeb..07025b510540 100644
>> --- a/hw/i386/pc.c
>> +++ b/hw/i386/pc.c
>> @@ -907,6 +907,87 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>>      return start;
>>  }
>>  
>> +static hwaddr pc_max_used_gpa(PCMachineState *pcms,
>> +                                hwaddr above_4g_mem_start,
>> +                                uint64_t pci_hole64_size)
>> +{
>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>> +
> 
>> +    if (!x86ms->above_4g_mem_size) {
>> +        /*
>> +         * 32-bit pci hole goes from
>> +         * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
>> +          */
>> +        return IO_APIC_DEFAULT_ADDRESS - 1;
>> +    }
> this hunk still bothers me (nothing changed wrt v5 issues around it)
> issues recap: (
>  1. correctness of it
>  2. being limited to AMD only, while it seems pretty generic to me
>  3. should be a separate patch
> )
> 
How about I instead delete this hunk, and only call pc_set_amd_above_4g_mem_start()
when there's @above_4g_mem_size ? Like in pc_memory_init() I would instead:

if (IS_AMD_CPU(&cpu->env) && x86ms->above_4g_mem_size) {
    hwaddr start = x86ms->above_4g_mem_start;

    if (pc_max_used_gpa(pcms, start, pci_hole64_size) >= AMD_HT_START) {
        pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);
    }
    ...
}

Given that otherwise it is impossible to ever encounter the 1T boundary.

If not ... what other alternative would address your concern?

>> +
>> +    return pc_pci_hole64_start() + pci_hole64_size;
>> +}
>> +
>> +/*
>> + * AMD systems with an IOMMU have an additional hole close to the
>> + * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
>> + * on kernel version, VFIO may or may not let you DMA map those ranges.
>> + * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
>> + * with certain memory sizes. It's also wrong to use those IOVA ranges
>> + * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
>> + * The ranges reserved for Hyper-Transport are:
>> + *
>> + * FD_0000_0000h - FF_FFFF_FFFFh
>> + *
>> + * The ranges represent the following:
>> + *
>> + * Base Address   Top Address  Use
>> + *
>> + * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
>> + * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
>> + * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
>> + * FD_F910_0000h FD_F91F_FFFFh System Management
>> + * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
>> + * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
>> + * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
>> + * FD_FE00_0000h FD_FFFF_FFFFh Configuration
>> + * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
>> + * FE_2000_0000h FF_FFFF_FFFFh Reserved
>> + *
>> + * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
>> + * Table 3: Special Address Controls (GPA) for more information.
>> + */
>> +#define AMD_HT_START         0xfd00000000UL
>> +#define AMD_HT_END           0xffffffffffUL
>> +#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
>> +#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
>> +
>> +static void pc_set_amd_above_4g_mem_start(PCMachineState *pcms,
>> +                                          uint64_t pci_hole64_size)
>> +{
>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>> +    hwaddr start = x86ms->above_4g_mem_start;
>> +    hwaddr maxphysaddr, maxusedaddr;
>> +
>> +    /* Bail out if max possible address does not cross HT range */
>> +    if (pc_max_used_gpa(pcms, start, pci_hole64_size) < AMD_HT_START) {
> 
> move it to the caller?
> 
Will do. I have replaced with this instead /in the caller/:

    if (pc_max_used_gpa(pcms, start, pci_hole64_size) >= AMD_HT_START) {
        pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);
    }

>> +        return;
>> +    }
>> +
>> +    /*
>> +     * Relocating ram-above-4G requires more than TCG_PHYS_ADDR_BITS (40).
>> +     * So make sure phys-bits is required to be appropriately sized in order
>> +     * to proceed with the above-4g-region relocation and thus boot.
>> +     */
>> +    start = AMD_ABOVE_1TB_START;
>> +    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
>> +    maxusedaddr = pc_max_used_gpa(pcms, start, pci_hole64_size);
>> +    if (maxphysaddr < maxusedaddr) {
>> +        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
>> +                     " phys-bits too low (%u) cannot avoid AMD HT range",
>> +                     maxphysaddr, maxusedaddr, X86_CPU(first_cpu)->phys_bits);
>> +        exit(EXIT_FAILURE);
>> +    }
>> +
>> +    x86ms->above_4g_mem_start = start;
>> +}
>> +
>>  void pc_memory_init(PCMachineState *pcms,
>>                      MemoryRegion *system_memory,
>>                      MemoryRegion *rom_memory,
>> @@ -922,12 +1003,31 @@ void pc_memory_init(PCMachineState *pcms,
>>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>      X86MachineState *x86ms = X86_MACHINE(pcms);
>>      hwaddr cxl_base, cxl_resv_end = 0;
>> +    X86CPU *cpu = X86_CPU(first_cpu);
>>  
>>      assert(machine->ram_size == x86ms->below_4g_mem_size +
>>                                  x86ms->above_4g_mem_size);
>>  
>>      linux_boot = (machine->kernel_filename != NULL);
>>  
>> +    /*
>> +     * The HyperTransport range close to the 1T boundary is unique to AMD
>> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
>> +     * to above 1T to AMD vCPUs only.
>> +     */
>> +    if (IS_AMD_CPU(&cpu->env)) {
>> +        pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);
>> +
>> +        /*
>> +         * Advertise the HT region if address space covers the reserved
>> +         * region or if we relocate.
>> +         */
>> +        if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START ||
>> +            cpu->phys_bits >= 40) {
>> +            e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
>> +        }
>> +    }
>> +
>>      /*
>>       * Split single memory region and use aliases to address portions of it,
>>       * done for backwards compatibility with older qemus.
>> @@ -938,6 +1038,7 @@ void pc_memory_init(PCMachineState *pcms,
>>                               0, x86ms->below_4g_mem_size);
>>      memory_region_add_subregion(system_memory, 0, ram_below_4g);
>>      e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
>> +
> 
> stray newline?
> 
Yeap. I've already removed as per my earlier email to this patch.

