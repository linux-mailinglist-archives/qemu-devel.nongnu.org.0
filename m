Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9EC3B890D
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 21:13:52 +0200 (CEST)
Received: from localhost ([::1]:53986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyfeh-0007Ga-TF
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 15:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZ5-0006ts-CB
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:03 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:63704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.devolder@oracle.com>)
 id 1lyfZ1-0005jF-C7
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 15:08:03 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15UJ6VCh005974; Wed, 30 Jun 2021 19:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2020-01-29; bh=yBmbVI2p7ElbjnGj+R4nPmA1wlUWOxOU5VeOCnOIunA=;
 b=w/ODcnW69mSdz+COjMZbEd9Wn4sm2sUl5sneFLVOyKEPI6vh/KugD0S1Ds+CATfmymx9
 032sLSie56kyAu34LuDcak/B7g/0S3BfF/F+C8s+5RyqG5mJ4eWPR8wWsUfHSO1pgKt4
 PLXN9jVb57Nl10tFx49D6UkzP69FW4ldxr13+Uao0NhN2nD812obL+GngvUI9rKXMw1u
 keHDfOIycmhQ1ERzJx0lgg+8hxYjbuViJBJY69HA1oEzjEjRygGwT8KspzlI3Jug823R
 wzeP0bmUkFLLDsi0uOtAyw38qeJ72qO62v1iput4e+p4gBw8rgIo4cjcuE96lXU6hpIu EQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 39gb2t26wt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:07:54 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15UIxv95089833;
 Wed, 30 Jun 2021 19:07:53 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam08lp2045.outbound.protection.outlook.com [104.47.73.45])
 by aserp3020.oracle.com with ESMTP id 39dv28kyaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Jun 2021 19:07:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcFsS8f1uZ4S33ynyltlnzMLLoCljKu1JIgNv/jxXVHydqG12aLsNhY1hWDu5BRiV8TbFbKqFouSVWhNq2z4PY4poCy6v3w0htyUQiWpxXBR4ViCzjF+oM7R5PvMGQ6+sSmVYcqDim+EeFZCimEu/2z5vAPabDyx/UVVzrWjmOnLshwPBapRROydgMMJQBBS5UhzeT2LuEwceuPsz6UWig1xZG6CsIDQnyGoZCE16MDVNFyxYn+alO7f2oFdOX0374YMECiFsasH9E1VpqycY/MO594LQqbpBXoY65tjU/Zfljxj8qAQCkHm22hhOFviEC0o2wa1ZWd7YuAWrn0+aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBmbVI2p7ElbjnGj+R4nPmA1wlUWOxOU5VeOCnOIunA=;
 b=SoIbANrKG1TgdkwwZupVvsTNz2txllHC5HPT3Am8tutS5J1Fr0/rMWbEQxStC6+P/ohl5dGLNlZ69PuAHyREPIvj/cAHKLxLfNUSUr9mSx+IZxmghxWDgDu9jNpoMAy5Cpxvz0JUN+O7UDMGq/jzlMcSfpx1gz46TgPiH29QfWsl+SkmEsPlFII9ZM1F3VOx5A+i/7xnGlkFzMQmPczPrlro4Ln0sLlRjuNS3WzDC+kZ3vspCnjXQQQ61xo3G8riagNNJTjtXMi9wkz68DMYdBMHF86G94ykwOSVCudMp654G7ceqiygFMNfEt6tQnqyN9j7hYUrEHkv7bFeYRBjow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yBmbVI2p7ElbjnGj+R4nPmA1wlUWOxOU5VeOCnOIunA=;
 b=jxPh85IBGmBu0mPbrkIRbcCgh/a/MI63qtCx9GX4Jg/UPBW6uEn07HMP+d7TtE8Pw3EoGO5YnqDnthhcxTSiusNM9IzkJZzPXwjne0hftcA8aH+rFltM21/D+qqDakyj4B6RtNzGyY5Gz5peKRH3qFcBlVasrmx1kzSjFILioF0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=oracle.com;
Received: from CO1PR10MB4531.namprd10.prod.outlook.com (2603:10b6:303:6c::22)
 by CO6PR10MB5441.namprd10.prod.outlook.com (2603:10b6:5:35a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Wed, 30 Jun
 2021 19:07:51 +0000
Received: from CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc]) by CO1PR10MB4531.namprd10.prod.outlook.com
 ([fe80::a0af:e69c:6e81:b8fc%7]) with mapi id 15.20.4287.023; Wed, 30 Jun 2021
 19:07:51 +0000
