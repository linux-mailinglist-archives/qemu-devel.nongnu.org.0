Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 911703FE78A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 04:20:07 +0200 (CEST)
Received: from localhost ([::1]:42754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLcKk-0002cU-7D
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 22:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mLcIp-0001tq-Kz
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 22:18:08 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:39560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jiaduo19920301@gmail.com>)
 id 1mLcIn-00074a-Dd
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 22:18:07 -0400
Received: by mail-io1-xd2f.google.com with SMTP id m11so550369ioo.6
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 19:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5lPlNL7uXV7Ov2jZ7Hvwn51OMoT3RzHXmcPgnTs9bYE=;
 b=Z8PiFVCNFSKKR9IdEtbuTp9Iss5T3pV9kTewD6ckkNR8iHzqWdfavko9VrTrMjV6bc
 FNS1jDeAcSjmBiBd4Hk+q9DF9J9UXYl8NVJ3Q0+eFvVGmTiQvnNaKCUy+F0u+4EWtzIu
 CstjLaVJfWQmW4/S8tCRXurIF4Mvlm4uzbVFzVdFnQFSc213kJcsJEOO8KjtDmPOOEgH
 IN/zl9PVlw/+vsiDUXEMHOwenWzriOXoWakmQzSHzHfr2nfGmdOX0YdPdrL0gIWVpF/M
 kUwgYHL/Ki8k7/z70BYtn0bcmm2x4jAv2kuKjF+daE8Ri8dwzJbZojThJHaKKyT2ddUA
 YKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5lPlNL7uXV7Ov2jZ7Hvwn51OMoT3RzHXmcPgnTs9bYE=;
 b=IUIkLQL+CTUScUwx1gQcF8peK1VS/q2macFwoCf+sw2UjZLboFKKGNXu16M6FbWBK/
 aCTL7PPBujvSlqZ3wl22++yD1TxOPQje0W84y9gEe+b4Qhz1a59dtJZIcPS7CP3jMHhp
 +7lgZ/s+wtA9BrqUTxLMeMoxgH+dw3bo6mnuqC6ERKdyCOAlDIn8kPDPm7yf6aclLOx3
 Y5RfAEQnuiWe3DNW39jqLiS5rk2ZxcNG1jlMGJzhdVELvWsYUk3zoebX2h/hgGF0xhKQ
 1JXmWDP1H2GlQMpOonn/25xTh7op1Z/4pOWnf/i1exwRhMa/6WGJzgc76azNr3l8MP66
 x9Rg==
X-Gm-Message-State: AOAM5317s6wKREolKckp5UiN8owflsxm2Vwb0Sl0uq8TnSO7Dyz/Re5n
 v8jqk6N9Anokj3P5iTlOaA2MDk2kL/a7Ii6x3no=
X-Google-Smtp-Source: ABdhPJzlzhVyNF1xFoTFf1+d5j8pN0PG2geP1w1iQkicTOfRRStOtZAG26ySyYVYObiIJEAFiI37+HuswJe7HG6c7ZU=
X-Received: by 2002:a5d:9b99:: with SMTP id r25mr796389iom.104.1630549083700; 
 Wed, 01 Sep 2021 19:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <CALUzjTYPpo680Ub6CCx7-N2o=Q6Q6Kh=DLNCcUq-1F0JbCThOw@mail.gmail.com>
 <CAFEAcA89Dua-t14v3DH-LFG+4UDtU81PuaTOruLTQJw+T25eiA@mail.gmail.com>
In-Reply-To: <CAFEAcA89Dua-t14v3DH-LFG+4UDtU81PuaTOruLTQJw+T25eiA@mail.gmail.com>
From: Duo jia <jiaduo19920301@gmail.com>
Date: Thu, 2 Sep 2021 10:17:52 +0800
Message-ID: <CALUzjTY56_A3mMtvWGFTyyZAKshWSeUfcHWJFFxYSm7P7BuNAQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_How_does_qemu_detect_the_completion_of_interrupt?=
 =?UTF-8?Q?_execution=EF=BC=9F?=
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000ec420205caf9ca14"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=jiaduo19920301@gmail.com; helo=mail-io1-xd2f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ec420205caf9ca14
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

  Hi,
   thank you for your response.
   As you say

>  "
> *End of interrupt handling is entirely dependent on what the*
> *guest hardware being emulated is. Usually the guest software*
> *will indicate "interrupt handled" back to the interrupt*
> *controller (perhaps by writing a register; depends on the*
> *interrupt controller), and the interrupt controller will*
> *then look at what the next highest priority pending interrupt*
> *is and signal that back to the CPU, or do nothing if there's*
> *no new interrupt. So the second interrupt will automatically*
> *be taken and handled once the first one has finished,*
> *as a result of this interrupt controller and guest OS**interaction*."

