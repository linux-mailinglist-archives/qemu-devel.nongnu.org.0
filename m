Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E4E96CDA46
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 15:17:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phVfS-0000KC-UG; Wed, 29 Mar 2023 09:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1phVfO-0008Qz-B6; Wed, 29 Mar 2023 09:16:42 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1phVfI-0001Fe-Dk; Wed, 29 Mar 2023 09:16:42 -0400
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32TBEovp026804; Wed, 29 Mar 2023 13:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=2A8K0saX+KCdQlKXJ1whYtFBbMO8UNuisDrACO7vWGI=;
 b=xG1Z7KvDI1BhI+h/WSrSFo0RnVePz3kMkgc9xMJwIG9csM9v82g1BI6XLmEtZzJslKWA
 1m2HxtUml/KGPQZ1UYfoZCIYnGWlZ02ToPVaHp63z7fMYeqXAPGA+wzfEM7bhq/JClvA
 nfXhRr9Y7OP2xjlNlEimDE7Ni5xUBDMjkrtphVFkU5U/c7Fbp0zFHIVOfoSnVJEaIess
 MAe7JSgZBbTGEI+P+lOm8FaMPanCAjDCiPcQc34JicqgA2p/7foirgJSubR5oQpun2Gp
 dFk5QqTdvWYzyT0GMC/2E/qxOxBtDffIX/HE9pEtjl5j0UAF9Q81Fnz4JWBYZy4l7BNd vA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3pmm9j09jb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Mar 2023 13:16:32 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32TCYnSl035016; Wed, 29 Mar 2023 13:16:31 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3phqd7t0h5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Mar 2023 13:16:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QT+6UAl2UPE1wVxT+03tkqV0wIdTu8FlysXFouzdJkqAngPXy4kgeeBaWmexF2U4nogAvJZrKmhGboJsPmpMthb4+tVdXAFtUctZi9sIO0yOGPM3ys1EVCdZN8C6XJivXvGRSLVnbmj9lvAsSWvZjvhsboHDiVUEIVo7MWEqchmciWog31PWxu0oipLTln5UYo80BTVi4nOuBT+2uBAhE4FPBshnV+KeiWqb12oACco6JXUc1bieKPOswBs/C+9boONt+ViKq4fLJrIbqSnbmXsZPvB4IbXPlKU3mGinZHV4CX4jPbjo2TBY/2Hc12b84rySgPcgdzhMCxa2+XiUsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2A8K0saX+KCdQlKXJ1whYtFBbMO8UNuisDrACO7vWGI=;
 b=MvcgWmxfEr2WssptbuHr6pXmUomg7Dvu1momTp09dvYqorqgg+XbhtndCNoX2PttgMMkD1zTSFgX6YVxTatEkebpYVoT232IU60lvKA8OQs5T697zMyJIfvQ0zTmEInxbAWBluUqoxuWHMdR5KzUIEgrmZS7boRmekD7CWRK1+nvmFN4plN91cUNGGSU+Vw0ezvvNSgskr+zQ8hRlkkGAjEqlP85LiptmEx3lWknDIyWKw5M1AnT9aL1SzlYL6xpNdphrmrrjhGWktJV0yBeRNvIbyLXGntp9aCZIhfO9Osf+v8o/vPtcPeU/Te7CnUQM7qlieIgiLWuHKSmTGqiiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2A8K0saX+KCdQlKXJ1whYtFBbMO8UNuisDrACO7vWGI=;
 b=qZoQh2LDLdJRtxzPP0upnV3zHHFjp0zY7asxmnoxG2BwTN6O2HfkEgAEXsI4NidORqU2VQjYkbvWNfn/BoHCYT8e8VHibeWKsU7eTcTzCoONhCF5szPIFMwUJRB2one8ujjK65c+vaxhZu1PWHjUMZYEjgg3uzL2HWW4fRf6yXg=
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CY5PR10MB6189.namprd10.prod.outlook.com (2603:10b6:930:33::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Wed, 29 Mar
 2023 13:16:29 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::e9ed:8782:64cb:cfc3]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::e9ed:8782:64cb:cfc3%9]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 13:16:29 +0000
Message-ID: <b9fcf584-8c83-9d56-c67a-b830b17c1272@oracle.com>
Date: Wed, 29 Mar 2023 08:16:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 2/2] hw/acpi: i386: bump MADT to revision 5
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: shannon.zhaosl@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 boris.ostrovsky@oracle.com
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230328155926.2277-3-eric.devolder@oracle.com>
 <20230329010126-mutt-send-email-mst@kernel.org>
