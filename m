Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E34C3A487D
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 20:18:24 +0200 (CEST)
Received: from localhost ([::1]:48578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrljb-0008LX-Cb
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 14:18:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lrlgt-00075Y-Nq
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:15:36 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:24450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lrlgl-0005OD-A7
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 14:15:34 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15BI6E1E009320; Fri, 11 Jun 2021 18:15:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : from : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=FqGIN30gKPshcwNe/3r6WUl9ttLgxI5beto8/Ux+5R0=;
 b=ZPv84ODvb54VhMUEU1o6DuYK77Z7sEVl0Rl3HpH967Nv0T6ait5KxhrMA9h/eIIIsngj
 82sQWWULTq0vaQf/XXB56oTQG44yLsLJXUYG1WmQGxetCon8dOQaJuxja8XV9wk89gjH
 u5QwURQQoHuvG861N/uhi4cpBrtFyOKyLLPlilU+vson4hlOGcxVHZ/fMCHBEVdbQES8
 eLot42JB8vtq69xt2DaFDcsYwVv+W59zJxCgfr390r5gU+cFeJ6fp8IPFNsKquG1Oka3
 Mjg6C9KzJd/LFWS/7tN0bsRsZttkHJobQIzK0qlmSD/NTdOfBXrWgwiGhLu/ic1njlCE zA== 
Received: from oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 393y0x08ga-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 18:15:21 +0000
Received: from aserp3020.oracle.com (aserp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15BIFKVR130110;
 Fri, 11 Jun 2021 18:15:20 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
 by aserp3020.oracle.com with ESMTP id 3922x37ukv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Jun 2021 18:15:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z16P+lBaftXhIWlURW6roDVHv9yDsC2hib1Nir42G4b+2aApQ73yhtsBCvNfgMNIqh6AXWSGnMfux8PFAygPfWM9VoqRGFIOX9nV5W4unzxMsvGu1IFmn32xktS8ULKpSmykOhjUboLsVEsjMh8RxosD6ewEPg36AuG4UXc2TDxchG2a2yeowu3+ySrwdjUc1APuh8VYjja+B29rXYDt1HejOhbJbxQy98wqsJ5ExQwfM8MDrvze+555vAmcy+hFNAcnPryw1cRVAARPbAZ4GnaoJbwPtz67+9VBrPff0t08Fcht5nayzHKNVx3rEYOEAoD3lKaSZ42TTex44rft9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqGIN30gKPshcwNe/3r6WUl9ttLgxI5beto8/Ux+5R0=;
 b=XHwLTLoX0Er6THXusKbe/a+qACOqFWMQnZyoaMnQi2zIUJwEWZyuvO0QSy9M9NqIAT5EDZtLIkOh1XO0qhwJrEKgr9duNqqUgIipBR0rVu/nQgL01GwKES/a7iOp2V76e+O5Y8gNkQOn1YSKGNxxXl/bBXFlvvEvv5b8syO46LbsyebxU159fgtThLwIsZPvXopU0EP5g3xGf3Qg8TNMUKnoAadOKGzEJSdgeyxfKU0+gMcxGMnez8rUaqI9qamORI1437UCvQgpQhE9VLL8Ue7+TrGbnnuc+NwEmyVQBquX7Q+4Ero16R6sUQG7Y4YOq+4iBW6e7d+nBgn2kggLdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqGIN30gKPshcwNe/3r6WUl9ttLgxI5beto8/Ux+5R0=;
 b=Vtu0/Un+BMlGysgz6TbqsSxKYbSmFZkT9XlDYzM4PgLvTHIxDde5WsMpYc20w5FTMp2QpMklRd0+A6mdUXeHqOEKHTcZQFVnDMOXSVCxmoHB0y+F5e7sWqVXT22vrAgRDRqtf4zABgKNPw58SIGsmKdx0sjg6DB31gyTNEHABAg=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by BYAPR10MB2726.namprd10.prod.outlook.com (2603:10b6:a02:ae::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 18:15:17 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4219.024; Fri, 11 Jun 2021
 18:15:17 +0000
Subject: Re: [PATCH V3 12/22] vfio-pci: cpr part 1
From: Steven Sistare <steven.sistare@oracle.com>
To: Alex Williamson <alex.williamson@redhat.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-13-git-send-email-steven.sistare@oracle.com>
 <20210521162444.2ef31f42.alex.williamson@redhat.com>
 <85b5ee22-a6cf-9a64-8086-6db28126d8ba@oracle.com>
Organization: Oracle Corporation
Message-ID: <132153d0-902c-1e3e-99fe-f5ceaa87ed0e@oracle.com>
Date: Fri, 11 Jun 2021 14:15:12 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <85b5ee22-a6cf-9a64-8086-6db28126d8ba@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SA0PR11CA0117.namprd11.prod.outlook.com
 (2603:10b6:806:d1::32) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SA0PR11CA0117.namprd11.prod.outlook.com (2603:10b6:806:d1::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.20 via Frontend Transport; Fri, 11 Jun 2021 18:15:14 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4140ec8f-a853-4a66-77d0-08d92d04dd52
X-MS-TrafficTypeDiagnostic: BYAPR10MB2726:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB27266028F5D326E577E14FB8F9349@BYAPR10MB2726.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9LKG5ogD9rdJ1EtHwTyabj1uc9EEn1ffentffZybpUnqPgWBZPaoPUZZQC7Vo1wH6b3imXNRDqZ7r1iC2AO5L280iSaWGCsma1dhnjWVw/0jV5MJeQ+BP6xIaKd0YhRH1WsD+3dgBxJD47iuJTsy8LPSwDF7tjHawmEmseuwCd/LUmjKnBFKqf8oDHl2/hqlJp09f1LLIVgMtG8kADWrVVvpXdg6LYGEYLEHptibTcefgenxSS80IAKehs85AHaf8niROWRjC8/HkcgailXhixqjqyC6KXDJYtl01yGHVDEloPpPLU+4kWEpeHCyElc2Fpzy0hsCQbXhd9EE9dKhhXSivadAtZ7kJ/uTGLRlNXhUmaReMVrHfhA3HFRNfkU9AGTekaGaZ28yph0YvR+VaHPK4kOzm6pFsXitsgg8F7C0Fyb3Uz3LHei6sK6UpFcEZWLGAVLEW2Pi5MlTbLUzU0E7t2xaVqRKxXqBT/7tTXMXUsHNahb8PQzZRp8l3a4gnk/FrwUCODUZYjHRrLotIew5rvjQMKbzZpK5ZtaKZ0n4H6zg0cc1FWTx9N+2iDs2LNTHrLJFH6BpqTgFfyV1wnOfkiJOFHc6UW+Jwy7+erPc3ndAQUYMARXw+ppdZhJUbtEfAre05S8jctAODYgJgLEYXqC0hQRKqHj5+PZb1OPRb63iwKfhPmWSISOmGI49
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(376002)(396003)(346002)(366004)(136003)(5660300002)(66556008)(66476007)(66946007)(38100700002)(53546011)(26005)(36756003)(478600001)(36916002)(6916009)(107886003)(7416002)(186003)(31696002)(956004)(16526019)(2616005)(2906002)(44832011)(8676002)(6486002)(31686004)(54906003)(16576012)(8936002)(83380400001)(316002)(86362001)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlNadlowRmc4QjgvdDlzVThwOGpFbkFoaFdkUWtvVnZhY3ZKSzgxc0ZucGVt?=
 =?utf-8?B?MFlyaDJwbURhOVM0VjNHQU9ob1l5SDlnUnJJcVZEMm1xcDJnVmFHTDJ2SDB5?=
 =?utf-8?B?VENPK0xKRTd3ZTd1RkRDZlRDZ2lOSEFQVGZwcjJRUVBkZitmV2xYZnpwS25Q?=
 =?utf-8?B?ZUxNZFROMGsrM2xwVkwya2N3ZEFzYlBPaEE2MlM2dGFCK3hFTjU3WkNtcWU5?=
 =?utf-8?B?U1M5b01YZzgvUFl2WmpUaGdxanZGdjBSVXpZU2dyY1k4b3BaV0Q4Nm1RQjJW?=
 =?utf-8?B?b3U5YzIwaHpqVGE3eUJxd1JycXdQYVZUMjF3RHZFN0dKaUJVMEtXREtVWjA5?=
 =?utf-8?B?SzBWeFFuVVhqWjRFTTY5UG5CY0R0dHBIZzk1QTJLbWNyc3RNdFF6cnQ2cTZX?=
 =?utf-8?B?SzdJWDdCRDdkZTJNemh5dlVqNENCZHJvYjQ0Q2xTQU90Nk0wOVo3NXhEZW5T?=
 =?utf-8?B?Yyt0aFFLdjJVdStQbG9VU1F6VU5laWw2NkFFMzV3SjVJZkRzOUhrYVFXTW9Q?=
 =?utf-8?B?K0MwTksxb0pHcEU3MHhCYTVWRzVxSUwxamxvUGlaN05OWTJ6ZVRsNkYvWUZR?=
 =?utf-8?B?L3FPOUZSSFRFeXpmL0Fyd2xyM3JRVld1R3dpNzk3VmRUUEZaZlUvL0RvUWNa?=
 =?utf-8?B?cjdDbTMxMk9ETXZGQ2J3K0JSeDBDZEpGQ2NZeFZ2WERpRlAzYm9PSHNHWUJl?=
 =?utf-8?B?SGJGc09hL3RxdXcrRkwyS1c1Sk1OcytzNHVrL0lxWmdWcFlJbkZrZjdIMXZ0?=
 =?utf-8?B?WStxbDlyOUVVSk52MFRIUmV3MzBtOWVSMXg2UUtqY3JOUnV4ZmlSVjBwRWZU?=
 =?utf-8?B?TFNJbjZrOVlib0pZWkxERmppUTNTSm9Xa004RnNtUmR6KzR1SkJ2TEUwN3pU?=
 =?utf-8?B?OHMzc1FFTmI1TU16NkI3SVc5YXpOcFBkQ1hMdUtTU1JRV3l6NmU1ZXZPUkt4?=
 =?utf-8?B?Y2NlQzhnVmNuc0NER3dQY1hjcXI1VnUxdHRwaWNWVUQ4eFc0d3lJZUxPbFM0?=
 =?utf-8?B?cmx6c2ZzbE1WNWMzNXViYklCMEF6ZW1CQTlJOHAyc09aSHJBTFJHYUFDb1pq?=
 =?utf-8?B?b2kzd0Q5SExkUEQ4TEVvbXE2Y0t3R0pJanB3VnNnaTdQSWxFNG05bXZFWjVj?=
 =?utf-8?B?THNpeG8wbDk1b3lkUklTeExiOHJOZmlndkxvT3BTTVhYL05Eano4M1RlbEhE?=
 =?utf-8?B?cFQvbDg0UW5uQVhyZEVXbjlTem5BR1c5eVIxOEJoZStLU0pGY25zd3hzTUtw?=
 =?utf-8?B?WTh2MEpXbCtva3M5MmR5SzRiWm1zOXdIRjd6cVdWZkt5cHY2azA0TzJ6RUdW?=
 =?utf-8?B?WWRDZmJYV3NJOXMvWGlxY2VrYWNuZ0t2bW9vUUpwRitySmxCa0JHcDZUYnZv?=
 =?utf-8?B?dFMycE4vY1daQVp3VkdLL3cwZTlGeUppQ3U0S1QxTWFYY3RTQXRjb0xrUjM2?=
 =?utf-8?B?SnNnbkFIMjBkbzRMeVo2eEVTaVZLc3MvUXBmaDhobWphNDhod2dvVFovRE0x?=
 =?utf-8?B?dDFoNzM4TnBiWFNuTnRTc2pPME5FMS9FUDMvdGwzUWJybjM4UFZ1RE9sQXRz?=
 =?utf-8?B?RXVwRzNaTGtvMWo3dk54Y1dZUWdseURsdXFISEtWa3RkeWZ1R1lBdnRmNTdF?=
 =?utf-8?B?VWpGd3N4S2d0VDJqRHhzd2RDQVdnbDJBS01qbVdZTExoWWdENFNnOGFUM3px?=
 =?utf-8?B?RVdhTWdaektwTUpJSzUzcU1wamJQMGF6VzRXN2gvTjdLMWlpbG14RWVPcVRk?=
 =?utf-8?Q?sPT2SgQNOUwYmG+WtDT7Gg+lMCfCKZk3wqNihbe?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4140ec8f-a853-4a66-77d0-08d92d04dd52
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 18:15:17.2020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YrIerAU9El2aYg2MiSSyPf5Ou7seVM+ggHohSZRdJjVejAxa0cGZwAMNmD9woW13mc8pxJKvIl7mpOapxgIClghqcYUgbNfDnZZsX0e1HVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2726
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10012
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 malwarescore=0 mlxscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106110114
X-Proofpoint-GUID: 4Z8ji-ks7AZRarvqUynEelH5WjlfTfrB
X-Proofpoint-ORIG-GUID: 4Z8ji-ks7AZRarvqUynEelH5WjlfTfrB
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/24/2021 2:29 PM, Steven Sistare wrote:
> On 5/21/2021 6:24 PM, Alex Williamson wrote:> On Fri,  7 May 2021 05:25:10 -0700
>> Steve Sistare <steven.sistare@oracle.com> wrote:
>>
>>>[...]
>>> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
>>> index 7a4fb6c..f7ac9f03 100644
>>> --- a/hw/vfio/pci.c
>>> +++ b/hw/vfio/pci.c
>>> @@ -29,6 +29,8 @@
>>>  #include "hw/qdev-properties.h"
>>>  #include "hw/qdev-properties-system.h"
>>>  #include "migration/vmstate.h"
>>> +#include "migration/cpr.h"
>>> +#include "qemu/env.h"
>>>  #include "qemu/error-report.h"
>>>  #include "qemu/main-loop.h"
>>>  #include "qemu/module.h"
>>> @@ -1612,6 +1614,14 @@ static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled)
>>>      }
>>>  }
>>>  
>>> +static void vfio_config_sync(VFIOPCIDevice *vdev, uint32_t offset, size_t len)
>>> +{
>>> +    if (pread(vdev->vbasedev.fd, vdev->pdev.config + offset, len,
>>> +          vdev->config_offset + offset) != len) {
>>> +        error_report("vfio_config_sync pread failed");
>>> +    }
>>> +}
>>> +
>>>  static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
>>>  {
>>>      VFIOBAR *bar = &vdev->bars[nr];
>>> @@ -1652,6 +1662,7 @@ static void vfio_bars_prepare(VFIOPCIDevice *vdev)
>>>  static void vfio_bar_register(VFIOPCIDevice *vdev, int nr)
>>>  {
>>>      VFIOBAR *bar = &vdev->bars[nr];
>>> +    PCIDevice *pdev = &vdev->pdev;
>>>      char *name;
>>>  
>>>      if (!bar->size) {
>>> @@ -1672,7 +1683,10 @@ static void vfio_bar_register(VFIOPCIDevice *vdev, int nr)
>>>          }
>>>      }
>>>  
>>> -    pci_register_bar(&vdev->pdev, nr, bar->type, bar->mr);
>>> +    pci_register_bar(pdev, nr, bar->type, bar->mr);
>>> +    if (pdev->reused) {
>>> +        vfio_config_sync(vdev, pci_bar(pdev, nr), 8);
>>
>> Assuming 64-bit BARs?  This might be the first case where we actually
>> rely on the kernel BAR values, IIRC we usually use QEMU's emulation.
> 
> No asssumptions.  vfio_config_sync() preads a piece of config space using a single 
> system call, copying directly to the qemu buffer, not looking at words or calling any
> action functions.
> 
>[...] 
>>> @@ -3098,6 +3115,11 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
>>>      vfio_register_req_notifier(vdev);
>>>      vfio_setup_resetfn_quirk(vdev);
>>>  
>>> +    vfio_config_sync(vdev, pdev->msix_cap + PCI_MSIX_FLAGS, 2);
>>> +    if (pdev->reused) {
>>> +        pci_update_mappings(pdev);
>>> +    }
>>> +
>>
>> Are the msix flag sync and mapping update related?  They seem
>> independent to me.  A blank line and comment would be helpful.
> 
> OK.
> 
>> I expect we'd need to call msix_enabled() somewhere for the msix flag
>> sync to be effective.
> 
> Yes, vfio_pci_post_load in cpr part 2 calls msix_enabled.
> 
>> Is there an assumption here of msi-x only support or is it not needed
>> for msi or intx?
> 
> The code supports msi-x and msi.  However, I should only be sync'ing PCI_MSIX_FLAGS
> if pdev->cap_present & QEMU_PCI_CAP_MSIX.  And, I am missing a sync for PCI_MSI_FLAGS.
> I'll fix that.

Hi Alex, FYI, I am making more changes here.  The calls to vfio_config_sync fix pdev->config[]
words that are initialized during vfio_realize(), by pread'ing from the live kernel config.
However, it makes more sense to suppress the undesired re-initialization, rather than undo
the damage later.  Thus I will add a few more 'if (!pdev->reused)' guards in msix and pci bar
init functions, and delete vfio_config_sync.

Most of the config is preserved in the kernel across restart.  However, the bits that are
purely emulated (indicated by the emulated_config_bits mask) may be rejected when they 
are written through to the kernel, and thus are currently lost on restart.  I need to save 
pdev->config[] in the vmstate file, and in vfio_pci_post_load, merge it with the kernel 
config using emulated_config_bits.

Sound sane?

- Steve

