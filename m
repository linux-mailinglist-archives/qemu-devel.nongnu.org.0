Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE7831DA4D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 14:25:12 +0100 (CET)
Received: from localhost ([::1]:48434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCMpL-00019E-6H
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 08:25:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lCMnk-0000Td-W5
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:23:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:40950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lCMng-0001ue-L8
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 08:23:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613568205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZjwJMeoXvHqhv5VZL8fC2sFYM29Hvkmyy7YKLS5vLo4=;
 b=VOkh8DvwIygKm/OAsHsByKwTR4MIz7M302KPUfSxDy1/Xdq/JWpl2sHdVhiUad0J+JJFDa
 50IEOowPXNLYwRL89gUSD14qVpZMklfcSjp9C0Zb5IXLxSye9pCG2l5G2OBlLRujECAZxt
 G5LUNIOqPKffuGnotTJQCuIxOHXl9hs=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-VMc1XAAaNMaZZ9lv9t9Chw-1; Wed, 17 Feb 2021 08:23:21 -0500
X-MC-Unique: VMc1XAAaNMaZZ9lv9t9Chw-1
Received: by mail-il1-f198.google.com with SMTP id q3so10251970ilv.16
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 05:23:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZjwJMeoXvHqhv5VZL8fC2sFYM29Hvkmyy7YKLS5vLo4=;
 b=R9J1TDbHWWFZ720X//pW20QZmVh4ssyY7z4iC070OxCWCaqPmP0XVg2ujsrzTEaNwI
 gNH2B65x0s4YMQ8C4Hd92GCgwuG+C2AHomuYdAwWpA2K0hs7uPumzAYia/HlGiAS9P8S
 ANScITX+BcJ/vWFPlfktWtL8w7lUocWAqWv9FBzYI84F3vTn/YOoj/BaB5haZiFtFGZD
 EDkIha6/g3TXFf0tMfP01MNJCwXfCmThnnRaunNIBxBS0tMCxbvbePtT3pVfvI7HVk1H
 WKmaDhvlaqisTHPxET7kUZpDn0VqD/g3uvDcY0q+jWJN/l8qwpF0xfg4LH0GQP9PZYxg
 r+nQ==
X-Gm-Message-State: AOAM531EoVvz0cMvR3IrZSbVYZLyFYeOVMJhHAtYl+w5a4TzEfW4qOaX
 vF+/ZfL1CdAwH4po7T7GuRLYjtjb78pZwuZmIcEsFqRvIxuiLOXveXE8sfvnKhB5Rda5o7ISAJD
 fbRAQLd57iNYjnZAPz+jRqOX7bIAxceo=
X-Received: by 2002:a02:9425:: with SMTP id a34mr3715952jai.79.1613568199723; 
 Wed, 17 Feb 2021 05:23:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmKIly7ilkCssek5RZ4BhS192U+xhPHCsA9f6CF1lOiCX8jmzymIP4Se0jVXkXwc5EGyu8e7Ccf2jQ8hNsXn8=
X-Received: by 2002:a02:9425:: with SMTP id a34mr3715940jai.79.1613568199584; 
 Wed, 17 Feb 2021 05:23:19 -0800 (PST)
MIME-Version: 1.0
References: <20210217082403.2414858-1-marcandre.lureau@redhat.com>
 <YCz0hteZzJXwp1zM@redhat.com>
In-Reply-To: <YCz0hteZzJXwp1zM@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 17 Feb 2021 17:23:08 +0400
Message-ID: <CAMxuvazbqvRYi+UD5V-9CSu05fGiqZEtk91_aH3CxaVJz4zTOQ@mail.gmail.com>
Subject: Re: [PATCH] util: fix use-after-free in module_load_one
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005b78a205bb881f8c"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: "Bonzini, Paolo" <pbonzini@redhat.com>, "Hoffmann,
 Gerd" <kraxel@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005b78a205bb881f8c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 17, 2021 at 2:48 PM Daniel P. Berrang=C3=A9 <berrange@redhat.co=
m>
wrote:

> On Wed, Feb 17, 2021 at 12:24:03PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >
> > Spotted by ASAN:
> >
> > =3D=3D2407186=3D=3DERROR: AddressSanitizer: heap-use-after-free on addr=
ess
> 0x6020003ac4f0 at pc 0x7ffff766659c bp 0x7fffffffd1d0 sp 0x7fffffffc980
> > READ of size 1 at 0x6020003ac4f0 thread T0
> >     #0 0x7ffff766659b  (/lib64/libasan.so.6+0x8a59b)
> >     #1 0x7ffff6bfa843 in g_str_equal ../glib/ghash.c:2303
> >     #2 0x7ffff6bf8167 in g_hash_table_lookup_node ../glib/ghash.c:493
> >     #3 0x7ffff6bf9b78 in g_hash_table_insert_internal
> ../glib/ghash.c:1598
> >     #4 0x7ffff6bf9c32 in g_hash_table_add ../glib/ghash.c:1689
> >     #5 0x5555596caad4 in module_load_one ../util/module.c:233
> >     #6 0x5555596ca949 in module_load_one ../util/module.c:225
> >     #7 0x5555596ca949 in module_load_one ../util/module.c:225
> >     #8 0x5555596cbdf4 in module_load_qom_all ../util/module.c:349
> >     #9 0x5555593c6bbc in qmp_qom_list_types ../qom/qom-qmp-cmds.c:114
> >     #10 0x5555595576df in qmp_marshal_qom_list_types
> qapi/qapi-commands-qom.c:194
> >     #11 0x555559772868 in do_qmp_dispatch_bh ../qapi/qmp-dispatch.c:110
> >     #12 0x5555596f8786 in aio_bh_call ../util/async.c:136
> >     #13 0x5555596f8e9b in aio_bh_poll ../util/async.c:164
> >     #14 0x555559685803 in aio_dispatch ../util/aio-posix.c:381
> >     #15 0x5555596fa324 in aio_ctx_dispatch ../util/async.c:306
> >     #16 0x7ffff6c0deda in g_main_dispatch ../glib/gmain.c:3337
> >     #17 0x7ffff6c0edfd in g_main_context_dispatch ../glib/gmain.c:4055
> >     #18 0x555559726c66 in glib_pollfds_poll ../util/main-loop.c:232
> >     #19 0x555559726e43 in os_host_main_loop_wait ../util/main-loop.c:25=
5
> >     #20 0x555559727139 in main_loop_wait ../util/main-loop.c:531
> >     #21 0x555558fb46fc in qemu_main_loop ../softmmu/runstate.c:722
> >     #22 0x555557d45065 in main ../softmmu/main.c:50
> >     #23 0x7ffff59611e1 in __libc_start_main (/lib64/libc.so.6+0x281e1)
> >     #24 0x555557d44f7d in _start
> (/home/elmarco/src/qemu/build/qemu-system-x86_64+0x27f0f7d)
> >
> > 0x6020003ac4f0 is located 0 bytes inside of 10-byte region
> [0x6020003ac4f0,0x6020003ac4fa)
> > freed by thread T0 here:
> >     #0 0x7ffff76870c7 in __interceptor_free (/lib64/libasan.so.6+0xab0c=
7)
> >     #1 0x7ffff6c16d94 in g_free ../glib/gmem.c:199
> >     #2 0x5555596caae7 in module_load_one ../util/module.c:234
> >     #3 0x5555596ca949 in module_load_one ../util/module.c:225
> >     #4 0x5555596ca949 in module_load_one ../util/module.c:225
> >     #5 0x5555596cbdf4 in module_load_qom_all ../util/module.c:349
> >     #6 0x5555593c6bbc in qmp_qom_list_types ../qom/qom-qmp-cmds.c:114
> >     #7 0x5555595576df in qmp_marshal_qom_list_types
> qapi/qapi-commands-qom.c:194
> >     #8 0x555559772868 in do_qmp_dispatch_bh ../qapi/qmp-dispatch.c:110
> >     #9 0x5555596f8786 in aio_bh_call ../util/async.c:136
> >     #10 0x5555596f8e9b in aio_bh_poll ../util/async.c:164
> >     #11 0x555559685803 in aio_dispatch ../util/aio-posix.c:381
> >     #12 0x5555596fa324 in aio_ctx_dispatch ../util/async.c:306
> >     #13 0x7ffff6c0deda in g_main_dispatch ../glib/gmain.c:3337
> >     #14 0x7ffff6c0edfd in g_main_context_dispatch ../glib/gmain.c:4055
> >     #15 0x555559726c66 in glib_pollfds_poll ../util/main-loop.c:232
> >     #16 0x555559726e43 in os_host_main_loop_wait ../util/main-loop.c:25=
5
> >     #17 0x555559727139 in main_loop_wait ../util/main-loop.c:531
> >     #18 0x555558fb46fc in qemu_main_loop ../softmmu/runstate.c:722
> >     #19 0x555557d45065 in main ../softmmu/main.c:50
> >     #20 0x7ffff59611e1 in __libc_start_main (/lib64/libc.so.6+0x281e1)
> >
> > Typical C bug...
>
> This commit message isn't really helping explain the problem.
> Rather than this huge trace which readers have to then debug,
> can we actually say what is wrong.
>
> After reading the docs it seems the problem is as follows:
>
>   "g_hash_table_add always retains ownership of the pointer
>    passed in as the key. Its return status merely indicates
>    whether the added entry was new, or replaced an existing
>    entry. Thus key must never be freed after this method
>    returns."
>
>
Correct, thanks for spelling it out. I can include in the commit and
resend, unless the maintainer (who?.. hmm Paolo?) does it on picking?