From: Eric DeVolder <eric.devolder@oracle.com>
In-Reply-To: <20230329010126-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0024.namprd10.prod.outlook.com
 (2603:10b6:a03:255::29) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR10MB4531:EE_|CY5PR10MB6189:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dba3c74-a648-4525-3c8c-08db3057ceb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 35u2alnrS4vhCFJhpQKc/EbHsmRLAasyGhvHid128SIetCYU+OTk6LLLNlb2CjQXQwa8ij/k1ZGXlh8mlAOBhedFa17R3OCMLAg4/QJQacW9Grv7qRk318KkZ2DUs92odhsp9oKP27dapf4akBlzBL7zkxSdeCzA9fbU6CiaAqxH5ChkJpYQKPNmaupcO3ow9+EN2qcMEO1TA1+FhD42G6VJUp45Hg0H+tYy47F28nhv1PTTux7BTpovapvcaMJu6Jn37EOEt45NQpBLbcs5m6Exf4b9a5yQ+qrUvMcYr3dPIr2cHrQZQc2r3CGlV7yf5rB28mOBQ9uyFuyYKtDh9Jzx5GrOSxN7f/DMpZCn853zkfQU3VISziYE0FueKBY0Yqbh8mJRE8ZKBRuYW5USovM8/VN2jj1iq2rERsT2OY5/zMJpLyqAY9OyoeUvYaCDcAWxzbXEJiaoqFMuQe+6f0JWnMzmOjxUJdXqDasFClVXh/DftEQUi0tkfcCvmg316muEX73rKoBnC0JlLJtN0wNiHKesVFtd7BTSAj4j3cT01BdZKi1Zd+cpg2TxTJFkbC3VLvpH6zvjhLjXYb0ynA+aS0FPytm2ThjjuMq53TyDCPDyEcXssLC2yNDt38idq1oPGtXnj9XE34On4EerTg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(366004)(396003)(346002)(136003)(451199021)(6506007)(6512007)(53546011)(316002)(6916009)(4326008)(5660300002)(36756003)(7416002)(8936002)(2616005)(41300700001)(8676002)(66476007)(186003)(66946007)(66556008)(83380400001)(2906002)(31686004)(6486002)(31696002)(107886003)(86362001)(6666004)(478600001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzRIYnNpWHBnc21sMXozV3IyUkQxTnVoRVVEb0YxYVRZSXRGRnJHY1FTcytR?=
 =?utf-8?B?dE9jUm1rWTNlaXNNbjdOcng3dCtSMUlJODhHK1pZaU9tUmlXK1RscnJrNFpq?=
 =?utf-8?B?UVZLajJJYmpTLy81Y0E3WW9mekt1djFXa0g2d3htbzl1SHFlMXRNZmpXc2pz?=
 =?utf-8?B?c3FST1dCMkNnQjM1Mm5NSEZsT2xQNU1IMEJ2V0N3YjRqTk0xekY4Z1Q0N1JY?=
 =?utf-8?B?R2FuYTRkS1lqWmNRWDdITTVZOGVaamwxUmNlUXk3Nm9IbE84QjRKck56WndX?=
 =?utf-8?B?SDJOYlkyakdnVVZYSFlqTmwrR2trSmJONGFueGU3eWYzd3JUbWtSUjdjWHJP?=
 =?utf-8?B?TERnaEhLR0ZNL3dmWHdiTm0wWHExZW43dkZzNGZMR3dKbzNyQ1pPUjUrNHR0?=
 =?utf-8?B?YkFEb0RPK0JqbXFmMTJ0Zkp1VzMxTEcwQkNONWdLYTNJb29pcHFjVXZOWE9X?=
 =?utf-8?B?bUJEek9tOHUxNDhqMlhlL0NUL1JWTnl5WDZsM0JEU1lNL1YvYkVpZnpmNkNM?=
 =?utf-8?B?eFZnRU42SWtsRGhqaWhTWC9vUlU0bFQ4UHpzcy84MC92WlZRWmsveHcyMXlJ?=
 =?utf-8?B?NXZNaTgySDZaUkphak9hZ3F3VmUyVmgrbVIwNWVmZnM0Vm9lUVc4bFEwa2lm?=
 =?utf-8?B?Um5YNC9VdzBVaGRlcGhzK090ZEM2OER4QXJRWVVyS0RvdWlWWGtvTlhpczU0?=
 =?utf-8?B?U25naXhoRms0RkNRQTAxRW9ZTzN1VUFwMG1IWWIzS0NwMjRUUExKUWFCVTd5?=
 =?utf-8?B?c0FwZVFFSlFRWTdtcUVyTjNqWWQ1UTBVa0Z0Tkk4Sm9oVWNhRHNseFpZSzBJ?=
 =?utf-8?B?THZhelFkWXhkL1JNQlNQTStRN0F6MHJMYU1HK1RnZWFxVGxBcG9kK2h3T3dE?=
 =?utf-8?B?VktDOXFhcEZiZU81YTFvZnR0MkVxaTdKQmxQNGI3SklkbXV1d3hEdTBWTXFJ?=
 =?utf-8?B?RFlPMlFVcklaZFZ6cUVvYi9ZdUx6NVluV0tNUm53a1hIblZEUTNKK0tLSXpQ?=
 =?utf-8?B?blJxNklFWVB3dlRnUUlxenp5L3Y4MmdUWllEQk5LclRMWncvMytpbmVnWGZw?=
 =?utf-8?B?VnlLMkwyS0x0WXJ1dFRPbzJlNzRrQWpoUVE3UkEzR3BnQW9Ya2RCNUc4cFpB?=
 =?utf-8?B?Mk9hUXhTYnYvWnFpcCtmMGJZRVhjQ0l3OGRBK3JISWMyajNaaGtpTURqNjFw?=
 =?utf-8?B?a0NIWGFlcmZmTnRTRGdKUGlYZ09uenpCZ1NlWk9TZDlwZDB1SXRVZzgwZXlP?=
 =?utf-8?B?Z0ZCam4zNElqZy85OVV2RDB4U2lEbklmdmRaNmRlS0Z0QmJKT3dSU2FSQkVS?=
 =?utf-8?B?VzdjNzVlUWFQamxyeVViMDI3dzJxTGpUNU5rRmFQb2dyUHFtcFFIak9rUnZ0?=
 =?utf-8?B?QjBFZ051OExEdkhJemhSVzFHYmQxdVk5Z3lPeEFrTlQxQ1pSdVMwdUZIZlZ4?=
 =?utf-8?B?WE5jdkxtYUFyMmV5bDJTUkI0akV3Mm11UVg2NUtoaStNUkVWM0MrY1RtSTQ3?=
 =?utf-8?B?SWR2YzZHVnVnY2lUelVmVlJFYVdYQ2E3K2hiYzJLYlVndnc2R1FwVjZEZjRV?=
 =?utf-8?B?cGJERXR4dHZwZnhxZldrWElrSFo4Z1B4K0FhVmVXdlpFNGJ3VWEycVVmTjE5?=
 =?utf-8?B?RkIwU2x6Q1NsTmlFUXp5S0hqZmVpZUlHWGs0SC90NzlObnlMT0dGRjZCcXE1?=
 =?utf-8?B?NkxnaWZWQmkrdUVaR0RRTi9KaFphU2FRb202ZXhVR21QTC9kc0k1Q1pOTnpC?=
 =?utf-8?B?MnJTQ045YVVEbUJTK1R5SExlUkdkVkpObWpiWEN1MXhvblpwbUMyTGZyOUdK?=
 =?utf-8?B?cUhHSnBWeE96NlovQmZjaXBJU2toTHRtU2tUUEJnc05OQUZUWEh4WHQ5VS9S?=
 =?utf-8?B?bUJUclhWbkVSK2pzQUNMRHp6VU1kcnFkZWZzeTIzV09WZUQ1Z2Rjb0dDQ0p1?=
 =?utf-8?B?Y1RZY1VKSDA5YWFQUjVyS2ovR09FZnllVHc0NGxOQWJrajZSY2hvV29ITjds?=
 =?utf-8?B?NGxlTnVJdFNCTElHSysrSWJNbGR5QUpIdXVLU1JnSFZHK0FNSVRiek5vOXpR?=
 =?utf-8?B?VXJ0bnlMcWc2OGxDTTJ3K3ZzbGR5MFZ5ZkErYkhEcTAzTlJ3SncvVmo2Qlds?=
 =?utf-8?B?VzhvcWlYSmpWbGpYN2wvNEJPenVuenNTb2NRWE4yMHhDZnhXYUhROWZLak1I?=
 =?utf-8?Q?gVeh1Gbip9N6PBmR7Rcl+is=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: kICbRjw+UtsZftE3WayvQKu+bF1KQ0Ii8evasfSeZVRDbo9FugF3sEsmmfzkUBwFOrkdoz0FlclhjngtGLjgKtxNnWZTxJksHGqKGFtrHmdvslRlTj3oP2tCD9El45b8E5JuHzzPoLerVPLOGBUI8W3xln/uhpdEPO5KKiCB2c1vJIdJQnyRiCzUQcWiACsKX8rlf7GXEmsJTdsWEzeEN7eMCul5UOU02xNKyNfCPwQ2RzvoBT39RDjAb+zBQN1z2ZnIUdbaVQT6tlI+xQRsDMFVPSWLrINRtfL5wxdB0nJKt7DHeAaCc9PPNMKry/IMssxugmZ3XGagm42hVAI3gqykSQtEvLGMOcaAMYv9uU4e6KqBMQcaoGPGm0+io0iaUHYsBeNp/iv7LaTqlOKGY6DvY/30V6JAxulKj0SByY4Nybvgcvl8wKj6WObgRDsLsATEdHeZZ9Sqnx+T59YpfL1OVFn3Uftpw/Kcis9q3jVXMMfjeEUcHuIWqfHdBfgR2+hB7iZA3T0z074jcAvjDVSfxavVc2yWadgnKt2s1ragaccglzz6EYafNoiZt3ce2147e1RchfOlIcCIUMf4gmWSJQa835mS0QkW0ELvw40rkkTsZZif1QhoP5v99sgVHtS0wYNHpwv68Lei7kRgH70J0lzxwsongADaWRdb4NugRszbYfcg7Gcf0AH7zusxSoYD5wHO2SeN5yihOUZEG0abVz+PYiVqcegtkqYwugpQv2HvVzNJPTNwZ17j26RgCQFUAWL7YoVIXVJGFuy6nR1gqKDHH7GvHsUAlUyQtXrxJ4pchj4Nu1Popjx21mbBY6IQmY1r1B8lSSwmLsXyMXTjmF96M1njAH1hoUabAcviPZ9tCWkmmqbNoxf7CgcbypTPXfIupNrKnJ2vZ1ESlQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dba3c74-a648-4525-3c8c-08db3057ceb3
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 13:16:29.2589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ibCYE3lFC6uTOk1Pr0BANiq0JHUMz21JxRvHq1+qcyVVypSGVZoXiguI4rYD1In5aYNk7jPiw80bIK77+9MIC4idtJ8HTF0xKhI2EwJsQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6189
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_06,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303290106
X-Proofpoint-ORIG-GUID: qSrBkji3vSI2ly0QYAC-EcGr1mFZgTbL
X-Proofpoint-GUID: qSrBkji3vSI2ly0QYAC-EcGr1mFZgTbL
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
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



On 3/29/23 00:03, Michael S. Tsirkin wrote:
> On Tue, Mar 28, 2023 at 11:59:26AM -0400, Eric DeVolder wrote:
>> Currently i386 QEMU generates MADT revision 3, and reports
>> MADT revision 1. ACPI 6.3 introduces MADT revision 5.
>>
>> For MADT revision 4, that introduces ARM GIC structures, which do
>> not apply to i386.
>>
>> For MADT revision 5, the Local APIC flags introduces the Online
>> Capable bitfield.
>>
>> Making MADT generate and report revision 5 will solve problems with
>> CPU hotplug (the Online Capable flag indicates hotpluggable CPUs).
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> 
> I am looking for ways to reduce risk of breakage with this.
> We don't currently have a reason to change it if cpu
> hotplug is off, do we? Maybe make it conditional on that.

By "cpu hotplug off", do you mean, for example, no maxcpus= option?
In other words, how should I detect "cpu hotplug off"?
eric

> 
> 
> 
> 
> 
>> ---
>>   hw/i386/acpi-common.c | 13 ++++++++++---
>>   1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
>> index 52e5c1439a..1e3a13a36c 100644
>> --- a/hw/i386/acpi-common.c
>> +++ b/hw/i386/acpi-common.c
>> @@ -38,8 +38,15 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
>>   {
>>       uint32_t apic_id = apic_ids->cpus[uid].arch_id;
>>       /* Flags – Local APIC Flags */
>> -    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
>> -                     1 /* Enabled */ : 0;
>> +    bool enabled = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
>> +                     true /* Enabled */ : false;
>> +    /*
>> +     * ACPI 6.3 5.2.12.2 Local APIC Flags: OnlineCapable must be 0
>> +     * if Enabled is set.
>> +     */
>> +    bool onlinecapable = enabled ? false : true; /* Online Capable */
>> +    uint32_t flags = onlinecapable ? 0x2 : 0x0 |
>> +        enabled ? 0x1 : 0x0;
>>   
>>       /* ACPI spec says that LAPIC entry for non present
>>        * CPU may be omitted from MADT or it must be marked
>> @@ -102,7 +109,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>>       MachineClass *mc = MACHINE_GET_CLASS(x86ms);
>>       const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
>>       AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
>> -    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
>> +    AcpiTable table = { .sig = "APIC", .rev = 5, .oem_id = oem_id,
>>                           .oem_table_id = oem_table_id };
>>   
>>       acpi_table_begin(&table, table_data);
>> -- 
>> 2.31.1
>>
>>
>>
> 

