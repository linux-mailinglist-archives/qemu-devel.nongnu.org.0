Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0F748572E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 18:25:44 +0100 (CET)
Received: from localhost ([::1]:52044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5A2h-0005N9-5o
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 12:25:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n59zv-0004Or-If
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 12:22:51 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:22762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1n59zr-0002OM-2c
 for qemu-devel@nongnu.org; Wed, 05 Jan 2022 12:22:48 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205FYKbt020698; 
 Wed, 5 Jan 2022 17:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=6YtkLFJ7Lpw/0KvhW7zlGaSqFILCwsUTSmHWaHlEKPo=;
 b=D/vlbe4T4nfj1GRkiE4AGC6JbrFzUaalLH7cDCm4Exi0bQsVgzRnLlxMHRJi7hj3dfmW
 dRS8aRyFYtAtQzNE+RZBdwqRBKz0rKCT0nyfVfMzVRoTgu1efCDNe6jswjC4KxKARuxr
 SLMuuFMQySAAvU8dndb0YH4MNbxlmW+hwRDf4ADsn+O+2YbyTJJhfUMHAOenhHQeZYIq
 oBWEFqYSnmO2epxCe2YHqyI+Z+hAqCD8UeaqLbqZufLGyG7ElwqXgZkgJRvC5GoR2SH/
 kJ5Q9kQEPYIReIHBsEtZwCPPCHw8kDbXSF66i2J8N/2Mmr0Pu6/sVJO0HDRxu7qvEHDH ZA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3dc3st5f1h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jan 2022 17:22:33 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 205HBIgB062842;
 Wed, 5 Jan 2022 17:22:32 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2105.outbound.protection.outlook.com [104.47.58.105])
 by userp3020.oracle.com with ESMTP id 3dagdquegn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 05 Jan 2022 17:22:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3xh/h5WZpAwGd+hMLiXtMMvkUfu9cFiIU7k54YvjKhkjT4Ixg1XG9cBdeF7dLKJUovtIIcl2ld2kKeEsk6SxUefP3aF1kp1V/NU8x1uCn+TPksMNmjR6lCp+04HGivu5Fv0+peyIErDbFjBFFbOZhbaNkPEbowZ5Nib0IkQLUx6BqSeiiIm5LNxZxh8I6BozWjxKXadnx6baKLSY1S5HmpEoUUG1K5pqu6FMDycRx+6k0rDdGUa9H3Dl8Ac5pjMZjn8C0apwyj7xkBAuGplfpQ31zP2Zdy8kDXOvOugMexN7V2WK5VqbZlQPjWjSZzvk8RscWNyWkLS4/28AARs9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YtkLFJ7Lpw/0KvhW7zlGaSqFILCwsUTSmHWaHlEKPo=;
 b=ALyQYBTyrrIR+d2qqWhp02H5puuSSJd6/bopoA7d/rsigfyPt4qH6cq0n5JTiK5vr+6dUcj2mJLqiwoXfg0DbyQ2csv/kiKODoSOpWvZbESazDAXbyJuzjzSXfSC8f6UlXeG3CDnbyl7CWGhdg/s6uRfz8mDcrRLeKwgD964taXusYCeYgKW3fIVbxuyvWzGHTm4EpCqLeKdx5y7drRremf6yr/pJQapkro/OG6Fik2BD0DQkPCfdUfzSsdFG1eRqQpomsFg7hz/Fdfk/oT8tF+ajLe+SaW8pWsLEMSEnsFA9Y+vwgM5wSjPDdMWiAWnjY9F8UbndwuxK89hT7YpLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YtkLFJ7Lpw/0KvhW7zlGaSqFILCwsUTSmHWaHlEKPo=;
 b=SdCOf9kMLcI6F/HEj9vIXoLkuxItlo8NUBeZN8al+pETg3NlniArzlGPRCWT2JTcDTLN3faxCkzP+ESgdLA3EQASb8Dsla+UlpojFXrew+bDdYnLo+lxWCmiwQo3uiqODzNx/jFkt44bb8toCFPRg7E9fDv2zlXrUpjHnLFX+pU=
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2422.namprd10.prod.outlook.com (2603:10b6:a02:a9::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.15; Wed, 5 Jan
 2022 17:22:30 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::d91d:1a8b:56bd:6623%5]) with mapi id 15.20.4844.016; Wed, 5 Jan 2022
 17:22:30 +0000
