Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B0F308725
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:53:07 +0100 (CET)
Received: from localhost ([::1]:60850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PWc-0008Nw-2i
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:53:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l5PUw-0007cw-V6
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:51:22 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:57934 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l5PUu-0001kK-8d
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:51:22 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 394624120E;
 Fri, 29 Jan 2021 08:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-disposition:content-type:content-type:mime-version
 :message-id:subject:subject:from:from:date:date:received
 :received:received; s=mta-01; t=1611910277; x=1613724678; bh=+6r
 y870ML2fuQDMeV/WvxxRrHu+E55YY++y4vHaW7hM=; b=ASRwQ/PJbpyi0OFRRNZ
 Ym7Rob9WQtoH2Pj9kyCE1gPultDR5MX0vXwd7axQ8JE2gSu+uOR/8vKOcgmZLpGz
 xrmjk07QMkxaKWmgwBppwscO677cX5Q8zfzRjz69waXpADlz6GCt3vBCiNe4JXoI
 EnBsqGrlF14yBdCKQvLDxUso=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZGOTIT4eiOpm; Fri, 29 Jan 2021 11:51:17 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E743D41305;
 Fri, 29 Jan 2021 11:51:16 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 29
 Jan 2021 11:51:16 +0300
Date: Fri, 29 Jan 2021 11:51:15 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <help-libtasn1@gnu.org>
Subject: libtasn1 test suite fails on macOS Bug Sur with Apple Silicon
Message-ID: <YBPMgyhr0ClHJyM3@SPB-NB-133.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I'm seeing the test failures on macOS and there's a concern that the
behaviour might affect GnuTLS and ultimately QEMU test suite.

Are there any ideas of what might be causing it? Any help is
appreciated.

Thanks,
Roman

===============================================
   GNU Libtasn1 4.16.0: tests/test-suite.log
===============================================

# TOTAL: 30
# PASS:  27
# SKIP:  0
# XFAIL: 0
# FAIL:  3
# XPASS: 0
# ERROR: 0

.. contents:: :depth: 2

FAIL: Test_parser
=================

ERROR N. 1:
  Line 5 - TEST_PARSER2 { } DEFINITIONS IMPLICIT TAGS ::= BEGIN int1 ::= INTEGER END
  Error expected: SYNTAX_ERROR - Test_parser_ERROR.asn:6: Error: syntax error, unexpected IDENTIFIER, expecting $end near 'TEST_PARSER'
  Error detected: SYNTAX_ERROR - Test_parser_ERROR.asn:6: Error: syntax error, unexpected IDENTIFIER, expecting end of file near 'TEST_PARSER'

FAIL Test_parser (exit status: 1)

FAIL: Test_tree
===============

./Test_tree.asn:121: Warning: VisibleString is a built-in ASN.1 type.
./Test_tree.asn:123: Warning: NumericString is a built-in ASN.1 type.
./Test_tree.asn:125: Warning: IA5String is a built-in ASN.1 type.
./Test_tree.asn:127: Warning: TeletexString is a built-in ASN.1 type.
./Test_tree.asn:129: Warning: PrintableString is a built-in ASN.1 type.
./Test_tree.asn:131: Warning: UniversalString is a built-in ASN.1 type.
./Test_tree.asn:134: Warning: BMPString is a built-in ASN.1 type.
./Test_tree.asn:138: Warning: UTF8String is a built-in ASN.1 type.
Error at line 707
ERROR in 254:
  Action 18 - 
  Error expected: MEM_ERROR - 79
  Error detected: VALUE_NOT_VALID - 0

FAIL Test_tree (exit status: 1)

FAIL: copynode
==============

./pkix.asn:332: Warning: VisibleString is a built-in ASN.1 type.
./pkix.asn:334: Warning: NumericString is a built-in ASN.1 type.
./pkix.asn:336: Warning: IA5String is a built-in ASN.1 type.
./pkix.asn:338: Warning: TeletexString is a built-in ASN.1 type.
./pkix.asn:340: Warning: PrintableString is a built-in ASN.1 type.
./pkix.asn:342: Warning: UniversalString is a built-in ASN.1 type.
./pkix.asn:345: Warning: BMPString is a built-in ASN.1 type.
./pkix.asn:349: Warning: UTF8String is a built-in ASN.1 type.
LIBTASN1 ERROR: VALUE_NOT_VALID
Cannot copy node
FAIL copynode (exit status: 1)



