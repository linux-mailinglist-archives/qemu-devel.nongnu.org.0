Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84BC4460BE
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 09:38:08 +0100 (CET)
Received: from localhost ([::1]:52656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miujf-0005EU-BB
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 04:38:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1miuiK-0003vw-PX; Fri, 05 Nov 2021 04:36:44 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:13536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonah.palmer@oracle.com>)
 id 1miuiE-0001s6-Rh; Fri, 05 Nov 2021 04:36:44 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A56Jbjp013055; 
 Fri, 5 Nov 2021 08:36:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=content-type :
 message-id : date : subject : to : cc : references : from : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=tkhQ2fZ1zYsd06aNwnucMShSFTJ9QpM9/JjMW9j9PVg=;
 b=Cfu1I3UN2wz+yQ8Vjfn+G0uptN95CMYR7DhLmB6ASgQZLi400+yVl8Qqdp9v8Z821Im9
 K/P5DihnTjRV1cWkGCjVqxk2vq7IzRgq/LqnJQGrdVBYpR5J/1IMIxJVmqjryGYBGJe4
 w3zvV8A849Udk2+fDc0yAzOE2U3AJWwJmQ2rP3ZksOFfwaich+7BnegeAS4ArJTuIN7E
 00tqDhMboSYmqNZkuL4stAXK29bTTdW03y7xoEWCaY3nfQgV/ytiwKJJriRzJ/HXP/CA
 /00ITa8pivpeODFzaXWLOYBDbUsaUDnyZdJ9icUTIwOAvl+8nJUjMdgC1R9qDfy83ems YQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3c4t7f1bwt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Nov 2021 08:36:23 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1A58Vnuo024354;
 Fri, 5 Nov 2021 08:36:22 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com
 (mail-sn1anam02lp2049.outbound.protection.outlook.com [104.47.57.49])
 by aserp3030.oracle.com with ESMTP id 3c4t5nd06p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 05 Nov 2021 08:36:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JulvUM0+VhT7gWZ5dyuWzo7q5vBnUKdFBvPTSoTrGVImShfKKyKfQMGPRnRJhG+z5HpbOlkIWgSK+zQbKrztca/HTfhR/lgx1aqR4bNxwRExbnh3YpQxJW5SpeRpWTnb0tC+SdYZRzHtssWMhs61vn3EK269SsSawwS972koQK5hqCtjeGW/LP0WDVmUS570Kt6TAxkO6uaue+0fm4MSH4SwhYmomKMbuqCFyKP+rOtR/IJnp6E+NKKALIm3hIEitJqtrdtZxtdGAsLc0TRSpj/umtrfP+cE58oy41UyWWK7wgf0S0g+sfniIZPHXKo8JkbcYzsusfM0ndO9FtnYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tkhQ2fZ1zYsd06aNwnucMShSFTJ9QpM9/JjMW9j9PVg=;
 b=oaDW+i43gKqhpgbaTZ4++O23qnIJzHoJTQof+aneGLTndyXdO2hKYz/NHxjGlu+1Y3kMckkPzjUc/Iv2evhxfn8qgbuzK7Dl+YTZSfInKLLbpcebdV6MCqgCfVFzRZ+pQXJ9SpGCAXuiE3OcyuwQXPVYD5Q9y0V+q7ho2bbYcFMcPBLq0unFfZshgcMWUoG+yQNhUx8xVRiFPgJAy5TtP58mlcUWwh9AdChErPQywBDkBS+ZnoNVQMn4aV+WSvrT/8cOOqDqNYNIpfXx0khxezl2rZIbJGkB2WfnNohEQrEdKQ8hc/p8+JSbjSxakh2hbNhBCk2DY4bVA6C3sBeDCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tkhQ2fZ1zYsd06aNwnucMShSFTJ9QpM9/JjMW9j9PVg=;
 b=QujBhj7rmcW5aq5dTJsnDxkzOQDAd5dM1ScoLbX9U0SzL5wRnbUsEWsDKYyUvvkrhl8lJB0cMisjcR1VLVpLSQKhZjnBfQuA+WA00sulehHp+x4oiKklV4SnIXOXyjXUAj0iVOf3UWhjymUfMoSKcXzJba220mb5nwvTOMrdHtQ=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from SA2PR10MB4667.namprd10.prod.outlook.com (2603:10b6:806:111::21)
 by SA2PR10MB4811.namprd10.prod.outlook.com (2603:10b6:806:11f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.14; Fri, 5 Nov
 2021 08:36:20 +0000
Received: from SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::6092:9e8:aa36:f263]) by SA2PR10MB4667.namprd10.prod.outlook.com
 ([fe80::6092:9e8:aa36:f263%7]) with mapi id 15.20.4669.011; Fri, 5 Nov 2021
 08:36:20 +0000
Content-Type: multipart/alternative;
 boundary="------------K0lGqw0DWRA0kA7UkzIKqm7P"
