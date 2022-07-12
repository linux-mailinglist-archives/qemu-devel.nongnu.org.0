Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D30325715D3
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 11:35:32 +0200 (CEST)
Received: from localhost ([::1]:52350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBCIl-0004hp-TJ
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 05:35:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oBCG5-0001os-Ly; Tue, 12 Jul 2022 05:32:45 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234]:42623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oBCFr-0005lD-HE; Tue, 12 Jul 2022 05:32:45 -0400
Received: by mail-lj1-x234.google.com with SMTP id r9so9183889ljp.9;
 Tue, 12 Jul 2022 02:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+iO7ZWU58OptAthR9roRRVHkML4fVitWMMleas1hsTY=;
 b=S0uND38iO6hIPPSVyrU7fSf+RjOlwD36nYtWliBz1MH2YJ7Jo16fOBOp0nHW9U2aRY
 axqBViHCSCoBaFSc3JUtUxm4nv+pyDpvsbvL5psi+PHMBiVsDtkNDuEO5wUtmEPt4Vfl
 01h5fPm67q/wCoBxElK1a00O7XngrWycR1CjcxYSh4c1pEw57WmUErKCijWPrLqi3F5o
 dwhICfuEb/uc6peVCzGxknMfMQDPVAJ9fVz8Xw1Uw+wrRBgVMSrWSpGGTYrTYlylGfoj
 hQ9Igz3A44cHsQC4yhUeElfrOeDGTdfJjd/JyUAvMdbv4foeAM9JDDQAqqxUgJWQ6k9L
 SLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+iO7ZWU58OptAthR9roRRVHkML4fVitWMMleas1hsTY=;
 b=7TQnPQy11CJDuaj82oZnm7mQPYA3v1iAegJ4k0Mnb6odALHzKznyT+9WRl8XKo44o3
 8sERiKLAsJXl7jhY+1AAdt79Qszc7UlUCjFf9OS2V1ZLoRLNjUO0exYSkflZsLgFMFKw
 ExIT8riB4PNsAY00ThE21q/5s6dljbvLFaBNMfi77lnvgiWlTRYmVtVczW8FNh2Xj/Zt
 VBdcAaEa2DzARxF0vEe0Wyf/s9c0QjQEL1GWAr8TAMf3imfv0kWa7qgvEDJcJWTgItu9
 iJ0v8vu4nZDXBBt+j8pgpe1E2ZBbwxAo3eQvhQvSk/VmqztEkx9oOz64oks3QawBuJfN
 X52w==
X-Gm-Message-State: AJIora+oxFp2rW7XX116NUw4H2Cqyjxif0kkrr2Jh46u/24NstYPaD4I
 F0Sf5b7w9xIRtdqxSepAWNtSNWK/KHifEr19y50=
X-Google-Smtp-Source: AGRyM1vCUF1BgCL5E81QKusk7jeE9OfTR2YNpGG/Untc/PiUUC71ER4zBYxLDCw04lw7aQNHsOH7JAWuaqTDffN3/Tc=
X-Received: by 2002:a2e:6e0b:0:b0:25b:bf22:47a with SMTP id
 j11-20020a2e6e0b000000b0025bbf22047amr12308764ljc.524.1657618348594; Tue, 12
 Jul 2022 02:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220616124034.3381391-1-marcandre.lureau@redhat.com>
 <20220616124034.3381391-7-marcandre.lureau@redhat.com>
 <87ilo9dsne.fsf@pond.sub.org>
 <CAJ+F1CLNa=edp=O8LB=5v-2iChEyYdP7-oa_DtnKDLeC1E3_vw@mail.gmail.com>
In-Reply-To: <CAJ+F1CLNa=edp=O8LB=5v-2iChEyYdP7-oa_DtnKDLeC1E3_vw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 12 Jul 2022 13:32:16 +0400
Message-ID: <CAJ+F1CK+UTpCDjJZ2YN=L9YDTxgEVHnCQPycDNPTD706y014yA@mail.gmail.com>
Subject: Re: [PATCH 6/9] error-report: add a callback to overwrite
 error_vprintf
