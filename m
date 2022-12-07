Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A35645DFC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 16:51:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2wgA-0005eP-PJ; Wed, 07 Dec 2022 10:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1p2wg8-0005dw-Ky
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 10:49:48 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1p2wg4-00058a-Kk
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 10:49:48 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2B7FJ6Zk001181; Wed, 7 Dec 2022 15:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=1JLysm9vOxmBqGssPxnVK/k3DROBZ1AOHNfTzjk4I3g=;
 b=bf8Y/X8SdrITqWNMdabR7sNg7SurrPobDE9iMbD+xisldmiTZIDPYxdp/La+hPRKb3YJ
 0TimoHRaDE2TWdxAzhQQsbICDh2i+WLJuXYPpJSbNZ0/oKpXM+pRe4EEeTTEOAf10id8
 8MQvI5PO4VxaTFgdf9Lfz47QtTNVz27uGz2hZ4YBdCZORpIVKDe9lz7P8zwI+5gDnjh4
 h2fLkITZ22S4bfl4kRhYn2Jj8w601vTK6zLGrl21uWuoR0D/Nw2J5O43aVoEibfgw4e3
 ZPJQt0OhBE4D8bwpVqwFwBNr4ovQczL8bNcf1j4GkG0KWEZMAMW0rWvSpHrtvIJubEiH 2Q== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3maudurgva-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Dec 2022 15:48:33 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2B7ExMXB026195; Wed, 7 Dec 2022 15:48:32 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3maa8fv9hu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 07 Dec 2022 15:48:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iU3n2C5K5BZq+wtRjiYnzroslXCUhRSt5mX54M4mrBWLwOWPkFtGGhAGFOiuRfe2c4xOrw9dZT7xCbTTvjyW6jplExBgKMNc9MG0Sq+6P7BkhiQy2pNegXAPZEjD0ONkzG8UMSA6lqIMGTGs8/zB/ba7NisUuCa33rg805gGCY92Jltaquhf+iDF9YNgIKpDQPKe5AOQ5wFOcch+mBiLlQyshmX7Dcd6yn69sx1QsyuvSXYF/35vW8rTtXLKtOOsf2NMGeZBDv512+0AdyiVfacuqJ6+8CZZAkgv8eklzduAPWQ6Y0rvUBeM3SoHbZ+gjKtDx3iJKTZUS2/GAh+PwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1JLysm9vOxmBqGssPxnVK/k3DROBZ1AOHNfTzjk4I3g=;
 b=RNQyOr7c5q7cDtZvI/dhC9LlB5rVXWpGewqGgjgGJACU9PKLScQR0QruPWB0wKxam7qC38PqepZtgofm6qNQBxrTzF/+v6VR8wBw8phfRPSLFn9d5Dhklkww1Ca5UW8I8yCvOqlWOO3+Dagz/TxIeDP3vtJ8kGEMMdcYgTIR2sTyZ+ScMngMkQrmJCqNSSsehJGAU/bJq2QYT14VkMnYIRHaAaP5IIWy431BiIqdzEAL75cvKc9lozREB5jCQDJUU8gm982KJdYP0U4v7t15UMuJAxk9hR1g6neWmLjKr5PM7iBc9XGinboOdnLifCpBE2vtOj0ikMxCEo0XLouszA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1JLysm9vOxmBqGssPxnVK/k3DROBZ1AOHNfTzjk4I3g=;
 b=pJX0mcaKnTgYm66zB94//+rlShKINUGcxbbF94mdZreTlYzor+15cWmnUaQ9DQs6F8Ohp0vBcSa2lSNiFdd1sc47vBc9XpgnB1yrARnOijJJf3Qora6kpil1WICkQ9H80jtj4ubKRdFTfJk8YUhSF48AUVF3KrMK7TT6V9aXjys=
Received: from SA2PR10MB4684.namprd10.prod.outlook.com (2603:10b6:806:119::14)
 by PH0PR10MB6984.namprd10.prod.outlook.com (2603:10b6:510:288::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 15:48:28 +0000
Received: from SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::4056:9f2c:6171:c37e]) by SA2PR10MB4684.namprd10.prod.outlook.com
 ([fe80::4056:9f2c:6171:c37e%5]) with mapi id 15.20.5880.014; Wed, 7 Dec 2022
 15:48:28 +0000
