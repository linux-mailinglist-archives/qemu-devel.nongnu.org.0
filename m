Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB274CF219
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 07:43:48 +0100 (CET)
Received: from localhost ([::1]:54744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nR75v-0006fe-N5
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 01:43:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nR6zs-0005ro-4I
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 01:37:32 -0500
Received: from [2a00:1450:4864:20::630] (port=36463
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arilou@gmail.com>) id 1nR6zl-0005MN-Qm
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 01:37:31 -0500
Received: by mail-ej1-x630.google.com with SMTP id bi12so16504570ejb.3
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 22:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+/c87MNPhek7KFm5aNZEzz2g2qXvi03eFO0XjnoPNU0=;
 b=b0g0ETfi934cS2b3lBpp7ESH2BYyiqW0IiuMIa5S1A+oNGFZLu9SpUl+XGZtqAJiYk
 iMMbKe2HP/VQFXpcjKm0NrFNhngI94Fx5i1tzYxFTKsbhff428mBe5zgkI/bDRqUIsMN
 WvGjFYMCYAIcSp5CN6RV3T056stYBHlzCs8H7Cxtju2DLajIzgDz2jIMda/O/jE1YjaT
 AzLGnJta3ydHvT2UfAPWusOa5eaEpV8/BM3Hw0CbsIN1F3nMzeAAXbcDHvk4DL+aSHMC
 EAaks3jVkVLMt+PHQwf4uNQ0mKXpnFHPkKenr3glk79KKV5aMXRyjG4zDpn/MwuIo+j0
 3x4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+/c87MNPhek7KFm5aNZEzz2g2qXvi03eFO0XjnoPNU0=;
 b=1QSs3iK2HBplJsk6qKNU3/4mILvKwjjpUf8s/YabDp23j+Ia0zFVs49136MREh/NOZ
 UPo8KJDZo+rwKxYS2aJqYpTkLUFHYVk2YxYkMQN0OEqvVtknRAFsOR3OwkddTK2qVaVF
 Ac1a8wTaUW3fiwnW8GP/1oIOnekEOFJt0eZ64kCQnx4d2Kr6gqgxB7I2e1emY/aXrQbU
 FXguUHozjTxNeW7iZPVIR93GN/Of6lNBK4znPt931poxM57OP5RgRGcsOWtjWCbHpm2o
 TIz/rUYdNlyB23MgpXzfCjtVD8Tkp1jN97+1z8JT4O9ZhPqx3kV7vGE3xAXWb0GxIBwl
 P84w==
X-Gm-Message-State: AOAM530wPTL6JgT5sn8+kQE+ItMWDQX429oVNr0YF7NLulxXCnWmKC++
 5dK5QIODXGLvmi/ugt555x9JqqhPrrKIgOJ/L6o=
X-Google-Smtp-Source: ABdhPJy1fjDWFHI6oZWCw0hLNUKKZAGXJyvVBw3vbrkOVKlS/N3cxWHbEeovz8DvdrTbTtoD8qvNwrV6I0rdq1z/jKg=
X-Received: by 2002:a17:907:94cb:b0:6da:97ec:3231 with SMTP id
 dn11-20020a17090794cb00b006da97ec3231mr8056913ejc.438.1646635043505; Sun, 06
 Mar 2022 22:37:23 -0800 (PST)
MIME-Version: 1.0
References: <20220216102500.692781-1-arilou@gmail.com>
 <20220216102500.692781-2-arilou@gmail.com>
 <403906ee-3a91-bc9d-4a60-bf6fc7d1b8ba@redhat.com>
In-Reply-To: <403906ee-3a91-bc9d-4a60-bf6fc7d1b8ba@redhat.com>
From: Jon Doron <arilou@gmail.com>
Date: Mon, 7 Mar 2022 08:37:12 +0200
Message-ID: <CAP7QCoiU5knZ4Cwer+5akyQu-eFHsfy6U4rTuSahK-QHW7PrRw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] hyperv: SControl is optional to enable SynIc
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000d7d02805d99b183f"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=arilou@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d7d02805d99b183f
Content-Type: text/plain; charset="UTF-8"

Thanks! is there an estimate when will this patchset be merged?

On Thu, Feb 24, 2022, 18:36 Emanuele Giuseppe Esposito <eesposit@redhat.com>
wrote:

>
>
> On 16/02/2022 11:24, Jon Doron wrote:
> > SynIc can be enabled regardless of the SControl mechanisim which can
> > register a GSI for a given SintRoute.
> >
> > This behaviour can achived by setting enabling SIMP and then the guest
> > will poll on the message slot.
> >
> > Once there is another message pending the host will set the message slot
> > with the pending flag.
> > When the guest polls from the message slot, in case the pending flag is
> > set it will write to the HV_X64_MSR_EOM indicating it has cleared the
> > slot and we can try and push our message again.
> >
> > Signed-off-by: Jon Doron <arilou@gmail.com>
> > ---
> >  hw/hyperv/hyperv.c | 109 +++++++++++++++++++++++++++++++--------------
> >  1 file changed, 76 insertions(+), 33 deletions(-)
> >
> > diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c
> > index cb1074f234..aaba6b4901 100644
> > --- a/hw/hyperv/hyperv.c
> > +++ b/hw/hyperv/hyperv.c
> > @@ -27,13 +27,16 @@ struct SynICState {
> >
> >      CPUState *cs;
> >
> > -    bool enabled;
> > +    bool sctl_enabled;
> >      hwaddr msg_page_addr;
> >      hwaddr event_page_addr;
> >      MemoryRegion msg_page_mr;
> >      MemoryRegion event_page_mr;
> >      struct hyperv_message_page *msg_page;
> >      struct hyperv_event_flags_page *event_page;
> > +
> > +    QemuMutex sint_routes_mutex;
> > +    QLIST_HEAD(, HvSintRoute) sint_routes;
> >  };
> >
> >  #define TYPE_SYNIC "hyperv-synic"
> > @@ -51,11 +54,11 @@ static SynICState *get_synic(CPUState *cs)
> >      return SYNIC(object_resolve_path_component(OBJECT(cs), "synic"));
> >  }
> >
> > -static void synic_update(SynICState *synic, bool enable,
> > +static void synic_update(SynICState *synic, bool sctl_enable,
> >                           hwaddr msg_page_addr, hwaddr event_page_addr)
> >  {
> >
> > -    synic->enabled = enable;
> > +    synic->sctl_enabled = sctl_enable;
> >      if (synic->msg_page_addr != msg_page_addr) {
> >          if (synic->msg_page_addr) {
> >              memory_region_del_subregion(get_system_memory(),
> > @@ -80,7 +83,7 @@ static void synic_update(SynICState *synic, bool
> enable,
> >      }
> >  }
> >
> > -void hyperv_synic_update(CPUState *cs, bool enable,
> > +void hyperv_synic_update(CPUState *cs, bool sctl_enable,
> >                           hwaddr msg_page_addr, hwaddr event_page_addr)
> >  {
> >      SynICState *synic = get_synic(cs);
> > @@ -89,7 +92,7 @@ void hyperv_synic_update(CPUState *cs, bool enable,
> >          return;
> >      }
> >
> > -    synic_update(synic, enable, msg_page_addr, event_page_addr);
> > +    synic_update(synic, sctl_enable, msg_page_addr, event_page_addr);
> >  }
> >
> >  static void synic_realize(DeviceState *dev, Error **errp)
> > @@ -110,16 +113,20 @@ static void synic_realize(DeviceState *dev, Error
> **errp)
> >                             sizeof(*synic->event_page), &error_abort);
> >      synic->msg_page = memory_region_get_ram_ptr(&synic->msg_page_mr);
> >      synic->event_page =
> memory_region_get_ram_ptr(&synic->event_page_mr);
> > +    qemu_mutex_init(&synic->sint_routes_mutex);
> > +    QLIST_INIT(&synic->sint_routes);
> >
> >      g_free(msgp_name);
> >      g_free(eventp_name);
> >  }
> > +
> >  static void synic_reset(DeviceState *dev)
> >  {
> >      SynICState *synic = SYNIC(dev);
> >      memset(synic->msg_page, 0, sizeof(*synic->msg_page));
> >      memset(synic->event_page, 0, sizeof(*synic->event_page));
> >      synic_update(synic, false, 0, 0);
> > +    assert(QLIST_EMPTY(&synic->sint_routes));
> >  }
> >
> >  static void synic_class_init(ObjectClass *klass, void *data)
> > @@ -214,6 +221,7 @@ struct HvSintRoute {
> >      HvSintStagedMessage *staged_msg;
> >
> >      unsigned refcount;
> > +    QLIST_ENTRY(HvSintRoute) link;
> >  };
> >
> >  static CPUState *hyperv_find_vcpu(uint32_t vp_index)
> > @@ -259,7 +267,7 @@ static void cpu_post_msg(CPUState *cs,
> run_on_cpu_data data)
> >
> >      assert(staged_msg->state == HV_STAGED_MSG_BUSY);
> >
> > -    if (!synic->enabled || !synic->msg_page_addr) {
> > +    if (!synic->msg_page_addr) {
> >          staged_msg->status = -ENXIO;
> >          goto posted;
> >      }
> > @@ -343,7 +351,7 @@ int hyperv_set_event_flag(HvSintRoute *sint_route,
> unsigned eventno)
> >      if (eventno > HV_EVENT_FLAGS_COUNT) {
> >          return -EINVAL;
> >      }
> > -    if (!synic->enabled || !synic->event_page_addr) {
> > +    if (!synic->sctl_enabled || !synic->event_page_addr) {
> >          return -ENXIO;
> >      }
> >
> > @@ -364,11 +372,12 @@ int hyperv_set_event_flag(HvSintRoute *sint_route,
> unsigned eventno)
> >  HvSintRoute *hyperv_sint_route_new(uint32_t vp_index, uint32_t sint,
> >                                     HvSintMsgCb cb, void *cb_data)
> >  {
> > -    HvSintRoute *sint_route;
> > -    EventNotifier *ack_notifier;
> > +    HvSintRoute *sint_route = NULL;
> > +    EventNotifier *ack_notifier = NULL;
> >      int r, gsi;
> >      CPUState *cs;
> >      SynICState *synic;
> > +    bool ack_event_initialized = false;
> >
> >      cs = hyperv_find_vcpu(vp_index);
> >      if (!cs) {
> > @@ -381,57 +390,77 @@ HvSintRoute *hyperv_sint_route_new(uint32_t
> vp_index, uint32_t sint,
> >      }
> >
> >      sint_route = g_new0(HvSintRoute, 1);
> > -    r = event_notifier_init(&sint_route->sint_set_notifier, false);
> > -    if (r) {
> > -        goto err;
> > +    if (!sint_route) {
> > +        return NULL;
> >      }
> >
> > +    sint_route->synic = synic;
> > +    sint_route->sint = sint;
> > +    sint_route->refcount = 1;
> >
> >      ack_notifier = cb ? &sint_route->sint_ack_notifier : NULL;
> >      if (ack_notifier) {
> >          sint_route->staged_msg = g_new0(HvSintStagedMessage, 1);
> > +        if (!sint_route->staged_msg) {
> > +            goto cleanup_err_sint;
> > +        }
> >          sint_route->staged_msg->cb = cb;
> >          sint_route->staged_msg->cb_data = cb_data;
> >
> >          r = event_notifier_init(ack_notifier, false);
> >          if (r) {
> > -            goto err_sint_set_notifier;
> > +            goto cleanup_err_sint;
> >          }
> > -
> >          event_notifier_set_handler(ack_notifier, sint_ack_handler);
> > +        ack_event_initialized = true;
> > +    }
> > +
> > +    /* See if we are done or we need to setup a GSI for this SintRoute
> */
> > +    if (!synic->sctl_enabled) {
> > +        goto cleanup;
> > +    }
> > +
> > +    /* We need to setup a GSI for this SintRoute */
> > +    r = event_notifier_init(&sint_route->sint_set_notifier, false);
> > +    if (r) {
> > +        goto cleanup_err_sint;
> >      }
> >
> >      gsi = kvm_irqchip_add_hv_sint_route(kvm_state, vp_index, sint);
> >      if (gsi < 0) {
> > -        goto err_gsi;
> > +        goto cleanup_err_sint_notifier;
> >      }
> >
> >      r = kvm_irqchip_add_irqfd_notifier_gsi(kvm_state,
> >
>  &sint_route->sint_set_notifier,
> >                                             ack_notifier, gsi);
> >      if (r) {
> > -        goto err_irqfd;
> > +        goto cleanup_err_irqfd;
> >      }
> >      sint_route->gsi = gsi;
> > -    sint_route->synic = synic;
> > -    sint_route->sint = sint;
> > -    sint_route->refcount = 1;
> > -
> > +cleanup:
> > +    qemu_mutex_lock(&synic->sint_routes_mutex);
> > +    QLIST_INSERT_HEAD_RCU(&synic->sint_routes, sint_route, link);
> > +    qemu_mutex_unlock(&synic->sint_routes_mutex);
> >      return sint_route;
> >
> > -err_irqfd:
> > +cleanup_err_irqfd:
> >      kvm_irqchip_release_virq(kvm_state, gsi);
> > -err_gsi:
> > +
> > +cleanup_err_sint_notifier:
> > +    event_notifier_cleanup(&sint_route->sint_set_notifier);
> > +
> > +cleanup_err_sint:
> >      if (ack_notifier) {
> > -        event_notifier_set_handler(ack_notifier, NULL);
> > -        event_notifier_cleanup(ack_notifier);
> > +        if (ack_event_initialized) {
> > +            event_notifier_set_handler(ack_notifier, NULL);
> > +            event_notifier_cleanup(ack_notifier);
> > +        }
> > +
> >          g_free(sint_route->staged_msg);
> >      }
> > -err_sint_set_notifier:
> > -    event_notifier_cleanup(&sint_route->sint_set_notifier);
> > -err:
> > -    g_free(sint_route);
> >
> > +    g_free(sint_route);
> >      return NULL;
> >  }
> >
> > @@ -442,6 +471,8 @@ void hyperv_sint_route_ref(HvSintRoute *sint_route)
> >
> >  void hyperv_sint_route_unref(HvSintRoute *sint_route)
> >  {
> > +    SynICState *synic;
> > +
> >      if (!sint_route) {
> >          return;
> >      }
> > @@ -452,21 +483,33 @@ void hyperv_sint_route_unref(HvSintRoute
> *sint_route)
> >          return;
> >      }
> >
> > -    kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
> > -
> &sint_route->sint_set_notifier,
> > -                                          sint_route->gsi);
> > -    kvm_irqchip_release_virq(kvm_state, sint_route->gsi);
> > +    synic = sint_route->synic;
> > +    qemu_mutex_lock(&synic->sint_routes_mutex);
> > +    QLIST_REMOVE_RCU(sint_route, link);
> > +    qemu_mutex_unlock(&synic->sint_routes_mutex);
> > +
> > +    if (sint_route->gsi) {
> > +        kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,
> > +
> &sint_route->sint_set_notifier,
> > +                                              sint_route->gsi);
> > +        kvm_irqchip_release_virq(kvm_state, sint_route->gsi);
> > +        event_notifier_cleanup(&sint_route->sint_set_notifier);
> > +    }
> > +
> >      if (sint_route->staged_msg) {
> >          event_notifier_set_handler(&sint_route->sint_ack_notifier,
> NULL);
> >          event_notifier_cleanup(&sint_route->sint_ack_notifier);
> >          g_free(sint_route->staged_msg);
> >      }
> > -    event_notifier_cleanup(&sint_route->sint_set_notifier);
> >      g_free(sint_route);
> >  }
> >
> >  int hyperv_sint_route_set_sint(HvSintRoute *sint_route)
> >  {
> > +    if (!sint_route->gsi) {
> > +        return 0;
> > +    }
> > +
> >      return event_notifier_set(&sint_route->sint_set_notifier);
> >  }
> >
> >
>
> Reviewed-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>
>

--000000000000d7d02805d99b183f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks! is there an estimate when will this patchset be m=
erged?=C2=A0</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Thu, Feb 24, 2022, 18:36 Emanuele Giuseppe Esposito &lt;<a h=
ref=3D"mailto:eesposit@redhat.com">eesposit@redhat.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><br>
<br>
On 16/02/2022 11:24, Jon Doron wrote:<br>
&gt; SynIc can be enabled regardless of the SControl mechanisim which can<b=
r>
&gt; register a GSI for a given SintRoute.<br>
&gt; <br>
&gt; This behaviour can achived by setting enabling SIMP and then the guest=
<br>
&gt; will poll on the message slot.<br>
&gt; <br>
&gt; Once there is another message pending the host will set the message sl=
ot<br>
&gt; with the pending flag.<br>
&gt; When the guest polls from the message slot, in case the pending flag i=
s<br>
&gt; set it will write to the HV_X64_MSR_EOM indicating it has cleared the<=
br>
&gt; slot and we can try and push our message again.<br>
&gt; <br>
&gt; Signed-off-by: Jon Doron &lt;<a href=3D"mailto:arilou@gmail.com" targe=
t=3D"_blank" rel=3D"noreferrer">arilou@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/hyperv/hyperv.c | 109 +++++++++++++++++++++++++++++++--------=
------<br>
&gt;=C2=A0 1 file changed, 76 insertions(+), 33 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/hyperv/hyperv.c b/hw/hyperv/hyperv.c<br>
&gt; index cb1074f234..aaba6b4901 100644<br>
&gt; --- a/hw/hyperv/hyperv.c<br>
&gt; +++ b/hw/hyperv/hyperv.c<br>
&gt; @@ -27,13 +27,16 @@ struct SynICState {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 CPUState *cs;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 bool enabled;<br>
&gt; +=C2=A0 =C2=A0 bool sctl_enabled;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 hwaddr msg_page_addr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 hwaddr event_page_addr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MemoryRegion msg_page_mr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MemoryRegion event_page_mr;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct hyperv_message_page *msg_page;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct hyperv_event_flags_page *event_page;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 QemuMutex sint_routes_mutex;<br>
&gt; +=C2=A0 =C2=A0 QLIST_HEAD(, HvSintRoute) sint_routes;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define TYPE_SYNIC &quot;hyperv-synic&quot;<br>
&gt; @@ -51,11 +54,11 @@ static SynICState *get_synic(CPUState *cs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return SYNIC(object_resolve_path_component(OBJECT(=
cs), &quot;synic&quot;));<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void synic_update(SynICState *synic, bool enable,<br>
&gt; +static void synic_update(SynICState *synic, bool sctl_enable,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr msg_page_addr, hwaddr event_page_addr)<br=
>
&gt;=C2=A0 {<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 synic-&gt;enabled =3D enable;<br>
&gt; +=C2=A0 =C2=A0 synic-&gt;sctl_enabled =3D sctl_enable;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (synic-&gt;msg_page_addr !=3D msg_page_addr) {<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (synic-&gt;msg_page_addr) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_del_subr=
egion(get_system_memory(),<br>
&gt; @@ -80,7 +83,7 @@ static void synic_update(SynICState *synic, bool ena=
ble,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -void hyperv_synic_update(CPUState *cs, bool enable,<br>
&gt; +void hyperv_synic_update(CPUState *cs, bool sctl_enable,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0hwaddr msg_page_addr, hwaddr event_page_addr)<br=
>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SynICState *synic =3D get_synic(cs);<br>
&gt; @@ -89,7 +92,7 @@ void hyperv_synic_update(CPUState *cs, bool enable,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 synic_update(synic, enable, msg_page_addr, event_page_a=
ddr);<br>
&gt; +=C2=A0 =C2=A0 synic_update(synic, sctl_enable, msg_page_addr, event_p=
age_addr);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void synic_realize(DeviceState *dev, Error **errp)<br>
&gt; @@ -110,16 +113,20 @@ static void synic_realize(DeviceState *dev, Erro=
r **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(*synic-&gt;event_page), &amp;error=
_abort);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 synic-&gt;msg_page =3D memory_region_get_ram_ptr(&=
amp;synic-&gt;msg_page_mr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 synic-&gt;event_page =3D memory_region_get_ram_ptr=
(&amp;synic-&gt;event_page_mr);<br>
&gt; +=C2=A0 =C2=A0 qemu_mutex_init(&amp;synic-&gt;sint_routes_mutex);<br>
&gt; +=C2=A0 =C2=A0 QLIST_INIT(&amp;synic-&gt;sint_routes);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_free(msgp_name);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_free(eventp_name);<br>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 static void synic_reset(DeviceState *dev)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SynICState *synic =3D SYNIC(dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 memset(synic-&gt;msg_page, 0, sizeof(*synic-&gt;ms=
g_page));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 memset(synic-&gt;event_page, 0, sizeof(*synic-&gt;=
event_page));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 synic_update(synic, false, 0, 0);<br>
&gt; +=C2=A0 =C2=A0 assert(QLIST_EMPTY(&amp;synic-&gt;sint_routes));<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void synic_class_init(ObjectClass *klass, void *data)<br>
&gt; @@ -214,6 +221,7 @@ struct HvSintRoute {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 HvSintStagedMessage *staged_msg;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned refcount;<br>
&gt; +=C2=A0 =C2=A0 QLIST_ENTRY(HvSintRoute) link;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static CPUState *hyperv_find_vcpu(uint32_t vp_index)<br>
&gt; @@ -259,7 +267,7 @@ static void cpu_post_msg(CPUState *cs, run_on_cpu_=
data data)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 assert(staged_msg-&gt;state =3D=3D HV_STAGED_MSG_B=
USY);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 if (!synic-&gt;enabled || !synic-&gt;msg_page_addr) {<b=
r>
&gt; +=C2=A0 =C2=A0 if (!synic-&gt;msg_page_addr) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 staged_msg-&gt;status =3D -ENXIO;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto posted;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -343,7 +351,7 @@ int hyperv_set_event_flag(HvSintRoute *sint_route,=
 unsigned eventno)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (eventno &gt; HV_EVENT_FLAGS_COUNT) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 if (!synic-&gt;enabled || !synic-&gt;event_page_addr) {=
<br>
&gt; +=C2=A0 =C2=A0 if (!synic-&gt;sctl_enabled || !synic-&gt;event_page_ad=
dr) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENXIO;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -364,11 +372,12 @@ int hyperv_set_event_flag(HvSintRoute *sint_rout=
e, unsigned eventno)<br>
&gt;=C2=A0 HvSintRoute *hyperv_sint_route_new(uint32_t vp_index, uint32_t s=
int,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0HvSintMsgCb c=
b, void *cb_data)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 HvSintRoute *sint_route;<br>
&gt; -=C2=A0 =C2=A0 EventNotifier *ack_notifier;<br>
&gt; +=C2=A0 =C2=A0 HvSintRoute *sint_route =3D NULL;<br>
&gt; +=C2=A0 =C2=A0 EventNotifier *ack_notifier =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int r, gsi;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 CPUState *cs;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SynICState *synic;<br>
&gt; +=C2=A0 =C2=A0 bool ack_event_initialized =3D false;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 cs =3D hyperv_find_vcpu(vp_index);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!cs) {<br>
&gt; @@ -381,57 +390,77 @@ HvSintRoute *hyperv_sint_route_new(uint32_t vp_i=
ndex, uint32_t sint,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 sint_route =3D g_new0(HvSintRoute, 1);<br>
&gt; -=C2=A0 =C2=A0 r =3D event_notifier_init(&amp;sint_route-&gt;sint_set_=
notifier, false);<br>
&gt; -=C2=A0 =C2=A0 if (r) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;<br>
&gt; +=C2=A0 =C2=A0 if (!sint_route) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 sint_route-&gt;synic =3D synic;<br>
&gt; +=C2=A0 =C2=A0 sint_route-&gt;sint =3D sint;<br>
&gt; +=C2=A0 =C2=A0 sint_route-&gt;refcount =3D 1;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ack_notifier =3D cb ? &amp;sint_route-&gt;sint_ack=
_notifier : NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ack_notifier) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sint_route-&gt;staged_msg =3D g_new0=
(HvSintStagedMessage, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!sint_route-&gt;staged_msg) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup_err_sint;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sint_route-&gt;staged_msg-&gt;cb =3D=
 cb;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sint_route-&gt;staged_msg-&gt;cb_dat=
a =3D cb_data;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 r =3D event_notifier_init(ack_notifi=
er, false);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (r) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_sint_set_notifier;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup_err_sint;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 event_notifier_set_handler(ack_notif=
ier, sint_ack_handler);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ack_event_initialized =3D true;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* See if we are done or we need to setup a GSI for thi=
s SintRoute */<br>
&gt; +=C2=A0 =C2=A0 if (!synic-&gt;sctl_enabled) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* We need to setup a GSI for this SintRoute */<br>
&gt; +=C2=A0 =C2=A0 r =3D event_notifier_init(&amp;sint_route-&gt;sint_set_=
notifier, false);<br>
&gt; +=C2=A0 =C2=A0 if (r) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup_err_sint;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 gsi =3D kvm_irqchip_add_hv_sint_route(kvm_state, v=
p_index, sint);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (gsi &lt; 0) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_gsi;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup_err_sint_notifier;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 r =3D kvm_irqchip_add_irqfd_notifier_gsi(kvm_state=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0&amp;sint_route-&gt;sint_set_notifier,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ack_notifier, gsi);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (r) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_irqfd;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto cleanup_err_irqfd;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sint_route-&gt;gsi =3D gsi;<br>
&gt; -=C2=A0 =C2=A0 sint_route-&gt;synic =3D synic;<br>
&gt; -=C2=A0 =C2=A0 sint_route-&gt;sint =3D sint;<br>
&gt; -=C2=A0 =C2=A0 sint_route-&gt;refcount =3D 1;<br>
&gt; -<br>
&gt; +cleanup:<br>
&gt; +=C2=A0 =C2=A0 qemu_mutex_lock(&amp;synic-&gt;sint_routes_mutex);<br>
&gt; +=C2=A0 =C2=A0 QLIST_INSERT_HEAD_RCU(&amp;synic-&gt;sint_routes, sint_=
route, link);<br>
&gt; +=C2=A0 =C2=A0 qemu_mutex_unlock(&amp;synic-&gt;sint_routes_mutex);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 return sint_route;<br>
&gt;=C2=A0 <br>
&gt; -err_irqfd:<br>
&gt; +cleanup_err_irqfd:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 kvm_irqchip_release_virq(kvm_state, gsi);<br>
&gt; -err_gsi:<br>
&gt; +<br>
&gt; +cleanup_err_sint_notifier:<br>
&gt; +=C2=A0 =C2=A0 event_notifier_cleanup(&amp;sint_route-&gt;sint_set_not=
ifier);<br>
&gt; +<br>
&gt; +cleanup_err_sint:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ack_notifier) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 event_notifier_set_handler(ack_notifier, =
NULL);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 event_notifier_cleanup(ack_notifier);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ack_event_initialized) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 event_notifier_set_handler(=
ack_notifier, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 event_notifier_cleanup(ack_=
notifier);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(sint_route-&gt;staged_msg);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -err_sint_set_notifier:<br>
&gt; -=C2=A0 =C2=A0 event_notifier_cleanup(&amp;sint_route-&gt;sint_set_not=
ifier);<br>
&gt; -err:<br>
&gt; -=C2=A0 =C2=A0 g_free(sint_route);<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 g_free(sint_route);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -442,6 +471,8 @@ void hyperv_sint_route_ref(HvSintRoute *sint_route=
)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void hyperv_sint_route_unref(HvSintRoute *sint_route)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 SynICState *synic;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!sint_route) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -452,21 +483,33 @@ void hyperv_sint_route_unref(HvSintRoute *sint_r=
oute)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;sint_route-&gt;sint_set_notifier,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 sint_route-&gt;gsi);<br>
&gt; -=C2=A0 =C2=A0 kvm_irqchip_release_virq(kvm_state, sint_route-&gt;gsi)=
;<br>
&gt; +=C2=A0 =C2=A0 synic =3D sint_route-&gt;synic;<br>
&gt; +=C2=A0 =C2=A0 qemu_mutex_lock(&amp;synic-&gt;sint_routes_mutex);<br>
&gt; +=C2=A0 =C2=A0 QLIST_REMOVE_RCU(sint_route, link);<br>
&gt; +=C2=A0 =C2=A0 qemu_mutex_unlock(&amp;synic-&gt;sint_routes_mutex);<br=
>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if (sint_route-&gt;gsi) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kvm_irqchip_remove_irqfd_notifier_gsi(kvm=
_state,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &amp;sint_route-&gt;sint_set_notifier,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 sint_route-&gt;gsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 kvm_irqchip_release_virq(kvm_state, sint_=
route-&gt;gsi);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 event_notifier_cleanup(&amp;sint_route-&g=
t;sint_set_notifier);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (sint_route-&gt;staged_msg) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 event_notifier_set_handler(&amp;sint=
_route-&gt;sint_ack_notifier, NULL);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 event_notifier_cleanup(&amp;sint_rou=
te-&gt;sint_ack_notifier);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(sint_route-&gt;staged_msg);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 event_notifier_cleanup(&amp;sint_route-&gt;sint_set_not=
ifier);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_free(sint_route);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 int hyperv_sint_route_set_sint(HvSintRoute *sint_route)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 if (!sint_route-&gt;gsi) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return event_notifier_set(&amp;sint_route-&gt;sint=
_set_notifier);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; <br>
<br>
Reviewed-by: Emanuele Giuseppe Esposito &lt;<a href=3D"mailto:eesposit@redh=
at.com" target=3D"_blank" rel=3D"noreferrer">eesposit@redhat.com</a>&gt;<br=
>
<br>
</blockquote></div>

--000000000000d7d02805d99b183f--

