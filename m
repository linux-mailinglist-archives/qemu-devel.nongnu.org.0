Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C32BB374756
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 19:59:42 +0200 (CEST)
Received: from localhost ([::1]:44704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leLoD-0005bA-TR
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 13:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1leLl3-0004ME-TM
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:56:26 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:41712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1leLl1-0001bp-F2
 for qemu-devel@nongnu.org; Wed, 05 May 2021 13:56:25 -0400
Received: by mail-io1-xd32.google.com with SMTP id n10so2429523ion.8
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 10:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=agnhvK0NV5U5zw5S3UkzHacHKvDMnNzeb6XKruEWECs=;
 b=i6Jjqdwbbt7qF5HiXErqGVa5P9GKK0reWXBVUvp/roiCeQBHHxbuX9djjRf2wH2Crh
 LrPPttbglUJOnaLGTp0gNXO31AS5sKMMjr3Sa4ohtx46dtVweSn1WA0dFxhYz3OreI4J
 g5CdCLD6OR6QB0/TMjVD8qtvCS39RGqx3rnQIOonEjP4uB/HbadP0gfoZfoRJw+y0wqb
 o6lM7pKBZugv1rTOP4+QbqfAmMC/8P5RVI4skQEG5XjoU1NFIhh0DakjFbWf0zVJFVCp
 HnnXXr3bUGX8yYtTIbI3ti3kfUsKwH0AdNsSmPrq4fwSfAjSnYGcvN7tvnZKFxP6sk6Q
 JGlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=agnhvK0NV5U5zw5S3UkzHacHKvDMnNzeb6XKruEWECs=;
 b=Kz0bOqAcPOTEmjM1mYXnOnw/WjvY/+SQEzAuVr4c8L+LoX+7fXaHkKPTmIcZj/ad5k
 g7AO18MzWBqD1J7mKLcks8MFcxdDnnxxH4W76E8/pXRmHhi/u7+p4RqKjDNuFzbLfy/f
 Z5svic9I3eO2+xm2Ym0vEGI4aY3jtI4N7nWmLICnXZv4EoXxZKHnIKa0HsfolMuLa9cH
 JQFyN2Ulmfp2Y6G6SxcKvd5fHgWZUrD1ADWy5qKrfIJm5CHvwtnxtfCMUos00UjwMJIs
 ITvISetfYnF3/tt0yW0WpbLDGq3kd4DWR8DLo2km/9VuwutiLGhtzxb6+1OBZ1QqlweT
 2GrQ==
X-Gm-Message-State: AOAM533A5irA1ajJbzQrdCgY04Qsi7oApghsoafsJalRq078cBOg2Pt0
 7Byui7wH8XcoAFV3frcKRU9y7JCjoLlTHmsXf7Y=
X-Google-Smtp-Source: ABdhPJxP+niQ9tObrwNkFEgBWvw3ubu7pq/nyZIEn90eaBLO0wQRXS0Qjwgxf2LDJppQgL/kLjSyS8Tp4hZ3K5WZZBo=
X-Received: by 2002:a02:ceb5:: with SMTP id z21mr9924568jaq.72.1620237381575; 
 Wed, 05 May 2021 10:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210420115433.12148-1-ma.mandourr@gmail.com>
 <87fsz1nwqv.fsf@linaro.org>
In-Reply-To: <87fsz1nwqv.fsf@linaro.org>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Wed, 5 May 2021 19:56:10 +0200
Message-ID: <CAD-LL6g8MgXWEr1H8Dgx15nnHJKhtcZBMhefXquJG_FEYgFPGA@mail.gmail.com>
Subject: Re: [PATCH v3] plugins/syscall: Added a table-like summary output
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000094d9b005c198e94e"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd32.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000094d9b005c198e94e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 5, 2021 at 3:19 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

>
> Mahmoud Mandour <ma.mandourr@gmail.com> writes:
>
> > Added a table-like output which contains the total number of calls
> > for each used syscall along with the number of errors that occurred.
> >
> > Per-call tracing is still available through supplying the argument
> > ``print`` to the plugin.
> >
> > Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> > ---
> <snip>
> > +
> > +void print_entry(gpointer val, gpointer user_data)
> >  {
> >      g_autofree gchar *out;
> > -    out =3D g_strdup_printf("syscall #%" PRIi64 " returned -> %" PRIi6=
4
> "\n",
> > -            num, ret);
> > +    SyscallStats *entry =3D (SyscallStats *) val;
> > +    int64_t syscall_num =3D entry->num;
> > +    out =3D g_strdup_printf(
> > +        "%-13" PRIi64 "%-6" PRIi64 " %" PRIi64 "\n",
> > +        syscall_num, entry->calls, entry->errors);
> >      qemu_plugin_outs(out);
> >  }
>
> This still fails to compile due to a missing static:
>
> [2/10] Compiling C object tests/plugin/libsyscall.so.p/syscall.c.o
> FAILED: tests/plugin/libsyscall.so.p/syscall.c.o
> cc -Itests/plugin/libsyscall.so.p -Itests/plugin -I../../tests/plugin
> -I../../include/qemu -I/usr/include/glib-2.0
> -I/usr/lib/x86_64-linux-gnu/glib-2.0/include -fdiagnostics-color=3Dauto -=
pipe
> -Wall -Winvalid-pch -Werror -std=3Dgnu99 -O2 -g -isystem
> /home/alex/lsrc/qemu.git/linux-headers -isystem linux-headers -iquote .
> -iquote /home/alex/lsrc/qemu.git -iquote /home/alex/lsrc/qemu.git/include
> -iquote /home/alex/lsrc/qemu.git/disas/libvixl -iquote
> /home/alex/lsrc/qemu.git/tcg/i386 -pthread -U_FORTIFY_SOURCE
> -D_FORTIFY_SOURCE=3D2 -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64
> -D_LARGEFILE_SOURCE -Wstrict-prototypes -Wredundant-decls -Wundef
> -Wwrite-strings -Wmissing-prototypes -fno-strict-aliasing -fno-common
> -fwrapv -Wold-style-declaration -Wold-style-definition -Wtype-limits
> -Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers
> -Wempty-body -Wnested-externs -Wendif-labels -Wexpansion-to-defined
> -Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs
> -Wno-shift-negative-value -Wno-psabi -fstack-protector-strong
> -DLEGACY_RDMA_REG_MR -fPIC -MD -MQ tests/plugin/libsyscall.so.p/syscall.c=
.o
> -MF tests/plugin/libsyscall.so.p/syscall.c.o.d -o
> tests/plugin/libsyscall.so.p/syscall.c.o -c ../../tests/plugin/syscall.c
> ../../tests/plugin/syscall.c:80:6: error: no previous prototype for
> =E2=80=98print_entry=E2=80=99 [-Werror=3Dmissing-prototypes]
>  void print_entry(gpointer val, gpointer user_data)
>       ^~~~~~~~~~~
> cc1: all warnings being treated as errors
> ninja: build stopped: subcommand failed.
> make: *** [Makefile:152: run-ninja] Error 1
>
> Thanks for the notice. I got it working because I was building it using
the makefile in the
contrib/plugins makefile and it does not report warnings. I fixed it.

> >
> > +static gint comp_func(gconstpointer ea, gconstpointer eb)
> > +{
> > +    SyscallStats *ent_a =3D (SyscallStats *) ea;
> > +    SyscallStats *ent_b =3D (SyscallStats *) eb;
> > +
> > +    return ent_a->calls > ent_b->calls ? -1 : 1;
> > +}
> > +
> >  /*
> *************************************************************************=
 */
> > +static void plugin_exit(qemu_plugin_id_t id, void *p)
> > +{
> > +    if (!statistics) {
> > +        return;
> > +    }
> > +
> > +    g_mutex_lock(&lock);
> > +    GList *entries =3D g_hash_table_get_values(statistics);
> > +    entries =3D g_list_sort(entries, comp_func);
> > +    qemu_plugin_outs("syscall no.  calls  errors\n");
> >
> > -static void plugin_exit(qemu_plugin_id_t id, void *p) {}
> > +    g_list_foreach(entries, print_entry, NULL);
> > +
> > +    g_list_free(entries);
> > +    g_hash_table_destroy(statistics);
> > +    g_mutex_unlock(&lock);
> > +}
>
> Hmm it looks like we see multiple plugin_exit's when running multiple
> threads:
>
>   ./qemu-aarch64 -d plugin -D output -plugin ./tests/plugin/libsyscall.so
> ./tests/tcg/aarch64-linux-user/linux-test
>
> I don't see it with testthread or the new signals test though which is
> confusing. Something linux-test is doing must be different.
>

The output of other plugins is similar so apparently there's something
different with linux-test, yes.

Since this is not a bug related to this particular patch, should I fix the
compilation error and resend the patch?


>
> >
> >  QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,
> >                                             const qemu_info_t *info,
> >                                             int argc, char **argv)
> >  {
> > +    if (argc =3D=3D 0) {
> > +        statistics =3D g_hash_table_new_full(NULL, g_direct_equal, NUL=
L,
> g_free);
> > +    } else {
> > +        for (int i =3D 0; i < argc; i++) {
> > +            if (g_strcmp0(argv[i], "print") !=3D 0) {
> > +                fprintf(stderr, "unsupported argument: %s\n", argv[i])=
;
> > +                return -1;
> > +            }
> > +        }
> > +    }
> > +
> >      qemu_plugin_register_vcpu_syscall_cb(id, vcpu_syscall);
> >      qemu_plugin_register_vcpu_syscall_ret_cb(id, vcpu_syscall_ret);
> >      qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
>
> Otherwise looking pretty good - certainly a more useful default ;-)
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
>
> --
> Alex Benn=C3=A9e
>

