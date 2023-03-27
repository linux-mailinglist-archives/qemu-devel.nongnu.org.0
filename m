Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE576CAB8A
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Mar 2023 19:10:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgqL8-0003GT-Pt; Mon, 27 Mar 2023 13:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1pgqL6-0003G6-Sp
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:09:00 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1pgqKz-0005vr-1A
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 13:09:00 -0400
Received: by mail-wr1-x430.google.com with SMTP id e18so9535671wra.9
 for <qemu-devel@nongnu.org>; Mon, 27 Mar 2023 10:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1679936930;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pH11+L8jLyTSGOXrRESoiQ+C1LWQ9VUJK9B93uGlJvA=;
 b=FH0oVWNzo4pZm2WLb8M2nPA1CZ+UPQ8KaApZSsI5rmMxs8dPl598tNn6aE/j6Lkk+G
 9fr2tt10eNAoj3JzmGXD5HKu0yqEHhgSNwaysok1uy84Jp3klu/kw1bfRvt9NMvBYNKO
 sDvDpnHPYHIkO6f3wCCMzceIoWLGsxYnzAZXlxtW3TfszhQlFzghqjuT8EsZPnJb8r5h
 SZmSfPfdGU1VmOpMsQqJH+MFccmmdeT0TI5mKz3dcd3J9yBTmrAXfxL34Vs13tF46AGc
 vr/zTmjOFqseT8tNIngJPeLVbO/2hcp2tBDU5NronFD4kXzRzfDjUPonKhGgVRV9qe7D
 WcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679936930;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pH11+L8jLyTSGOXrRESoiQ+C1LWQ9VUJK9B93uGlJvA=;
 b=J+MdxcnTjvFz87CWdnnsCrLEmAa1+J1dr2uprYFRyGpIdcggtaezPe50Pnt3QvyejC
 fimu6PvU9n7cMpJFLGbq5nYPf5J4cjiALMXGrt1ak4Xx7W7hfjjBF7nr0vmf/rmvZk1B
 gp5J1JgQamylmIuEXQ2LqtBesOuRIQc5/gv5SShV9xFsQn43qKpO8R6dzCiGMKR4VWJb
 3/O7rSJNWCIEfozk4UjBU7yOsPnR2c3KxEX1+VIE5GPjlzM6uOweDrHaiHLvBFJ5Y2ri
 Dx9+y3W5zgn125gBpZeq438bZZKxSeEbSnyNwoHPDXmDqpAxicvlTHl7oYfmUR69tByw
 Pd4g==
X-Gm-Message-State: AAQBX9eOJ/SgA1D56JqJ37c2K/slWMb+jnQpEN07CX7GjyuFNeICMa5w
 iS8R7TbduFtLvoPFU8xfRfWqTYDnYQvOEjGiQjfgsw==
X-Google-Smtp-Source: AKy350a0CTa+O/cnsvct9n5DQM85yEe7/POFPdwwJg3OvXFSEt0UbkpG/3WIutKaBoKz19WBDfPC908e81kJFeJrBY4=
X-Received: by 2002:adf:f742:0:b0:2d8:a40d:9bbd with SMTP id
 z2-20020adff742000000b002d8a40d9bbdmr2571309wrp.6.1679936930389; Mon, 27 Mar
 2023 10:08:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230324230904.3710289-1-wuhaotsh@google.com>
 <20230324230904.3710289-5-wuhaotsh@google.com>
 <ZB+JBFBQBOv7Vcwq@minyard.net>
In-Reply-To: <ZB+JBFBQBOv7Vcwq@minyard.net>
From: Hao Wu <wuhaotsh@google.com>
Date: Mon, 27 Mar 2023 10:08:37 -0700
Message-ID: <CAGcCb11OqKqq3cHZaT1GQvCqchEyE2vmyugz1Sq1-1e-w59w9g@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] hw/ipmi: Refactor IPMI interface
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com, 
 titusr@google.com, peter.maydell@linaro.org
Content-Type: multipart/alternative; boundary="000000000000fbb27c05f7e4cbae"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=wuhaotsh@google.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--000000000000fbb27c05f7e4cbae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, I think breaking them up makes sense but it might take a while
since it takes some effort to make each one pass. I could do it in a few
weeks and send another patch out with  the breakup.

On Sat, Mar 25, 2023 at 4:51=E2=80=AFPM Corey Minyard <minyard@acm.org> wro=
te:

