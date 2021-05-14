Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CC3380D93
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:49:19 +0200 (CEST)
Received: from localhost ([::1]:51162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lha3y-0002cB-5h
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:49:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lhZWn-0007g2-5E
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:15:01 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:21700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lhZWh-0007To-Nd
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:15:00 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14EFB3mN027579; Fri, 14 May 2021 15:14:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : subject : to :
 cc : references : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=H8yAbF+2Dikv468pzSwylOW4SL3VBt2h1FEdQUjnp3w=;
 b=thhnb6MVm9Zco25V3GT/H42r3T7PS0ZsrSUsKJ2YPvkbv4E+WCnEaFs2+LnEEL56jHXk
 kR8BDQ02TjVenZyr75baaZtel3bD10XeUkeemQzinkErjWqHF9V7TcvBK8bdHUdg08Dv
 lQ4A5FD8CG6E8fb9jeHfBgii911qZi01OU81AuvBjsCPO8b2OfJP4kSDYkMc47RyWiyT
 QLU1R7NCGhg/JBk1Rmh1jErflLmPCo2tw1X0jscw0n57BSWM3E24stC/U/cxFUAkORbb
 ttAWLhZO0jSQUEcOFqw5cjU9875JWdesQowQIsjlFX/uBW3xLiF6aCgzMefSE7HMvTXk dg== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 38gpqmgqjb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 15:14:51 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14EFEo0F014143;
 Fri, 14 May 2021 15:14:50 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by aserp3030.oracle.com with ESMTP id 38gppq6v0t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 May 2021 15:14:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hk/5BxWdqlHjK0y1qfrWJ2p+/0TiepTVFkdUTMOwKDdsxmI1dqipGM+poiB9stGnOcLqdVdSPEIuZuXi3t1we/MteLL7Anxcu3yOoEgzJe0pEQ3dolcpM9tyFssD9AlMPKu9KWdwh1X21CVFsKS4XmCXaNgyaq8c63quCAod2/viRlVm56jVh5jWkzsxbkoee65pnB4w4Bo40d6Qxt9rhh79lBmk4QgAasWjF4vJ/fb3RvLJA9O4NvIZsVTGea5eLwT83c1kl0KjU0UGpOJ2Xaoj9Lp6xWnRwfhVWApRKzp8ozM+WaK31SkdgETp9TfvKzVUgsZgAnLvWEQpCGtyXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8yAbF+2Dikv468pzSwylOW4SL3VBt2h1FEdQUjnp3w=;
 b=AyEJYlmKwwJDdPMzw+E4e9y5AxnmUoTwCErX+cEu26aAKR/YxMSWwnWLVaaiE1k4pHYh1sIsicqXak1VixgAOQ7tSGx9fZEvke09w/X+NWuKKuuSOFJHFqRzwi/lsaar0wzT7dlRiFA36hS7ApbrFd7Y83s3GZf9RuaspCruZU3uvQvYDpE04J51FfAuYOA9SyFwLJ/u6rM4kBuZaTUmuHvRB02eFEIoP5wc4M3KkAJP0eO3ufRWmppUF4r9U4CCQMWVkBF6ZCD8X3Z/ZvpcIgbe3sBWoplfBd19e3rgBVGxbacx82XbGOl8tYYzOs3gNaWzbXRJ3lFur9AwBLOeGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8yAbF+2Dikv468pzSwylOW4SL3VBt2h1FEdQUjnp3w=;
 b=RNtR6+gWkJ7f2oz1atGgQsGxfMqF096DscMmRzmrw0TSJ4t+7S4ELL5EHzz1rqsUBO0/SgrIzWr6GGiq/WgAVESLEtNHkZKvwnU7mURwiKEL/pNnTg4ZsR5D5pVywI7LacqPJxAqFeYqS0qylWRPlfrPrD69gFCUh2Tlk29zb2I=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB3240.namprd10.prod.outlook.com (2603:10b6:a03:155::17)
 by SJ0PR10MB4461.namprd10.prod.outlook.com (2603:10b6:a03:2d8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 14 May
 2021 15:14:48 +0000
Received: from BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851]) by BYAPR10MB3240.namprd10.prod.outlook.com
 ([fe80::6ce3:f0a3:c303:f851%7]) with mapi id 15.20.4129.028; Fri, 14 May 2021
 15:14:48 +0000
From: Steven Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V3 07/22] cpr
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
 <1620390320-301716-8-git-send-email-steven.sistare@oracle.com>
 <YJv/9uOKbYmhAyQp@stefanha-x1.localdomain>
 <008ac3a4-a187-3e9f-d82d-8279e82805b1@oracle.com>
 <YJ5e4yFxMPO31viJ@stefanha-x1.localdomain>
