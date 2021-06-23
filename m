Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1B33B1BE6
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 16:02:29 +0200 (CEST)
Received: from localhost ([::1]:42122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw3SW-0005hq-VN
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 10:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lw3RN-000516-LY
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:01:17 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:44599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lw3RD-0003ej-3K
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:01:17 -0400
Received: by mail-io1-xd31.google.com with SMTP id h2so3511552iob.11
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 07:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qKng8Ity78W+pOmQRTqvA1PTzb00GISdJ3usfb+AVyE=;
 b=N8Yg21uomgKByVem8rWqpeVCz9qy1e55ctjyT7mpJAcgS3mY+yKaPoGXvzThIg1U1P
 B0mqtOl/g3f9euzWXxQkao1zTV389Z4OMHiF3iepXS8vgUAgs/6HCaJsYH4jV5Kc91Sb
 Zulp/czRiW0CjL2pZQMspd6Jd7vYTsLqb5Uy4D9eSdfymg25v6InQ0WcPP76587plrVZ
 ljaTOpeyGPnY4jHyCr74jkHu+esPjXn+Cl8Qldkbp0l1XKqp+VhBuM6jXZ3tsXoX4ujI
 JHkNexj8t+6Ld1lU7tWSpElvdIEhYI6W3BYwLsdJzLrgdY7Hxa2pREwq4i5MWOQsYUIe
 nijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qKng8Ity78W+pOmQRTqvA1PTzb00GISdJ3usfb+AVyE=;
 b=WHk7JEvNuFU33KDRXkxQiGesUqH+YWVU6JSs/YyXzjqUjl86GFD4ZCKN5f8xdTckCz
 azNlDfMiMEohxBkwglCtm0z2zQ7sEg2Ov24eO6ORz/lWFOToH9Rc0W6/yj8VAb3Oi/oa
 Y/Fzoo4k1AYp8rYwQJnqUVwDflN5n9zK20g9732/7jAwbXEgB/7iKnbCoipBdR0FiMF7
 kwn+8RuKMzeBmOyWCKPSDEVa+6KhMyxnLiYf5ufQ2yn7HqMDWLPdxWvN5YDjjVH1AoRR
 G/YPOtU2ZrVgC5b4Vzec0sUPsVyKMzdyEC8dabnaCqSOlVsy+pIO3eAC2qDkNuE3OL9j
 aK9g==
X-Gm-Message-State: AOAM531AcRDntwxikNa97H6G7No0O++mixPHAVY7tklT8ztVAJQ6FdnR
 cM8AIbGzFFCWO2G1+yhg3oSnNlMRYsFskw2VYJvQIRJxUCXr2w==
X-Google-Smtp-Source: ABdhPJzMWt9EHNEmjTtQTkMEPOCUJyYJ6bXwkGscs/j/6kxHZMla9mQGU7EBfqiIbYIB+PdVKRqJ+hHvasJGHLa2dV0=
X-Received: by 2002:a6b:6205:: with SMTP id f5mr7292716iog.60.1624456864436;
 Wed, 23 Jun 2021 07:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210623125458.450462-1-ma.mandourr@gmail.com>
 <20210623125458.450462-5-ma.mandourr@gmail.com>
In-Reply-To: <20210623125458.450462-5-ma.mandourr@gmail.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Wed, 23 Jun 2021 16:00:53 +0200
Message-ID: <CAD-LL6hVjtMvxE8VZ5-k=HzogNHQkRhGkj-BcKLUULGgkk0J+w@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] docs/devel: Added cache plugin to the plugins docs
To: "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000005b932005c56f56a1"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d31;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005b932005c56f56a1
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 23, 2021 at 2:55 PM Mahmoud Mandour <ma.mandourr@gmail.com>
wrote:

> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>  docs/devel/tcg-plugins.rst | 60 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>
> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
> index 18c6581d85..9d90110cbf 100644
> --- a/docs/devel/tcg-plugins.rst
> +++ b/docs/devel/tcg-plugins.rst
> @@ -319,3 +319,63 @@ the user to see what hardware is accessed how often.
> It has a number of options:
>        off:0000001c, 1, 2
>        off:00000020, 1, 2
>        ...
> +
> +- contrib/plugins/cache
> +
> +Cache modelling plugin that measures the performance of a given cache
> +configuration when a given working set is run::
> +
> +    ./qemu-x86_64 -plugin ./libcache.so -d plugin -D cache.log \
> +    ./build/tests/tcg/x86_64-linux-user/float_convs
> +
>

Oops that's a wrong command... Should've been

./x86_64-linux-user/qemu-x86_64 -plugin ./contrib/plugins/libcache.so -d
plugin -D cache.log \
./tests/tcg/x86_64-linux-user/float_convs

If you find the patch suitable and can edit the command before queueing it,
otherwise tell me
if you want me to resend :)


> +
> +will report the following::
> +
> +    Data accesses: 996479, Misses: 507
> +    Miss rate: 0.050879%
> +
> +    Instruction accesses: 2641737, Misses: 18617
> +    Miss rate: 0.704726%
> +
> +    address, data misses, instruction
> +    0x424f1e (_int_malloc), 109, movq %rax, 8(%rcx)
> +    0x41f395 (_IO_default_xsputn), 49, movb %dl, (%rdi, %rax)
> +    0x42584d (ptmalloc_init.part.0), 33, movaps %xmm0, (%rax)
> +    0x454d48 (__tunables_init), 20, cmpb $0, (%r8)
> +    ...
> +
> +    address, fetch misses, instruction
> +    0x4160a0 (__vfprintf_internal), 744, movl $1, %ebx
> +    0x41f0a0 (_IO_setb), 744, endbr64
> +    0x415882 (__vfprintf_internal), 744, movq %r12, %rdi
> +    0x4268a0 (__malloc), 696, andq $0xfffffffffffffff0, %rax
> +    ...
> +
> +The plugin has a number of arguments, all of them are optional:
> +
> +  * arg="limit=N"
> +
> +  Print top N icache and dcache thrashing instructions along with their
> +  address, number of misses, and its disassembly. (default: 32)
> +
> +  * arg="icachesize=N"
> +  * arg="iblksize=B"
> +  * arg="iassoc=A"
> +
> +  Instruction cache configuration arguments. They specify the cache size,
> block
> +  size, and associativity of the instruction cache, respectively.
> +  (default: N = 16384, B = 64, A = 8)
> +
> +  * arg="dcachesize=N"
> +  * arg="dblksize=B"
> +  * arg="dassoc=A"
> +
> +  Data cache configuration arguments. They specify the cache size, block
> size,
> +  and associativity of the data cache, respectively.
> +  (default: N = 16384, B = 64, A = 8)
> +
> +  * arg="evict=POLICY"
> +
> +  Sets the eviction policy to POLICY. Available policies are: :code:`lru`,
> +  :code:`fifo`, and :code:`rand`. The plugin will use the specified
> policy for
> +  both instruction and data caches. (default: POLICY = :code:`lru`)
> --
> 2.25.1
>
>

