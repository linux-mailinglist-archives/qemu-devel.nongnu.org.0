Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C22D65C116
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 14:47:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pChcY-0003j1-1R; Tue, 03 Jan 2023 08:46:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pChcV-0003iD-E3
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 08:46:23 -0500
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pChcS-0008GT-Jx
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 08:46:23 -0500
Received: by mail-vk1-xa36.google.com with SMTP id z190so11075006vka.4
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 05:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9inCaSxilZkSj+JdkoJw6psT8jgIImgwj0nohq0lo4c=;
 b=kPwXLVyv2ZwEGhkBM+y7n5NlITGX0wd3hIemqcVPNFxe8WOPaElB5LsHlFoOYcVujd
 ZVmiDf6MqCaFwJyalFbomYELBwkH4QTqt0ZBH185P+qb6PknMNLimzEAKLeudnEGkGur
 XwsqidenZ41UJ9KQNbqR63n3CDkOckv+KaJ2Oz4jPcYGwya7myanfdsCEF8Aw24LGeJ3
 EoyGERboO+gKlDVD14I0c7UxlEIYhGKakY8YRVtVyZVblGjROg4qQlJrcK40D+UA+lAP
 cFTWEUsujkg284buZPqXosYu6oq6wdRnMlZTM1K6nHmeUnsoc1/9J7HwOsg35MS/ZvPY
 TJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9inCaSxilZkSj+JdkoJw6psT8jgIImgwj0nohq0lo4c=;
 b=bGn2DhC/+USAQKnONuWVYo8ohpST02UsxAwK7AiIwZNZE9L8cezkbQX86EPLy7hXAi
 bCgnSmltIlSdpv7Wh/zmMv1kf0E7jh4k4QWgk/9nfnposm4d+NNaj0vGuaLBcLjVf3nm
 U+X+YP5vUURKUPd6KGW1MjDicNYAgY+xi9HGP1TW33jKWMuSHuS1CTaHnUkO4x853aZW
 XSvquZJQ2in7KVUc4UZK0X6o1d3qYdaQZSKZp3PM7rhvRsuelOr5kcsk7DKzGp2MoKr+
 qnmsiJlrIJxBMaO3VgOEbkSDi9HCQ1U91/qJQBp91+2O0u+d1iQUzNhLt/BhzHl0Hyy8
 thPQ==
X-Gm-Message-State: AFqh2kp4YovYQe30Fwu9jafZ3sPwqy47+9rGylq1g5CLbQxIipjIEl1X
 k5zhxg+yfQznn0XilOdkqEjH73JbRvW2OA6e/Pk=
X-Google-Smtp-Source: AMrXdXs+fSNwR7JpYce7UTWmF4IF+ceupPTYnF0nmX++r/t8aH9vwlIVmDAyGVSI8L4YicX9cq1DIvFvcXVxq89DMmM=
X-Received: by 2002:a1f:c703:0:b0:3d5:5abd:2a61 with SMTP id
 x3-20020a1fc703000000b003d55abd2a61mr2996474vkf.27.1672753579266; Tue, 03 Jan
 2023 05:46:19 -0800 (PST)
MIME-Version: 1.0
References: <20230103084801.20437-1-thuth@redhat.com>
 <20230103084801.20437-5-thuth@redhat.com>
 <CAG4p6K7qqWZO9esJeuhAUh=EBDu_B=Y5PgS8_6okzyMiTV1oDQ@mail.gmail.com>
In-Reply-To: <CAG4p6K7qqWZO9esJeuhAUh=EBDu_B=Y5PgS8_6okzyMiTV1oDQ@mail.gmail.com>
From: Bernhard Beschow <shentey@gmail.com>
Date: Tue, 3 Jan 2023 14:46:04 +0100
Message-ID: <CAG4p6K7f==1iOvBcvjz3pjCLP_+MtUxEqCSkTu9Dp0chR1AnUw@mail.gmail.com>
Subject: Re: [PATCH 4/6] hw/rtc/mc146818rtc: Add a property for the
 availability of the slew tick policy