From: Eric DeVolder <eric.devolder@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 00/10] acpi: Error Record Serialization Table, ERST,
 support for QEMU
Date: Wed, 30 Jun 2021 15:07:11 -0400
Message-Id: <1625080041-29010-1-git-send-email-eric.devolder@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-Originating-IP: [138.3.201.23]
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To CO1PR10MB4531.namprd10.prod.outlook.com
 (2603:10b6:303:6c::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ban25x6uut23.us.oracle.com (138.3.201.23) by
 BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.23 via Frontend Transport; Wed, 30 Jun 2021 19:07:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8e66e953-dc52-4c87-7f77-08d93bfa5b3f
X-MS-TrafficTypeDiagnostic: CO6PR10MB5441:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB54418578A2614BB33E77284797019@CO6PR10MB5441.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6OU51VaaCgmBUuwVUcFaOTzmkrooWfSO1CEISLKEklPyNy1azu4Hf2bNz/E1n88vqRA4BwdkqmZrC1dotXcFlHRQS1hm2tZmpexU+Iebh8MRWocjc7RFdOdaWop72Co3zKODDlTBsCTfVY3h1x3dkjJt4dZTZXM55Ggm1aKe3ATBGMh7SH+3D3UzpQTB7NmiYPzq6WwZPWxBfQxF2hVC329t7zezhBw/j9two1rkdXC3qmFAOiJG+aMh9eA/TIW03ILm+nUQRfZ2TgpHioXm5IqKURMjwqpWrXJ8kJnRl5FkSXNAotfJhSh+l2a6LLTu5uUFMiqeSEK8fiPnxPreyE9KyGObshgDmaeY0DzS00l9n2tkN3MM8HaJUvFlpPR2QOkMEkvCeCIiPlqYRz0bBX6156UXCx/z+rNqL5BXm8miLf5NZZzfeeixnJHXgHWhW5EV6ucN4D/rK3l0OtoLJAup2iq20YkNmzmzVMLFa4YM8NdcR6ne1vO8jGgUZKVTN1IaKgMf45tD7cIamjBlFQO9FKkVntPyTK+OdLbDAyHNLBdSvrKxN9xmy4irNnxbHKTjvZ0hghOKntL9x8qCJXj1BplcnvlXwQPrcr0brYZ3QYf1GIs8e2ctZu/2USv8xZFPO7Kr98Om3YWIVIwV1qCPeuHgfhJrSgEV11aW6FqE9rqTA1OFZD+HqJUemNY++YBKnpsWyFFhDrlojYssEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR10MB4531.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(39860400002)(376002)(396003)(136003)(8936002)(107886003)(38350700002)(38100700002)(26005)(36756003)(186003)(8676002)(5660300002)(2616005)(956004)(16526019)(4326008)(86362001)(66946007)(7696005)(52116002)(316002)(66556008)(6666004)(66476007)(83380400001)(6916009)(478600001)(2906002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M2la1N7ZfAtjzhWdQhtAlvFAMh1yEmMnbQGHTgTxl3xdQQDU10hquTykoRM2?=
 =?us-ascii?Q?t92AcSugVgDeEtZOQ095JFxV5uO5tYKakquHAFOF+2Z0UcaO8ktusoekvRZn?=
 =?us-ascii?Q?RuY1gdJjcAmqMXF8uRBpTyfa06ioTjpCfat1EhkJNH3aUz8sA3GPKMJBaONz?=
 =?us-ascii?Q?UA3sp0cCPLtishJ6aJSN3nqXEh6hSH71wiQ17ncG9GY554CWcH7kt+xlLfsZ?=
 =?us-ascii?Q?QK8hK6DOcBoWw2L4CeqS/rQJMYkyDGbdLs/vveY43X/OtTl6nn+t0YGLx2jo?=
 =?us-ascii?Q?kN+FHjq09RaleNFNQzriCDcFZ8XoEkKfYx29a25nRzYMir6ELMegsoEhORvV?=
 =?us-ascii?Q?oK9fAJkteyxOZCTfV1FTtHwirEVZSy4eA6oVT42lobwksOPq//2dEgOXWv/d?=
 =?us-ascii?Q?1XLhblSd2Kb8Z3nvSfnOCt5/Oi0LE/i3lzm8ls1oTLYkfs08tokDVuOf8ThH?=
 =?us-ascii?Q?EHjIkUsm2l1XS6YFfNSuCXZ2nd56x7IwR1pY597f5S+9qC++AjDscxibm8Ds?=
 =?us-ascii?Q?2TBqlfJg4WwABveXGJEoDtU9KEX7meGwEzr5xvBDhpIfAoBRefWYzVPTDs7O?=
 =?us-ascii?Q?9+clGvSBYVHDKiCf4q4k9FxStTdZVu0qBrxAusrGSgSm4DBXMLmx2asAMKCt?=
 =?us-ascii?Q?882o8B7d6qzSV8TM3CcgGtpNaJSP51TYHC52yUULRwN5WJP9fPyLzlX/G0Yg?=
 =?us-ascii?Q?Cb+Y/nX2BOfsJi62KFYVPThBPiDluis9C/tJluqbnlmu/HJwhTREriZf1ub+?=
 =?us-ascii?Q?WoZQf7cM+tGgiWT+X3pCXM+E2CStGZc5h/dmDLaTie0P2jT/CW67lc4fvW1R?=
 =?us-ascii?Q?fpV6fnDh158XgBDiG9p8MMoPdWh5DjhFvH07w+h+7JMRs8h546m3Orx+IXTD?=
 =?us-ascii?Q?/jXux4IEUbbc+vk/8dMYPF+eZb1K9/s1iowvAMFprhjyNuEctaL4dh9Z28k9?=
 =?us-ascii?Q?U/FSNgeWpVh4CE6PE79Wgnx+afsktoMnmgQXwe8o5HasotzbHLuQdN0mz3ec?=
 =?us-ascii?Q?McD/nSM0yRAxYaRpLlqLBXCZ/uLDYPpLKUMnnPJAAsBUUnVwwLU+ydluCpBO?=
 =?us-ascii?Q?e8UwnmeKueCY8Q3857t3GZuFUXj0Atim0vzMBLxV0iBgCOBAmeZRhQQZ26zd?=
 =?us-ascii?Q?ytsDksbl/rPpCuqeh4YpVHU0bB2ZOVP+JraTWyg8cF1tfH5PI3fGhaGoHtSs?=
 =?us-ascii?Q?GAKWjxMAXKI7WljZgVKpBNUTsTnak5FO+JHMwiwyoPi078zM8jWhX7gsG63B?=
 =?us-ascii?Q?10LCl7ndk+Yyh84oYEocPBUIYulh2PFvxp0kXGmilccN8MfWQCSBRCdNdY7r?=
 =?us-ascii?Q?AXktRIJm7rhIosHUMoJMYazL?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e66e953-dc52-4c87-7f77-08d93bfa5b3f
X-MS-Exchange-CrossTenant-AuthSource: CO1PR10MB4531.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2021 19:07:51.0676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJSgZhWMTvMhwi8iSWZrhcjWeDRg9qv1A7FM+J0A6fOvdd/xx694tfqB9rQ467ZQVWRyMICi7xTunCyZroMmhjck7ZsdmY2ikckihXce3uI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5441
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10031
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106300106
X-Proofpoint-GUID: _p4ApnJyZDT7M3yNf538dRYqg4-T2Zwu
X-Proofpoint-ORIG-GUID: _p4ApnJyZDT7M3yNf538dRYqg4-T2Zwu
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=eric.devolder@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: ehabkost@redhat.com, mst@redhat.com, konrad.wilk@oracle.com,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

=============================
I believe I have corrected for all feedback on v4, but with
responses to certain feedback below.

In patch 1/6, Igor asks:
"you are adding empty template files here
but the later matching bios-tables-test is nowhere to be found
Was testcase lost somewhere along the way?

also it seems you add ERST only to pc/q35,
so why tests/data/acpi/microvm/ERST is here?"

I did miss setting up microvm. That has been corrected.

As for the question about lost test cases, if you are referring
to the new binary blobs for pc,q35, those were in patch
6/6. There is a qtest in patch 5/6. If I don't understand the
question, please indicate as such.


In patch 3/6, Igor asks:
"Also spec (ERST) is rather (maybe intentionally) vague on specifics,
so it would be better that before a patch that implements hw part
were a doc patch describing concrete implementation. As model
you can use docs/specs/acpi_hest_ghes.rst or other docs/specs/acpi_* files.
I'd start posting/discussing that spec within these thread
to avoid spamming list until doc is settled up."

I'm thinking that this cover letter is the bulk of the spec? But as
you say, to avoid spamming the group, we can use this thread to make
suggested changes to this cover letter which I will then convert
into a spec, for v6.


In patch 3/6, in many places Igor mentions utilizing the hostmem
mapped directly in the guest in order to avoid need-less copying.

It is true that the ERST has an "NVRAM" mode that would allow for
all the simplifications Igor points out, however, Linux does not
support this mode. This mode puts the burden of managing the NVRAM
space on the OS. So this implementation, like BIOS, is the non-NVRAM
mode.

I did go ahead and separate the registers from the exchange buffer,
which would facilitate the support of NVRAM mode.

 linux/drivers/acpi/apei/erst.c:
 /* NVRAM ERST Error Log Address Range is not supported yet */
 static void pr_unimpl_nvram(void)
 {
    if (printk_ratelimit())
        pr_warn("NVRAM ERST Log Address Range not implemented yet.\n");
 }

 static int __erst_write_to_nvram(const struct cper_record_header *record)
 {
    /* do not print message, because printk is not safe for NMI */
    return -ENOSYS;
 }

 static int __erst_read_to_erange_from_nvram(u64 record_id, u64 *offset)
 {
    pr_unimpl_nvram();
    return -ENOSYS;
 }

 static int __erst_clear_from_nvram(u64 record_id)
 {
    pr_unimpl_nvram();
    return -ENOSYS;
 }

=============================

This patchset introduces support for the ACPI Error Record
Serialization Table, ERST.

For background and implementation information, please see
docs/specs/acpi_erst.txt, which is patch 2/10.

Suggested-by: Konrad Wilk <konrad.wilk@oracle.com>
Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>

---
v5: 30jun2021
 - Create docs/specs/acpi_erst.txt, per Igor
 - Separate PCI BARs for registers and memory, per Igor
 - Convert debugging to use trace infrastructure, per Igor
 - Various other fixups, per Igor

v4: 11jun2021
 - Converted to a PCI device, per Igor.
 - Updated qtest.
 - Rearranged patches, per Igor.

v3: 28may2021
 - Converted to using a TYPE_MEMORY_BACKEND_FILE object rather than
   internal array with explicit file operations, per Igor.
 - Changed the way the qdev and base address are handled, allowing
   ERST to be disabled at run-time. Also aligns better with other
   existing code.

v2: 8feb2021
 - Added qtest/smoke test per Paolo Bonzini
 - Split patch into smaller chunks, per Igor Mammedov
 - Did away with use of ACPI packed structures, per Igor Mammedov

v1: 26oct2020
 - initial post

---

Eric DeVolder (10):
  ACPI ERST: bios-tables-test.c steps 1 and 2
  ACPI ERST: specification for ERST support
  ACPI ERST: PCI device_id for ERST
  ACPI ERST: header file for ERST
  ACPI ERST: support for ACPI ERST feature
  ACPI ERST: build the ACPI ERST table
  ACPI ERST: trace support
  ACPI ERST: create ACPI ERST table for pc/x86 machines.
  ACPI ERST: qtest for ERST
  ACPI ERST: step 6 of bios-tables-test.c

 docs/specs/acpi_erst.txt     | 152 +++++++
 hw/acpi/erst.c               | 918 +++++++++++++++++++++++++++++++++++++++++++
 hw/acpi/meson.build          |   1 +
 hw/acpi/trace-events         |  14 +
 hw/i386/acpi-build.c         |   9 +
 hw/i386/acpi-microvm.c       |   9 +
 include/hw/acpi/erst.h       |  84 ++++
 include/hw/pci/pci.h         |   1 +
 tests/data/acpi/microvm/ERST | Bin 0 -> 976 bytes
 tests/data/acpi/pc/ERST      | Bin 0 -> 976 bytes
 tests/data/acpi/q35/ERST     | Bin 0 -> 976 bytes
 tests/qtest/erst-test.c      | 129 ++++++
 tests/qtest/meson.build      |   2 +
 13 files changed, 1319 insertions(+)
 create mode 100644 docs/specs/acpi_erst.txt
 create mode 100644 hw/acpi/erst.c
 create mode 100644 include/hw/acpi/erst.h
 create mode 100644 tests/data/acpi/microvm/ERST
 create mode 100644 tests/data/acpi/pc/ERST
 create mode 100644 tests/data/acpi/q35/ERST
 create mode 100644 tests/qtest/erst-test.c

-- 
1.8.3.1


