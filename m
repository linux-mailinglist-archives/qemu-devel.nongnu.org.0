Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A502F421925
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 23:20:22 +0200 (CEST)
Received: from localhost ([::1]:36760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXVNl-0000CK-LW
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 17:20:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mXVHx-0001Pw-Pq
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:14:21 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:9732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1mXVHv-00065s-Si
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 17:14:21 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194Kehuu023925; 
 Mon, 4 Oct 2021 21:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2021-07-09;
 bh=yaRqvTTP8oIKvAG3fRrcMcA18KDMEQGgd2BqwkdvrgQ=;
 b=gjGsEqCx2O09QC5I8q+VtHRZ1Hps7XiOYGBg+bILtQ1PFfFPQY476QVydU8AjkyoovxG
 Y4VVkX03aU/pW6ZJRkE9lsKumN7z6IKhF4Do2tTDJQDikFwpcHqdMql+cE/WtG4C2DUc
 t5deBZzC29+P31Veizf/k9ybJjwBg6hW5MRAZVVmNDva+oH+WC/KpzKMufNvqUQW4v/d
 l04sBOBv7TzqrZRQe+K962Hz+2oV5mtu+kjKMv/8ngzUjCCxGVJRVTJv8LpPQ/f0nD7s
 HaBs/Pbv82D6MniwIbubkOWdT0cLhDGxu1x/iOGbCHw67tIqj2HC+nMgZDv26l8YWzxU Wg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bg43gjgmf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 21:14:17 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 194L6GSY128406;
 Mon, 4 Oct 2021 21:14:16 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2103.outbound.protection.outlook.com [104.47.55.103])
 by aserp3020.oracle.com with ESMTP id 3bev8vrmru-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 21:14:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HgWOvH8nRjA9oaY/NPK1dd1ZRjkvt2Bkz8ISo9o2CNCZ0uTSxIRXh7fB5u63Ax2D1+ZfX1ZhQMKhG5jKof9PFz9qrhF7b/BZEb/AKItG5FZRZL+Xzcub/RNcf87kUWq7rPknSQrJ9Ihxslx0iWYMUpQ6wMfdBgeHgZPnoMZJOQSN0WPbiWKYrLee9CSnLxh/furIzVTC3EJCYF3ms2zsUmEerbjbOaLeQBDclXt99fzigSe5Mq2YHsLvl4zgbmqTXxYnQP4PSqeD4q85l0uNJPXZgPb7v8RXrx8MmCf1IYkyQzIsDakteFs2bGo2+50KPxE6I87IHvKk0A9d4XtxFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yaRqvTTP8oIKvAG3fRrcMcA18KDMEQGgd2BqwkdvrgQ=;
 b=bVxEDMt38Ngxs6bW9ZFaxPfyU3NvHK/Nefkm6Q/SaK4ls1+izBH7766J5qU7XVWmV+NTjft/0CXKWZ/wfY8BQTLvabvq4WK5QPdgJmS17G/dny9dqoPqovaGy/kfsVDO06PldqP60OlpdNZg53Gmu2flqgXnCwMz7JU88R8vfR/3PNKXN52ecgti/AqppwnujZbE6C4Ooiq7FriMC5AF4Hn4sDpZORXqJlmo+zRyw94sOa8Sc5hzOxAG1A027L41Cg/Z13QAMV2/9xiPoEPlciXLNEKIJcPBuk+zGTeFl46Trr71qcv6LNOIR5XFwo8kUgkZDWK37SRkAlxqGpfuOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yaRqvTTP8oIKvAG3fRrcMcA18KDMEQGgd2BqwkdvrgQ=;
 b=0TRwfwW9ndXP3oT8No461ZN/LMzIEG9XB2xQVkw25mv7IztnvAcQNFG87clBKALdt1uIs+j9O+DUgDXAEtX+42wW70WwcxHOjyrGVs006NmOJGvD2U4VrBYZneu2dW9w0O40/k69x8DcFOVwjs4/F6UrUhTpAxS61j95m32ivxE=
Authentication-Results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO1PR10MB4401.namprd10.prod.outlook.com (2603:10b6:303:6d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Mon, 4 Oct
 2021 21:14:14 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::90ef:e061:a4c2:acd6%7]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 21:14:14 +0000
Subject: Re: [PATCH v6 10/10] ACPI ERST: step 6 of bios-tables-test
To: Igor Mammedov <imammedo@redhat.com>
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
 <1628202639-16361-11-git-send-email-eric.devolder@oracle.com>
 <20210921132409.596f6a03@redhat.com>
From: Eric DeVolder <eric.devolder@oracle.com>
Message-ID: <ce5aa920-2a5a-f709-e4cd-a63603ce68ca@oracle.com>
Date: Mon, 4 Oct 2021 16:14:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210921132409.596f6a03@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0100.namprd04.prod.outlook.com
 (2603:10b6:806:122::15) To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