thanks

>
> > Fixes: 90629122d2e ("module: use g_hash_table_add()")
> > Cc: qemu-stable@nongnu.org
> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> > ---
> >  util/module.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/util/module.c b/util/module.c
> > index c65060c167..a2ab0bcdbc 100644
> > --- a/util/module.c
> > +++ b/util/module.c
> > @@ -230,10 +230,11 @@ bool module_load_one(const char *prefix, const
> char *lib_name, bool mayfail)
> >          }
> >      }
> >
> > -    if (!g_hash_table_add(loaded_modules, module_name)) {
> > +    if (g_hash_table_contains(loaded_modules, module_name)) {
> >          g_free(module_name);
> >          return true;
> >      }
> > +    g_hash_table_add(loaded_modules, module_name);
> >
> >      search_dir =3D getenv("QEMU_MODULE_DIR");
> >      if (search_dir !=3D NULL) {
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--0000000000005b78a205bb881f8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 17, 2021 at 2:48 PM Danie=
l P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, Feb 17, 2021 at 12:24:03PM +0400, <a href=3D"mailto:marcandre=
.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote=
:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Spotted by ASAN:<br>
&gt; <br>
&gt; =3D=3D2407186=3D=3DERROR: AddressSanitizer: heap-use-after-free on add=
ress 0x6020003ac4f0 at pc 0x7ffff766659c bp 0x7fffffffd1d0 sp 0x7fffffffc98=
0<br>
&gt; READ of size 1 at 0x6020003ac4f0 thread T0<br>
&gt;=C2=A0 =C2=A0 =C2=A0#0 0x7ffff766659b=C2=A0 (/lib64/libasan.so.6+0x8a59=
b)<br>
&gt;=C2=A0 =C2=A0 =C2=A0#1 0x7ffff6bfa843 in g_str_equal ../glib/ghash.c:23=
03<br>
&gt;=C2=A0 =C2=A0 =C2=A0#2 0x7ffff6bf8167 in g_hash_table_lookup_node ../gl=
ib/ghash.c:493<br>
&gt;=C2=A0 =C2=A0 =C2=A0#3 0x7ffff6bf9b78 in g_hash_table_insert_internal .=
./glib/ghash.c:1598<br>
&gt;=C2=A0 =C2=A0 =C2=A0#4 0x7ffff6bf9c32 in g_hash_table_add ../glib/ghash=
.c:1689<br>
&gt;=C2=A0 =C2=A0 =C2=A0#5 0x5555596caad4 in module_load_one ../util/module=
.c:233<br>
&gt;=C2=A0 =C2=A0 =C2=A0#6 0x5555596ca949 in module_load_one ../util/module=
.c:225<br>
&gt;=C2=A0 =C2=A0 =C2=A0#7 0x5555596ca949 in module_load_one ../util/module=
.c:225<br>
&gt;=C2=A0 =C2=A0 =C2=A0#8 0x5555596cbdf4 in module_load_qom_all ../util/mo=
dule.c:349<br>
&gt;=C2=A0 =C2=A0 =C2=A0#9 0x5555593c6bbc in qmp_qom_list_types ../qom/qom-=
qmp-cmds.c:114<br>
&gt;=C2=A0 =C2=A0 =C2=A0#10 0x5555595576df in qmp_marshal_qom_list_types qa=
pi/qapi-commands-qom.c:194<br>
&gt;=C2=A0 =C2=A0 =C2=A0#11 0x555559772868 in do_qmp_dispatch_bh ../qapi/qm=
p-dispatch.c:110<br>
&gt;=C2=A0 =C2=A0 =C2=A0#12 0x5555596f8786 in aio_bh_call ../util/async.c:1=
36<br>
&gt;=C2=A0 =C2=A0 =C2=A0#13 0x5555596f8e9b in aio_bh_poll ../util/async.c:1=
64<br>
&gt;=C2=A0 =C2=A0 =C2=A0#14 0x555559685803 in aio_dispatch ../util/aio-posi=
x.c:381<br>
&gt;=C2=A0 =C2=A0 =C2=A0#15 0x5555596fa324 in aio_ctx_dispatch ../util/asyn=
c.c:306<br>
&gt;=C2=A0 =C2=A0 =C2=A0#16 0x7ffff6c0deda in g_main_dispatch ../glib/gmain=
.c:3337<br>
&gt;=C2=A0 =C2=A0 =C2=A0#17 0x7ffff6c0edfd in g_main_context_dispatch ../gl=
ib/gmain.c:4055<br>
&gt;=C2=A0 =C2=A0 =C2=A0#18 0x555559726c66 in glib_pollfds_poll ../util/mai=
n-loop.c:232<br>
&gt;=C2=A0 =C2=A0 =C2=A0#19 0x555559726e43 in os_host_main_loop_wait ../uti=
l/main-loop.c:255<br>
&gt;=C2=A0 =C2=A0 =C2=A0#20 0x555559727139 in main_loop_wait ../util/main-l=
oop.c:531<br>
&gt;=C2=A0 =C2=A0 =C2=A0#21 0x555558fb46fc in qemu_main_loop ../softmmu/run=
state.c:722<br>
&gt;=C2=A0 =C2=A0 =C2=A0#22 0x555557d45065 in main ../softmmu/main.c:50<br>
&gt;=C2=A0 =C2=A0 =C2=A0#23 0x7ffff59611e1 in __libc_start_main (/lib64/lib=
c.so.6+0x281e1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0#24 0x555557d44f7d in _start (/home/elmarco/src/qem=
u/build/qemu-system-x86_64+0x27f0f7d)<br>
&gt; <br>
&gt; 0x6020003ac4f0 is located 0 bytes inside of 10-byte region [0x6020003a=
c4f0,0x6020003ac4fa)<br>
&gt; freed by thread T0 here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0#0 0x7ffff76870c7 in __interceptor_free (/lib64/lib=
asan.so.6+0xab0c7)<br>
&gt;=C2=A0 =C2=A0 =C2=A0#1 0x7ffff6c16d94 in g_free ../glib/gmem.c:199<br>
&gt;=C2=A0 =C2=A0 =C2=A0#2 0x5555596caae7 in module_load_one ../util/module=
.c:234<br>
&gt;=C2=A0 =C2=A0 =C2=A0#3 0x5555596ca949 in module_load_one ../util/module=
.c:225<br>
&gt;=C2=A0 =C2=A0 =C2=A0#4 0x5555596ca949 in module_load_one ../util/module=
.c:225<br>
&gt;=C2=A0 =C2=A0 =C2=A0#5 0x5555596cbdf4 in module_load_qom_all ../util/mo=
dule.c:349<br>
&gt;=C2=A0 =C2=A0 =C2=A0#6 0x5555593c6bbc in qmp_qom_list_types ../qom/qom-=
qmp-cmds.c:114<br>
&gt;=C2=A0 =C2=A0 =C2=A0#7 0x5555595576df in qmp_marshal_qom_list_types qap=
i/qapi-commands-qom.c:194<br>
&gt;=C2=A0 =C2=A0 =C2=A0#8 0x555559772868 in do_qmp_dispatch_bh ../qapi/qmp=
-dispatch.c:110<br>
&gt;=C2=A0 =C2=A0 =C2=A0#9 0x5555596f8786 in aio_bh_call ../util/async.c:13=
6<br>
&gt;=C2=A0 =C2=A0 =C2=A0#10 0x5555596f8e9b in aio_bh_poll ../util/async.c:1=
64<br>
&gt;=C2=A0 =C2=A0 =C2=A0#11 0x555559685803 in aio_dispatch ../util/aio-posi=
x.c:381<br>
&gt;=C2=A0 =C2=A0 =C2=A0#12 0x5555596fa324 in aio_ctx_dispatch ../util/asyn=
c.c:306<br>
&gt;=C2=A0 =C2=A0 =C2=A0#13 0x7ffff6c0deda in g_main_dispatch ../glib/gmain=
.c:3337<br>
&gt;=C2=A0 =C2=A0 =C2=A0#14 0x7ffff6c0edfd in g_main_context_dispatch ../gl=
ib/gmain.c:4055<br>
&gt;=C2=A0 =C2=A0 =C2=A0#15 0x555559726c66 in glib_pollfds_poll ../util/mai=
n-loop.c:232<br>
&gt;=C2=A0 =C2=A0 =C2=A0#16 0x555559726e43 in os_host_main_loop_wait ../uti=
l/main-loop.c:255<br>
&gt;=C2=A0 =C2=A0 =C2=A0#17 0x555559727139 in main_loop_wait ../util/main-l=
oop.c:531<br>
&gt;=C2=A0 =C2=A0 =C2=A0#18 0x555558fb46fc in qemu_main_loop ../softmmu/run=
state.c:722<br>
&gt;=C2=A0 =C2=A0 =C2=A0#19 0x555557d45065 in main ../softmmu/main.c:50<br>
&gt;=C2=A0 =C2=A0 =C2=A0#20 0x7ffff59611e1 in __libc_start_main (/lib64/lib=
c.so.6+0x281e1)<br>
&gt; <br>
&gt; Typical C bug...<br>
<br>
This commit message isn&#39;t really helping explain the problem.<br>
Rather than this huge trace which readers have to then debug,<br>
can we actually say what is wrong.<br>
<br>
After reading the docs it seems the problem is as follows:<br>
<br>
=C2=A0 &quot;g_hash_table_add always retains ownership of the pointer<br>
=C2=A0 =C2=A0passed in as the key. Its return status merely indicates<br>
=C2=A0 =C2=A0whether the added entry was new, or replaced an existing<br>
=C2=A0 =C2=A0entry. Thus key must never be freed after this method<br>
=C2=A0 =C2=A0returns.&quot;<br>
<br></blockquote><div><br></div><div>Correct, thanks for spelling it out. I=
 can include in the commit and resend, unless the maintainer (who?.. hmm Pa=
olo?) does it on picking?</div><div><br></div><div>thanks<br></div><div> <b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Fixes: 90629122d2e (&quot;module: use g_hash_table_add()&quot;)<br>
&gt; Cc: <a href=3D"mailto:qemu-stable@nongnu.org" target=3D"_blank">qemu-s=
table@nongnu.org</a><br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 util/module.c | 3 ++-<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/util/module.c b/util/module.c<br>
&gt; index c65060c167..a2ab0bcdbc 100644<br>
&gt; --- a/util/module.c<br>
&gt; +++ b/util/module.c<br>
&gt; @@ -230,10 +230,11 @@ bool module_load_one(const char *prefix, const c=
har *lib_name, bool mayfail)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 if (!g_hash_table_add(loaded_modules, module_name)) {<b=
r>
&gt; +=C2=A0 =C2=A0 if (g_hash_table_contains(loaded_modules, module_name))=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(module_name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return true;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 g_hash_table_add(loaded_modules, module_name);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 search_dir =3D getenv(&quot;QEMU_MODULE_DIR&quot;)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (search_dir !=3D NULL) {<br>
<br>
Reviewed-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.=
com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
<br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div>

--0000000000005b78a205bb881f8c--


