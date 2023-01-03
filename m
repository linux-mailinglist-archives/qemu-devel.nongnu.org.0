Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C73865C06A
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 14:05:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCgsY-0008LP-8j; Tue, 03 Jan 2023 07:58:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCgsW-0008L3-FD
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:58:52 -0500
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pCgsU-0007aW-3l
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 07:58:52 -0500
Received: by mail-vk1-xa35.google.com with SMTP id j5so15204332vkp.10
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 04:58:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wCHET1C+zJ5E0MK75jiuih15U3RiCtSH+mvxm00f+GQ=;
 b=NPAh26E3zCI4QMPnMS1uzrIVjk9G9O5yZuc3KADm7vRIZHFtcTuyOR2mpaOf8/vTjt
 gvqwf2htixX5X7bnimXG6HgE14h31LYFjGkgnYcrNnKexJ/rVR+MSKvmySG0b/cfiP4X
 Y6xtmrAR9Ddp/QsgEu6dqhoA3siGh03A1e47aVcZCvo9oyTKrBlnqalDpMuxvxdEprEW
 01RPZjnFkvFGpKdLe12cSlUO1kvpImyr6ugSlV7pGAFIH9MzXfeVXc4chS5CALIskf1x
 K2Ky0WI+tVgBdu6kRvjqRVdI6oP5C0RdbLlc88RiaLhGW7xRRCdDukaQGlGQkbZ7jUi2
 9Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wCHET1C+zJ5E0MK75jiuih15U3RiCtSH+mvxm00f+GQ=;
 b=6UtnkXR3DbESJLWhOrRsatU9iVS6mZ3is0oF0DZijMB/r5IYMaxcoaGYlluzAOoYZk
 YEmKCOmzVLqAjDgOgmHuq0TJsI9bmy7Cg6kgzucMwpnnUBCnyu9wubTfOS4dskS4OVYy
 Qn8GqVPCicfK549M0/9FhuluCjDJufZIIw1Lq+uKngZ6d7t4nPBDGcTOKq4AeTyDdBpN
 rgG4ZQCNE1GF8VP/8gOC0m7y+I9fwOuhUBdeofJQ0IXPfTMUOaC3aKATy77sgz937zZN
 FNbkg0S/k3JOsTwnigVIvdRKdBer8IGJdO6zX7yj3Cz+ZljfuAju+3VVfnYVBUXfQTAm
 OsUw==
X-Gm-Message-State: AFqh2kq4B/eAYLYtWRE/SoiWVXd9Ht+cWZLuI02nJbvwh5uGCgXJHBIa
 AY6eI32a75IHOk7WleuAshEpLrNUhly8Ex7nvZo=
X-Google-Smtp-Source: AMrXdXt95nwDj375L1ClmYyFMWXwGMHa4C5AcjIMnpev7tL2utTG05TVixqBaXajiiuKS1M5da5SVcwLiVdC/lKKbjk=
X-Received: by 2002:a1f:b68f:0:b0:3c6:6f9a:9f1d with SMTP id
 g137-20020a1fb68f000000b003c66f9a9f1dmr4741586vkf.11.1672750727176; Tue, 03
 Jan 2023 04:58:47 -0800 (PST)
MIME-Version: 1.0
References: <20230103084801.20437-1-thuth@redhat.com>
 <20230103084801.20437-6-thuth@redhat.com>
In-Reply-To: <20230103084801.20437-6-thuth@redhat.com>
From: Bernhard Beschow <shentey@gmail.com>
Date: Tue, 3 Jan 2023 13:58:32 +0100
Message-ID: <CAG4p6K7yDdCY4Li_aLKu_U7Ti-E2Fv4NU+VgH5sjLv=QVj87rw@mail.gmail.com>
Subject: Re: [PATCH 5/6] hw/rtc/mc146818rtc: Make the mc146818 RTC device
 target independent
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
Content-Type: multipart/alternative; boundary="000000000000e4285505f15ba0f5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=shentey@gmail.com; helo=mail-vk1-xa35.google.com
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

--000000000000e4285505f15ba0f5
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 3, 2023 at 9:48 AM Thomas Huth <thuth@redhat.com> wrote:

> The only reason for this code being target dependent was the IRQ-counting
> related code in rtc_policy_slew_deliver_irq(). Since these functions have
> been moved into a new, separate file (kvm_irqcount.c) which is now always
> compiled and linked if either APIC or the mc146818 device are required,
>

I think you don't need to mention the APIC here since this patch doesn't
touch it and since kvm_irqcount.c is also compiled if the i8259 is
required. Anyway:

Reviewed-by: Bernhard Beschow <shentey@gmail.com>