> On Fri, Mar 24, 2023 at 04:09:01PM -0700, Hao Wu wrote:
> > This patch refactors the IPMI interface so that it can be used by both
> > the BMC side and core-side simulation.
>
> This patch is hard to review because it does so many different things
> and they are all mixed up.  It looks ok, but it's hard to tell.  I know
> it's a pain (I've done it many times) but can you split this up into
> separate patches that each make one change?  The list you have below
> tells me that 5 patches might be appropriate.
>
> If I really had to a full review this myself I would break it into
> multiple patches just to review it.  But that should really be your job.
>
> Thanks,
>
> -corey
>
> >
> > Detail changes:
> > (1) Split IPMIInterface into IPMIInterfaceHost (for host side
> >     simulation) and IPMIInterfaceClient (for BMC side simulation).
> > (2) rename handle_rsp -> handle_msg so the name fits both BMC side and
> >     Core side.
> > (3) Add a new class IPMICore. This class represents a simulator/externa=
l
> >     connection for both BMC and Core side emulation.
> > (4) Change the original IPMIBmc to IPMIBmcHost, representing host side
> >     simulation.
> > (5) Add a new type IPMIBmcClient representing BMC side simulation.
> > (6) Appy the changes to  the entire IPMI library.
> >
> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
> > ---
> >  hw/acpi/ipmi.c             |   4 +-
> >  hw/ipmi/ipmi.c             |  60 +++++++++++++----
> >  hw/ipmi/ipmi_bmc_extern.c  |  67 ++++++++++--------
> >  hw/ipmi/ipmi_bmc_sim.c     |  78 ++++++++++++---------
> >  hw/ipmi/ipmi_bt.c          |  33 +++++----
> >  hw/ipmi/ipmi_kcs.c         |  31 +++++----
> >  hw/ipmi/isa_ipmi_bt.c      |  18 ++---
> >  hw/ipmi/isa_ipmi_kcs.c     |  13 ++--
> >  hw/ipmi/pci_ipmi_bt.c      |   8 +--
> >  hw/ipmi/pci_ipmi_kcs.c     |   8 +--
> >  hw/ipmi/smbus_ipmi.c       |  26 +++----
> >  hw/ppc/pnv.c               |   4 +-
> >  hw/ppc/pnv_bmc.c           |  22 +++---
> >  hw/smbios/smbios_type_38.c |  11 +--
> >  include/hw/ipmi/ipmi.h     | 135 ++++++++++++++++++++++++++-----------
> >  include/hw/ipmi/ipmi_bt.h  |   2 +-
> >  include/hw/ipmi/ipmi_kcs.h |   2 +-
> >  include/hw/ppc/pnv.h       |  12 ++--
> >  18 files changed, 332 insertions(+), 202 deletions(-)
> >
> > diff --git a/hw/acpi/ipmi.c b/hw/acpi/ipmi.c
> > index a20e57d465..e6d2cd790b 100644
> > --- a/hw/acpi/ipmi.c
> > +++ b/hw/acpi/ipmi.c
> > @@ -66,8 +66,8 @@ void build_ipmi_dev_aml(AcpiDevAmlIf *adev, Aml *scop=
e)
> >  {
> >      Aml *dev;
> >      IPMIFwInfo info =3D {};
> > -    IPMIInterface *ii =3D IPMI_INTERFACE(adev);
> > -    IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii);
> > +    IPMIInterfaceHost *ii =3D IPMI_INTERFACE_HOST(adev);
> > +    IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_GET_CLASS(ii);
> >      uint16_t version;
> >
> >      iic->get_fwinfo(ii, &info);
> > diff --git a/hw/ipmi/ipmi.c b/hw/ipmi/ipmi.c
> > index bbb07b151e..1be923ffb8 100644
> > --- a/hw/ipmi/ipmi.c
> > +++ b/hw/ipmi/ipmi.c
> > @@ -38,7 +38,7 @@ uint32_t ipmi_next_uuid(void)
> >      return ipmi_current_uuid++;
> >  }
> >
> > -static int ipmi_do_hw_op(IPMIInterface *s, enum ipmi_op op, int
> checkonly)
> > +static int ipmi_do_hw_op(IPMIInterfaceHost *s, enum ipmi_op op, int
> checkonly)
> >  {
> >      switch (op) {
> >      case IPMI_RESET_CHASSIS:
> > @@ -78,9 +78,9 @@ static int ipmi_do_hw_op(IPMIInterface *s, enum
> ipmi_op op, int checkonly)
> >      }
> >  }
> >
> > -static void ipmi_interface_class_init(ObjectClass *class, void *data)
> > +static void ipmi_interface_host_class_init(ObjectClass *class, void
> *data)
> >  {
> > -    IPMIInterfaceClass *ik =3D IPMI_INTERFACE_CLASS(class);
> > +    IPMIInterfaceHostClass *ik =3D IPMI_INTERFACE_HOST_CLASS(class);
> >
> >      ik->do_hw_op =3D ipmi_do_hw_op;
> >  }
> > @@ -89,27 +89,48 @@ static const TypeInfo ipmi_interface_type_info =3D =
{
> >      .name =3D TYPE_IPMI_INTERFACE,
> >      .parent =3D TYPE_INTERFACE,
> >      .class_size =3D sizeof(IPMIInterfaceClass),
> > -    .class_init =3D ipmi_interface_class_init,
> > +};
> > +
> > +static const TypeInfo ipmi_interface_host_type_info =3D {
> > +    .name =3D TYPE_IPMI_INTERFACE_HOST,
> > +    .parent =3D TYPE_IPMI_INTERFACE,
> > +    .class_size =3D sizeof(IPMIInterfaceHostClass),
> > +    .class_init =3D ipmi_interface_host_class_init,
> > +};
> > +
> > +static const TypeInfo ipmi_interface_client_type_info =3D {
> > +    .name =3D TYPE_IPMI_INTERFACE_CLIENT,
> > +    .parent =3D TYPE_IPMI_INTERFACE,
> > +    .class_size =3D sizeof(IPMIInterfaceClientClass),
> > +};
> > +
> > +static const TypeInfo ipmi_core_type_info =3D {
> > +    .name =3D TYPE_IPMI_CORE,
> > +    .parent =3D TYPE_DEVICE,
> > +    .instance_size =3D sizeof(IPMICore),
> > +    .class_size =3D sizeof(IPMICoreClass),
> > +    .abstract =3D true,
> >  };
> >
> >  static void isa_ipmi_bmc_check(const Object *obj, const char *name,
> >                                 Object *val, Error **errp)
> >  {
> > -    IPMIBmc *bmc =3D IPMI_BMC(val);
> > +    IPMICore *ic =3D IPMI_CORE(val);
> >
> > -    if (bmc->intf)
> > +    if (ic->intf) {
> >          error_setg(errp, "BMC object is already in use");
> > +    }
> >  }
> >
> >  void ipmi_bmc_find_and_link(Object *obj, Object **bmc)
> >  {
> > -    object_property_add_link(obj, "bmc", TYPE_IPMI_BMC, bmc,
> > +    object_property_add_link(obj, "bmc", TYPE_IPMI_BMC_HOST, bmc,
> >                               isa_ipmi_bmc_check,
> >                               OBJ_PROP_LINK_STRONG);
> >  }
> >
> >  static Property ipmi_bmc_properties[] =3D {
> > -    DEFINE_PROP_UINT8("slave_addr",  IPMIBmc, slave_addr, 0x20),
> > +    DEFINE_PROP_UINT8("slave_addr",  IPMIBmcHost, slave_addr, 0x20),
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> >
> > @@ -120,19 +141,30 @@ static void bmc_class_init(ObjectClass *oc, void
> *data)
> >      device_class_set_props(dc, ipmi_bmc_properties);
> >  }
> >
> > -static const TypeInfo ipmi_bmc_type_info =3D {
> > -    .name =3D TYPE_IPMI_BMC,
> > -    .parent =3D TYPE_DEVICE,
> > -    .instance_size =3D sizeof(IPMIBmc),
> > +static const TypeInfo ipmi_bmc_host_type_info =3D {
> > +    .name =3D TYPE_IPMI_BMC_HOST,
> > +    .parent =3D TYPE_IPMI_CORE,
> > +    .instance_size =3D sizeof(IPMIBmcHost),
> >      .abstract =3D true,
> > -    .class_size =3D sizeof(IPMIBmcClass),
> > +    .class_size =3D sizeof(IPMIBmcHostClass),
> >      .class_init =3D bmc_class_init,
> >  };
> >
> > +static const TypeInfo ipmi_bmc_client_type_info =3D {
> > +    .name =3D TYPE_IPMI_BMC_CLIENT,
> > +    .parent =3D TYPE_IPMI_CORE,
> > +    .instance_size =3D sizeof(IPMIBmcClient),
> > +    .abstract =3D true,
> > +};
> > +
> >  static void ipmi_register_types(void)
> >  {
> >      type_register_static(&ipmi_interface_type_info);
> > -    type_register_static(&ipmi_bmc_type_info);
> > +    type_register_static(&ipmi_interface_host_type_info);
> > +    type_register_static(&ipmi_interface_client_type_info);
> > +    type_register_static(&ipmi_core_type_info);
> > +    type_register_static(&ipmi_bmc_host_type_info);
> > +    type_register_static(&ipmi_bmc_client_type_info);
> >  }
> >
> >  type_init(ipmi_register_types)
> > diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c
> > index acf2bab35f..67f6a5d829 100644
> > --- a/hw/ipmi/ipmi_bmc_extern.c
> > +++ b/hw/ipmi/ipmi_bmc_extern.c
> > @@ -65,7 +65,7 @@
> >  #define TYPE_IPMI_BMC_EXTERN "ipmi-bmc-extern"
> >  OBJECT_DECLARE_SIMPLE_TYPE(IPMIBmcExtern, IPMI_BMC_EXTERN)
> >  struct IPMIBmcExtern {
> > -    IPMIBmc parent;
> > +    IPMIBmcHost parent;
> >
> >      CharBackend chr;
> >
> > @@ -147,8 +147,9 @@ static void continue_send(IPMIBmcExtern *ibe)
> >
> >  static void extern_timeout(void *opaque)
> >  {
> > +    IPMICore *ic =3D opaque;
> >      IPMIBmcExtern *ibe =3D opaque;
> > -    IPMIInterface *s =3D ibe->parent.intf;
> > +    IPMIInterface *s =3D ic->intf;
> >
> >      if (ibe->connected) {
> >          if (ibe->waiting_rsp && (ibe->outlen =3D=3D 0)) {
> > @@ -158,7 +159,7 @@ static void extern_timeout(void *opaque)
> >              ibe->inbuf[1] =3D ibe->outbuf[1] | 0x04;
> >              ibe->inbuf[2] =3D ibe->outbuf[2];
> >              ibe->inbuf[3] =3D IPMI_CC_TIMEOUT;
> > -            k->handle_rsp(s, ibe->outbuf[0], ibe->inbuf + 1, 3);
> > +            k->handle_msg(s, ibe->outbuf[0], ibe->inbuf + 1, 3);
> >          } else {
> >              continue_send(ibe);
> >          }
> > @@ -181,13 +182,13 @@ static void addchar(IPMIBmcExtern *ibe, unsigned
> char ch)
> >      }
> >  }
> >
> > -static void ipmi_bmc_extern_handle_command(IPMIBmc *b,
> > +static void ipmi_bmc_extern_handle_command(IPMICore *ic,
> >                                         uint8_t *cmd, unsigned int
> cmd_len,
> >                                         unsigned int max_cmd_len,
> >                                         uint8_t msg_id)
> >  {
> > -    IPMIBmcExtern *ibe =3D IPMI_BMC_EXTERN(b);
> > -    IPMIInterface *s =3D ibe->parent.intf;
> > +    IPMIBmcExtern *ibe =3D IPMI_BMC_EXTERN(ic);
> > +    IPMIInterface *s =3D ic->intf;
> >      uint8_t err =3D 0, csum;
> >      unsigned int i;
> >
> > @@ -213,7 +214,7 @@ static void ipmi_bmc_extern_handle_command(IPMIBmc
> *b,
> >          rsp[1] =3D cmd[1];
> >          rsp[2] =3D err;
> >          ibe->waiting_rsp =3D false;
> > -        k->handle_rsp(s, msg_id, rsp, 3);
> > +        k->handle_msg(s, msg_id, rsp, 3);
> >          goto out;
> >      }
> >
> > @@ -236,8 +237,11 @@ static void ipmi_bmc_extern_handle_command(IPMIBmc
> *b,
> >
> >  static void handle_hw_op(IPMIBmcExtern *ibe, unsigned char hw_op)
> >  {
> > -    IPMIInterface *s =3D ibe->parent.intf;
> > +    IPMICore *ic =3D IPMI_CORE(ibe);
> > +    IPMIInterface *s =3D ic->intf;
> > +    IPMIInterfaceHost *hs =3D IPMI_INTERFACE_HOST(s);
> >      IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);
> > +    IPMIInterfaceHostClass *hk =3D IPMI_INTERFACE_HOST_GET_CLASS(s);
> >
> >      switch (hw_op) {
> >      case VM_CMD_VERSION:
> > @@ -257,34 +261,36 @@ static void handle_hw_op(IPMIBmcExtern *ibe,
> unsigned char hw_op)
> >          break;
> >
> >      case VM_CMD_POWEROFF:
> > -        k->do_hw_op(s, IPMI_POWEROFF_CHASSIS, 0);
> > +        hk->do_hw_op(hs, IPMI_POWEROFF_CHASSIS, 0);
> >          break;
> >
> >      case VM_CMD_RESET:
> > -        k->do_hw_op(s, IPMI_RESET_CHASSIS, 0);
> > +        hk->do_hw_op(hs, IPMI_RESET_CHASSIS, 0);
> >          break;
> >
> >      case VM_CMD_ENABLE_IRQ:
> > -        k->set_irq_enable(s, 1);
> > +        hk->set_irq_enable(hs, 1);
> >          break;
> >
> >      case VM_CMD_DISABLE_IRQ:
> > -        k->set_irq_enable(s, 0);
> > +        hk->set_irq_enable(hs, 0);
> >          break;
> >
> >      case VM_CMD_SEND_NMI:
> > -        k->do_hw_op(s, IPMI_SEND_NMI, 0);
> > +        hk->do_hw_op(hs, IPMI_SEND_NMI, 0);
> >          break;
> >
> >      case VM_CMD_GRACEFUL_SHUTDOWN:
> > -        k->do_hw_op(s, IPMI_SHUTDOWN_VIA_ACPI_OVERTEMP, 0);
> > +        hk->do_hw_op(hs, IPMI_SHUTDOWN_VIA_ACPI_OVERTEMP, 0);
> >          break;
> >      }
> >  }
> >
> >  static void handle_msg(IPMIBmcExtern *ibe)
> >  {
> > -    IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(ibe->parent.int=
f);
> > +    IPMICore *ic =3D IPMI_CORE(ibe);
> > +    IPMIInterface *s =3D ic->intf;
> > +    IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);
> >
> >      if (ibe->in_escape) {
> >          ipmi_debug("msg escape not ended\n");
> > @@ -306,7 +312,7 @@ static void handle_msg(IPMIBmcExtern *ibe)
> >
> >      timer_del(ibe->extern_timer);
> >      ibe->waiting_rsp =3D false;
> > -    k->handle_rsp(ibe->parent.intf, ibe->inbuf[0], ibe->inbuf + 1,
> ibe->inpos - 1);
> > +    k->handle_msg(s, ibe->inbuf[0], ibe->inbuf + 1, ibe->inpos - 1);
> >  }
> >
> >  static int can_receive(void *opaque)
> > @@ -382,9 +388,12 @@ static void receive(void *opaque, const uint8_t
> *buf, int size)
> >
> >  static void chr_event(void *opaque, QEMUChrEvent event)
> >  {
> > +    IPMICore *ic =3D opaque;
> >      IPMIBmcExtern *ibe =3D opaque;
> > -    IPMIInterface *s =3D ibe->parent.intf;
> > +    IPMIInterface *s =3D ic->intf;
> > +    IPMIInterfaceHost *hs =3D IPMI_INTERFACE_HOST(s);
> >      IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);
> > +    IPMIInterfaceHostClass *hk =3D IPMI_INTERFACE_HOST_GET_CLASS(s);
> >      unsigned char v;
> >
> >      switch (event) {
> > @@ -398,17 +407,17 @@ static void chr_event(void *opaque, QEMUChrEvent
> event)
> >          ibe->outlen++;
> >          addchar(ibe, VM_CMD_CAPABILITIES);
> >          v =3D VM_CAPABILITIES_IRQ | VM_CAPABILITIES_ATTN;
> > -        if (k->do_hw_op(ibe->parent.intf, IPMI_POWEROFF_CHASSIS, 1) =
=3D=3D
> 0) {
> > +        if (hk->do_hw_op(hs, IPMI_POWEROFF_CHASSIS, 1) =3D=3D 0) {
> >              v |=3D VM_CAPABILITIES_POWER;
> >          }
> > -        if (k->do_hw_op(ibe->parent.intf,
> IPMI_SHUTDOWN_VIA_ACPI_OVERTEMP, 1)
> > +        if (hk->do_hw_op(hs, IPMI_SHUTDOWN_VIA_ACPI_OVERTEMP, 1)
> >              =3D=3D 0) {
> >              v |=3D VM_CAPABILITIES_GRACEFUL_SHUTDOWN;
> >          }
> > -        if (k->do_hw_op(ibe->parent.intf, IPMI_RESET_CHASSIS, 1) =3D=
=3D 0) {
> > +        if (hk->do_hw_op(hs, IPMI_RESET_CHASSIS, 1) =3D=3D 0) {
> >              v |=3D VM_CAPABILITIES_RESET;
> >          }
> > -        if (k->do_hw_op(ibe->parent.intf, IPMI_SEND_NMI, 1) =3D=3D 0) =
{
> > +        if (hk->do_hw_op(hs, IPMI_SEND_NMI, 1) =3D=3D 0) {
> >              v |=3D VM_CAPABILITIES_NMI;
> >          }
> >          addchar(ibe, v);
> > @@ -433,7 +442,7 @@ static void chr_event(void *opaque, QEMUChrEvent
> event)
> >              ibe->inbuf[1] =3D ibe->outbuf[1] | 0x04;
> >              ibe->inbuf[2] =3D ibe->outbuf[2];
> >              ibe->inbuf[3] =3D IPMI_CC_BMC_INIT_IN_PROGRESS;
> > -            k->handle_rsp(s, ibe->outbuf[0], ibe->inbuf + 1, 3);
> > +            k->handle_msg(s, ibe->outbuf[0], ibe->inbuf + 1, 3);
> >          }
> >          break;
> >
> > @@ -445,7 +454,7 @@ static void chr_event(void *opaque, QEMUChrEvent
> event)
> >      }
> >  }
> >
> > -static void ipmi_bmc_extern_handle_reset(IPMIBmc *b)
> > +static void ipmi_bmc_extern_handle_reset(IPMIBmcHost *b)
> >  {
> >      IPMIBmcExtern *ibe =3D IPMI_BMC_EXTERN(b);
> >
> > @@ -475,14 +484,15 @@ static int ipmi_bmc_extern_post_migrate(void
> *opaque, int version_id)
> >       * error on the interface if a response was being waited for.
> >       */
> >      if (ibe->waiting_rsp) {
> > -        IPMIInterface *ii =3D ibe->parent.intf;
> > +        IPMICore *ic =3D opaque;
> > +        IPMIInterface *ii =3D ic->intf;
> >          IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii);
> >
> >          ibe->waiting_rsp =3D false;
> >          ibe->inbuf[1] =3D ibe->outbuf[1] | 0x04;
> >          ibe->inbuf[2] =3D ibe->outbuf[2];
> >          ibe->inbuf[3] =3D IPMI_CC_BMC_INIT_IN_PROGRESS;
> > -        iic->handle_rsp(ii, ibe->outbuf[0], ibe->inbuf + 1, 3);
> > +        iic->handle_msg(ii, ibe->outbuf[0], ibe->inbuf + 1, 3);
> >      }
> >      return 0;
> >  }
> > @@ -522,9 +532,10 @@ static Property ipmi_bmc_extern_properties[] =3D {
> >  static void ipmi_bmc_extern_class_init(ObjectClass *oc, void *data)
> >  {
> >      DeviceClass *dc =3D DEVICE_CLASS(oc);
> > -    IPMIBmcClass *bk =3D IPMI_BMC_CLASS(oc);
> > +    IPMICoreClass *ck =3D IPMI_CORE_CLASS(oc);
> > +    IPMIBmcHostClass *bk =3D IPMI_BMC_HOST_CLASS(oc);
> >
> > -    bk->handle_command =3D ipmi_bmc_extern_handle_command;
> > +    ck->handle_command =3D ipmi_bmc_extern_handle_command;
> >      bk->handle_reset =3D ipmi_bmc_extern_handle_reset;
> >      dc->hotpluggable =3D false;
> >      dc->realize =3D ipmi_bmc_extern_realize;
> > @@ -533,7 +544,7 @@ static void ipmi_bmc_extern_class_init(ObjectClass
> *oc, void *data)
> >
> >  static const TypeInfo ipmi_bmc_extern_type =3D {
> >      .name          =3D TYPE_IPMI_BMC_EXTERN,
> > -    .parent        =3D TYPE_IPMI_BMC,
> > +    .parent        =3D TYPE_IPMI_BMC_HOST,
> >      .instance_size =3D sizeof(IPMIBmcExtern),
> >      .instance_init =3D ipmi_bmc_extern_init,
> >      .instance_finalize =3D ipmi_bmc_extern_finalize,
> > diff --git a/hw/ipmi/ipmi_bmc_sim.c b/hw/ipmi/ipmi_bmc_sim.c
> > index 905e091094..6296e5cfed 100644
> > --- a/hw/ipmi/ipmi_bmc_sim.c
> > +++ b/hw/ipmi/ipmi_bmc_sim.c
> > @@ -178,7 +178,7 @@ typedef struct IPMIRcvBufEntry {
> >  } IPMIRcvBufEntry;
> >
> >  struct IPMIBmcSim {
> > -    IPMIBmc parent;
> > +    IPMIBmcHost parent;
> >
> >      QEMUTimer *timer;
> >
> > @@ -384,7 +384,7 @@ static int sdr_find_entry(IPMISdr *sdr, uint16_t
> recid,
> >      return 1;
> >  }
> >
> > -int ipmi_bmc_sdr_find(IPMIBmc *b, uint16_t recid,
> > +int ipmi_bmc_sdr_find(IPMIBmcHost *b, uint16_t recid,
> >                        const struct ipmi_sdr_compact **sdr, uint16_t
> *nextrec)
> >
> >  {
> > @@ -448,10 +448,11 @@ static int attn_irq_enabled(IPMIBmcSim *ibs)
> >              IPMI_BMC_MSG_FLAG_EVT_BUF_FULL_SET(ibs));
> >  }
> >
> > -void ipmi_bmc_gen_event(IPMIBmc *b, uint8_t *evt, bool log)
> > +void ipmi_bmc_gen_event(IPMIBmcHost *b, uint8_t *evt, bool log)
> >  {
> >      IPMIBmcSim *ibs =3D IPMI_BMC_SIMULATOR(b);
> > -    IPMIInterface *s =3D ibs->parent.intf;
> > +    IPMICore *ic =3D IPMI_CORE(ibs);
> > +    IPMIInterface *s =3D ic->intf;
> >      IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);
> >
> >      if (!IPMI_BMC_EVENT_MSG_BUF_ENABLED(ibs)) {
> > @@ -475,7 +476,8 @@ void ipmi_bmc_gen_event(IPMIBmc *b, uint8_t *evt,
> bool log)
> >  static void gen_event(IPMIBmcSim *ibs, unsigned int sens_num, uint8_t
> deassert,
> >                        uint8_t evd1, uint8_t evd2, uint8_t evd3)
> >  {
> > -    IPMIInterface *s =3D ibs->parent.intf;
> > +    IPMICore *ic =3D IPMI_CORE(ibs);
> > +    IPMIInterface *s =3D ic->intf;
> >      IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);
> >      uint8_t evt[16];
> >      IPMISensor *sens =3D ibs->sensors + sens_num;
> > @@ -638,13 +640,14 @@ static void next_timeout(IPMIBmcSim *ibs)
> >      timer_mod_ns(ibs->timer, next);
> >  }
> >
> > -static void ipmi_sim_handle_command(IPMIBmc *b,
> > +static void ipmi_sim_handle_command(IPMICore *b,
> >                                      uint8_t *cmd, unsigned int cmd_len=
,
> >                                      unsigned int max_cmd_len,
> >                                      uint8_t msg_id)
> >  {
> >      IPMIBmcSim *ibs =3D IPMI_BMC_SIMULATOR(b);
> > -    IPMIInterface *s =3D ibs->parent.intf;
> > +    IPMICore *ic =3D IPMI_CORE(ibs);
> > +    IPMIInterface *s =3D ic->intf;
> >      IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);
> >      const IPMICmdHandler *hdl;
> >      RspBuffer rsp =3D RSP_BUFFER_INITIALIZER;
> > @@ -690,15 +693,18 @@ static void ipmi_sim_handle_command(IPMIBmc *b,
> >      hdl->cmd_handler(ibs, cmd, cmd_len, &rsp);
> >
> >   out:
> > -    k->handle_rsp(s, msg_id, rsp.buffer, rsp.len);
> > +    k->handle_msg(s, msg_id, rsp.buffer, rsp.len);
> >
> >      next_timeout(ibs);
> >  }
> >
> >  static void ipmi_sim_handle_timeout(IPMIBmcSim *ibs)
> >  {
> > -    IPMIInterface *s =3D ibs->parent.intf;
> > +    IPMICore *ic =3D IPMI_CORE(ibs);
> > +    IPMIInterface *s =3D ic->intf;
> > +    IPMIInterfaceHost *hs =3D IPMI_INTERFACE_HOST(s);
> >      IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);
> > +    IPMIInterfaceHostClass *hk =3D IPMI_INTERFACE_HOST_CLASS(k);
> >
> >      if (!ibs->watchdog_running) {
> >          goto out;
> > @@ -708,7 +714,7 @@ static void ipmi_sim_handle_timeout(IPMIBmcSim *ibs=
)
> >          switch (IPMI_BMC_WATCHDOG_GET_PRE_ACTION(ibs)) {
> >          case IPMI_BMC_WATCHDOG_PRE_NMI:
> >              ibs->msg_flags |=3D IPMI_BMC_MSG_FLAG_WATCHDOG_TIMEOUT_MAS=
K;
> > -            k->do_hw_op(s, IPMI_SEND_NMI, 0);
> > +            hk->do_hw_op(hs, IPMI_SEND_NMI, 0);
> >              sensor_set_discrete_bit(ibs, IPMI_WATCHDOG_SENSOR, 8, 1,
> >                                      0xc8, (2 << 4) | 0xf, 0xff);
> >              break;
> > @@ -743,19 +749,19 @@ static void ipmi_sim_handle_timeout(IPMIBmcSim
> *ibs)
> >      case IPMI_BMC_WATCHDOG_ACTION_RESET:
> >          sensor_set_discrete_bit(ibs, IPMI_WATCHDOG_SENSOR, 1, 1,
> >                                  0xc1, ibs->watchdog_use & 0xf, 0xff);
> > -        k->do_hw_op(s, IPMI_RESET_CHASSIS, 0);
> > +        hk->do_hw_op(hs, IPMI_RESET_CHASSIS, 0);
> >          break;
> >
> >      case IPMI_BMC_WATCHDOG_ACTION_POWER_DOWN:
> >          sensor_set_discrete_bit(ibs, IPMI_WATCHDOG_SENSOR, 2, 1,
> >                                  0xc2, ibs->watchdog_use & 0xf, 0xff);
> > -        k->do_hw_op(s, IPMI_POWEROFF_CHASSIS, 0);
> > +        hk->do_hw_op(hs, IPMI_POWEROFF_CHASSIS, 0);
> >          break;
> >
> >      case IPMI_BMC_WATCHDOG_ACTION_POWER_CYCLE:
> >          sensor_set_discrete_bit(ibs, IPMI_WATCHDOG_SENSOR, 2, 1,
> >                                  0xc3, ibs->watchdog_use & 0xf, 0xff);
> > -        k->do_hw_op(s, IPMI_POWERCYCLE_CHASSIS, 0);
> > +        hk->do_hw_op(hs, IPMI_POWERCYCLE_CHASSIS, 0);
> >          break;
> >      }
> >
> > @@ -788,8 +794,9 @@ static void chassis_control(IPMIBmcSim *ibs,
> >                              uint8_t *cmd, unsigned int cmd_len,
> >                              RspBuffer *rsp)
> >  {
> > -    IPMIInterface *s =3D ibs->parent.intf;
> > -    IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);
> > +    IPMICore *ic =3D IPMI_CORE(ibs);
> > +    IPMIInterfaceHost *s =3D IPMI_INTERFACE_HOST(ic->intf);
> > +    IPMIInterfaceHostClass *k =3D IPMI_INTERFACE_HOST_GET_CLASS(s);
> >
> >      switch (cmd[2] & 0xf) {
> >      case 0: /* power down */
> > @@ -845,8 +852,9 @@ static void get_device_id(IPMIBmcSim *ibs,
> >
> >  static void set_global_enables(IPMIBmcSim *ibs, uint8_t val)
> >  {
> > -    IPMIInterface *s =3D ibs->parent.intf;
> > -    IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);
> > +    IPMICore *ic =3D IPMI_CORE(ibs);
> > +    IPMIInterfaceHost *s =3D IPMI_INTERFACE_HOST(ic->intf);
> > +    IPMIInterfaceHostClass *k =3D IPMI_INTERFACE_HOST_GET_CLASS(s);
> >      bool irqs_on;
> >
> >      ibs->bmc_global_enables =3D val;
> > @@ -861,8 +869,9 @@ static void cold_reset(IPMIBmcSim *ibs,
> >                         uint8_t *cmd, unsigned int cmd_len,
> >                         RspBuffer *rsp)
> >  {
> > -    IPMIInterface *s =3D ibs->parent.intf;
> > -    IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);
> > +    IPMICore *ic =3D IPMI_CORE(ibs);
> > +    IPMIInterfaceHost *s =3D IPMI_INTERFACE_HOST(ic->intf);
> > +    IPMIInterfaceHostClass *k =3D IPMI_INTERFACE_HOST_GET_CLASS(s);
> >
> >      /* Disable all interrupts */
> >      set_global_enables(ibs, 1 << IPMI_BMC_EVENT_LOG_BIT);
> > @@ -876,8 +885,9 @@ static void warm_reset(IPMIBmcSim *ibs,
> >                         uint8_t *cmd, unsigned int cmd_len,
> >                         RspBuffer *rsp)
> >  {
> > -    IPMIInterface *s =3D ibs->parent.intf;
> > -    IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);
> > +    IPMICore *ic =3D IPMI_CORE(ibs);
> > +    IPMIInterfaceHost *s =3D IPMI_INTERFACE_HOST(ic->intf);
> > +    IPMIInterfaceHostClass *k =3D IPMI_INTERFACE_HOST_GET_CLASS(s);
> >
> >      if (k->reset) {
> >          k->reset(s, false);
> > @@ -939,7 +949,8 @@ static void clr_msg_flags(IPMIBmcSim *ibs,
> >                            uint8_t *cmd, unsigned int cmd_len,
> >                            RspBuffer *rsp)
> >  {
> > -    IPMIInterface *s =3D ibs->parent.intf;
> > +    IPMICore *ic =3D IPMI_CORE(ibs);
> > +    IPMIInterface *s =3D ic->intf;
> >      IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);
> >
> >      ibs->msg_flags &=3D ~cmd[2];
> > @@ -957,7 +968,8 @@ static void read_evt_msg_buf(IPMIBmcSim *ibs,
> >                               uint8_t *cmd, unsigned int cmd_len,
> >                               RspBuffer *rsp)
> >  {
> > -    IPMIInterface *s =3D ibs->parent.intf;
> > +    IPMICore *ic =3D IPMI_CORE(ibs);
> > +    IPMIInterface *s =3D ic->intf;
> >      IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);
> >      unsigned int i;
> >
> > @@ -989,7 +1001,8 @@ static void get_msg(IPMIBmcSim *ibs,
> >      g_free(msg);
> >
> >      if (QTAILQ_EMPTY(&ibs->rcvbufs)) {
> > -        IPMIInterface *s =3D ibs->parent.intf;
> > +        IPMICore *ic =3D IPMI_CORE(ibs);
> > +        IPMIInterface *s =3D ic->intf;
> >          IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);
> >
> >          ibs->msg_flags &=3D ~IPMI_BMC_MSG_FLAG_RCV_MSG_QUEUE;
> > @@ -1014,7 +1027,8 @@ static void send_msg(IPMIBmcSim *ibs,
> >                       uint8_t *cmd, unsigned int cmd_len,
> >                       RspBuffer *rsp)
> >  {
> > -    IPMIInterface *s =3D ibs->parent.intf;
> > +    IPMICore *ic =3D IPMI_CORE(ibs);
> > +    IPMIInterface *s =3D ic->intf;
> >      IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);
> >      IPMIRcvBufEntry *msg;
> >      uint8_t *buf;
> > @@ -1130,8 +1144,9 @@ static void set_watchdog_timer(IPMIBmcSim *ibs,
> >                                 uint8_t *cmd, unsigned int cmd_len,
> >                                 RspBuffer *rsp)
> >  {
> > -    IPMIInterface *s =3D ibs->parent.intf;
> > -    IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);
> > +    IPMICore *ic =3D IPMI_CORE(ibs);
> > +    IPMIInterfaceHost *s =3D IPMI_INTERFACE_HOST(ic->intf);
> > +    IPMIInterfaceHostClass *k =3D IPMI_INTERFACE_HOST_GET_CLASS(s);
> >      unsigned int val;
> >
> >      val =3D cmd[2] & 0x7; /* Validate use */
> > @@ -2159,9 +2174,8 @@ out:
> >
> >  static void ipmi_sim_realize(DeviceState *dev, Error **errp)
> >  {
> > -    IPMIBmc *b =3D IPMI_BMC(dev);
> >      unsigned int i;
> > -    IPMIBmcSim *ibs =3D IPMI_BMC_SIMULATOR(b);
> > +    IPMIBmcSim *ibs =3D IPMI_BMC_SIMULATOR(dev);
> >
> >      QTAILQ_INIT(&ibs->rcvbufs);
> >
> > @@ -2209,17 +2223,17 @@ static Property ipmi_sim_properties[] =3D {
> >  static void ipmi_sim_class_init(ObjectClass *oc, void *data)
> >  {
> >      DeviceClass *dc =3D DEVICE_CLASS(oc);
> > -    IPMIBmcClass *bk =3D IPMI_BMC_CLASS(oc);
> > +    IPMICoreClass *ck =3D IPMI_CORE_CLASS(oc);
> >
> >      dc->hotpluggable =3D false;
> >      dc->realize =3D ipmi_sim_realize;
> >      device_class_set_props(dc, ipmi_sim_properties);
> > -    bk->handle_command =3D ipmi_sim_handle_command;
> > +    ck->handle_command =3D ipmi_sim_handle_command;
> >  }
> >
> >  static const TypeInfo ipmi_sim_type =3D {
> >      .name          =3D TYPE_IPMI_BMC_SIMULATOR,
> > -    .parent        =3D TYPE_IPMI_BMC,
> > +    .parent        =3D TYPE_IPMI_BMC_HOST,
> >      .instance_size =3D sizeof(IPMIBmcSim),
> >      .class_init    =3D ipmi_sim_class_init,
> >  };
> > diff --git a/hw/ipmi/ipmi_bt.c b/hw/ipmi/ipmi_bt.c
> > index 22f94fb98d..1363098753 100644
> > --- a/hw/ipmi/ipmi_bt.c
> > +++ b/hw/ipmi/ipmi_bt.c
> > @@ -92,8 +92,9 @@ static void ipmi_bt_lower_irq(IPMIBT *ib)
> >      }
> >  }
> >
> > -static void ipmi_bt_handle_event(IPMIInterface *ii)
> > +static void ipmi_bt_handle_event(IPMIInterfaceHost *iih)
> >  {
> > +    IPMIInterface *ii =3D IPMI_INTERFACE(iih);
> >      IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii);
> >      IPMIBT *ib =3D iic->get_backend_data(ii);
> >
> > @@ -141,8 +142,8 @@ static void ipmi_bt_handle_event(IPMIInterface *ii)
> >      ib->waiting_seq =3D ib->inmsg[2];
> >      ib->inmsg[2] =3D ib->inmsg[1];
> >      {
> > -        IPMIBmcClass *bk =3D IPMI_BMC_GET_CLASS(ib->bmc);
> > -        bk->handle_command(ib->bmc, ib->inmsg + 2, ib->inlen - 2,
> > +        IPMICoreClass *ck =3D IPMI_CORE_GET_CLASS(ib->bmc);
> > +        ck->handle_command(IPMI_CORE(ib->bmc), ib->inmsg + 2, ib->inle=
n
> - 2,
> >                             sizeof(ib->inmsg), ib->waiting_rsp);
> >      }
> >   out:
> > @@ -215,9 +216,9 @@ static uint64_t ipmi_bt_ioport_read(void *opaque,
> hwaddr addr, unsigned size)
> >      return ret;
> >  }
> >
> > -static void ipmi_bt_signal(IPMIBT *ib, IPMIInterface *ii)
> > +static void ipmi_bt_signal(IPMIBT *ib, IPMIInterfaceHost *ii)
> >  {
> > -    IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii);
> > +    IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_GET_CLASS(ii);
> >
> >      ib->do_wake =3D 1;
> >      while (ib->do_wake) {
> > @@ -254,7 +255,7 @@ static void ipmi_bt_ioport_write(void *opaque,
> hwaddr addr, uint64_t val,
> >          }
> >          if (IPMI_BT_GET_H2B_ATN(val)) {
> >              IPMI_BT_SET_BBUSY(ib->control_reg, 1);
> > -            ipmi_bt_signal(ib, ii);
> > +            ipmi_bt_signal(ib, IPMI_INTERFACE_HOST(ii));
> >          }
> >          break;
> >
> > @@ -329,10 +330,10 @@ static void ipmi_bt_set_atn(IPMIInterface *ii, in=
t
> val, int irq)
> >      }
> >  }
> >
> > -static void ipmi_bt_handle_reset(IPMIInterface *ii, bool is_cold)
> > +static void ipmi_bt_handle_reset(IPMIInterfaceHost *ii, bool is_cold)
> >  {
> >      IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii);
> > -    IPMIBT *ib =3D iic->get_backend_data(ii);
> > +    IPMIBT *ib =3D iic->get_backend_data(IPMI_INTERFACE(ii));
> >
> >      if (is_cold) {
> >          /* Disable the BT interrupt on reset */
> > @@ -344,16 +345,18 @@ static void ipmi_bt_handle_reset(IPMIInterface
> *ii, bool is_cold)
> >      }
> >  }
> >
> > -static void ipmi_bt_set_irq_enable(IPMIInterface *ii, int val)
> > +static void ipmi_bt_set_irq_enable(IPMIInterfaceHost *ii, int val)
> >  {
> >      IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii);
> > -    IPMIBT *ib =3D iic->get_backend_data(ii);
> > +    IPMIBT *ib =3D iic->get_backend_data(IPMI_INTERFACE(ii));
> >
> >      ib->irqs_enabled =3D val;
> >  }
> >
> > -static void ipmi_bt_init(IPMIInterface *ii, unsigned int min_size,
> Error **errp)
> > +static void ipmi_bt_init(IPMIInterfaceHost *iih, unsigned int min_size=
,
> > +                         Error **errp)
> >  {
> > +    IPMIInterface *ii =3D IPMI_INTERFACE(iih);
> >      IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii);
> >      IPMIBT *ib =3D iic->get_backend_data(ii);
> >
> > @@ -426,11 +429,13 @@ void ipmi_bt_get_fwinfo(struct IPMIBT *ib,
> IPMIFwInfo *info)
> >      info->irq_type =3D IPMI_LEVEL_IRQ;
> >  }
> >
> > -void ipmi_bt_class_init(IPMIInterfaceClass *iic)
> > +void ipmi_bt_class_init(IPMIInterfaceClass *ic)
> >  {
> > +    IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_CLASS(ic);
> > +
> >      iic->init =3D ipmi_bt_init;
> > -    iic->set_atn =3D ipmi_bt_set_atn;
> > -    iic->handle_rsp =3D ipmi_bt_handle_rsp;
> > +    ic->set_atn =3D ipmi_bt_set_atn;
> > +    ic->handle_msg =3D ipmi_bt_handle_rsp;
> >      iic->handle_if_event =3D ipmi_bt_handle_event;
> >      iic->set_irq_enable =3D ipmi_bt_set_irq_enable;
> >      iic->reset =3D ipmi_bt_handle_reset;
> > diff --git a/hw/ipmi/ipmi_kcs.c b/hw/ipmi/ipmi_kcs.c
> > index a77612946a..771f2bc0b2 100644
> > --- a/hw/ipmi/ipmi_kcs.c
> > +++ b/hw/ipmi/ipmi_kcs.c
> > @@ -94,18 +94,20 @@ static void ipmi_kcs_lower_irq(IPMIKCS *ik)
> >
> >  static void ipmi_kcs_signal(IPMIKCS *ik, IPMIInterface *ii)
> >  {
> > -    IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii);
> > +    IPMIInterfaceHost *iih =3D IPMI_INTERFACE_HOST(ii);
> > +    IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_GET_CLASS(ii);
> >
> >      ik->do_wake =3D 1;
> >      while (ik->do_wake) {
> >          ik->do_wake =3D 0;
> > -        iic->handle_if_event(ii);
> > +        iic->handle_if_event(iih);
> >      }
> >  }
> >
> > -static void ipmi_kcs_handle_event(IPMIInterface *ii)
> > +static void ipmi_kcs_handle_event(IPMIInterfaceHost *iih)
> >  {
> > -    IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii);
> > +    IPMIInterface *ii =3D IPMI_INTERFACE(iih);
> > +    IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(iih);
> >      IPMIKCS *ik =3D iic->get_backend_data(ii);
> >
> >      if (ik->cmd_reg =3D=3D IPMI_KCS_ABORT_STATUS_CMD) {
> > @@ -162,12 +164,12 @@ static void ipmi_kcs_handle_event(IPMIInterface
> *ii)
> >              ik->inlen++;
> >          }
> >          if (ik->write_end) {
> > -            IPMIBmcClass *bk =3D IPMI_BMC_GET_CLASS(ik->bmc);
> > +            IPMICoreClass *ck =3D IPMI_CORE_GET_CLASS(ik->bmc);
> >              ik->outlen =3D 0;
> >              ik->write_end =3D 0;
> >              ik->outpos =3D 0;
> > -            bk->handle_command(ik->bmc, ik->inmsg, ik->inlen,
> sizeof(ik->inmsg),
> > -                               ik->waiting_rsp);
> > +            ck->handle_command(IPMI_CORE(ik->bmc), ik->inmsg, ik->inle=
n,
> > +                               sizeof(ik->inmsg), ik->waiting_rsp);
> >              goto out_noibf;
> >          } else if (ik->cmd_reg =3D=3D IPMI_KCS_WRITE_END_CMD) {
> >              ik->cmd_reg =3D -1;
> > @@ -321,18 +323,19 @@ static void ipmi_kcs_set_atn(IPMIInterface *ii,
> int val, int irq)
> >      }
> >  }
> >
> > -static void ipmi_kcs_set_irq_enable(IPMIInterface *ii, int val)
> > +static void ipmi_kcs_set_irq_enable(IPMIInterfaceHost *ii, int val)
> >  {
> >      IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii);
> > -    IPMIKCS *ik =3D iic->get_backend_data(ii);
> > +    IPMIKCS *ik =3D iic->get_backend_data(IPMI_INTERFACE(ii));
> >
> >      ik->irqs_enabled =3D val;
> >  }
> >
> >  /* min_size must be a power of 2. */
> > -static void ipmi_kcs_init(IPMIInterface *ii, unsigned int min_size,
> > +static void ipmi_kcs_init(IPMIInterfaceHost *iih, unsigned int min_siz=
e,
> >                            Error **errp)
> >  {
> > +    IPMIInterface *ii =3D IPMI_INTERFACE(iih);
> >      IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii);
> >      IPMIKCS *ik =3D iic->get_backend_data(ii);
> >
> > @@ -413,11 +416,13 @@ void ipmi_kcs_get_fwinfo(IPMIKCS *ik, IPMIFwInfo
> *info)
> >      info->irq_type =3D IPMI_LEVEL_IRQ;
> >  }
> >
> > -void ipmi_kcs_class_init(IPMIInterfaceClass *iic)
> > +void ipmi_kcs_class_init(IPMIInterfaceClass *ic)
> >  {
> > +    IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_CLASS(ic);
> > +
> >      iic->init =3D ipmi_kcs_init;
> > -    iic->set_atn =3D ipmi_kcs_set_atn;
> > -    iic->handle_rsp =3D ipmi_kcs_handle_rsp;
> > +    ic->set_atn =3D ipmi_kcs_set_atn;
> > +    ic->handle_msg =3D ipmi_kcs_handle_rsp;
> >      iic->handle_if_event =3D ipmi_kcs_handle_event;
> >      iic->set_irq_enable =3D ipmi_kcs_set_irq_enable;
> >  }
> > diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c
> > index a83e7243d6..a298f5f981 100644
> > --- a/hw/ipmi/isa_ipmi_bt.c
> > +++ b/hw/ipmi/isa_ipmi_bt.c
> > @@ -44,7 +44,8 @@ struct ISAIPMIBTDevice {
> >      uint32_t uuid;
> >  };
> >
> > -static void isa_ipmi_bt_get_fwinfo(struct IPMIInterface *ii, IPMIFwInf=
o
> *info)
> > +static void isa_ipmi_bt_get_fwinfo(struct IPMIInterfaceHost *ii,
> > +                                   IPMIFwInfo *info)
> >  {
> >      ISAIPMIBTDevice *iib =3D ISA_IPMI_BT(ii);
> >
> > @@ -73,8 +74,8 @@ static void isa_ipmi_bt_realize(DeviceState *dev,
> Error **errp)
> >      Error *err =3D NULL;
> >      ISADevice *isadev =3D ISA_DEVICE(dev);
> >      ISAIPMIBTDevice *iib =3D ISA_IPMI_BT(dev);
> > -    IPMIInterface *ii =3D IPMI_INTERFACE(dev);
> > -    IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii);
> > +    IPMIInterfaceHost *ii =3D IPMI_INTERFACE_HOST(dev);
> > +    IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_GET_CLASS(ii);
> >
> >      if (!iib->bt.bmc) {
> >          error_setg(errp, "IPMI device requires a bmc attribute to be
> set");
> > @@ -83,7 +84,7 @@ static void isa_ipmi_bt_realize(DeviceState *dev,
> Error **errp)
> >
> >      iib->uuid =3D ipmi_next_uuid();
> >
> > -    iib->bt.bmc->intf =3D ii;
> > +    IPMI_CORE(iib->bt.bmc)->intf =3D IPMI_INTERFACE(ii);
> >      iib->bt.opaque =3D iib;
> >
> >      iic->init(ii, 0, &err);
> > @@ -144,14 +145,15 @@ static Property ipmi_isa_properties[] =3D {
> >  static void isa_ipmi_bt_class_init(ObjectClass *oc, void *data)
> >  {
> >      DeviceClass *dc =3D DEVICE_CLASS(oc);
> > -    IPMIInterfaceClass *iic =3D IPMI_INTERFACE_CLASS(oc);
> > +    IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_CLASS(oc);
> > +    IPMIInterfaceClass *ic =3D IPMI_INTERFACE_CLASS(oc);
> >      AcpiDevAmlIfClass *adevc =3D ACPI_DEV_AML_IF_CLASS(oc);
> >
> >      dc->realize =3D isa_ipmi_bt_realize;
> >      device_class_set_props(dc, ipmi_isa_properties);
> >
> > -    iic->get_backend_data =3D isa_ipmi_bt_get_backend_data;
> > -    ipmi_bt_class_init(iic);
> > +    ic->get_backend_data =3D isa_ipmi_bt_get_backend_data;
> > +    ipmi_bt_class_init(ic);
> >      iic->get_fwinfo =3D isa_ipmi_bt_get_fwinfo;
> >      adevc->build_dev_aml =3D build_ipmi_dev_aml;
> >  }
> > @@ -163,7 +165,7 @@ static const TypeInfo isa_ipmi_bt_info =3D {
> >      .instance_init =3D isa_ipmi_bt_init,
> >      .class_init    =3D isa_ipmi_bt_class_init,
> >      .interfaces =3D (InterfaceInfo[]) {
> > -        { TYPE_IPMI_INTERFACE },
> > +        { TYPE_IPMI_INTERFACE_HOST },
> >          { TYPE_ACPI_DEV_AML_IF },
> >          { }
> >      }
> > diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c
> > index b2ed70b9da..a1372ae448 100644
> > --- a/hw/ipmi/isa_ipmi_kcs.c
> > +++ b/hw/ipmi/isa_ipmi_kcs.c
> > @@ -44,7 +44,7 @@ struct ISAIPMIKCSDevice {
> >      uint32_t uuid;
> >  };
> >
> > -static void isa_ipmi_kcs_get_fwinfo(IPMIInterface *ii, IPMIFwInfo *inf=
o)
> > +static void isa_ipmi_kcs_get_fwinfo(IPMIInterfaceHost *ii, IPMIFwInfo
> *info)
> >  {
> >      ISAIPMIKCSDevice *iik =3D ISA_IPMI_KCS(ii);
> >
> > @@ -72,8 +72,8 @@ static void ipmi_isa_realize(DeviceState *dev, Error
> **errp)
> >      Error *err =3D NULL;
> >      ISADevice *isadev =3D ISA_DEVICE(dev);
> >      ISAIPMIKCSDevice *iik =3D ISA_IPMI_KCS(dev);
> > -    IPMIInterface *ii =3D IPMI_INTERFACE(dev);
> > -    IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii);
> > +    IPMIInterfaceHost *ii =3D IPMI_INTERFACE_HOST(dev);
> > +    IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_GET_CLASS(ii);
> >
> >      if (!iik->kcs.bmc) {
> >          error_setg(errp, "IPMI device requires a bmc attribute to be
> set");
> > @@ -82,7 +82,7 @@ static void ipmi_isa_realize(DeviceState *dev, Error
> **errp)
> >
> >      iik->uuid =3D ipmi_next_uuid();
> >
> > -    iik->kcs.bmc->intf =3D ii;
> > +    IPMI_CORE(iik->kcs.bmc)->intf =3D IPMI_INTERFACE(ii);
> >      iik->kcs.opaque =3D iik;
> >
> >      iic->init(ii, 0, &err);
> > @@ -152,6 +152,7 @@ static void isa_ipmi_kcs_class_init(ObjectClass *oc=
,
> void *data)
> >  {
> >      DeviceClass *dc =3D DEVICE_CLASS(oc);
> >      IPMIInterfaceClass *iic =3D IPMI_INTERFACE_CLASS(oc);
> > +    IPMIInterfaceHostClass *iihc =3D IPMI_INTERFACE_HOST_CLASS(oc);
> >      AcpiDevAmlIfClass *adevc =3D ACPI_DEV_AML_IF_CLASS(oc);
> >
> >      dc->realize =3D ipmi_isa_realize;
> > @@ -159,7 +160,7 @@ static void isa_ipmi_kcs_class_init(ObjectClass *oc=
,
> void *data)
> >
> >      iic->get_backend_data =3D isa_ipmi_kcs_get_backend_data;
> >      ipmi_kcs_class_init(iic);
> > -    iic->get_fwinfo =3D isa_ipmi_kcs_get_fwinfo;
> > +    iihc->get_fwinfo =3D isa_ipmi_kcs_get_fwinfo;
> >      adevc->build_dev_aml =3D build_ipmi_dev_aml;
> >  }
> >
> > @@ -170,7 +171,7 @@ static const TypeInfo isa_ipmi_kcs_info =3D {
> >      .instance_init =3D isa_ipmi_kcs_init,
> >      .class_init    =3D isa_ipmi_kcs_class_init,
> >      .interfaces =3D (InterfaceInfo[]) {
> > -        { TYPE_IPMI_INTERFACE },
> > +        { TYPE_IPMI_INTERFACE_HOST },
> >          { TYPE_ACPI_DEV_AML_IF },
> >          { }
> >      }
> > diff --git a/hw/ipmi/pci_ipmi_bt.c b/hw/ipmi/pci_ipmi_bt.c
> > index 633931b825..883bbda8f1 100644
> > --- a/hw/ipmi/pci_ipmi_bt.c
> > +++ b/hw/ipmi/pci_ipmi_bt.c
> > @@ -56,8 +56,8 @@ static void pci_ipmi_bt_realize(PCIDevice *pd, Error
> **errp)
> >  {
> >      Error *err =3D NULL;
> >      PCIIPMIBTDevice *pik =3D PCI_IPMI_BT(pd);
> > -    IPMIInterface *ii =3D IPMI_INTERFACE(pd);
> > -    IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii);
> > +    IPMIInterfaceHost *ii =3D IPMI_INTERFACE_HOST(pd);
> > +    IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_GET_CLASS(ii);
> >
> >      if (!pik->bt.bmc) {
> >          error_setg(errp, "IPMI device requires a bmc attribute to be
> set");
> > @@ -66,7 +66,7 @@ static void pci_ipmi_bt_realize(PCIDevice *pd, Error
> **errp)
> >
> >      pik->uuid =3D ipmi_next_uuid();
> >
> > -    pik->bt.bmc->intf =3D ii;
> > +    IPMI_CORE(pik->bt.bmc)->intf =3D IPMI_INTERFACE(ii);
> >      pik->bt.opaque =3D pik;
> >
> >      pci_config_set_prog_interface(pd->config, 0x02); /* BT */
> > @@ -134,7 +134,7 @@ static const TypeInfo pci_ipmi_bt_info =3D {
> >      .instance_init =3D pci_ipmi_bt_instance_init,
> >      .class_init    =3D pci_ipmi_bt_class_init,
> >      .interfaces =3D (InterfaceInfo[]) {
> > -        { TYPE_IPMI_INTERFACE },
> > +        { TYPE_IPMI_INTERFACE_HOST },
> >          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> >          { }
> >      }
> > diff --git a/hw/ipmi/pci_ipmi_kcs.c b/hw/ipmi/pci_ipmi_kcs.c
> > index 1a581413c2..40f8da95af 100644
> > --- a/hw/ipmi/pci_ipmi_kcs.c
> > +++ b/hw/ipmi/pci_ipmi_kcs.c
> > @@ -56,8 +56,8 @@ static void pci_ipmi_kcs_realize(PCIDevice *pd, Error
> **errp)
> >  {
> >      Error *err =3D NULL;
> >      PCIIPMIKCSDevice *pik =3D PCI_IPMI_KCS(pd);
> > -    IPMIInterface *ii =3D IPMI_INTERFACE(pd);
> > -    IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii);
> > +    IPMIInterfaceHost *ii =3D IPMI_INTERFACE_HOST(pd);
> > +    IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_GET_CLASS(ii);
> >
> >      if (!pik->kcs.bmc) {
> >          error_setg(errp, "IPMI device requires a bmc attribute to be
> set");
> > @@ -66,7 +66,7 @@ static void pci_ipmi_kcs_realize(PCIDevice *pd, Error
> **errp)
> >
> >      pik->uuid =3D ipmi_next_uuid();
> >
> > -    pik->kcs.bmc->intf =3D ii;
> > +    IPMI_CORE(pik->kcs.bmc)->intf =3D IPMI_INTERFACE(ii);
> >      pik->kcs.opaque =3D pik;
> >
> >      pci_config_set_prog_interface(pd->config, 0x01); /* KCS */
> > @@ -134,7 +134,7 @@ static const TypeInfo pci_ipmi_kcs_info =3D {
> >      .instance_init =3D pci_ipmi_kcs_instance_init,
> >      .class_init    =3D pci_ipmi_kcs_class_init,
> >      .interfaces =3D (InterfaceInfo[]) {
> > -        { TYPE_IPMI_INTERFACE },
> > +        { TYPE_IPMI_INTERFACE_HOST },
> >          { INTERFACE_CONVENTIONAL_PCI_DEVICE },
> >          { }
> >      }
> > diff --git a/hw/ipmi/smbus_ipmi.c b/hw/ipmi/smbus_ipmi.c
> > index d0991ab7f9..f61b260f58 100644
> > --- a/hw/ipmi/smbus_ipmi.c
> > +++ b/hw/ipmi/smbus_ipmi.c
> > @@ -49,7 +49,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(SMBusIPMIDevice, SMBUS_IPM=
I)
> >  struct SMBusIPMIDevice {
> >      SMBusDevice parent;
> >
> > -    IPMIBmc *bmc;
> > +    IPMIBmcHost *bmc;
> >
> >      uint8_t outmsg[MAX_SSIF_IPMI_MSG_SIZE];
> >      uint32_t outlen;
> > @@ -71,7 +71,7 @@ struct SMBusIPMIDevice {
> >      uint32_t uuid;
> >  };
> >
> > -static void smbus_ipmi_handle_event(IPMIInterface *ii)
> > +static void smbus_ipmi_handle_event(IPMIInterfaceHost *ii)
> >  {
> >      /* No interrupts, so nothing to do here. */
> >  }
> > @@ -100,7 +100,7 @@ static void smbus_ipmi_set_atn(IPMIInterface *ii,
> int val, int irq)
> >      /* This is where PEC would go. */
> >  }
> >
> > -static void smbus_ipmi_set_irq_enable(IPMIInterface *ii, int val)
> > +static void smbus_ipmi_set_irq_enable(IPMIInterfaceHost *ii, int val)
> >  {
> >  }
> >
> > @@ -108,7 +108,7 @@ static void smbus_ipmi_send_msg(SMBusIPMIDevice *si=
d)
> >  {
> >      uint8_t *msg =3D sid->inmsg;
> >      uint32_t len =3D sid->inlen;
> > -    IPMIBmcClass *bk =3D IPMI_BMC_GET_CLASS(sid->bmc);
> > +    IPMICoreClass *ck =3D IPMI_CORE_GET_CLASS(sid->bmc);
> >
> >      sid->outlen =3D 0;
> >      sid->outpos =3D 0;
> > @@ -136,8 +136,8 @@ static void smbus_ipmi_send_msg(SMBusIPMIDevice *si=
d)
> >          return;
> >      }
> >
> > -    bk->handle_command(sid->bmc, sid->inmsg, sid->inlen,
> sizeof(sid->inmsg),
> > -                       sid->waiting_rsp);
> > +    ck->handle_command(IPMI_CORE(sid->bmc), sid->inmsg, sid->inlen,
> > +                       sizeof(sid->inmsg), sid->waiting_rsp);
> >  }
> >
> >  static uint8_t ipmi_receive_byte(SMBusDevice *dev)
> > @@ -326,7 +326,7 @@ static void smbus_ipmi_realize(DeviceState *dev,
> Error **errp)
> >
> >      sid->uuid =3D ipmi_next_uuid();
> >
> > -    sid->bmc->intf =3D ii;
> > +    IPMI_CORE(sid->bmc)->intf =3D ii;
> >  }
> >
> >  static void smbus_ipmi_init(Object *obj)
> > @@ -336,7 +336,8 @@ static void smbus_ipmi_init(Object *obj)
> >      ipmi_bmc_find_and_link(obj, (Object **) &sid->bmc);
> >  }
> >
> > -static void smbus_ipmi_get_fwinfo(struct IPMIInterface *ii, IPMIFwInfo
> *info)
> > +static void smbus_ipmi_get_fwinfo(struct IPMIInterfaceHost *ii,
> > +                                  IPMIFwInfo *info)
> >  {
> >      SMBusIPMIDevice *sid =3D SMBUS_IPMI(ii);
> >
> > @@ -354,7 +355,8 @@ static void smbus_ipmi_get_fwinfo(struct
> IPMIInterface *ii, IPMIFwInfo *info)
> >  static void smbus_ipmi_class_init(ObjectClass *oc, void *data)
> >  {
> >      DeviceClass *dc =3D DEVICE_CLASS(oc);
> > -    IPMIInterfaceClass *iic =3D IPMI_INTERFACE_CLASS(oc);
> > +    IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_CLASS(oc);
> > +    IPMIInterfaceClass *ic =3D IPMI_INTERFACE_CLASS(oc);
> >      SMBusDeviceClass *sc =3D SMBUS_DEVICE_CLASS(oc);
> >      AcpiDevAmlIfClass *adevc =3D ACPI_DEV_AML_IF_CLASS(oc);
> >
> > @@ -362,8 +364,8 @@ static void smbus_ipmi_class_init(ObjectClass *oc,
> void *data)
> >      sc->write_data =3D ipmi_write_data;
> >      dc->vmsd =3D &vmstate_smbus_ipmi;
> >      dc->realize =3D smbus_ipmi_realize;
> > -    iic->set_atn =3D smbus_ipmi_set_atn;
> > -    iic->handle_rsp =3D smbus_ipmi_handle_rsp;
> > +    ic->set_atn =3D smbus_ipmi_set_atn;
> > +    ic->handle_msg =3D smbus_ipmi_handle_rsp;
> >      iic->handle_if_event =3D smbus_ipmi_handle_event;
> >      iic->set_irq_enable =3D smbus_ipmi_set_irq_enable;
> >      iic->get_fwinfo =3D smbus_ipmi_get_fwinfo;
> > @@ -377,7 +379,7 @@ static const TypeInfo smbus_ipmi_info =3D {
> >      .instance_init =3D smbus_ipmi_init,
> >      .class_init    =3D smbus_ipmi_class_init,
> >      .interfaces =3D (InterfaceInfo[]) {
> > -        { TYPE_IPMI_INTERFACE },
> > +        { TYPE_IPMI_INTERFACE_HOST },
> >          { TYPE_ACPI_DEV_AML_IF },
> >          { }
> >      }
> > diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
> > index 11cb48af2f..a39cbdaa38 100644
> > --- a/hw/ppc/pnv.c
> > +++ b/hw/ppc/pnv.c
> > @@ -595,7 +595,7 @@ static void pnv_powerdown_notify(Notifier *n, void
> *opaque)
> >  static void pnv_reset(MachineState *machine, ShutdownCause reason)
> >  {
> >      PnvMachineState *pnv =3D PNV_MACHINE(machine);
> > -    IPMIBmc *bmc;
> > +    IPMIBmcHost *bmc;
> >      void *fdt;
> >
> >      qemu_devices_reset(reason);
> > @@ -746,7 +746,7 @@ static bool pnv_match_cpu(const char *default_type,
> const char *cpu_type)
> >      return ppc_default->pvr_match(ppc_default, ppc->pvr, false);
> >  }
> >
> > -static void pnv_ipmi_bt_init(ISABus *bus, IPMIBmc *bmc, uint32_t irq)
> > +static void pnv_ipmi_bt_init(ISABus *bus, IPMIBmcHost *bmc, uint32_t
> irq)
> >  {
> >      ISADevice *dev =3D isa_new("isa-ipmi-bt");
> >
> > diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c
> > index 99f1e8d7f9..6e8a6f545b 100644
> > --- a/hw/ppc/pnv_bmc.c
> > +++ b/hw/ppc/pnv_bmc.c
> > @@ -50,12 +50,12 @@ typedef struct OemSel {
> >  #define SOFT_OFF        0x00
> >  #define SOFT_REBOOT     0x01
> >
> > -static bool pnv_bmc_is_simulator(IPMIBmc *bmc)
> > +static bool pnv_bmc_is_simulator(IPMIBmcHost *bmc)
> >  {
> >      return object_dynamic_cast(OBJECT(bmc), TYPE_IPMI_BMC_SIMULATOR);
> >  }
> >
> > -static void pnv_gen_oem_sel(IPMIBmc *bmc, uint8_t reboot)
> > +static void pnv_gen_oem_sel(IPMIBmcHost *bmc, uint8_t reboot)
> >  {
> >      /* IPMI SEL Event are 16 bytes long */
> >      OemSel sel =3D {
> > @@ -71,12 +71,12 @@ static void pnv_gen_oem_sel(IPMIBmc *bmc, uint8_t
> reboot)
> >      ipmi_bmc_gen_event(bmc, (uint8_t *) &sel, 0 /* do not log the even=
t
> */);
> >  }
> >
> > -void pnv_bmc_powerdown(IPMIBmc *bmc)
> > +void pnv_bmc_powerdown(IPMIBmcHost *bmc)
> >  {
> >      pnv_gen_oem_sel(bmc, SOFT_OFF);
> >  }
> >
> > -void pnv_dt_bmc_sensors(IPMIBmc *bmc, void *fdt)
> > +void pnv_dt_bmc_sensors(IPMIBmcHost *bmc, void *fdt)
> >  {
> >      int offset;
> >      int i;
> > @@ -249,7 +249,7 @@ static const IPMINetfn hiomap_netfn =3D {
> >  };
> >
> >
> > -void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor)
> > +void pnv_bmc_set_pnor(IPMIBmcHost *bmc, PnvPnor *pnor)
> >  {
> >      if (!pnv_bmc_is_simulator(bmc)) {
> >          return;
> > @@ -267,15 +267,15 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor=
)
> >   * Instantiate the machine BMC. PowerNV uses the QEMU internal
> >   * simulator but it could also be external.
> >   */
> > -IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
> > +IPMIBmcHost *pnv_bmc_create(PnvPnor *pnor)
> >  {
> >      Object *obj;
> >
> >      obj =3D object_new(TYPE_IPMI_BMC_SIMULATOR);
> >      qdev_realize(DEVICE(obj), NULL, &error_fatal);
> > -    pnv_bmc_set_pnor(IPMI_BMC(obj), pnor);
> > +    pnv_bmc_set_pnor(IPMI_BMC_HOST(obj), pnor);
> >
> > -    return IPMI_BMC(obj);
> > +    return IPMI_BMC_HOST(obj);
> >  }
> >
> >  typedef struct ForeachArgs {
> > @@ -296,9 +296,9 @@ static int bmc_find(Object *child, void *opaque)
> >      return 0;
> >  }
> >
> > -IPMIBmc *pnv_bmc_find(Error **errp)
> > +IPMIBmcHost *pnv_bmc_find(Error **errp)
> >  {
> > -    ForeachArgs args =3D { TYPE_IPMI_BMC, NULL };
> > +    ForeachArgs args =3D { TYPE_IPMI_BMC_HOST, NULL };
> >      int ret;
> >
> >      ret =3D object_child_foreach_recursive(object_get_root(), bmc_find=
,
> &args);
> > @@ -308,5 +308,5 @@ IPMIBmc *pnv_bmc_find(Error **errp)
> >          return NULL;
> >      }
> >
> > -    return args.obj ? IPMI_BMC(args.obj) : NULL;
> > +    return args.obj ? IPMI_BMC_HOST(args.obj) : NULL;
> >  }
> > diff --git a/hw/smbios/smbios_type_38.c b/hw/smbios/smbios_type_38.c
> > index 168b886647..81a1cf09ea 100644
> > --- a/hw/smbios/smbios_type_38.c
> > +++ b/hw/smbios/smbios_type_38.c
> > @@ -83,16 +83,17 @@ static void smbios_add_ipmi_devices(BusState *bus)
> >
> >      QTAILQ_FOREACH(kid, &bus->children,  sibling) {
> >          DeviceState *dev =3D kid->child;
> > -        Object *obj =3D object_dynamic_cast(OBJECT(dev),
> TYPE_IPMI_INTERFACE);
> > +        Object *obj =3D object_dynamic_cast(OBJECT(dev),
> > +                                          TYPE_IPMI_INTERFACE_HOST);
> >          BusState *childbus;
> >
> >          if (obj) {
> > -            IPMIInterface *ii;
> > -            IPMIInterfaceClass *iic;
> > +            IPMIInterfaceHost *ii;
> > +            IPMIInterfaceHostClass *iic;
> >              IPMIFwInfo info;
> >
> > -            ii =3D IPMI_INTERFACE(obj);
> > -            iic =3D IPMI_INTERFACE_GET_CLASS(obj);
> > +            ii =3D IPMI_INTERFACE_HOST(obj);
> > +            iic =3D IPMI_INTERFACE_HOST_GET_CLASS(obj);
> >              memset(&info, 0, sizeof(info));
> >              if (!iic->get_fwinfo) {
> >                  continue;
> > diff --git a/include/hw/ipmi/ipmi.h b/include/hw/ipmi/ipmi.h
> > index 77a7213ed9..5ead2467f5 100644
> > --- a/include/hw/ipmi/ipmi.h
> > +++ b/include/hw/ipmi/ipmi.h
> > @@ -109,99 +109,156 @@ uint32_t ipmi_next_uuid(void);
> >   * and the BMC.
> >   */
> >  #define TYPE_IPMI_INTERFACE "ipmi-interface"
> > -#define IPMI_INTERFACE(obj) \
> > -     INTERFACE_CHECK(IPMIInterface, (obj), TYPE_IPMI_INTERFACE)
> > -typedef struct IPMIInterfaceClass IPMIInterfaceClass;
> > -DECLARE_CLASS_CHECKERS(IPMIInterfaceClass, IPMI_INTERFACE,
> > -                       TYPE_IPMI_INTERFACE)
> > +OBJECT_DECLARE_TYPE(IPMIInterface, IPMIInterfaceClass, IPMI_INTERFACE)
> >
> > +typedef struct IPMIInterfaceClass IPMIInterfaceClass;
> >  typedef struct IPMIInterface IPMIInterface;
> >
> >  struct IPMIInterfaceClass {
> >      InterfaceClass parent;
> >
> > +    /*
> > +     * The interfaces use this to perform certain ops
> > +     */
> > +    void (*set_atn)(struct IPMIInterface *s, int val, int irq);
> > +
> > +    /*
> > +     * Set by the owner to hold the backend data for the interface.
> > +     */
> > +    void *(*get_backend_data)(struct IPMIInterface *s);
> > +
> > +    /*
> > +     * Handle a message between the host and the BMC.
> > +     */
> > +    void (*handle_msg)(struct IPMIInterface *s, uint8_t msg_id,
> > +                       unsigned char *msg, unsigned int msg_len);
> > +};
> > +
> > +/*
> > + * An IPMI Interface representing host side communication to a
> > + * remote BMC, either simulated or an IPMI BMC client.
> > + */
> > +#define TYPE_IPMI_INTERFACE_HOST "ipmi-interface-host"
> > +OBJECT_DECLARE_TYPE(IPMIInterfaceHost, IPMIInterfaceHostClass, \
> > +                    IPMI_INTERFACE_HOST)
> > +
> > +typedef struct IPMIInterfaceHostClass IPMIInterfaceHostClass;
> > +typedef struct IPMIInterfaceHost IPMIInterfaceHost;
> > +
> > +struct IPMIInterfaceHostClass {
> > +    IPMIInterfaceClass parent;
> > +
> >      /*
> >       * min_size is the requested I/O size and must be a power of 2.
> >       * This is so PCI (or other busses) can request a bigger range.
> >       * Use 0 for the default.
> >       */
> > -    void (*init)(struct IPMIInterface *s, unsigned int min_size, Error
> **errp);
> > +    void (*init)(struct IPMIInterfaceHost *s, unsigned int min_size,
> > +                 Error **errp);
> >
> >      /*
> >       * Perform various operations on the hardware.  If checkonly is
> >       * true, it will return if the operation can be performed, but it
> >       * will not do the operation.
> >       */
> > -    int (*do_hw_op)(struct IPMIInterface *s, enum ipmi_op op, int
> checkonly);
> > +    int (*do_hw_op)(struct IPMIInterfaceHost *s, enum ipmi_op op,
> > +                    int checkonly);
> >
> >      /*
> >       * Enable/disable irqs on the interface when the BMC requests this=
.
> >       */
> > -    void (*set_irq_enable)(struct IPMIInterface *s, int val);
> > +    void (*set_irq_enable)(struct IPMIInterfaceHost *s, int val);
> >
> >      /*
> >       * Handle an event that occurred on the interface, generally the.
> >       * target writing to a register.
> >       */
> > -    void (*handle_if_event)(struct IPMIInterface *s);
> > -
> > -    /*
> > -     * The interfaces use this to perform certain ops
> > -     */
> > -    void (*set_atn)(struct IPMIInterface *s, int val, int irq);
> > +    void (*handle_if_event)(struct IPMIInterfaceHost *s);
> >
> >      /*
> >       * Got an IPMI warm/cold reset.
> >       */
> > -    void (*reset)(struct IPMIInterface *s, bool is_cold);
> > +    void (*reset)(struct IPMIInterfaceHost *s, bool is_cold);
> >
> >      /*
> > -     * Handle a response from the bmc.
> > +     * Return the firmware info for a device.
> >       */
> > -    void (*handle_rsp)(struct IPMIInterface *s, uint8_t msg_id,
> > -                       unsigned char *rsp, unsigned int rsp_len);
> > +    void (*get_fwinfo)(struct IPMIInterfaceHost *s, IPMIFwInfo *info);
> > +};
> >
> > -    /*
> > -     * Set by the owner to hold the backend data for the interface.
> > -     */
> > -    void *(*get_backend_data)(struct IPMIInterface *s);
> > +/*
> > + * An IPMI Interface representing BMC side communication to a
> > + * remote host running `ipmi-bmc-extern`.
> > + */
> > +#define TYPE_IPMI_INTERFACE_CLIENT "ipmi-interface-client"
> > +OBJECT_DECLARE_TYPE(IPMIInterfaceClient, IPMIInterfaceClientClass,
> > +                    IPMI_INTERFACE_CLIENT)
> >
> > -    /*
> > -     * Return the firmware info for a device.
> > -     */
> > -    void (*get_fwinfo)(struct IPMIInterface *s, IPMIFwInfo *info);
> > +typedef struct IPMIInterfaceClientClass IPMIInterfaceClientClass;
> > +typedef struct IPMIInterfaceClient IPMIInterfaceClient;
> > +
> > +struct IPMIInterfaceClientClass {
> > +    IPMIInterfaceClass parent;
> >  };
> >
> >  /*
> > - * Define a BMC simulator (or perhaps a connection to a real BMC)
> > + * Define an IPMI core (Either BMC or Host simulator.)
> >   */
> > -#define TYPE_IPMI_BMC "ipmi-bmc"
> > -OBJECT_DECLARE_TYPE(IPMIBmc, IPMIBmcClass,
> > -                    IPMI_BMC)
> > +#define TYPE_IPMI_CORE "ipmi-core"
> > +OBJECT_DECLARE_TYPE(IPMICore, IPMICoreClass, IPMI_CORE)
> >
> > -struct IPMIBmc {
> > +struct IPMICore {
> >      DeviceState parent;
> >
> > -    uint8_t slave_addr;
> > -
> >      IPMIInterface *intf;
> >  };
> >
> > -struct IPMIBmcClass {
> > +struct IPMICoreClass {
> >      DeviceClass parent;
> >
> > -    /* Called when the system resets to report to the bmc. */
> > -    void (*handle_reset)(struct IPMIBmc *s);
> > +    /*
> > +     * Handle a hardware command.
> > +     */
> > +    void (*handle_hw_op)(struct IPMICore *s, uint8_t hw_op, uint8_t
> operand);
> >
> >      /*
> >       * Handle a command to the bmc.
> >       */
> > -    void (*handle_command)(struct IPMIBmc *s,
> > +    void (*handle_command)(struct IPMICore *s,
> >                             uint8_t *cmd, unsigned int cmd_len,
> >                             unsigned int max_cmd_len,
> >                             uint8_t msg_id);
> >  };
> >
> > +/*
> > + * Define a BMC simulator (or perhaps a connection to a real BMC)
> > + */
> > +#define TYPE_IPMI_BMC_HOST "ipmi-bmc-host"
> > +OBJECT_DECLARE_TYPE(IPMIBmcHost, IPMIBmcHostClass, IPMI_BMC_HOST)
> > +
> > +struct IPMIBmcHost {
> > +    IPMICore parent;
> > +
> > +    uint8_t slave_addr;
> > +};
> > +
> > +struct IPMIBmcHostClass {
> > +    IPMICoreClass parent;
> > +
> > +    /* Called when the system resets to report to the bmc. */
> > +    void (*handle_reset)(struct IPMIBmcHost *s);
> > +
> > +};
> > +
> > +/*
> > + * Define a BMC side client that responds to an `ipmi-bmc-extern`.
> > + */
> > +#define TYPE_IPMI_BMC_CLIENT "ipmi-bmc-client"
> > +OBJECT_DECLARE_SIMPLE_TYPE(IPMIBmcClient, IPMI_BMC_CLIENT)
> > +struct IPMIBmcClient {
> > +    IPMICore parent;
> > +};
> > +
> >  /*
> >   * Add a link property to obj that points to a BMC.
> >   */
> > @@ -259,9 +316,9 @@ struct ipmi_sdr_compact {
> >
> >  typedef uint8_t ipmi_sdr_compact_buffer[sizeof(struct
> ipmi_sdr_compact)];
> >
> > -int ipmi_bmc_sdr_find(IPMIBmc *b, uint16_t recid,
> > +int ipmi_bmc_sdr_find(IPMIBmcHost *b, uint16_t recid,
> >                        const struct ipmi_sdr_compact **sdr, uint16_t
> *nextrec);
> > -void ipmi_bmc_gen_event(IPMIBmc *b, uint8_t *evt, bool log);
> > +void ipmi_bmc_gen_event(IPMIBmcHost *b, uint8_t *evt, bool log);
> >
> >  #define TYPE_IPMI_BMC_SIMULATOR "ipmi-bmc-sim"
> >  OBJECT_DECLARE_SIMPLE_TYPE(IPMIBmcSim, IPMI_BMC_SIMULATOR)
> > diff --git a/include/hw/ipmi/ipmi_bt.h b/include/hw/ipmi/ipmi_bt.h
> > index 8a4316ea7c..237dbb4599 100644
> > --- a/include/hw/ipmi/ipmi_bt.h
> > +++ b/include/hw/ipmi/ipmi_bt.h
> > @@ -28,7 +28,7 @@
> >  #include "hw/ipmi/ipmi.h"
> >
> >  typedef struct IPMIBT {
> > -    IPMIBmc *bmc;
> > +    IPMIBmcHost *bmc;
> >
> >      bool do_wake;
> >
> > diff --git a/include/hw/ipmi/ipmi_kcs.h b/include/hw/ipmi/ipmi_kcs.h
> > index 6e6ef4c539..1f491b7243 100644
> > --- a/include/hw/ipmi/ipmi_kcs.h
> > +++ b/include/hw/ipmi/ipmi_kcs.h
> > @@ -28,7 +28,7 @@
> >  #include "hw/ipmi/ipmi.h"
> >
> >  typedef struct IPMIKCS {
> > -    IPMIBmc *bmc;
> > +    IPMIBmcHost *bmc;
> >
> >      bool do_wake;
> >
> > diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h
> > index 409f3bf763..b712a7e8d5 100644
> > --- a/include/hw/ppc/pnv.h
> > +++ b/include/hw/ppc/pnv.h
> > @@ -91,7 +91,7 @@ struct PnvMachineState {
> >      ISABus       *isa_bus;
> >      uint32_t     cpld_irqstate;
> >
> > -    IPMIBmc      *bmc;
> > +    IPMIBmcHost  *bmc;
> >      Notifier     powerdown_notifier;
> >
> >      PnvPnor      *pnor;
> > @@ -108,11 +108,11 @@ PnvChip *pnv_chip_add_phb(PnvChip *chip, PnvPHB
> *phb);
> >  /*
> >   * BMC helpers
> >   */
> > -void pnv_dt_bmc_sensors(IPMIBmc *bmc, void *fdt);
> > -void pnv_bmc_powerdown(IPMIBmc *bmc);
> > -IPMIBmc *pnv_bmc_create(PnvPnor *pnor);
> > -IPMIBmc *pnv_bmc_find(Error **errp);
> > -void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor);
> > +void pnv_dt_bmc_sensors(IPMIBmcHost *bmc, void *fdt);
> > +void pnv_bmc_powerdown(IPMIBmcHost *bmc);
> > +IPMIBmcHost *pnv_bmc_create(PnvPnor *pnor);
> > +IPMIBmcHost *pnv_bmc_find(Error **errp);
> > +void pnv_bmc_set_pnor(IPMIBmcHost *bmc, PnvPnor *pnor);
> >
> >  /*
> >   * POWER8 MMIO base addresses
> > --
> > 2.40.0.348.gf938b09366-goog
> >
>

--000000000000fbb27c05f7e4cbae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks, I think breaking them up makes sense but it might =
take a while since it takes some effort to make each one pass. I could do i=
t in a few weeks and send another patch out with=C2=A0 the breakup.</div><b=
r><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, =
Mar 25, 2023 at 4:51=E2=80=AFPM Corey Minyard &lt;<a href=3D"mailto:minyard=
@acm.org">minyard@acm.org</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Fri, Mar 24, 2023 at 04:09:01PM -0700, Hao Wu w=
rote:<br>
&gt; This patch refactors the IPMI interface so that it can be used by both=
<br>
&gt; the BMC side and core-side simulation.<br>
<br>
This patch is hard to review because it does so many different things<br>
and they are all mixed up.=C2=A0 It looks ok, but it&#39;s hard to tell.=C2=
=A0 I know<br>
it&#39;s a pain (I&#39;ve done it many times) but can you split this up int=
o<br>
separate patches that each make one change?=C2=A0 The list you have below<b=
r>
tells me that 5 patches might be appropriate.<br>
<br>
If I really had to a full review this myself I would break it into<br>
multiple patches just to review it.=C2=A0 But that should really be your jo=
b.<br>
<br>
Thanks,<br>
<br>
-corey<br>
<br>
&gt; <br>
&gt; Detail changes:<br>
&gt; (1) Split IPMIInterface into IPMIInterfaceHost (for host side<br>
&gt;=C2=A0 =C2=A0 =C2=A0simulation) and IPMIInterfaceClient (for BMC side s=
imulation).<br>
&gt; (2) rename handle_rsp -&gt; handle_msg so the name fits both BMC side =
and<br>
&gt;=C2=A0 =C2=A0 =C2=A0Core side.<br>
&gt; (3) Add a new class IPMICore. This class represents a simulator/extern=
al<br>
&gt;=C2=A0 =C2=A0 =C2=A0connection for both BMC and Core side emulation.<br=
>
&gt; (4) Change the original IPMIBmc to IPMIBmcHost, representing host side=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0simulation.<br>
&gt; (5) Add a new type IPMIBmcClient representing BMC side simulation.<br>
&gt; (6) Appy the changes to=C2=A0 the entire IPMI library.<br>
&gt; <br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/acpi/ipmi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 hw/ipmi/ipmi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 60 +++++++++++++----<br>
&gt;=C2=A0 hw/ipmi/ipmi_bmc_extern.c=C2=A0 |=C2=A0 67 ++++++++++--------<br=
>
&gt;=C2=A0 hw/ipmi/ipmi_bmc_sim.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 78 +++++++++++=
+---------<br>
&gt;=C2=A0 hw/ipmi/ipmi_bt.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 33 +=
++++----<br>
&gt;=C2=A0 hw/ipmi/ipmi_kcs.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 31 +=
++++----<br>
&gt;=C2=A0 hw/ipmi/isa_ipmi_bt.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 18 ++---<br>
&gt;=C2=A0 hw/ipmi/isa_ipmi_kcs.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 13 ++--<br>
&gt;=C2=A0 hw/ipmi/pci_ipmi_bt.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A08 +--<br=
>
&gt;=C2=A0 hw/ipmi/pci_ipmi_kcs.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +--<br=
>
&gt;=C2=A0 hw/ipmi/smbus_ipmi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 26 +++---=
-<br>
&gt;=C2=A0 hw/ppc/pnv.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 hw/ppc/pnv_bmc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0=
 22 +++---<br>
&gt;=C2=A0 hw/smbios/smbios_type_38.c |=C2=A0 11 +--<br>
&gt;=C2=A0 include/hw/ipmi/ipmi.h=C2=A0 =C2=A0 =C2=A0| 135 ++++++++++++++++=
++++++++++-----------<br>
&gt;=C2=A0 include/hw/ipmi/ipmi_bt.h=C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 include/hw/ipmi/ipmi_kcs.h |=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 include/hw/ppc/pnv.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 12 ++--<b=
r>
&gt;=C2=A0 18 files changed, 332 insertions(+), 202 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/acpi/ipmi.c b/hw/acpi/ipmi.c<br>
&gt; index a20e57d465..e6d2cd790b 100644<br>
&gt; --- a/hw/acpi/ipmi.c<br>
&gt; +++ b/hw/acpi/ipmi.c<br>
&gt; @@ -66,8 +66,8 @@ void build_ipmi_dev_aml(AcpiDevAmlIf *adev, Aml *sco=
pe)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Aml *dev;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIFwInfo info =3D {};<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *ii =3D IPMI_INTERFACE(adev);<br>
&gt; -=C2=A0 =C2=A0 IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii=
);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHost *ii =3D IPMI_INTERFACE_HOST(adev);<br=
>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_GET=
_CLASS(ii);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint16_t version;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 iic-&gt;get_fwinfo(ii, &amp;info);<br>
&gt; diff --git a/hw/ipmi/ipmi.c b/hw/ipmi/ipmi.c<br>
&gt; index bbb07b151e..1be923ffb8 100644<br>
&gt; --- a/hw/ipmi/ipmi.c<br>
&gt; +++ b/hw/ipmi/ipmi.c<br>
&gt; @@ -38,7 +38,7 @@ uint32_t ipmi_next_uuid(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ipmi_current_uuid++;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static int ipmi_do_hw_op(IPMIInterface *s, enum ipmi_op op, int check=
only)<br>
&gt; +static int ipmi_do_hw_op(IPMIInterfaceHost *s, enum ipmi_op op, int c=
heckonly)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 switch (op) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case IPMI_RESET_CHASSIS:<br>
&gt; @@ -78,9 +78,9 @@ static int ipmi_do_hw_op(IPMIInterface *s, enum ipmi=
_op op, int checkonly)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void ipmi_interface_class_init(ObjectClass *class, void *data)=
<br>
&gt; +static void ipmi_interface_host_class_init(ObjectClass *class, void *=
data)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 IPMIInterfaceClass *ik =3D IPMI_INTERFACE_CLASS(class);=
<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *ik =3D IPMI_INTERFACE_HOST_CLAS=
S(class);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ik-&gt;do_hw_op =3D ipmi_do_hw_op;<br>
&gt;=C2=A0 }<br>
&gt; @@ -89,27 +89,48 @@ static const TypeInfo ipmi_interface_type_info =3D=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .name =3D TYPE_IPMI_INTERFACE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .parent =3D TYPE_INTERFACE,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .class_size =3D sizeof(IPMIInterfaceClass),<br>
&gt; -=C2=A0 =C2=A0 .class_init =3D ipmi_interface_class_init,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const TypeInfo ipmi_interface_host_type_info =3D {<br>
&gt; +=C2=A0 =C2=A0 .name =3D TYPE_IPMI_INTERFACE_HOST,<br>
&gt; +=C2=A0 =C2=A0 .parent =3D TYPE_IPMI_INTERFACE,<br>
&gt; +=C2=A0 =C2=A0 .class_size =3D sizeof(IPMIInterfaceHostClass),<br>
&gt; +=C2=A0 =C2=A0 .class_init =3D ipmi_interface_host_class_init,<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const TypeInfo ipmi_interface_client_type_info =3D {<br>
&gt; +=C2=A0 =C2=A0 .name =3D TYPE_IPMI_INTERFACE_CLIENT,<br>
&gt; +=C2=A0 =C2=A0 .parent =3D TYPE_IPMI_INTERFACE,<br>
&gt; +=C2=A0 =C2=A0 .class_size =3D sizeof(IPMIInterfaceClientClass),<br>
&gt; +};<br>
&gt; +<br>
&gt; +static const TypeInfo ipmi_core_type_info =3D {<br>
&gt; +=C2=A0 =C2=A0 .name =3D TYPE_IPMI_CORE,<br>
&gt; +=C2=A0 =C2=A0 .parent =3D TYPE_DEVICE,<br>
&gt; +=C2=A0 =C2=A0 .instance_size =3D sizeof(IPMICore),<br>
&gt; +=C2=A0 =C2=A0 .class_size =3D sizeof(IPMICoreClass),<br>
&gt; +=C2=A0 =C2=A0 .abstract =3D true,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void isa_ipmi_bmc_check(const Object *obj, const char *na=
me,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Object *val, Error **errp)<=
br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 IPMIBmc *bmc =3D IPMI_BMC(val);<br>
&gt; +=C2=A0 =C2=A0 IPMICore *ic =3D IPMI_CORE(val);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 if (bmc-&gt;intf)<br>
&gt; +=C2=A0 =C2=A0 if (ic-&gt;intf) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;BMC object is=
 already in use&quot;);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 void ipmi_bmc_find_and_link(Object *obj, Object **bmc)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 object_property_add_link(obj, &quot;bmc&quot;, TYPE_IPM=
I_BMC, bmc,<br>
&gt; +=C2=A0 =C2=A0 object_property_add_link(obj, &quot;bmc&quot;, TYPE_IPM=
I_BMC_HOST, bmc,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0isa_ipmi_bmc_check,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0OBJ_PROP_LINK_STRONG);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static Property ipmi_bmc_properties[] =3D {<br>
&gt; -=C2=A0 =C2=A0 DEFINE_PROP_UINT8(&quot;slave_addr&quot;,=C2=A0 IPMIBmc=
, slave_addr, 0x20),<br>
&gt; +=C2=A0 =C2=A0 DEFINE_PROP_UINT8(&quot;slave_addr&quot;,=C2=A0 IPMIBmc=
Host, slave_addr, 0x20),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; @@ -120,19 +141,30 @@ static void bmc_class_init(ObjectClass *oc, void=
 *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 device_class_set_props(dc, ipmi_bmc_properties);<b=
r>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static const TypeInfo ipmi_bmc_type_info =3D {<br>
&gt; -=C2=A0 =C2=A0 .name =3D TYPE_IPMI_BMC,<br>
&gt; -=C2=A0 =C2=A0 .parent =3D TYPE_DEVICE,<br>
&gt; -=C2=A0 =C2=A0 .instance_size =3D sizeof(IPMIBmc),<br>
&gt; +static const TypeInfo ipmi_bmc_host_type_info =3D {<br>
&gt; +=C2=A0 =C2=A0 .name =3D TYPE_IPMI_BMC_HOST,<br>
&gt; +=C2=A0 =C2=A0 .parent =3D TYPE_IPMI_CORE,<br>
&gt; +=C2=A0 =C2=A0 .instance_size =3D sizeof(IPMIBmcHost),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .abstract =3D true,<br>
&gt; -=C2=A0 =C2=A0 .class_size =3D sizeof(IPMIBmcClass),<br>
&gt; +=C2=A0 =C2=A0 .class_size =3D sizeof(IPMIBmcHostClass),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .class_init =3D bmc_class_init,<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +static const TypeInfo ipmi_bmc_client_type_info =3D {<br>
&gt; +=C2=A0 =C2=A0 .name =3D TYPE_IPMI_BMC_CLIENT,<br>
&gt; +=C2=A0 =C2=A0 .parent =3D TYPE_IPMI_CORE,<br>
&gt; +=C2=A0 =C2=A0 .instance_size =3D sizeof(IPMIBmcClient),<br>
&gt; +=C2=A0 =C2=A0 .abstract =3D true,<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 static void ipmi_register_types(void)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 type_register_static(&amp;ipmi_interface_type_info=
);<br>
&gt; -=C2=A0 =C2=A0 type_register_static(&amp;ipmi_bmc_type_info);<br>
&gt; +=C2=A0 =C2=A0 type_register_static(&amp;ipmi_interface_host_type_info=
);<br>
&gt; +=C2=A0 =C2=A0 type_register_static(&amp;ipmi_interface_client_type_in=
fo);<br>
&gt; +=C2=A0 =C2=A0 type_register_static(&amp;ipmi_core_type_info);<br>
&gt; +=C2=A0 =C2=A0 type_register_static(&amp;ipmi_bmc_host_type_info);<br>
&gt; +=C2=A0 =C2=A0 type_register_static(&amp;ipmi_bmc_client_type_info);<b=
r>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 type_init(ipmi_register_types)<br>
&gt; diff --git a/hw/ipmi/ipmi_bmc_extern.c b/hw/ipmi/ipmi_bmc_extern.c<br>
&gt; index acf2bab35f..67f6a5d829 100644<br>
&gt; --- a/hw/ipmi/ipmi_bmc_extern.c<br>
&gt; +++ b/hw/ipmi/ipmi_bmc_extern.c<br>
&gt; @@ -65,7 +65,7 @@<br>
&gt;=C2=A0 #define TYPE_IPMI_BMC_EXTERN &quot;ipmi-bmc-extern&quot;<br>
&gt;=C2=A0 OBJECT_DECLARE_SIMPLE_TYPE(IPMIBmcExtern, IPMI_BMC_EXTERN)<br>
&gt;=C2=A0 struct IPMIBmcExtern {<br>
&gt; -=C2=A0 =C2=A0 IPMIBmc parent;<br>
&gt; +=C2=A0 =C2=A0 IPMIBmcHost parent;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 CharBackend chr;<br>
&gt;=C2=A0 <br>
&gt; @@ -147,8 +147,9 @@ static void continue_send(IPMIBmcExtern *ibe)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void extern_timeout(void *opaque)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 IPMICore *ic =3D opaque;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIBmcExtern *ibe =3D opaque;<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *s =3D ibe-&gt;parent.intf;<br>
&gt; +=C2=A0 =C2=A0 IPMIInterface *s =3D ic-&gt;intf;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ibe-&gt;connected) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ibe-&gt;waiting_rsp &amp;&amp; (=
ibe-&gt;outlen =3D=3D 0)) {<br>
&gt; @@ -158,7 +159,7 @@ static void extern_timeout(void *opaque)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibe-&gt;inbuf[1] =3D i=
be-&gt;outbuf[1] | 0x04;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibe-&gt;inbuf[2] =3D i=
be-&gt;outbuf[2];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibe-&gt;inbuf[3] =3D I=
PMI_CC_TIMEOUT;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k-&gt;handle_rsp(s, ibe-&gt=
;outbuf[0], ibe-&gt;inbuf + 1, 3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k-&gt;handle_msg(s, ibe-&gt=
;outbuf[0], ibe-&gt;inbuf + 1, 3);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue_send(ibe);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -181,13 +182,13 @@ static void addchar(IPMIBmcExtern *ibe, unsigned=
 char ch)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void ipmi_bmc_extern_handle_command(IPMIBmc *b,<br>
&gt; +static void ipmi_bmc_extern_handle_command(IPMICore *ic,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0uint8_t *cmd, unsigned int cmd_len,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0unsigned int max_cmd_len,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0uint8_t msg_id)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 IPMIBmcExtern *ibe =3D IPMI_BMC_EXTERN(b);<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *s =3D ibe-&gt;parent.intf;<br>
&gt; +=C2=A0 =C2=A0 IPMIBmcExtern *ibe =3D IPMI_BMC_EXTERN(ic);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterface *s =3D ic-&gt;intf;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint8_t err =3D 0, csum;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned int i;<br>
&gt;=C2=A0 <br>
&gt; @@ -213,7 +214,7 @@ static void ipmi_bmc_extern_handle_command(IPMIBmc=
 *b,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rsp[1] =3D cmd[1];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rsp[2] =3D err;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibe-&gt;waiting_rsp =3D false;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 k-&gt;handle_rsp(s, msg_id, rsp, 3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 k-&gt;handle_msg(s, msg_id, rsp, 3);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -236,8 +237,11 @@ static void ipmi_bmc_extern_handle_command(IPMIBm=
c *b,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void handle_hw_op(IPMIBmcExtern *ibe, unsigned char hw_op=
)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *s =3D ibe-&gt;parent.intf;<br>
&gt; +=C2=A0 =C2=A0 IPMICore *ic =3D IPMI_CORE(ibe);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterface *s =3D ic-&gt;intf;<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHost *hs =3D IPMI_INTERFACE_HOST(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS=
(s);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *hk =3D IPMI_INTERFACE_HOST_GET_=
CLASS(s);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 switch (hw_op) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VM_CMD_VERSION:<br>
&gt; @@ -257,34 +261,36 @@ static void handle_hw_op(IPMIBmcExtern *ibe, uns=
igned char hw_op)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VM_CMD_POWEROFF:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 k-&gt;do_hw_op(s, IPMI_POWEROFF_CHASSIS, =
0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hk-&gt;do_hw_op(hs, IPMI_POWEROFF_CHASSIS=
, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VM_CMD_RESET:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 k-&gt;do_hw_op(s, IPMI_RESET_CHASSIS, 0);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hk-&gt;do_hw_op(hs, IPMI_RESET_CHASSIS, 0=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VM_CMD_ENABLE_IRQ:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 k-&gt;set_irq_enable(s, 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hk-&gt;set_irq_enable(hs, 1);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VM_CMD_DISABLE_IRQ:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 k-&gt;set_irq_enable(s, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hk-&gt;set_irq_enable(hs, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VM_CMD_SEND_NMI:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 k-&gt;do_hw_op(s, IPMI_SEND_NMI, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hk-&gt;do_hw_op(hs, IPMI_SEND_NMI, 0);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 case VM_CMD_GRACEFUL_SHUTDOWN:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 k-&gt;do_hw_op(s, IPMI_SHUTDOWN_VIA_ACPI_=
OVERTEMP, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hk-&gt;do_hw_op(hs, IPMI_SHUTDOWN_VIA_ACP=
I_OVERTEMP, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void handle_msg(IPMIBmcExtern *ibe)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(ibe-=
&gt;parent.intf);<br>
&gt; +=C2=A0 =C2=A0 IPMICore *ic =3D IPMI_CORE(ibe);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterface *s =3D ic-&gt;intf;<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ibe-&gt;in_escape) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ipmi_debug(&quot;msg escape not ende=
d\n&quot;);<br>
&gt; @@ -306,7 +312,7 @@ static void handle_msg(IPMIBmcExtern *ibe)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 timer_del(ibe-&gt;extern_timer);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ibe-&gt;waiting_rsp =3D false;<br>
&gt; -=C2=A0 =C2=A0 k-&gt;handle_rsp(ibe-&gt;parent.intf, ibe-&gt;inbuf[0],=
 ibe-&gt;inbuf + 1, ibe-&gt;inpos - 1);<br>
&gt; +=C2=A0 =C2=A0 k-&gt;handle_msg(s, ibe-&gt;inbuf[0], ibe-&gt;inbuf + 1=
, ibe-&gt;inpos - 1);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static int can_receive(void *opaque)<br>
&gt; @@ -382,9 +388,12 @@ static void receive(void *opaque, const uint8_t *=
buf, int size)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void chr_event(void *opaque, QEMUChrEvent event)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 IPMICore *ic =3D opaque;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIBmcExtern *ibe =3D opaque;<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *s =3D ibe-&gt;parent.intf;<br>
&gt; +=C2=A0 =C2=A0 IPMIInterface *s =3D ic-&gt;intf;<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHost *hs =3D IPMI_INTERFACE_HOST(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS=
(s);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *hk =3D IPMI_INTERFACE_HOST_GET_=
CLASS(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned char v;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 switch (event) {<br>
&gt; @@ -398,17 +407,17 @@ static void chr_event(void *opaque, QEMUChrEvent=
 event)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibe-&gt;outlen++;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addchar(ibe, VM_CMD_CAPABILITIES);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v =3D VM_CAPABILITIES_IRQ | VM_CAPAB=
ILITIES_ATTN;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (k-&gt;do_hw_op(ibe-&gt;parent.intf, I=
PMI_POWEROFF_CHASSIS, 1) =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hk-&gt;do_hw_op(hs, IPMI_POWEROFF_CHA=
SSIS, 1) =3D=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v |=3D VM_CAPABILITIES=
_POWER;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (k-&gt;do_hw_op(ibe-&gt;parent.intf, I=
PMI_SHUTDOWN_VIA_ACPI_OVERTEMP, 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hk-&gt;do_hw_op(hs, IPMI_SHUTDOWN_VIA=
_ACPI_OVERTEMP, 1)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v |=3D VM_CAPABILITIES=
_GRACEFUL_SHUTDOWN;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (k-&gt;do_hw_op(ibe-&gt;parent.intf, I=
PMI_RESET_CHASSIS, 1) =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hk-&gt;do_hw_op(hs, IPMI_RESET_CHASSI=
S, 1) =3D=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v |=3D VM_CAPABILITIES=
_RESET;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (k-&gt;do_hw_op(ibe-&gt;parent.intf, I=
PMI_SEND_NMI, 1) =3D=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (hk-&gt;do_hw_op(hs, IPMI_SEND_NMI, 1)=
 =3D=3D 0) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 v |=3D VM_CAPABILITIES=
_NMI;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 addchar(ibe, v);<br>
&gt; @@ -433,7 +442,7 @@ static void chr_event(void *opaque, QEMUChrEvent e=
vent)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibe-&gt;inbuf[1] =3D i=
be-&gt;outbuf[1] | 0x04;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibe-&gt;inbuf[2] =3D i=
be-&gt;outbuf[2];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibe-&gt;inbuf[3] =3D I=
PMI_CC_BMC_INIT_IN_PROGRESS;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k-&gt;handle_rsp(s, ibe-&gt=
;outbuf[0], ibe-&gt;inbuf + 1, 3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k-&gt;handle_msg(s, ibe-&gt=
;outbuf[0], ibe-&gt;inbuf + 1, 3);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 <br>
&gt; @@ -445,7 +454,7 @@ static void chr_event(void *opaque, QEMUChrEvent e=
vent)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void ipmi_bmc_extern_handle_reset(IPMIBmc *b)<br>
&gt; +static void ipmi_bmc_extern_handle_reset(IPMIBmcHost *b)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIBmcExtern *ibe =3D IPMI_BMC_EXTERN(b);<br>
&gt;=C2=A0 <br>
&gt; @@ -475,14 +484,15 @@ static int ipmi_bmc_extern_post_migrate(void *op=
aque, int version_id)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* error on the interface if a response was b=
eing waited for.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ibe-&gt;waiting_rsp) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMIInterface *ii =3D ibe-&gt;parent.intf=
;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMICore *ic =3D opaque;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMIInterface *ii =3D ic-&gt;intf;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMIInterfaceClass *iic =3D IPMI_INT=
ERFACE_GET_CLASS(ii);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibe-&gt;waiting_rsp =3D false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibe-&gt;inbuf[1] =3D ibe-&gt;outbuf[=
1] | 0x04;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibe-&gt;inbuf[2] =3D ibe-&gt;outbuf[=
2];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibe-&gt;inbuf[3] =3D IPMI_CC_BMC_INI=
T_IN_PROGRESS;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 iic-&gt;handle_rsp(ii, ibe-&gt;outbuf[0],=
 ibe-&gt;inbuf + 1, 3);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iic-&gt;handle_msg(ii, ibe-&gt;outbuf[0],=
 ibe-&gt;inbuf + 1, 3);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 }<br>
&gt; @@ -522,9 +532,10 @@ static Property ipmi_bmc_extern_properties[] =3D =
{<br>
&gt;=C2=A0 static void ipmi_bmc_extern_class_init(ObjectClass *oc, void *da=
ta)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(oc);<br>
&gt; -=C2=A0 =C2=A0 IPMIBmcClass *bk =3D IPMI_BMC_CLASS(oc);<br>
&gt; +=C2=A0 =C2=A0 IPMICoreClass *ck =3D IPMI_CORE_CLASS(oc);<br>
&gt; +=C2=A0 =C2=A0 IPMIBmcHostClass *bk =3D IPMI_BMC_HOST_CLASS(oc);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 bk-&gt;handle_command =3D ipmi_bmc_extern_handle_comman=
d;<br>
&gt; +=C2=A0 =C2=A0 ck-&gt;handle_command =3D ipmi_bmc_extern_handle_comman=
d;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bk-&gt;handle_reset =3D ipmi_bmc_extern_handle_res=
et;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dc-&gt;hotpluggable =3D false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dc-&gt;realize =3D ipmi_bmc_extern_realize;<br>
&gt; @@ -533,7 +544,7 @@ static void ipmi_bmc_extern_class_init(ObjectClass=
 *oc, void *data)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const TypeInfo ipmi_bmc_extern_type =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_I=
PMI_BMC_EXTERN,<br>
&gt; -=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_IPMI_BMC,<b=
r>
&gt; +=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_IPMI_BMC_HO=
ST,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .instance_size =3D sizeof(IPMIBmcExtern),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .instance_init =3D ipmi_bmc_extern_init,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .instance_finalize =3D ipmi_bmc_extern_finalize,<b=
r>
&gt; diff --git a/hw/ipmi/ipmi_bmc_sim.c b/hw/ipmi/ipmi_bmc_sim.c<br>
&gt; index 905e091094..6296e5cfed 100644<br>
&gt; --- a/hw/ipmi/ipmi_bmc_sim.c<br>
&gt; +++ b/hw/ipmi/ipmi_bmc_sim.c<br>
&gt; @@ -178,7 +178,7 @@ typedef struct IPMIRcvBufEntry {<br>
&gt;=C2=A0 } IPMIRcvBufEntry;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct IPMIBmcSim {<br>
&gt; -=C2=A0 =C2=A0 IPMIBmc parent;<br>
&gt; +=C2=A0 =C2=A0 IPMIBmcHost parent;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 QEMUTimer *timer;<br>
&gt;=C2=A0 <br>
&gt; @@ -384,7 +384,7 @@ static int sdr_find_entry(IPMISdr *sdr, uint16_t r=
ecid,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -int ipmi_bmc_sdr_find(IPMIBmc *b, uint16_t recid,<br>
&gt; +int ipmi_bmc_sdr_find(IPMIBmcHost *b, uint16_t recid,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const struct ipmi_sdr_compact **sdr, uint16_t *nextrec)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 {<br>
&gt; @@ -448,10 +448,11 @@ static int attn_irq_enabled(IPMIBmcSim *ibs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMI_BMC_MSG_FLAG_EVT_=
BUF_FULL_SET(ibs));<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -void ipmi_bmc_gen_event(IPMIBmc *b, uint8_t *evt, bool log)<br>
&gt; +void ipmi_bmc_gen_event(IPMIBmcHost *b, uint8_t *evt, bool log)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIBmcSim *ibs =3D IPMI_BMC_SIMULATOR(b);<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *s =3D ibs-&gt;parent.intf;<br>
&gt; +=C2=A0 =C2=A0 IPMICore *ic =3D IPMI_CORE(ibs);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterface *s =3D ic-&gt;intf;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS=
(s);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!IPMI_BMC_EVENT_MSG_BUF_ENABLED(ibs)) {<br>
&gt; @@ -475,7 +476,8 @@ void ipmi_bmc_gen_event(IPMIBmc *b, uint8_t *evt, =
bool log)<br>
&gt;=C2=A0 static void gen_event(IPMIBmcSim *ibs, unsigned int sens_num, ui=
nt8_t deassert,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 uint8_t evd1, uint8_t evd2, uint8_t evd3)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *s =3D ibs-&gt;parent.intf;<br>
&gt; +=C2=A0 =C2=A0 IPMICore *ic =3D IPMI_CORE(ibs);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterface *s =3D ic-&gt;intf;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS=
(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint8_t evt[16];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMISensor *sens =3D ibs-&gt;sensors + sens_num;<b=
r>
&gt; @@ -638,13 +640,14 @@ static void next_timeout(IPMIBmcSim *ibs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 timer_mod_ns(ibs-&gt;timer, next);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void ipmi_sim_handle_command(IPMIBmc *b,<br>
&gt; +static void ipmi_sim_handle_command(IPMICore *b,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t *cmd=
, unsigned int cmd_len,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int=
 max_cmd_len,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t msg_=
id)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIBmcSim *ibs =3D IPMI_BMC_SIMULATOR(b);<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *s =3D ibs-&gt;parent.intf;<br>
&gt; +=C2=A0 =C2=A0 IPMICore *ic =3D IPMI_CORE(ibs);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterface *s =3D ic-&gt;intf;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS=
(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const IPMICmdHandler *hdl;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 RspBuffer rsp =3D RSP_BUFFER_INITIALIZER;<br>
&gt; @@ -690,15 +693,18 @@ static void ipmi_sim_handle_command(IPMIBmc *b,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 hdl-&gt;cmd_handler(ibs, cmd, cmd_len, &amp;rsp);<=
br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0out:<br>
&gt; -=C2=A0 =C2=A0 k-&gt;handle_rsp(s, msg_id, rsp.buffer, rsp.len);<br>
&gt; +=C2=A0 =C2=A0 k-&gt;handle_msg(s, msg_id, rsp.buffer, rsp.len);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 next_timeout(ibs);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void ipmi_sim_handle_timeout(IPMIBmcSim *ibs)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *s =3D ibs-&gt;parent.intf;<br>
&gt; +=C2=A0 =C2=A0 IPMICore *ic =3D IPMI_CORE(ibs);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterface *s =3D ic-&gt;intf;<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHost *hs =3D IPMI_INTERFACE_HOST(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS=
(s);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *hk =3D IPMI_INTERFACE_HOST_CLAS=
S(k);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!ibs-&gt;watchdog_running) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt; @@ -708,7 +714,7 @@ static void ipmi_sim_handle_timeout(IPMIBmcSim *ib=
s)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 switch (IPMI_BMC_WATCHDOG_GET_PRE_AC=
TION(ibs)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case IPMI_BMC_WATCHDOG_PRE_NMI:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibs-&gt;msg_flags |=3D=
 IPMI_BMC_MSG_FLAG_WATCHDOG_TIMEOUT_MASK;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k-&gt;do_hw_op(s, IPMI_SEND=
_NMI, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 hk-&gt;do_hw_op(hs, IPMI_SE=
ND_NMI, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sensor_set_discrete_bi=
t(ibs, IPMI_WATCHDOG_SENSOR, 8, 1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xc8, (2 &lt=
;&lt; 4) | 0xf, 0xff);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt; @@ -743,19 +749,19 @@ static void ipmi_sim_handle_timeout(IPMIBmcSim *=
ibs)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case IPMI_BMC_WATCHDOG_ACTION_RESET:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sensor_set_discrete_bit(ibs, IPMI_WA=
TCHDOG_SENSOR, 1, 1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xc1, ibs-&gt;watchdog_use=
 &amp; 0xf, 0xff);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 k-&gt;do_hw_op(s, IPMI_RESET_CHASSIS, 0);=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hk-&gt;do_hw_op(hs, IPMI_RESET_CHASSIS, 0=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 case IPMI_BMC_WATCHDOG_ACTION_POWER_DOWN:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sensor_set_discrete_bit(ibs, IPMI_WA=
TCHDOG_SENSOR, 2, 1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xc2, ibs-&gt;watchdog_use=
 &amp; 0xf, 0xff);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 k-&gt;do_hw_op(s, IPMI_POWEROFF_CHASSIS, =
0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hk-&gt;do_hw_op(hs, IPMI_POWEROFF_CHASSIS=
, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 case IPMI_BMC_WATCHDOG_ACTION_POWER_CYCLE:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sensor_set_discrete_bit(ibs, IPMI_WA=
TCHDOG_SENSOR, 2, 1,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0xc3, ibs-&gt;watchdog_use=
 &amp; 0xf, 0xff);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 k-&gt;do_hw_op(s, IPMI_POWERCYCLE_CHASSIS=
, 0);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 hk-&gt;do_hw_op(hs, IPMI_POWERCYCLE_CHASS=
IS, 0);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -788,8 +794,9 @@ static void chassis_control(IPMIBmcSim *ibs,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t *cmd, unsigned int cmd_len,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 RspBuffer *rsp)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *s =3D ibs-&gt;parent.intf;<br>
&gt; -=C2=A0 =C2=A0 IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);<=
br>
&gt; +=C2=A0 =C2=A0 IPMICore *ic =3D IPMI_CORE(ibs);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHost *s =3D IPMI_INTERFACE_HOST(ic-&gt;int=
f);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *k =3D IPMI_INTERFACE_HOST_GET_C=
LASS(s);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 switch (cmd[2] &amp; 0xf) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case 0: /* power down */<br>
&gt; @@ -845,8 +852,9 @@ static void get_device_id(IPMIBmcSim *ibs,<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void set_global_enables(IPMIBmcSim *ibs, uint8_t val)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *s =3D ibs-&gt;parent.intf;<br>
&gt; -=C2=A0 =C2=A0 IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);<=
br>
&gt; +=C2=A0 =C2=A0 IPMICore *ic =3D IPMI_CORE(ibs);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHost *s =3D IPMI_INTERFACE_HOST(ic-&gt;int=
f);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *k =3D IPMI_INTERFACE_HOST_GET_C=
LASS(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool irqs_on;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ibs-&gt;bmc_global_enables =3D val;<br>
&gt; @@ -861,8 +869,9 @@ static void cold_reset(IPMIBmcSim *ibs,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0uint8_t *cmd, unsigned int cmd_len,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0RspBuffer *rsp)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *s =3D ibs-&gt;parent.intf;<br>
&gt; -=C2=A0 =C2=A0 IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);<=
br>
&gt; +=C2=A0 =C2=A0 IPMICore *ic =3D IPMI_CORE(ibs);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHost *s =3D IPMI_INTERFACE_HOST(ic-&gt;int=
f);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *k =3D IPMI_INTERFACE_HOST_GET_C=
LASS(s);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* Disable all interrupts */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 set_global_enables(ibs, 1 &lt;&lt; IPMI_BMC_EVENT_=
LOG_BIT);<br>
&gt; @@ -876,8 +885,9 @@ static void warm_reset(IPMIBmcSim *ibs,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0uint8_t *cmd, unsigned int cmd_len,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0RspBuffer *rsp)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *s =3D ibs-&gt;parent.intf;<br>
&gt; -=C2=A0 =C2=A0 IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);<=
br>
&gt; +=C2=A0 =C2=A0 IPMICore *ic =3D IPMI_CORE(ibs);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHost *s =3D IPMI_INTERFACE_HOST(ic-&gt;int=
f);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *k =3D IPMI_INTERFACE_HOST_GET_C=
LASS(s);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (k-&gt;reset) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 k-&gt;reset(s, false);<br>
&gt; @@ -939,7 +949,8 @@ static void clr_msg_flags(IPMIBmcSim *ibs,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint8_t *cmd, unsigned int cmd_len,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 RspBuffer *rsp)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *s =3D ibs-&gt;parent.intf;<br>
&gt; +=C2=A0 =C2=A0 IPMICore *ic =3D IPMI_CORE(ibs);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterface *s =3D ic-&gt;intf;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS=
(s);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ibs-&gt;msg_flags &amp;=3D ~cmd[2];<br>
&gt; @@ -957,7 +968,8 @@ static void read_evt_msg_buf(IPMIBmcSim *ibs,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t *cmd, unsigned int cmd_len=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RspBuffer *rsp)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *s =3D ibs-&gt;parent.intf;<br>
&gt; +=C2=A0 =C2=A0 IPMICore *ic =3D IPMI_CORE(ibs);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterface *s =3D ic-&gt;intf;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS=
(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned int i;<br>
&gt;=C2=A0 <br>
&gt; @@ -989,7 +1001,8 @@ static void get_msg(IPMIBmcSim *ibs,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 g_free(msg);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (QTAILQ_EMPTY(&amp;ibs-&gt;rcvbufs)) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMIInterface *s =3D ibs-&gt;parent.intf;=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMICore *ic =3D IPMI_CORE(ibs);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMIInterface *s =3D ic-&gt;intf;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMIInterfaceClass *k =3D IPMI_INTER=
FACE_GET_CLASS(s);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ibs-&gt;msg_flags &amp;=3D ~IPMI_BMC=
_MSG_FLAG_RCV_MSG_QUEUE;<br>
&gt; @@ -1014,7 +1027,8 @@ static void send_msg(IPMIBmcSim *ibs,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0uint8_t *cmd, unsigned int cmd_len,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0RspBuffer *rsp)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *s =3D ibs-&gt;parent.intf;<br>
&gt; +=C2=A0 =C2=A0 IPMICore *ic =3D IPMI_CORE(ibs);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterface *s =3D ic-&gt;intf;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS=
(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIRcvBufEntry *msg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint8_t *buf;<br>
&gt; @@ -1130,8 +1144,9 @@ static void set_watchdog_timer(IPMIBmcSim *ibs,<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t *cmd, unsigned int =
cmd_len,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RspBuffer *rsp)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *s =3D ibs-&gt;parent.intf;<br>
&gt; -=C2=A0 =C2=A0 IPMIInterfaceClass *k =3D IPMI_INTERFACE_GET_CLASS(s);<=
br>
&gt; +=C2=A0 =C2=A0 IPMICore *ic =3D IPMI_CORE(ibs);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHost *s =3D IPMI_INTERFACE_HOST(ic-&gt;int=
f);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *k =3D IPMI_INTERFACE_HOST_GET_C=
LASS(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned int val;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 val =3D cmd[2] &amp; 0x7; /* Validate use */<br>
&gt; @@ -2159,9 +2174,8 @@ out:<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void ipmi_sim_realize(DeviceState *dev, Error **errp)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 IPMIBmc *b =3D IPMI_BMC(dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned int i;<br>
&gt; -=C2=A0 =C2=A0 IPMIBmcSim *ibs =3D IPMI_BMC_SIMULATOR(b);<br>
&gt; +=C2=A0 =C2=A0 IPMIBmcSim *ibs =3D IPMI_BMC_SIMULATOR(dev);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 QTAILQ_INIT(&amp;ibs-&gt;rcvbufs);<br>
&gt;=C2=A0 <br>
&gt; @@ -2209,17 +2223,17 @@ static Property ipmi_sim_properties[] =3D {<br=
>
&gt;=C2=A0 static void ipmi_sim_class_init(ObjectClass *oc, void *data)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(oc);<br>
&gt; -=C2=A0 =C2=A0 IPMIBmcClass *bk =3D IPMI_BMC_CLASS(oc);<br>
&gt; +=C2=A0 =C2=A0 IPMICoreClass *ck =3D IPMI_CORE_CLASS(oc);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 dc-&gt;hotpluggable =3D false;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dc-&gt;realize =3D ipmi_sim_realize;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 device_class_set_props(dc, ipmi_sim_properties);<b=
r>
&gt; -=C2=A0 =C2=A0 bk-&gt;handle_command =3D ipmi_sim_handle_command;<br>
&gt; +=C2=A0 =C2=A0 ck-&gt;handle_command =3D ipmi_sim_handle_command;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const TypeInfo ipmi_sim_type =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .name=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_I=
PMI_BMC_SIMULATOR,<br>
&gt; -=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_IPMI_BMC,<b=
r>
&gt; +=C2=A0 =C2=A0 .parent=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D TYPE_IPMI_BMC_HO=
ST,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .instance_size =3D sizeof(IPMIBmcSim),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D ipmi_sim_class_init,<=
br>
&gt;=C2=A0 };<br>
&gt; diff --git a/hw/ipmi/ipmi_bt.c b/hw/ipmi/ipmi_bt.c<br>
&gt; index 22f94fb98d..1363098753 100644<br>
&gt; --- a/hw/ipmi/ipmi_bt.c<br>
&gt; +++ b/hw/ipmi/ipmi_bt.c<br>
&gt; @@ -92,8 +92,9 @@ static void ipmi_bt_lower_irq(IPMIBT *ib)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void ipmi_bt_handle_event(IPMIInterface *ii)<br>
&gt; +static void ipmi_bt_handle_event(IPMIInterfaceHost *iih)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 IPMIInterface *ii =3D IPMI_INTERFACE(iih);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLA=
SS(ii);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIBT *ib =3D iic-&gt;get_backend_data(ii);<br>
&gt;=C2=A0 <br>
&gt; @@ -141,8 +142,8 @@ static void ipmi_bt_handle_event(IPMIInterface *ii=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ib-&gt;waiting_seq =3D ib-&gt;inmsg[2];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ib-&gt;inmsg[2] =3D ib-&gt;inmsg[1];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMIBmcClass *bk =3D IPMI_BMC_GET_CLASS(i=
b-&gt;bmc);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 bk-&gt;handle_command(ib-&gt;bmc, ib-&gt;=
inmsg + 2, ib-&gt;inlen - 2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMICoreClass *ck =3D IPMI_CORE_GET_CLASS=
(ib-&gt;bmc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ck-&gt;handle_command(IPMI_CORE(ib-&gt;bm=
c), ib-&gt;inmsg + 2, ib-&gt;inlen - 2,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(ib-&gt;inmsg), ib-&gt;waiting_rsp)=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0out:<br>
&gt; @@ -215,9 +216,9 @@ static uint64_t ipmi_bt_ioport_read(void *opaque, =
hwaddr addr, unsigned size)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ret;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void ipmi_bt_signal(IPMIBT *ib, IPMIInterface *ii)<br>
&gt; +static void ipmi_bt_signal(IPMIBT *ib, IPMIInterfaceHost *ii)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii=
);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_GET=
_CLASS(ii);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ib-&gt;do_wake =3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 while (ib-&gt;do_wake) {<br>
&gt; @@ -254,7 +255,7 @@ static void ipmi_bt_ioport_write(void *opaque, hwa=
ddr addr, uint64_t val,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IPMI_BT_GET_H2B_ATN(val)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMI_BT_SET_BBUSY(ib-&=
gt;control_reg, 1);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ipmi_bt_signal(ib, ii);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ipmi_bt_signal(ib, IPMI_INT=
ERFACE_HOST(ii));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 <br>
&gt; @@ -329,10 +330,10 @@ static void ipmi_bt_set_atn(IPMIInterface *ii, i=
nt val, int irq)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void ipmi_bt_handle_reset(IPMIInterface *ii, bool is_cold)<br>
&gt; +static void ipmi_bt_handle_reset(IPMIInterfaceHost *ii, bool is_cold)=
<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLA=
SS(ii);<br>
&gt; -=C2=A0 =C2=A0 IPMIBT *ib =3D iic-&gt;get_backend_data(ii);<br>
&gt; +=C2=A0 =C2=A0 IPMIBT *ib =3D iic-&gt;get_backend_data(IPMI_INTERFACE(=
ii));<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (is_cold) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Disable the BT interrupt on reset=
 */<br>
&gt; @@ -344,16 +345,18 @@ static void ipmi_bt_handle_reset(IPMIInterface *=
ii, bool is_cold)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void ipmi_bt_set_irq_enable(IPMIInterface *ii, int val)<br>
&gt; +static void ipmi_bt_set_irq_enable(IPMIInterfaceHost *ii, int val)<br=
>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLA=
SS(ii);<br>
&gt; -=C2=A0 =C2=A0 IPMIBT *ib =3D iic-&gt;get_backend_data(ii);<br>
&gt; +=C2=A0 =C2=A0 IPMIBT *ib =3D iic-&gt;get_backend_data(IPMI_INTERFACE(=
ii));<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ib-&gt;irqs_enabled =3D val;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void ipmi_bt_init(IPMIInterface *ii, unsigned int min_size, Er=
ror **errp)<br>
&gt; +static void ipmi_bt_init(IPMIInterfaceHost *iih, unsigned int min_siz=
e,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 IPMIInterface *ii =3D IPMI_INTERFACE(iih);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLA=
SS(ii);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIBT *ib =3D iic-&gt;get_backend_data(ii);<br>
&gt;=C2=A0 <br>
&gt; @@ -426,11 +429,13 @@ void ipmi_bt_get_fwinfo(struct IPMIBT *ib, IPMIF=
wInfo *info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 info-&gt;irq_type =3D IPMI_LEVEL_IRQ;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -void ipmi_bt_class_init(IPMIInterfaceClass *iic)<br>
&gt; +void ipmi_bt_class_init(IPMIInterfaceClass *ic)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_CLA=
SS(ic);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 iic-&gt;init =3D ipmi_bt_init;<br>
&gt; -=C2=A0 =C2=A0 iic-&gt;set_atn =3D ipmi_bt_set_atn;<br>
&gt; -=C2=A0 =C2=A0 iic-&gt;handle_rsp =3D ipmi_bt_handle_rsp;<br>
&gt; +=C2=A0 =C2=A0 ic-&gt;set_atn =3D ipmi_bt_set_atn;<br>
&gt; +=C2=A0 =C2=A0 ic-&gt;handle_msg =3D ipmi_bt_handle_rsp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 iic-&gt;handle_if_event =3D ipmi_bt_handle_event;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 iic-&gt;set_irq_enable =3D ipmi_bt_set_irq_enable;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 iic-&gt;reset =3D ipmi_bt_handle_reset;<br>
&gt; diff --git a/hw/ipmi/ipmi_kcs.c b/hw/ipmi/ipmi_kcs.c<br>
&gt; index a77612946a..771f2bc0b2 100644<br>
&gt; --- a/hw/ipmi/ipmi_kcs.c<br>
&gt; +++ b/hw/ipmi/ipmi_kcs.c<br>
&gt; @@ -94,18 +94,20 @@ static void ipmi_kcs_lower_irq(IPMIKCS *ik)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void ipmi_kcs_signal(IPMIKCS *ik, IPMIInterface *ii)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii=
);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHost *iih =3D IPMI_INTERFACE_HOST(ii);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_GET=
_CLASS(ii);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ik-&gt;do_wake =3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 while (ik-&gt;do_wake) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ik-&gt;do_wake =3D 0;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 iic-&gt;handle_if_event(ii);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 iic-&gt;handle_if_event(iih);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void ipmi_kcs_handle_event(IPMIInterface *ii)<br>
&gt; +static void ipmi_kcs_handle_event(IPMIInterfaceHost *iih)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii=
);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterface *ii =3D IPMI_INTERFACE(iih);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii=
h);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIKCS *ik =3D iic-&gt;get_backend_data(ii);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (ik-&gt;cmd_reg =3D=3D IPMI_KCS_ABORT_STATUS_CM=
D) {<br>
&gt; @@ -162,12 +164,12 @@ static void ipmi_kcs_handle_event(IPMIInterface =
*ii)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ik-&gt;inlen++;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ik-&gt;write_end) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMIBmcClass *bk =3D IPMI_B=
MC_GET_CLASS(ik-&gt;bmc);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMICoreClass *ck =3D IPMI_=
CORE_GET_CLASS(ik-&gt;bmc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ik-&gt;outlen =3D 0;<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ik-&gt;write_end =3D 0=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ik-&gt;outpos =3D 0;<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bk-&gt;handle_command(ik-&g=
t;bmc, ik-&gt;inmsg, ik-&gt;inlen, sizeof(ik-&gt;inmsg),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ik-&gt;waiting_rsp);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ck-&gt;handle_command(IPMI_=
CORE(ik-&gt;bmc), ik-&gt;inmsg, ik-&gt;inlen,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(ik-&gt;inmsg), ik-&gt;wait=
ing_rsp);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out_noibf;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (ik-&gt;cmd_reg =3D=3D IPM=
I_KCS_WRITE_END_CMD) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ik-&gt;cmd_reg =3D -1;=
<br>
&gt; @@ -321,18 +323,19 @@ static void ipmi_kcs_set_atn(IPMIInterface *ii, =
int val, int irq)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void ipmi_kcs_set_irq_enable(IPMIInterface *ii, int val)<br>
&gt; +static void ipmi_kcs_set_irq_enable(IPMIInterfaceHost *ii, int val)<b=
r>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLA=
SS(ii);<br>
&gt; -=C2=A0 =C2=A0 IPMIKCS *ik =3D iic-&gt;get_backend_data(ii);<br>
&gt; +=C2=A0 =C2=A0 IPMIKCS *ik =3D iic-&gt;get_backend_data(IPMI_INTERFACE=
(ii));<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ik-&gt;irqs_enabled =3D val;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /* min_size must be a power of 2. */<br>
&gt; -static void ipmi_kcs_init(IPMIInterface *ii, unsigned int min_size,<b=
r>
&gt; +static void ipmi_kcs_init(IPMIInterfaceHost *iih, unsigned int min_si=
ze,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Error **errp)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 IPMIInterface *ii =3D IPMI_INTERFACE(iih);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLA=
SS(ii);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIKCS *ik =3D iic-&gt;get_backend_data(ii);<br>
&gt;=C2=A0 <br>
&gt; @@ -413,11 +416,13 @@ void ipmi_kcs_get_fwinfo(IPMIKCS *ik, IPMIFwInfo=
 *info)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 info-&gt;irq_type =3D IPMI_LEVEL_IRQ;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -void ipmi_kcs_class_init(IPMIInterfaceClass *iic)<br>
&gt; +void ipmi_kcs_class_init(IPMIInterfaceClass *ic)<br>
&gt;=C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_CLA=
SS(ic);<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 iic-&gt;init =3D ipmi_kcs_init;<br>
&gt; -=C2=A0 =C2=A0 iic-&gt;set_atn =3D ipmi_kcs_set_atn;<br>
&gt; -=C2=A0 =C2=A0 iic-&gt;handle_rsp =3D ipmi_kcs_handle_rsp;<br>
&gt; +=C2=A0 =C2=A0 ic-&gt;set_atn =3D ipmi_kcs_set_atn;<br>
&gt; +=C2=A0 =C2=A0 ic-&gt;handle_msg =3D ipmi_kcs_handle_rsp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 iic-&gt;handle_if_event =3D ipmi_kcs_handle_event;=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 iic-&gt;set_irq_enable =3D ipmi_kcs_set_irq_enable=
;<br>
&gt;=C2=A0 }<br>
&gt; diff --git a/hw/ipmi/isa_ipmi_bt.c b/hw/ipmi/isa_ipmi_bt.c<br>
&gt; index a83e7243d6..a298f5f981 100644<br>
&gt; --- a/hw/ipmi/isa_ipmi_bt.c<br>
&gt; +++ b/hw/ipmi/isa_ipmi_bt.c<br>
&gt; @@ -44,7 +44,8 @@ struct ISAIPMIBTDevice {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t uuid;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; -static void isa_ipmi_bt_get_fwinfo(struct IPMIInterface *ii, IPMIFwIn=
fo *info)<br>
&gt; +static void isa_ipmi_bt_get_fwinfo(struct IPMIInterfaceHost *ii,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IPMIFwInfo *info)<b=
r>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISAIPMIBTDevice *iib =3D ISA_IPMI_BT(ii);<br>
&gt;=C2=A0 <br>
&gt; @@ -73,8 +74,8 @@ static void isa_ipmi_bt_realize(DeviceState *dev, Er=
ror **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISADevice *isadev =3D ISA_DEVICE(dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISAIPMIBTDevice *iib =3D ISA_IPMI_BT(dev);<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *ii =3D IPMI_INTERFACE(dev);<br>
&gt; -=C2=A0 =C2=A0 IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii=
);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHost *ii =3D IPMI_INTERFACE_HOST(dev);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_GET=
_CLASS(ii);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!iib-&gt;bt.bmc) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;IPMI device r=
equires a bmc attribute to be set&quot;);<br>
&gt; @@ -83,7 +84,7 @@ static void isa_ipmi_bt_realize(DeviceState *dev, Er=
ror **errp)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 iib-&gt;uuid =3D ipmi_next_uuid();<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 iib-&gt;bt.bmc-&gt;intf =3D ii;<br>
&gt; +=C2=A0 =C2=A0 IPMI_CORE(iib-&gt;bt.bmc)-&gt;intf =3D IPMI_INTERFACE(i=
i);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 iib-&gt;bt.opaque =3D iib;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 iic-&gt;init(ii, 0, &amp;err);<br>
&gt; @@ -144,14 +145,15 @@ static Property ipmi_isa_properties[] =3D {<br>
&gt;=C2=A0 static void isa_ipmi_bt_class_init(ObjectClass *oc, void *data)<=
br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(oc);<br>
&gt; -=C2=A0 =C2=A0 IPMIInterfaceClass *iic =3D IPMI_INTERFACE_CLASS(oc);<b=
r>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_CLA=
SS(oc);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceClass *ic =3D IPMI_INTERFACE_CLASS(oc);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 AcpiDevAmlIfClass *adevc =3D ACPI_DEV_AML_IF_CLASS=
(oc);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 dc-&gt;realize =3D isa_ipmi_bt_realize;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 device_class_set_props(dc, ipmi_isa_properties);<b=
r>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 iic-&gt;get_backend_data =3D isa_ipmi_bt_get_backend_da=
ta;<br>
&gt; -=C2=A0 =C2=A0 ipmi_bt_class_init(iic);<br>
&gt; +=C2=A0 =C2=A0 ic-&gt;get_backend_data =3D isa_ipmi_bt_get_backend_dat=
a;<br>
&gt; +=C2=A0 =C2=A0 ipmi_bt_class_init(ic);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 iic-&gt;get_fwinfo =3D isa_ipmi_bt_get_fwinfo;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 adevc-&gt;build_dev_aml =3D build_ipmi_dev_aml;<br=
>
&gt;=C2=A0 }<br>
&gt; @@ -163,7 +165,7 @@ static const TypeInfo isa_ipmi_bt_info =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .instance_init =3D isa_ipmi_bt_init,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D isa_ipmi_bt_class_ini=
t,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .interfaces =3D (InterfaceInfo[]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_IPMI_INTERFACE },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_IPMI_INTERFACE_HOST },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_ACPI_DEV_AML_IF },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; diff --git a/hw/ipmi/isa_ipmi_kcs.c b/hw/ipmi/isa_ipmi_kcs.c<br>
&gt; index b2ed70b9da..a1372ae448 100644<br>
&gt; --- a/hw/ipmi/isa_ipmi_kcs.c<br>
&gt; +++ b/hw/ipmi/isa_ipmi_kcs.c<br>
&gt; @@ -44,7 +44,7 @@ struct ISAIPMIKCSDevice {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t uuid;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; -static void isa_ipmi_kcs_get_fwinfo(IPMIInterface *ii, IPMIFwInfo *in=
fo)<br>
&gt; +static void isa_ipmi_kcs_get_fwinfo(IPMIInterfaceHost *ii, IPMIFwInfo=
 *info)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISAIPMIKCSDevice *iik =3D ISA_IPMI_KCS(ii);<br>
&gt;=C2=A0 <br>
&gt; @@ -72,8 +72,8 @@ static void ipmi_isa_realize(DeviceState *dev, Error=
 **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISADevice *isadev =3D ISA_DEVICE(dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISAIPMIKCSDevice *iik =3D ISA_IPMI_KCS(dev);<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *ii =3D IPMI_INTERFACE(dev);<br>
&gt; -=C2=A0 =C2=A0 IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii=
);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHost *ii =3D IPMI_INTERFACE_HOST(dev);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_GET=
_CLASS(ii);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!iik-&gt;kcs.bmc) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;IPMI device r=
equires a bmc attribute to be set&quot;);<br>
&gt; @@ -82,7 +82,7 @@ static void ipmi_isa_realize(DeviceState *dev, Error=
 **errp)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 iik-&gt;uuid =3D ipmi_next_uuid();<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 iik-&gt;kcs.bmc-&gt;intf =3D ii;<br>
&gt; +=C2=A0 =C2=A0 IPMI_CORE(iik-&gt;kcs.bmc)-&gt;intf =3D IPMI_INTERFACE(=
ii);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 iik-&gt;kcs.opaque =3D iik;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 iic-&gt;init(ii, 0, &amp;err);<br>
&gt; @@ -152,6 +152,7 @@ static void isa_ipmi_kcs_class_init(ObjectClass *o=
c, void *data)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(oc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIInterfaceClass *iic =3D IPMI_INTERFACE_CLASS(o=
c);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *iihc =3D IPMI_INTERFACE_HOST_CL=
ASS(oc);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 AcpiDevAmlIfClass *adevc =3D ACPI_DEV_AML_IF_CLASS=
(oc);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 dc-&gt;realize =3D ipmi_isa_realize;<br>
&gt; @@ -159,7 +160,7 @@ static void isa_ipmi_kcs_class_init(ObjectClass *o=
c, void *data)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 iic-&gt;get_backend_data =3D isa_ipmi_kcs_get_back=
end_data;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ipmi_kcs_class_init(iic);<br>
&gt; -=C2=A0 =C2=A0 iic-&gt;get_fwinfo =3D isa_ipmi_kcs_get_fwinfo;<br>
&gt; +=C2=A0 =C2=A0 iihc-&gt;get_fwinfo =3D isa_ipmi_kcs_get_fwinfo;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 adevc-&gt;build_dev_aml =3D build_ipmi_dev_aml;<br=
>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -170,7 +171,7 @@ static const TypeInfo isa_ipmi_kcs_info =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .instance_init =3D isa_ipmi_kcs_init,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D isa_ipmi_kcs_class_in=
it,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .interfaces =3D (InterfaceInfo[]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_IPMI_INTERFACE },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_IPMI_INTERFACE_HOST },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_ACPI_DEV_AML_IF },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; diff --git a/hw/ipmi/pci_ipmi_bt.c b/hw/ipmi/pci_ipmi_bt.c<br>
&gt; index 633931b825..883bbda8f1 100644<br>
&gt; --- a/hw/ipmi/pci_ipmi_bt.c<br>
&gt; +++ b/hw/ipmi/pci_ipmi_bt.c<br>
&gt; @@ -56,8 +56,8 @@ static void pci_ipmi_bt_realize(PCIDevice *pd, Error=
 **errp)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PCIIPMIBTDevice *pik =3D PCI_IPMI_BT(pd);<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *ii =3D IPMI_INTERFACE(pd);<br>
&gt; -=C2=A0 =C2=A0 IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii=
);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHost *ii =3D IPMI_INTERFACE_HOST(pd);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_GET=
_CLASS(ii);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!pik-&gt;bt.bmc) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;IPMI device r=
equires a bmc attribute to be set&quot;);<br>
&gt; @@ -66,7 +66,7 @@ static void pci_ipmi_bt_realize(PCIDevice *pd, Error=
 **errp)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 pik-&gt;uuid =3D ipmi_next_uuid();<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 pik-&gt;bt.bmc-&gt;intf =3D ii;<br>
&gt; +=C2=A0 =C2=A0 IPMI_CORE(pik-&gt;bt.bmc)-&gt;intf =3D IPMI_INTERFACE(i=
i);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pik-&gt;bt.opaque =3D pik;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 pci_config_set_prog_interface(pd-&gt;config, 0x02)=
; /* BT */<br>
&gt; @@ -134,7 +134,7 @@ static const TypeInfo pci_ipmi_bt_info =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .instance_init =3D pci_ipmi_bt_instance_init,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D pci_ipmi_bt_class_ini=
t,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .interfaces =3D (InterfaceInfo[]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_IPMI_INTERFACE },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_IPMI_INTERFACE_HOST },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { INTERFACE_CONVENTIONAL_PCI_DEVICE =
},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; diff --git a/hw/ipmi/pci_ipmi_kcs.c b/hw/ipmi/pci_ipmi_kcs.c<br>
&gt; index 1a581413c2..40f8da95af 100644<br>
&gt; --- a/hw/ipmi/pci_ipmi_kcs.c<br>
&gt; +++ b/hw/ipmi/pci_ipmi_kcs.c<br>
&gt; @@ -56,8 +56,8 @@ static void pci_ipmi_kcs_realize(PCIDevice *pd, Erro=
r **errp)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Error *err =3D NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PCIIPMIKCSDevice *pik =3D PCI_IPMI_KCS(pd);<br>
&gt; -=C2=A0 =C2=A0 IPMIInterface *ii =3D IPMI_INTERFACE(pd);<br>
&gt; -=C2=A0 =C2=A0 IPMIInterfaceClass *iic =3D IPMI_INTERFACE_GET_CLASS(ii=
);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHost *ii =3D IPMI_INTERFACE_HOST(pd);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_GET=
_CLASS(ii);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!pik-&gt;kcs.bmc) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;IPMI device r=
equires a bmc attribute to be set&quot;);<br>
&gt; @@ -66,7 +66,7 @@ static void pci_ipmi_kcs_realize(PCIDevice *pd, Erro=
r **errp)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 pik-&gt;uuid =3D ipmi_next_uuid();<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 pik-&gt;kcs.bmc-&gt;intf =3D ii;<br>
&gt; +=C2=A0 =C2=A0 IPMI_CORE(pik-&gt;kcs.bmc)-&gt;intf =3D IPMI_INTERFACE(=
ii);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pik-&gt;kcs.opaque =3D pik;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 pci_config_set_prog_interface(pd-&gt;config, 0x01)=
; /* KCS */<br>
&gt; @@ -134,7 +134,7 @@ static const TypeInfo pci_ipmi_kcs_info =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .instance_init =3D pci_ipmi_kcs_instance_init,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D pci_ipmi_kcs_class_in=
it,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .interfaces =3D (InterfaceInfo[]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_IPMI_INTERFACE },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_IPMI_INTERFACE_HOST },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { INTERFACE_CONVENTIONAL_PCI_DEVICE =
},<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; diff --git a/hw/ipmi/smbus_ipmi.c b/hw/ipmi/smbus_ipmi.c<br>
&gt; index d0991ab7f9..f61b260f58 100644<br>
&gt; --- a/hw/ipmi/smbus_ipmi.c<br>
&gt; +++ b/hw/ipmi/smbus_ipmi.c<br>
&gt; @@ -49,7 +49,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(SMBusIPMIDevice, SMBUS_IP=
MI)<br>
&gt;=C2=A0 struct SMBusIPMIDevice {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SMBusDevice parent;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 IPMIBmc *bmc;<br>
&gt; +=C2=A0 =C2=A0 IPMIBmcHost *bmc;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint8_t outmsg[MAX_SSIF_IPMI_MSG_SIZE];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t outlen;<br>
&gt; @@ -71,7 +71,7 @@ struct SMBusIPMIDevice {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t uuid;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; -static void smbus_ipmi_handle_event(IPMIInterface *ii)<br>
&gt; +static void smbus_ipmi_handle_event(IPMIInterfaceHost *ii)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* No interrupts, so nothing to do here. */<br>
&gt;=C2=A0 }<br>
&gt; @@ -100,7 +100,7 @@ static void smbus_ipmi_set_atn(IPMIInterface *ii, =
int val, int irq)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* This is where PEC would go. */<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void smbus_ipmi_set_irq_enable(IPMIInterface *ii, int val)<br>
&gt; +static void smbus_ipmi_set_irq_enable(IPMIInterfaceHost *ii, int val)=
<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -108,7 +108,7 @@ static void smbus_ipmi_send_msg(SMBusIPMIDevice *s=
id)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint8_t *msg =3D sid-&gt;inmsg;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t len =3D sid-&gt;inlen;<br>
&gt; -=C2=A0 =C2=A0 IPMIBmcClass *bk =3D IPMI_BMC_GET_CLASS(sid-&gt;bmc);<b=
r>
&gt; +=C2=A0 =C2=A0 IPMICoreClass *ck =3D IPMI_CORE_GET_CLASS(sid-&gt;bmc);=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 sid-&gt;outlen =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sid-&gt;outpos =3D 0;<br>
&gt; @@ -136,8 +136,8 @@ static void smbus_ipmi_send_msg(SMBusIPMIDevice *s=
id)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 bk-&gt;handle_command(sid-&gt;bmc, sid-&gt;inmsg, sid-&=
gt;inlen, sizeof(sid-&gt;inmsg),<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0sid-&gt;waiting_rsp);<br>
&gt; +=C2=A0 =C2=A0 ck-&gt;handle_command(IPMI_CORE(sid-&gt;bmc), sid-&gt;i=
nmsg, sid-&gt;inlen,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0sizeof(sid-&gt;inmsg), sid-&gt;waiting_rsp);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static uint8_t ipmi_receive_byte(SMBusDevice *dev)<br>
&gt; @@ -326,7 +326,7 @@ static void smbus_ipmi_realize(DeviceState *dev, E=
rror **errp)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 sid-&gt;uuid =3D ipmi_next_uuid();<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 sid-&gt;bmc-&gt;intf =3D ii;<br>
&gt; +=C2=A0 =C2=A0 IPMI_CORE(sid-&gt;bmc)-&gt;intf =3D ii;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void smbus_ipmi_init(Object *obj)<br>
&gt; @@ -336,7 +336,8 @@ static void smbus_ipmi_init(Object *obj)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ipmi_bmc_find_and_link(obj, (Object **) &amp;sid-&=
gt;bmc);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void smbus_ipmi_get_fwinfo(struct IPMIInterface *ii, IPMIFwInf=
o *info)<br>
&gt; +static void smbus_ipmi_get_fwinfo(struct IPMIInterfaceHost *ii,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMIFwInfo *info)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 SMBusIPMIDevice *sid =3D SMBUS_IPMI(ii);<br>
&gt;=C2=A0 <br>
&gt; @@ -354,7 +355,8 @@ static void smbus_ipmi_get_fwinfo(struct IPMIInter=
face *ii, IPMIFwInfo *info)<br>
&gt;=C2=A0 static void smbus_ipmi_class_init(ObjectClass *oc, void *data)<b=
r>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(oc);<br>
&gt; -=C2=A0 =C2=A0 IPMIInterfaceClass *iic =3D IPMI_INTERFACE_CLASS(oc);<b=
r>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceHostClass *iic =3D IPMI_INTERFACE_HOST_CLA=
SS(oc);<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceClass *ic =3D IPMI_INTERFACE_CLASS(oc);<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 SMBusDeviceClass *sc =3D SMBUS_DEVICE_CLASS(oc);<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 AcpiDevAmlIfClass *adevc =3D ACPI_DEV_AML_IF_CLASS=
(oc);<br>
&gt;=C2=A0 <br>
&gt; @@ -362,8 +364,8 @@ static void smbus_ipmi_class_init(ObjectClass *oc,=
 void *data)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 sc-&gt;write_data =3D ipmi_write_data;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dc-&gt;vmsd =3D &amp;vmstate_smbus_ipmi;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dc-&gt;realize =3D smbus_ipmi_realize;<br>
&gt; -=C2=A0 =C2=A0 iic-&gt;set_atn =3D smbus_ipmi_set_atn;<br>
&gt; -=C2=A0 =C2=A0 iic-&gt;handle_rsp =3D smbus_ipmi_handle_rsp;<br>
&gt; +=C2=A0 =C2=A0 ic-&gt;set_atn =3D smbus_ipmi_set_atn;<br>
&gt; +=C2=A0 =C2=A0 ic-&gt;handle_msg =3D smbus_ipmi_handle_rsp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 iic-&gt;handle_if_event =3D smbus_ipmi_handle_even=
t;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 iic-&gt;set_irq_enable =3D smbus_ipmi_set_irq_enab=
le;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 iic-&gt;get_fwinfo =3D smbus_ipmi_get_fwinfo;<br>
&gt; @@ -377,7 +379,7 @@ static const TypeInfo smbus_ipmi_info =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .instance_init =3D smbus_ipmi_init,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .class_init=C2=A0 =C2=A0 =3D smbus_ipmi_class_init=
,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 .interfaces =3D (InterfaceInfo[]) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_IPMI_INTERFACE },<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_IPMI_INTERFACE_HOST },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { TYPE_ACPI_DEV_AML_IF },<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 { }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c<br>
&gt; index 11cb48af2f..a39cbdaa38 100644<br>
&gt; --- a/hw/ppc/pnv.c<br>
&gt; +++ b/hw/ppc/pnv.c<br>
&gt; @@ -595,7 +595,7 @@ static void pnv_powerdown_notify(Notifier *n, void=
 *opaque)<br>
&gt;=C2=A0 static void pnv_reset(MachineState *machine, ShutdownCause reaso=
n)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 PnvMachineState *pnv =3D PNV_MACHINE(machine);<br>
&gt; -=C2=A0 =C2=A0 IPMIBmc *bmc;<br>
&gt; +=C2=A0 =C2=A0 IPMIBmcHost *bmc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 void *fdt;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 qemu_devices_reset(reason);<br>
&gt; @@ -746,7 +746,7 @@ static bool pnv_match_cpu(const char *default_type=
, const char *cpu_type)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return ppc_default-&gt;pvr_match(ppc_default, ppc-=
&gt;pvr, false);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void pnv_ipmi_bt_init(ISABus *bus, IPMIBmc *bmc, uint32_t irq)=
<br>
&gt; +static void pnv_ipmi_bt_init(ISABus *bus, IPMIBmcHost *bmc, uint32_t =
irq)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISADevice *dev =3D isa_new(&quot;isa-ipmi-bt&quot;=
);<br>
&gt;=C2=A0 <br>
&gt; diff --git a/hw/ppc/pnv_bmc.c b/hw/ppc/pnv_bmc.c<br>
&gt; index 99f1e8d7f9..6e8a6f545b 100644<br>
&gt; --- a/hw/ppc/pnv_bmc.c<br>
&gt; +++ b/hw/ppc/pnv_bmc.c<br>
&gt; @@ -50,12 +50,12 @@ typedef struct OemSel {<br>
&gt;=C2=A0 #define SOFT_OFF=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00<br>
&gt;=C2=A0 #define SOFT_REBOOT=C2=A0 =C2=A0 =C2=A00x01<br>
&gt;=C2=A0 <br>
&gt; -static bool pnv_bmc_is_simulator(IPMIBmc *bmc)<br>
&gt; +static bool pnv_bmc_is_simulator(IPMIBmcHost *bmc)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return object_dynamic_cast(OBJECT(bmc), TYPE_IPMI_=
BMC_SIMULATOR);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -static void pnv_gen_oem_sel(IPMIBmc *bmc, uint8_t reboot)<br>
&gt; +static void pnv_gen_oem_sel(IPMIBmcHost *bmc, uint8_t reboot)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* IPMI SEL Event are 16 bytes long */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 OemSel sel =3D {<br>
&gt; @@ -71,12 +71,12 @@ static void pnv_gen_oem_sel(IPMIBmc *bmc, uint8_t =
reboot)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ipmi_bmc_gen_event(bmc, (uint8_t *) &amp;sel, 0 /*=
 do not log the event */);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -void pnv_bmc_powerdown(IPMIBmc *bmc)<br>
&gt; +void pnv_bmc_powerdown(IPMIBmcHost *bmc)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pnv_gen_oem_sel(bmc, SOFT_OFF);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -void pnv_dt_bmc_sensors(IPMIBmc *bmc, void *fdt)<br>
&gt; +void pnv_dt_bmc_sensors(IPMIBmcHost *bmc, void *fdt)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int offset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int i;<br>
&gt; @@ -249,7 +249,7 @@ static const IPMINetfn hiomap_netfn =3D {<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 <br>
&gt; -void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor)<br>
&gt; +void pnv_bmc_set_pnor(IPMIBmcHost *bmc, PnvPnor *pnor)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!pnv_bmc_is_simulator(bmc)) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt; @@ -267,15 +267,15 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pno=
r)<br>
&gt;=C2=A0 =C2=A0* Instantiate the machine BMC. PowerNV uses the QEMU inter=
nal<br>
&gt;=C2=A0 =C2=A0* simulator but it could also be external.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; -IPMIBmc *pnv_bmc_create(PnvPnor *pnor)<br>
&gt; +IPMIBmcHost *pnv_bmc_create(PnvPnor *pnor)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Object *obj;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 obj =3D object_new(TYPE_IPMI_BMC_SIMULATOR);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qdev_realize(DEVICE(obj), NULL, &amp;error_fatal);=
<br>
&gt; -=C2=A0 =C2=A0 pnv_bmc_set_pnor(IPMI_BMC(obj), pnor);<br>
&gt; +=C2=A0 =C2=A0 pnv_bmc_set_pnor(IPMI_BMC_HOST(obj), pnor);<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 return IPMI_BMC(obj);<br>
&gt; +=C2=A0 =C2=A0 return IPMI_BMC_HOST(obj);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 typedef struct ForeachArgs {<br>
&gt; @@ -296,9 +296,9 @@ static int bmc_find(Object *child, void *opaque)<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -IPMIBmc *pnv_bmc_find(Error **errp)<br>
&gt; +IPMIBmcHost *pnv_bmc_find(Error **errp)<br>
&gt;=C2=A0 {<br>
&gt; -=C2=A0 =C2=A0 ForeachArgs args =3D { TYPE_IPMI_BMC, NULL };<br>
&gt; +=C2=A0 =C2=A0 ForeachArgs args =3D { TYPE_IPMI_BMC_HOST, NULL };<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int ret;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D object_child_foreach_recursive(object_get_=
root(), bmc_find, &amp;args);<br>
&gt; @@ -308,5 +308,5 @@ IPMIBmc *pnv_bmc_find(Error **errp)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 return args.obj ? IPMI_BMC(args.obj) : NULL;<br>
&gt; +=C2=A0 =C2=A0 return args.obj ? IPMI_BMC_HOST(args.obj) : NULL;<br>
&gt;=C2=A0 }<br>
&gt; diff --git a/hw/smbios/smbios_type_38.c b/hw/smbios/smbios_type_38.c<b=
r>
&gt; index 168b886647..81a1cf09ea 100644<br>
&gt; --- a/hw/smbios/smbios_type_38.c<br>
&gt; +++ b/hw/smbios/smbios_type_38.c<br>
&gt; @@ -83,16 +83,17 @@ static void smbios_add_ipmi_devices(BusState *bus)=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 QTAILQ_FOREACH(kid, &amp;bus-&gt;children,=C2=A0 s=
ibling) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DeviceState *dev =3D kid-&gt;child;<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 Object *obj =3D object_dynamic_cast(OBJEC=
T(dev), TYPE_IPMI_INTERFACE);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 Object *obj =3D object_dynamic_cast(OBJEC=
T(dev),<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 TYPE_IPMI_INTERFACE_HOST);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 BusState *childbus;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (obj) {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMIInterface *ii;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMIInterfaceClass *iic;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMIInterfaceHost *ii;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMIInterfaceHostClass *iic=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 IPMIFwInfo info;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ii =3D IPMI_INTERFACE(obj);=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iic =3D IPMI_INTERFACE_GET_=
CLASS(obj);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ii =3D IPMI_INTERFACE_HOST(=
obj);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iic =3D IPMI_INTERFACE_HOST=
_GET_CLASS(obj);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(&amp;info, 0, s=
izeof(info));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!iic-&gt;get_fwinf=
o) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue=
;<br>
&gt; diff --git a/include/hw/ipmi/ipmi.h b/include/hw/ipmi/ipmi.h<br>
&gt; index 77a7213ed9..5ead2467f5 100644<br>
&gt; --- a/include/hw/ipmi/ipmi.h<br>
&gt; +++ b/include/hw/ipmi/ipmi.h<br>
&gt; @@ -109,99 +109,156 @@ uint32_t ipmi_next_uuid(void);<br>
&gt;=C2=A0 =C2=A0* and the BMC.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt;=C2=A0 #define TYPE_IPMI_INTERFACE &quot;ipmi-interface&quot;<br>
&gt; -#define IPMI_INTERFACE(obj) \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0INTERFACE_CHECK(IPMIInterface, (obj), TYPE_IPMI_I=
NTERFACE)<br>
&gt; -typedef struct IPMIInterfaceClass IPMIInterfaceClass;<br>
&gt; -DECLARE_CLASS_CHECKERS(IPMIInterfaceClass, IPMI_INTERFACE,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0TYPE_IPMI_INTERFACE)<br>
&gt; +OBJECT_DECLARE_TYPE(IPMIInterface, IPMIInterfaceClass, IPMI_INTERFACE=
)<br>
&gt;=C2=A0 <br>
&gt; +typedef struct IPMIInterfaceClass IPMIInterfaceClass;<br>
&gt;=C2=A0 typedef struct IPMIInterface IPMIInterface;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 struct IPMIInterfaceClass {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 InterfaceClass parent;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* The interfaces use this to perform certain ops<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 void (*set_atn)(struct IPMIInterface *s, int val, int i=
rq);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Set by the owner to hold the backend data for t=
he interface.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 void *(*get_backend_data)(struct IPMIInterface *s);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Handle a message between the host and the BMC.<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 void (*handle_msg)(struct IPMIInterface *s, uint8_t msg=
_id,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0unsigned char *msg, unsigned int msg_len);<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * An IPMI Interface representing host side communication to a<br>
&gt; + * remote BMC, either simulated or an IPMI BMC client.<br>
&gt; + */<br>
&gt; +#define TYPE_IPMI_INTERFACE_HOST &quot;ipmi-interface-host&quot;<br>
&gt; +OBJECT_DECLARE_TYPE(IPMIInterfaceHost, IPMIInterfaceHostClass, \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 IPMI_INTERFACE_HOST)<br>
&gt; +<br>
&gt; +typedef struct IPMIInterfaceHostClass IPMIInterfaceHostClass;<br>
&gt; +typedef struct IPMIInterfaceHost IPMIInterfaceHost;<br>
&gt; +<br>
&gt; +struct IPMIInterfaceHostClass {<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceClass parent;<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* min_size is the requested I/O size and mus=
t be a power of 2.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* This is so PCI (or other busses) can reque=
st a bigger range.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Use 0 for the default.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 void (*init)(struct IPMIInterface *s, unsigned int min_=
size, Error **errp);<br>
&gt; +=C2=A0 =C2=A0 void (*init)(struct IPMIInterfaceHost *s, unsigned int =
min_size,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error *=
*errp);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Perform various operations on the hardware=
.=C2=A0 If checkonly is<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* true, it will return if the operation can =
be performed, but it<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* will not do the operation.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 int (*do_hw_op)(struct IPMIInterface *s, enum ipmi_op o=
p, int checkonly);<br>
&gt; +=C2=A0 =C2=A0 int (*do_hw_op)(struct IPMIInterfaceHost *s, enum ipmi_=
op op,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 int checkonly);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Enable/disable irqs on the interface when =
the BMC requests this.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 void (*set_irq_enable)(struct IPMIInterface *s, int val=
);<br>
&gt; +=C2=A0 =C2=A0 void (*set_irq_enable)(struct IPMIInterfaceHost *s, int=
 val);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Handle an event that occurred on the inter=
face, generally the.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* target writing to a register.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 void (*handle_if_event)(struct IPMIInterface *s);<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* The interfaces use this to perform certain ops<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 void (*set_atn)(struct IPMIInterface *s, int val, int i=
rq);<br>
&gt; +=C2=A0 =C2=A0 void (*handle_if_event)(struct IPMIInterfaceHost *s);<b=
r>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Got an IPMI warm/cold reset.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 void (*reset)(struct IPMIInterface *s, bool is_cold);<b=
r>
&gt; +=C2=A0 =C2=A0 void (*reset)(struct IPMIInterfaceHost *s, bool is_cold=
);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* Handle a response from the bmc.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Return the firmware info for a device.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 void (*handle_rsp)(struct IPMIInterface *s, uint8_t msg=
_id,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0unsigned char *rsp, unsigned int rsp_len);<br>
&gt; +=C2=A0 =C2=A0 void (*get_fwinfo)(struct IPMIInterfaceHost *s, IPMIFwI=
nfo *info);<br>
&gt; +};<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* Set by the owner to hold the backend data for t=
he interface.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 void *(*get_backend_data)(struct IPMIInterface *s);<br>
&gt; +/*<br>
&gt; + * An IPMI Interface representing BMC side communication to a<br>
&gt; + * remote host running `ipmi-bmc-extern`.<br>
&gt; + */<br>
&gt; +#define TYPE_IPMI_INTERFACE_CLIENT &quot;ipmi-interface-client&quot;<=
br>
&gt; +OBJECT_DECLARE_TYPE(IPMIInterfaceClient, IPMIInterfaceClientClass,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 IPMI_INTERFACE_CLIENT)<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 /*<br>
&gt; -=C2=A0 =C2=A0 =C2=A0* Return the firmware info for a device.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 void (*get_fwinfo)(struct IPMIInterface *s, IPMIFwInfo =
*info);<br>
&gt; +typedef struct IPMIInterfaceClientClass IPMIInterfaceClientClass;<br>
&gt; +typedef struct IPMIInterfaceClient IPMIInterfaceClient;<br>
&gt; +<br>
&gt; +struct IPMIInterfaceClientClass {<br>
&gt; +=C2=A0 =C2=A0 IPMIInterfaceClass parent;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*<br>
&gt; - * Define a BMC simulator (or perhaps a connection to a real BMC)<br>
&gt; + * Define an IPMI core (Either BMC or Host simulator.)<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; -#define TYPE_IPMI_BMC &quot;ipmi-bmc&quot;<br>
&gt; -OBJECT_DECLARE_TYPE(IPMIBmc, IPMIBmcClass,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 IPMI_BMC)<br>
&gt; +#define TYPE_IPMI_CORE &quot;ipmi-core&quot;<br>
&gt; +OBJECT_DECLARE_TYPE(IPMICore, IPMICoreClass, IPMI_CORE)<br>
&gt;=C2=A0 <br>
&gt; -struct IPMIBmc {<br>
&gt; +struct IPMICore {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DeviceState parent;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 uint8_t slave_addr;<br>
&gt; -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 IPMIInterface *intf;<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; -struct IPMIBmcClass {<br>
&gt; +struct IPMICoreClass {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 DeviceClass parent;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 /* Called when the system resets to report to the bmc. =
*/<br>
&gt; -=C2=A0 =C2=A0 void (*handle_reset)(struct IPMIBmc *s);<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* Handle a hardware command.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 void (*handle_hw_op)(struct IPMICore *s, uint8_t hw_op,=
 uint8_t operand);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0* Handle a command to the bmc.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; -=C2=A0 =C2=A0 void (*handle_command)(struct IPMIBmc *s,<br>
&gt; +=C2=A0 =C2=A0 void (*handle_command)(struct IPMICore *s,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t *cmd, unsigned int cmd_len,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned int max_cmd_len,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t msg_id);<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +/*<br>
&gt; + * Define a BMC simulator (or perhaps a connection to a real BMC)<br>
&gt; + */<br>
&gt; +#define TYPE_IPMI_BMC_HOST &quot;ipmi-bmc-host&quot;<br>
&gt; +OBJECT_DECLARE_TYPE(IPMIBmcHost, IPMIBmcHostClass, IPMI_BMC_HOST)<br>
&gt; +<br>
&gt; +struct IPMIBmcHost {<br>
&gt; +=C2=A0 =C2=A0 IPMICore parent;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 uint8_t slave_addr;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct IPMIBmcHostClass {<br>
&gt; +=C2=A0 =C2=A0 IPMICoreClass parent;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 /* Called when the system resets to report to the bmc. =
*/<br>
&gt; +=C2=A0 =C2=A0 void (*handle_reset)(struct IPMIBmcHost *s);<br>
&gt; +<br>
&gt; +};<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Define a BMC side client that responds to an `ipmi-bmc-extern`.<br=
>
&gt; + */<br>
&gt; +#define TYPE_IPMI_BMC_CLIENT &quot;ipmi-bmc-client&quot;<br>
&gt; +OBJECT_DECLARE_SIMPLE_TYPE(IPMIBmcClient, IPMI_BMC_CLIENT)<br>
&gt; +struct IPMIBmcClient {<br>
&gt; +=C2=A0 =C2=A0 IPMICore parent;<br>
&gt; +};<br>
&gt; +<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* Add a link property to obj that points to a BMC.<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; @@ -259,9 +316,9 @@ struct ipmi_sdr_compact {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 typedef uint8_t ipmi_sdr_compact_buffer[sizeof(struct ipmi_sdr_c=
ompact)];<br>
&gt;=C2=A0 <br>
&gt; -int ipmi_bmc_sdr_find(IPMIBmc *b, uint16_t recid,<br>
&gt; +int ipmi_bmc_sdr_find(IPMIBmcHost *b, uint16_t recid,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 const struct ipmi_sdr_compact **sdr, uint16_t *nextrec);<br>
&gt; -void ipmi_bmc_gen_event(IPMIBmc *b, uint8_t *evt, bool log);<br>
&gt; +void ipmi_bmc_gen_event(IPMIBmcHost *b, uint8_t *evt, bool log);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #define TYPE_IPMI_BMC_SIMULATOR &quot;ipmi-bmc-sim&quot;<br>
&gt;=C2=A0 OBJECT_DECLARE_SIMPLE_TYPE(IPMIBmcSim, IPMI_BMC_SIMULATOR)<br>
&gt; diff --git a/include/hw/ipmi/ipmi_bt.h b/include/hw/ipmi/ipmi_bt.h<br>
&gt; index 8a4316ea7c..237dbb4599 100644<br>
&gt; --- a/include/hw/ipmi/ipmi_bt.h<br>
&gt; +++ b/include/hw/ipmi/ipmi_bt.h<br>
&gt; @@ -28,7 +28,7 @@<br>
&gt;=C2=A0 #include &quot;hw/ipmi/ipmi.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 typedef struct IPMIBT {<br>
&gt; -=C2=A0 =C2=A0 IPMIBmc *bmc;<br>
&gt; +=C2=A0 =C2=A0 IPMIBmcHost *bmc;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool do_wake;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/include/hw/ipmi/ipmi_kcs.h b/include/hw/ipmi/ipmi_kcs.h<b=
r>
&gt; index 6e6ef4c539..1f491b7243 100644<br>
&gt; --- a/include/hw/ipmi/ipmi_kcs.h<br>
&gt; +++ b/include/hw/ipmi/ipmi_kcs.h<br>
&gt; @@ -28,7 +28,7 @@<br>
&gt;=C2=A0 #include &quot;hw/ipmi/ipmi.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 typedef struct IPMIKCS {<br>
&gt; -=C2=A0 =C2=A0 IPMIBmc *bmc;<br>
&gt; +=C2=A0 =C2=A0 IPMIBmcHost *bmc;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 bool do_wake;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/include/hw/ppc/pnv.h b/include/hw/ppc/pnv.h<br>
&gt; index 409f3bf763..b712a7e8d5 100644<br>
&gt; --- a/include/hw/ppc/pnv.h<br>
&gt; +++ b/include/hw/ppc/pnv.h<br>
&gt; @@ -91,7 +91,7 @@ struct PnvMachineState {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ISABus=C2=A0 =C2=A0 =C2=A0 =C2=A0*isa_bus;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint32_t=C2=A0 =C2=A0 =C2=A0cpld_irqstate;<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 IPMIBmc=C2=A0 =C2=A0 =C2=A0 *bmc;<br>
&gt; +=C2=A0 =C2=A0 IPMIBmcHost=C2=A0 *bmc;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 Notifier=C2=A0 =C2=A0 =C2=A0powerdown_notifier;<br=
>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 PnvPnor=C2=A0 =C2=A0 =C2=A0 *pnor;<br>
&gt; @@ -108,11 +108,11 @@ PnvChip *pnv_chip_add_phb(PnvChip *chip, PnvPHB =
*phb);<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* BMC helpers<br>
&gt;=C2=A0 =C2=A0*/<br>
&gt; -void pnv_dt_bmc_sensors(IPMIBmc *bmc, void *fdt);<br>
&gt; -void pnv_bmc_powerdown(IPMIBmc *bmc);<br>
&gt; -IPMIBmc *pnv_bmc_create(PnvPnor *pnor);<br>
&gt; -IPMIBmc *pnv_bmc_find(Error **errp);<br>
&gt; -void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor);<br>
&gt; +void pnv_dt_bmc_sensors(IPMIBmcHost *bmc, void *fdt);<br>
&gt; +void pnv_bmc_powerdown(IPMIBmcHost *bmc);<br>
&gt; +IPMIBmcHost *pnv_bmc_create(PnvPnor *pnor);<br>
&gt; +IPMIBmcHost *pnv_bmc_find(Error **errp);<br>
&gt; +void pnv_bmc_set_pnor(IPMIBmcHost *bmc, PnvPnor *pnor);<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* POWER8 MMIO base addresses<br>
&gt; -- <br>
&gt; 2.40.0.348.gf938b09366-goog<br>
&gt; <br>
</blockquote></div>

--000000000000fbb27c05f7e4cbae--