To: Thomas Huth <thuth@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Michael S Tsirkin <mst@redhat.com>,
 qemu-devel@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 BALATON Zoltan <balaton@eik.bme.hu>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: multipart/alternative; boundary="000000000000e398b305f15c4aab"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a36;
 envelope-from=shentey@gmail.com; helo=mail-vk1-xa36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000e398b305f15c4aab
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 3, 2023 at 2:32 PM Bernhard Beschow <shentey@gmail.com> wrote:

>
>
> On Tue, Jan 3, 2023 at 9:48 AM Thomas Huth <thuth@redhat.com> wrote:
>
>> We want to get rid of the "#ifdef TARGET_I386" statements in the mc146818
>> code, so we need a different way to decide whether the slew tick policy
>> is available or not. Introduce a new property "slew-tick-policy-available"
>> which can be set by the machines that support this tick policy.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  include/hw/rtc/mc146818rtc.h |  1 +
>>  hw/i386/pc_piix.c            |  1 +
>>  hw/isa/lpc_ich9.c            |  1 +
>>  hw/isa/piix3.c               |  1 +
>>  hw/rtc/mc146818rtc.c         | 16 ++++++++++------
>>  5 files changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
>> index 1db0fcee92..54af63d091 100644
>> --- a/include/hw/rtc/mc146818rtc.h
>> +++ b/include/hw/rtc/mc146818rtc.h
>> @@ -45,6 +45,7 @@ struct RTCState {
>>      QEMUTimer *coalesced_timer;
>>      Notifier clock_reset_notifier;
>>      LostTickPolicy lost_tick_policy;
>> +    bool slew_tick_policy_available;
>>      Notifier suspend_notifier;
>>      QLIST_ENTRY(RTCState) link;
>>  };
>> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
>> index bc9ea8cdae..382c6add3b 100644
>> --- a/hw/i386/pc_piix.c
>> +++ b/hw/i386/pc_piix.c
>> @@ -233,6 +233,7 @@ static void pc_init1(MachineState *machine,
>>
>>          rtc_state = isa_new(TYPE_MC146818_RTC);
>>          qdev_prop_set_int32(DEVICE(rtc_state), "base_year", 2000);
>> +        qdev_prop_set_bit(DEVICE(rtc_state),
>> "slew-tick-policy-available", true);
>>          isa_realize_and_unref(rtc_state, isa_bus, &error_fatal);
>>
>>          i8257_dma_init(isa_bus, 0);
>> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
>> index 498175c1cc..aeab4d8549 100644
>> --- a/hw/isa/lpc_ich9.c
>> +++ b/hw/isa/lpc_ich9.c
>> @@ -733,6 +733,7 @@ static void ich9_lpc_realize(PCIDevice *d, Error
>> **errp)
>>
>>      /* RTC */
>>      qdev_prop_set_int32(DEVICE(&lpc->rtc), "base_year", 2000);
>> +    qdev_prop_set_bit(DEVICE(&lpc->rtc), "slew-tick-policy-available",
>> true);
>>
>
> In order to not bake in machine-specific assumptions in the device model
> I'd move this assignment to pc_q35.c (see below).
>
>      if (!qdev_realize(DEVICE(&lpc->rtc), BUS(isa_bus), errp)) {
>>          return;
>>      }
>> diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
>> index c68e51ddad..825b1cbee2 100644
>> --- a/hw/isa/piix3.c
>> +++ b/hw/isa/piix3.c
>> @@ -316,6 +316,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error
>> **errp)
>>
>>      /* RTC */
>>      qdev_prop_set_int32(DEVICE(&d->rtc), "base_year", 2000);
>> +    qdev_prop_set_bit(DEVICE(&d->rtc), "slew-tick-policy-available",
>> true);
>>
>      if (!qdev_realize(DEVICE(&d->rtc), BUS(isa_bus), errp)) {
>>          return;
>>      }
>>
>
> This section will be reused for PIIX4 in my PIIX consolidation series.
> PIIX4 is used in Malta where we want the property to be false. What you
> could do instead is to set the property between creation and realization of
> TYPE_PIIX3_DEVICE in pc_piix.c. There is also a patch in my PIIX
> consolidation series you could take advantage of:
>   https://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg03792.html
>