Thanks,
Mahmoud

--00000000000094d9b005c198e94e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, May 5, 2021 at 3:19 PM Alex Benn=
=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
><br>
Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com" target=3D"_bla=
nk">ma.mandourr@gmail.com</a>&gt; writes:<br>
<br>
&gt; Added a table-like output which contains the total number of calls<br>
&gt; for each used syscall along with the number of errors that occurred.<b=
r>
&gt;<br>
&gt; Per-call tracing is still available through supplying the argument<br>
&gt; ``print`` to the plugin.<br>
&gt;<br>
&gt; Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail=
.com" target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
&gt; ---<br>
&lt;snip&gt;<br>
&gt; +<br>
&gt; +void print_entry(gpointer val, gpointer user_data)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_autofree gchar *out;<br>
&gt; -=C2=A0 =C2=A0 out =3D g_strdup_printf(&quot;syscall #%&quot; PRIi64 &=
quot; returned -&gt; %&quot; PRIi64 &quot;\n&quot;,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 num, ret);<br>
&gt; +=C2=A0 =C2=A0 SyscallStats *entry =3D (SyscallStats *) val;<br>
&gt; +=C2=A0 =C2=A0 int64_t syscall_num =3D entry-&gt;num;<br>
&gt; +=C2=A0 =C2=A0 out =3D g_strdup_printf(<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;%-13&quot; PRIi64 &quot;%-6&quot; P=
RIi64 &quot; %&quot; PRIi64 &quot;\n&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 syscall_num, entry-&gt;calls, entry-&gt;e=
rrors);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_plugin_outs(out);<br>
&gt;=C2=A0 }<br>
<br>
This still fails to compile due to a missing static:<br>
<br>
[2/10] Compiling C object tests/plugin/libsyscall.so.p/syscall.c.o<br>
FAILED: tests/plugin/libsyscall.so.p/syscall.c.o<br>
cc -Itests/plugin/libsyscall.so.p -Itests/plugin -I../../tests/plugin -I../=
../include/qemu -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.=
0/include -fdiagnostics-color=3Dauto -pipe -Wall -Winvalid-pch -Werror -std=
=3Dgnu99 -O2 -g -isystem /home/alex/lsrc/qemu.git/linux-headers -isystem li=
nux-headers -iquote . -iquote /home/alex/lsrc/qemu.git -iquote /home/alex/l=
src/qemu.git/include -iquote /home/alex/lsrc/qemu.git/disas/libvixl -iquote=
 /home/alex/lsrc/qemu.git/tcg/i386 -pthread -U_FORTIFY_SOURCE -D_FORTIFY_SO=
