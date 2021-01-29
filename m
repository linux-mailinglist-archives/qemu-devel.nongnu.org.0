Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53A130871E
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 09:46:01 +0100 (CET)
Received: from localhost ([::1]:54748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5PPl-0005WS-0v
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 03:46:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l5PNT-00050d-17
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:43:39 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:57642 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l5PNQ-0006lI-TO
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 03:43:38 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id B1372412E8;
 Fri, 29 Jan 2021 08:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-transfer-encoding:content-disposition
 :content-type:content-type:mime-version:references:message-id
 :subject:subject:from:from:date:date:received:received:received;
 s=mta-01; t=1611909813; x=1613724214; bh=3mPefHariP8mpWdcVm9ugy
 nBy/8Gq+Om5oF1iRTHqGg=; b=HGPgLbifJvTXkti8c9NodZA0X5kefU/DwGrvgw
 nB18qP4PID9c2Ti1erbUnn1FU5zMQ0ePUaE+JVYEXShM3FCM+auzcC+dQrwL+1rq
 TB+F43KViu05W1j5eBz+ZqYuRUdCPHKmapLAlxF1QmiX+ZLm3bJUynuGyJA5VFe8
 4F1uw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XuPLDqHx_8Kj; Fri, 29 Jan 2021 11:43:33 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 4133E4122E;
 Fri, 29 Jan 2021 11:43:33 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 29
 Jan 2021 11:43:33 +0300
Date: Fri, 29 Jan 2021 11:43:32 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: macOS (Big Sur, Apple Silicon) 'make check' fails in
 test-crypto-tlscredsx509
Message-ID: <YBPKtL3reYFm7bgy@SPB-NB-133.local>
References: <CAFEAcA-bafTaHajkvYQw1rfGP1MgKmeY-wmO6LY=fj2oY87HFQ@mail.gmail.com>
 <20210126163647.GJ3640294@redhat.com>
 <CAFEAcA88wwwK5RYDpkQ+KEGwS5Qon6wQc8UsuWjjkKtKM9egcA@mail.gmail.com>
 <20210127121723.GI3653144@redhat.com>
 <0de4a2a8-577d-a46e-3a66-1f9a9e589a4d@weilnetz.de>
 <20210127165330.GT3653144@redhat.com>
 <72e44724-94ca-43f0-aea1-2554c43cc4c3@weilnetz.de>
 <20210127181731.GX3653144@redhat.com>
 <27c01eba-ebc1-9b8e-d7ea-38ad9b4350d9@weilnetz.de>
 <20210127185917.GB3653144@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210127185917.GB3653144@redhat.com>
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
Cc: Stefan Weil <sw@weilnetz.de>, Alexander Graf <agraf@csgraf.de>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 27, 2021 at 06:59:17PM +0000, Daniel P. Berrangé wrote:
> On Wed, Jan 27, 2021 at 07:56:16PM +0100, Stefan Weil wrote:
> > Am 27.01.21 um 19:17 schrieb Daniel P. Berrangé:
> > 
> > > On Wed, Jan 27, 2021 at 06:05:08PM +0100, Stefan Weil wrote:
> > > > Am 27.01.21 um 17:53 schrieb Daniel P. Berrangé:
> > > > 
> > > > > In $QEMU.git/crypto/init.c can you uncomment the "#define DEBUG_GNUTLS"
> > > > > line and then re-build and re-run the test case.
> > > > > 
> > > > > There's a bunch of debug logs in code paths from gnutls_x509_crt_privkey_sign
> > > > > that might give us useful info.
> > > > > 
> > > > > Regards,
> > > > > Daniel
> > > > 
> > > > % LANG=C.UTF-8 tests/test-crypto-tlscredsx509
> > > > # random seed: R02S9b95072a368ad370cdd4c780b8074596
> > > > 3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
> > > > 3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
> > > > 2: signing structure using RSA-SHA256
> > > > 3: ASSERT: common.c[_gnutls_x509_der_encode]:855
> > > > 3: ASSERT: sign.c[_gnutls_x509_pkix_sign]:174
> > > > 3: ASSERT: x509_write.c[gnutls_x509_crt_privkey_sign]:1834
> > > > 3: ASSERT: x509_write.c[gnutls_x509_crt_sign2]:1152
> > > > Bail out! FATAL-CRITICAL: Failed to sign certificate ASN1 parser: Value is
> > > > not valid.
> > > So it shows its failing inside a asn1_der_coding call, but I can't see
> > > why it would fail, especially if the same test suite passes fine on
> > > macOS x86_64 hosts.
> > 
> > 
> > It returns ASN1_MEM_ERROR, so the input vector is too small.
> 
> Hmm, that's odd - "Value is not valid" corresponds to
> ASN1_VALUE_NOT_VALID error code.
> 

Hi Daniel, Stefan,

It's interesting that "make check" of libtasn1 fails with three tests
and two of them produce VALUE_NOT_VALID error.

The failing tests are:
  FAIL: Test_parser
  FAIL: Test_tree
  FAIL: copynode

Full test log:
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

Regards,
Roman

