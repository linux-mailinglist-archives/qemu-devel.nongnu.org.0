Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A6A30DCF7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:38:52 +0100 (CET)
Received: from localhost ([::1]:54264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JIx-0003ac-Fa
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:38:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l7J8l-0001BE-Ng
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:28:19 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:45452 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1l7J8i-0001oV-SG
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:28:19 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 7653441280;
 Wed,  3 Feb 2021 14:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1612362491;
 x=1614176892; bh=oSqS67t7ScFWihn2ZQV+Kd/+W8T2kSjlYiBIYD7VedM=; b=
 uVT+E31LdbpKGIVZ3VkcyZhs0odCMgGXN57NUCXT3CpR8XDExgac5CUsUKK+Zz7D
 7+DPulNf3gD913QHbETbRqy28bJjID6G/tb61+ql9Nf7A4PqFm2SMulF7KqP55Z7
 zfGSUNeyrEAnNg+1sxbEYaBWnGZ5HekoF2fRgRDAJv8=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dWVnFNUZsmCF; Wed,  3 Feb 2021 17:28:11 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 9BFDE411F9;
 Wed,  3 Feb 2021 17:28:11 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Wed, 3 Feb
 2021 17:28:11 +0300
Date: Wed, 3 Feb 2021 17:28:10 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: macOS (Big Sur, Apple Silicon) 'make check' fails in
 test-crypto-tlscredsx509
Message-ID: <YBqy+jBQSw8bvcnF@SPB-NB-133.local>
References: <0de4a2a8-577d-a46e-3a66-1f9a9e589a4d@weilnetz.de>
 <20210127165330.GT3653144@redhat.com>
 <72e44724-94ca-43f0-aea1-2554c43cc4c3@weilnetz.de>
 <20210127181731.GX3653144@redhat.com>
 <27c01eba-ebc1-9b8e-d7ea-38ad9b4350d9@weilnetz.de>
 <20210127185917.GB3653144@redhat.com>
 <YBPKtL3reYFm7bgy@SPB-NB-133.local>
 <20210129095327.GC4001740@redhat.com>
 <YBjg7ubtbw3OeQCd@SPB-NB-133.local>
 <6d360ded-f8b6-d08b-b4fc-af8c52554a58@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6d360ded-f8b6-d08b-b4fc-af8c52554a58@redhat.com>
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
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Feb 02, 2021 at 08:50:24AM -0600, Eric Blake wrote:
> On 2/1/21 11:19 PM, Roman Bolshakov wrote:
> 
> > After a session of debugging I believe there's an issue with Clang 12.
> > Here's a test program (it reproduces unexpected ASN1_VALUE_NOT_VALID
> > from _asn1_time_der() in libtasn1):
> > 
> > #include <stdio.h>
> > 
> > static int func2(char *foo) {
> >         fprintf(stderr, "%s:%d foo: %p\n", __func__, __LINE__, foo);
> >         if (foo == NULL) {
> >                 fprintf(stderr, "%s:%d foo: %p\n", __func__, __LINE__, foo);
> >                 return 1;
> >         }
> >         return 0;
> > }
> > 
> > int func1(char *foo) {
> >         int counter = 0;
> >         if (fprintf(stderr, "IO\n") > 0)
> >                 counter += 10;
> >         fprintf(stderr, "%s:%d foo: %p counter %d\n", __func__, __LINE__, foo, counter);
> >         if(!func2(foo + counter)) {
> 
> This line has unspecified behavior in the C standard.  Adding an integer
> to a pointer is only well-specified if the pointer is to an array and
> the integer is within the bounds or the slot just past the array.  But
> since you called func1(NULL), foo is NOT pointing to an array, and
> therefore foo+counter points to garbage, and the compiler is free to
> optimize it at will.

Hi Eric,

Thanks a lot for pointing out this. It was surprising to me but
interesting:

http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2012.htm#clarifying-the-c-memory-object-model-out-of-bounds-pointer-arithmetic
http://www.open-std.org/jtc1/sc22/wg14/www/docs/n2222.htm#pointer-arithmetic

As far as I understand wording in the standard, null pointer doesn't
point to an object (6.3.2.3p3). Therefore pointer arithmetic exception
for non-array objects (6.5.6p7) doesn't apply to null pointers but it
does apply to valid object pointers:

"For the purposes of these operators, a pointer to an object that is not
an element of an array behaves the same as a pointer to the first
element of an array of length one with the type of the object as its
element type."

So I was curious how clang would behave if we pass NULL conditionally.
We could do that by changing main() in the example above to:

int main(int argc, char *argv[]) {
        int ret;
        char *foo;

        if (argc > 1)
                foo = malloc(90 * sizeof(char));
        else
                foo = NULL;

        ret = func1(foo);

        if (argc > 1)
                free(foo);

        return ret;
}

And it returns "good" for specified behaviour (if foo points to malloc'd
memory):
 $ ./a.out f
 IO
 func1:17 foo: 0x14be06790 counter 10
 func2:5 foo: 0x14be0679a
 good

The behaviour is different if foo is initialized to NULL.
 $ ./a.out
 IO
 func1:17 foo: 0x0 counter 10
 func2:5 foo: 0xa
 func2:7 foo: 0x0
 broken

> > 
> > So, immediate workaround would be to downgrade optimization level of libtasn1
> > to -O1 in homebrew.
> > 
> > I've submitted the issue to Apple bugtracker:
> > FB8986815
> 
> Yes, it's annoying that as compilers get smarter, it exposes the
> presence of unspecified code in weird ways.  But I don't see this as a
> bug in clang, but as a bug in libtasn1 for assuming undefined behavior
> produces a sane result.
> 

Yes, strictly speaking the compiler is compliant. Given the example
libtasn1 should likely introduce a second variable for an integer
offset instead of relying on null pointer arithmetic.

It'd also be good if clang would print an error or a warning for null
pointer arithmetic.

Thanks,
Roman