Message-ID: <02a093fe-b2be-2ecb-7ef7-a95c54443894@oracle.com>
Date: Wed, 5 Jan 2022 12:22:25 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V7 17/29] pci: export functions for cpr
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <1640199934-455149-1-git-send-email-steven.sistare@oracle.com>
 <1640199934-455149-18-git-send-email-steven.sistare@oracle.com>
 <20211222180611-mutt-send-email-mst@kernel.org>
From: Steven Sistare <steven.sistare@oracle.com>
Organization: Oracle Corporation
In-Reply-To: <20211222180611-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0062.namprd12.prod.outlook.com
 (2603:10b6:802:20::33) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5a8a20d-5b29-4832-453d-08d9d06ff399
X-MS-TrafficTypeDiagnostic: BYAPR10MB2422:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB242203725B4E6DBC16E6F5E8F94B9@BYAPR10MB2422.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KGaNG0Rya1QB98JJemnpD0An7mRgXLhmKH1h3InYrCiLlCdbu0oUYsFswtqzjEPoy+gG1nrlCwsYD911tp7Jt05enOpFAFlL8mchdSTFf97P820VAINy2nvYI5u+EGPXMdDYLs6x21W5XeWI8qxmF8nxXo+z5XSwaI5YLJDyTW5B0ogMmuB7f/8nhZdUrlF8pnOKuXjGa1vqnPD9ioeqLv2xsdJSRUSj4RUju7zRT2p73Q5gB5Y8peST2qDP9kNftg9u/M/Xv+zED8280h/ywxFYV9Hrk4j6+OXLRIA54hpC43t2qxP722DU7EPVPhzDmw/d/WKNZwt0wC4TmrtmbSnz2Ux7wAe6sf2oDHOFcuRQsK10B5+OJgJ+PcLmVhlZ/0lNaFgj9bKWYc5yIcOr2ZL0i45KG/m5JOnNYM1aMZC2tHUTLTPjGnXZ9Junkqv7T/yiti27Z3ArnEGW8bpqcWZmummuZ72zkqPSgvYZWFIRvC7XRInPDsNRXM9kvpdOi5/nmA4xwEG6fQb5uxGm2K9ur+PrrlyHVQrxDDjxcnM+3kWR2EKbzhWEmcdgv8LW4b89meUYCV5EAoZDpUTa99CIeY8W9bAiySyTWw2GspLtuuxWZPS0Lb7t6J3Zp5nAnLe2GBpF5bAEFZWLeIWVgmfP3eDHNGUjTYZQPA7qc+IONqkuyUUiC+xeFD8cIcbR2S7flu4jslx9dTUUUiVSntqBfXBFEb1ZQOpNR6kHob0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(186003)(31686004)(8936002)(66556008)(8676002)(2906002)(66476007)(7416002)(66946007)(6512007)(36916002)(86362001)(6506007)(316002)(2616005)(6916009)(508600001)(4326008)(36756003)(6486002)(53546011)(31696002)(5660300002)(6666004)(107886003)(38100700002)(44832011)(26005)(83380400001)(54906003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LytpS2QvUW9LR1F3aHd6QUFBNzlQbnpadkZTV20rWThNbGVkVCsxeHNSQmdV?=
 =?utf-8?B?ZzloVWlkWXI3bnNDdkIxZHNvSEp3TWtJdElKWTN0cDFvbXpRMUJiU0x5aDJW?=
 =?utf-8?B?cDN1VnQwNWtMQjJ5MDA2ZEplczhlNWM0bUlGRkNRcmJaZmhFdTRpV0V5OEdN?=
 =?utf-8?B?ay9YTXJIOE1USVBjSTFlMndNcnJBNXBxWGw1QlVWZm05ZzF1eG10dVpjUG83?=
 =?utf-8?B?UlBVV1dMcGxNY0dES2pudkJoMm5xTEtEQmd0UXNwYWhkZy9mSlIvZ0ozOWEw?=
 =?utf-8?B?aUM1cDBGTk0rZlVDWStDVUdDb25mQXV4WlhDNnQ0ZEJ4dlNsVzMvSDE3bFhq?=
 =?utf-8?B?TDMxVTZ3OVVETmViUys5R0FwcTVkNm9yaDMrZXVGdWtIUXVJWWdDdElKUm5X?=
 =?utf-8?B?eERUcERNZW9EdlRUSjdyQ0RIeUZBN1FBOWlpdDFRVFlwVkVsU0V2T3JCVm13?=
 =?utf-8?B?VmdsdFNCeXVnenlQb3dtancyRTFmc3RqaS9pb1k1bEh5MFVETHJqNURvY1Mv?=
 =?utf-8?B?UGVNREVJZEVoRWliTkg4VCt3dE9vMW9xeS8yRktydk50cWRDb3JEZ3Q3QVQy?=
 =?utf-8?B?S1g3UGo4cDVaK1JYMnIrUGU2QnduS1lWOFhlcEpaekZ6dTl4elRYbzhlTTUr?=
 =?utf-8?B?U0xwcTJNUDVMUjFjOHpJaWViS1BCQzk4T0t3cTVaWXJUL00zR1RmZmhSaXNy?=
 =?utf-8?B?dWlHR25UMmozVlZlOUFoalljNHpzMjZyZVk2a202UVE2ajYwSFltWFRFN1g2?=
 =?utf-8?B?cnVobHh1VllTMEdYK1NYSGw0MHpmdWJLcFp6eERPc0JxS1ZrUlZlUU5ZYk03?=
 =?utf-8?B?WTRXRHUwRk83a1gwMDI0ZWhkU0pnZ0RwbU14Z0cvcm90ZDVBNFNIK0JtTy82?=
 =?utf-8?B?WGZPaCtRazRlRTVIWk5SRUFQTS80Q2gvcU9NSmFPUE9oUmlyUllGUVNMV0U4?=
 =?utf-8?B?dndSVXV4V3lTVUxhNjNKWnYyZjIwNFRmNGVrVkpnVkdpcm5tcFZVODgwS2wz?=
 =?utf-8?B?L1U5aE9LZ0JOZmVuUVJlVENJbzhxQWlmVlVvUFk1UGZDbzljSjFxeGdGVmxB?=
 =?utf-8?B?WDVJYXdRbHY2WTNYc2V1VVY4WHFUNWJDanBtRU5oQ2dQT1IrWEwxM2JpVzRo?=
 =?utf-8?B?QU8vaXVtVWxkenN0aTJQS3dOR0hoZnpOKzZMVGhsZ3RGL0YzeGkxRHQxRm1L?=
 =?utf-8?B?dlUwSDBRQTh0eHR5d3p4Q09kYjIvNXdjU0NmalRJNUF1bXpmREhxa3puaFZy?=
 =?utf-8?B?amFPcDJhTk9kTld3MkVDdGhWblNiQTdLMjhFd0NSWjM0LzRaZnUwMnJoK0Zr?=
 =?utf-8?B?ZjNIcGJZb2s2TGhJelNROVBlSHJ4REd6QU1LS20wNERrVEphaDBOL0hGQ0Nr?=
 =?utf-8?B?UzVSQnZNMFJmYkhkeEdwSnhGVEtUMFZ3dC8zMVlJamtOb0hYRFRxN3psMjgw?=
 =?utf-8?B?R2ZhQVFZekI0RGp1ck9GdWQ0VWhNZ2V4REFZSkc4MXNvSm5oRC9LS2pHTzJo?=
 =?utf-8?B?WEYwR2N2VmhLMytPMXprVGk3NmsyMjZyeHc3Mk1sYzVZcWlnUWN5dFNmYTR1?=
 =?utf-8?B?TUV0YjVVK1FFdGduOU1UK0c5SXRvNU1uQU9GRWl6cUQ2SE1QQ0VjYStvREtm?=
 =?utf-8?B?WHZNTkhINlhvZlBxV1JVV2ViUEV3Qk1Bbkx6a050OS9VWXVROVVVOEdFOEpP?=
 =?utf-8?B?T3Bka3BRM0wyL2ZINHBEOUhWWmFsY1NLRG9TUmdqaU50ZkJ4eWhRL0xVMGF2?=
 =?utf-8?B?QlU2YnF5Yi9FM2RhU0M3eTBMVHdYaExoOHByRWpHSVNvTDlFQ3IrbWpRQWEy?=
 =?utf-8?B?M1Z2ZTkranMrbmxtcjk2c0Vkbmo4OWJjQXlpVW5nZEh1TncwZm5MYko2em81?=
 =?utf-8?B?OGhpSHMwZ0g3S1BtZ3RTczhEbFpLd09qaDU4VlNCZzRmWUlkV0ZSNXdOWDl3?=
 =?utf-8?B?b1RRMzViUVM3ZVVyMUF0MTVxWUFTbHB6L0oydW1JSWs4QTN6TVlRZGgwZURD?=
 =?utf-8?B?VTQ4QVpjSWZwY0V4aldwY0xyTjlpWURlNkZ6NS9vVDI5UUFzbVdiVGt0eHFw?=
 =?utf-8?B?QXZ4Y2NkWkFQMnMxY21PTExrc1NXNk5GRHFYQVkyZmFLNzcrVnZvSEorQUQ1?=
 =?utf-8?B?c3JndTV3OXJhN2t3WEFIZktnY2xYZU83MDh0cm9idDNBV3dOSk1GVXppUDdW?=
 =?utf-8?B?UVM4dHVNT21WVDczZ2ZmdE9zV3BZVHFQbktvL2JlU0tHRTRydDJCOVRxS2FY?=
 =?utf-8?B?WExVOStZVlZoUXJNMWlIT21MMlRBPT0=?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a8a20d-5b29-4832-453d-08d9d06ff399
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2022 17:22:29.9772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfHFld5LjCF0+VQ6MOSvoRBwOQlGqBUq43b8niuwzk6m42oZIwIH77l43DFX6fx//VCoUic3A4eoUR/ZYTpnnWXGVrifDjS5Jz0oNQugl4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2422
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10218
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 bulkscore=0 spamscore=0
 mlxscore=0 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2201050115
X-Proofpoint-GUID: _GweI7LHfb42AijCDzvQNflYVwboFtsN
X-Proofpoint-ORIG-GUID: _GweI7LHfb42AijCDzvQNflYVwboFtsN
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.057,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/2021 6:07 PM, Michael S. Tsirkin wrote:
> On Wed, Dec 22, 2021 at 11:05:22AM -0800, Steve Sistare wrote:
>> Export msix_is_pending, msix_init_vector_notifiers, and pci_update_mappings
>> for use by cpr.  No functional change.
>>
>> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> 
> With things like that, I prefer when the API is exported
> together with the patch that uses it.
> This was I can see why we are exporting these APIs.
> Esp wrt pci_update_mappings, it's designed as an
> internal API.

Hi Michael, thanks very much for reviewing these patches.

Serendipitously, I stopped calling pci_update_mappings from vfio code earlier
in the series.  I will revert its scope.

I would prefer to keep this patch separate from the use of these functions in
"vfio-pci cpr part 2 msi", to make the latter smaller and easier to understand.
How about if I say more in this commit message? :

  Export msix_is_pending and msix_init_vector_notifiers for use in vfio cpr.
  Both are needed in the vfio-pci post-load function during cpr-load.
  msix_is_pending is checked to enable the PBA memory region.
  msix_init_vector_notifiers is called to register notifier callbacks, without
  the other side effects of msix_set_vector_notifiers.

- Steve

>> ---
>>  hw/pci/msix.c         | 20 ++++++++++++++------
>>  hw/pci/pci.c          |  3 +--
>>  include/hw/pci/msix.h |  5 +++++
>>  include/hw/pci/pci.h  |  1 +
>>  4 files changed, 21 insertions(+), 8 deletions(-)
>>
>> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
>> index ae9331c..73f4259 100644
>> --- a/hw/pci/msix.c
>> +++ b/hw/pci/msix.c
>> @@ -64,7 +64,7 @@ static uint8_t *msix_pending_byte(PCIDevice *dev, int vector)
>>      return dev->msix_pba + vector / 8;
>>  }
>>  
>> -static int msix_is_pending(PCIDevice *dev, int vector)
>> +int msix_is_pending(PCIDevice *dev, unsigned int vector)
>>  {
>>      return *msix_pending_byte(dev, vector) & msix_pending_mask(vector);
>>  }
>> @@ -579,6 +579,17 @@ static void msix_unset_notifier_for_vector(PCIDevice *dev, unsigned int vector)
>>      dev->msix_vector_release_notifier(dev, vector);
>>  }
>>  
>> +void msix_init_vector_notifiers(PCIDevice *dev,
>> +                                MSIVectorUseNotifier use_notifier,
>> +                                MSIVectorReleaseNotifier release_notifier,
>> +                                MSIVectorPollNotifier poll_notifier)
>> +{
>> +    assert(use_notifier && release_notifier);
>> +    dev->msix_vector_use_notifier = use_notifier;
>> +    dev->msix_vector_release_notifier = release_notifier;
>> +    dev->msix_vector_poll_notifier = poll_notifier;
>> +}
>> +
>>  int msix_set_vector_notifiers(PCIDevice *dev,
>>                                MSIVectorUseNotifier use_notifier,
>>                                MSIVectorReleaseNotifier release_notifier,
>> @@ -586,11 +597,8 @@ int msix_set_vector_notifiers(PCIDevice *dev,
>>  {
>>      int vector, ret;
>>  
>> -    assert(use_notifier && release_notifier);
>> -
>> -    dev->msix_vector_use_notifier = use_notifier;
>> -    dev->msix_vector_release_notifier = release_notifier;
>> -    dev->msix_vector_poll_notifier = poll_notifier;
>> +    msix_init_vector_notifiers(dev, use_notifier, release_notifier,
>> +                               poll_notifier);
>>  
>>      if ((dev->config[dev->msix_cap + MSIX_CONTROL_OFFSET] &
>>          (MSIX_ENABLE_MASK | MSIX_MASKALL_MASK)) == MSIX_ENABLE_MASK) {
>> diff --git a/hw/pci/pci.c b/hw/pci/pci.c
>> index e5993c1..0fd21e1 100644
>> --- a/hw/pci/pci.c
>> +++ b/hw/pci/pci.c
>> @@ -225,7 +225,6 @@ static const TypeInfo pcie_bus_info = {
>>  };
>>  
>>  static PCIBus *pci_find_bus_nr(PCIBus *bus, int bus_num);
>> -static void pci_update_mappings(PCIDevice *d);
>>  static void pci_irq_handler(void *opaque, int irq_num, int level);
>>  static void pci_add_option_rom(PCIDevice *pdev, bool is_default_rom, Error **);
>>  static void pci_del_option_rom(PCIDevice *pdev);
>> @@ -1366,7 +1365,7 @@ static pcibus_t pci_bar_address(PCIDevice *d,
>>      return new_addr;
>>  }
>>  
>> -static void pci_update_mappings(PCIDevice *d)
>> +void pci_update_mappings(PCIDevice *d)
>>  {
>>      PCIIORegion *r;
>>      int i;
>> diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
>> index 4c4a60c..46606cf 100644
>> --- a/include/hw/pci/msix.h
>> +++ b/include/hw/pci/msix.h
>> @@ -32,6 +32,7 @@ int msix_present(PCIDevice *dev);
>>  bool msix_is_masked(PCIDevice *dev, unsigned vector);
>>  void msix_set_pending(PCIDevice *dev, unsigned vector);
>>  void msix_clr_pending(PCIDevice *dev, int vector);
>> +int msix_is_pending(PCIDevice *dev, unsigned vector);
>>  
>>  int msix_vector_use(PCIDevice *dev, unsigned vector);
>>  void msix_vector_unuse(PCIDevice *dev, unsigned vector);
>> @@ -41,6 +42,10 @@ void msix_notify(PCIDevice *dev, unsigned vector);
>>  
>>  void msix_reset(PCIDevice *dev);
>>  
>> +void msix_init_vector_notifiers(PCIDevice *dev,
>> +                                MSIVectorUseNotifier use_notifier,
>> +                                MSIVectorReleaseNotifier release_notifier,
>> +                                MSIVectorPollNotifier poll_notifier);
>>  int msix_set_vector_notifiers(PCIDevice *dev,
>>                                MSIVectorUseNotifier use_notifier,
>>                                MSIVectorReleaseNotifier release_notifier,
>> diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
>> index e7cdf2d..cc63dd4 100644
>> --- a/include/hw/pci/pci.h
>> +++ b/include/hw/pci/pci.h
>> @@ -910,5 +910,6 @@ extern const VMStateDescription vmstate_pci_device;
>>  
>>  MSIMessage pci_get_msi_message(PCIDevice *dev, int vector);
>>  void pci_set_power(PCIDevice *pci_dev, bool state);
>> +void pci_update_mappings(PCIDevice *d);
>>  
>>  #endif
>> -- 
>> 1.8.3.1
> 

