Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680936AD0A4
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 22:35:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZIUj-0008Fp-Nr; Mon, 06 Mar 2023 16:35:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1pZIUW-0008F0-8O
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:35:33 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <annie.li@oracle.com>)
 id 1pZIUU-0001pr-3o
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 16:35:31 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326L9kjB026299; Mon, 6 Mar 2023 21:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=0TcEygNMfsNwkvhDCH59KVou8xJKalMRld3O/jBo8nI=;
 b=wcgIRIG2QsnDJiPHvP6UCSrSHRyFBG4unPvlcQCpKJBxhbqIDAN1LaTeLxi3KPDVhEWY
 PS1/U+qJF5VUAMp5CuyiNAkKT7No+b1nvdRjcx1BQztqoEWUBync7jazG2EGw8XtNbFI
 kumkbtMzUxW2ocwARqAgTPkhPCaDECaXj57+vku0muvLuKkHYTYxFnMuRv71gyAeHhcy
 hOWZyXyfPnuFx4SRl06laMboEw8BzRu9ivaBusKjQk22KSJiguW8ZUgA48DEX2B7FyI7
 ANGYLQvxXj7xXlzvQ2CB1kPVNYZ1A4woyDK4asSsdwVhq18f5HKwQaPxC4n3/ASSQ6GW wg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p4168m30k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 21:35:24 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 326LO8sZ023383; Mon, 6 Mar 2023 21:35:23 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam04lp2170.outbound.protection.outlook.com [104.47.73.170])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u05ardf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Mar 2023 21:35:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAOXzOwbBVAQEeIq91ekOz3vpsNE98hL0Ew/3I28cYHqeIe5hI3+HMKUQOAJ03fSqP5TO1yTJD+qxLKzrwa+pFHxdDGQaNSqzaH6Cl46cr51I8v49AzIvRvVTY50c+BgIdLF8me+p2UXqfhEk2lO7ZKQ5UJrrrgLvbeeAR2FF9k7AqvXfQ2i3s7aJdduTTGN0FgOP2RVDpK9hv8+49CTeZd3E7iI0ErumxTjVNnWGJgIiymKcDNgrJXEu0xNJ9cZUcVMv+rFt3FIh+0YeTdjauhuFrUCKswrquWOdOyW6Lg+pOzA3xaglx/JQPR8C4qeCmQSs+arKsy1a9SegNCs7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TcEygNMfsNwkvhDCH59KVou8xJKalMRld3O/jBo8nI=;
 b=a3INKHEqdbU2afLzDp8Vv42nwNTDWAN2ShA+6Vujt0vDYvo7pcQcHtAJsjcp5ylYMPnlbUR+zwR7Cv9538tGL/XGw8p+6VEXvx05grTXajeIkJbxxMOnFfpoiDVTHzeeI9gTzic0pKsfUg0plL+30YmJriOJhi8G3G2v+VvowC1yyR8hnjCEf/No+fuL8xVKtXCe6AxfWvwVScLnlK3oNLOv9Dxlb/3CVRQT+lAitXAOEN1wxT9MisAMpGx6O5kEV+9me7YnReIeAGRAvrmH46vrZd6rG7BXRfKNHOp/0CSSxGXu8c3IB8/ZF0F9SeZSsiaUwNHDpyA2lEhq+U8wTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TcEygNMfsNwkvhDCH59KVou8xJKalMRld3O/jBo8nI=;
 b=tDLarsARj8orPG6Asju4DOzPjFj4bK8mmpXuD11qKRUUx1rBeMZLeqLPtbsSVzTFDcqsWgzRWxNqsDv47XimLlKNuKx+I8s4DygtoPa3nKW3WYcC6ltzLcuNNniX+5qzDfYmjX7TliKYr9WV3znKzS52CtFnqEiTPHuLWLejUHA=
Received: from DM6PR10MB2523.namprd10.prod.outlook.com (2603:10b6:5:b2::27) by
 CY8PR10MB6851.namprd10.prod.outlook.com (2603:10b6:930:9f::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6156.28; Mon, 6 Mar 2023 21:35:22 +0000
Received: from DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::188d:49b6:40a8:68e4]) by DM6PR10MB2523.namprd10.prod.outlook.com
 ([fe80::188d:49b6:40a8:68e4%6]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 21:35:22 +0000
Message-ID: <29e7b48c-57ab-f88a-2ff9-404be6526eed@oracle.com>
Date: Mon, 6 Mar 2023 16:35:36 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v2 0/3] contrib/elf2dmp: Windows Server 2022 support
Content-Language: en-US
To: Viktor Prutyanov <viktor@daynix.com>, pbonzini@redhat.com,
 peter.maydell@linaro.org
