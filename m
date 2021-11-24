Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D8A45D134
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 00:28:48 +0100 (CET)
Received: from localhost ([::1]:36504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq1h0-0003DR-Sg
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 18:28:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mq1fm-0002Ow-C5
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 18:27:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51245)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mq1fj-0000wJ-3s
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 18:27:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637796446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uZpAi/NIITeoJ5o5f+iDb6ae+69l89YUbhMR3QCkWiQ=;
 b=OPTckSc//CZ33h+Xd26/64J/tbhu/MR7Iwn8VxaDMuO7w/KtCZ14M2nQJzOaJZnq6KP00B
 yQDi2zQAalceJS4T1AYoHVoA4tRqgQvnVaoJMrFT+DTqMvefaX1eVfZ17P1qN4yccSzDKV
 96QMcb/zkM5x3Hm7Le7VU4mXhWfFH8M=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-45-BsiGfZQtNSeoTe8qDq48tA-1; Wed, 24 Nov 2021 18:27:24 -0500
X-MC-Unique: BsiGfZQtNSeoTe8qDq48tA-1
Received: by mail-ua1-f69.google.com with SMTP id
 h6-20020a9f3006000000b002e6e81fda51so3093512uab.4
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 15:27:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uZpAi/NIITeoJ5o5f+iDb6ae+69l89YUbhMR3QCkWiQ=;
 b=JFeuHGACVtNPU1w1UgGn0aSawvkE6k3V3Jid4vXk3UNZQiBeG5OI1QWl9wqBAeULQi
 oCTXN854Z1/7pwpjGNpT5edJKtOQq3OfB/CHMJCntkf5VF6Je7gMR5ch/rBSE5JCK8uR
 8yBhz/XGrbLv7WYRdNgsYTQwHpMSlIoQL3VctCG+ITa2r9GsrrOVTHaJf++AKalJi0kP
 pMHYeZWYD6XHBq+QpGsh8nxTNDDjEUjE6ynwF47ndg5OHpuu2RmMRmNF2iEIVRYeP+vy
 x1cUMq61EVd4EOMGRInsyXhZmWJctQnj5+JJk/oqGFBXDF5rkPM0d1GhRM3NbAMNh9Rs
 2O6w==
X-Gm-Message-State: AOAM532Mq1EJAX3Tl3cJv7Qwe8Pkw2fMq/f4CVPxcy20yEKexEpK2SX+
 G9ZcLd3BLyexVdZF9/O0fzWaJNsBtsMXgiaLHysvrsiSXZmFkTVW5A8epOwRiVPvx/6Z3HNz5pZ
 mXbyr0UK0NyYeax7nmc1byqxDoO5Xx1Y=
X-Received: by 2002:a05:6102:1ca:: with SMTP id
 s10mr1821908vsq.61.1637796443845; 
 Wed, 24 Nov 2021 15:27:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzM3wmi83JTViiIJ2Pd4bLS1LObx5WnGjJub77RzeBrcSc6p8vQ5owhbHDRuVEuZSfQDWLUTxzUXhV14b03o8k=
X-Received: by 2002:a05:6102:1ca:: with SMTP id
 s10mr1821845vsq.61.1637796443613; 
 Wed, 24 Nov 2021 15:27:23 -0800 (PST)
MIME-Version: 1.0
References: <20211118115733.4038610-1-philmd@redhat.com>
 <20211118115733.4038610-3-philmd@redhat.com>
 <bb1c8fac-544f-bd5f-ed41-2b40439276a8@redhat.com>
In-Reply-To: <bb1c8fac-544f-bd5f-ed41-2b40439276a8@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 24 Nov 2021 18:27:13 -0500
Message-ID: <CAFn=p-Yy0dtWp4n+uG0xi=iehQCt-hOk0czqa7b6aSt4d6JNsg@mail.gmail.com>
Subject: Re: [PATCH-for-6.2 2/2] tests/qtest/fdc-test: Add a regression test
 for CVE-2021-3507
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000003c86a305d19133bd"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 Qemu-block <qemu-block@nongnu.org>, Darren Kenny <darren.kenny@oracle.com>,
 qemu-devel <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000003c86a305d19133bd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 23, 2021 at 11:08 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 18.11.21 12:57, Philippe Mathieu-Daud=C3=A9 wrote:
> > Add the reproducer from
> https://gitlab.com/qemu-project/qemu/-/issues/339
> >
> > Without the previous commit, when running 'make check-qtest-i386'
> > with QEMU configured with '--enable-sanitizers' we get:
> >
> >    =3D=3D4028352=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on =
address
> 0x619000062a00 at pc 0x5626d03c491a bp 0x7ffdb4199410 sp 0x7ffdb4198bc0
> >    READ of size 786432 at 0x619000062a00 thread T0
> >        #0 0x5626d03c4919 in __asan_memcpy (qemu-system-i386+0x1e65919)
> >        #1 0x5626d1c023cc in flatview_write_continue
> softmmu/physmem.c:2787:13
> >        #2 0x5626d1bf0c0f in flatview_write softmmu/physmem.c:2822:14
> >        #3 0x5626d1bf0798 in address_space_write softmmu/physmem.c:2914:=
18
> >        #4 0x5626d1bf0f37 in address_space_rw softmmu/physmem.c:2924:16
> >        #5 0x5626d1bf14c8 in cpu_physical_memory_rw
> softmmu/physmem.c:2933:5
> >        #6 0x5626d0bd5649 in cpu_physical_memory_write
> include/exec/cpu-common.h:82:5
> >        #7 0x5626d0bd0a07 in i8257_dma_write_memory hw/dma/i8257.c:452:9
> >        #8 0x5626d09f825d in fdctrl_transfer_handler
> hw/block/fdc.c:1616:13
> >        #9 0x5626d0a048b4 in fdctrl_start_transfer hw/block/fdc.c:1539:1=
3
> >        #10 0x5626d09f4c3e in fdctrl_write_data hw/block/fdc.c:2266:13
> >        #11 0x5626d09f22f7 in fdctrl_write hw/block/fdc.c:829:9
> >        #12 0x5626d1c20bc5 in portio_write softmmu/ioport.c:207:17
> >
> >    0x619000062a00 is located 0 bytes to the right of 512-byte region
> [0x619000062800,0x619000062a00)
> >    allocated by thread T0 here:
> >        #0 0x5626d03c66ec in posix_memalign (qemu-system-i386+0x1e676ec)
> >        #1 0x5626d2b988d4 in qemu_try_memalign util/oslib-posix.c:210:11
> >        #2 0x5626d2b98b0c in qemu_memalign util/oslib-posix.c:226:27
> >        #3 0x5626d09fbaf0 in fdctrl_realize_common hw/block/fdc.c:2341:2=
0
> >        #4 0x5626d0a150ed in isabus_fdc_realize hw/block/fdc-isa.c:113:5
> >        #5 0x5626d2367935 in device_set_realized hw/core/qdev.c:531:13
> >
> >    SUMMARY: AddressSanitizer: heap-buffer-overflow
> (qemu-system-i386+0x1e65919) in __asan_memcpy
> >    Shadow bytes around the buggy address:
> >      0x0c32800044f0: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> >      0x0c3280004500: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >      0x0c3280004510: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >      0x0c3280004520: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >      0x0c3280004530: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> >    =3D>0x0c3280004540:[fa]fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> >      0x0c3280004550: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> >      0x0c3280004560: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> >      0x0c3280004570: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> >      0x0c3280004580: fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa fa
> >      0x0c3280004590: fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd fd
> >    Shadow byte legend (one shadow byte represents 8 application bytes):
> >      Addressable:           00
> >      Heap left redzone:       fa
> >      Freed heap region:       fd
> >    =3D=3D4028352=3D=3DABORTING
> >
> > Reported-by: Alexander Bulekov <alxndr@bu.edu>
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---
> >   tests/qtest/fdc-test.c | 20 ++++++++++++++++++++
> >   1 file changed, 20 insertions(+)
> >
> > diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
> > index 26b69f7c5cd..f164d972d10 100644
> > --- a/tests/qtest/fdc-test.c
> > +++ b/tests/qtest/fdc-test.c
> > @@ -546,6 +546,25 @@ static void fuzz_registers(void)
> >       }
> >   }
> >
> > +static void test_cve_2021_3507(void)
> > +{
> > +    QTestState *s;
> > +
> > +    s =3D qtest_initf("-nographic -m 32M -nodefaults "
> > +                    "-drive file=3D%s,format=3Draw,if=3Dfloppy", test_=
image);
> > +    qtest_outl(s, 0x9, 0x0a0206);
> > +    qtest_outw(s, 0x3f4, 0x1600);
> > +    qtest_outw(s, 0x3f4, 0x0000);
> > +    qtest_outw(s, 0x3f4, 0x0000);
> > +    qtest_outw(s, 0x3f4, 0x0000);
> > +    qtest_outw(s, 0x3f4, 0x0200);
> > +    qtest_outw(s, 0x3f4, 0x0200);
> > +    qtest_outw(s, 0x3f4, 0x0000);
> > +    qtest_outw(s, 0x3f4, 0x0000);
> > +    qtest_outw(s, 0x3f4, 0x0000);
>
> No idea what this does (looks like a 256-byte sector read read from
> sector 2 with EOT=3D0), but hits the problem and reproduces for me.
>
> Unfortunately, I have the exact same problem with test_image as I did in
> the other series.
>
> Hanna
>
> > +    qtest_quit(s);
> > +}
> > +
> >   int main(int argc, char **argv)
> >   {
> >       int fd;
> > @@ -576,6 +595,7 @@ int main(int argc, char **argv)
> >       qtest_add_func("/fdc/read_no_dma_18", test_read_no_dma_18);
> >       qtest_add_func("/fdc/read_no_dma_19", test_read_no_dma_19);
> >       qtest_add_func("/fdc/fuzz-registers", fuzz_registers);
> > +    qtest_add_func("/fdc/fuzz/cve_2021_3507", test_cve_2021_3507);
> >
> >       ret =3D g_test_run();
> >
>

OK, I won't pull this one if there's a question over the suitability of the
test. I'm going to be away for the holiday until Monday, though. If the two
of you can agree that the fix and the test are good, though, I definitely
won't care if someone sends a PR for it.

--0000000000003c86a305d19133bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 23, 2021 at 11:08 AM Hann=
a Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 18.11.=
21 12:57, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt; Add the reproducer from <a href=3D"https://gitlab.com/qemu-project/qem=
u/-/issues/339" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qem=
u-project/qemu/-/issues/339</a><br>
&gt;<br>
&gt; Without the previous commit, when running &#39;make check-qtest-i386&#=
39;<br>
&gt; with QEMU configured with &#39;--enable-sanitizers&#39; we get:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =3D=3D4028352=3D=3DERROR: AddressSanitizer: heap-buffer-o=
verflow on address 0x619000062a00 at pc 0x5626d03c491a bp 0x7ffdb4199410 sp=
 0x7ffdb4198bc0<br>
&gt;=C2=A0 =C2=A0 READ of size 786432 at 0x619000062a00 thread T0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #0 0x5626d03c4919 in __asan_memcpy (qemu-sy=
stem-i386+0x1e65919)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #1 0x5626d1c023cc in flatview_write_continu=
e softmmu/physmem.c:2787:13<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #2 0x5626d1bf0c0f in flatview_write softmmu=
/physmem.c:2822:14<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #3 0x5626d1bf0798 in address_space_write so=
ftmmu/physmem.c:2914:18<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #4 0x5626d1bf0f37 in address_space_rw softm=
mu/physmem.c:2924:16<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #5 0x5626d1bf14c8 in cpu_physical_memory_rw=
 softmmu/physmem.c:2933:5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #6 0x5626d0bd5649 in cpu_physical_memory_wr=