Organization: Oracle Corporation
Message-ID: <881e5c07-8582-478c-9c13-47b1967cd3da@oracle.com>
Date: Fri, 14 May 2021 11:14:44 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
In-Reply-To: <YJ5e4yFxMPO31viJ@stefanha-x1.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [24.62.106.7]
X-ClientProxiedBy: SN6PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:805:de::34) To BYAPR10MB3240.namprd10.prod.outlook.com
 (2603:10b6:a03:155::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.92] (24.62.106.7) by
 SN6PR05CA0021.namprd05.prod.outlook.com (2603:10b6:805:de::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.11 via Frontend Transport; Fri, 14 May 2021 15:14:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0763ea00-c3a8-45c5-586b-08d916eb03a9
X-MS-TrafficTypeDiagnostic: SJ0PR10MB4461:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR10MB44616400E967F7B871711E1BF9509@SJ0PR10MB4461.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PMRIdWpMT0Z6/25RAYmzzPQmM9lubbUhC4rCdiKytKBUGj4SI/a3AX9vcIMa00y7meKd2PdvqrZ2zIZJ17v50uTHITcge0iSLv7Vjyt26GUA7/c8EW1KVYnZ1sh6h14y1US9cMJA8eAsJsLc+2fLDOz6jtL1UhQT1ubMWD2wGUNwIwBowAeR7quhVpz5BM5Kw7PVhEcdyweznJMLWaIwB/XAPuH7ITBf7xE4BY6kG9bnUMMBXK57LJxpxaXFYxIGJNQdYs8Jk9ydjObN22jvJHO14to63Ey+f67OxgErcUWzlr2bfBw/T/+xtX5MR3bXXpydUi4rMk6w8XCGVCimbDeJ3G8G2MzbrRFokHa0jTMHvLVMiIuGJRx65jWd5Kk/Y2VdL9r/Pdq4Y23XealB8ZgDLCduPzNDmrfLEPa3sSyolY3/VyhJ9fPbeKW+yUGDRKw+9fZ+Ggd6BauCLnZZNagn8cwm6ocoafxcNltUh4ql4xXIr2Xso1C72ZPDqN+n2SpWJbYUGhVfnfXiFg/4zh97mrlcUpG39tNa19cbjtUVfPOvFs+pb95bjaMQNk0fN1br9182emnCjeFxtADriwMety3ovhqR/dwS8RXZinFHxyMmpUVOHjXGeO+onBkCVMNy+jpY5FnGMPlFELsducHsasLu9QJ/Z7CwbYjfAfj8gmstA8oRffjds5YodAvb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB3240.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(44832011)(6916009)(6486002)(36756003)(7416002)(5660300002)(83380400001)(186003)(54906003)(4326008)(8936002)(86362001)(31686004)(66556008)(66946007)(2616005)(956004)(498600001)(38100700002)(107886003)(16526019)(66476007)(8676002)(36916002)(26005)(53546011)(2906002)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?Windows-1252?Q?lrfNFESF4fKgyES9C1oXcE4SWJqtz1f+kT72PmB1eM59yCQwOKR5Bcxo?=
 =?Windows-1252?Q?o1mkA+uJI/verUIoGLJEAPy92kAohStSdqtyHoehdD301JROPuq6TfNW?=
 =?Windows-1252?Q?bCVaguHr4XOdkbqaOWMddYDtebIKbDvtiD5vvjtQf4lSfogKLqVjS44L?=
 =?Windows-1252?Q?4xg25nI3wdCH5mUvaGuUIr1rMG1U3N4ezlpTOBFnMlhaRDKblpKEkrQ7?=
 =?Windows-1252?Q?J4v8h9PsPPtUCtDZn2k91dE5qW4pbVg6nykpl1W4RQVhAwaHSBwIYbpH?=
 =?Windows-1252?Q?f+GYE092VzBcNdXQvkyKQT1GmwD2q/RLnbXSavc+33n5lK3XV1By68Ug?=
 =?Windows-1252?Q?vsV2CHSYFFDer4TWQGIoYg+Dk3FpopaZGWlaTC1jcdfU54Vd4GyCMuFo?=
 =?Windows-1252?Q?rxA2zh6FcKdyBU2GCwIwgeS+l4Fd6nb3jg/9f+BeCkQO4XitsATFEsfU?=
 =?Windows-1252?Q?wck13QKuX/VbChUkbcoJKn4Ii6xVipwXkqOG8Y0ZbMOT3oGQ0M1BXOpF?=
 =?Windows-1252?Q?8VznEFf20wDWS2DlFLHlNdBaQZHUgCHQfrhPGDIhMU+7ph0FkqA79aCH?=
 =?Windows-1252?Q?534NJiild0kN8jzIG47TGmQ98GOrf8csGahootN53b2LdJqja/DZ5trt?=
 =?Windows-1252?Q?sMYTZ1iK/h15jQkV2oErgSEYt/5l6HtErEyw10NjY/l0LY/ozaGPDYSO?=
 =?Windows-1252?Q?crw0IhSplB48dI7LyRSx2/XYyXcujticW3ySZXOCwZYzfWXqf/L2qIGm?=
 =?Windows-1252?Q?YtBmoRDY5botXUaSO6M0UBFp1uIOg1+Nte7UWFZSOx23WeskERqe63pp?=
 =?Windows-1252?Q?nK/PS8zs7s8HnSLWuUDNGSMflTuqN0FxCl3HH2ugtPQinKTK+EDEE0bF?=
 =?Windows-1252?Q?1RWH8AF2F90MzZfu9XuRVGa+SakkFg8bcJsFgQYZ+qRFyXmG84/GkpPZ?=
 =?Windows-1252?Q?jSvwjFkt9ZPMiCmCmCiMB1j2J3ua4ruW5OAIDQZPkvBvbeQePUI2C+EY?=
 =?Windows-1252?Q?H+XKYcJuIoT9VIZAzjuGWALEkFjZM4JeccGN+2x3BJX+Gbd/s5iCrjEa?=
 =?Windows-1252?Q?yGIYNJK1/UbKgpbfduytps6qL0iH99Wf5Q5Bs1S99jMlLAopYOa0/QIM?=
 =?Windows-1252?Q?aWXOGwDQ+fDllAWPkOmFW+pEt5/cA0WgzH4TmfX202OS1Mbl3U+XJVtt?=
 =?Windows-1252?Q?+D9AvU/tta0avaV9fLFNB6hwVWY8/BwVA0rae5LF8u+NgnchvH/Il8Zh?=
 =?Windows-1252?Q?Y/ltH0xnRWvRRBeY2h+M8wAB0aWVNHfMxR72Yjtt7Fej4TMITqTjlDUq?=
 =?Windows-1252?Q?1TxgC3SV9QQAJmM+Lqg9B2dWbFAkFV97AZlwXcKWsTWYVC1945dijZNm?=
 =?Windows-1252?Q?9CFYstmBu9m5nDFKiE3vAfdXEKxnFaeWbM5KnlPQtjc+hj8BmjXvASTB?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0763ea00-c3a8-45c5-586b-08d916eb03a9
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB3240.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 15:14:48.6669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rOuamdoYiQrONuFbDSEf43IoDdeFWFVmB07EG2eqhQRbhWWT8sdy2kGVwy3LziR84fUFj2UctPrPGah0X/LlnaIERIa8XqiHXOnyGvX1EgE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4461
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9984
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105140122
X-Proofpoint-GUID: VzQI6JRt06HH9hdbop0SQ1hPhtJqkD_E
X-Proofpoint-ORIG-GUID: VzQI6JRt06HH9hdbop0SQ1hPhtJqkD_E
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/14/2021 7:28 AM, Stefan Hajnoczi wrote:
> On Thu, May 13, 2021 at 04:21:02PM -0400, Steven Sistare wrote:
>> On 5/12/2021 12:19 PM, Stefan Hajnoczi wrote:
>>> On Fri, May 07, 2021 at 05:25:05AM -0700, Steve Sistare wrote:
>>>> To use the restart mode, qemu must be started with the memfd-alloc machine
>>>> option.  The memfd's are saved to the environment and kept open across exec,
>>>> after which they are found from the environment and re-mmap'd.  Hence guest
>>>> ram is preserved in place, albeit with new virtual addresses in the qemu
>>>> process.  The caller resumes the guest by calling cprload, which loads
>>>> state from the file.  If the VM was running at cprsave time, then VM
>>>> execution resumes.  cprsave supports any type of guest image and block
>>>> device, but the caller must not modify guest block devices between cprsave
>>>> and cprload.
>>>
>>> Does QEMU's existing -object memory-backend-file on tmpfs or hugetlbfs
>>> achieve the same thing?
>>
>> Not quite.  Various secondary anonymous memory objects are allocated via ram_block_add
>> and must be preserved, such as these on x86_64.  
>>   vga.vram
>>   pc.ram
>>   pc.bios
>>   pc.rom
>>   vga.rom
>>   rom@etc/acpi/tables
>>   rom@etc/table-loader
>>   rom@etc/acpi/rsdp
>>
>> Even the read-only areas must be preserved rather than recreated from files in the updated
>> qemu, as their contents may have changed.
> 
> Migration knows how to save/load these RAM blocks. Only pc.ram is
> significant in size so I'm not sure it's worth special-casing the
> others?

Some of these are mapped for vfio dma as a consequence of the normal memory region callback to
consumers code.  We get conflict errors vs those existing vfio mappings if they are recreated 
and remapped in the new process.  The memfd option is a simple and robust solution to that issue.

- Steve

