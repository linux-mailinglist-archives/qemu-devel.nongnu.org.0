Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BD72B8268
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 17:55:23 +0100 (CET)
Received: from localhost ([::1]:60654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfQjq-0003QD-RA
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 11:55:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1kfQhD-0001gg-AW
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:52:39 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:15039)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <steplong@quicinc.com>)
 id 1kfQhB-0006bC-1T
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:52:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1605718357; x=1637254357;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=EB4074Mw4jtkeIUOG4x0NYOUKOOraT1BkC0BKcVrVa0=;
 b=EtZsmPgGB9kwTqFCLGksWPzf/LdxrIFpePr1w44oLRDnJKJVShCOlUEI
 JBb3cggUIDiQ9mgwp5kgc2h8R9S7hyCpH8dVyCyaYCstNkfTRa805Uwr0
 L43Ty0vWqRwpTLyYcS3j5ro7fz+rOre5viIeejGN7qUNKRaKUQbm22d2/ U=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 18 Nov 2020 08:52:33 -0800
X-QCInternal: smtphost
Received: from nasanexm03f.na.qualcomm.com ([10.85.0.47])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 18 Nov 2020 08:52:33 -0800
Received: from nasanexm03h.na.qualcomm.com (10.85.0.50) by
 nasanexm03f.na.qualcomm.com (10.85.0.47) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Nov 2020 08:52:32 -0800
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (199.106.107.6)
 by nasanexm03h.na.qualcomm.com (10.85.0.50) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2 via Frontend Transport; Wed, 18 Nov 2020 08:52:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djCijDwOZ2G8300UxQB16SE6dLkxMFoOdTDVEIxPXM0RIB8MWOQRymyqyUgQwCSm8BVCg/wtq2WMPyoj5wLCEZv/ZIBZjwKNWJHbHqzOjdOd5Ut8FQqE3xqeaWBwhjzmDTPrUcmMgAGBd2+wZDgDfdiRKD+TbWe0cmby11tM+mnWinFPAKhisapJgcn6UNGaSZ+RX1/OYehBXuYaLROnytU0AJrZdGU7FGLWRS83suv7YrTliflBDjvsOSSuVgc5byWvF2oswBp06h2gje7yJ74IUx4qXRV/HTbM693AYWjPGKCI6SL1juRr0ihGMIC1fF59yTucoclkCOy3dtzx/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5G9WR7+2BmbdbbUejALsuSCsPMCcwYM47BrlnJsJ0ck=;
 b=nOwXDZmNpTRQnuc+lSoCFL/d/neKARp7z8pLiBflGviKSKJrQFExFW2fQtq9Sa3rACanIiErH5aDQxfnZyUIMkdn/Lq+NjN02IrR4V1a886X9rxZ9fwjqxpjXPCaii8ZNnC0Eq6t7xWgrKytuC0sR3y1ljN5+dXQ2OdK3pM3wYQCGu3erNZNSaRihgQz3su3jFYYStwmXbFrib4Bb2iw63wCoKHnFg29xL9G7EaSDvqlouer/7LvcEmymjIrZkAQ89gCkIZo9WAqGsPcmntgQ2yqLn9kQy6RmksuI1U/9xndto7mm9rNKK/QBRtoyNgROqA8gD55CrhOppf6XBVh1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.onmicrosoft.com; s=selector1-qualcomm-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5G9WR7+2BmbdbbUejALsuSCsPMCcwYM47BrlnJsJ0ck=;
 b=QNZ9Fcv46Uu+irB/5xzfpmNLqiIBB1/2/yoM+IIDNKNDVnvNCqnPjdOie9GKXlygD9ZVGc4rS5xTxLckXob2SEsBFM8gjJXp9M2QQgdWd8lD1rTBevTqvEkvrv9+QaPxVmHl87sEASqOYBbj4qiqhglkPvysdIgG21Kvw9GWT2I=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=quicinc.com;
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24) by MWHPR02MB3182.namprd02.prod.outlook.com
 (2603:10b6:301:66::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Wed, 18 Nov
 2020 16:52:25 +0000
Received: from MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::c07b:6b00:b5f0:a5d6]) by MWHPR0201MB3547.namprd02.prod.outlook.com
 ([fe80::c07b:6b00:b5f0:a5d6%7]) with mapi id 15.20.3564.028; Wed, 18 Nov 2020
 16:52:25 +0000
