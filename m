Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329E82D2B80
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 13:56:36 +0100 (CET)
Received: from localhost ([::1]:48566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmcXj-00019l-0K
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 07:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmcUR-0000Ud-6G
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:53:11 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:35148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1kmcUO-00089g-Mx
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 07:53:10 -0500
Received: by mail-ed1-x543.google.com with SMTP id u19so17482086edx.2
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 04:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Da7Tftl5j01a21Z0QtCp66sGEABWjRUbVaRL8qkPHJI=;
 b=UyD2VK2s0Vf/cWccAIoX7FFLr+nHsF5q9RE+wJoWdIebv/PYlpLSuDKnKOqn6T+y8r
 N1ApK35JFU7FDj5sibi9MNSkjxiBypUR4IKeawT3vHRm2j61TVzn2a5iKNPZUmjKH8c6
 cCmWgNvoLsapOmMS/QLu2cUH28+tRgx0C5oXyayuRvToiPzkp4cVwVSJQIlorj84Oob0
 MCcwjPCIOD4PNO1OBDhrVTeeHxRpA1ayd3spPFMVIvxtDutjOVMLAqqEoMPw8ean+luo
 hFlvYhFmfr9iun95y/ogsH4LxwqmasqIU8T1Qw2MT/y3tbjypSKUlBU3pjpvO7Tp8Umc
 Hibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Da7Tftl5j01a21Z0QtCp66sGEABWjRUbVaRL8qkPHJI=;
 b=EGf2aAz74xNFAPjXy+M+qQZjayfX5mMaBTvSMToxhEPxfOkNOGR486xxokdm91E/as
 vibhvGvera6/DOdl9tc0MhWChYI34/RdjfXEJK87BhSoHqEK9aKapxHX+84QPFICIsD2
 9OiFPyXYdbuNsvMvEiryfAGa/DklKXzFzJktn5WKHktP8j2NrQonLFli9uTgmjTtZ+tn
 lvlpgyomWO4j7ybx+EFNIS2xj3C6loE/Y3cUt+rjbsguTDPuwh7zUGon3siJqns7O5gY
 Qv1QL6C8KQPb1JTFXD4jW4rJ9N+Et8sd8ToyuXrTueaLMeqos/sXdYfyeLbUENXz0enT
 AE+w==
X-Gm-Message-State: AOAM532wp0OI7TYnYxqxoraLnGYi02RTYXLwrlFy0KVMC5PFwgoAy3W4
 Pwkcpp5a2PZ9//2F3Po3Td3ZZRlCKeg0YOrJKuk=
X-Google-Smtp-Source: ABdhPJwPY/5aMLSZxesUjjsecjX0kQoDbHIfTecipV7tlcwX95mEm20EDrixJ4I4oSdMXGSG0UfU7BBngQ0r3EXtLM4=
X-Received: by 2002:aa7:c558:: with SMTP id s24mr24777776edr.257.1607431985185; 
 Tue, 08 Dec 2020 04:53:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1606853298.git.jag.raman@oracle.com>
 <67d558deedfeb3d331e013edd857b2d193e8617e.1606853298.git.jag.raman@oracle.com>
In-Reply-To: <67d558deedfeb3d331e013edd857b2d193e8617e.1606853298.git.jag.raman@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 8 Dec 2020 16:52:53 +0400
Message-ID: <CAJ+F1CKD34SuaPYQNHSvnqKn-FJO7bPU3-+Daat4LJWRhgn52g@mail.gmail.com>
Subject: Re: [PATCH v12 14/19] multi-process: Forward PCI config space acceses
 to the remote process
To: Jagannathan Raman <jag.raman@oracle.com>
Content-Type: multipart/alternative; boundary="0000000000007a47fc05b5f36ca8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x543.google.com
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>, Fam Zheng <fam@euphon.net>,
 Swapnil Ingle <swapnil.ingle@nutanix.com>,
 John G Johnson <john.g.johnson@oracle.com>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Kanth Ghatraju <kanth.ghatraju@oracle.com>,
 Felipe Franciosi <felipe@nutanix.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Thanos Makatos <thanos.makatos@nutanix.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007a47fc05b5f36ca8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Dec 2, 2020 at 12:25 AM Jagannathan Raman <jag.raman@oracle.com>
wrote:

> From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
>
> The Proxy Object sends the PCI config space accesses as messages
> to the remote process over the communication channel
>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/hw/remote/mpqemu-link.h |  9 ++++++
>  hw/remote/message.c             | 62
> +++++++++++++++++++++++++++++++++++++++++
>  hw/remote/mpqemu-link.c         |  6 ++++
>  hw/remote/proxy.c               | 51 +++++++++++++++++++++++++++++++++
>  4 files changed, 128 insertions(+)
>
> diff --git a/include/hw/remote/mpqemu-link.h
> b/include/hw/remote/mpqemu-link.h
> index cee9468..057c98b 100644
> --- a/include/hw/remote/mpqemu-link.h
> +++ b/include/hw/remote/mpqemu-link.h
> @@ -34,6 +34,8 @@ typedef enum {
>      MPQEMU_CMD_INIT,
>      SYNC_SYSMEM,
>      RET_MSG,
> +    PCI_CONFIG_WRITE,
> +    PCI_CONFIG_READ,
>      MPQEMU_CMD_MAX,
>

It would be a good idea to prefix all enums with MQEMU_CMD.

 } MPQemuCmd;
>
> @@ -43,6 +45,12 @@ typedef struct {
>      off_t offsets[REMOTE_MAX_FDS];
>  } SyncSysmemMsg;
>
> +typedef struct {
> +    uint32_t addr;
> +    uint32_t val;
> +    int l;
>

"len" please, it's already short enough :)

+} PciConfDataMsg;
> +
>  /**
>   * MPQemuMsg:
>   * @cmd: The remote command
> @@ -60,6 +68,7 @@ typedef struct {
>
>      union {
>          uint64_t u64;
> +        PciConfDataMsg pci_conf_data;
>          SyncSysmemMsg sync_sysmem;
>      } data;
>
> diff --git a/hw/remote/message.c b/hw/remote/message.c
> index 1f2edc7..52a6f6f 100644
> --- a/hw/remote/message.c
> +++ b/hw/remote/message.c
> @@ -15,6 +15,12 @@
>  #include "hw/remote/mpqemu-link.h"
>  #include "qapi/error.h"
>  #include "sysemu/runstate.h"
> +#include "hw/pci/pci.h"
> +
> +static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
> +                                 MPQemuMsg *msg);
> +static void process_config_read(QIOChannel *ioc, PCIDevice *dev,
> +                                MPQemuMsg *msg);
>
>  void coroutine_fn mpqemu_remote_msg_loop_co(void *data)
>  {
> @@ -43,6 +49,12 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data=
)
>          }
>
>          switch (msg.cmd) {
> +        case PCI_CONFIG_WRITE:
> +            process_config_write(com->ioc, pci_dev, &msg);
> +            break;
>

Some other process_ functions take &local_err. I think this is a better
idea, so error reporting is done in a single place from
mpqemu_remote_msg_loop_co() for now

+        case PCI_CONFIG_READ:
> +            process_config_read(com->ioc, pci_dev, &msg);
> +            break;
>          default:
>              error_setg(&local_err,
>                         "Unknown command (%d) received for device %s
> (pid=3D%d)",
> @@ -60,3 +72,53 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data=
)
>
>      return;
>  }
> +
> +static void process_config_write(QIOChannel *ioc, PCIDevice *dev,
> +                                 MPQemuMsg *msg)
> +{
> +    PciConfDataMsg *conf =3D (PciConfDataMsg *)&msg->data.pci_conf_data;
> +    MPQemuMsg ret =3D { 0 };
> +    Error *local_err =3D NULL;
> +
> +    if ((conf->addr + sizeof(conf->val)) > pci_config_size(dev)) {
> +        error_report("Bad address received when writing PCI config, pid
> %d",
> +                     getpid());
>

Should use FMT_pid.

But then, I am not sure some error messages should have PID, while most of
them dont. That should be either the job of a log manager, or a custom
logger function/option.

+        ret.data.u64 =3D UINT64_MAX;
> +    } else {
> +        pci_default_write_config(dev, conf->addr, conf->val, conf->l);
> +    }
> +
> +    ret.cmd =3D RET_MSG;
> +    ret.size =3D sizeof(ret.data.u64);
> +
> +    mpqemu_msg_send(&ret, ioc, &local_err);
> +    if (local_err) {
> +        error_report("Could not send message to proxy from pid %d",
> +                     getpid());
>

Here it leaks local_err, and ignores it. Use error_prepend instead?

+    }
> +}
> +
> +static void process_config_read(QIOChannel *ioc, PCIDevice *dev,
> +                                MPQemuMsg *msg)
> +{
> +    PciConfDataMsg *conf =3D (PciConfDataMsg *)&msg->data.pci_conf_data;
> +    MPQemuMsg ret =3D { 0 };
> +    Error *local_err =3D NULL;
> +
> +    if ((conf->addr + sizeof(conf->val)) > pci_config_size(dev)) {
> +        error_report("Bad address received when reading PCI config, pid
> %d",
> +                     getpid());
> +        ret.data.u64 =3D UINT64_MAX;
> +    } else {
> +        ret.data.u64 =3D pci_default_read_config(dev, conf->addr, conf->=
l);
> +    }
> +
> +    ret.cmd =3D RET_MSG;
> +    ret.size =3D sizeof(ret.data.u64);
> +
> +    mpqemu_msg_send(&ret, ioc, &local_err);
> +    if (local_err) {
> +        error_report("Could not send message to proxy from pid %d",
> +                     getpid());
>

Same as earlier

+    }
> +}
> diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c
> index 18c8a54..83dbd65 100644
> --- a/hw/remote/mpqemu-link.c
> +++ b/hw/remote/mpqemu-link.c
> @@ -283,6 +283,12 @@ bool mpqemu_msg_valid(MPQemuMsg *msg)
>              return false;
>          }
>          break;
> +    case PCI_CONFIG_WRITE:
> +    case PCI_CONFIG_READ:
> +        if (msg->size !=3D sizeof(PciConfDataMsg)) {
> +            return false;
> +        }
> +        break;
>      default:
>          break;
>      }
> diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
> index 29100bc..c193484 100644
> --- a/hw/remote/proxy.c
> +++ b/hw/remote/proxy.c
> @@ -16,6 +16,8 @@
>  #include "hw/qdev-properties.h"
>  #include "monitor/monitor.h"
>  #include "migration/blocker.h"
> +#include "hw/remote/mpqemu-link.h"
> +#include "qemu/error-report.h"
>
>  static void proxy_set_socket(PCIProxyDev *pdev, int fd, Error **errp)
>  {
> @@ -69,6 +71,52 @@ static void pci_proxy_dev_exit(PCIDevice *pdev)
>      error_free(dev->migration_blocker);
>  }
>
> +static int config_op_send(PCIProxyDev *pdev, uint32_t addr, uint32_t *va=
l,
> +                          int l, unsigned int op)
> +{
> +    MPQemuMsg msg =3D { 0 };
> +    uint64_t ret =3D -EINVAL;
> +    Error *local_err =3D NULL;
> +
> +    msg.cmd =3D op;
> +    msg.data.pci_conf_data.addr =3D addr;
> +    msg.data.pci_conf_data.val =3D (op =3D=3D PCI_CONFIG_WRITE) ? *val :=
 0;
> +    msg.data.pci_conf_data.l =3D l;
> +    msg.size =3D sizeof(PciConfDataMsg);
> +
> +    ret =3D mpqemu_msg_send_and_await_reply(&msg, pdev, &local_err);
> +    if (local_err) {
> +        error_report_err(local_err);
> +    }
> +    if (op =3D=3D PCI_CONFIG_READ) {
> +        *val =3D (uint32_t)ret;
>

That's a suspicious cast, without error checking.

+    }
> +
> +    return ret;
> +}
> +
> +static uint32_t pci_proxy_read_config(PCIDevice *d, uint32_t addr, int
> len)
> +{
> +    uint32_t val;
> +
> +    (void)config_op_send(PCI_PROXY_DEV(d), addr, &val, len,
> PCI_CONFIG_READ);
>

I don't know why (void)cast here, please enlighten me

+
> +    return val;
> +}
> +
> +static void pci_proxy_write_config(PCIDevice *d, uint32_t addr, uint32_t
> val,
> +                                   int l)
> +{
> +    /*
> +     * Some of the functions access the copy of remote device's PCI conf=
ig
> +     * space which is cached in the proxy device. Therefore, maintain
> +     * it updated.
> +     */
> +    pci_default_write_config(d, addr, val, l);
> +
> +    (void)config_op_send(PCI_PROXY_DEV(d), addr, &val, l,
> PCI_CONFIG_WRITE);
>

again

+}
> +
>  static void pci_proxy_dev_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(klass);
> @@ -76,6 +124,9 @@ static void pci_proxy_dev_class_init(ObjectClass
> *klass, void *data)
>
>      k->realize =3D pci_proxy_dev_realize;
>      k->exit =3D pci_proxy_dev_exit;
> +    k->config_read =3D pci_proxy_read_config;
> +    k->config_write =3D pci_proxy_write_config;
> +
>      device_class_set_props(dc, proxy_properties);
>  }
>
> --
> 1.8.3.1
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000007a47fc05b5f36ca8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 2, 2020 at 12:25 AM Jag=
annathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com">jag.raman@oracle=
.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">From: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle.com"=
 target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