Cc: viktor.prutyanov@phystech.edu, yuri.benditovich@daynix.com, yan@daynix.com,
 qemu-devel@nongnu.org
References: <20230222211246.883679-1-viktor@daynix.com>
From: "Annie.li" <annie.li@oracle.com>
In-Reply-To: <20230222211246.883679-1-viktor@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0023.namprd13.prod.outlook.com
 (2603:10b6:208:256::28) To DM6PR10MB2523.namprd10.prod.outlook.com
 (2603:10b6:5:b2::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR10MB2523:EE_|CY8PR10MB6851:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fc3f230-8461-4879-0064-08db1e8ab090
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SDB0GwNovq474hJKm2tGxr8sSkeBux19cE3uDX1fzNPJVTrHLwa+Mn0z3P4fNpWvEtH0sOSH44sTOEa/j7GpMAEaIM4L0lImBLAAMrmA/XoBLAOlvFEeFsCg6OBm1Md8Jfc9iNpuh8Fe54tEBBUyC25lHcjpPfHX5Fwg/vdjoYlp2gZrTGEsVF96vbNcoiLJYGYBvsj/Tl4XeL+YePz1n8Bu5OzK7sYUfmxMIhFoEsrVmM1jtUn/+D5EIvGXoToh3lQzHXVslbeFw1b+aVZd1Ui34KqjfZD9DyJP4jphvA6/fFPWLtJ5G3oIYRROxJ4vaiiIIvkFYi/d251uhcSfVInYk5eoBjK+2LNYwv8X7xk/tvMQsMhFzFm5tY2qCIgUzzBVbu+m0PhiPgt74gmQmo6quaZylNna2qF3UwCeU/bGtlcB9ekQ3UF3a00sSUylYKTSUmtUzpbDcTcweMKswEpuatQizNjAXsuEIyngFFrqP7jd6vEI9tlXAtmsGgwoVbOepaAr9PzirBTB6bqY+RE8BykyVxju4+HrfkFtCpqLjQ78U46n/nzM/VljL2v9b0DuNglwElo6amHES/toskBwO1UeRnJl1rMKJNGl876GALo3poZAykrGG/iwn8/TY4mv+0EmcORyklZ+XdS1Iun2sR908/pepjwEXx9v5UIHfwVC0eD8ZW2epO4eBKrk2M6zQRK3rBQe9xMO0FOWY82pY6+kPFyKgEz537cYkGc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR10MB2523.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(396003)(39860400002)(376002)(366004)(451199018)(38100700002)(31696002)(86362001)(36756003)(41300700001)(66946007)(66476007)(31686004)(8676002)(66556008)(6666004)(186003)(26005)(4326008)(6512007)(5660300002)(53546011)(6506007)(8936002)(478600001)(316002)(4744005)(2906002)(6486002)(2616005)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm4yYjNsQndkQ1dzTlRDVVlzUnNqdlRscVdBZSswTDZ6YnF6Y2tNaFJGaFdz?=
 =?utf-8?B?aDFES0YyUFBncVhIdE5oWUczMGlhcVQyeXRFdlgxQndkSkF4NmQyaHdrcTVP?=
 =?utf-8?B?cmZFcnhmOUJMa0pxRGlYYXlGVExTbnpqSDF2bElsQlhGR29Hc2EwUURKZTN5?=
 =?utf-8?B?WSttYmwwTURmSSttck9pR0ozUnp3VkJsRDRxdmZ5UldsRzdmVGpMRDBGWWhU?=
 =?utf-8?B?dUpVdHpyWG1Ia0dqUkdXOFRKWHFHdDY0bmt1QVlaeWlyUnhzU3BlUDE0dEsx?=
 =?utf-8?B?NytDM01DYTkxVUVTeEQwVmJndWI1ZzUrQmtnVlNUTUZLOHFpcVljTmowalZx?=
 =?utf-8?B?cWdFVlExdmJTeEZiZUp4K3BJUkFaN0VMSTRpeEg4WXpEZUMraHYvUklSd2tE?=
 =?utf-8?B?cTdadG9sckFLYjVMUm1LS0ROdFN1c1lwT2VDL05mMjFDc1E4WkY1ZFJkN1dq?=
 =?utf-8?B?WTRjc1pXSm5IZ1RNelZjZjhGdFdxYlNTZktiUXhwUHRLY1NyZFJxUkJlR0Jn?=
 =?utf-8?B?MzdvSW9td25TRStkTHpQdUtZd05lOGFoanN0V2tZZzFCK3dVVkFBYVBjcnJw?=
 =?utf-8?B?VFo5eDljanRZRG1QbFNiaUpSNE5ZV2M4VVI0YlFGVXBoTmtGUGpMTVhtQ3dk?=
 =?utf-8?B?N0tqS1o0ZlJvQkZnb3J6bEJvdmltSXBGUDlqWDhBeGFzUjJRbE9QOEdNUVB5?=
 =?utf-8?B?eStYdjNjK3p3ajFrdUo5NkR6dW5mRzRMUDM3STdKb1BYT1pBVkdRaW9qVmV3?=
 =?utf-8?B?ZnFPZHRIZ3ljb0c4ekpDY0R5cU44R1VRMWMyd285cVcyZE5kZ0xENmw4Ny9F?=
 =?utf-8?B?R0tETEUrd0o4a3AxQ3RSUVptZUxubFdzRmxSMVJhNVlBbmJSVld2U2xkMC9O?=
 =?utf-8?B?NHB4aExEbDlZajl2eEQxVDZ5VWNHZGhPUWxtTktONkRYR01tdFArWC9KdTVz?=
 =?utf-8?B?QTU3YUd0eTFhL2R3YTU2MHNFd1pYR1JBQTRVTjk0MHFlNFI5K09IbTBqZm1i?=
 =?utf-8?B?R2ZFdWNpZXlqbW1rT0FwejdCRHRFUzB6N0NCSityWkpzamFSdnZoanZncWFi?=
 =?utf-8?B?SHo1YjdaUFV3b1BGcjFJTFl2aDFMVDR3ZisrL3gzOE9aQzFhelFOU2l2SFFB?=
 =?utf-8?B?eWJyVUZsRWFSTWFjazR4ZjF5ZjJ3bUUwODh4bzQyU3pyaG1sMGd1MzdRTGFN?=
 =?utf-8?B?eVdJRTduMzlaZ0RyWW52ZnFGRTdGVGpXRWJZdk9xMlpMdDR2NzFnNjEwTi9v?=
 =?utf-8?B?WVFVWUhXNytIbE1yQnNoV3NFVlB1aE9lVWgxR2p1VEtpNEhuSzd5M1piZEEv?=
 =?utf-8?B?a0pmd0dwQTM3K2R5d25sMmMycEpzRDE1Z3NRL1pMZXlvWFNtUU56bnFuRGx4?=
 =?utf-8?B?dnE5UDk5RFBHNmk2MlZLT3VGWForQ294aG9ldTNGRzJQazh4OHBBQkhaOVY0?=
 =?utf-8?B?RHNmd3ZJbVh2ZlcyUC9wY21sY2doTWxyZnlIc01wKzR0NER6V0J3Q090WTNB?=
 =?utf-8?B?bElhVlRMd0VEaW1mS3IvQkZjNzF0T1VkQmRBa2hZY2Z2bUNHVTRQK0tKUktX?=
 =?utf-8?B?Vi9BekZpN3E0TGZscnRBWXVHQkJ0V0M3OGcyNG51TEgyaHh0NGZ5RStVZFhW?=
 =?utf-8?B?cEY4SVA4UGRKRjJNd3V6cmc4Ryt2M3krNTgrYUdHTVRNeFdiWWFDaTBVSVBk?=
 =?utf-8?B?QTBkYWk4TEpRUkJxRDlqL292ZGFRY2piS0ROVEJHZld2eG5CZkN6b1B5b0NT?=
 =?utf-8?B?akVOZUg5OHJaYS9QcVh0dGo2czhWczd3SjdYRjhrUS8wUk1rc1JITXJRdytK?=
 =?utf-8?B?cFJvUzBoYnVMV0JEVDhWS1FUMDFmc2thNTVxV1E3SFBGeFdvUHJlTjNxVjRy?=
 =?utf-8?B?ZUNPYnhaRzZyUytvOEM4SUtrNlAyUUNXbmlINE5mcU84SkhBa081SFFYRmox?=
 =?utf-8?B?dlI4SnZmS3BIMmsrd2I2SkpHbjFlS3RQVzVuYUJsbDMxMUYzNFZGdE5ZeWZR?=
 =?utf-8?B?czkyWHVJb2xieVZWWFFlQTllc1liZjQ5Y2dSM0crTm5OWUk5d3BoVWVXaFp5?=
 =?utf-8?B?WUNPV1pZM0xiUUJqUHIxbzB4V0dDbWpubDl0TnpCN0s5ZkxWd0dLaVBDQmFT?=
 =?utf-8?Q?r+oJDaNp5S08B7zdSVRH9dQ5G?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 1B9wAbr0mulmaJQJK24SC9xLaGkVccPcw1nPewXd5h4vkkPXNNcnk27es6lt9V+122D/yL1uGoP47rp8UUMB8MnXBmUJ8+iw2p6wt9WTShPV/lrF9rv7DBNXxp9PTyRoo5xzEZ1m3TvtdcVIfhTBWnf5SnzXAnW9kelHw4oRMJRmNfdY73g0lT5Gwy5dvGS9RPiBTmZZiWo2o+LHs4cScHDzH8JAASqJK/6MBmdm1hfMAwoo+f1IQRO8VQc014o7VprT1ipMc0QoJcGYoHHAXhKzzKxdULQwhi/SU31poVNBX5QdQc3l5MRfmxm8stuGuvBP07hatzmjf6SBsUmvJ7SYWfYC31Hh8Nm7EPyZt9aSfdTmYxSvokuJ6MxyphJmbHc2o92nEy0feyP0kWgWifBnzqT3lom+HA31CiU2q0k93mkmjFGWlmWfLxLJOQUj6iEpgE5MB/x5R83IL2zNFP8KG+8eKhYzvgROHvcwbBYdsS8VHXv9D6nkPP3RAfkG+0p9wciRabVJwbsmBIZgWHUaq8shIpFVRzxVrNxJ2DpefrwQZOXAu68eau9lqWX1PLbvKNMMTR2SK3g9dihb+E76O1hOwtnAD1EijlRYXm7jAJp8Vypt/EztjBRSGkX3aA9zfXrtGXdEH0UUGVUFUE45QOx9qAAVGVnYfSLZv1j6sToT8W+AsKAgOwb71BZ4j2unoiiYI13wDfBp9W025EtLeALpEMQ7hI0iPvN07sBqH7MVRPfW6J9bAZ3/auRAebvCICKFSHfxa0iweGq/p7qT5H3ON3H2btX46rSN9Fwb3lrPced8h3yezyDbcRnBlKjnTOLGuFn1LMNcyk0S0fH6YDYl+yrjtNap5cncx5abZK9X/oTDGNAAestMK1IT
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc3f230-8461-4879-0064-08db1e8ab090
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2523.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 21:35:22.1479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2TJm37CiXhsAMJAoxR6TapoxrOZQjGVaAGqEzzL+ZXyNBKQ/qN/Wyg9qaqQtrH+ddFKZwrXSpF85CIrSy8uGzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6851
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 mlxlogscore=999
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060187
X-Proofpoint-GUID: issDugMYm5PB1ZJ65uf4heFqCMiuWp5L
X-Proofpoint-ORIG-GUID: issDugMYm5PB1ZJ65uf4heFqCMiuWp5L
Received-SPF: pass client-ip=205.220.177.32; envelope-from=annie.li@oracle.com;
 helo=mx0b-00069f02.pphosted.com
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

Hello Viktor,

This patch set looks good to me, thank you!

On 2/22/2023 4:12 PM, Viktor Prutyanov wrote:
> Hi,
>
> For now, elf2dmp is unable to convert ELF-dump to DMP-dump made of
> Windows Server 2022 guest. This patch series fixes it.
>
> v1: improve code-style fix
> v2: don't remove data directory entry RVA print and DOS header size check
Reviewed-by: Annie Li <annie.li@oracle.com>

Thanks

Annie

>
> Viktor Prutyanov (3):
>    contrib/elf2dmp: fix code style
>    contrib/elf2dmp: move PE dir search to pe_get_data_dir_entry
>    contrib/elf2dmp: add PE name check and Windows Server 2022 support
>
>   contrib/elf2dmp/addrspace.c |   1 +
>   contrib/elf2dmp/main.c      | 108 ++++++++++++++++++++++-----------
>   contrib/elf2dmp/pe.h        | 115 ++++++++++++++++++++----------------
>   3 files changed, 140 insertions(+), 84 deletions(-)
>

