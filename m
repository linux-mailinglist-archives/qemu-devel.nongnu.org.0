Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 479D757074C
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jul 2022 17:42:20 +0200 (CEST)
Received: from localhost ([::1]:36962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oAvYB-00007j-EK
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 11:42:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oAvNr-0007sr-DR
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 11:31:39 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:41650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1oAvNb-0002Bm-UG
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 11:31:38 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26BDodQX004678;
 Mon, 11 Jul 2022 15:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : from : to : cc : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=tThnUzR33kQ9qx60Hy9Cey8nglL9Dkga/EqMkp/pX/s=;
 b=M0qb6HUUK/uqjCecswWj0uFkcaoNXr+PW2iPnVTxVQ+4KoutYxqVEKmyWt8zF3hd3k5w
 PKujqInBkGKZ25STX6a6PwGliM25cSX6kIB/LDmmtdVITTSQ6UlXljFZgPLQZxtX/KXa
 AnWT+6LagDegHirXl36fnGVqYN8VtqSUaGXrBvPytFP+hbjaM6EeYl4uXEmZTgBEO0rO
 JGFIn83DkF5mUMXVPZ/lnB7H6nve9D3FhmyW7A7IALgjUf76ALvanm/lUfgkIckIPMtA
 0fQhHc9gi0PR9YUZsrfkdYZND0Fan4I63fBg+dcap5dKVqjC2I2FzQUuo/oI7eoVgV6V 5A== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h727sbwsj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jul 2022 15:31:15 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 26BFNh7S012194; Mon, 11 Jul 2022 15:31:13 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com with ESMTP id
 3h7042njxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Jul 2022 15:31:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q+ebI6WWbbIm/IN8mCenjBGb/tzjVznxm4dzWLopgwKRQtq8LDic8g0ZIegcXMAXiqNNrtUA+pu2RHj/K/6+HFYZqvOOhBJcHsBYqPHIlgZSqR4g8tOc7SKnqqkxGOiBgl5kuLUskbiIRkmgpf/3irqKJ5HlrofAglmhuQovSLaLOb0Z3CgFfWAHBbZfG5HJaYkmgHq+aTIJR276I5CYdh5vOynQBZik/Gn701+UqsWfCWFwzc4afIwYHza3nUHCe7EtXcWt2WS5e9OL3JQ1QL0MP2zGL67SmMwt2Dv2hljNcP7u8/WkPXvRou1LVpH+9LLrzsFTHq7ZwPOkaDOrfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tThnUzR33kQ9qx60Hy9Cey8nglL9Dkga/EqMkp/pX/s=;
 b=Q1m1Y0nKrIi9pqZ5M9akudn2mgqoariQBBl179bJgSNEp0aw7pa6kl1ApBeDPcN7KURtMdybApIfDIGxqHx12h3Oz9EDggWjLogIsqpNgqulZQ2QQyM84iKE+RFD0aS+FGrpnkf+GOMXmgcu6wq1YEKIX2n5swTFffJJRnED8hDt7q/nskfkzvwZ7+Gpg5E2MTkRFPBi9ld9iCi9KBXw57g8zaMJlAnkHqAJeKroFkS4sZX7NoxyVtE50ZzO9+bdhkvaoK1kpZatoymA7wj8fJgkx44DaQE0Z96gPfclvLofg40au0yBrOlZvScGJF3CxPmQiFoDQGhVj8tCOMY78Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tThnUzR33kQ9qx60Hy9Cey8nglL9Dkga/EqMkp/pX/s=;
 b=c5TbNSKKrKA2qA0vljoMU5CsS1X9F7qjekkzIt4nKJT3P2f5DqzvsgABp/J7pxQRCGHupqQtS6ihN6yUyPYtfnfYgeIaONA4SuZCpUXLjPhCwxsEB0DhFYk1SvP09mkkyHfZJlxzGRw11kIdNr7zUmN+P1bNoZL6Iu0jkfc9Ex4=
Received: from BLAPR10MB4835.namprd10.prod.outlook.com (2603:10b6:208:331::11)
 by CH2PR10MB3909.namprd10.prod.outlook.com (2603:10b6:610:3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 15:31:12 +0000
Received: from BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e]) by BLAPR10MB4835.namprd10.prod.outlook.com
 ([fe80::b842:a301:806d:231e%9]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 15:31:12 +0000
Message-ID: <65ea8b7f-37cb-55dc-3306-fd32880aa0fb@oracle.com>
Date: Mon, 11 Jul 2022 16:31:06 +0100
Subject: Re: [PATCH v6 09/10] i386/pc: relocate 4g start to 1T where applicable
Content-Language: en-US
From: Joao Martins <joao.m.martins@oracle.com>
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
 <5179013f-a2b6-b5a4-a509-42657dbde25a@oracle.com>
In-Reply-To: <5179013f-a2b6-b5a4-a509-42657dbde25a@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0138.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9f::30) To BLAPR10MB4835.namprd10.prod.outlook.com
 (2603:10b6:208:331::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 695484c5-9415-48b7-c7f6-08da635262b0
X-MS-TrafficTypeDiagnostic: CH2PR10MB3909:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eam935hzQzfWLD4553uTwI20j2o040mr7wsnEKS/88qkXd4exlgPMCNA2Y7jg1KG75wtMNjwebnxxHL5FC5TN2UVdAhWNcv+8/9BFlytAgNv8fUbyyshIIob9bOX5cR3KfDTygf9GQW5tWgVuxEQK9WbQ9lGiRjaDLpevNnczsjWaaT9kPi8w+d9u4P8AAEXrq1tEbqECFeAvX3W4RO5gUpP9FEqduqiSbIcN3UU8MOEfGikuqCpg/mmZwQz5b1nxVfTHIcViYKrpq3puEZdWfqg0a+n8VHZ77PtwmmypKW8h/McKgKV9EsIYh1uexpE/yjnjK46ZVAJRVrL2d5V2LN5S1LW/nrg7iq2uP8cShtJst/fClHxznAteB9dTFMo3J13qxAyhdKTUoGwjEdnWQrDQjxZMqUICEkPoiBtM2dfYFu5JsIlHDCiUsNu3HJ58OQuiuWCOTDS56zD88qM5QrzmD10HmD6McNrMU0ZeHisYWytZ7HjO/9fi2xHPOM3K8ZcEgGts9qoBrPmG7bhMdKD6Nc1PpMVbI8W3Xasi3CvgTP/FBs/hOHDynU1BcjmVS7fRprjqt51mlHHRuTY4HNZC9mWVf7AIQ0itRJVNbLX2/zYUz2l9IpCJzBe0/P/ThJUHTlvXUSCGgY6FpLNzdyAOmjl9M+nPulAUpqDwi4bSIxzcZiHd1ihC8jjRlE0wSTTIzRULTGkj9DJf/Hu/DLqUh8FBEbsuY/zGzm4iu5fvul9YWy32kKHV2JWTfw0d6TN921qPnxUoCyRbyOn8f/z6/pr7lHFnaMXCdLkp7cZBIdmHeADRCsdzYwHtQhU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BLAPR10MB4835.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(396003)(346002)(39860400002)(136003)(8936002)(6506007)(2906002)(6512007)(31686004)(5660300002)(38100700002)(83380400001)(4326008)(7416002)(2616005)(316002)(66556008)(66476007)(8676002)(186003)(6486002)(66946007)(41300700001)(31696002)(478600001)(6666004)(36756003)(86362001)(54906003)(6916009)(26005)(53546011)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YVRMQTEydEtOa3k5MkoyWU92S2MzaUdJdWdHRWdrbWZhNE4yWE5ZK3U4cW1a?=
 =?utf-8?B?aEErVVJrLzkxNTRSeFdhT05JaWVraEF4U0d6ODcxM2tjZmlUazdBWXZQajZv?=
 =?utf-8?B?TnJ4OHBvTEZrVXR0cTRaY1RtOG5qcG1LdHlqMVdYRFNGVGZvYUhBY0xPT0tj?=
 =?utf-8?B?OFFXazZIem9rU0xrNHNiQXFFcTJQZkRHTy8vOU9DVGIxRitodFdMMkVOTmlF?=
 =?utf-8?B?R3ZrWXZIR2hDMVB0U2tpdmk2QVBreXUzU1BsK3IrVVNPSHhyMmR5WG5SV2dU?=
 =?utf-8?B?cXJ4VnJlWTgvYm51VEZ3MHJya0VKbE8yeHRZSHhxKzVKb3FJYUttTEt2QUY5?=
 =?utf-8?B?S0hwbDVVTjF6K2JDU3h1d2d1UllmV1pMREpMWXROT0JZenJXdmtxVHVMSmNF?=
 =?utf-8?B?dmQ1VVplbERkQUZ3bW40ZjRoSExNVE1YdjJaUmV4eDB4dWZjTDhJSTVmWFhl?=
 =?utf-8?B?clRZTHJCTFVxNjRJelNGa1BmQnN0elJUbk9nOVVZZ2VZN3AwZGNJUVEyemN4?=
 =?utf-8?B?ejVxeWRVQlN2OUFXazdLb2JPUDdOMUxhb0hrcUxkWHVULzd4WDdUWk9WMTF4?=
 =?utf-8?B?WDNROXhjM0FQNzBiL2JWL2JVVmRucStuZWtHVERPa0MwVk5BUG9DNFBYSWww?=
 =?utf-8?B?S2x0YkJ1eDMwajhNOERLZldFRUE0QmtLV21KSlprQWpJUXdXU0NYVGIrVzdM?=
 =?utf-8?B?SEx0Ty95ZGJuMllpM1RzRUZjaG5yWnV1RTdFM3QxSGQvNFFFaEVlMm9ocE05?=
 =?utf-8?B?WHF3NE1kaGVOS0lPZG1xMzZ4M1dyVXdEbDE2VVdPNjZpbGI3K0ZhajAyK1Vo?=
 =?utf-8?B?a2NzTU9ZbW12K2ljS3VoYXNoMkxGU2g3Q1NtTFE4S3lucHY4bm1EbVNwcU05?=
 =?utf-8?B?SC84SDdweTZBNUJwMlRPM0ZZdkV0NmU0eHNienFoakgrV1FoZ2hDcmN5TCs4?=
 =?utf-8?B?VXJXZnp5MXZsMkNaUFBrT0c0VldncTk0UVMzdkFXejF5amxqWDBnZVlYM25Z?=
 =?utf-8?B?SDROSGFCSHpobXRhZk5jVXZmWHUvRXNMZjBncG1ncDRNSDNGVFMrbHNwU3NU?=
 =?utf-8?B?dHRjWnFXQ3JpL2RIZzZHZDI4RWZXVmd2QWVDc1dOOElwR3BFWCtMMURpdjRM?=
 =?utf-8?B?dFNuZGdoZFptck1RMjVyUlZ1US91S3pqT1ZiWlNXcVlkVFlRS2h1dVNhYTIv?=
 =?utf-8?B?WW9MRWt5MzZnZnlieUVTYlMyTms1azZhRXd0alZTeUZiVzFXWEtuNW93TUsy?=
 =?utf-8?B?bVRzUnlPWGJHMk9FZC9za3VJYUdNWmM2NDV2aktrNGJTS0d6eFN1RDA4eHFK?=
 =?utf-8?B?YUJkNC95elZSZmQ1S1RtRVB4dnBxZWpSdXRldXl1bU1pTjFCR2hYSXM0S1pp?=
 =?utf-8?B?VFVjYUh3ck4rZGlGeEdTZmV6ZUVsdlV3a2YyTGtmVXFLRWFaem9DMW5nRzNm?=
 =?utf-8?B?b1I3a3Y1WnRVNkFkSG5FclV3eVc5R2FnbXVCNlVlK1ZnaTFQOG96VUgvOUh1?=
 =?utf-8?B?WnRZaCs1MjVTVGFUQytFa0M1dzFGUnVpc2xQRTRFb3BPeGtvWjlQK1Bjd3FQ?=
 =?utf-8?B?N3RvRXBDbkE4UDMxbzZPZ3ZIUDZwSk9kMS9oZ0FxTi9ycUtsbnViSGxjd0gy?=
 =?utf-8?B?cW4wOXFGNjBpMzh0TUxVcUl1bDJyeVRvS1YrdnZheHZkdHhHUDNjZ01BRThN?=
 =?utf-8?B?SFRqOEoraE9PeDkvcFhhemhwK2tRNzV3aitrUU1KYzNqRW1nT2daRU9WLzR0?=
 =?utf-8?B?VnNsbmRhWTMzU3FZSDZucitTL1Q4QkxSN2pyOGJQQ3VZWGhaZkNJT3dNWVNp?=
 =?utf-8?B?NklFS1JEOFEwSEgranpoMU9jQ0ZkQnRWVkhKVHI5eHF5cUx6THo3aFZBTnRH?=
 =?utf-8?B?YVNtMTF0NWtkbHBKQTV0NjJOcllVdks4bVhrd3BJY2tSVzV1Q2FJTEJ1M2Iw?=
 =?utf-8?B?b3RaNUtBb1NWOGpPb2RONUUraHczSlZiVmpoWVpqUGtYbFdhcVV5V2o3YU1x?=
 =?utf-8?B?ZnprNWF0L3hHWXMwa1hUOXZhMXlYcWQ2ZDIveXF3VzNDd1dpaXB0QUR6bTMx?=
 =?utf-8?B?TkpmSjA0ZFJaaENhdk5Xa3BOc1dER0k4SnBzOGlFeWZOTWIyL0xyMEpLMU5I?=
 =?utf-8?B?SS80Ly9LUmZNZkhHK3Q0MXVibTlRWU00cEVtOWZ2MHAxYkQwaTdOUCtVTHFq?=
 =?utf-8?B?V1E9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 695484c5-9415-48b7-c7f6-08da635262b0
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB4835.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 15:31:12.2298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12kheZIQIeheuPPAWf6uxZUaT5qOWNfyoovxeG7lefJ6Kf/s4te0EgLWDzPdOv7lWHEB17z+Rfb/2Ij/aqv+Nw9AEJ7gyzVWJViS84XAVlc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB3909
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-11_19:2022-07-08,
 2022-07-11 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 phishscore=0 mlxscore=0
 suspectscore=0 adultscore=0 spamscore=0 mlxlogscore=931 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207110065
X-Proofpoint-ORIG-GUID: 1W44-2ZN4PktTJL8gCK_6sk0CdfiOLwg
X-Proofpoint-GUID: 1W44-2ZN4PktTJL8gCK_6sk0CdfiOLwg
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 7/11/22 15:52, Joao Martins wrote:
> On 7/11/22 13:56, Igor Mammedov wrote:
>> On Fri,  1 Jul 2022 17:10:13 +0100
>> Joao Martins <joao.m.martins@oracle.com> wrote:
>>
>>> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
>>> index a79fa1b6beeb..07025b510540 100644
>>> --- a/hw/i386/pc.c
>>> +++ b/hw/i386/pc.c
>>> @@ -907,6 +907,87 @@ static uint64_t pc_get_cxl_range_end(PCMachineState *pcms)
>>>      return start;
>>>  }
>>>  
>>> +static hwaddr pc_max_used_gpa(PCMachineState *pcms,
>>> +                                hwaddr above_4g_mem_start,
>>> +                                uint64_t pci_hole64_size)
>>> +{
>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>> +
>>
>>> +    if (!x86ms->above_4g_mem_size) {
>>> +        /*
>>> +         * 32-bit pci hole goes from
>>> +         * end-of-low-ram (@below_4g_mem_size) to IOAPIC.
>>> +          */
>>> +        return IO_APIC_DEFAULT_ADDRESS - 1;
>>> +    }
>> this hunk still bothers me (nothing changed wrt v5 issues around it)
>> issues recap: (
>>  1. correctness of it
>>  2. being limited to AMD only, while it seems pretty generic to me
>>  3. should be a separate patch
>> )
>>
> How about I instead delete this hunk, and only call pc_set_amd_above_4g_mem_start()
> when there's @above_4g_mem_size ? Like in pc_memory_init() I would instead:
> 
> if (IS_AMD_CPU(&cpu->env) && x86ms->above_4g_mem_size) {
>     hwaddr start = x86ms->above_4g_mem_start;
> 
>     if (pc_max_used_gpa(pcms, start, pci_hole64_size) >= AMD_HT_START) {
>         pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);
>     }
>     ...
> }
> 
> Given that otherwise it is impossible to ever encounter the 1T boundary.
> 