Message-ID: <69536f67-1399-e95b-6dc7-a2fe5237c609@oracle.com>
Date: Fri, 5 Nov 2021 04:36:16 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 4/8] qmp: add QMP command x-debug-virtio-status
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
References: <1635334909-31614-1-git-send-email-jonah.palmer@oracle.com>
 <1635334909-31614-5-git-send-email-jonah.palmer@oracle.com>
 <874k8s9bkl.fsf@dusky.pond.sub.org>
From: Jonah Palmer <jonah.palmer@oracle.com>
In-Reply-To: <874k8s9bkl.fsf@dusky.pond.sub.org>
X-ClientProxiedBy: SN7PR04CA0003.namprd04.prod.outlook.com
 (2603:10b6:806:f2::8) To SA2PR10MB4667.namprd10.prod.outlook.com
 (2603:10b6:806:111::21)
MIME-Version: 1.0
Received: from [10.39.215.155] (209.17.40.45) by
 SN7PR04CA0003.namprd04.prod.outlook.com (2603:10b6:806:f2::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.11 via Frontend Transport; Fri, 5 Nov 2021 08:36:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8688e983-ac32-4f0b-f9b1-08d9a0375797
X-MS-TrafficTypeDiagnostic: SA2PR10MB4811:
X-Microsoft-Antispam-PRVS: <SA2PR10MB4811BA403C499B7F237BB01CE88E9@SA2PR10MB4811.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KyOFFYN0n9XoIQjOXjC3qOZIy/nQcIO8EmG6y16pxpQ47r1eieGtQkALHWo6GQ7qLd6DdGreEyDMTEK796AAdBdSy4t8nuTQe8zlbFzq3nWOFqXo94hsiGcYNpyEfeB831w6F64fH40GYPGgH6ojtWcM3mVXlhWQrXj+WXjVBRodmts3u6gu3m7FtMvgqz8StZP1LTdXb7AKWy++9y2rWesm98CRM+L8JK+InqmTVNIE1b+ZajLHkerKdAji4vEAee1UbhoFPAs6s1+urrf9fWHU3e58SNo8ODXt6GsjYFkSniFMbxmyqu09KSJ3CnG3smAgpMqj+HNUQ3iE8jMj2LiCpRvocbnXzr/U+Jo7PUHnBCUr9px1Rgm4SUgzbmaUsRv68WU5PeV/TxXA6uuqsaXnndvrZhUueBtCst8lbR4y4cfUDpGhcdad6AM2JWF1+ILR3JxC2WKuDIvwcUcO8+ym5EKs3M+fvYJ5nd9n1Qt3IkPDOxyCdjcAb5egQT2QdbMZOFfxeO0yabA296xDXHJYqF1lc2Pbh4RJCpK0NFaT4PSHw1N+6Fp5GZ+gXFNZhlWmkAOSOjOpkkcLQoj9+FYn/sGCEX9nIF0hNX5MNiSR7GDjjPTbq4QVHze1L4BfbCQ21rdFWbaZUrIuGE9KX0jKlogyjXn+fzkz8INah0qiNWwSAfndZ1kSkwZIVXHpPZoDI2Q46UpcljIppG7/3+dVEXtd1lh0cxBfL9xuHvvDBUrhwPRpGyRZYQFGvqAk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4667.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(66476007)(16576012)(36756003)(186003)(44832011)(508600001)(2906002)(8676002)(316002)(31686004)(2616005)(6486002)(83380400001)(6916009)(53546011)(26005)(38100700002)(31696002)(4326008)(5660300002)(956004)(86362001)(33964004)(66946007)(8936002)(7416002)(30864003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmNsZGRIYlNKV1B1dDVkYjFnZlkxaDhnNjlkZ00yTjY2RjZ4QThWVFhpdlBG?=
 =?utf-8?B?KzJWTkl2R3hJTG85V0I1SHFTRURLY0tFUE9VYXl2c0FHbG9HK0pUcXMwQk5n?=
 =?utf-8?B?dE5RcS9QNXVEV1hzUGpleXlyNTNVVWFGVm8wNm9hUWsyeDdtSWhVdURUL3FZ?=
 =?utf-8?B?L2VHV2Jhenp6UjdvaVpBcG84KzVYN1dHbWlFYnB0N2I2NWVDVzQrNnFwaWxM?=
 =?utf-8?B?QVY2TENhczNqTWxpZi92UmxDSkY1VVhFbEJWRXB4eXdlRTF0NXF3bVk2NG1m?=
 =?utf-8?B?K3UvaFE1U0UwTXZNREZrL1RwN2p6eGhLenJLbUhZZFFwMGFTb0RGQzJpM3lw?=
 =?utf-8?B?bFF2QmpyNTRyWDV2MCtWRjNVUXlBbmlJUGEwMTRxTFk5cUdvR0djMTBNbllk?=
 =?utf-8?B?NFExL0c3ZEluMnZoWThHNmNnbDVBTDBCWWJDTDh0YWdkZEJkdDU0U2pGU0Jq?=
 =?utf-8?B?UWgwQWE2bXF1NVQ2eFg2V01OTkFWeVhnTTVaZ3NBamZtemtPK1YyakZWOTI1?=
 =?utf-8?B?Q0tlQ0JydTM4RlRJcnBEaHRMajFpbE03OWVLRXVBNzMwMGFPQTdYSVJTQ1cx?=
 =?utf-8?B?alBmb080aUVsRFUxV2o4ZHZiVi8zaG9aa243U2kyaUpTUmFIK1NtSDZLcGQ2?=
 =?utf-8?B?VHVGQ3lLNFlZazBQVUVHRXR1bzVnZldqZFVLdnR1Y1VsTnFyL2ErczJ0S2la?=
 =?utf-8?B?ekRrRnVMQk9sYnIzOWFvZWxWUnVNK1pUbEQrTEFHeCsxKzlWMmwyZ1QrVFl1?=
 =?utf-8?B?R1VjNEMyeXE5QzFNN0pGYXZIWGdKWS9NQVdNc2xIdDZyK0V6VzdHb0JhSTV2?=
 =?utf-8?B?OWZlbDhrQy9yZm1aK2lIenRiOVhEWGhzL2dFTVdvM3hYeVoyUC9PZ0xvaW1w?=
 =?utf-8?B?d2J4Mm80SDZYcklHaWdhVmhtdWZqdGVZRk52dFBQYjByVHJqNGdoUFZsZTlo?=
 =?utf-8?B?b3NzbVBhc3MxOUpHak9YeTlVbEZjZnloR2REaG9kNXhUMm52enM1RzArMGZO?=
 =?utf-8?B?REJGV0lJRW5zYXRKTGFHUzNYOWdQQW15RkN4NFFFeUIrZ0RGeXVHazVSQjh3?=
 =?utf-8?B?WTVDWldQZGZnaWZDVmJvVlNnSkNqaUFnZk4zcWlwRFFsc0wvUk8yWmMzbmNW?=
 =?utf-8?B?d3R6K3A4NkRUYVNYVytuZGVSSk1zbjlZTm5ydUp2Y1lZWTFhOGtUOXU5cE43?=
 =?utf-8?B?QXErVWVOMDJqUWVKT1l6ZmQ3Q0dJWWJycHI5ZFZHenQ2aVZQK1RnWmZMRFZm?=
 =?utf-8?B?QkcxalNPWGNBOFlacitxc0tPVDdmVjRISllIeEFKcThDL2xkc2lMU2hQR290?=
 =?utf-8?B?UUl0c1VKbXZhNmI2b1VzMG8vVHNMQlVFaU1yQ09aN1RrUXRxWVZVTzdTVDZ4?=
 =?utf-8?B?WTRWOEVGSzBIcHdyUVkrdVJsOEUyZ1hUamhKUG0rQUd5cjV0a2dEdlVnQnVQ?=
 =?utf-8?B?d1Bya0cyUWR0U0RPd1JqWGUzaUVUSHhUNkEzWXpLbS8rcE9ESjZnbDExSTB1?=
 =?utf-8?B?eE5Yd2x0MzJkWmUwYzVXTHBHRkFwVjdKdk41REc4dlJ0ZHVvL3BYZ0g5T3NT?=
 =?utf-8?B?ZnhBRXBJZVg5ZXJKUUJ5UHkvRGpsNU1PYWR3U3B1WmpsNXA1NmlhMlBnWDJP?=
 =?utf-8?B?amRSejNPbWRtNmVoQWRDWFRNeHBoM29udXgyUFV0ZTJUZ0VUYWJldFAzaysy?=
 =?utf-8?B?ODR1MGJva3Y0SnpJOGh0MUs2dlZEM200RXk3UnhRZmswTEFTVjNJMEUyU0Vn?=
 =?utf-8?B?VWQwZ1YrYWZTQk5pcldhY3hrOUR1aFltRmZJdTRCYUpPRExwSGtQaThWcGtp?=
 =?utf-8?B?eWF6QjJZaUoyREhoYjlIcW9yZ09nSTQ1eDZTN2RnOE4rZjB5S2dYR2dXOWhs?=
 =?utf-8?B?QUFsQ1Z3eDF2MmFrZGU4NDN3dU50OGVsUGQ3ekVHa2E1SElHNHdIdFNWQ1VU?=
 =?utf-8?B?eE1LZjI5MzM5MEdENlJLMjBiL3Bjc3VjbnpydXZ6RnRJY2hOTU1JQU1yd2JP?=
 =?utf-8?B?U3pGdk15SzBybkVZWWdaUXFuVjErZmljRGZNYXRaSmdMSVYxV3pydUxsUG5P?=
 =?utf-8?B?SlpmVlRINjlGa082cXJBalcyNlp6aFJ6WWxKVVJjL21GTTV6Yk55R2NWTDNy?=
 =?utf-8?B?VUhEWTNMY0trbHo3NEEvaWJSUVJmNUZ5SFBId3dmekJEVHZ1NjVlb1N5dmFJ?=
 =?utf-8?Q?dhShV9nYiNzmzJp+eHb+g1o=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8688e983-ac32-4f0b-f9b1-08d9a0375797
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4667.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 08:36:20.4402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YGCd5VZDJ6Qe5jf5wQalsKPa4Hs/8iUMGBmlwOG/nodvy7UWcYOxDaRGR7e9Z0tyoPcorFkjDOKCp8mtFzd1Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4811
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10158
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 adultscore=0 mlxscore=0 malwarescore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111050049
X-Proofpoint-ORIG-GUID: OiAZ4cV7wJYlEEUjJLOhWxRWB5Wv9D1q
X-Proofpoint-GUID: OiAZ4cV7wJYlEEUjJLOhWxRWB5Wv9D1q
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=jonah.palmer@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: mst@redhat.com, qemu_oss@crudebyte.com, qemu-devel@nongnu.org,
 kraxel@redhat.com, si-wei.liu@oracle.com, joao.m.martins@oracle.com,
 eblake@redhat.com, qemu-block@nongnu.org, david@redhat.com,
 arei.gonglei@huawei.com, marcandre.lureau@redhat.com, lvivier@redhat.com,
 thuth@redhat.com, michael.roth@amd.com, groug@kaod.org, dgilbert@redhat.com,
 eric.auger@redhat.com, stefanha@redhat.com, boris.ostrovsky@oracle.com,
 kwolf@redhat.com, mathieu.poirier@linaro.org, raphael.norwitz@nutanix.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--------------K0lGqw0DWRA0kA7UkzIKqm7P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 11/4/21 11:37, Markus Armbruster wrote:
> Jonah Palmer<jonah.palmer@oracle.com>  writes:
>
>> From: Laurent Vivier<lvivier@redhat.com>
>>
>> This new command shows the status of a VirtIODevice, including
>> its corresponding vhost device status (if active).
>>
>> Next patch will improve output by decoding feature bits, including
>> vhost device's feature bits (backend, protocol, acked, and features).
>> Also will decode status bits of a VirtIODevice.
>>
>> Next patch will also suppress the vhost device field from displaying
>> if no vhost device is active for a given VirtIODevice.
>>
>> Signed-off-by: Jonah Palmer<jonah.palmer@oracle.com>
>> ---
> [...]
>
>> diff --git a/qapi/virtio.json b/qapi/virtio.json
>> index 4490c2c..656a26f 100644
>> --- a/qapi/virtio.json
>> +++ b/qapi/virtio.json
>> @@ -65,3 +65,258 @@
>>   ##
>>   
>>   { 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
>> +
>> +##
>> +# @VirtioStatusEndianness:
>> +#
>> +# Enumeration of endianness for VirtioDevice
>> +#
>> +# Since: 6.2
>> +##
>> +
>> +{ 'enum': 'VirtioStatusEndianness',
>> +  'data': [ 'unknown', 'little', 'big' ]
>> +}
>> +
>> +##
>> +# @VhostStatus:
>> +#
>> +# Information about a vhost device. This information will only be
>> +# displayed if the vhost device is active.
>> +#
>> +# @n-mem-sections: vhost_dev n_mem_sections
>> +#
>> +# @n-tmp-sections: vhost_dev n_tmp_sections
>> +#
>> +# @nvqs: vhost_dev nvqs. This is the number of virtqueues being used
>> +#        by the vhost device.
>> +#
>> +# @vq-index: vhost_dev vq_index
>> +#
>> +# @features: vhost_dev features
>> +#
>> +# @acked-features: vhost_dev acked_features
>> +#
>> +# @backend-features: vhost_dev backend_features
>> +#
>> +# @protocol-features: vhost_dev protocol_features
>> +#
>> +# @max-queues: vhost_dev max_queues
>> +#
>> +# @backend-cap: vhost_dev backend_cap
>> +#
>> +# @log-enabled: vhost_dev log_enabled flag
>> +#
>> +# @log-size: vhost_dev log_size
>> +#
>> +# Since: 6.2
>> +#
>> +##
>> +
>> +{ 'struct': 'VhostStatus',
>> +    'data': {
>> +        'n-mem-sections': 'int',
>> +        'n-tmp-sections': 'int',
> Odd indentation.  Better
>
>     { 'struct': 'VhostStatus',
>       'data': {
>           'n-mem-sections': 'int',
>           'n-tmp-sections': 'int',
>
> or
>
>     { 'struct': 'VhostStatus',
>       'data': { 'n-mem-sections': 'int',
>                 'n-tmp-sections': 'int',
>
> More of the same below, and possibly in other patches.  I'm not going to
> point it out again.

Gotcha, I'll use this format in the .json file. Will change it to this for
all relevant patches.

>
>> +        'nvqs': 'uint32',
>> +        'vq-index': 'int',
>> +        'features': 'uint64',
>> +        'acked-features': 'uint64',
>> +        'backend-features': 'uint64',
>> +        'protocol-features': 'uint64',
>> +        'max-queues': 'uint64',
>> +        'backend-cap': 'uint64',
>> +        'log-enabled': 'bool',
>> +        'log-size': 'uint64'
>> +    }
>> +}
> I can't tell whether these are all needed.  Got to trust virtio experts
> there.

Not sure either, I just included whatever I could include.

>
> I'm not checking the schema types match the data sources' C types.  I
> hope you did :)

Yes c:

>
> More of the same below, and possibly in other patches.  I'm not going to
> point it out again.
>
>> +
>> +##
>> +# @VirtioStatus:
>> +#
>> +# Full status of the virtio device with most VirtIODevice members.
>> +# Also includes the full status of the corresponding vhost device
>> +# if the vhost device is active.
>> +#
>> +# @name: VirtIODevice name
>> +#
>> +# @device-id: VirtIODevice ID
>> +#
>> +# @vhost-started: VirtIODevice vhost_started flag
>> +#
>> +# @guest-features: VirtIODevice guest_features
>> +#
>> +# @host-features: VirtIODevice host_features
>> +#
>> +# @backend-features: VirtIODevice backend_features
>> +#
>> +# @device-endian: VirtIODevice device_endian
>> +#
>> +# @num-vqs: VirtIODevice virtqueue count. This is the number of active
>> +#           virtqueues being used by the VirtIODevice.
>> +#
>> +# @status: VirtIODevice configuration status (e.g. DRIVER_OK,
>> +#          FEATURES_OK, DRIVER, etc.)
>> +#
>> +# @isr: VirtIODevice ISR
>> +#
>> +# @queue-sel: VirtIODevice queue_sel
>> +#
>> +# @vm-running: VirtIODevice vm_running flag
>> +#
>> +# @broken: VirtIODevice broken flag
>> +#
>> +# @disabled: VirtIODevice disabled flag
>> +#
>> +# @use-started: VirtIODevice use_started flag
>> +#
>> +# @started: VirtIODevice started flag
>> +#
>> +# @start-on-kick: VirtIODevice start_on_kick flag
>> +#
>> +# @disable-legacy-check: VirtIODevice disabled_legacy_check flag
>> +#
>> +# @bus-name: VirtIODevice bus_name
>> +#
>> +# @use-guest-notifier-mask: VirtIODevice use_guest_notifier_mask flag
>> +#
>> +# @vhost-dev: corresponding vhost device info for a given VirtIODevice
>> +#
>> +# Since: 6.2
>> +#
>> +##
>> +
>> +{ 'struct': 'VirtioStatus',
>> +    'data': {
>> +        'name': 'str',
>> +        'device-id': 'uint16',
>> +        'vhost-started': 'bool',
>> +        'guest-features': 'uint64',
>> +        'host-features': 'uint64',
>> +        'backend-features': 'uint64',
>> +        'device-endian': 'VirtioStatusEndianness',
>> +        'num-vqs': 'int',
>> +        'status': 'uint8',
>> +        'isr': 'uint8',
>> +        'queue-sel': 'uint16',
>> +        'vm-running': 'bool',
>> +        'broken': 'bool',
>> +        'disabled': 'bool',
>> +        'use-started': 'bool',
>> +        'started': 'bool',
>> +        'start-on-kick': 'bool',
>> +        'disable-legacy-check': 'bool',
>> +        'bus-name': 'str',
>> +        'use-guest-notifier-mask': 'bool',
>> +        'vhost-dev': 'VhostStatus'
>> +    }
>> +}
>> +
>> +##
>> +# @x-debug-virtio-status:
>> +#
>> +# Poll for a comprehensive status of a given virtio device
>> +#
>> +# @path: Canonical QOM path of the VirtIODevice
>> +#
>> +# Returns: VirtioStatus of the virtio device
>> +#
>> +# Since: 6.2
>> +#
>> +# Examples:
>> +#
>> +# 1. Poll for the status of virtio-crypto (no vhost-crypto active)
>> +#
>> +# -> { "execute": "x-debug-virtio-status",
>> +#      "arguments": {
>> +#          "path": "/machine/peripheral/crypto0/virtio-backend"
>> +#      }
>> +#    }
>> +# <- { "return": {
>> +#          "device-endian": "little",
>> +#          "bus-name": "",
>> +#          "disable-legacy-check": false,
>> +#          "name": "virtio-crypto",
>> +#          "started": true,
>> +#          "device-id": 20,
>> +#          "vhost-dev": {
>> +#               "n-tmp-sections": 0,
>> +#               "n-mem-sections": 0,
>> +#               "max-queues": 0,
>> +#               "backend-cap": 0,
>> +#               "log-size": 0,
>> +#               "backend-features": 0,
>> +#               "nvqs": 0,
>> +#               "protocol-features": 0,
>> +#               "vq-index": 0,
>> +#               "log-enabled": false,
>> +#               "acked-features": 0,
>> +#               "features": 0
>> +#          },
>> +#          "backend-features": 0,
>> +#          "start-on-kick": false,
>> +#          "isr": 1,
>> +#          "broken": false,
>> +#          "status": 15,
>> +#          "num-vqs": 2,
>> +#          "guest-features": 5100273664,
>> +#          "host-features": 6325010432,
>> +#          "use-guest-notifier-mask": true,
>> +#          "vm-running": true,
>> +#          "queue-sel": 1,
>> +#          "disabled": false,
>> +#          "vhost-started": false,
>> +#          "use-started": true
>> +#      }
>> +#    }
>> +#
>> +# 2. Poll for the status of virtio-net (vhost-net is active)
>> +#
>> +# -> { "execute": "x-debug-virtio-status",
>> +#      "arguments": {
>> +#          "path": "/machine/peripheral-anon/device[1]/virtio-backend"
>> +#      }
>> +#    }
>> +# <- { "return": {
>> +#          "device-endian": "little",
>> +#          "bus-name": "",
>> +#          "disabled-legacy-check": false,
>> +#          "name": "virtio-net",
>> +#          "started": true,
>> +#          "device-id": 1,
>> +#          "vhost-dev": {
>> +#               "n-tmp-sections": 4,
>> +#               "n-mem-sections": 4,
>> +#               "max-queues": 1,
>> +#               "backend-cap": 2,
>> +#               "log-size": 0,
>> +#               "backend-features": 0,
>> +#               "nvqs": 2,
>> +#               "protocol-features": 0,
>> +#               "vq-index": 0,
>> +#               "log-enabled": false,
>> +#               "acked-features": 5100306432,
>> +#               "features": 13908344832
>> +#          },
>> +#          "backend-features": 6337593319,
>> +#          "start-on-kick": false,
>> +#          "isr": 1,
>> +#          "broken": false,
>> +#          "status": 15,
>> +#          "num-vqs": 3,
>> +#          "guest-features": 5111807911,
>> +#          "host-features": 6337593319,
>> +#          "use-guest-notifier-mask": true,
>> +#          "vm-running": true,
>> +#          "queue-sel": 2,
>> +#          "disabled": false,
>> +#          "vhost-started": true,
>> +#          "use-started": true
>> +#      }
>> +#    }
>> +#
>> +##
>> +
>> +{ 'command': 'x-debug-virtio-status',
>> +  'data': { 'path': 'str' },
>> +  'returns': 'VirtioStatus'
>> +}
> Unstable commands now need to be marked with
>
>       'features': [ 'unstable' ]
>
> If you do that, the QAPI generator will demand documentation.  So add
>     
>     # Features:
>     # @unstable: This command is meant for debugging.
>
> You may want to grep for examples.  See also commit 9fb49daabf "qapi:
> Mark unstable QMP parts with feature 'unstable'".

Got it. I will add this in for all 'x-' related commands.

>
> Hmm, this command starts with x-debug-virtio-, wheras the one added in
> the previous commit starts with x-debug-query-virtio-.
>
> By conventions, commands that just return information on FOO are named
> query-FOO.  I recommend an x-query-virtio- prefix for your query
> commands.  We can leave their purpose (debug) to documentation.

Sure thing! I'll make this change.

>
Jonah
--------------K0lGqw0DWRA0kA7UkzIKqm7P
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 11/4/21 11:37, Markus Armbruster
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:874k8s9bkl.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Laurent Vivier <a class="moz-txt-link-rfc2396E" href="mailto:lvivier@redhat.com">&lt;lvivier@redhat.com&gt;</a>

This new command shows the status of a VirtIODevice, including
its corresponding vhost device status (if active).

Next patch will improve output by decoding feature bits, including
vhost device's feature bits (backend, protocol, acked, and features).
Also will decode status bits of a VirtIODevice.

Next patch will also suppress the vhost device field from displaying
if no vhost device is active for a given VirtIODevice.

Signed-off-by: Jonah Palmer <a class="moz-txt-link-rfc2396E" href="mailto:jonah.palmer@oracle.com">&lt;jonah.palmer@oracle.com&gt;</a>
---
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
[...]

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/qapi/virtio.json b/qapi/virtio.json
index 4490c2c..656a26f 100644
--- a/qapi/virtio.json
+++ b/qapi/virtio.json
@@ -65,3 +65,258 @@
 ##
 
 { 'command': 'x-debug-query-virtio', 'returns': ['VirtioInfo'] }
+
+##
+# @VirtioStatusEndianness:
+#
+# Enumeration of endianness for VirtioDevice
+#
+# Since: 6.2
+##
+
+{ 'enum': 'VirtioStatusEndianness',
+  'data': [ 'unknown', 'little', 'big' ]
+}
+
+##
+# @VhostStatus:
+#
+# Information about a vhost device. This information will only be
+# displayed if the vhost device is active.
+#
+# @n-mem-sections: vhost_dev n_mem_sections
+#
+# @n-tmp-sections: vhost_dev n_tmp_sections
+#
+# @nvqs: vhost_dev nvqs. This is the number of virtqueues being used
+#        by the vhost device.
+#
+# @vq-index: vhost_dev vq_index
+#
+# @features: vhost_dev features
+#
+# @acked-features: vhost_dev acked_features
+#
+# @backend-features: vhost_dev backend_features
+#
+# @protocol-features: vhost_dev protocol_features
+#
+# @max-queues: vhost_dev max_queues
+#
+# @backend-cap: vhost_dev backend_cap
+#
+# @log-enabled: vhost_dev log_enabled flag
+#
+# @log-size: vhost_dev log_size
+#
+# Since: 6.2
+#
+##
+
+{ 'struct': 'VhostStatus',
+    'data': {
+        'n-mem-sections': 'int',
+        'n-tmp-sections': 'int',
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Odd indentation.  Better

   { 'struct': 'VhostStatus',
     'data': {
         'n-mem-sections': 'int',
         'n-tmp-sections': 'int',

or

   { 'struct': 'VhostStatus',
     'data': { 'n-mem-sections': 'int',
               'n-tmp-sections': 'int',

More of the same below, and possibly in other patches.  I'm not going to
point it out again.</pre>
    </blockquote>
    <pre>Gotcha, I'll use this format in the .json file. Will change it to this for
all relevant patches.
</pre>
    <blockquote type="cite" cite="mid:874k8s9bkl.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+        'nvqs': 'uint32',
+        'vq-index': 'int',
+        'features': 'uint64',
+        'acked-features': 'uint64',
+        'backend-features': 'uint64',
+        'protocol-features': 'uint64',
+        'max-queues': 'uint64',
+        'backend-cap': 'uint64',
+        'log-enabled': 'bool',
+        'log-size': 'uint64'
+    }
+}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I can't tell whether these are all needed.  Got to trust virtio experts
there.</pre>
    </blockquote>
    <pre>Not sure either, I just included whatever I could include.
</pre>
    <blockquote type="cite" cite="mid:874k8s9bkl.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

I'm not checking the schema types match the data sources' C types.  I
hope you did :)</pre>
    </blockquote>
    <pre>Yes c:
</pre>
    <blockquote type="cite" cite="mid:874k8s9bkl.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

More of the same below, and possibly in other patches.  I'm not going to
point it out again.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+##
+# @VirtioStatus:
+#
+# Full status of the virtio device with most VirtIODevice members.
+# Also includes the full status of the corresponding vhost device
+# if the vhost device is active.
+#
+# @name: VirtIODevice name
+#
+# @device-id: VirtIODevice ID
+#
+# @vhost-started: VirtIODevice vhost_started flag
+#
+# @guest-features: VirtIODevice guest_features
+#
+# @host-features: VirtIODevice host_features
+#
+# @backend-features: VirtIODevice backend_features
+#
+# @device-endian: VirtIODevice device_endian
+#
+# @num-vqs: VirtIODevice virtqueue count. This is the number of active
+#           virtqueues being used by the VirtIODevice.
+#
+# @status: VirtIODevice configuration status (e.g. DRIVER_OK,
+#          FEATURES_OK, DRIVER, etc.)
+#
+# @isr: VirtIODevice ISR
+#
+# @queue-sel: VirtIODevice queue_sel
+#
+# @vm-running: VirtIODevice vm_running flag
+#
+# @broken: VirtIODevice broken flag
+#
+# @disabled: VirtIODevice disabled flag
+#
+# @use-started: VirtIODevice use_started flag
+#
+# @started: VirtIODevice started flag
+#
+# @start-on-kick: VirtIODevice start_on_kick flag
+#
+# @disable-legacy-check: VirtIODevice disabled_legacy_check flag
+#
+# @bus-name: VirtIODevice bus_name
+#
+# @use-guest-notifier-mask: VirtIODevice use_guest_notifier_mask flag
+#
+# @vhost-dev: corresponding vhost device info for a given VirtIODevice
+#
+# Since: 6.2
+#
+##
+
+{ 'struct': 'VirtioStatus',
+    'data': {
+        'name': 'str',
+        'device-id': 'uint16',
+        'vhost-started': 'bool',
+        'guest-features': 'uint64',
+        'host-features': 'uint64',
+        'backend-features': 'uint64',
+        'device-endian': 'VirtioStatusEndianness',
+        'num-vqs': 'int',
+        'status': 'uint8',
+        'isr': 'uint8',
+        'queue-sel': 'uint16',
+        'vm-running': 'bool',
+        'broken': 'bool',
+        'disabled': 'bool',
+        'use-started': 'bool',
+        'started': 'bool',
+        'start-on-kick': 'bool',
+        'disable-legacy-check': 'bool',
+        'bus-name': 'str',
+        'use-guest-notifier-mask': 'bool',
+        'vhost-dev': 'VhostStatus'
+    }
+}
+
+##
+# @x-debug-virtio-status:
+#
+# Poll for a comprehensive status of a given virtio device
+#
+# @path: Canonical QOM path of the VirtIODevice
+#
+# Returns: VirtioStatus of the virtio device
+#
+# Since: 6.2
+#
+# Examples:
+#
+# 1. Poll for the status of virtio-crypto (no vhost-crypto active)
+#
+# -&gt; { &quot;execute&quot;: &quot;x-debug-virtio-status&quot;,
+#      &quot;arguments&quot;: {
+#          &quot;path&quot;: &quot;/machine/peripheral/crypto0/virtio-backend&quot;
+#      }
+#    }
+# &lt;- { &quot;return&quot;: {
+#          &quot;device-endian&quot;: &quot;little&quot;,
+#          &quot;bus-name&quot;: &quot;&quot;,
+#          &quot;disable-legacy-check&quot;: false,
+#          &quot;name&quot;: &quot;virtio-crypto&quot;,
+#          &quot;started&quot;: true,
+#          &quot;device-id&quot;: 20,
+#          &quot;vhost-dev&quot;: {
+#               &quot;n-tmp-sections&quot;: 0,
+#               &quot;n-mem-sections&quot;: 0,
+#               &quot;max-queues&quot;: 0,
+#               &quot;backend-cap&quot;: 0,
+#               &quot;log-size&quot;: 0,
+#               &quot;backend-features&quot;: 0,
+#               &quot;nvqs&quot;: 0,
+#               &quot;protocol-features&quot;: 0,
+#               &quot;vq-index&quot;: 0,
+#               &quot;log-enabled&quot;: false,
+#               &quot;acked-features&quot;: 0,
+#               &quot;features&quot;: 0
+#          },
+#          &quot;backend-features&quot;: 0,
+#          &quot;start-on-kick&quot;: false,
+#          &quot;isr&quot;: 1,
+#          &quot;broken&quot;: false,
+#          &quot;status&quot;: 15,
+#          &quot;num-vqs&quot;: 2,
+#          &quot;guest-features&quot;: 5100273664,
+#          &quot;host-features&quot;: 6325010432,
+#          &quot;use-guest-notifier-mask&quot;: true,
+#          &quot;vm-running&quot;: true,
+#          &quot;queue-sel&quot;: 1,
+#          &quot;disabled&quot;: false,
+#          &quot;vhost-started&quot;: false,
+#          &quot;use-started&quot;: true
+#      }
+#    }
+#
+# 2. Poll for the status of virtio-net (vhost-net is active)
+#
+# -&gt; { &quot;execute&quot;: &quot;x-debug-virtio-status&quot;,
+#      &quot;arguments&quot;: {
+#          &quot;path&quot;: &quot;/machine/peripheral-anon/device[1]/virtio-backend&quot;
+#      }
+#    }
+# &lt;- { &quot;return&quot;: {
+#          &quot;device-endian&quot;: &quot;little&quot;,
+#          &quot;bus-name&quot;: &quot;&quot;,
+#          &quot;disabled-legacy-check&quot;: false,
+#          &quot;name&quot;: &quot;virtio-net&quot;,
+#          &quot;started&quot;: true,
+#          &quot;device-id&quot;: 1,
+#          &quot;vhost-dev&quot;: {
+#               &quot;n-tmp-sections&quot;: 4,
+#               &quot;n-mem-sections&quot;: 4,
+#               &quot;max-queues&quot;: 1,
+#               &quot;backend-cap&quot;: 2,
+#               &quot;log-size&quot;: 0,
+#               &quot;backend-features&quot;: 0,
+#               &quot;nvqs&quot;: 2,
+#               &quot;protocol-features&quot;: 0,
+#               &quot;vq-index&quot;: 0,
+#               &quot;log-enabled&quot;: false,
+#               &quot;acked-features&quot;: 5100306432,
+#               &quot;features&quot;: 13908344832
+#          },
+#          &quot;backend-features&quot;: 6337593319,
+#          &quot;start-on-kick&quot;: false,
+#          &quot;isr&quot;: 1,
+#          &quot;broken&quot;: false,
+#          &quot;status&quot;: 15,
+#          &quot;num-vqs&quot;: 3,
+#          &quot;guest-features&quot;: 5111807911,
+#          &quot;host-features&quot;: 6337593319,
+#          &quot;use-guest-notifier-mask&quot;: true,
+#          &quot;vm-running&quot;: true,
+#          &quot;queue-sel&quot;: 2,
+#          &quot;disabled&quot;: false,
+#          &quot;vhost-started&quot;: true,
+#          &quot;use-started&quot;: true
+#      }
+#    }
+#
+##
+
+{ 'command': 'x-debug-virtio-status',
+  'data': { 'path': 'str' },
+  'returns': 'VirtioStatus'
+}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Unstable commands now need to be marked with

     'features': [ 'unstable' ]

If you do that, the QAPI generator will demand documentation.  So add
   
   # Features:
   # @unstable: This command is meant for debugging.

You may want to grep for examples.  See also commit 9fb49daabf &quot;qapi:
Mark unstable QMP parts with feature 'unstable'&quot;.</pre>
    </blockquote>
    <pre>Got it. I will add this in for all 'x-' related commands.
</pre>
    <blockquote type="cite" cite="mid:874k8s9bkl.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

Hmm, this command starts with x-debug-virtio-, wheras the one added in
the previous commit starts with x-debug-query-virtio-.

By conventions, commands that just return information on FOO are named
query-FOO.  I recommend an x-query-virtio- prefix for your query
commands.  We can leave their purpose (debug) to documentation.</pre>
    </blockquote>
    <pre>Sure thing! I'll make this change.
</pre>
    <blockquote type="cite" cite="mid:874k8s9bkl.fsf@dusky.pond.sub.org">
      <pre class="moz-quote-pre" wrap="">

</pre>
    </blockquote>
    Jonah<br>
  </body>
</html>
--------------K0lGqw0DWRA0kA7UkzIKqm7P--

