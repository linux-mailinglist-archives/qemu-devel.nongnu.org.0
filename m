Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 877FA36DCE0
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:21:25 +0200 (CEST)
Received: from localhost ([::1]:34360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmwG-0003Py-8g
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:21:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lbmbT-00015v-Mk
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:59:56 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:52024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongli.zhang@oracle.com>)
 id 1lbmbP-0007C0-Gq
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 11:59:55 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13SFjd5i158636;
 Wed, 28 Apr 2021 15:59:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=Nt/900AaYISO2X60xZQsBmgXowrRrtqoBCgEJgWWphs=;
 b=t69j+Bdr/4SIUbxJ5Jmf42U+LblUVSgZ4dobtPaMT32g6RTK4zB970/lxKdxhz3SY0Lt
 sWF2GJJv0iuW/qKMrVC+pRfR4RphDayHhd7DiDc+eXXrjHkdkmj7PWAJw6JL54upjnzK
 y8COqQXAqmSAHnNhzLJLctVPyIcMiiNRi0zChv4Ce9UctVe+Dp49SDSRG2lluvm6zvTR
 3GWUkoKgDZp3gpkd7Z0zxy0QLL+nulXJ4MNqCC4qVtV7EXptmPfHcbJYFwQZlXVwsX8o
 fgaA173FbKollfLf4UE/96Dv1Ad3GseGSBa/4GNF92zo1T0MbzgBq2nkE/DzFTWAdLia NQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 385ahbsb6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 15:59:48 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13SFlB3N077304;
 Wed, 28 Apr 2021 15:59:48 GMT
