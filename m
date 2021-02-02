Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BB630B6D4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 06:21:26 +0100 (CET)
Received: from localhost ([::1]:37424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6o7w-0006qc-M9
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 00:21:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l6o6R-0006Jo-K6
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 00:19:51 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:55798 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l6o6P-0002ad-MB
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 00:19:51 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 574B141278;
 Tue,  2 Feb 2021 05:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-transfer-encoding:content-disposition
 :content-type:content-type:mime-version:references:message-id
 :subject:subject:from:from:date:date:received:received:received;
 s=mta-01; t=1612243185; x=1614057586; bh=q9xqNVvvhFc9Gynr/i5qgg
 VhSYrOFj4pCmy547XmJ9I=; b=an0Ep1eGRPKkxbvwtqUyLH4KN/Ozo+etCB5QU/
 SpniDisT5GBlc8canLda0+4x1gm8XWbX260agj+2vPG15xz09nm5o0WG9CVGpwL6
 5Rm8XDZbpfy9uOV5hJ5rxjZYrzjQF0GZr/30CUQKeyJlUHOK3nCTjB0tLbtXxwph
 GltA0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m-cXQjfHVgiJ; Tue,  2 Feb 2021 08:19:45 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id CEA324120D;
 Tue,  2 Feb 2021 08:19:43 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 2 Feb
 2021 08:19:43 +0300
Date: Tue, 2 Feb 2021 08:19:42 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: macOS (Big Sur, Apple Silicon) 'make check' fails in
 test-crypto-tlscredsx509
Message-ID: <YBjg7ubtbw3OeQCd@SPB-NB-133.local>
References: <CAFEAcA88wwwK5RYDpkQ+KEGwS5Qon6wQc8UsuWjjkKtKM9egcA@mail.gmail.com>
 <20210127121723.GI3653144@redhat.com>
 <0de4a2a8-577d-a46e-3a66-1f9a9e589a4d@weilnetz.de>
 <20210127165330.GT3653144@redhat.com>
 <72e44724-94ca-43f0-aea1-2554c43cc4c3@weilnetz.de>
 <20210127181731.GX3653144@redhat.com>
 <27c01eba-ebc1-9b8e-d7ea-38ad9b4350d9@weilnetz.de>
 <20210127185917.GB3653144@redhat.com>
 <YBPKtL3reYFm7bgy@SPB-NB-133.local>
 <20210129095327.GC4001740@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210129095327.GC4001740@redhat.com>
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

On Fri, Jan 29, 2021 at 09:53:27AM +0000, Daniel P. Berrangé wrote:
> On Fri, Jan 29, 2021 at 11:43:32AM +0300, Roman Bolshakov wrote:
> > On Wed, Jan 27, 2021 at 06:59:17PM +0000, Daniel P. Berrangé wrote:
> > > On Wed, Jan 27, 2021 at 07:56:16PM +0100, Stefan Weil wrote:
> > > > Am 27.01.21 um 19:17 schrieb Daniel P. Berrangé:
> > > > 
> > > > > On Wed, Jan 27, 2021 at 06:05:08PM +0100, Stefan Weil wrote:
> > > > > > Am 27.01.21 um 17:53 schrieb Daniel P. Berrangé:
> > > > > > 
> > > > > > > In $QEMU.git/crypto/init.c can you uncomment the "#define DEBUG_GNUTLS"
> > > > > > > line and then re-build and re-run the test case.
> > > > > > > 
> > > > > > > There's a bunch of debug logs in code paths from gnutls_x509_crt_privkey_sign
> > > > > > > that might give us useful info.
> > > > > > > 
> > > > > > > Regards,
> > > > > > > Daniel
> > > > > > 
> > > > > > % LANG=C.UTF-8 tests/test-crypto-tlscredsx509
> > > > > > # random seed: R02S9b95072a368ad370cdd4c780b8074596
> > > > > > 3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
> > > > > > 3: ASSERT: mpi.c[wrap_nettle_mpi_print]:60
> > > > > > 2: signing structure using RSA-SHA256
> > > > > > 3: ASSERT: common.c[_gnutls_x509_der_encode]:855
> > > > > > 3: ASSERT: sign.c[_gnutls_x509_pkix_sign]:174
> > > > > > 3: ASSERT: x509_write.c[gnutls_x509_crt_privkey_sign]:1834
> > > > > > 3: ASSERT: x509_write.c[gnutls_x509_crt_sign2]:1152
> > > > > > Bail out! FATAL-CRITICAL: Failed to sign certificate ASN1 parser: Value is
> > > > > > not valid.
> > > > > So it shows its failing inside a asn1_der_coding call, but I can't see
> > > > > why it would fail, especially if the same test suite passes fine on
> > > > > macOS x86_64 hosts.
> > > > 
> > > > 
> > > > It returns ASN1_MEM_ERROR, so the input vector is too small.
> > > 
> > > Hmm, that's odd - "Value is not valid" corresponds to
> > > ASN1_VALUE_NOT_VALID error code.
> > > 
> > 
> > Hi Daniel, Stefan,
> > 
> > It's interesting that "make check" of libtasn1 fails with three tests
> > and two of them produce VALUE_NOT_VALID error.
> > 
> > The failing tests are:
> >   FAIL: Test_parser
> >   FAIL: Test_tree
> >   FAIL: copynode
> 
> That's interesting. Assuming 'make check' for libtasn1 succeeeds on
> x86_64 macOS, then I'm inclined to blame this whole problem on
> libtasn1 not QEMU.
> 

'make check' of libtasn1 doesn't succeed on x86_64 either.

After a session of debugging I believe there's an issue with Clang 12.
Here's a test program (it reproduces unexpected ASN1_VALUE_NOT_VALID
from _asn1_time_der() in libtasn1):

#include <stdio.h>

static int func2(char *foo) {
        fprintf(stderr, "%s:%d foo: %p\n", __func__, __LINE__, foo);
        if (foo == NULL) {
                fprintf(stderr, "%s:%d foo: %p\n", __func__, __LINE__, foo);
                return 1;
        }
        return 0;
}

int func1(char *foo) {
        int counter = 0;
        if (fprintf(stderr, "IO\n") > 0)
                counter += 10;
        fprintf(stderr, "%s:%d foo: %p counter %d\n", __func__, __LINE__, foo, counter);
        if(!func2(foo + counter)) {
                fprintf(stderr, "good\n");
                return 0;
        } else {
                fprintf(stderr, "broken\n");
                return 1;
        }
}

int main() {
        char *foo = NULL;
        return func1(foo);
}


What return value would you expect from the program?

If the program is compiled with -O0/O1 it returns zero exit code.
Here's the output:
IO
func1:16 foo: 0x0 counter 10
func2:4 foo: 0xa
good

If it is compiled with -O2 it returns 1:
IO
func1:16 foo: 0x0 counter 10
func2:4 foo: 0xa
func2:6 foo: 0x0
broken

That happens because clang uses register behind foo from func1 (it has zero
pointer) inside inlined func2 (it should have non zero pointer).

So, immediate workaround would be to downgrade optimization level of libtasn1
to -O1 in homebrew.

I've submitted the issue to Apple bugtracker:
FB8986815

Best regards,
Roman