URCE=3D2 -m64 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=3D64 -D_LARGEFILE_SO=
URCE -Wstrict-prototypes -Wredundant-decls -Wundef -Wwrite-strings -Wmissin=
g-prototypes -fno-strict-aliasing -fno-common -fwrapv -Wold-style-declarati=
on -Wold-style-definition -Wtype-limits -Wformat-security -Wformat-y2k -Win=
it-self -Wignored-qualifiers -Wempty-body -Wnested-externs -Wendif-labels -=
Wexpansion-to-defined -Wimplicit-fallthrough=3D2 -Wno-missing-include-dirs =
-Wno-shift-negative-value -Wno-psabi -fstack-protector-strong -DLEGACY_RDMA=
_REG_MR -fPIC -MD -MQ tests/plugin/libsyscall.so.p/syscall.c.o -MF tests/pl=
ugin/libsyscall.so.p/syscall.c.o.d -o tests/plugin/libsyscall.so.p/syscall.=
c.o -c ../../tests/plugin/syscall.c<br>
../../tests/plugin/syscall.c:80:6: error: no previous prototype for =E2=80=
=98print_entry=E2=80=99 [-Werror=3Dmissing-prototypes]<br>
=C2=A0void print_entry(gpointer val, gpointer user_data)<br>
=C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~<br>
cc1: all warnings being treated as errors<br>
ninja: build stopped: subcommand failed.<br>
make: *** [Makefile:152: run-ninja] Error 1<br>
<br></blockquote><div>Thanks for the notice. I got it working because I was=
 building it using the makefile in the=C2=A0</div><div>contrib/plugins make=
