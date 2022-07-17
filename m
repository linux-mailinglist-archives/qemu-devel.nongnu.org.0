Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127D55773AB
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jul 2022 05:19:35 +0200 (CEST)
Received: from localhost ([::1]:57976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCuof-0004qB-Nm
	for lists+qemu-devel@lfdr.de; Sat, 16 Jul 2022 23:19:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oCune-0003Vx-3A
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 23:18:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oCuna-0002bD-8S
 for qemu-devel@nongnu.org; Sat, 16 Jul 2022 23:18:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658027902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nf6nvn6/pO5ibqUgv3KKXaXTIc1PUVN715oq3w53o8U=;
 b=ZvFoz06FKEFd0dtLmO47cUB9T/iq2QcsoEqMd16C9fG5sNC6xvS/wLpY7A5GYgXs35cqmT
 7XlanXWjwT/nE7WhtwK6/v16mypF8OOwS9Fj3BV0KMGzkSCKQcI66hhrRFRnCHRwweRX1v
 zhyuResES2FmjYTnjfnx1yfYbLmiWn0=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-QDhCjekQN3y04ZMVBHmd3w-1; Sat, 16 Jul 2022 23:18:20 -0400
X-MC-Unique: QDhCjekQN3y04ZMVBHmd3w-1
Received: by mail-lf1-f72.google.com with SMTP id
 h37-20020a0565123ca500b004889ff5f804so3206700lfv.19
 for <qemu-devel@nongnu.org>; Sat, 16 Jul 2022 20:18:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nf6nvn6/pO5ibqUgv3KKXaXTIc1PUVN715oq3w53o8U=;
 b=6AX+azrBS/FTiFnMR9y5/rS48G2SVfPYqa8/3bxZXhAMDOhd2mX4Pc0nbCfryDMJh1
 kfysYNjqXFIulkbT9+oMkQhNC/OLf4LsrOYqvlHjflIY+KPS5vpLSQim6bberka068uU
 pEkIBn+jAyh7kuE2uU7/s00R5J9b4COwUQ4TclR2kSVnLc7Lama0P08dVGBi81qYpRtz
 /9zYqlypwqebcltHiKae6qpeWu5BtgP2Ii/r2fZS7QoAFZx01uqbLynVNeeBpDC9HWle
 tEOCjcS5yL/yX+gLfL6iLS9rlzqL38Qz+0ONaFNOY/7YIHrSLH8ZDS62ZYWxJiI/ndnA
 u0BQ==
X-Gm-Message-State: AJIora/zzbf/GBs6AzznZVyPlUa17MuYPnSE2cTJcUfVqbT7Xl+O4XmB
 dR2bwOm1s7zexrfnYbYSXMUCoLwHn+jiXMC4cdRNmUemBVCzBI4gnfkKA4Uf6DC3TpkVulcXISx
 IdfOtzvFFOiJolPcY1mSEVR17jMusDLY=
X-Received: by 2002:ac2:5389:0:b0:48a:1070:775d with SMTP id
 g9-20020ac25389000000b0048a1070775dmr9680580lfh.266.1658027899186; 
 Sat, 16 Jul 2022 20:18:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tFdu12D7ODq9NbhtC1HmU6l58ttbviARGOv6M08P2jXH8djHBHdpdURDPDLV+ohuCOpkaQcNuBY8svoQ5vTsE=
X-Received: by 2002:ac2:5389:0:b0:48a:1070:775d with SMTP id
 g9-20020ac25389000000b0048a1070775dmr9680565lfh.266.1658027898946; Sat, 16
 Jul 2022 20:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220715134750.63090-1-akihiko.odaki@gmail.com>
 <20220715134750.63090-2-akihiko.odaki@gmail.com>
 <675d98f9-9045-5bf9-27c7-c2d5cb0b088d@redhat.com>
 <2704624f-6e89-1938-e54f-f5ddcb0daf6e@gmail.com>
 <CABgObfb3HL_JyW2PLT-WdMH+yFDPwLaWMoFoqu_18iT+LKuZsQ@mail.gmail.com>
 <cf25f405-8cb8-ec37-8b4f-9adecfd80b13@gmail.com>
In-Reply-To: <cf25f405-8cb8-ec37-8b4f-9adecfd80b13@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 17 Jul 2022 05:18:07 +0200
Message-ID: <CABgObfZtvb7B9OC=ZtH3aybA9wKJGQo9BLAgkqmaCw-Ny-VDzA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] ui/cocoa: Run qemu_init in the main thread
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="000000000000f1d91905e3f7b34f"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000f1d91905e3f7b34f
Content-Type: text/plain; charset="UTF-8"

Il sab 16 lug 2022, 22:42 Akihiko Odaki <akihiko.odaki@gmail.com> ha
scritto:

> > Is this documented anywhere?
>
> Thread-unsafe classes (and more importantly, main thread only classes)
> are rather exceptional, and they are listed at:
>
> https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Multithreading/ThreadSafetySummary/ThreadSafetySummary.html


Being thread-safe is not the same thing as deferring to the main thread
though.

