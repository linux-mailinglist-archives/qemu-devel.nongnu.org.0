Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26946C709D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 20:01:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfQAg-0007oC-EI; Thu, 23 Mar 2023 15:00:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pfQAc-0007ne-IG
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 15:00:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pfQAa-0000An-6v
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 15:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679598013;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ME1nHpj6hF6x98zY9Sk3408+bh75dOo4fRnfxhdo/YU=;
 b=UW2zx0vKEv7aUAJAL8rAwMjZce1Snh3dA/uW0LAEjKX09ucjfVK8TnUdW35MHO2DF1WDY3
 BOKuF5gXIsf7sf0ZpeEXVXP/EMbKagl0uGcomPXXD7SFj+R0nUAOXgjjap+Slt8+IGSiMa
 WlxPUYhHB4hOhXk5IHvHjrjhy9g9qJs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-75-PiAk7WoJPk-zBWTzNa4FBA-1; Thu, 23 Mar 2023 15:00:12 -0400
X-MC-Unique: PiAk7WoJPk-zBWTzNa4FBA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1FE12185A7A2
 for <qemu-devel@nongnu.org>; Thu, 23 Mar 2023 19:00:12 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 849F72166B29;
 Thu, 23 Mar 2023 19:00:11 +0000 (UTC)
Date: Thu, 23 Mar 2023 19:00:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH] Change the default for Mixed declarations.
Message-ID: <ZByhueDO9J9MLuSJ@redhat.com>
References: <20230214160738.88614-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230214160738.88614-1-quintela@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Feb 14, 2023 at 05:07:38PM +0100, Juan Quintela wrote:
> Hi
> 
> I want to enter a discussion about changing the default of the style
> guide.
> 
> There are several reasons for that:
> - they exist since C99 (i.e. all supported compilers support them)
> - they eliminate the posibility of an unitialized variable.

Actually they don't do that reliably. In fact, when combined
with usage of 'goto', they introduce uninitialized variables,
despite the declaration having an initialization present, and
thus actively mislead reviewers into thinking their code is
safe.

Consider this example:

#include <stdlib.h>
#include <stdio.h>

void foo(int something) {
  if (something == 8) {
    goto cleanup;
  }
  
  int nitems = 3;
  int *items = malloc(sizeof(int) *nitems);
       
  printf("Hello world %p\n", items);

 cleanup:
  printf("nitems=%d items=%p\n", nitems, items);
  if (nitems) {
    free(items);
  }
}

int main(int argc, char **argv) {
  foo(atoi(argv[1]));
  return 0;
}

Superficially everything looks awesome right - the variables are
all initialized at time of declaration after all.

$ gcc -Wall -o mixed mixed.c

$ ./mixed 3
Hello world 0x18ef2a0
nitems=3 items=0x18ef2a0

$ ./mixed 8
nitems=32677 items=0x7fa5a9209000
free(): invalid pointer
Aborted (core dumped)


What happens is that when you 'goto $LABEL' across a variable
declaration, the variable is in scope at your target label, but
its declared initializers never get run :-(

Luckily you can protect against that with gcc:

$ gcc -Wjump-misses-init -Wall -o mixed mixed.c
mixed.c: In function ‘foo’:
mixed.c:7:12: warning: jump skips variable initialization [-Wjump-misses-init]
    7 |            goto cleanup;
      |            ^~~~
mixed.c:15:5: note: label ‘cleanup’ defined here
   15 |     cleanup:
      |     ^~~~~~~
mixed.c:11:13: note: ‘items’ declared here
   11 |        int *items = malloc(sizeof(int) *nitems);
      |             ^~~~~
mixed.c:7:12: warning: jump skips variable initialization [-Wjump-misses-init]
    7 |            goto cleanup;
      |            ^~~~
mixed.c:15:5: note: label ‘cleanup’ defined here
   15 |     cleanup:
      |     ^~~~~~~
mixed.c:10:12: note: ‘nitems’ declared here
   10 |        int nitems = 3;
      |            ^~~~~~


however that will warn about *all* cases where we jump over a
declared variable, even if the variable we're jumping over is
not used at the target label location. IOW, it has significant
false positive rates. There are quite a few triggers for this
in the QEMU code already if we turn on this warning.

It also doesn't alter that the code initialization is misleading
to read.

> - (at least for me), declaring the index inside the for make clear
>   that index is not used outside the for.

I'll admit that declaring loop indexes in the for() is a nice
bit, but I'm not a fan in general of mixing the declarations
in the middle of code for projects that use the 'goto cleanup'
pattern.

> - Current documentation already declares that they are allowed in some
>   cases.
> - Lots of places already use them.
> 
> We can change the text to whatever you want, just wondering if it is
> valib to change the standard.
> 
> Doing a trivial grep through my local qemu messages (around 100k) it
> shows that some people are complaining that they are not allowed, and
> other saying that they are used all over the place.

IMHO the status quo is bad because it is actively dangerous when
combined with goto and we aren't using any compiler warnings to
help us.

Either we allow it, but use -Wjump-misses-init to prevent mixing
delayed declarations with gotos, and just avoid this when it triggers
a false positive.

Or we forbid it, rewrite current cases that use it, and then add
-Wdeclaration-after-statement to enforce it.


IMHO if we are concerned about uninitialized variables then I think
a better approach is to add -ftrivial-auto-var-init=zero, which will
make the compiler initialize all variables to 0 if they lack an
explicit initializer. 

> Discuss.
> ---
>  docs/devel/style.rst | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/docs/devel/style.rst b/docs/devel/style.rst
> index 68aa776930..dc248aa9e4 100644
> --- a/docs/devel/style.rst
> +++ b/docs/devel/style.rst
> @@ -202,15 +202,20 @@ Furthermore, it is the QEMU coding style.
>  Declarations
>  ============
>  
> -Mixed declarations (interleaving statements and declarations within
> -blocks) are generally not allowed; declarations should be at the beginning
> -of blocks.
> -
> -Every now and then, an exception is made for declarations inside a
> -#ifdef or #ifndef block: if the code looks nicer, such declarations can
> -be placed at the top of the block even if there are statements above.
> -On the other hand, however, it's often best to move that #ifdef/#ifndef
> -block to a separate function altogether.
> +Declaring variables at first use has two advantages:
> +- we can see the right type of the variable just to the use
> +- we completely remove the posibility of using a variable that is
> +  unitialized.
> +
> +It is especially the case when we are in a for statement.
> +
> +for (int i = X; i++; ..) {
> +    ...
> +}
> +
> +Makes clear visually that this variable is not useed outside of the for.
> +
> +Mixing declarations an code has been allowed since the C99 standard.
>  
>  Conditional statements
>  ======================
> -- 
> 2.39.1
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


