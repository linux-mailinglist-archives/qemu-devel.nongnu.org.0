Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEF63A7A83
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 11:28:52 +0200 (CEST)
Received: from localhost ([::1]:57590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lt5NL-0000G5-BL
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 05:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lt5Lz-0007FL-Ql
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:27:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54615)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lt5Ls-00075K-7i
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 05:27:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623749238;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=PRaxum1YAqwoHuPyrBZJx3ze0UeluAGvtxQaIw4/05Y=;
 b=GvMLWSJKWutL2Fzi9NYxb7DEjnNVZdTndTCLGLKFeBp7TD/NPJfZ4bYOHNSVM06Fg5psl4
 2NDEIfsAlVq6uHyMBo+ndCYX5C2OY97biW8NJAkGCnlHlBkqmrOLD5KGodNHU12rHWU55o
 2UXFBYo6YZGaK5UQfdI1NAHTrEebVMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-pqeAin8jN3OgC9k0nPmDkw-1; Tue, 15 Jun 2021 05:27:14 -0400
X-MC-Unique: pqeAin8jN3OgC9k0nPmDkw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54C0C801B20
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 09:27:13 +0000 (UTC)
Received: from redhat.com (ovpn-114-213.ams2.redhat.com [10.36.114.213])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2BC82100760F;
 Tue, 15 Jun 2021 09:27:05 +0000 (UTC)
Date: Tue, 15 Jun 2021 10:27:02 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 03/18] modules: add qemu-modinfo utility
Message-ID: <YMhyZtO/JMBQDKHK@redhat.com>
References: <20210610055755.538119-1-kraxel@redhat.com>
 <20210610055755.538119-4-kraxel@redhat.com>
 <20210610130424.fj6fsufnunccmhmx@sirius.home.kraxel.org>
 <YMIP/cKc570Ozvdh@redhat.com>
 <1636b96e-9073-b145-3fcc-3370fa2d7506@redhat.com>
 <20210614150159.6ilpce4dqxi7rju4@sirius.home.kraxel.org>
 <YMdw/RlJuGmrFeQj@redhat.com>
 <20210615045441.2rgea2hxalb3pb5z@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210615045441.2rgea2hxalb3pb5z@sirius.home.kraxel.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 15, 2021 at 06:54:41AM +0200, Gerd Hoffmann wrote:
> > > Problem with that approach is that it doesn't work for module
> > > dependencies ...
> > > 
> > > Comments on the idea?  Suggestions for the module dependency problem?
> > > Could maybe libbfd be used to find module (symbol) dependencies
> > > automatically without writing a full dynamic linker?
> > 
> > Is there any value in exploring use of libclang ?  It gives us a real
> > C parser that we can use to extract information from the C source. In
> > libvirt we have experimental patches (not yet merged) using libclang to
> > auto-generate XML parser helpers from struct annotations. It is quite
> > nice compared to any other hacks for extracting information from C
> > source files without using a proper parser.  libclang can be accessed
> > from Python3 via its bindings and IIUC should be usable on all our
> > build platforms
> 
> Could you do something along the lines of ...
> 
>   (1) find constructors
>   (2) find type_register() calls in the constructor and the
>       TypeInfo structs passed to those calls.
>   (3) inspect the TypeInfo structs to figure the QOM type names.
> 
> ... with libclang?

In theory that should all be doable. I'm not very familiar myself with
libclang, but IIUC you basically get given the abstract syntax tree
and have to traverse it to find the info you want. This is kind of
low level but the info should all be there if you know how to find
it.

As an answer to (1) and part of (2), the following code I hacked up
quickly, finds all constructors that contain "type_register" calls.
Would need to find the arg to the calls and match that up to the
static structs too.


from clang.cindex import Index, CursorKind

def is_constructor(cursor):
    for bit in cursor.get_children():
        if bit.kind == CursorKind.UNEXPOSED_ATTR:
            for tok in bit.get_tokens():
                if tok.spelling == "constructor":
                    return True
    return False

def find_constructors(cursor):
    for cursor in cursor.get_children():
        if cursor.kind == CursorKind.FUNCTION_DECL:
            if is_constructor(cursor):
                yield cursor

def has_type_register(cursor):
    for cursor in constructor.get_children():
        if cursor.kind == CursorKind.COMPOUND_STMT:
            for c in cursor.get_children():
                if c.kind == CursorKind.CALL_EXPR:
                    if c.displayname == "type_register":
                        return True
    return False
                
index = Index.create()
tu = index.parse("demo.c")
for constructor in find_constructors(tu.cursor):
    has_reg = has_type_register(constructor)
    if has_reg:
        print("Constructor with type_register: " + constructor.displayname)


I tested with a short example

#include <stdio.h>

struct Foo {
  int bar;
};

static void type_register(struct Foo *foo) {
  printf("%d\n", foo->bar);
}
  
__attribute__((constructor)) static void startit(void) 
{
  static struct Foo foo = { 42 };
  type_register(&foo);
}

int main(int argc, char **argv) {
  printf("Running main\n");
}


$ python demo.py
Constructor with type register: startit()


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


