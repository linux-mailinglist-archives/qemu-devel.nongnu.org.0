Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72420340C05
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:43:25 +0100 (CET)
Received: from localhost ([::1]:37812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwg8-0002Ht-Ar
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:43:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <susinilorenzo1@gmail.com>)
 id 1lMwdR-00018Q-3N
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:40:37 -0400
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31]:37590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <susinilorenzo1@gmail.com>)
 id 1lMwdP-0004gE-7T
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 13:40:36 -0400
Received: by mail-vs1-xe31.google.com with SMTP id e5so2005158vse.4
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 10:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iUMkDgL9MbBUAhyCc80c7fjpwC5hjzQKGPuuQXK2k8w=;
 b=IVLpDT+7K/081H1EEp64/4K+uBssa94wuTPKf+knSjvN2Z7ChJflEoQQ+6EvAEnJQa
 9u5U00z6Nla/7B6xUrfQxc2d41q5ckPiX3bpvmijgG3QzYyjunj4Uv4uDYOZL8esf4ST
 um7CY/iFsnxcWA2Gg4DEkGdoAJPDlwtD8IhmBAnoh5GWxQHOa90QVvYkwn2/8emLK2hq
 A8ZyfR3YfQ42KW+A2YYPFc2c2Hz1ZMkQVvhfMyDjacOrNAh7KXbyGe0iIfKMoEK2H7GI
 GIs9QZQaO1WPfGwanmq5jtdozfvJvelqFaQFR1KN2AaYmwBYJ/pZ4kA084VODx9J6Jpg
 HExQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iUMkDgL9MbBUAhyCc80c7fjpwC5hjzQKGPuuQXK2k8w=;
 b=X3rj2LSCiWwxGkE9xy0xlrtTEd3ICKe8kXIPgRFZhxQ/rQtCz52cQi3BCsX+xrvQwW
 zL+l4k9za8MxcWNvdyctyDYCH9/wKLpOfxfCDQO8hWg69bBj2vt8jh4h8nkeY1FCO/Ds
 KlmK3RaeeQlfuTepqgMgO9m+ZMkcQN82ORZmtAp14jPPuCxvi77x0291JuI7pJpaOVzU
 KGhjf71EnLPU3v7NqgvskzYV6sqBpCx2GrIpLJbgVsOky1hNWAQ11kFUg50DpX2JSzYy
 1JyvDuyC8d9tzotUCDbKQ8RncfKZzhLqHfoMZ1OPzkHo96N0grwVIaXW0IazhsA9wA21
 6kUw==
X-Gm-Message-State: AOAM530amkJyWSh2mAzmD/1uD40nyGZ6XDFtrQ6eBZnak+sO30MeA/kI
 SQknSMjIKokt1cOngTCTUmjc8hR4kH5enPlReNc=
X-Google-Smtp-Source: ABdhPJwe3ks6WiJvIjBlIdJLSXfosEcRHyF+t9X4yHJgm4oVJZuWIOk53JI6FdTQ9LnvzOSmmnRpsh/tqSJxAPy6vHU=
X-Received: by 2002:a67:bc11:: with SMTP id t17mr359563vsn.51.1616089234019;
 Thu, 18 Mar 2021 10:40:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAHFRQs1GuB+8tw+SDK11LOLXF4H6z+6+ZbQMTABXNK3gj7vffA@mail.gmail.com>
 <f05ce059-0802-404f-e2df-f8a7ddfc43c5@redhat.com>
 <a82e8771-913c-8dc4-03cf-c6148db1e15d@redhat.com>
In-Reply-To: <a82e8771-913c-8dc4-03cf-c6148db1e15d@redhat.com>
From: Lorenzo Susini <susinilorenzo1@gmail.com>
Date: Thu, 18 Mar 2021 18:40:22 +0100
Message-ID: <CAHFRQs1TM_j4OYMQiqqf5fAAvFPkeaV+OF2FWm=r9jHPtkyB-Q@mail.gmail.com>
Subject: Re: KVM_MEM_READONLY slot flag not working properly
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b81a2805bdd31881"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e31;
 envelope-from=susinilorenzo1@gmail.com; helo=mail-vs1-xe31.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b81a2805bdd31881
Content-Type: text/plain; charset="UTF-8"

Well I'm sorry but I didn't know IDT was marked as read only by Linux. If
it is read only, how can you
register any new interrupt handler? I guess it's a way of securing stuff
against malicious attacks.
I was taking for granted that the IDT was written when registering a new
irq handler,
given that when an interrupt is raised, the new specified handler has to be
called
and its address should be retrieved in some way, that is by storing it in
the IDT.

I'm sorry, I'm a student and I'm trying to understand things,
Thank you,
Lorenzo

Il giorno gio 18 mar 2021 alle ore 18:04 Paolo Bonzini <pbonzini@redhat.com>
ha scritto:

> On 18/03/21 17:07, Laszlo Ersek wrote:
> > However, when I try to register a new interrupt handler (for instance for
> > the edu device, just to try it out), it works perfectly,
> > meaning that the IDT is not really read-only. Do you have any idea why?
> Any
> > suggestions on how to solve the problem?
> > Of course I've also checked KVM_CAP_READONLY_MEM, no problem with that.
>
> Sorry for asking a question that might be extremely stupid, but: did you
> check that the guest is writing to the IDT?  For example Linux never
> modifies the IDT when it runs, in fact it even makes it read only (check
> out idt_setup_apic_and_irq_gates in arch/x86/kernel/idt.c).
>
> Paolo
>
>

--000000000000b81a2805bdd31881
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Well I&#39;m sorry but I didn&#39;t know IDT was mark=
ed as read only by Linux. If it is read only, how can you=C2=A0</div><div>r=
egister any new interrupt handler? I guess it&#39;s a way of securing stuff=
 against malicious attacks.=C2=A0</div>I was taking for granted that the ID=
T was written when registering a new irq handler,=C2=A0<div>given that when=
 an interrupt is raised, the new specified handler has to be called=C2=A0</=
div><div>and its address should be retrieved in some way, that=C2=A0is by s=
toring it in the IDT.</div><div><br></div><div>I&#39;m sorry, I&#39;m a stu=
dent and I&#39;m trying to understand things,=C2=A0</div><div>Thank you,=C2=
=A0</div><div>Lorenzo</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">Il giorno gio 18 mar 2021 alle ore 18:04 Paolo B=
onzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzin=
i@redhat.com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On 18/03/21 17:07, Laszlo Ersek wrote:<br>
&gt; However, when I try to register a new interrupt handler (for instance =
for<br>
&gt; the edu device, just to try it out), it works perfectly,<br>
&gt; meaning that the IDT is not really read-only. Do you have any idea why=
? Any<br>
&gt; suggestions on how to solve the problem?<br>
&gt; Of course I&#39;ve also checked KVM_CAP_READONLY_MEM, no problem with =
that.<br>
<br>
Sorry for asking a question that might be extremely stupid, but: did you <b=
r>
check that the guest is writing to the IDT?=C2=A0 For example Linux never <=
br>
modifies the IDT when it runs, in fact it even makes it read only (check <b=
r>
out idt_setup_apic_and_irq_gates in arch/x86/kernel/idt.c).<br>
<br>
Paolo<br>
<br>
</blockquote></div>

--000000000000b81a2805bdd31881--