To: Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Michael Roth <michael.roth@amd.com>, 
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Warner Losh <imp@bsdimp.com>, 
 Kyle Evans <kevans@freebsd.org>, Hanna Reitz <hreitz@redhat.com>, 
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Fam Zheng <fam@euphon.net>, 
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000d75a3d05e3985860"
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d75a3d05e3985860
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Jul 7, 2022 at 10:05 PM Marc-Andr=C3=A9 Lureau <
marcandre.lureau@gmail.com> wrote:

> Hi
>
> On Thu, Jul 7, 2022 at 4:18 PM Markus Armbruster <armbru@redhat.com>
> wrote:
>
>> marcandre.lureau@redhat.com writes:
>>
>> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> >
>> > error_vprintf() is implemented in monitor.c, which overrides the
>> > default implementation from stubs/, while avoiding a direct dependency
>> > to the monitor from error-report.c.
>> >
>> > However, the stub solution isn't working when moving error-report.c an=
d
>> > stubs/error-printf.c in a common library. Linking with such library
>> > creates conflicts for the error_vprintf() implementations
>>
>> I'm feeling dense today: how?
>>
>
> If I try to overwrite a symbol in qemu when linking with a static library
> from a subproject, the linker fails:
>
> FAILED: storage-daemon/qemu-storage-daemon
> cc -m64 -mcx16  -o storage-daemon/qemu-storage-daemon
> storage-daemon/qemu-storage-daemon.p/meson-generated_.._qapi_qapi-introsp=
ect.c.o
> storage-daemon/qemu-storage-daemon.p/meson-generated_.._qapi_qapi-types.c=
.o
> storage-daemon/qemu-storage-daemon.p/meson-generated_.._qapi_qapi-visit.c=
.o
> storage-daemon/qemu-storage-daemon.p/meson-generated_.._qapi_qapi-command=
s.c.o
> storage-daemon/qemu-storage-daemon.p/meson-generated_.._qapi_qapi-init-co=
mmands.c.o
> storage-daemon/qemu-storage-daemon.p/meson-generated_.._qapi_qapi-events.=
c.o
> storage-daemon/qemu-storage-daemon.p/meson-generated_.._qapi_qapi-emit-ev=
ents.c.o
> storage-daemon/qemu-storage-daemon.p/qemu-storage-daemon.c.o
> -Wl,--as-needed -Wl,--no-undefined -pie -Wl,--whole-archive libblockdev.f=
a
> libblock.fa libcrypto.fa libauthz.fa libqom.fa libio.fa -Wl,--start-group
> libevent-loop-base.a libchardev.fa libqmp.fa -Wl,--no-whole-archive
> -Wl,--warn-common -Wl,-z,relro -Wl,-z,now -fstack-protector-strong
> -Wl,-rpath,/usr/lib64/iscsi -Wl,-rpath-link,/usr/lib64/iscsi libqemuutil.=
a
> subprojects/libvhost-user/libvhost-user-glib.a
> subprojects/libvhost-user/libvhost-user.a
> subprojects/qemu-common/libqemu-common.a libblockdev.fa
> subprojects/libvduse/libvduse.a libblock.fa libcrypto.fa libauthz.fa
> libqom.fa libio.fa libchardev.fa libqmp.fa @block.syms
> /usr/lib64/libgnutls.so /usr/lib64/liburing.so /usr/lib64/libgio-2.0.so
> /usr/lib64/libgobject-2.0.so /usr/lib64/libglib-2.0.so
> -Wl,--export-dynamic -pthread -lgmodule-2.0 -lglib-2.0 -lglib-2.0 -lm
> /usr/lib64/libpixman-1.so -lgmodule-2.0 -lglib-2.0 -lglib-2.0 -lgmodule-2=
.0
> -lglib-2.0 -lglib-2.0 -lgmodule-2.0 -lglib-2.0 -lglib-2.0
> /usr/lib64/libfuse3.so -lpthread -lgmodule-2.0 -lglib-2.0 -lglib-2.0
> /usr/lib64/libzstd.so /usr/lib64/libz.so /usr/lib64/iscsi/libiscsi.so -la=
io
> -lpam -lutil -Wl,--end-group
> /usr/bin/ld:
> subprojects/qemu-common/libqemu-common.a.p/src_error-report.c.o: in
> function `error_init':
> /home/elmarco/src/qemu/build/../subprojects/qemu-common/src/error-report.=
c:413:
> multiple definition of `error_init';
> libqmp.fa.p/monitor_qmp.c.o:/home/elmarco/src/qemu/build/../monitor/qmp.c=
:40:
> first defined here
>
> But I can't really explain why it works when overwriting symbols from
> libqemuutil.a, I am a bit puzzled here. Am I missing something obvious?
> (this is a bit of dark linker magic going on)
>
>
After playing with this for a few hours ... I managed to get the symbol
override work, by having a single overridable function per unit. No idea
why in qemutil.a/stubs we manage to have several. That's a mystery. Anyway,
I will send a new version where I also introduce the subproject, to
demonstrate it works.

