Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4354D567713
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 21:02:50 +0200 (CEST)
Received: from localhost ([::1]:36392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8nov-0006p4-3I
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 15:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nJT-0007UW-EI
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:30:19 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:32904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o8nJR-0002s3-IW
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 14:30:19 -0400
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 265HEWru003090;
 Tue, 5 Jul 2022 18:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=p5m5hkkRNvaQxxp8bHqTZHu+BOCI9FawOnwXBlmZg9M=;
 b=SrBE+4SbjfjMEUlt+MsvMP3MuOgNUykJ7xs+5RP2dtEsglS4O4PK3Bhe2U+Uuz7nuiBC
 EOJGbatay/TzMEiSgvu/eY4sszYlyFNtmepJY16wo8TAji5PbrqvnI3AtVk3cLaxCBpC
 e4a4T5V/wSUD369TD/0mbCOYqaJTDcI6xBrsuffhBwVD6826ZAVPDO/quzstEx3ssFa3
 gXvvZtHDfM1M7ot1tcM6Ry8JjH9KryRGCT/24JB1SXRYw90EdnziwQ6HKQG21EtXhAqm
 8/4DqgEokLo9MVqZeNG8tnS/xYgqx7wehqPLoPJVL84/ClcO/5wbTgXncfQF/xnRi1QW +A== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3h2eju70c3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:30:03 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 265IPq9K014422; Tue, 5 Jul 2022 18:30:02 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam04lp2048.outbound.protection.outlook.com [104.47.74.48])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3h2cf2kfm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jul 2022 18:30:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Si8wAHjsRvsrLisxxAafXZ+MGajMoiErbYwU2xULFOSFBCxbL6oAWSSntem3v8/pWRAfTOUR5ZlKNVoAs6RpW6fPtw1bsSnmZL5szrGkdZtU/s6Hih9QWTDXn/r7TIbSCrEdYE4EbOFhJa3uIpUUB7d3WWBqE78AxvRKFwvT6C5Elp+k+D4bJEKSwJTlhuxrXCiZbCjfkMh/kUdDK3mpAXiIAXkT0Boc7hvOlC4Fsh78f8CaH/EUOIarFB+UjQwlsCiX7GSzG1l2PXb+oMO1n9bIGdwx5lPaJYaNTRjfS6zUzgybulGOPVnoWDNZjmBoD4R55IvfKZHVG+icM+h99w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5m5hkkRNvaQxxp8bHqTZHu+BOCI9FawOnwXBlmZg9M=;
 b=TMWes3uXJoaAH71yAbDj2RFp7X4YhoFdZE1QrZqCHEiHenMBtv06NtLBFicxuOav+zE36JGELDQfpZ0BdFqxkaPrMMpdaVg58asookh1QFTZ2IHdGhcyGNh3/MgzTCcWYligHwah39TTrT3iwzl5Lky9gUJs0HLcDRaBFirEif69pZIj7pBUSMYn68Vp3mYN3zqLChcuGaExhxXEUTj3olyYWr/opHyiexQbTE+pwV409cnF6mQY7OwJr4B3TYXycP9oSKyjvFdu30g9Klu/Weei/2TexKRisvZMVG+GF2vr6zqpOG904M9vaRUAvB9rzlTYGrBzCvjElGEdHuwt0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5m5hkkRNvaQxxp8bHqTZHu+BOCI9FawOnwXBlmZg9M=;
 b=ocBpVVv0PoWbhL6fSRu3qbVVdE3ET0EaxkSruzf14J2ejVLUuDhucWbCkLIToIl8yGQ8e45VcGxZkgp88iGfu1jXVZs4Jr6Hyws8vBCrWqVlWRdXcLAaaAW6KvI7srOPgDod4CfdW74uP5vzCCXLI6Qs/r6jtNq1acOxGO5nT7A=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by DS7PR10MB5341.namprd10.prod.outlook.com (2603:10b6:5:38d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Tue, 5 Jul
 2022 18:30:00 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::dc4d:56f4:a55b:4e9%6]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 18:30:00 +0000
Message-ID: <f95b01f5-c857-b375-5369-b0364894812e@oracle.com>
Date: Tue, 5 Jul 2022 14:29:53 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V8 36/39] chardev: cpr for sockets
Content-Language: en-US
To: Peng Liang <tcx4c70@gmail.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-37-git-send-email-steven.sistare@oracle.com>
 <1c909c0d-6d99-cbb9-0f2a-8186e716fd5d@gmail.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <1c909c0d-6d99-cbb9-0f2a-8186e716fd5d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0133.namprd11.prod.outlook.com
 (2603:10b6:806:131::18) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4d0a1b6-c661-4bcc-23bb-08da5eb45e4c