Here are a couple of examples of how things can go wrong, depending on the
implementation of Cocoa:

- applicationWillTerminate is a notification, and as such will run in the
main thread, but will applicationShouldTerminate also be called only from
the main thread? If not, is it safe to show the alert in verifyQuit?

- is the secondary thread still in terminate: when applicationWillTerminate
runs, and is it waiting for applicationWillTerminate to finish? If so,
qemu_thread_join will deadlock (because the waited thread will not exit
until applicationWillTerminate returns)

In both cases the problem is not thread-unsafety of Cocoa, but
thread-unsafety of the QEMU application delegate.

Paolo


> Regards,
> Akihiko Odaki
>
> >
> > Paolo
> >
> > Regards,
> >> Akihiko Odaki
> >>
> >>>
> >>> - here:
> >>>
> >>>       /*
> >>>        * Nothing more to do in the QEMU thread, ask the application
> >>>        * to exit.
> >>>        */
> >>>       dispatch_async(dispatch_get_main_queue(), ^{
> >>>           [NSApp terminate: nil];
> >>>       });
> >>>
> >>> - in verifyQuit:
> >>>
> >>>       if([alert runModal] == NSAlertSecondButtonReturn) {
> >>>           with_iothread_lock(^{
> >>>               shutdown_action = SHUTDOWN_ACTION_POWEROFF;
> >>>               qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);
> >>>           });
> >>>       }
> >>>       /* and just return void */
> >>>
> >>> - applicationShouldTerminate: should be just
> >>>
> >>>       if (qatomic_read(&qemu_main_terminating)) {
> >>>           return NSTerminateNow;
> >>>       } else {
> >>>           dispatch_async(dispatch_get_main_queue(), ^{
> >>>               [self verifyQuit];
> >>>           });
> >>>       }
> >>>       return NSTerminateCancel;
> >>>
> >>> - applicationWillTerminate: can be just the qemu_thread_join
> >>>
> >>> Paolo
> >>
> >>
> >
>
>

--000000000000f1d91905e3f7b34f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il sab 16 lug 2022, 22:42 Akihiko Odaki &lt;<a href=3D=
"mailto:akihiko.odaki@gmail.com" target=3D"_blank" rel=3D"noreferrer">akihi=
ko.odaki@gmail.com</a>&gt; ha scritto:</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
&gt; Is this documented anywhere?<br>
<br>
Thread-unsafe classes (and more importantly, main thread only classes) <br>
are rather exceptional, and they are listed at:<br>
<a href=3D"https://developer.apple.com/library/archive/documentation/Cocoa/=
Conceptual/Multithreading/ThreadSafetySummary/ThreadSafetySummary.html" rel=
=3D"noreferrer noreferrer noreferrer" target=3D"_blank">https://developer.a=
pple.com/library/archive/documentation/Cocoa/Conceptual/Multithreading/Thre=
adSafetySummary/ThreadSafetySummary.html</a></blockquote></div></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto">Being thread-safe is not the same t=
hing as deferring to the main thread though.=C2=A0</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Here are a couple of examples of how things can =
go wrong, depending on the implementation of Cocoa:</div><div dir=3D"auto">=
<br></div><div dir=3D"auto">- applicationWillTerminate is a notification, a=
nd as such will run in the main thread, but will applicationShouldTerminate=
 also be called only from the main thread? If not, is it safe to show the a=
lert in verifyQuit?</div><div dir=3D"auto"><br></div><div dir=3D"auto">- is=
 the secondary thread still in terminate: when applicationWillTerminate run=
s, and is it waiting for applicationWillTerminate to finish? If so, qemu_th=
read_join will deadlock (because the waited thread will not exit until appl=
icationWillTerminate returns)</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">In both cases the problem is not thread-unsafety of Cocoa, but thread=
-unsafety of the QEMU application delegate.</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Paolo=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Regards,<br>
Akihiko Odaki<br>
<br>
&gt; <br>
&gt; Paolo<br>
&gt; <br>
&gt; Regards,<br>
&gt;&gt; Akihiko Odaki<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - here:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Nothing more to do in the QEMU th=
read, ask the application<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * to exit.<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0dispatch_async(dispatch_get_main_que=
ue(), ^{<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[NSApp terminate: nil]=
;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0});<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - in verifyQuit:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if([alert runModal] =3D=3D NSAlertSe=
condButtonReturn) {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0with_iothread_lock(^{<=
br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutdown=
_action =3D SHUTDOWN_ACTION_POWEROFF;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_sys=
tem_shutdown_request(SHUTDOWN_CAUSE_HOST_UI);<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0});<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* and just return void */<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - applicationShouldTerminate: should be just<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (qatomic_read(&amp;qemu_main_term=
inating)) {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NSTerminateNow;=
<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dispatch_async(dispatc=
h_get_main_queue(), ^{<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[self ve=
rifyQuit];<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0});<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return NSTerminateCancel;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - applicationWillTerminate: can be just the qemu_thread_join<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Paolo<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
<br>
</blockquote></div></div></div>

--000000000000f1d91905e3f7b34f--