Message-ID: <53075574-9e73-f773-ccb1-cca42a719801@oracle.com>
Date: Wed, 7 Dec 2022 10:48:25 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH V9 00/46] Live Update
Content-Language: en-US
To: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>, Zheng Chuan
 <zhengchuan@huawei.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>,
 Peng Liang <tcx4c70@gmail.com>
References: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <1658851843-236870-1-git-send-email-steven.sistare@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0306.namprd03.prod.outlook.com
 (2603:10b6:8:2b::14) To SA2PR10MB4684.namprd10.prod.outlook.com
 (2603:10b6:806:119::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR10MB4684:EE_|PH0PR10MB6984:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc2bf8e-a5d8-41eb-334e-08dad86a7c20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Hb++rzB2RuARbZH/WlFu9nrjrjCjOMDozdnKoLpaUaktjNtqjGn+49Rk74/er9YLaZtd+5pKQjlP/8ijReTr39aTE+quXgfrPV9VteWgt03qg5Mz7WY3Qh74FwfcY5sTTZMb0fnRG9mzx6JqrpDfrn0Pz0Pi0/50D4TCHg61TikL+VEJJXpanan0UlSV3lpL9GkO9ZYPLVpkpfBQHr8PDYYdR1KUvi6tp8Kr4H+n/FGm3sjluRIS6cX9j2IW81DhtQRXnvIv51X6b5VTRoiM+4vDyMumo4E+Fu+8mNYM2gRbDyKprhTPj4qsrbv30aGs3umuzcBiqyg98of8ZnplZo8TBOIdiSO+HokYg2nT9ou0RtFcMjLGBjAR+L4sgNJ32sDNj2kZhXaNLiescSl/5V9R46y14weGQYP/m15ZN2jjVgoIpytkTWksViDzBZr8bUsgfKEunNzBaOiQv471Uk5yGap5kCGyAHX2hL5RhGAcmbwpFrs6pMTQxcaPmttshPVhSd/c3u0wC9OxAL3yzWKvmTVGrU5epfsRhZ84amkhVTmBx0to7N5s8gUm3eZbx1uxEaFMI6GTgY/WbNPv2iPfl+h+vc9cyo+D8bewLvzHJ0VoLzUpKTOA9oBp7D322jDthB0lAKx0s03EmzRtGooCIdwzKmUHDpLqcZjIUIl7UtloujuX3nbFC699M9Q5qM/IswBIGqUbaaNbErXlvEjNSFvogBsMEgrQV4Fb5oQ2/UwDVwFaGXtIObUfnJO0sUFXO3EGhGvlHnfxbz8Mz1YvL+NgT53YiFETg/bSm9s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR10MB4684.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199015)(36756003)(66899015)(31686004)(86362001)(31696002)(8936002)(66476007)(66946007)(41300700001)(4326008)(2906002)(8676002)(66556008)(15650500001)(44832011)(30864003)(83380400001)(38100700002)(7416002)(2616005)(110136005)(54906003)(316002)(966005)(6486002)(36916002)(478600001)(5660300002)(6666004)(186003)(26005)(6512007)(53546011)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGpkQzRLSUJiU2E4Y1BIZERrb2xlTlZFeW1aS1dVSTZVVG1Tb3ZhcU92V1ov?=
 =?utf-8?B?eHpTRkM5OHlnL2ZIK0dyMTk4ejVOQzY1OEYrcWsycFNVcHFYTGovRys4eGN5?=
 =?utf-8?B?Qmx6RXphRGRFVU5semNOWkVXdG9Oay9zY1N2VlFKbWVSWWczdGNyNlFuazJy?=
 =?utf-8?B?L01Na2pMSnB1Wmw2Y1JaQWE2UjlPaDF5TU54WGtVS2t2TFRZU2lMQXY1a2ts?=
 =?utf-8?B?ckN0LytLSXNlVExwR1NYTWxXZG94cTNpQnJ3Nk00TmxaZVJQLzMzOXRlZWM3?=
 =?utf-8?B?RTkzZVQrSGxBclFWVDduZU01NG5RSG93Sll4dC9xVW5mZW5WMW5EVkNkMHJD?=
 =?utf-8?B?OUkvT1k4Z2MzMGtpdXdjREpFbllnWVRTN2Z1QTF5b3lpWlFodXNwVzZ5RjdI?=
 =?utf-8?B?T3BtNGFQRlRxcXVyeW5QSnhjajRFV3kvUFJnWGhmNFJhakRERyt6V0xtZm9z?=
 =?utf-8?B?UFRoa2tOQkZFSDVUbk9ueWZ1L1U4Mk54TThDS0gzMnRnN2VSRTU4NTVxVnFs?=
 =?utf-8?B?ZWZSaEFDVE5jdEhIVTBwQkRweDE1RUJwbm03RmNGN3d0VjZaYS91L0s0bUpU?=
 =?utf-8?B?YjZYUHg4bEpOcERJR3libTZCc3NmY3RWQi9wZmk4OWxUYjArMjQyUjgrcUZ1?=
 =?utf-8?B?aHZVSnAvWmlSdmdvMGY2VW9qR2tHVkRtVkY5KzZ2bDRBR0JQcHgyU0Z1M2tX?=
 =?utf-8?B?d0J2ZjlWb3Q2amRpc2RhZ0dCeExYTnlvL3NQd3dmS1ZPVm9rZy95eTNDNFBz?=
 =?utf-8?B?ZnAwU1BZdEdidzYrOElyTCtJQjM0cnV6QlJEdlBSSmYraTU4RDRaQ0MyLy8z?=
 =?utf-8?B?UmlPTzRIMjRzYzM3Kzd6WVpvRWV0Ly9Fa3NkeURXV1hPQ2kyVU4xVDA3d2ND?=
 =?utf-8?B?STV3aWJTUFJqc2Jjek1mdzA2MUdMbHRmSTdzeE5aTi9JMXg2MjFINGlJQkp5?=
 =?utf-8?B?OU0rUWEwVzR2RHZnUytLUHhXUE1oSlRydnltRDFiV3d2UWh4cHpRU0xOR0hn?=
 =?utf-8?B?UUhSdXBkeEhjQUY3NitWWTNFRjZ1WGRjTkt4RHdoVUJyTWVzSGdwL3NlZndX?=
 =?utf-8?B?UzNWNjlsdlY2eXFBYXM4cWNDTFZDS0UyL3lNMmVyQ0ZNRDJUdVFtRTBGQ1FF?=
 =?utf-8?B?bDROaGgwMmhaMFVPMC9lK1UwOGNKMEEwQksyZHF3Z3pPV3NSMGdYYSs5Q2Mz?=
 =?utf-8?B?NnBWYUZSek5STm9RVDRaZ3ZuRnZQVkFQNmNudXJZblhLYmExZWVvMDNWcjY2?=
 =?utf-8?B?V3Q0M2tZalU4a3VWT09UYlZyczU1Vk5JRzRSVFVlcTRRSzE4UndJRWZTMUx5?=
 =?utf-8?B?UENraGpxcEJkRkEyVnhOR1ZSa2c0MklCbCtWL2l3MWRFcmJQbnYvWEJXRnhK?=
 =?utf-8?B?OEYxOHloSHhvT21ZTUpEMyt3b0g0T3cwd29WRGF0M3JTVFBySERwZUJRRVNK?=
 =?utf-8?B?eHhZeFUxenJUMG5oYnFnWDRheUowd1lHYXVlT2tvbDF1cXV3ZGZuUFFyS1Jh?=
 =?utf-8?B?djU4Z1ZpM2Y4cS9wbGZpdlFOaTIzRDVseGFUWE9UVktTdWVqSFdZQmJIbXF2?=
 =?utf-8?B?OW5DZEdrQ2xteTlaOXRnQkhxZ0s5NUlRSDU1c0k3aDB1eHVrakh0bHJQajJx?=
 =?utf-8?B?QzJvZ3RBOTZ3ZnpHVC82VnZ5em8vc3RxQ2NoNnVwRURENE9kR0pxemFKTStn?=
 =?utf-8?B?NXhIK25CbzJlWFhaNVBFbVYzV21XcEowc256UE03OHp3Yjd1YlhkMVBxcnBO?=
 =?utf-8?B?cDJQMmpDdTdCNkpLSFlXOXFVQVFNUjVwRmNHb21Qd0p5eTRQTFhxM2k2L2Zo?=
 =?utf-8?B?MkpWZjhlRjFLRlcwdndnMUdMT1hDYnFxT0pZOXNCbVRyZGlQL1RWdW5Fek9r?=
 =?utf-8?B?d3liaERyS2VGTGlEY2oxNUc5d096b1dJenJTc1NPejVIQW55RFhvZmo1dmpM?=
 =?utf-8?B?K01ZRlFmdUR5Y3hObFBsbUlBbkcrMlFYZWswL1hUT0JDWFRjNEFFY0xJTUoz?=
 =?utf-8?B?RmZ5Tkh5eDEzNG5lR1VEcVA3UXpRREZ1Z3I2THRzZmo4cm9vQVB1dzFzZkhI?=
 =?utf-8?B?bUFuSGE4Wm1ZQlpjQlhVajlLb2VvQ00xWjZOUWV6UEtBVVJaakRBSHdpNndN?=
 =?utf-8?B?OG83UjBSMk5FZlQ5Q0FjZ1F4Y1VqVkhxWkhZMFIvQnhhdDNXZjJBSHBXWHlY?=
 =?utf-8?B?YVE9PQ==?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc2bf8e-a5d8-41eb-334e-08dad86a7c20