Received: from nam04-co1-obe.outbound.protection.outlook.com
 (mail-co1nam04lp2053.outbound.protection.outlook.com [104.47.45.53])
 by aserp3030.oracle.com with ESMTP id 3874d283rb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 15:59:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WenpELMGJGwpVItT8eLXoiv0QPMMAVELubKw+1oGCZt43TB67EGuqRLepg384CfVkmclpPx+NQgyoDtn/hkK4S91E2bqlzLQL0vCq/iwA1s3RVKo8qtcASOH9HBd2kWl1IdqLuRkWUI2KjA7pYSb54+4AuHwLFNpmczA1fhDIkNZJHFa7KHE11IYeZzm8f6qhlW3YjfFVoJTotBWUjOiNT5krqrmQ1ddTXK61Oh/WwcgGk07w7isUmYVjMzFSI7XVxDTM83V3u1QWt6ClRkMS17/Czd7iQ21G3gM31NhVHy3Ayy+YRn4TzWjEZKYvAHCJ06r0BAlo7/WWUEWGZ74xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nt/900AaYISO2X60xZQsBmgXowrRrtqoBCgEJgWWphs=;
 b=QtxF87+Zm9vLTqsFQPWbYCnlp0f9Ha74SDWtIScnLR2xmnSJ4f5teCTNutJqoFI/eMYjG3YqLbZLlCGAXD92mbB6PapHH7s1WOhPLPkLq2o6rf5ODvUpHpl2XnXoDA6Q+JZ0r1Mh1+VlKPIoE//9jvNMCj//TMQoLUtOvCBCPNVqAmobnLd9O3PKhMAnOQ9kLpDOqhMcFvc1XhOoKRhXlj9XFTtOE6rWnc/3YCnFfrNYhhBbceKUpxI2jYf3sjA7kAV6ZDJCSdspEzRKtMhYI7xA7nPO37Y8evXfOUzTKYHs8F7scwvNcg+T1ZQyZBqteRFpjIt5kcz4IGxqj7FkEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nt/900AaYISO2X60xZQsBmgXowrRrtqoBCgEJgWWphs=;
 b=XZdJLnKCqPZKxeH77UKooYuaIMuB1Z4OOKFBwtw3XyXIbXD3ySLzJ6C+ipvTnPJjpUORKkDoHHAOkgKcjXZg0+BiwhPXRfgqildsFyt1FGbxcz2Pa7ClbARdhL0rGzGX5+SFvDp7LdvSj5ulccazlzh/UjfZI5+ZO85VyQX4rBY=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2663.namprd10.prod.outlook.com (2603:10b6:a02:a9::20)
 by SJ0PR10MB4784.namprd10.prod.outlook.com (2603:10b6:a03:2d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 15:59:46 +0000
Received: from BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad]) by BYAPR10MB2663.namprd10.prod.outlook.com
 ([fe80::44f7:1d8f:cc50:48ad%6]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:59:46 +0000
Subject: Re: [PATCH RFC 0/1] To add HMP interface to dump PCI MSI-X table/PBA
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210423044713.3403-1-dongli.zhang@oracle.com>
 <25113515-5c1d-c557-d0cc-04bfacecb6ee@redhat.com>
 <8aad1273-5c17-a2d7-46cd-eb149c6c57b8@oracle.com> <YIfRAKDvfZyOWrEL@work-vm>
 <37e7aa41-5c87-3276-67f6-b5bd64dde7ea@redhat.com>
 <3e4cfcf2-c4b9-028a-4d06-22b1e9a23455@oracle.com> <YIkgr6I6KNikyY8n@work-vm>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <f8d0386d-a85a-59fe-6327-fd719a787e15@oracle.com>
Date: Wed, 28 Apr 2021 08:59:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <YIkgr6I6KNikyY8n@work-vm>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2601:646:c303:6700::d22a]
X-ClientProxiedBy: SN4PR0501CA0112.namprd05.prod.outlook.com
 (2603:10b6:803:42::29) To BYAPR10MB2663.namprd10.prod.outlook.com
 (2603:10b6:a02:a9::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2601:646:c303:6700::d22a] (2601:646:c303:6700::d22a) by
 SN4PR0501CA0112.namprd05.prod.outlook.com (2603:10b6:803:42::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.8 via Frontend
 Transport; Wed, 28 Apr 2021 15:59:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56de8708-69b5-45df-94b4-08d90a5ea4d6
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4784:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB4784E96A0DFE6A1277A8F126F0409@SJ0PR10MB4784.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u2i5cU52iSuvPn8V+P+NCoSSrcW0B80++VA4mxOVjBQvn9ARzOQ363QhdmrZp5UFaUjBB4pBVNQuYSZ2HRs7X2mykC/Ex4wBQEU5KAP0F+BZHHcIFQECfCe8rJYNWC7y/1MqIYYmOKcHgP76/l+CCGwuLMtTYfeAJhL56AzuSxcOqwx4FPDRdVaHFXypKcGG8wUOcxa35pw1CYE0ZJJzMEA5lO+RrjiiDaIPcipphzwOCFu0iPkjYlsDmdz77evmPoiCBkFSTHshbCybwG960EsGmSC03GdqxbpN1GI9PvQ26Nr7qEtI1JE0rrRtjdtpKJ69sbAvohGai35nYk9L5kGwsK350ae6qrvx9LbvlGA/ZWIlcu+Uxl1YLqKPFE7D2833SNPU3N/77kUEbdBPcOtBS1hCxr1L/4q9qeBWwNShaEKdf93DT10aNz88qNhqcuyzsJn692kMtD9b0bBgMGOZ1z1wDm2AO2KO2GaTBm5hC5IJ5WbCCcV4yDmQw+ck1NnQYzgWZV8RuoXur3shRAY4FaA9k7p+CsL6D6lru4x2y90RfalsDPeCxtCgi8fEK5za0zfnZRBYnO4rNK3JDG0ocAlHcSLzC24N5RnyWnMGcVqUsOogsODvbgvkjqRR/hKWPkjCSeDkYGsXv7Y+S1DLQTMfhkRcRHVVkh3siegpUcIcBJtHsP8fl1ypWMhhC5DoWPMtd/KKPQLz5T8uGoZ14peCRGot7BfjL43djAigZ77vIfOgDcZK9cXZjSzvgc5Tdx1U5f3H71C/RmOtmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2663.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(39860400002)(346002)(396003)(44832011)(8676002)(16526019)(6666004)(5660300002)(66946007)(38100700002)(53546011)(186003)(478600001)(6916009)(66476007)(8936002)(86362001)(4326008)(83380400001)(31696002)(66556008)(316002)(2616005)(6486002)(2906002)(31686004)(966005)(36756003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NnlQUlZsekk3Ymk2UnhxUmRWV1VaaC9oOTNiTHU3RzIyZVhvd1J1SVptcHIy?=
 =?utf-8?B?eHkvZXZZRmE5dVVTQng2T1AzaURxSlg4c2F3d01mdktENDVHMjdMM1FuUUx5?=
 =?utf-8?B?L3p5L2ZmejdVTGJDNnJaWThYUk9SWlBvQWErMHJLVEkzdlIrRk9SQkNTL0FI?=
 =?utf-8?B?WDQzbWpSZXlWSW1CS2pvMmJuTm9GanV0NlREbEtCdUtMZEdkbTU1ZjZGOUEz?=
 =?utf-8?B?S01KOTFaOWtnbDB2eHVaNlhXYmV2RC8xdjkwcmpFVGRvSzh3MkxteTVrSmhG?=
 =?utf-8?B?K04rZm85MUthL2h2OTdzVW9WL25JUDFkSkRkWWlYMXdQSUlSQitDNnhqaFlV?=
 =?utf-8?B?VFRMMnBOamRDQ25MV01mb1prdC8vSXpma1Y5V0Z3MjJRS2I0NEtJYU4zOFVI?=
 =?utf-8?B?VWtHdE5xTWgvdVBTOEV5a1J0WEFhK1kwMTBDTVZJb3BJOENidE1RU016NWl1?=
 =?utf-8?B?MjJnbFFyTUpST2JmVVNWWHI0Sjc3eXBrVVhyclBSaWswdkFzcm52aVBSbzg2?=
 =?utf-8?B?OVkranZIZlVYSGEwZzVBSFIvNnREWVpiTC9VTzB2SVM2TWU3VFl5eFgraGhQ?=
 =?utf-8?B?WUw5T3MwNXdTQTNhYjBKdjBYVm9RUGl2VDBRTEJzSmI3QXBMaDNRakFuamlY?=
 =?utf-8?B?NFNDK2F5RGNQbzBVWlBpQm0yWDcrMS9FSlpwYkdOdW5odFBlaDJnR0EycmRm?=
 =?utf-8?B?ZitRZ09YZEl2NnkzR2lmRFFBazF5VkFkYU9mS0NNTFNTZTZJQy9vcytyZmxT?=
 =?utf-8?B?RVlqbzhmcTV4dEhmbVorTThwSE1pS0JUTWNacENuN2s0T21KSnNUTDdOSGpV?=
 =?utf-8?B?Y01wdWhzUnk4bk0rdVoyZlc4Q2xhcExsWnpLVXg3RzVWbHQ3TGdPdlA5ZTJX?=
 =?utf-8?B?TUo4b3hqNU0xeEVWVG90bEFhVFhub1VCMFVhNGprVnBYWUdrczJhSDR4U0Vm?=
 =?utf-8?B?ZFlRL3hOZThiWXljeVZQNW5EelE0TEJiWSsvVFFsbUtGZXVMRjhjWUQ5c2hV?=
 =?utf-8?B?UTlLbmxCL1RWOVZ5VmZEVk1mejBmOXVUTWw2MEt0NVlxSHFINjRWVlZDcGlM?=
 =?utf-8?B?Y011UkxVODhMamQ0bjZJRkZDYXlUcXJMQ1Avczd3cUJ6KzViM1VlMS9FaGdP?=
 =?utf-8?B?aWlFZXpmRUJaNFBhWEtNZ29zZGdHNXNWaEVZUWlBcDlHT1JiMStkbEF2ZTJw?=
 =?utf-8?B?SjZQeHRCM0pZM1pRRi9pTS9aS3VJT2Q5R3o5S1MveVpoV1A0SzFiU1FQd0Jr?=
 =?utf-8?B?d2tOMG05eE9CU2J6dzNsR2hRbTdMbHVjRlN4c08yN2tuUklRcUpSYTNwcGxE?=
 =?utf-8?B?VU9ZVG44QjdIemorNy81bXgyRlNaWjBkSk1kM2t0ZllYck1DRkV6Y1Fja0lD?=
 =?utf-8?B?SWFZMjJpNUJRNnhkU0NqWnk1ZEhPTnVJYWQyZWNQRGRrTlA0enZqQTVxMmJW?=
 =?utf-8?B?L2FPcWo3UUowdnIwQmpzTmNaNkhNbkpRUFBxOGNMK29ITEQ0bkluN0I0WDlx?=
 =?utf-8?B?MFVjdTRlejZnUzlWSW4rNjJwbVEwLzhJYWJYbkp4OVc2MlFmbUh5YmpCbzJL?=
 =?utf-8?B?TDJSTHAwak5nQ09Xc3JOOWtPUjFPOHEwcnZjTWR0bGdwdHlqNjB5MmFyM1lw?=
 =?utf-8?B?WTNaUzJYMWxVVnZrYmlMdUp1RCtsQUFzNzk4K2w3NGFZQWtCUzNJRDVteTN4?=
 =?utf-8?B?S1NZbGNvL2dtZzlhbnE5L3VseWpuOTlzNFhJdTdhSGxlRkdwTkt6QW0wMW8v?=
 =?utf-8?B?OUtrOHhXaVFsb3llaWhhMGMzZytkdXN5cEVZWjh6VzI4OVhaSGJiZWRyRXI1?=
 =?utf-8?B?QnE4L2tXWkxOd3lLM1NkZz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56de8708-69b5-45df-94b4-08d90a5ea4d6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2663.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:59:45.9754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sbvyZfkXQPzoLDxXxfvoQ53CQRl7D+v3izgCP9s4VP9qsGh99ajT3ovTK2NwrgojLohJAuqpAxc7SM6cZmaA+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4784
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9968
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 adultscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104280102
X-Proofpoint-GUID: wzFfdtfegwZzk85nav8z7-z1PsTZuMM3
X-Proofpoint-ORIG-GUID: wzFfdtfegwZzk85nav8z7-z1PsTZuMM3
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9968
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104280102
Received-SPF: pass client-ip=141.146.126.78;
 envelope-from=dongli.zhang@oracle.com; helo=aserp2120.oracle.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>, joe.jin@oracle.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 4/28/21 1:45 AM, Dr. David Alan Gilbert wrote:
> * Dongli Zhang (dongli.zhang@oracle.com) wrote:
>> Hi Jason,
>>
>> On 4/27/21 7:31 PM, Jason Wang wrote:
>>>
>>> 在 2021/4/27 下午4:53, Dr. David Alan Gilbert 写道:
>>>> * Dongli Zhang (dongli.zhang@oracle.com) wrote:
>>>>>
>>>>> On 4/22/21 11:01 PM, Jason Wang wrote:
>>>>>> 在 2021/4/23 下午12:47, Dongli Zhang 写道:
>>>>>>> This is inspired by the discussion with Jason on below patchset.
>>>>>>>
>>>>>>> https://urldefense.com/v3/__https://lists.gnu.org/archive/html/qemu-devel/2021-03/msg09020.html__;!!GqivPVa7Brio!KbGQZW5lq3JZ60k12NuWZ6Th1lT6AwmBTF0pBgoWUKKQ4-2UhdW57PtvXUN5XQnZ2NU$
>>>>>>>
>>>>>>>
>>>>>>> The new HMP command is introduced to dump the MSI-X table and PBA.
>>>>>>>
>>>>>>> Initially, I was going to add new option to "info pci". However, as the
>>>>>>> number of entries is not determined and the output of MSI-X table is much
>>>>>>> more similar to the output of hmp_info_tlb()/hmp_info_mem(), this patch
>>>>>>> adds interface for only HMP.
>>>>>>>
>>>>>>> The patch is tagged with RFC because I am looking for suggestions on:
>>>>>>>
>>>>>>> 1. Is it fine to add new "info msix <dev>" command?
>>>>>>
>>>>>> I wonder the reason for not simply reusing "info pci"?
>>>>> The "info pci" will show PCI data for all devices and it does not accept any
>>>>> argument to print for a specific device.
>>>>>
>>>>> In addition, the "info pci" relies on qmp_query_pci(), where this patch will not
>>>>> implement the interface for QMP considering the number of MSI-X entries is not
>>>>> determined.
>>>>>
>>>>> Suppose we have 10 NVMe (emulated by QEMU with default number of queues), we
>>>>> will have about 600+ lines of output.
>>>>  From an HMP perspective I'm happy, so:
>>>>
>>>> Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>>>>
>>>> but since I don't know much about MSI I'd like to see Jason's reply.
>>>
>>>
>>> I think we'd better have more information, e.g the device can optionally report
>>> how the MSI-X vector is used.
>>>
>>> Virtio-pci could be the first user for this.
>>
>> As discussed in another thread, you were talking about to print MSIMessage.
>>
>> However, I prefer to print the raw data as I think the user of this interface
>> should be able to understand it as MSI-X messages.
>>
>> For instance, below is the data printed by "info msix".
>>
>> 0xfee01004 0x00000000 0x00000022 0x00000000
>> 0xfee02004 0x00000000 0x00000023 0x00000000
>> 0xfee01004 0x00000000 0x00000023 0x00000000
>> 0xfee01004 0x00000000 0x00000021 0x00000000
>> 0xfee02004 0x00000000 0x00000022 0x00000000
>> 0x00000000 0x00000000 0x00000000 0x00000001
>> 0x00000000 0x00000000 0x00000000 0x00000001
>>
>> The 1st column is Message Lower Address.
>>
>> The 2nd column is Message Upper Address.
>>
>> The 3rd column is Message Data.
>>
>> The 4th column is Vector Control.
> 
> So why not add a heading:
> 
>   Msg L.Addr Msg U.Addr Msg Data   Vect Ctrl
>   0xfee01004 0x00000000 0x00000022 0x00000000
>   0xfee02004 0x00000000 0x00000023 0x00000000
>   0xfee01004 0x00000000 0x00000023 0x00000000
>   0xfee01004 0x00000000 0x00000021 0x00000000
>   0xfee02004 0x00000000 0x00000022 0x00000000
>   0x00000000 0x00000000 0x00000000 0x00000001
>   0x00000000 0x00000000 0x00000000 0x00000001
> 
> (if I'm understanding what you said).

Thank you very much! I will add that in the patch.

Dongli Zhang

> 
> Dave
> 
>> In my opinion, this is equivalent to MSIMessage.
>>
>> 26 struct MSIMessage {
>> 27     uint64_t address; --> column 1 and 2
>> 28     uint32_t data;    --> column 3
>> 29 };
>>
>>
>> We use the similar way to read from Linux OS, e,g., given the address of MSI-X
>> cap, here is how we read from OS side.
>>
>> # busybox devmem 0xc1001000 32
>> 0xFEE00000
>> # busybox devmem 0xc1001004 32
>> 0x00000000
>> # busybox devmem 0xc1001008 32
>> 0x00004049
>> # busybox devmem 0xc100100c 32
>> 0x00000000
>>
>> Thank you very much!
>>
>> Dongli Zhang
>>
>>>
>>>
>>>>
>>>> Adding an optional option to 'info pci' to limit to one device would be easy
>>>> though; that bit is probably easier than adding a new command.
>>>
>>>
>>> One interesting point is that MSI could be extended for other bus, (e.g MMIO).
>>> So "info msi" should be better I guess.
>>>
>>>
>>>> Figuring out the QMP representation of your entries might be harder -
>>>> and if this is strictly for debug, probably not worth it?
>>>
>>>
>>> I think so.
>>>
>>> Thanks
>>>
>>>
>>>>
>>>> Dave
>>>>
>>>>
>>>>> Dongli Zhang
>>>>>
>>>>>>
>>>>>>> 2. Is there any issue with output format?
>>>>>>
>>>>>> If it's not for QMP, I guess it's not a part of ABI so it should be fine.
>>>>>>
>>>>>>
>>>>>>> 3. Is it fine to add only for HMP, but not QMP?
>>>>>>
>>>>>> I think so.
>>>>>>
>>>>>> Thanks
>>>>>>
>>>>>>
>>>>>>> Thank you very much!
>>>>>>>
>>>>>>> Dongli Zhang
>>>>>>>
>>>>>>>
>>>>>>>
>>>
>>