ite include/exec/cpu-common.h:82:5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #7 0x5626d0bd0a07 in i8257_dma_write_memory=
 hw/dma/i8257.c:452:9<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #8 0x5626d09f825d in fdctrl_transfer_handle=
r hw/block/fdc.c:1616:13<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #9 0x5626d0a048b4 in fdctrl_start_transfer =
hw/block/fdc.c:1539:13<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #10 0x5626d09f4c3e in fdctrl_write_data hw/=
block/fdc.c:2266:13<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #11 0x5626d09f22f7 in fdctrl_write hw/block=
/fdc.c:829:9<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #12 0x5626d1c20bc5 in portio_write softmmu/=
ioport.c:207:17<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 0x619000062a00 is located 0 bytes to the right of 512-byt=
e region [0x619000062800,0x619000062a00)<br>
&gt;=C2=A0 =C2=A0 allocated by thread T0 here:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #0 0x5626d03c66ec in posix_memalign (qemu-s=
ystem-i386+0x1e676ec)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #1 0x5626d2b988d4 in qemu_try_memalign util=
/oslib-posix.c:210:11<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #2 0x5626d2b98b0c in qemu_memalign util/osl=
ib-posix.c:226:27<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #3 0x5626d09fbaf0 in fdctrl_realize_common =
hw/block/fdc.c:2341:20<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #4 0x5626d0a150ed in isabus_fdc_realize hw/=
block/fdc-isa.c:113:5<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 #5 0x5626d2367935 in device_set_realized hw=
/core/qdev.c:531:13<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 SUMMARY: AddressSanitizer: heap-buffer-overflow (qemu-sys=
tem-i386+0x1e65919) in __asan_memcpy<br>
&gt;=C2=A0 =C2=A0 Shadow bytes around the buggy address:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0x0c32800044f0: fa fa fa fa fa fa fa fa fa fa fa f=
a fa fa fa fa<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0x0c3280004500: 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0x0c3280004510: 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0x0c3280004520: 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0x0c3280004530: 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00<br>
&gt;=C2=A0 =C2=A0 =3D&gt;0x0c3280004540:[fa]fa fa fa fa fa fa fa fa fa fa f=
a fa fa fa fa<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0x0c3280004550: fa fa fa fa fa fa fa fa fa fa fa f=
a fa fa fa fa<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0x0c3280004560: fa fa fa fa fa fa fa fa fa fa fa f=
a fa fa fa fa<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0x0c3280004570: fa fa fa fa fa fa fa fa fa fa fa f=
a fa fa fa fa<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0x0c3280004580: fa fa fa fa fa fa fa fa fa fa fa f=
a fa fa fa fa<br>
&gt;=C2=A0 =C2=A0 =C2=A0 0x0c3280004590: fd fd fd fd fd fd fd fd fd fd fd f=
d fd fd fd fd<br>
&gt;=C2=A0 =C2=A0 Shadow byte legend (one shadow byte represents 8 applicat=
ion bytes):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Addressable:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Heap left redzone:=C2=A0 =C2=A0 =C2=A0 =C2=A0fa<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 Freed heap region:=C2=A0 =C2=A0 =C2=A0 =C2=A0fd<br=
>
&gt;=C2=A0 =C2=A0 =3D=3D4028352=3D=3DABORTING<br>
&gt;<br>
&gt; Reported-by: Alexander Bulekov &lt;<a href=3D"mailto:alxndr@bu.edu" ta=
rget=3D"_blank">alxndr@bu.edu</a>&gt;<br>
&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philm=
d@redhat.com" target=3D"_blank">philmd@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0tests/qtest/fdc-test.c | 20 ++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A01 file changed, 20 insertions(+)<br>
&gt;<br>
&gt; diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c<br>
&gt; index 26b69f7c5cd..f164d972d10 100644<br>
&gt; --- a/tests/qtest/fdc-test.c<br>
&gt; +++ b/tests/qtest/fdc-test.c<br>
&gt; @@ -546,6 +546,25 @@ static void fuzz_registers(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +static void test_cve_2021_3507(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 QTestState *s;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 s =3D qtest_initf(&quot;-nographic -m 32M -nodefaults &=
quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &quot;-drive file=3D%s,format=3Draw,if=3Dfloppy&quot;, test_image);<br>
&gt; +=C2=A0 =C2=A0 qtest_outl(s, 0x9, 0x0a0206);<br>
&gt; +=C2=A0 =C2=A0 qtest_outw(s, 0x3f4, 0x1600);<br>
&gt; +=C2=A0 =C2=A0 qtest_outw(s, 0x3f4, 0x0000);<br>
&gt; +=C2=A0 =C2=A0 qtest_outw(s, 0x3f4, 0x0000);<br>
&gt; +=C2=A0 =C2=A0 qtest_outw(s, 0x3f4, 0x0000);<br>
&gt; +=C2=A0 =C2=A0 qtest_outw(s, 0x3f4, 0x0200);<br>
&gt; +=C2=A0 =C2=A0 qtest_outw(s, 0x3f4, 0x0200);<br>
&gt; +=C2=A0 =C2=A0 qtest_outw(s, 0x3f4, 0x0000);<br>
&gt; +=C2=A0 =C2=A0 qtest_outw(s, 0x3f4, 0x0000);<br>
&gt; +=C2=A0 =C2=A0 qtest_outw(s, 0x3f4, 0x0000);<br>
<br>
No idea what this does (looks like a 256-byte sector read read from <br>
sector 2 with EOT=3D0), but hits the problem and reproduces for me.<br>
<br>
Unfortunately, I have the exact same problem with test_image as I did in <b=
r>
the other series.<br>
<br>
Hanna<br>
<br>
&gt; +=C2=A0 =C2=A0 qtest_quit(s);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0int main(int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0int fd;<br>
&gt; @@ -576,6 +595,7 @@ int main(int argc, char **argv)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;/fdc/read_no_dma_18&quo=
t;, test_read_no_dma_18);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;/fdc/read_no_dma_19&quo=
t;, test_read_no_dma_19);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qtest_add_func(&quot;/fdc/fuzz-registers&quo=
t;, fuzz_registers);<br>
&gt; +=C2=A0 =C2=A0 qtest_add_func(&quot;/fdc/fuzz/cve_2021_3507&quot;, tes=
t_cve_2021_3507);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D g_test_run();<br>
&gt;=C2=A0 =C2=A0<br></blockquote><div><br></div><div>OK, I won&#39;t pull =
this one if there&#39;s a question over the suitability of the test. I&#39;=
m going to be away for the holiday until Monday, though. If the two of you =
can agree that the fix and the test are good, though, I definitely won&#39;=
t care if someone sends a PR for it.<br></div></div></div>

--0000000000003c86a305d19133bd--