X-MS-TrafficTypeDiagnostic: DS7PR10MB5341:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RaiJ94hhE8aqdliuOD5iPTgVX3oTJXqw18UP7nR0YAOV8bDQUpnLsSTEKme/xTiQMQV3i82ImV1PS62sWM7L5idv2fWoEZ2SLpMkWnDsP6xH46s1mcwieOgYsqWIVLsH8z+9ilPRsWIHeTb9BSrSNXw9/n69MHLNm+IDNwAbZueidG0XIOUgp4nTpTeRNitYzXGfHI9Bt/jVjUDcz2ZqrOKy18aNSLidAVLx2E8LFBpC8n15wQHPugCbPcECKvG/SUuHF6GArfoZ0Kz+lKhyq2drgU3bBI0axkWEzb683z/RnNOJYVKuAdQdilN8zmEtQe3lETd0nxilXh040Otdc8BG8lpbJHKGJrcARDBbApB3tRwR7N19wcwrm0qn30NGQ9bWNjKBojP4tQIeD9Btxna9dM/G39WAOI/044QbhK1Ag2VSw9soODvG/pTgJLLODBKAtsgg84P/4xBGnMAxqKCKlV0J21zpIdAIB44sXgr6ooWDOFJVGJpDkax2AJWGpKhfuF38wmBsO89325PMEcRewAL/o+UNvmxWH4zg+yFVQ/GIs7u2aAwZjafJRLNfDdv4Wb4ITonOh7ySCZgFWBL0V1co8aYm0KPuqR+d8DdSkK3vLpxzzZND8kFDG/FdLd3kAI+oDhJpxC1jCepCQ99u6Cs7Y2ni3lQlLLKRqQH2Js6TB/4f1iJ6qnVfJ3jjTWJZmAFQ4hFitGMmMI0rmkt7d1FPKun6xlTXrpwo/zSlzt3j/hC9iYUnIX5BHXSHZuFd3RfKqqpvjt4XwDVmogsTB2yOoVfggk0LuBCdjiEOOrq+KkkT7MZcsKFor2nZiHA6Hq5k0ZyQtNjirELoJQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(366004)(39860400002)(376002)(346002)(396003)(36916002)(8936002)(7416002)(5660300002)(54906003)(4326008)(8676002)(66476007)(66556008)(66946007)(41300700001)(86362001)(31696002)(6666004)(316002)(186003)(6486002)(26005)(36756003)(6512007)(2616005)(6506007)(2906002)(53546011)(38100700002)(44832011)(31686004)(83380400001)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTJYeWYya0N0S1g4dHdTYzFpUitpNFRxakZEWDN3REx1Qk5qQ081V3ZBVmNZ?=
 =?utf-8?B?dWY2RVlhRVJFUTNBVVZPbWFTSEJtTC94RUhpZXBaT0k4YkFGZVVMT01CZE5x?=
 =?utf-8?B?K0xiQVRJYXNLRE0wcnkxNVVqU2czL01YSVpvcmY3UFBtQWpCS2dYaUZNQ2Nk?=
 =?utf-8?B?c01sL3prTGcrT1ljcno4dC91SHUzenVCY3d5VDlqei9MNnI4S1NnMkE5WTNo?=
 =?utf-8?B?M3JFTzNjSlVMV1lCRTQ5aDVtK2tVS3RDMWRSRWhGZVNqbnc2MElSSG1Sc2Z4?=
 =?utf-8?B?T25lcWlHR3Jqb05JTjJxUTlyMnphVXZQeUc4TVFJc1ZUQlpuU05EVEJlWmRm?=
 =?utf-8?B?Y2JQSjlUU1Q5cEJkTm95NUQwSHBvTVgwNDdlUUNDL3UyWVRZcml4Y2dEWG80?=
 =?utf-8?B?RkJTYnE2RjByTHhVYkNlMDFndXBUd3FVa1NBc0gwVmZFaHdYSFpIU29vTXVn?=
 =?utf-8?B?NEM2V2dvczZsRE80Y0xja1FEYm9adU5CVGVhbUJjNlpwS09GOEE1a2gzVFZt?=
 =?utf-8?B?cnpVRXUxWjFFMWVSMy9MWjV0eXBpMTRoUkU5eU1FTVFQNG53OGlsSmprQVpE?=
 =?utf-8?B?ajlPUXZTREt3M3MranhjWDJaL09JS004NDVjSi9wSVZGdWxmWEQ1T0hkclk1?=
 =?utf-8?B?cTlQdEpHUUNuWDdHOVFIazN3VElScTBBc2VCbGNTWGR1bG1yMG53WURVa3J4?=
 =?utf-8?B?aVZZb1U1T2FKdWlXRjJMYVd2V2FnTXU0QmpHdEFBZHdQcmdnREtqcElGZlha?=
 =?utf-8?B?Z0lTenNpVDVlbG4xV1dMZXEvTFRZeDdUK1pMZWRzVU9YL09Pa0Y1QUNXMmNQ?=
 =?utf-8?B?MitybGN6b3dSTDB3M3dsRHdSY2JZWGJnNVNWOU55N3greGx3VVNBTExNTTFG?=
 =?utf-8?B?ZWM1VzZ2SzZLSHZNODhLL0gyUXhVbGkzSzFYbU1Ub0R4alY4aW1mZVUvdkEx?=
 =?utf-8?B?WVJkVytoRnVpVTkrZU5QRmFWSWRrV2pwUjYzOFltclM0bHR1YlZ4Z2VaOUhX?=
 =?utf-8?B?ZzNxaDdxTDd1WXhpWHpVSEFsZmVxcDV4b2lyWEphYkhkR1BpVm9LNnhmSTJJ?=
 =?utf-8?B?YUsyNDJnZXo5MWh1aTJvb2VZT0tRZUlMYlhpL0pTMlQra2J0UEFqLzVteTh3?=
 =?utf-8?B?YnA3Yis1eDhCV2h3TVoyRlVzNzF1b2dsNVoyRXowcTVtYnhtQldWUlZNMmRR?=
 =?utf-8?B?ejg1cjJCYzdiV2ovY0VRNWdxT3d6OTB3QmRpc3JxYTlmbkFISkM2dURJM0tm?=
 =?utf-8?B?cytOdDAxUlRVQ25ORXJXeE03OXlwTDlwbjVTT1JTZmRBYjdtSElSSzJuWThP?=
 =?utf-8?B?RXQ2Mk1NU1cySTljMy9FVUVwS2N0QU40ZUVORWJkbjRMak1pOVZlb0VtN0VS?=
 =?utf-8?B?WTFqLzFNNUQxcWNpcWtTaXFwMU1za3ltcm5Bc2wzQ1lLcTlBSjFNOUtjLzdO?=
 =?utf-8?B?RjlwOUkvTFdZMkNaUTdiQ29FMTk5b2dtSk5XR2oxYml5bHhSbjhKcnpib0RM?=
 =?utf-8?B?b3M3SDRuQTJxK1hiZUxETTJtZUVlakl4c1ZGVXRwSkV3RUxhV1doVCs3dzRa?=
 =?utf-8?B?QzhPRFZCZnJyREM1Uyt3UWFPYTl5K3pxNUlsQ2k4Nk1oKzgvVVp2ODV4ZWZH?=
 =?utf-8?B?SURBcjQwcFN5ODlXemNFT2tGaE5Fdi9iT3QxTE92RFVrVnd6WXJOeFU3WkVS?=
 =?utf-8?B?eTczUHFvdkpYWXZSSVRLRncyYktYbndNeWgzbGJ6R1JFZGx1UXV2ZHB0cGxU?=
 =?utf-8?B?UWswN05ibWQ4UVdHbHlOKzRUQ1gwcjE3dUpmTURoN0d1RVBTajRDSjlWRTNn?=
 =?utf-8?B?WkdtNTJaZmZORUwwZGxsMkZaYzhUd1dJeFh0OW1KQStuWXVqME5xaHNId2V4?=
 =?utf-8?B?VWttY2QzR00vM2dCQUZkTWdXL3lkeTYzNWFiS3pHMDBhaTU1Y3FaZWJYdFFD?=
 =?utf-8?B?Um5XMzh2VHdXL0V2QTY1Z1pMeFVmYitFcXU0cGF6OTE4Sktvdmh5V0lzaExP?=
 =?utf-8?B?S055Rk91b3Q5UFZJVVp5WlMrcEhPOUIvZHdoa2l2YW1nR1F1eWUvdHVxckhO?=
 =?utf-8?B?YXpPaHV1VG9OVjkzV25XdWZzNnhkWlc5QjJMRjZvbzhONkR2Yk5XZ3Nmd2tj?=
 =?utf-8?B?U1hpNktmZitrM25iOGVJNFRLa1J2SmtPY0Jkd2Nid3VmV3BvNnkvN1VFZFV1?=
 =?utf-8?B?ZFE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d0a1b6-c661-4bcc-23bb-08da5eb45e4c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2022 18:29:59.8175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UfFm5vJbzzcS47CToyNm8dmzZsxoUGXRqpYlqzgg/Sg22SJi46LzU0e9jqZSvxhsjc12czIZAtlYZwON/iqGZ/0xAsWBHhFaKrBk4TA42ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5341
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.517, 18.0.883
 definitions=2022-07-05_15:2022-06-28,
 2022-07-05 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 suspectscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2207050079