And while at it I would also remove any unneeded arguments from pc_max_used_gpa(),
which would turn the function into this:

+static hwaddr pc_max_used_gpa(uint64_t pci_hole64_size)
+{
+    return pc_pci_hole64_start() + pci_hole64_size;
+}

I would nuke the added helper if it wasn't for having 2 call sites in this patch.

> If not ... what other alternative would address your concern?
> 
>>> +
>>> +    return pc_pci_hole64_start() + pci_hole64_size;
>>> +}
>>> +
>>> +/*
>>> + * AMD systems with an IOMMU have an additional hole close to the
>>> + * 1Tb, which are special GPAs that cannot be DMA mapped. Depending
>>> + * on kernel version, VFIO may or may not let you DMA map those ranges.
>>> + * Starting Linux v5.4 we validate it, and can't create guests on AMD machines
>>> + * with certain memory sizes. It's also wrong to use those IOVA ranges
>>> + * in detriment of leading to IOMMU INVALID_DEVICE_REQUEST or worse.
>>> + * The ranges reserved for Hyper-Transport are:
>>> + *
>>> + * FD_0000_0000h - FF_FFFF_FFFFh
>>> + *
>>> + * The ranges represent the following:
>>> + *
>>> + * Base Address   Top Address  Use
>>> + *
>>> + * FD_0000_0000h FD_F7FF_FFFFh Reserved interrupt address space
>>> + * FD_F800_0000h FD_F8FF_FFFFh Interrupt/EOI IntCtl
>>> + * FD_F900_0000h FD_F90F_FFFFh Legacy PIC IACK
>>> + * FD_F910_0000h FD_F91F_FFFFh System Management
>>> + * FD_F920_0000h FD_FAFF_FFFFh Reserved Page Tables
>>> + * FD_FB00_0000h FD_FBFF_FFFFh Address Translation
>>> + * FD_FC00_0000h FD_FDFF_FFFFh I/O Space
>>> + * FD_FE00_0000h FD_FFFF_FFFFh Configuration
>>> + * FE_0000_0000h FE_1FFF_FFFFh Extended Configuration/Device Messages
>>> + * FE_2000_0000h FF_FFFF_FFFFh Reserved
>>> + *
>>> + * See AMD IOMMU spec, section 2.1.2 "IOMMU Logical Topology",
>>> + * Table 3: Special Address Controls (GPA) for more information.
>>> + */
>>> +#define AMD_HT_START         0xfd00000000UL
>>> +#define AMD_HT_END           0xffffffffffUL
>>> +#define AMD_ABOVE_1TB_START  (AMD_HT_END + 1)
>>> +#define AMD_HT_SIZE          (AMD_ABOVE_1TB_START - AMD_HT_START)
>>> +
>>> +static void pc_set_amd_above_4g_mem_start(PCMachineState *pcms,
>>> +                                          uint64_t pci_hole64_size)
>>> +{
>>> +    X86MachineState *x86ms = X86_MACHINE(pcms);
>>> +    hwaddr start = x86ms->above_4g_mem_start;
>>> +    hwaddr maxphysaddr, maxusedaddr;
>>> +
>>> +    /* Bail out if max possible address does not cross HT range */
>>> +    if (pc_max_used_gpa(pcms, start, pci_hole64_size) < AMD_HT_START) {
>>
>> move it to the caller?
>>
> Will do. I have replaced with this instead /in the caller/:
> 
>     if (pc_max_used_gpa(pcms, start, pci_hole64_size) >= AMD_HT_START) {
>         pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);
>     }
> 
>>> +        return;
>>> +    }
>>> +
>>> +    /*
>>> +     * Relocating ram-above-4G requires more than TCG_PHYS_ADDR_BITS (40).
>>> +     * So make sure phys-bits is required to be appropriately sized in order
>>> +     * to proceed with the above-4g-region relocation and thus boot.
>>> +     */
>>> +    start = AMD_ABOVE_1TB_START;
>>> +    maxphysaddr = ((hwaddr)1 << X86_CPU(first_cpu)->phys_bits) - 1;
>>> +    maxusedaddr = pc_max_used_gpa(pcms, start, pci_hole64_size);
>>> +    if (maxphysaddr < maxusedaddr) {
>>> +        error_report("Address space limit 0x%"PRIx64" < 0x%"PRIx64
>>> +                     " phys-bits too low (%u) cannot avoid AMD HT range",
>>> +                     maxphysaddr, maxusedaddr, X86_CPU(first_cpu)->phys_bits);
>>> +        exit(EXIT_FAILURE);
>>> +    }
>>> +
>>> +    x86ms->above_4g_mem_start = start;
>>> +}
>>> +
>>>  void pc_memory_init(PCMachineState *pcms,
>>>                      MemoryRegion *system_memory,
>>>                      MemoryRegion *rom_memory,
>>> @@ -922,12 +1003,31 @@ void pc_memory_init(PCMachineState *pcms,
>>>      PCMachineClass *pcmc = PC_MACHINE_GET_CLASS(pcms);
>>>      X86MachineState *x86ms = X86_MACHINE(pcms);
>>>      hwaddr cxl_base, cxl_resv_end = 0;
>>> +    X86CPU *cpu = X86_CPU(first_cpu);
>>>  
>>>      assert(machine->ram_size == x86ms->below_4g_mem_size +
>>>                                  x86ms->above_4g_mem_size);
>>>  
>>>      linux_boot = (machine->kernel_filename != NULL);
>>>  
>>> +    /*
>>> +     * The HyperTransport range close to the 1T boundary is unique to AMD
>>> +     * hosts with IOMMUs enabled. Restrict the ram-above-4g relocation
>>> +     * to above 1T to AMD vCPUs only.
>>> +     */
>>> +    if (IS_AMD_CPU(&cpu->env)) {
>>> +        pc_set_amd_above_4g_mem_start(pcms, pci_hole64_size);
>>> +
>>> +        /*
>>> +         * Advertise the HT region if address space covers the reserved
>>> +         * region or if we relocate.
>>> +         */
>>> +        if (x86ms->above_4g_mem_start == AMD_ABOVE_1TB_START ||
>>> +            cpu->phys_bits >= 40) {
>>> +            e820_add_entry(AMD_HT_START, AMD_HT_SIZE, E820_RESERVED);
>>> +        }
>>> +    }
>>> +
>>>      /*
>>>       * Split single memory region and use aliases to address portions of it,
>>>       * done for backwards compatibility with older qemus.
>>> @@ -938,6 +1038,7 @@ void pc_memory_init(PCMachineState *pcms,
>>>                               0, x86ms->below_4g_mem_size);
>>>      memory_region_add_subregion(system_memory, 0, ram_below_4g);
>>>      e820_add_entry(0, x86ms->below_4g_mem_size, E820_RAM);
>>> +
>>
>> stray newline?
>>
> Yeap. I've already removed as per my earlier email to this patch.