I agree with that. I has try some method, But Still have some problems.

Q1:
My guest(target) cpu seem don't have a  * "interrupt handled" , *And I
don't know How/When to program the  "* interrupt controller"   *to check
the second interrupt when the first over.

Q2:
Also I found the new problem(maybe bug) , when first interrupt  not over,
the second interrupt may occure, this case Interrupt nesting =EF=BC=8Cif I =
check
Interrupt flag in the code=EF=BC=8Cthe second interrupt losed=E3=80=82

I don't know the interrupt mechanism of qemu very well. If you have any
suggestions, I am very happy to receive them.

this is my code=EF=BC=9A

/* set irq for device */
> static void stm8_cpu_set_irq(void *opaque, int irq, int level)
> {
>     //printf("%s\n",__func__);
>     STM8CPU *cpu =3D opaque;
>     CPUSTM8State *env =3D &cpu->env;
>     CPUState *cs =3D CPU(cpu);
>     uint64_t mask =3D (1ull << irq);
>
>     //printf("irq:%d , level:%d\n",irq,level);
>     if (level) {
>         env->intsrc |=3D mask;
>         cpu_interrupt(cs, CPU_INTERRUPT_HARD);
>     } else {
>         env->intsrc &=3D ~mask;
>         if (env->intsrc =3D=3D 0) {
>             cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
>         }
>     }
> }
>