X-Proofpoint-GUID: VdzCiDuBp7uBS1goCB07JYmyBLEHI7HN
X-Proofpoint-ORIG-GUID: VdzCiDuBp7uBS1goCB07JYmyBLEHI7HN
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0a-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 7/3/2022 4:19 AM, Peng Liang wrote:
> On 6/15/2022 10:52 PM, Steve Sistare wrote:
>> Save accepted socket fds before cpr-save, and look for them after cpr-load.
>> Block cpr-exec if a socket enables the TLS or websocket option.  Allow a
>> monitor socket by closing it on exec.
>>
>> Signed-off-by: Mark Kanda <mark.kanda@oracle.com>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>> ---
>>  chardev/char-socket.c         | 45 +++++++++++++++++++++++++++++++++++++++++++
>>  include/chardev/char-socket.h |  1 +
>>  monitor/hmp.c                 |  3 +++
>>  monitor/qmp.c                 |  3 +++
>>  4 files changed, 52 insertions(+)
>>
>> diff --git a/chardev/char-socket.c b/chardev/char-socket.c
>> index dc4e218..3a1e36b 100644
>> --- a/chardev/char-socket.c
>> +++ b/chardev/char-socket.c
>> @@ -26,6 +26,7 @@
>>  #include "chardev/char.h"
>>  #include "io/channel-socket.h"
>>  #include "io/channel-websock.h"
>> +#include "migration/cpr.h"
>>  #include "qemu/error-report.h"
>>  #include "qemu/module.h"
>>  #include "qemu/option.h"
>> @@ -33,6 +34,7 @@
>>  #include "qapi/clone-visitor.h"
>>  #include "qapi/qapi-visit-sockets.h"
>>  #include "qemu/yank.h"
>> +#include "sysemu/sysemu.h"
>>  
>>  #include "chardev/char-io.h"
>>  #include "chardev/char-socket.h"
>> @@ -358,6 +360,11 @@ static void tcp_chr_free_connection(Chardev *chr)
>>      SocketChardev *s = SOCKET_CHARDEV(chr);
>>      int i;
>>  
>> +    if (chr->cpr_enabled) {
>> +        cpr_delete_fd(chr->label, 0);
>> +    }
>> +    cpr_del_blocker(&s->cpr_blocker);
>> +
>>      if (s->read_msgfds_num) {
>>          for (i = 0; i < s->read_msgfds_num; i++) {
>>              close(s->read_msgfds[i]);
>> @@ -923,6 +930,10 @@ static void tcp_chr_accept(QIONetListener *listener,
>>                                 QIO_CHANNEL(cioc));
>>      }
>>      tcp_chr_new_client(chr, cioc);
>> +
>> +    if (s->sioc && chr->cpr_enabled) {
>> +        cpr_resave_fd(chr->label, 0, s->sioc->fd, NULL);
>> +    }
>>  }
>>  
>>  
>> @@ -1178,6 +1189,26 @@ static gboolean socket_reconnect_timeout(gpointer opaque)
>>      return false;
>>  }
>>  
>> +static int load_char_socket_fd(Chardev *chr, Error **errp)
>> +{
>> +    SocketChardev *sockchar = SOCKET_CHARDEV(chr);
>> +    QIOChannelSocket *sioc;
>> +    const char *label = chr->label;
>> +    int fd = cpr_find_fd(label, 0);
>> +
>> +    if (fd != -1) {
>> +        sockchar = SOCKET_CHARDEV(chr);
>> +        sioc = qio_channel_socket_new_fd(fd, errp);
>> +        if (sioc) {
>> +            tcp_chr_accept(sockchar->listener, sioc, chr);
>> +            object_unref(OBJECT(sioc));
>> +        } else {
>> +            error_setg(errp, "could not restore socket for %s", label);
> 
> If we go here, then qio_channel_socket_new_fd fails and errp should be set. So I think
> error_prepend is more appropriate here.

Good suggestion, will do, thanks - Steve

[...]