file and it does not report warnings. I fixed it.</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
&gt;=C2=A0 <br>
&gt; +static gint comp_func(gconstpointer ea, gconstpointer eb)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 SyscallStats *ent_a =3D (SyscallStats *) ea;<br>
&gt; +=C2=A0 =C2=A0 SyscallStats *ent_b =3D (SyscallStats *) eb;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return ent_a-&gt;calls &gt; ent_b-&gt;calls ? -1 : 1;<b=
r>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 /* *************************************************************=
************ */<br>
&gt; +static void plugin_exit(qemu_plugin_id_t id, void *p)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 if (!statistics) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_mutex_lock(&amp;lock);<br>
&gt; +=C2=A0 =C2=A0 GList *entries =3D g_hash_table_get_values(statistics);=
<br>
&gt; +=C2=A0 =C2=A0 entries =3D g_list_sort(entries, comp_func);<br>
&gt; +=C2=A0 =C2=A0 qemu_plugin_outs(&quot;syscall no.=C2=A0 calls=C2=A0 er=
rors\n&quot;);<br>
&gt;=C2=A0 <br>
&gt; -static void plugin_exit(qemu_plugin_id_t id, void *p) {}<br>
&gt; +=C2=A0 =C2=A0 g_list_foreach(entries, print_entry, NULL);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 g_list_free(entries);<br>
&gt; +=C2=A0 =C2=A0 g_hash_table_destroy(statistics);<br>
&gt; +=C2=A0 =C2=A0 g_mutex_unlock(&amp;lock);<br>
&gt; +}<br>
<br>
Hmm it looks like we see multiple plugin_exit&#39;s when running multiple<b=
r>
threads:<br>
<br>
=C2=A0 ./qemu-aarch64 -d plugin -D output -plugin ./tests/plugin/libsyscall=
.so ./tests/tcg/aarch64-linux-user/linux-test<br>
<br>
I don&#39;t see it with testthread or the new signals test though which is<=
br>
confusing. Something linux-test is doing must be different.<br></blockquote=
><div><br></div><div>The output of other plugins is similar so apparently t=
here&#39;s something</div><div>different with linux-test, yes.</div><div><b=
r></div><div>Since this is not a bug related to this particular patch, shou=
ld I fix the</div><div>compilation error and resend the patch?</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugin_id_t id,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0const qemu_info_t *info,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0int argc, char **argv)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 if (argc =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 statistics =3D g_hash_table_new_full(NULL=
, g_direct_equal, NULL, g_free);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; argc; i++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (g_strcmp0(argv[i], &quo=
t;print&quot;) !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fprintf(stder=
r, &quot;unsupported argument: %s\n&quot;, argv[i]);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_plugin_register_vcpu_syscall_cb(id, vcpu_sysc=
all);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_plugin_register_vcpu_syscall_ret_cb(id, vcpu_=
syscall_ret);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_plugin_register_atexit_cb(id, plugin_exit, NU=
LL);<br>
<br>
Otherwise looking pretty good - certainly a more useful default ;-)<br>
<br>
Reviewed-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org"=
 target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br></blockquote><div><br></div><div>Thanks,=C2=A0</div><di=
v>Mahmoud=C2=A0</div></div></div>

--00000000000094d9b005c198e94e--