From: Stephen Long <steplong@quicinc.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] linux-user/elfload: Fix handling of pure BSS segments
Date: Wed, 18 Nov 2020 08:52:06 -0800
Message-ID: <20201118165206.2826-1-steplong@quicinc.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [24.24.203.211]
X-ClientProxiedBy: SJ0PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:a03:331::10) To MWHPR0201MB3547.namprd02.prod.outlook.com
 (2603:10b6:301:7b::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from STEPLONG.qualcomm.com (24.24.203.211) by
 SJ0PR03CA0065.namprd03.prod.outlook.com (2603:10b6:a03:331::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Wed, 18 Nov 2020 16:52:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 693994f9-d04e-4cec-e3f3-08d88be25332
X-MS-TrafficTypeDiagnostic: MWHPR02MB3182:
X-Microsoft-Antispam-PRVS: <MWHPR02MB31828F4DD2545863EFC3FAB3C7E10@MWHPR02MB3182.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:549;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u6iHhao5FmODo8dfch0M2BtY31qRg5Ydke+23ekVLOASDrBZtkDY4i6x5ShG6Y3x2eimndvoQ8yZ8diHadm/on69hY7V/m9DqmJZskjFTLeIs6b/JiGb4q0nbP762oXe3HddMDGTTFF1LLcW7cLGrDATktvEq1E5YI+GcZUHAMcPkc2KnVQFnbDBoyZLGW1ntq81ozGCi5qf33Ch2noD+elhDNJ7QiuYQtVvYrniK5GqjA3KYOHaNVKwyuNf5NKVcELDMiHTaDEF+ZXnMotyotoFS8mUF9nKGNCeTObFptp3Nk2LtfM/SRrMiVCjKht7zY1h2jwiYR9t1uKnMYxlgQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR0201MB3547.namprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(346002)(39860400002)(376002)(396003)(136003)(366004)(8936002)(8676002)(26005)(16526019)(4326008)(186003)(478600001)(316002)(6506007)(2616005)(83380400001)(956004)(52116002)(6486002)(86362001)(6512007)(6666004)(66556008)(66946007)(66476007)(6916009)(2906002)(5660300002)(36756003)(4744005)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 3DwCRHAosylGWvZULZtLngTVq81d3RSj/WZm3ISrKoNn70/la0r13LUqnl+qfB4pyFuQE03K3lnZ8K9JShlMsC1aW7mHc7ZktNIScBkgt9MA3gsIPSHnt6Nm13HDdPbtq+doDXC3yZeSiTtd3zgOIC0Lx2MqNxnOMWc1/IkN3hIN56Nu6d74IgxWXVBYHcYOkicD1YO+Rkr+HX5yY7xFgAEKUGWEG3kLxwyM+g8+LZGFlZEPY5kWWgFgHJfhQ6zM8erA6lP4OjnqRhUV5093QnF3S9hWfDnwZwdOfdSSPSuACgZ3r3EBzGIZTPbjVOQnTeHJFRQf7Oa+f10fmjDZFoAigWEED4EHhmAqskn77vLHPjDRd8f4j6GpL1ulVNKPNNUTBHyAYUGxj8iYRPm/NnbHDu9NrFmTXKbkHiqmfQoilBuW+9SavAZikAG80CnwHNAini+3h2nNevzd4W25gTUxsenCyQeyFr7ADrIAtTYZVRyhHjTL8LSAL70cfIIlGxIXmM80WVkTJ3fkkT/Hy/PfD5Nweg/69NbSoQknj0xdOO40yZxdk8wIoqQkFd/caeZRGu/WZmIKPZLedIC2j7tWI3D9kMXIvA7C9YfsoRzXZ5UNvjS68r8VDwop/TQYRTe5BZIXFLxwGL94Iwfbc9RTc474U+2YJ/FjXbyqKG4huGNAV7+SBEkbRdj7+ZzMVbcEZjCj5UXo/EK1xAvOpN0thfe0fidO32b8YzrgUaCpvtD6KKjUErOYqX9Ygr9ElLkz1CDrEKaLYFDAheo0Zh5Xdtel3di1WYdyol/FfPopNcWWnpiWF4ip8k1LnGWLh1WQyR+69ug+1QRTOH+xdRWJLl7847VsIsDk/s5vl0zQ2RdLBINE+W13CdmiLz0wfa9Z3w5eTXS9P1+4V8iG/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 693994f9-d04e-4cec-e3f3-08d88be25332
X-MS-Exchange-CrossTenant-AuthSource: MWHPR0201MB3547.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2020 16:52:25.1087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1bNLU0UEedQm1UCu1E2jnUyC2hsDBehvhwFc4to3eUfVlw7NGvhLgocnzdlJTolnjs2ierNsHGOssMS1E5fq6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3182
X-OriginatorOrg: quicinc.com
Received-SPF: pass client-ip=199.106.114.38; envelope-from=steplong@quicinc.com;
 helo=alexa-out-sd-01.qualcomm.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 11:52:34
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: philippe.mathieu.daude@gmail.com, mjt@tls.msk.ru,
 richard.henderson@linaro.org, laurent@vivier.eu, ben@decadent.org.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qemu-user fails to load ELFs with only BSS and no data section

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
Signed-off-by: Stephen Long <steplong@quicinc.com>
---

Submitting this on behalf of Ben Hutchings. Feel free to edit the commit
msg.

 linux-user/elfload.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 0b02a92602..af16d94c61 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2783,7 +2783,7 @@ static void load_elf_image(const char *image_name, int image_fd,
              * segment, in that case just let zero_bss allocate an empty buffer
              * for it.
              */
-            if (eppnt->p_filesz != 0) {
+            if (vaddr_len != 0) {
                 error = target_mmap(vaddr_ps, vaddr_len, elf_prot,
                                     MAP_PRIVATE | MAP_FIXED,
                                     image_fd, eppnt->p_offset - vaddr_po);
-- 
2.25.1