> and since we've got a new mechanism for deciding whether the slew tick
> policy is available now (via the "slew-tick-policy-available" property),
> we can get rid of the #ifdef TARGET_I386 switches in mc146818rtc.c and
> declare it in the softmmu_ss instead of specific_ss, so that the code only
> gets compiled once for all targets.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  include/hw/rtc/mc146818rtc.h |  1 +
>  hw/rtc/mc146818rtc.c         | 15 +--------------
>  hw/rtc/meson.build           |  3 +--
>  3 files changed, 3 insertions(+), 16 deletions(-)
>
> diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h
> index 54af63d091..9d15d70da8 100644
> --- a/include/hw/rtc/mc146818rtc.h
> +++ b/include/hw/rtc/mc146818rtc.h
> @@ -56,5 +56,6 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,
>                               qemu_irq intercept_irq);
>  void rtc_set_memory(ISADevice *dev, int addr, int val);
>  int rtc_get_memory(ISADevice *dev, int addr);
> +void qmp_rtc_reset_reinjection(Error **errp);
>
>  #endif /* HW_RTC_MC146818RTC_H */
> diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
> index 86381a74c3..4497ddf024 100644
> --- a/hw/rtc/mc146818rtc.c
> +++ b/hw/rtc/mc146818rtc.c
> @@ -45,10 +45,6 @@
>  #include "qapi/visitor.h"
>  #include "hw/rtc/mc146818rtc_regs.h"
>
> -#ifdef TARGET_I386
> -#include "qapi/qapi-commands-misc-target.h"
> -#endif
> -
>  //#define DEBUG_CMOS
>  //#define DEBUG_COALESCED
>
> @@ -112,7 +108,6 @@ static void rtc_coalesced_timer_update(RTCState *s)
>  static QLIST_HEAD(, RTCState) rtc_devices =
>      QLIST_HEAD_INITIALIZER(rtc_devices);
>
> -#ifdef TARGET_I386
>  void qmp_rtc_reset_reinjection(Error **errp)
>  {
>      RTCState *s;
> @@ -124,6 +119,7 @@ void qmp_rtc_reset_reinjection(Error **errp)
>
>  static bool rtc_policy_slew_deliver_irq(RTCState *s)
>  {
> +    assert(s->slew_tick_policy_available);
>      kvm_reset_irq_delivered();
>      qemu_irq_raise(s->irq);
>      return kvm_get_irq_delivered();
> @@ -145,13 +141,6 @@ static void rtc_coalesced_timer(void *opaque)
>
>      rtc_coalesced_timer_update(s);
>  }
> -#else
> -static bool rtc_policy_slew_deliver_irq(RTCState *s)
> -{
> -    assert(0);
> -    return false;
> -}
> -#endif
>
>  static uint32_t rtc_periodic_clock_ticks(RTCState *s)
>  {
> @@ -925,12 +914,10 @@ static void rtc_realizefn(DeviceState *dev, Error
> **errp)
>      case LOST_TICK_POLICY_DISCARD:
>          break;
>      case LOST_TICK_POLICY_SLEW:
> -#ifdef TARGET_I386
>          if (s->slew_tick_policy_available) {
>              s->coalesced_timer = timer_new_ns(rtc_clock,
> rtc_coalesced_timer, s);
>              break;
>          }
> -#endif
>          /* fallthrough */
>      default:
>          error_setg(errp, "Invalid lost tick policy.");
> diff --git a/hw/rtc/meson.build b/hw/rtc/meson.build
> index dc33973384..34a4d316fa 100644
> --- a/hw/rtc/meson.build
> +++ b/hw/rtc/meson.build
> @@ -13,5 +13,4 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true:
> files('aspeed_rtc.c'))
>  softmmu_ss.add(when: 'CONFIG_GOLDFISH_RTC', if_true:
> files('goldfish_rtc.c'))
>  softmmu_ss.add(when: 'CONFIG_LS7A_RTC', if_true: files('ls7a_rtc.c'))
>  softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true:
> files('allwinner-rtc.c'))
> -
> -specific_ss.add(when: 'CONFIG_MC146818RTC', if_true:
> files('mc146818rtc.c'))
> +softmmu_ss.add(when: 'CONFIG_MC146818RTC', if_true:
> files('mc146818rtc.c'))
> --
> 2.31.1
>
>

--000000000000e4285505f15ba0f5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 3, 2023 at 9:48 AM Thomas=
 Huth &lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">The only reas=
on for this code being target dependent was the IRQ-counting<br>
related code in rtc_policy_slew_deliver_irq(). Since these functions have<b=
r>
been moved into a new, separate file (kvm_irqcount.c) which is now always<b=
r>
compiled and linked if either APIC or the mc146818 device are required,<br>=
</blockquote><div><br></div><div>I think you don&#39;t need to mention the =
APIC here since this patch doesn&#39;t touch it and since kvm_irqcount.c is=
 also compiled if the i8259 is required. Anyway:</div><div><br></div><div>R=