<br>
The Proxy Object sends the PCI config space accesses as messages<br>
to the remote process over the communication channel<br>
<br>
Signed-off-by: Elena Ufimtseva &lt;<a href=3D"mailto:elena.ufimtseva@oracle=
.com" target=3D"_blank">elena.ufimtseva@oracle.com</a>&gt;<br>
Signed-off-by: Jagannathan Raman &lt;<a href=3D"mailto:jag.raman@oracle.com=
" target=3D"_blank">jag.raman@oracle.com</a>&gt;<br>
Signed-off-by: John G Johnson &lt;<a href=3D"mailto:john.g.johnson@oracle.c=
om" target=3D"_blank">john.g.johnson@oracle.com</a>&gt;<br>
Reviewed-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" tar=
get=3D"_blank">stefanha@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/hw/remote/mpqemu-link.h |=C2=A0 9 ++++++<br>
=C2=A0hw/remote/message.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
62 +++++++++++++++++++++++++++++++++++++++++<br>
=C2=A0hw/remote/mpqemu-link.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 ++=
++<br>
=C2=A0hw/remote/proxy.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 51 +++++++++++++++++++++++++++++++++<br>
=C2=A04 files changed, 128 insertions(+)<br>
<br>
diff --git a/include/hw/remote/mpqemu-link.h b/include/hw/remote/mpqemu-lin=
k.h<br>
index cee9468..057c98b 100644<br>
--- a/include/hw/remote/mpqemu-link.h<br>
+++ b/include/hw/remote/mpqemu-link.h<br>
@@ -34,6 +34,8 @@ typedef enum {<br>
=C2=A0 =C2=A0 =C2=A0MPQEMU_CMD_INIT,<br>
=C2=A0 =C2=A0 =C2=A0SYNC_SYSMEM,<br>
=C2=A0 =C2=A0 =C2=A0RET_MSG,<br>
+=C2=A0 =C2=A0 PCI_CONFIG_WRITE,<br>
+=C2=A0 =C2=A0 PCI_CONFIG_READ,<br>
=C2=A0 =C2=A0 =C2=A0MPQEMU_CMD_MAX,<br></blockquote><div><br></div><div>It =
would be a good idea to prefix all enums with MQEMU_CMD.</div><div> <br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0} MPQemuCmd;<br>
<br>
@@ -43,6 +45,12 @@ typedef struct {<br>
=C2=A0 =C2=A0 =C2=A0off_t offsets[REMOTE_MAX_FDS];<br>
=C2=A0} SyncSysmemMsg;<br>
<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 uint32_t addr;<br>
+=C2=A0 =C2=A0 uint32_t val;<br>
+=C2=A0 =C2=A0 int l;<br></blockquote><div><br></div><div>&quot;len&quot; p=
lease, it&#39;s already short enough :)<br></div><div> <br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
+} PciConfDataMsg;<br>
+<br>
=C2=A0/**<br>
=C2=A0 * MPQemuMsg:<br>
=C2=A0 * @cmd: The remote command<br>
@@ -60,6 +68,7 @@ typedef struct {<br>
<br>
=C2=A0 =C2=A0 =C2=A0union {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t u64;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 PciConfDataMsg pci_conf_data;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SyncSysmemMsg sync_sysmem;<br>
=C2=A0 =C2=A0 =C2=A0} data;<br>
<br>
diff --git a/hw/remote/message.c b/hw/remote/message.c<br>
index 1f2edc7..52a6f6f 100644<br>
--- a/hw/remote/message.c<br>
+++ b/hw/remote/message.c<br>
@@ -15,6 +15,12 @@<br>
=C2=A0#include &quot;hw/remote/mpqemu-link.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;sysemu/runstate.h&quot;<br>
+#include &quot;hw/pci/pci.h&quot;<br>
+<br>
+static void process_config_write(QIOChannel *ioc, PCIDevice *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MPQemuMsg *msg);<br>
+static void process_config_read(QIOChannel *ioc, PCIDevice *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MPQemuMsg *msg);<br>
<br>
=C2=A0void coroutine_fn mpqemu_remote_msg_loop_co(void *data)<br>
=C2=A0{<br>
@@ -43,6 +49,12 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (msg.cmd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case PCI_CONFIG_WRITE:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 process_config_write(com-&gt;ioc=
, pci_dev, &amp;msg);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br></blockquote><div><br>=
</div><div>Some other process_ functions take &amp;local_err. I think this =
is a better idea, so error reporting is done in a single place from mpqemu_=
remote_msg_loop_co() for now<br></div><div> <br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 case PCI_CONFIG_READ:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 process_config_read(com-&gt;ioc,=
 pci_dev, &amp;msg);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error_setg(&amp;local_err,<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &quot;Unknown command (%d) received for device %s (pid=3D%d)&quo=
t;,<br>
@@ -60,3 +72,53 @@ void coroutine_fn mpqemu_remote_msg_loop_co(void *data)<=
br>
<br>
=C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0}<br>
+<br>
+static void process_config_write(QIOChannel *ioc, PCIDevice *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MPQemuMsg *msg)<br>
+{<br>
+=C2=A0 =C2=A0 PciConfDataMsg *conf =3D (PciConfDataMsg *)&amp;msg-&gt;data=
.pci_conf_data;<br>
+=C2=A0 =C2=A0 MPQemuMsg ret =3D { 0 };<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 if ((conf-&gt;addr + sizeof(conf-&gt;val)) &gt; pci_config_s=
ize(dev)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Bad address received when w=
riting PCI config, pid %d&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0getpid());<br></blockquote><div><br></div><div>Should use FMT_pid.</div>=
<div><br></div><div>But then, I am not sure some error messages should have=
 PID, while most of them dont. That should be either the job of a log manag=
er, or a custom logger function/option.<br></div><div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.data.u64 =3D UINT64_MAX;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pci_default_write_config(dev, conf-&gt;addr, c=
onf-&gt;val, conf-&gt;l);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ret.cmd =3D RET_MSG;<br>
+=C2=A0 =C2=A0 ret.size =3D sizeof(ret.data.u64);<br>
+<br>
+=C2=A0 =C2=A0 mpqemu_msg_send(&amp;ret, ioc, &amp;local_err);<br>
+=C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Could not send message to p=
roxy from pid %d&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0getpid());<br></blockquote><div><br></div><div>Here it leaks local_err, =
and ignores it. Use error_prepend instead?<br></div><div> <br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void process_config_read(QIOChannel *ioc, PCIDevice *dev,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MPQemuMsg *msg)<br>
+{<br>
+=C2=A0 =C2=A0 PciConfDataMsg *conf =3D (PciConfDataMsg *)&amp;msg-&gt;data=
.pci_conf_data;<br>
+=C2=A0 =C2=A0 MPQemuMsg ret =3D { 0 };<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 if ((conf-&gt;addr + sizeof(conf-&gt;val)) &gt; pci_config_s=
ize(dev)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Bad address received when r=
eading PCI config, pid %d&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0getpid());<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.data.u64 =3D UINT64_MAX;<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.data.u64 =3D pci_default_read_config(dev, =
conf-&gt;addr, conf-&gt;l);<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 ret.cmd =3D RET_MSG;<br>
+=C2=A0 =C2=A0 ret.size =3D sizeof(ret.data.u64);<br>
+<br>
+=C2=A0 =C2=A0 mpqemu_msg_send(&amp;ret, ioc, &amp;local_err);<br>
+=C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;Could not send message to p=
roxy from pid %d&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0getpid());<br></blockquote><div><br></div><div>Same as earlier</div><div=
> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 }<br>
+}<br>
diff --git a/hw/remote/mpqemu-link.c b/hw/remote/mpqemu-link.c<br>
index 18c8a54..83dbd65 100644<br>
--- a/hw/remote/mpqemu-link.c<br>
+++ b/hw/remote/mpqemu-link.c<br>
@@ -283,6 +283,12 @@ bool mpqemu_msg_valid(MPQemuMsg *msg)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 case PCI_CONFIG_WRITE:<br>
+=C2=A0 =C2=A0 case PCI_CONFIG_READ:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (msg-&gt;size !=3D sizeof(PciConfDataMsg)) =
{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0default:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c<br>
index 29100bc..c193484 100644<br>
--- a/hw/remote/proxy.c<br>
+++ b/hw/remote/proxy.c<br>
@@ -16,6 +16,8 @@<br>
=C2=A0#include &quot;hw/qdev-properties.h&quot;<br>
=C2=A0#include &quot;monitor/monitor.h&quot;<br>
=C2=A0#include &quot;migration/blocker.h&quot;<br>
+#include &quot;hw/remote/mpqemu-link.h&quot;<br>
+#include &quot;qemu/error-report.h&quot;<br>
<br>
=C2=A0static void proxy_set_socket(PCIProxyDev *pdev, int fd, Error **errp)=
<br>
=C2=A0{<br>
@@ -69,6 +71,52 @@ static void pci_proxy_dev_exit(PCIDevice *pdev)<br>
=C2=A0 =C2=A0 =C2=A0error_free(dev-&gt;migration_blocker);<br>
=C2=A0}<br>
<br>
+static int config_op_send(PCIProxyDev *pdev, uint32_t addr, uint32_t *val,=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 int l, unsigned int op)<br>
+{<br>
+=C2=A0 =C2=A0 MPQemuMsg msg =3D { 0 };<br>
+=C2=A0 =C2=A0 uint64_t ret =3D -EINVAL;<br>
+=C2=A0 =C2=A0 Error *local_err =3D NULL;<br>
+<br>
+=C2=A0 =C2=A0 msg.cmd =3D op;<br>
+=C2=A0 =C2=A0 msg.data.pci_conf_data.addr =3D addr;<br>
+=C2=A0 =C2=A0 msg.data.pci_conf_data.val =3D (op =3D=3D PCI_CONFIG_WRITE) =
? *val : 0;<br>
+=C2=A0 =C2=A0 msg.data.pci_conf_data.l =3D l;<br>
+=C2=A0 =C2=A0 msg.size =3D sizeof(PciConfDataMsg);<br>
+<br>
+=C2=A0 =C2=A0 ret =3D mpqemu_msg_send_and_await_reply(&amp;msg, pdev, &amp=
;local_err);<br>
+=C2=A0 =C2=A0 if (local_err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report_err(local_err);<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 if (op =3D=3D PCI_CONFIG_READ) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 *val =3D (uint32_t)ret;<br></blockquote><div><=
br></div><div>That&#39;s a suspicious cast, without error checking.</div><d=
iv> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 return ret;<br>
+}<br>
+<br>
+static uint32_t pci_proxy_read_config(PCIDevice *d, uint32_t addr, int len=
)<br>
+{<br>
+=C2=A0 =C2=A0 uint32_t val;<br>
+<br>
+=C2=A0 =C2=A0 (void)config_op_send(PCI_PROXY_DEV(d), addr, &amp;val, len, =
PCI_CONFIG_READ);<br></blockquote><div><br></div><div>I don&#39;t know why =
(void)cast here, please enlighten me<br></div><div> <br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 return val;<br>
+}<br>
+<br>
+static void pci_proxy_write_config(PCIDevice *d, uint32_t addr, uint32_t v=
al,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int l)<br>
+{<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Some of the functions access the copy of remote devi=
ce&#39;s PCI config<br>
+=C2=A0 =C2=A0 =C2=A0* space which is cached in the proxy device. Therefore=
, maintain<br>
+=C2=A0 =C2=A0 =C2=A0* it updated.<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 pci_default_write_config(d, addr, val, l);<br>
+<br>
+=C2=A0 =C2=A0 (void)config_op_send(PCI_PROXY_DEV(d), addr, &amp;val, l, PC=
I_CONFIG_WRITE);<br></blockquote><div><br></div><div>again</div><div> <br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
+}<br>
+<br>
=C2=A0static void pci_proxy_dev_class_init(ObjectClass *klass, void *data)<=
br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
@@ -76,6 +124,9 @@ static void pci_proxy_dev_class_init(ObjectClass *klass,=
 void *data)<br>
<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;realize =3D pci_proxy_dev_realize;<br>
=C2=A0 =C2=A0 =C2=A0k-&gt;exit =3D pci_proxy_dev_exit;<br>
+=C2=A0 =C2=A0 k-&gt;config_read =3D pci_proxy_read_config;<br>
+=C2=A0 =C2=A0 k-&gt;config_write =3D pci_proxy_write_config;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0device_class_set_props(dc, proxy_properties);<br>
=C2=A0}<br>
<br>
-- <br>
1.8.3.1<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000007a47fc05b5f36ca8--