Received: from [IPv6:2606:b400:414:8061:221:28ff:fea5:27c8]
 (2606:b400:8024:1010::112a) by SN7PR04CA0100.namprd04.prod.outlook.com
 (2603:10b6:806:122::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Mon, 4 Oct 2021 21:14:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 794a827e-f8c5-4e32-eb6f-08d9877beb0a
X-MS-TrafficTypeDiagnostic: CO1PR10MB4401:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4401DF146A5EF62309928C2797AE9@CO1PR10MB4401.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:82;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FRLXa4g0y1j3ds/P3BtKAiUvFur58iB2NEmZAJQJWmKSPZjJfHRbhDH7b8edQKyG+2NczMS1IiL6KB+GLq06x1KZeVXTAySbFq4pBEmdLmMNrLNECQLqkdVX+oej2byF86wABYQg3qgRlKn6IkvCl/YwIKfJLeZTv9ou08IxBOXvf01mvcArcDtp4aJS0l8AT2jxB0x3DcyQZ4gITrLOgG80edXJ1YrMCaXuibkxKal/Q7az6MU4P3DqoXNtKnP8xaIeJlpNTw/4hbppaEI3pQEDeU6JcKi5Wa1tjx4Dm/YwGLmN5r1PyZXQsfGdnxvYpPYdfL2t0qwkmxgGzI2ZvPFtfesMfcPBFP3XRclZJkQJt04bmZw68m4nwtRu+5yLxqZJWhBsBpvEOgEDsDAJov011+W/7tHr9LDnyfHGK8OH7YYLegZ8Oy5Z831N0Rs6shbVlHge+nOnxpsauNinqVYJR0RmIswRwc8CFVGQVQb0VXmUgK4h4ZziYFBFqskMAbVkmBEvWHkcWsIgt77dFt6UOP1x4yaL57Yp5/dhJYrRpmM/btoHXDq/D1l+MHnlKs6NM5Z2JpGAYD9GG0fHFvJaNBLORgL9LUKribde/htqPX4fbFIYKX47g3P3M7WwOwk8JNLbwZ87PSThxfRH371GNVZnIUfSijKjA7aBPtIJ+6wyUR/u+yKmQ18dehpvLX+wqWrjgJuqDqvXM4Gq9LLMtGVBHl5vW0y97qQj9cg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(53546011)(36756003)(4326008)(6916009)(6486002)(316002)(31686004)(38100700002)(86362001)(66946007)(8676002)(107886003)(186003)(66556008)(66476007)(508600001)(5660300002)(8936002)(83380400001)(2906002)(2616005)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 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
 =?utf-8?B?emlPekZJcDFuK2U0N2lWdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 794a827e-f8c5-4e32-eb6f-08d9877beb0a
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 21:14:14.5297 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GW3GExNOm0A6SL7Wm9TLNlPuCXqV9R4SSB7P7GHROugSbMSX7Oxuk2qUMrS+/8T9ZyUzUZfAsX1eGhezqnlNaDtgtiHwMYUsQfs4gI+1J/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4401
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10127
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110040141
X-Proofpoint-GUID: PxuZJD1k_Jsv8YI1sFQH186nw8IlVW_A
X-Proofpoint-ORIG-GUID: PxuZJD1k_Jsv8YI1sFQH186nw8IlVW_A
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 9/21/21 6:24 AM, Igor Mammedov wrote:
> On Thu,  5 Aug 2021 18:30:39 -0400
> Eric DeVolder <eric.devolder@oracle.com> wrote:
> 
>> Following the guidelines in tests/qtest/bios-tables-test.c, this
>> is step 6, the re-generated ACPI tables binary blobs.
> 
> 
> commit message should include ASL diff for new/changed content
> 
> for example see commit:
> 1aaef7d8092803 acpi: unit-test: Update WAET ACPI Table expected binaries

done

> 
>>
>> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
>> ---
>>   tests/data/acpi/microvm/ERST.pcie           | Bin 0 -> 912 bytes
>>   tests/data/acpi/pc/DSDT                     | Bin 6002 -> 6009 bytes
>>   tests/data/acpi/pc/ERST                     | Bin 0 -> 912 bytes
>>   tests/data/acpi/q35/DSDT                    | Bin 8289 -> 8306 bytes
>>   tests/data/acpi/q35/ERST                    | Bin 0 -> 912 bytes
>>   tests/qtest/bios-tables-test-allowed-diff.h |   6 ------
>>   6 files changed, 6 deletions(-)
>>   create mode 100644 tests/data/acpi/microvm/ERST.pcie
>>
>> diff --git a/tests/data/acpi/microvm/ERST.pcie b/tests/data/acpi/microvm/ERST.pcie
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..d9a2b3211ab5893a50751ad52be3782579e367f2
>> GIT binary patch
>> literal 912
>> zcmaKpO%8%E5QPUQ|KVrvh9h_c12J)@5f?5!k_Ygv*jGA8UW7?#`}+D#XXyDpKHiZ?
>> z@anI_W$gOrZRl(SB7!yMqx}#E4EC&a5=}m^g_!0^0`kEl)DOuIXM6D@@*xq*8vyqH
>> z)b0KTlmlgmH~xt7vG<k#Z1~z=OnyT76ZX;Ysy^;NC0^^$`kY?zKK;^vMtny1JAD$P
>> zc^BR{l;i*H`IJAW`~~?1`_TXD_wQ2@UlL!DU$GCpQ-4i-O}x_^JdQTRH^e)=(_c$`
>> LOT5z?_v4Aa+v(5&
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/pc/DSDT b/tests/data/acpi/pc/DSDT
>> index cc1223773e9c459a8d2f20666c051a74338d40b7..bff625a25602fa954b5b395fea53e3c7dfaca485 100644
>> GIT binary patch
>> delta 85
>> zcmeyQ_fwC{CD<jTQk;Q-F=QiG057Ni!kGAAr+5MP$;rGe;+`zQh8FQ0@s2J*JPZuX
>> l3>=QZp?+M<lN)&@ggD~CY!RV&S1$v`0B2XP&5C@1oB+Xc6m$Rp
>>
>> delta 65
>> zcmeyV_eqb-CD<jTNSuLzao$F*0A5ayg)#BLPVoW`laqN{#GF`y4K3n1;)6r|xR^QO
>> V9bJNW7#Nr*U*I#`Y|7`t2>@&@5ljF8
>>
>> diff --git a/tests/data/acpi/pc/ERST b/tests/data/acpi/pc/ERST
>> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..f24fadd345c798ee5c17cdb66e0e1703bd1b2f26 100644
>> GIT binary patch
>> literal 912
>> zcmaKpOAdlC6h#XZC=fn#CoF*_7>J28jW}>wF2KFG3zs9lTPTnl;U#=7r>E_sr(1u2
>> z21<FK_R^jEx_w-`TFO&O;T_LLF4O@x8LMi!H}5Z^t6_Tah{H!Y?i2S%JoA7!BFgz1
>> zf~;?N{b8^}H2K=viyuzh`L7M``U{CiG=Ib#4X^gc{m10T<lDURCp`CW$T#HMd{o-?
>> zH~aE`PznCu9;f*enm;9;GDrTme_0zSBR|7ODR;g(@qEM!N8Z_gL4HBL%^N<3mgJY@
>> R+q~0XMSexT%^U0Ee0~)`g#iEn
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
>> index 842533f53e6db40935c3cdecd1d182edba6c17d4..950c286b4c751f3c116a11d8892779942375e16b 100644
>> GIT binary patch
>> delta 59
>> zcmaFp@X3M8CD<jTNP&TYv2`OCrvjHhYfOBwQ@nsX>ttC4TZ!l<{$N9cc#e2SmmnSn
>> O1||j(wg6|p5C#C(xDBxY
>>
>> delta 42
>> xcmez5@X&$FCD<h-QGtPh@##h`P6aMMmYDcpr+5K3mdUaTw(KHo0nUCQ3;+kH3ZMW0
>>
>> diff --git a/tests/data/acpi/q35/ERST b/tests/data/acpi/q35/ERST
>> index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..f24fadd345c798ee5c17cdb66e0e1703bd1b2f26 100644
>> GIT binary patch
>> literal 912
>> zcmaKpOAdlC6h#XZC=fn#CoF*_7>J28jW}>wF2KFG3zs9lTPTnl;U#=7r>E_sr(1u2
>> z21<FK_R^jEx_w-`TFO&O;T_LLF4O@x8LMi!H}5Z^t6_Tah{H!Y?i2S%JoA7!BFgz1
>> zf~;?N{b8^}H2K=viyuzh`L7M``U{CiG=Ib#4X^gc{m10T<lDURCp`CW$T#HMd{o-?
>> zH~aE`PznCu9;f*enm;9;GDrTme_0zSBR|7ODR;g(@qEM!N8Z_gL4HBL%^N<3mgJY@
>> R+q~0XMSexT%^U0Ee0~)`g#iEn
>>
>> literal 0
>> HcmV?d00001
>>
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>> index b3aaf76..dfb8523 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> @@ -1,7 +1 @@
>>   /* List of comma-separated changed AML files to ignore */
>> -"tests/data/acpi/pc/ERST",
>> -"tests/data/acpi/q35/ERST",
>> -"tests/data/acpi/microvm/ERST",
>> -"tests/data/acpi/pc/DSDT",
>> -"tests/data/acpi/q35/DSDT",
>> -"tests/data/acpi/microvm/DSDT",
> 