eviewed-by: Bernhard Beschow &lt;<a href=3D"mailto:shentey@gmail.com">shent=
ey@gmail.com</a>&gt;</div><div>=C2=A0<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
and since we&#39;ve got a new mechanism for deciding whether the slew tick<=
br>
policy is available now (via the &quot;slew-tick-policy-available&quot; pro=
perty),<br>
we can get rid of the #ifdef TARGET_I386 switches in mc146818rtc.c and<br>
declare it in the softmmu_ss instead of specific_ss, so that the code only<=
br>
gets compiled once for all targets.<br>
<br>
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/hw/rtc/mc146818rtc.h |=C2=A0 1 +<br>
=C2=A0hw/rtc/mc146818rtc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 15 +---------=
-----<br>
=C2=A0hw/rtc/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 3 =
+--<br>
=C2=A03 files changed, 3 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/include/hw/rtc/mc146818rtc.h b/include/hw/rtc/mc146818rtc.h<br=
>
index 54af63d091..9d15d70da8 100644<br>
--- a/include/hw/rtc/mc146818rtc.h<br>
+++ b/include/hw/rtc/mc146818rtc.h<br>
@@ -56,5 +56,6 @@ ISADevice *mc146818_rtc_init(ISABus *bus, int base_year,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_irq intercept_irq);<br>
=C2=A0void rtc_set_memory(ISADevice *dev, int addr, int val);<br>
=C2=A0int rtc_get_memory(ISADevice *dev, int addr);<br>
+void qmp_rtc_reset_reinjection(Error **errp);<br>
<br>
=C2=A0#endif /* HW_RTC_MC146818RTC_H */<br>
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c<br>
index 86381a74c3..4497ddf024 100644<br>
--- a/hw/rtc/mc146818rtc.c<br>
+++ b/hw/rtc/mc146818rtc.c<br>
@@ -45,10 +45,6 @@<br>
=C2=A0#include &quot;qapi/visitor.h&quot;<br>
=C2=A0#include &quot;hw/rtc/mc146818rtc_regs.h&quot;<br>
<br>
-#ifdef TARGET_I386<br>
-#include &quot;qapi/qapi-commands-misc-target.h&quot;<br>
-#endif<br>
-<br>
=C2=A0//#define DEBUG_CMOS<br>
=C2=A0//#define DEBUG_COALESCED<br>
<br>
@@ -112,7 +108,6 @@ static void rtc_coalesced_timer_update(RTCState *s)<br>
=C2=A0static QLIST_HEAD(, RTCState) rtc_devices =3D<br>
=C2=A0 =C2=A0 =C2=A0QLIST_HEAD_INITIALIZER(rtc_devices);<br>
<br>
-#ifdef TARGET_I386<br>
=C2=A0void qmp_rtc_reset_reinjection(Error **errp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0RTCState *s;<br>
@@ -124,6 +119,7 @@ void qmp_rtc_reset_reinjection(Error **errp)<br>
<br>
=C2=A0static bool rtc_policy_slew_deliver_irq(RTCState *s)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 assert(s-&gt;slew_tick_policy_available);<br>
=C2=A0 =C2=A0 =C2=A0kvm_reset_irq_delivered();<br>
=C2=A0 =C2=A0 =C2=A0qemu_irq_raise(s-&gt;irq);<br>
=C2=A0 =C2=A0 =C2=A0return kvm_get_irq_delivered();<br>
@@ -145,13 +141,6 @@ static void rtc_coalesced_timer(void *opaque)<br>
<br>
=C2=A0 =C2=A0 =C2=A0rtc_coalesced_timer_update(s);<br>
=C2=A0}<br>
-#else<br>
-static bool rtc_policy_slew_deliver_irq(RTCState *s)<br>
-{<br>
-=C2=A0 =C2=A0 assert(0);<br>
-=C2=A0 =C2=A0 return false;<br>
-}<br>
-#endif<br>
<br>
=C2=A0static uint32_t rtc_periodic_clock_ticks(RTCState *s)<br>
=C2=A0{<br>
@@ -925,12 +914,10 @@ static void rtc_realizefn(DeviceState *dev, Error **e=
rrp)<br>
=C2=A0 =C2=A0 =C2=A0case LOST_TICK_POLICY_DISCARD:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0case LOST_TICK_POLICY_SLEW:<br>
-#ifdef TARGET_I386<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s-&gt;slew_tick_policy_available) {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;coalesced_timer =3D t=
imer_new_ns(rtc_clock, rtc_coalesced_timer, s);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
-#endif<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* fallthrough */<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(errp, &quot;Invalid lost tick =
policy.&quot;);<br>
diff --git a/hw/rtc/meson.build b/hw/rtc/meson.build<br>
index dc33973384..34a4d316fa 100644<br>
--- a/hw/rtc/meson.build<br>
+++ b/hw/rtc/meson.build<br>
@@ -13,5 +13,4 @@ softmmu_ss.add(when: &#39;CONFIG_ASPEED_SOC&#39;, if_true=
: files(&#39;aspeed_rtc.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_GOLDFISH_RTC&#39;, if_true: files(&#=
39;goldfish_rtc.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_LS7A_RTC&#39;, if_true: files(&#39;l=
s7a_rtc.c&#39;))<br>
=C2=A0softmmu_ss.add(when: &#39;CONFIG_ALLWINNER_H3&#39;, if_true: files(&#=
39;allwinner-rtc.c&#39;))<br>
-<br>
-specific_ss.add(when: &#39;CONFIG_MC146818RTC&#39;, if_true: files(&#39;mc=
146818rtc.c&#39;))<br>
+softmmu_ss.add(when: &#39;CONFIG_MC146818RTC&#39;, if_true: files(&#39;mc1=
46818rtc.c&#39;))<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000e4285505f15ba0f5--