thanks


>
>> Why would the linker pull in error-printf.o when the symbols it defines
>> are already provided by .o the linker processed before the library
>> containing error-printf.o?
>>
>> >                                                           (and weak
>> > symbols aren't great either).
>>
>> Weak symbols are great, except Windows isn't.
>>
>> >                               Instead, use the "traditional" approach =
to
>> > provide overidable callbacks.
>> >
>> > Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>>
>>
>>
>
> --
> Marc-Andr=C3=A9 Lureau
>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000d75a3d05e3985860
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 7, 2022 at 10:05 PM Mar=
c-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@gmail.com">marca=
ndre.lureau@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jul 7,=
 2022 at 4:18 PM Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com"=
 target=3D"_blank">armbru@redhat.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex"><a href=3D"mailto:marcandre.lureau@redh=
at.com" target=3D"_blank">marcandre.lureau@redhat.com</a> writes:<br>
<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt;<br>
&gt; error_vprintf() is implemented in monitor.c, which overrides the<br>
&gt; default implementation from stubs/, while avoiding a direct dependency=
<br>
&gt; to the monitor from error-report.c.<br>
&gt;<br>
&gt; However, the stub solution isn&#39;t working when moving error-report.=
c and<br>
&gt; stubs/error-printf.c in a common library. Linking with such library<br=
>
&gt; creates conflicts for the error_vprintf() implementations<br>
<br>
I&#39;m feeling dense today: how?<br></blockquote></div><div class=3D"gmail=
_quote"><br></div><div class=3D"gmail_quote">If I try to overwrite a symbol=
 in qemu when linking with a static library from a subproject, the linker f=
ails:</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote">=
FAILED: storage-daemon/qemu-storage-daemon <br>cc -m64 -mcx16 =C2=A0-o stor=
age-daemon/qemu-storage-daemon storage-daemon/qemu-storage-daemon.p/meson-g=
enerated_.._qapi_qapi-introspect.c.o storage-daemon/qemu-storage-daemon.p/m=
eson-generated_.._qapi_qapi-types.c.o storage-daemon/qemu-storage-daemon.p/=
meson-generated_.._qapi_qapi-visit.c.o storage-daemon/qemu-storage-daemon.p=
/meson-generated_.._qapi_qapi-commands.c.o storage-daemon/qemu-storage-daem=
on.p/meson-generated_.._qapi_qapi-init-commands.c.o storage-daemon/qemu-sto=
rage-daemon.p/meson-generated_.._qapi_qapi-events.c.o storage-daemon/qemu-s=
torage-daemon.p/meson-generated_.._qapi_qapi-emit-events.c.o storage-daemon=
/qemu-storage-daemon.p/qemu-storage-daemon.c.o -Wl,--as-needed -Wl,--no-und=
efined -pie -Wl,--whole-archive libblockdev.fa libblock.fa libcrypto.fa lib=
authz.fa libqom.fa libio.fa -Wl,--start-group libevent-loop-base.a libchard=
ev.fa libqmp.fa -Wl,--no-whole-archive -Wl,--warn-common -Wl,-z,relro -Wl,-=
z,now -fstack-protector-strong -Wl,-rpath,/usr/lib64/iscsi -Wl,-rpath-link,=
/usr/lib64/iscsi libqemuutil.a subprojects/libvhost-user/libvhost-user-glib=
.a subprojects/libvhost-user/libvhost-user.a subprojects/qemu-common/libqem=
u-common.a libblockdev.fa subprojects/libvduse/libvduse.a libblock.fa libcr=
ypto.fa libauthz.fa libqom.fa libio.fa libchardev.fa libqmp.fa @block.syms =
/usr/lib64/libgnutls.so /usr/lib64/liburing.so /usr/lib64/<a href=3D"http:/=
/libgio-2.0.so" target=3D"_blank">libgio-2.0.so</a> /usr/lib64/<a href=3D"h=
ttp://libgobject-2.0.so" target=3D"_blank">libgobject-2.0.so</a> /usr/lib64=
/<a href=3D"http://libglib-2.0.so" target=3D"_blank">libglib-2.0.so</a> -Wl=
,--export-dynamic -pthread -lgmodule-2.0 -lglib-2.0 -lglib-2.0 -lm /usr/lib=
64/libpixman-1.so -lgmodule-2.0 -lglib-2.0 -lglib-2.0 -lgmodule-2.0 -lglib-=
2.0 -lglib-2.0 -lgmodule-2.0 -lglib-2.0 -lglib-2.0 /usr/lib64/libfuse3.so -=
lpthread -lgmodule-2.0 -lglib-2.0 -lglib-2.0 /usr/lib64/libzstd.so /usr/lib=
64/libz.so /usr/lib64/iscsi/libiscsi.so -laio -lpam -lutil -Wl,--end-group<=
br>/usr/bin/ld: subprojects/qemu-common/libqemu-common.a.p/src_error-report=
.c.o: in function `error_init&#39;:<br>/home/elmarco/src/qemu/build/../subp=
rojects/qemu-common/src/error-report.c:413: multiple definition of `error_i=
nit&#39;; libqmp.fa.p/monitor_qmp.c.o:/home/elmarco/src/qemu/build/../monit=
or/qmp.c:40: first defined here</div><div class=3D"gmail_quote"><br><div>Bu=
t I can&#39;t really explain why it works when overwriting symbols from lib=
qemuutil.a, I am a bit puzzled here. Am I missing something obvious? (this =
is a bit of dark linker magic going on)<br></div><div><br></div></div></div=
></blockquote><div><br></div><div>After playing with this for a few hours .=
.. I managed to get the symbol override work, by having a single overridabl=
e function per unit. No idea why in qemutil.a/stubs we manage to have sever=
al. That&#39;s a mystery. Anyway, I will send a new version where I also in=
troduce the subproject, to demonstrate it works.</div><div><br></div><div>t=
hanks<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div><br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Why would the linker pull in error-printf.o when the symbols it defines<br>
are already provided by .o the linker processed before the library<br>
containing error-printf.o?<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(and weak=
<br>
&gt; symbols aren&#39;t great either).<br>
<br>
Weak symbols are great, except Windows isn&#39;t.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Instead, use the &quot;traditional=
&quot; approach to<br>
&gt; provide overidable callbacks.<br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr">Marc-Andr=
=C3=A9 Lureau<br></div></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000d75a3d05e3985860--