X-MS-Exchange-CrossTenant-AuthSource: SA2PR10MB4684.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 15:48:28.8214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FgQulRcMrYJMjH5LaZoW7CmTvl96+D9AHGueUTsUqrJxQztY/7OihD3lmtYMux/JF2BH2RfKmRRsyn3P21s9sPw3ZP/UgyTj/wCLXeYyJF8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6984
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-07_08,2022-12-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212070137
X-Proofpoint-ORIG-GUID: YArttdq4VOB8byygeLDsGpqeIZLtT5LW
X-Proofpoint-GUID: YArttdq4VOB8byygeLDsGpqeIZLtT5LW
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.262,
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

This series desperately needs review in its intersection with live migration.
The code in other areas has been reviewed and revised multiple times -- thank you!

David, Juan, can you spare some time to review this?  I have done my best to order 
the patches logically (see the labelled groups in this email), and to provide 
complete and clear cover letter and commit messages. Can I do anything to facilitate,
like doing a code walk through via zoom?

And of course, I welcome anyone's feedback.

Here is the original posting.

https://lore.kernel.org/qemu-devel/1658851843-236870-1-git-send-email-steven.sistare@oracle.com/

- Steve

On 7/26/2022 12:09 PM, Steve Sistare wrote:
> This version of the live update patch series integrates live update into the
> live migration framework.  The new interfaces are:
>   * mode (migration parameter)
>   * cpr-exec-args (migration parameter)
>   * file (migration URI)
>   * migrate-mode-enable (command-line argument)
>   * only-cpr-capable (command-line argument)
> 
> Provide the cpr-exec and cpr-reboot migration modes for live update.  These
> save and restore VM state, with minimal guest pause time, so that qemu may be
> updated to a new version in between.  The caller sets the mode parameter
> before invoking the migrate or migrate-incoming commands.
> 
> In cpr-reboot mode, the migrate command saves state to a file, allowing
> one to quit qemu, reboot to an updated kernel, start an updated version of
> qemu, and resume via the migrate-incoming command.  The caller must specify
> a migration URI that writes to and reads from a file.  Unlike normal mode,
> the use of certain local storage options does not block the migration, but
> the caller must not modify guest block devices between the quit and restart.
> The guest RAM memory-backend must be shared, and the @x-ignore-shared
> migration capability must be set, to avoid saving it to the file.  Guest RAM
> must be non-volatile across reboot, which can be achieved by backing it with
> a dax device, or /dev/shm PKRAM as proposed in
> https://lore.kernel.org/lkml/1617140178-8773-1-git-send-email-anthony.yznaga@oracle.com
> but this is not enforced.  The restarted qemu arguments must match those used
> to initially start qemu, plus the -incoming option.
> 
> The reboot mode supports vfio devices if the caller first suspends the guest,
> such as by issuing guest-suspend-ram to the qemu guest agent.  The guest
> drivers' suspend methods flush outstanding requests and re-initialize the
> devices, and thus there is no device state to save and restore.  After
> issuing migrate-incoming, the caller must issue a system_wakeup command to
> resume.
> 
> In cpr-exec mode, the migrate command saves state to a file and directly
> exec's a new version of qemu on the same host, replacing the original process
> while retaining its PID.  The caller must specify a migration URI that writes
> to and reads from a file, and resumes execution via the migrate-incoming
> command.  Arguments for the new qemu process are taken from the cpr-exec-args
> migration parameter, and must include the -incoming option.
> 
> Guest RAM must be backed by a memory backend with share=on, but cannot be
> memory-backend-ram.  The memory is re-mmap'd in the updated process, so guest
> ram is efficiently preserved in place, albeit with new virtual addresses.
> In addition, the '-migrate-mode-enable cpr-exec' option is required.  This
> causes secondary guest ram blocks (those not specified on the command line)
> to be allocated by mmap'ing a memfd.  The memfds are kept open across exec,
> their values are saved in special cpr state which is retrieved after exec,
> and they are re-mmap'd.  Since guest RAM is not copied, and storage blocks
> are not migrated, the caller must disable all capabilities related to page
> and block copy.  The implementation ignores all related parameters.
> 
> The exec mode supports vfio devices by preserving the vfio container, group,
> device, and event descriptors across the qemu re-exec, and by updating DMA
> mapping virtual addresses using VFIO_DMA_UNMAP_FLAG_VADDR and
> VFIO_DMA_MAP_FLAG_VADDR as defined in
>   https://lore.kernel.org/kvm/1611939252-7240-1-git-send-email-steven.sistare@oracle.com
> and integrated in Linux kernel 5.12.
> 
> Here is an example of updating qemu from v7.0.50 to v7.0.51 using exec mode.
> The software update is performed while the guest is running to minimize
> downtime.
> 
> window 1                                        | window 2
>                                                 |
> # qemu-system-$arch ...                         |
>   -migrate-mode-enable cpr-exec                 |
> QEMU 7.0.50 monitor - type 'help' ...           |
> (qemu) info status                              |
> VM status: running                              |
>                                                 | # yum update qemu
> (qemu) migrate_set_parameter mode cpr-exec      |
> (qemu) migrate_set_parameter cpr-exec-args      |
>   qemu-system-$arch ... -incoming defer         |
> (qemu) migrate -d file:/tmp/qemu.sav            |
> QEMU 7.0.51 monitor - type 'help' ...           |
> (qemu) info status                              |
> VM status: paused (inmigrate)                   |
> (qemu) migrate_incoming file:/tmp/qemu.sav      |
> (qemu) info status                              |
> VM status: running                              |
> 
> 
> Here is an example of updating the host kernel using reboot mode.
> 
> window 1                                        | window 2
>                                                 |
> # qemu-system-$arch ... mem-path=/dev/dax0.0    |
>   -migrate-mode-enable cpr-reboot               |
> QEMU 7.0.50 monitor - type 'help' ...           |
> (qemu) info status                              |
> VM status: running                              |
>                                                 | # yum update kernel-uek
> (qemu) migrate_set_parameter mode cpr-reboot    |
> (qemu) migrate -d file:/tmp/qemu.sav            |
> (qemu) quit                                     |
>                                                 |
> # systemctl kexec                               |
> kexec_core: Starting new kernel                 |
> ...                                             |
>                                                 |
> # qemu-system-$arch mem-path=/dev/dax0.0 ...    |
>   -incoming defer                               |
> QEMU 7.0.51 monitor - type 'help' ...           |
> (qemu) info status                              |
> VM status: paused (inmigrate)                   |
> (qemu) migrate_incoming file:/tmp/qemu.sav      |
> (qemu) info status                              |
> VM status: running                              |
> 
> Changes from V8 to V9:
>   vfio:
>     - free all cpr state during unwind in vfio_connect_container
>     - change cpr_resave_fd to return void, and avoid new unwind cases
>     - delete incorrect .unmigratable=1 in vmstate handlers
>     - add route batching in vfio_claim_vectors
>     - simplified vfio intx cpr code
>     - fix commit message for 'recover from unmap-all-vaddr failure'
>     - verify suspended runstate for cpr-reboot mode
>   Other:
>     - delete cpr-save, cpr-exec, cpr-load
>     - delete ram block vmstate handlers that were added in V8
>     - rename cpr-enable option to migrate-mode-enable
>     - add file URI for migration
>     - add mode and cpr-exec-args migration parameters
>     - add per-mode migration blockers
>     - add mode checks in migration notifiers
>     - fix suspended runstate during migration
>     - replace RAM_ANON flag with RAM_NAMED_FILE
>     - support memory-backend-epc
> 
> Steve Sistare (44):
>   migration: fix populate_vfio_info                  ---  reboot mode  ---
>   memory: RAM_NAMED_FILE flag
>   migration: file URI
>   migration: mode parameter
>   migration: migrate-enable-mode option
>   migration: simplify blockers
>   migration: per-mode blockers
>   cpr: relax some blockers
>   cpr: reboot mode
> 
>   qdev-properties: strList                           ---  exec mode ---
>   qapi: strList_from_string
>   qapi: QAPI_LIST_LENGTH
>   qapi: strv_from_strList
>   qapi: strList unit tests
>   migration: cpr-exec-args parameter
>   migration: simplify notifiers
>   migration: check mode in notifiers
>   memory: flat section iterator
>   oslib: qemu_clear_cloexec
>   vl: helper to request re-exec
>   cpr: preserve extra state
>   cpr: exec mode
>   cpr: add exec-mode blockers
>   cpr: ram block blockers
>   cpr: only-cpr-capable
>   cpr: Mismatched GPAs fix
>   hostmem-memfd: cpr support
>   hostmem-epc: cpr support
> 
>   pci: export msix_is_pending                       --- vfio for exec ---
>   vfio-pci: refactor for cpr
>   vfio-pci: cpr part 1 (fd and dma)
>   vfio-pci: cpr part 2 (msi)
>   vfio-pci: cpr part 3 (intx)
>   vfio-pci: recover from unmap-all-vaddr failure
> 
>   chardev: cpr framework                            --- misc for exec ---
>   chardev: cpr for simple devices
>   chardev: cpr for pty
>   python/machine: QEMUMachine full_args
>   python/machine: QEMUMachine reopen_qmp_connection
>   tests/avocado: add cpr regression test
> 
>   vl: start on wakeup request                       --- vfio for reboot ---
>   migration: fix suspended runstate
>   migration: notifier error reporting
>   vfio: allow cpr-reboot migration if suspended
> 
> Mark Kanda, Steve Sistare (2):
>   vhost: reset vhost devices for cpr
>   chardev: cpr for sockets
> 
>  MAINTAINERS                         |  14 ++
>  accel/xen/xen-all.c                 |   3 +
>  backends/hostmem-epc.c              |  18 +-
>  backends/hostmem-file.c             |   1 +
>  backends/hostmem-memfd.c            |  22 ++-
>  backends/tpm/tpm_emulator.c         |  11 +-
>  block/parallels.c                   |   7 +-
>  block/qcow.c                        |   7 +-
>  block/vdi.c                         |   7 +-
>  block/vhdx.c                        |   7 +-
>  block/vmdk.c                        |   7 +-
>  block/vpc.c                         |   7 +-
>  block/vvfat.c                       |   7 +-
>  chardev/char-mux.c                  |   1 +
>  chardev/char-null.c                 |   1 +
>  chardev/char-pty.c                  |  16 +-
>  chardev/char-serial.c               |   1 +
>  chardev/char-socket.c               |  48 +++++
>  chardev/char-stdio.c                |  31 +++
>  chardev/char.c                      |  49 ++++-
>  dump/dump.c                         |   4 +-
>  gdbstub.c                           |   1 +
>  hmp-commands.hx                     |   2 +-
>  hw/9pfs/9p.c                        |  11 +-
>  hw/core/qdev-properties-system.c    |  12 ++
>  hw/core/qdev-properties.c           |  44 +++++
>  hw/display/virtio-gpu-base.c        |   8 +-
>  hw/intc/arm_gic_kvm.c               |   3 +-
>  hw/intc/arm_gicv3_its_kvm.c         |   3 +-
>  hw/intc/arm_gicv3_kvm.c             |   3 +-
>  hw/misc/ivshmem.c                   |   8 +-
>  hw/net/virtio-net.c                 |  10 +-
>  hw/pci/msix.c                       |   2 +-
>  hw/pci/pci.c                        |  12 ++
>  hw/ppc/pef.c                        |   2 +-
>  hw/ppc/spapr.c                      |   2 +-
>  hw/ppc/spapr_events.c               |   2 +-
>  hw/ppc/spapr_rtas.c                 |   2 +-
>  hw/remote/proxy.c                   |   7 +-
>  hw/s390x/s390-virtio-ccw.c          |   9 +-
>  hw/scsi/vhost-scsi.c                |   9 +-
>  hw/vfio/common.c                    | 235 +++++++++++++++++++----
>  hw/vfio/cpr.c                       | 177 ++++++++++++++++++
>  hw/vfio/meson.build                 |   1 +
>  hw/vfio/migration.c                 |  23 +--
>  hw/vfio/pci.c                       | 336 ++++++++++++++++++++++++++++-----
>  hw/vfio/trace-events                |   1 +
>  hw/virtio/vhost-vdpa.c              |   6 +-
>  hw/virtio/vhost.c                   |  32 +++-
>  include/chardev/char-socket.h       |   1 +
>  include/chardev/char.h              |   5 +
>  include/exec/memory.h               |  48 +++++
>  include/exec/ram_addr.h             |   1 +
>  include/exec/ramblock.h             |   1 +
>  include/hw/pci/msix.h               |   1 +
>  include/hw/qdev-properties-system.h |   4 +
>  include/hw/qdev-properties.h        |   3 +
>  include/hw/vfio/vfio-common.h       |  12 ++
>  include/hw/virtio/vhost.h           |   1 +
>  include/migration/blocker.h         |  69 ++++++-
>  include/migration/cpr-state.h       |  30 +++
>  include/migration/cpr.h             |  20 ++
>  include/migration/misc.h            |  13 +-
>  include/migration/vmstate.h         |   2 +
>  include/qapi/util.h                 |  28 +++
>  include/qemu/osdep.h                |   9 +
>  include/sysemu/runstate.h           |   2 +
>  migration/cpr-state.c               | 362 ++++++++++++++++++++++++++++++++++++
>  migration/cpr.c                     |  85 +++++++++
>  migration/file.c                    |  62 ++++++
>  migration/file.h                    |  14 ++
>  migration/meson.build               |   3 +
>  migration/migration.c               | 268 +++++++++++++++++++++++---
>  migration/ram.c                     |  24 ++-
>  migration/target.c                  |   1 +
>  migration/trace-events              |  12 ++
>  monitor/hmp-cmds.c                  |  59 +++---
>  monitor/hmp.c                       |   3 +
>  monitor/qmp.c                       |   4 +
>  python/qemu/machine/machine.py      |  14 ++
>  qapi/char.json                      |   7 +-
>  qapi/migration.json                 |  68 ++++++-
>  qapi/qapi-util.c                    |  37 ++++
>  qemu-options.hx                     |  50 ++++-
>  replay/replay.c                     |   4 +
>  softmmu/memory.c                    |  31 ++-
>  softmmu/physmem.c                   | 100 +++++++++-
>  softmmu/runstate.c                  |  42 ++++-
>  softmmu/vl.c                        |  10 +
>  stubs/cpr-state.c                   |  26 +++
>  stubs/meson.build                   |   2 +
>  stubs/migr-blocker.c                |   9 +-
>  stubs/migration.c                   |  33 ++++
>  target/i386/kvm/kvm.c               |   8 +-
>  target/i386/nvmm/nvmm-all.c         |   4 +-
>  target/i386/sev.c                   |   2 +-
>  target/i386/whpx/whpx-all.c         |   3 +-
>  tests/avocado/cpr.py                | 176 ++++++++++++++++++
>  tests/unit/meson.build              |   1 +
>  tests/unit/test-strlist.c           |  81 ++++++++
>  trace-events                        |   1 +
>  ui/spice-core.c                     |   5 +-
>  ui/vdagent.c                        |   5 +-
>  util/oslib-posix.c                  |   9 +
>  util/oslib-win32.c                  |   4 +
>  105 files changed, 2781 insertions(+), 330 deletions(-)
>  create mode 100644 hw/vfio/cpr.c
>  create mode 100644 include/migration/cpr-state.h
>  create mode 100644 include/migration/cpr.h
>  create mode 100644 migration/cpr-state.c
>  create mode 100644 migration/cpr.c
>  create mode 100644 migration/file.c
>  create mode 100644 migration/file.h
>  create mode 100644 stubs/cpr-state.c
>  create mode 100644 stubs/migration.c
>  create mode 100644 tests/avocado/cpr.py
>  create mode 100644 tests/unit/test-strlist.c
> 

