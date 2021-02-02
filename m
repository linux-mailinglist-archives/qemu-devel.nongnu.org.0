Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBE730C17E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:27:17 +0100 (CET)
Received: from localhost ([::1]:53252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6weC-0006KE-Tk
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:27:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l6wWR-00066x-Ua
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:19:16 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:45359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1l6wWP-0007WL-68
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:19:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=kKxW8e7Ul0844JUhI4uAX8RC6HY3NyRWX44Cm261fWY=; b=nWNPQvyfD/jqoLCTtxPsnnTIk4
 R0luEM2AGFtBEnFqv0r9fn/JbJABYuV/dXzLsw40rSDsk7PneJRLuZDGiC6JCjq+9TyQrZyGkkIKP
 vFJWNZyoNymgqtJzHHhHgwCttke2NaZpT3/JdksTlBfPyFBXzh+7tva8Zj3WfpvwVANZHhKUa9PSn
 jBdGMHzPlKxhETodPr1yTt7k9ET0JVqw5kqolxhmtwIE/R97/e0z4usphY3boMkauR0We25ABzYao
 C610S4J6nMl94jsOzJrJlGeTY2Uq75r0pl95vrAYoIG0r9LIc2EPLLh5NpiRI6x1CLoRuih0TpkdW
 2XW9y8i/OeaQfOLCcz3zPKJdYP2tjXz6mLMBpqHDm8cKlGRC83QSkuujNxQs3lWV9Dz378nTdIjP2
 q4SOvP4SsSI1ePRVl2YRpExn8ZFB87XxvSKVnyfuzE1JC1F0JH/0Gvf3aEATnWnIKsFhspoQQr8I2
 9NeQK+8zS4AoqS5VXXeJR6eCJAh/tA9HO4cVvlq1bAK0ApueDBK+A0ADnLdME4LSd0dF0qmVR0Tbd
 /BJ0C1q4o52JMUY3DorMQhbuE9WRju7na5UHXHYNw60VHnYrY+KtWbp+xshySh7vbqnrTy7iPmu+z
 pyOvAJ5Ovgxgb2/e81a0ifSd/3lKYof75OzZp34/8=;
To: qemu-devel@nongnu.org
Subject: Re: macOS (Big Sur,
 Apple Silicon) 'make check' fails in test-crypto-tlscredsx509
Date: Tue, 02 Feb 2021 15:19:07 +0100
Message-ID: <4977531.9KTcbTlzxt@silver>
In-Reply-To: <YBjg7ubtbw3OeQCd@SPB-NB-133.local>
References: <CAFEAcA88wwwK5RYDpkQ+KEGwS5Qon6wQc8UsuWjjkKtKM9egcA@mail.gmail.com>
 <20210129095327.GC4001740@redhat.com> <YBjg7ubtbw3OeQCd@SPB-NB-133.local>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
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
Cc: Stefan Weil <sw@weilnetz.de>, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alexander Graf <agraf@csgraf.de>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Christian Schoenebeck <qemu_oss@crudebyte.com>
From: qemu_oss--- via <qemu-devel@nongnu.org>

On Dienstag, 2. Februar 2021 06:19:42 CET Roman Bolshakov wrote:
> 'make check' of libtasn1 doesn't succeed on x86_64 either.
> 
> After a session of debugging I believe there's an issue with Clang 12.
> Here's a test program (it reproduces unexpected ASN1_VALUE_NOT_VALID
> from _asn1_time_der() in libtasn1):
> 
> #include <stdio.h>
> 
> static int func2(char *foo) {
>         fprintf(stderr, "%s:%d foo: %p\n", __func__, __LINE__, foo);
>         if (foo == NULL) {
>                 fprintf(stderr, "%s:%d foo: %p\n", __func__, __LINE__, foo);
> return 1;
>         }
>         return 0;
> }
> 
> int func1(char *foo) {
>         int counter = 0;
>         if (fprintf(stderr, "IO\n") > 0)
>                 counter += 10;
>         fprintf(stderr, "%s:%d foo: %p counter %d\n", __func__, __LINE__,
> foo, counter); if(!func2(foo + counter)) {
>                 fprintf(stderr, "good\n");
>                 return 0;
>         } else {
>                 fprintf(stderr, "broken\n");
>                 return 1;
>         }
> }
> 
> int main() {
>         char *foo = NULL;
>         return func1(foo);
> }
> 
> 
> What return value would you expect from the program?
> 
> If the program is compiled with -O0/O1 it returns zero exit code.
> Here's the output:
> IO
> func1:16 foo: 0x0 counter 10
> func2:4 foo: 0xa
> good
> 
> If it is compiled with -O2 it returns 1:
> IO
> func1:16 foo: 0x0 counter 10
> func2:4 foo: 0xa
> func2:6 foo: 0x0
> broken
> 
> That happens because clang uses register behind foo from func1 (it has zero
> pointer) inside inlined func2 (it should have non zero pointer).
> 
> So, immediate workaround would be to downgrade optimization level of
> libtasn1 to -O1 in homebrew.

Hu, confirmed.

clang 12.0.0 on x86_64 Mac fails on that demo with -O2,-O3,-Os, but works with
-O0,-O1.

clang 11.0.3 in contrast works with any optimization level.

It only fails BTW if that test uses exactly a NULL pointer, any other memory 
address (e.g. just (void*)1) works:

#include <stdio.h>

#define FLOOR_VALUE ((void*)1)

static int func2(char *foo) {
        fprintf(stderr, "%s:%d foo: %p\n", __func__, __LINE__, foo);
        if (foo == FLOOR_VALUE) {
                fprintf(stderr, "%s:%d foo: %p\n", __func__, __LINE__, foo);
                return 1;
        }
        return 0;
}

int func1(char *foo) {
        int counter = 0;
        if (fprintf(stderr, "IO\n") > 0)
                counter += 1;
        fprintf(stderr, "%s:%d foo: %p counter %d\n", __func__, __LINE__, foo, 
counter);
        if(!func2(foo + counter)) {
                fprintf(stderr, "good\n");
                return 0;
        } else {
                fprintf(stderr, "broken\n");
                return 1;
        }
}

int main() {
        char *foo = FLOOR_VALUE;
        return func1(foo);
}

Maybe that's some sort of new security feature in clang 12, in the sense of 
something like this:

	VeryLargeStruct *p = NULL;
	p->farMember = value;

to segfault always reliably and exactly with address zero, instead of pure 
luck as of NULL + veryLargeSize.

> I've submitted the issue to Apple bugtracker:
> FB8986815
> 
> Best regards,
> Roman

They could argue that operating on a NULL pointer is undefined behaviour.

Best regards,
Christian Schoenebeck