--0000000000005b932005c56f56a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 23, 2021 at 2:55 PM Mahmo=
ud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com">ma.mandourr@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.co=
m" target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
---<br>
=C2=A0docs/devel/tcg-plugins.rst | 60 +++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A01 file changed, 60 insertions(+)<br>
<br>
diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst<br>
index 18c6581d85..9d90110cbf 100644<br>
--- a/docs/devel/tcg-plugins.rst<br>
+++ b/docs/devel/tcg-plugins.rst<br>
@@ -319,3 +319,63 @@ the user to see what hardware is accessed how often. I=
t has a number of options:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0off:0000001c, 1, 2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0off:00000020, 1, 2<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
+<br>
+- contrib/plugins/cache<br>
+<br>
+Cache modelling plugin that measures the performance of a given cache<br>
+configuration when a given working set is run::<br>
+<br>
+=C2=A0 =C2=A0 ./qemu-x86_64 -plugin ./libcache.so -d plugin -D cache.log \=
<br>
+=C2=A0 =C2=A0 ./build/tests/tcg/x86_64-linux-user/float_convs<br>
+<br></blockquote><div><br></div><div>Oops that&#39;s a wrong command... Sh=
ould&#39;ve been</div><div><br></div><div>./x86_64-linux-user/qemu-x86_64 -=
plugin ./contrib/plugins/libcache.so -d plugin -D cache.log \<br></div><div=
>./tests/tcg/x86_64-linux-user/float_convs</div><div><br></div><div>If you =
find the patch suitable and can edit the command before queueing it, otherw=
ise tell me=C2=A0</div><div>if you want me to resend :)</div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+will report the following::<br>
+<br>
+=C2=A0 =C2=A0 Data accesses: 996479, Misses: 507<br>
+=C2=A0 =C2=A0 Miss rate: 0.050879%<br>
+<br>
+=C2=A0 =C2=A0 Instruction accesses: 2641737, Misses: 18617<br>
+=C2=A0 =C2=A0 Miss rate: 0.704726%<br>
+<br>
+=C2=A0 =C2=A0 address, data misses, instruction<br>
+=C2=A0 =C2=A0 0x424f1e (_int_malloc), 109, movq %rax, 8(%rcx)<br>
+=C2=A0 =C2=A0 0x41f395 (_IO_default_xsputn), 49, movb %dl, (%rdi, %rax)<br=
>
+=C2=A0 =C2=A0 0x42584d (ptmalloc_init.part.0), 33, movaps %xmm0, (%rax)<br=
>
+=C2=A0 =C2=A0 0x454d48 (__tunables_init), 20, cmpb $0, (%r8)<br>
+=C2=A0 =C2=A0 ...<br>
+<br>
+=C2=A0 =C2=A0 address, fetch misses, instruction<br>
+=C2=A0 =C2=A0 0x4160a0 (__vfprintf_internal), 744, movl $1, %ebx<br>
+=C2=A0 =C2=A0 0x41f0a0 (_IO_setb), 744, endbr64<br>
+=C2=A0 =C2=A0 0x415882 (__vfprintf_internal), 744, movq %r12, %rdi<br>
+=C2=A0 =C2=A0 0x4268a0 (__malloc), 696, andq $0xfffffffffffffff0, %rax<br>
+=C2=A0 =C2=A0 ...<br>
+<br>
+The plugin has a number of arguments, all of them are optional:<br>
+<br>
+=C2=A0 * arg=3D&quot;limit=3DN&quot;<br>
+<br>
+=C2=A0 Print top N icache and dcache thrashing instructions along with the=
ir<br>
+=C2=A0 address, number of misses, and its disassembly. (default: 32)<br>
+<br>
+=C2=A0 * arg=3D&quot;icachesize=3DN&quot;<br>
+=C2=A0 * arg=3D&quot;iblksize=3DB&quot;<br>
+=C2=A0 * arg=3D&quot;iassoc=3DA&quot;<br>
+<br>
+=C2=A0 Instruction cache configuration arguments. They specify the cache s=
ize, block<br>
+=C2=A0 size, and associativity of the instruction cache, respectively.<br>
+=C2=A0 (default: N =3D 16384, B =3D 64, A =3D 8)<br>
+<br>
+=C2=A0 * arg=3D&quot;dcachesize=3DN&quot;<br>
+=C2=A0 * arg=3D&quot;dblksize=3DB&quot;<br>
+=C2=A0 * arg=3D&quot;dassoc=3DA&quot;<br>
+<br>
+=C2=A0 Data cache configuration arguments. They specify the cache size, bl=
ock size,<br>
+=C2=A0 and associativity of the data cache, respectively.<br>
+=C2=A0 (default: N =3D 16384, B =3D 64, A =3D 8)<br>
+<br>
+=C2=A0 * arg=3D&quot;evict=3DPOLICY&quot;<br>
+<br>
+=C2=A0 Sets the eviction policy to POLICY. Available policies are: :code:`=
lru`,<br>
+=C2=A0 :code:`fifo`, and :code:`rand`. The plugin will use the specified p=
olicy for<br>
+=C2=A0 both instruction and data caches. (default: POLICY =3D :code:`lru`)=
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000005b932005c56f56a1--