bool stm8_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
> {
>     //printf("%s\n",__func__);
>     CPUClass *cpu_cc =3D CPU_GET_CLASS(cs);
>     STM8CPU *cpu =3D STM8_CPU(cs);
>     CPUSTM8State *env =3D &cpu->env;
>     int idx =3D -1;
>
>     /* Check interrupt */
>     if (!cpu_interrupts_enabled(env)){
>         qemu_log_mask(LOG_GUEST_ERROR,"[CPU] cpu_interrupts_enabled =3D
> false.\n");
>         //return false;
>     }
>     if (interrupt_request & CPU_INTERRUPT_RESET)
>     {
>         idx =3D 0;
>         cs->interrupt_request &=3D ~CPU_INTERRUPT_RESET;
>     }
>     if (interrupt_request & CPU_INTERRUPT_HARD) {
>         if(env->intsrc !=3D 0){
>             idx =3D ctz32(env->intsrc);
>             env->intsrc &=3D ~(1<<idx);
>
>             cs->interrupt_request &=3D ~CPU_INTERRUPT_HARD;
>             /* Map interrupt */
>             idx =3D EXCP_INT(idx);
>         }
>     }
>     if (idx >=3D 0) {
>         cs->exception_index =3D idx;
>         cpu_cc->do_interrupt(cs);
>         return true;
>     }
>     return false;
> }
>





Peter Maydell <peter.maydell@linaro.org> =E4=BA=8E2021=E5=B9=B48=E6=9C=886=
=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=886:16=E5=86=99=E9=81=93=EF=BC=
=9A

> On Fri, 6 Aug 2021 at 07:24, Duo jia <jiaduo19920301@gmail.com> wrote:
> > I am simulating a device. When an interrupt occurs, another interrupt
> > comes, and the second interrupt will not be triggered because the
> > first interrupt has not yet finished.
> >
> > I want to know whether qemu can detect whether the interrupt has been
> > executed, will there be a callback here?
> > Or how can I deal with this situation?
>
> End of interrupt handling is entirely dependent on what the
> guest hardware being emulated is. Usually the guest software
> will indicate "interrupt handled" back to the interrupt
> controller (perhaps by writing a register; depends on the
> interrupt controller), and the interrupt controller will
> then look at what the next highest priority pending interrupt
> is and signal that back to the CPU, or do nothing if there's
> no new interrupt. So the second interrupt will automatically
> be taken and handled once the first one has finished,
> as a result of this interrupt controller and guest OS
> interaction.
>
> The original device usually doesn't get told when this
> happens, and it doesn't need to know. For example, one common
> form of device interrupt is level-triggered. Here the device
> has some condition (perhaps "FIFO full") that causes an
> interrupt. So it raises its outbound IRQ line when the FIFO
> is full, and it doesn't lower it again until whatever the
> device specification says is the condition (eg when the
> guest reads from the FIFO, or if the guest writes to some
> 'clear interrupt' register on the device). It's the job of
> the guest software to make sure that when it gets an interrupt
> from the device that it handles it such that the device has
> been satisfied and lowered the interrupt.
>
> More rarely, some devices are specified to pulse their interrupt
> line when a condition occurs.
>
> In summary, you need to look at the specification of the device
> you're emulating to find out when and how it is supposed to
> raise or lower its interrupt line. ("I didn't get a second
> interrupt" bugs might also be caused by bugs in the interrupt
> controller or in the guest software device driver -- if you're
> just using an existing known-to-work QEMU interrupt controller
> model and a known-to-work device driver and OS, then the
> bug is very likely in your device model. If you're also
> writing the OS device driver at the same time then the bug
> could be there instead.)
>
> -- PMM
>

--000000000000ec420205caf9ca14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">=C2=A0 Hi,<div>=C2=A0 =C2=A0thank you for your response.</=
div><div>=C2=A0 =C2=A0As you say</div><span class=3D"gmail-im" style=3D"col=
or:rgb(80,0,80)"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0&q=
uot;<i>End of interrupt handling is entirely dependent on what the<br></i><=
i>guest hardware being emulated is. Usually the guest software<br></i><i>wi=
ll indicate &quot;interrupt handled&quot; back to the interrupt<br></i><i>c=
ontroller (perhaps by writing a register; depends on the<br></i><i>interrup=
t controller), and the interrupt controller will<br></i><i>then look at wha=
t the next highest priority pending interrupt<br></i><i>is and signal that =
back to the CPU, or do nothing if there&#39;s<br></i><i>no new interrupt. S=
o the second interrupt will automatically<br></i><i>be taken and handled on=
ce the first one has finished,<br></i><i>as a result of this interrupt cont=
roller and guest OS<br></i><i>interaction</i>.&quot;</blockquote><div><i></=
i></div></span><div>I agree with that. I has try some method, But=C2=A0Stil=
l have some problems.</div><div><br></div><div>Q1:</div><div>My guest(targe=
t) cpu seem don&#39;t have a=C2=A0=C2=A0<i>=C2=A0&quot;interrupt handled&qu=
ot;=C2=A0,=C2=A0</i>And<i>=C2=A0</i>I don&#39;t know=C2=A0How/When to progr=
am the=C2=A0 &quot;<i>=C2=A0interrupt controller&quot;=C2=A0 =C2=A0</i>to c=
heck the second interrupt when the first over.</div><div><br></div><div>Q2:=
</div><div>Also I found the new problem(maybe bug) , when first interrupt=
=C2=A0 not over, the second interrupt may occure, this case=C2=A0Interrupt =
nesting =EF=BC=8Cif I check Interrupt flag in the code=EF=BC=8Cthe second i=
nterrupt losed=E3=80=82</div><div><br></div><div>I don&#39;t know the inter=
rupt mechanism of qemu very well. If you have any suggestions, I am very ha=
ppy to receive them.<br></div><div><br></div><div>this is my code=EF=BC=9A<=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">/* se=
t irq for device */<br>static void stm8_cpu_set_irq(void *opaque, int irq, =
int level)<br>{<br>=C2=A0 =C2=A0 //printf(&quot;%s\n&quot;,__func__);<br>=
=C2=A0 =C2=A0 STM8CPU *cpu =3D opaque;<br>=C2=A0 =C2=A0 CPUSTM8State *env =
=3D &amp;cpu-&gt;env;<br>=C2=A0 =C2=A0 CPUState *cs =3D CPU(cpu);<br>=C2=A0=
 =C2=A0 uint64_t mask =3D (1ull &lt;&lt; irq);<br><br>=C2=A0 =C2=A0 //print=
f(&quot;irq:%d , level:%d\n&quot;,irq,level);<br>=C2=A0 =C2=A0 if (level) {=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;intsrc |=3D mask;<br>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 cpu_interrupt(cs, CPU_INTERRUPT_HARD);<br>=C2=A0 =C2=A0 } els=
e {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 env-&gt;intsrc &amp;=3D ~mask;<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if (env-&gt;intsrc =3D=3D 0) {<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 }<br>}<br></blockquote><div>=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">bool stm8_cpu_e=
xec_interrupt(CPUState *cs, int interrupt_request)<br>{<br>=C2=A0 =C2=A0 //=
printf(&quot;%s\n&quot;,__func__);<br>=C2=A0 =C2=A0 CPUClass *cpu_cc =3D CP=
U_GET_CLASS(cs);<br>=C2=A0 =C2=A0 STM8CPU *cpu =3D STM8_CPU(cs);<br>=C2=A0 =
=C2=A0 CPUSTM8State *env =3D &amp;cpu-&gt;env;<br>=C2=A0 =C2=A0 int idx =3D=
 -1;<br><br>=C2=A0 =C2=A0 /* Check interrupt */<br>=C2=A0 =C2=A0 if (!cpu_i=
nterrupts_enabled(env)){<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_log_mask(LOG_G=
UEST_ERROR,&quot;[CPU] cpu_interrupts_enabled =3D false.\n&quot;);<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 //return false;=C2=A0<br>=C2=A0 =C2=A0 }<br>=C2=A0=
 =C2=A0 if (interrupt_request &amp; CPU_INTERRUPT_RESET)<br>=C2=A0 =C2=A0 {=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 idx =3D 0;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
s-&gt;interrupt_request &amp;=3D ~CPU_INTERRUPT_RESET;<br>=C2=A0 =C2=A0 }<b=
r>=C2=A0 =C2=A0 if (interrupt_request &amp; CPU_INTERRUPT_HARD) {<br>=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 if(env-&gt;intsrc !=3D 0){<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 idx =3D ctz32(env-&gt;intsrc);<br>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 env-&gt;intsrc &amp;=3D ~(1&lt;&lt;idx);<br><br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;interrupt_request &amp;=3D ~C=
PU_INTERRUPT_HARD;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Map inte=
rrupt */<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 idx =3D EXCP_INT(idx)=
;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 if (=
idx &gt;=3D 0) {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 cs-&gt;exception_index =3D =
idx;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 cpu_cc-&gt;do_interrupt(cs);<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 return true;<br>=C2=A0 =C2=A0 }<br>=C2=A0 =C2=A0 retur=
n false;<br>}<br></blockquote><div>=C2=A0</div><div><br></div><div><br></di=
v><div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" ta=
rget=3D"_blank">peter.maydell@linaro.org</a>&gt; =E4=BA=8E2021=E5=B9=B48=E6=
=9C=886=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=886:16=E5=86=99=E9=81=93=
=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri=
, 6 Aug 2021 at 07:24, Duo jia &lt;<a href=3D"mailto:jiaduo19920301@gmail.c=
om" target=3D"_blank">jiaduo19920301@gmail.com</a>&gt; wrote:<br>
&gt; I am simulating a device. When an interrupt occurs, another interrupt<=
br>
&gt; comes, and the second interrupt will not be triggered because the<br>
&gt; first interrupt has not yet finished.<br>
&gt;<br>
&gt; I want to know whether qemu can detect whether the interrupt has been<=
br>
&gt; executed, will there be a callback here?<br>
&gt; Or how can I deal with this situation?<br>
<br>
End of interrupt handling is entirely dependent on what the<br>
guest hardware being emulated is. Usually the guest software<br>
will indicate &quot;interrupt handled&quot; back to the interrupt<br>
controller (perhaps by writing a register; depends on the<br>
interrupt controller), and the interrupt controller will<br>
then look at what the next highest priority pending interrupt<br>
is and signal that back to the CPU, or do nothing if there&#39;s<br>
no new interrupt. So the second interrupt will automatically<br>
be taken and handled once the first one has finished,<br>
as a result of this interrupt controller and guest OS<br>
interaction.<br>
<br>
The original device usually doesn&#39;t get told when this<br>
happens, and it doesn&#39;t need to know. For example, one common<br>
form of device interrupt is level-triggered. Here the device<br>
has some condition (perhaps &quot;FIFO full&quot;) that causes an<br>
interrupt. So it raises its outbound IRQ line when the FIFO<br>
is full, and it doesn&#39;t lower it again until whatever the<br>
device specification says is the condition (eg when the<br>
guest reads from the FIFO, or if the guest writes to some<br>
&#39;clear interrupt&#39; register on the device). It&#39;s the job of<br>
the guest software to make sure that when it gets an interrupt<br>
from the device that it handles it such that the device has<br>
been satisfied and lowered the interrupt.<br>
<br>
More rarely, some devices are specified to pulse their interrupt<br>
line when a condition occurs.<br>
<br>
In summary, you need to look at the specification of the device<br>
you&#39;re emulating to find out when and how it is supposed to<br>
raise or lower its interrupt line. (&quot;I didn&#39;t get a second<br>
interrupt&quot; bugs might also be caused by bugs in the interrupt<br>
controller or in the guest software device driver -- if you&#39;re<br>
just using an existing known-to-work QEMU interrupt controller<br>
model and a known-to-work device driver and OS, then the<br>
bug is very likely in your device model. If you&#39;re also<br>
writing the OS device driver at the same time then the bug<br>
could be there instead.)<br>
<br>
-- PMM<br>
</blockquote></div></div>

--000000000000ec420205caf9ca14--