Perhaps it'd make sense to upstream part of my PIIX consolidation series up
to and including
https://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg03804.html to
avoid merge conflicts? This part should not be blocked by MIPS and could
release Phil from some pressure. Since that series also depends on
https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg03310.html it
could be upstreamed already as well.

Best regards,
Bernhard

Having applied the patch, you can then move the assignment to rtc_state
> between pci_new_multifunction() and pci_realize_and_unref() and set the
> property like so:
>
> https://github.com/shentok/qemu/commit/2277b0abab6bc514824cd7dd76a1476485d67f50
> .
> There, you could even just set the property to true if kvm_enabled() but
> we may need a deprecation period for this. Does it make sense to add a
> deprecation message now?
>
> Moreover, setting the property in pc_piix would also just work with other
> south bridges such as VT82Cxx which I've also got working with the PC
> machine!
> https://github.com/shentok/qemu/tree/pc-via
>
> Best regards,
> Bernhard
>
> > diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
>>
>> index 947d68c257..86381a74c3 100644
>> --- a/hw/rtc/mc146818rtc.c
>> +++ b/hw/rtc/mc146818rtc.c
>> @@ -922,14 +922,16 @@ static void rtc_realizefn(DeviceState *dev, Error
>> **errp)
>>      rtc_set_date_from_host(isadev);
>>
>>      switch (s->lost_tick_policy) {
>> -#ifdef TARGET_I386
>> -    case LOST_TICK_POLICY_SLEW:
>> -        s->coalesced_timer =
>> -            timer_new_ns(rtc_clock, rtc_coalesced_timer, s);
>> -        break;
>> -#endif
>>      case LOST_TICK_POLICY_DISCARD:
>>          break;
>> +    case LOST_TICK_POLICY_SLEW:
>> +#ifdef TARGET_I386
>> +        if (s->slew_tick_policy_available) {
>> +            s->coalesced_timer = timer_new_ns(rtc_clock,
>> rtc_coalesced_timer, s);
>> +            break;
>> +        }
>> +#endif
>> +        /* fallthrough */
>>      default:
>>          error_setg(errp, "Invalid lost tick policy.");
>>          return;
>> @@ -989,6 +991,8 @@ static Property mc146818rtc_properties[] = {
>>      DEFINE_PROP_UINT8("irq", RTCState, isairq, RTC_ISA_IRQ),
>>      DEFINE_PROP_LOSTTICKPOLICY("lost_tick_policy", RTCState,
>>                                 lost_tick_policy,
>> LOST_TICK_POLICY_DISCARD),
>> +    DEFINE_PROP_BOOL("slew-tick-policy-available", RTCState,
>> +                     slew_tick_policy_available, false),
>>      DEFINE_PROP_END_OF_LIST(),
>>  };
>>
>> --
>> 2.31.1
>>
>>

--000000000000e398b305f15c4aab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 3, 2023 at 2:32 PM Bernha=
rd Beschow &lt;<a href=3D"mailto:shentey@gmail.com">shentey@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 3, 2023 at 9:48 AM Thomas Huth =
&lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_blank">thuth@redhat.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">W=
e want to get rid of the &quot;#ifdef TARGET_I386&quot; statements in the m=
c146818<br>
code, so we need a different way to decide whether the slew tick policy<br>
is available or not. Introduce a new property &quot;slew-tick-policy-availa=
ble&quot;<br>
which can be set by the machines that support this tick policy.<br>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/hw/rtc/mc146818rtc.h |=C2=A0 1 +<br>
=C2=A0hw/i386/pc_piix.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 =
+<br>
=C2=A0hw/isa/lpc_ich9.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 =
+<br>
=C2=A0hw/isa/piix3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 1 +<br>
=C2=A0hw/rtc/mc146818rtc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 ++++++++++=
------<br>
=C2=A05 files changed, 14 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h<br=
>
index 1db0fcee92..54af63d091 100644<br>
--- a/include/hw/rtc/mc146818rtc.h<br>
+++ b/include/hw/rtc/mc146818rtc.h<br>
@@ -45,6 +45,7 @@ struct RTCState {<br>
=C2=A0 =C2=A0 =C2=A0QEMUTimer *coalesced_timer;<br>
=C2=A0 =C2=A0 =C2=A0Notifier clock_reset_notifier;<br>
=C2=A0 =C2=A0 =C2=A0LostTickPolicy lost_tick_policy;<br>
+=C2=A0 =C2=A0 bool slew_tick_policy_available;<br>
=C2=A0 =C2=A0 =C2=A0Notifier suspend_notifier;<br>
=C2=A0 =C2=A0 =C2=A0QLIST_ENTRY(RTCState) link;<br>
=C2=A0};<br>
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c<br>
index bc9ea8cdae..382c6add3b 100644<br>
--- a/hw/i386/pc_piix.c<br>
+++ b/hw/i386/pc_piix.c<br>
@@ -233,6 +233,7 @@ static void pc_init1(MachineState *machine,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtc_state =3D isa_new(TYPE_MC146818_RTC);=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qdev_prop_set_int32(DEVICE(rtc_state), &q=
uot;base_year&quot;, 2000);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_bit(DEVICE(rtc_state), &quot;sle=
w-tick-policy-available&quot;, true);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isa_realize_and_unref(rtc_state, isa_bus,=
 &amp;error_fatal);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i8257_dma_init(isa_bus, 0);<br>
diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c<br>
index 498175c1cc..aeab4d8549 100644<br>
--- a/hw/isa/lpc_ich9.c<br>
+++ b/hw/isa/lpc_ich9.c<br>
@@ -733,6 +733,7 @@ static void ich9_lpc_realize(PCIDevice *d, Error **errp=
)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* RTC */<br>
=C2=A0 =C2=A0 =C2=A0qdev_prop_set_int32(DEVICE(&amp;lpc-&gt;rtc), &quot;bas=
e_year&quot;, 2000);<br>
+=C2=A0 =C2=A0 qdev_prop_set_bit(DEVICE(&amp;lpc-&gt;rtc), &quot;slew-tick-=
policy-available&quot;, true);<br></blockquote><div><br></div><div>In order=
 to not bake in machine-specific assumptions in the device model I&#39;d mo=
ve this assignment to pc_q35.c (see below).</div><div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0if (!qdev_realize(DEVICE(&amp;lpc-&gt;rtc), BUS(isa_bus=
), errp)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c<br>
index c68e51ddad..825b1cbee2 100644<br>
--- a/hw/isa/piix3.c<br>
+++ b/hw/isa/piix3.c<br>
@@ -316,6 +316,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error **e=
rrp)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* RTC */<br>
=C2=A0 =C2=A0 =C2=A0qdev_prop_set_int32(DEVICE(&amp;d-&gt;rtc), &quot;base_=
year&quot;, 2000);<br>
+=C2=A0 =C2=A0 qdev_prop_set_bit(DEVICE(&amp;d-&gt;rtc), &quot;slew-tick-po=
licy-available&quot;, true); <br></blockquote><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0if (!qdev_realize(DEVICE(&amp;d-&gt;rtc), BUS(isa_bus),=
 errp)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br></blockquote><div><br></div><div>This section will=
 be reused for PIIX4 in my PIIX consolidation series. PIIX4 is used in Malt=
a where  we want the property to be false. What you could do instead is to =
set the property between creation and realization of TYPE_PIIX3_DEVICE in p=
c_piix.c. There is also a patch in my PIIX consolidation series you could t=
ake advantage of:<br></div><div>=C2=A0 <a href=3D"https://lists.nongnu.org/=
archive/html/qemu-devel/2022-12/msg03792.html" target=3D"_blank">https://li=
sts.nongnu.org/archive/html/qemu-devel/2022-12/msg03792.html</a></div></div=
></div></blockquote><div><br></div><div>Perhaps it&#39;d make sense to upst=
ream part of my PIIX consolidation series up to and  including <a href=3D"h=
ttps://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg03804.html">http=
s://lists.nongnu.org/archive/html/qemu-devel/2022-12/msg03804.html</a> to a=
void merge conflicts? This part should not be blocked by MIPS and could rel=
ease Phil from some pressure. Since that series also depends on <a href=3D"=
https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg03310.html">htt=
ps://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg03310.html</a> it =
could be upstreamed already as well.</div><div><br></div><div>Best regards,=
</div><div>Bernhard<br></div><div><br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div>Having =
applied the patch, you can then move the assignment to rtc_state between<sp=
an style=3D"white-space:pre-wrap"> pci_new_multifunction() and pci_realize_=
and_unref() and set the property like so:</span></div><div><span style=3D"w=
hite-space:pre-wrap">  <a href=3D"https://github.com/shentok/qemu/commit/22=
77b0abab6bc514824cd7dd76a1476485d67f50" target=3D"_blank">https://github.co=
m/shentok/qemu/commit/2277b0abab6bc514824cd7dd76a1476485d67f50</a> .</span>=
</div><div><span style=3D"white-space:pre-wrap">There, you could even just =
set the property to true if kvm_enabled() but we may need a deprecation per=
iod for this. Does it make sense to add a deprecation message now?</span></=
div><div><span style=3D"white-space:pre-wrap"><br></span></div><div><span s=
tyle=3D"white-space:pre-wrap">Moreover, setting the property in pc_piix wou=
ld also just work with other south bridges such as VT82Cxx which I&#39;ve a=
lso got working with the PC machine!</span></div><div><span style=3D"white-=
space:pre-wrap">  <a href=3D"https://github.com/shentok/qemu/tree/pc-via" t=
arget=3D"_blank">https://github.com/shentok/qemu/tree/pc-via</a></span></di=
v><div><span style=3D"white-space:pre-wrap"><br></span></div><div><span sty=
le=3D"white-space:pre-wrap">Best regards,</span></div><div><span style=3D"w=
hite-space:pre-wrap">Bernhard<br></span></div><div><span style=3D"white-spa=
ce:pre-wrap"><br></span></div>&gt; diff --git a/hw/rtc/mc146818rtc.c b/hw/r=
tc/mc146818rtc.c<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
index 947d68c257..86381a74c3 100644<br>
--- a/hw/rtc/mc146818rtc.c<br>
+++ b/hw/rtc/mc146818rtc.c<br>
@@ -922,14 +922,16 @@ static void rtc_realizefn(DeviceState *dev, Error **e=
rrp)<br>
=C2=A0 =C2=A0 =C2=A0rtc_set_date_from_host(isadev);<br>
<br>
=C2=A0 =C2=A0 =C2=A0switch (s-&gt;lost_tick_policy) {<br>
-#ifdef TARGET_I386<br>
-=C2=A0 =C2=A0 case LOST_TICK_POLICY_SLEW:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;coalesced_timer =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 timer_new_ns(rtc_clock, rtc_coal=
esced_timer, s);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
-#endif<br>
=C2=A0 =C2=A0 =C2=A0case LOST_TICK_POLICY_DISCARD:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 case LOST_TICK_POLICY_SLEW:<br>
+#ifdef TARGET_I386<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;slew_tick_policy_available) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;coalesced_timer =3D timer_=
new_ns(rtc_clock, rtc_coalesced_timer, s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+#endif<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* fallthrough */<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Invalid lost tick =
policy.&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
@@ -989,6 +991,8 @@ static Property mc146818rtc_properties[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_UINT8(&quot;irq&quot;, RTCState, isairq, RT=
C_ISA_IRQ),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_LOSTTICKPOLICY(&quot;lost_tick_policy&quot;=
, RTCState,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lost_tick_policy, LOST_TICK_POLICY_D=
ISCARD),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_BOOL(&quot;slew-tick-policy-available&quot;, RTC=
State,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0slew_tick_policy_available, false),<br>
=C2=A0 =C2=A0 =C2=A0DEFINE_PROP_END_OF_LIST(),<br>
=C2=A0};<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000e398b305f15c4aab--

