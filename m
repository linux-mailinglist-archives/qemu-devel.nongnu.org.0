Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F71B4D9044
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 00:19:52 +0100 (CET)
Received: from localhost ([::1]:40516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTtyh-0003Pb-3j
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 19:19:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nTtxd-0002IM-Gd
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 19:18:45 -0400
Received: from [2607:f8b0:4864:20::1132] (port=46166
 helo=mail-yw1-x1132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vladislav.yaroshchuk@jetbrains.com>)
 id 1nTtxY-0008LR-Uy
 for qemu-devel@nongnu.org; Mon, 14 Mar 2022 19:18:45 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-2e2ca8d7812so121344907b3.13
 for <qemu-devel@nongnu.org>; Mon, 14 Mar 2022 16:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jetbrains.com; s=googleapps;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VJEGx/q17GBYgxF9XT6bjAZtAHwvPyAKy1fl800Afu8=;
 b=dJDK/c8igdYE08pI0JD87LgBRRGBIkOfIXlZNs4SKnPDReAgpftYa3y4urFcEzCA7L
 rBK1yt/EufyLwUnd4dWkYF08bQHlQOgSOPriSq6iFjOZoc3RIIRbyvhbjXQHgtSPSEh4
 JBJHmR7WTWGjTgJbx9LF/dAm6m74ZrYVbLQiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VJEGx/q17GBYgxF9XT6bjAZtAHwvPyAKy1fl800Afu8=;
 b=K+SsuWasgzb/PrtQM3C6hpfUFKTTm9vSD8RQ7PNN8sydJ1Xhjy4+jed/ITFcbYH/vT
 Wn73jPrbNoi8OvqNkhe9HZaV26VoyM+bAGZnGQAWtpAkOx2SSID1jsJQxL5lQei1Fef+
 RQUmxRskPZFfkfoRfMvQu+32Jpd1fIvXzi/qStCooaGNyvPhgJSWmYv9uWJikY+ueLuU
 N+EsSafB57s9EbCXzQEVGSzT5Crh9n7U60+TPW/vuoFdk7y24F5dCZhZut65Zp7+Kd8P
 1NtkDkznbwkDIoL2vg2TXsS04EaTQSOPkgfMMY3oszLJ191YwV4dsyNGgROKLpRJ/uOs
 2G2w==
X-Gm-Message-State: AOAM531YK2MF0M4uKpoDHzThtItt6quQoCFaDaLI+ZUccY2JdGXs/ogl
 iM2tPVpw006p+QyIEYdwLYevBBXgmJYASqbjaMfY7w==
X-Google-Smtp-Source: ABdhPJzxt0GFB91B24OkbXy1+ZoiKVo6SKnTXZZixmdPPrSSqGPNzKEwi4P/AzPxndCH6taleva5tJ9qCw4OgEnb0Q8=
X-Received: by 2002:a81:6a42:0:b0:2dc:6bb:9c1e with SMTP id
 f63-20020a816a42000000b002dc06bb9c1emr21460044ywc.89.1647299919599; Mon, 14
 Mar 2022 16:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220314191545.81861-1-Vladislav.Yaroshchuk@jetbrains.com>
 <20220314191545.81861-4-Vladislav.Yaroshchuk@jetbrains.com>
 <f050ce26-4cff-82c9-33f6-8532ecb8b6dc@gmail.com>
 <CAGmdLqT5Ka4=_P-tKHquimfYd_f4S7XeajUieKjyQ8sFqX33ig@mail.gmail.com>
 <55e7af6a-ca93-9c4f-2c1e-2f9f87a64e53@gmail.com>
 <CAGmdLqR7vCuxfKOnDb-mQ1cEkih2C+pci50OtxNDzUAVXhszSA@mail.gmail.com>
 <a30b634f-0db1-7839-5827-9be48527c802@gmail.com>
In-Reply-To: <a30b634f-0db1-7839-5827-9be48527c802@gmail.com>
From: Vladislav Yaroshchuk <vladislav.yaroshchuk@jetbrains.com>
Date: Tue, 15 Mar 2022 02:18:27 +0300
Message-ID: <CAGmdLqQM_80=gFaY=nbdcu_PhU-n0ShXH62ZebCPBNUR5807jA@mail.gmail.com>
Subject: Re: [PATCH v16 3/7] net/vmnet: implement shared mode (vmnet-shared)
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Cc: qemu Developers <qemu-devel@nongnu.org>, Jason Wang <jasowang@redhat.com>, 
 Roman Bolshakov <r.bolshakov@yadro.com>, Eric Blake <eblake@redhat.com>,
 phillip.ennen@gmail.com, 
 Phillip Tennen <phillip@axleos.com>, Markus Armbruster <armbru@redhat.com>, 
 Howard Spoelstra <hsp.cat7@gmail.com>, Alessio Dionisi <hello@adns.io>,
 Roman Bolshakov <roman@roolebo.dev>, 
 Peter Maydell <peter.maydell@linaro.org>, Cameron Esfahani <dirty@apple.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Alexander Graf <agraf@csgraf.de>, Gerd Hoffmann <kraxel@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: multipart/alternative; boundary="0000000000008bf6f805da35e60d"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=vladislav.yaroshchuk@jetbrains.com;
 helo=mail-yw1-x1132.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008bf6f805da35e60d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 15 =D0=BC=D0=B0=D1=80. 2022 =D0=B3., 2:06 AM Akihiko Odaki <a=
kihiko.odaki@gmail.com>:

> On 2022/03/15 8:02, Vladislav Yaroshchuk wrote:
> >
> >
> > =D0=B2=D1=82, 15 =D0=BC=D0=B0=D1=80. 2022 =D0=B3., 1:34 AM Akihiko Odak=
i <akihiko.odaki@gmail.com
> > <mailto:akihiko.odaki@gmail.com>>:
> >
> >     On 2022/03/15 6:50, Vladislav Yaroshchuk wrote:
> >      > Thank you, Akihiko
> >      >
> >      > On Mon, Mar 14, 2022 at 10:46 PM Akihiko Odaki
> >     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>
> >      > <mailto:akihiko.odaki@gmail.com
> >     <mailto:akihiko.odaki@gmail.com>>> wrote:
> >      >
> >      >     On 2022/03/15 4:15, Vladislav Yaroshchuk wrote:
> >      >      > vmnet.framework supports iov, but writing more than
> >      >      > one iov into vmnet interface fails with
> >      >      > 'VMNET_INVALID_ARGUMENT'. Collecting provided iovs into
> >      >      > one and passing it to vmnet works fine. That's the
> >      >      > reason why receive_iov() left unimplemented. But it still
> >      >      > works with good enough performance having .receive()
> >      >      > implemented only.
> >      >      >
> >      >      > Signed-off-by: Phillip Tennen <phillip@axleos.com
> >     <mailto:phillip@axleos.com>
> >      >     <mailto:phillip@axleos.com <mailto:phillip@axleos.com>>>
> >      >      > Signed-off-by: Vladislav Yaroshchuk
> >      >     <Vladislav.Yaroshchuk@jetbrains.com
> >     <mailto:Vladislav.Yaroshchuk@jetbrains.com>
> >      >     <mailto:Vladislav.Yaroshchuk@jetbrains.com
> >     <mailto:Vladislav.Yaroshchuk@jetbrains.com>>>
> >      >      > ---
> >      >      >   net/vmnet-common.m | 298
> >      >     +++++++++++++++++++++++++++++++++++++++++++++
> >      >      >   net/vmnet-shared.c |  95 ++++++++++++++-
> >      >      >   net/vmnet_int.h    |  41 ++++++-
> >      >      >   3 files changed, 429 insertions(+), 5 deletions(-)
> >      >      >
> >      >      > diff --git a/net/vmnet-common.m b/net/vmnet-common.m
> >      >      > index 56612c72ce..20a33d2591 100644
> >      >      > --- a/net/vmnet-common.m
> >      >      > +++ b/net/vmnet-common.m
> >      >      > @@ -10,6 +10,8 @@
> >      >      >    */
> >      >      >
> >      >      >   #include "qemu/osdep.h"
> >      >      > +#include "qemu/main-loop.h"
> >      >      > +#include "qemu/log.h"
> >      >      >   #include "qapi/qapi-types-net.h"
> >      >      >   #include "vmnet_int.h"
> >      >      >   #include "clients.h"
> >      >      > @@ -17,4 +19,300 @@
> >      >      >   #include "qapi/error.h"
> >      >      >
> >      >      >   #include <vmnet/vmnet.h>
> >      >      > +#include <dispatch/dispatch.h>
> >      >      >
> >      >      > +static bool vmnet_qemu_send_wrapper(VmnetCommonState *s)=
;
> >      >
> >      >     The names of vmnet_qemu_send_wrapper and vmnet_send_bh does
> >     not tell
> >      >     them apart well. Since only vmnet_send_bh does reading, its
> >     name may
> >      >     include "read" to clarify that. "wrapper" in
> >     vmnet_qemu_send_wrapper
> >      >     may
> >      >     be also misleading as it does more than just calling the
> >     underlying
> >      >     QEMU
> >      >     facility, but it also updates VmnetCommonState.
> >      >
> >      >
> >      > Ok, I'll think about how to name them better.
> >      >
> >      >      > +
> >      >      > +
> >      >      > +static void vmnet_send_completed(NetClientState *nc,
> >     ssize_t len)
> >      >      > +{
> >      >      > +    VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, =
nc,
> >     nc);
> >      >      > +    /* Complete sending packets left in VmnetCommonState
> >     buffers */
> >      >      > +    s->send_enabled =3D vmnet_qemu_send_wrapper(s);
> >      >
> >      >     It must qemu_bh_schedule(s->send_bh) after
> >     vmnet_qemu_send_wrapper.
> >      >
> >      >
> >      > Agree with you, thanks.
> >      >
> >      >     Also, send_enabled flag can be removed as explained in:
> >      > https://www.mail-archive.com/qemu-devel@nongnu.org/msg873923.htm=
l
> >     <https://www.mail-archive.com/qemu-devel@nongnu.org/msg873923.html>
> >      >
> >       <https://www.mail-archive.com/qemu-devel@nongnu.org/msg873923.htm=
l
> >     <https://www.mail-archive.com/qemu-devel@nongnu.org/msg873923.html>=
>
> >      >
> >      >
> >      > Not sure about this. Values of packets_send_current_pos
> >      > and packets_send_end_pos may be equal, but QEMU may be
> >      > not ready to receive new packets - the explanation:
> >      > 1. We are sending packets to QEMU with qemu_send_packet_async:
> >      >      packets_send_current_pos =3D 0
> >      >      packets_send_end_pos =3D 5
> >      > 2. All five packets (0, 1, 2, 3, 4) have been successfully sent
> >     to QEMU,
> >      >      but qemu_send_packet_async returned 0 "no more packets" aft=
er
> >      >      the last invocation
> >      > 3. In spite of this, all five packets are sent and
> >      >      packets_send_current_pos =3D=3D packets_send_end_pos =3D=3D=
 5
> >      > 4. It seems that "pointers are equal ->  QEMU is ready", but
> actually
> >      >      it is not.
> >      >
> >      > Also, hiding QEMU "ready"/"not ready" state behind pointers is a
> >      > bad choice I think. Having a concrete flag makes this more clear=
.
> >      > It provides understandability, not complexity (imho).
> >
> >     packets_send_current_pos must not be incremented if
> >     qemu_send_packet_async returned 0. It must tell the position of the
> >     packet currently being sent.
> >
> >
> >
> >  > must be incremented
> > It cannot.
> >
> > If qemu_send_packet_async returns 0,
> > it still consumes (!) (queues internally) the packet.
> > So the packets_send_current_pos must be
> > incremented
> > to prevent sending same packet multiple times.
> >
> > The idea is simple:
> > 1. We've sent the packet - increment
> > 2. Packed is not send - not increment
> >
> > qemu_send_packet_async with 0 returned meets
> > the 1st case, because it still queues the packet.
> >
> > While the increment action is not depends on the
> > returned value, we cannot use position pointers as a
> > criteria to send more packets or not. Another state
> > storage (flag) is required.
> >
> >
> > If You are not against, I'll cover this with proper
> > documentation (comments) to simplify future support
> > and make it more clear.
>
> I forgot to note that packets_send_current_pos should be incremented in
> vmnet_send_completed instead. It would make packets_send_current_pos
> properly represent case 1.
>
>
>



The truth begins from discussion :)
I'll try to refactor and document this part a bit,
to make it more clear since it is not. Thank you!

Best regards,

Vladislav Yaroshchuk

>
> >
> > Best regards,
> >
> > Vladislav Yaroshchuk
> >
> >
> >
> >     It would not hide the state, but it would rather make it clear that
> the
> >     condition vmnet_send_bh can execute. If you see the current
> >     implementation of vmnet_send_bh, you'll find the send_enabled flag,
> but
> >     it does not tell the exact condition it requires to be enabled. You
> >     have
> >     to then jump to all assignments for the flag to know it becomes tru=
e
> >     iff
> >     every packets in the buffer are sent. It is obvious if vmnet_send_b=
h
> >     directly states `if (packets_send_current_pos <
> packets_send_end_pos)`.
> >
> >     Eliminating the flag would also remove the possiblity of forgetting
> to
> >     maintain the separate state.
> >
> >
> >      >
> >      >       > send_enabled can be eliminated. When it is enabled,
> >     packets_send_pos
> >      >       > and packets_batch_size must be equal. They must not be
> equal
> >      >       > otherwise. packets_send_pos must represent the position
> >     of the
> >      >     packet
> >      >       > which is not sent yet, possibly in the process of sendin=
g.
> >      >       > vmnet_send_completed must call qemu_send_wrapper before
> >     scheduling
> >      >       > send_bh. bh_send should do nothing if s->packets_send_po=
s
> <
> >      >       > s->packets_batch_size.
> >      >
> >      >      > +}
> >      >      > +
> >      >      > +
> >      >      > +static bool vmnet_qemu_send_wrapper(VmnetCommonState *s)=
 {
> >      >      > +    ssize_t size;
> >      >      > +
> >      >      > +    /*
> >      >      > +     * Packets to send lay in [current_pos..end_pos)
> >      >      > +     * (including current_pos, excluding end_pos)
> >      >      > +     */
> >      >      > +    while (s->packets_send_current_pos <
> >     s->packets_send_end_pos) {
> >      >      > +        size =3D qemu_send_packet_async(&s->nc,
> >      >      > +
> >      >     s->iov_buf[s->packets_send_current_pos].iov_base,
> >      >      > +
> >      >     s->packets_buf[s->packets_send_current_pos].vm_pkt_size,
> >      >      > +
> vmnet_send_completed);
> >      >      > +        ++s->packets_send_current_pos;
> >      >      > +        if (size =3D=3D 0) {
> >      >      > +            /* QEMU is not ready - wait for completion
> >     callback
> >      >     call */
> >      >      > +            return false;
> >      >      > +        }
> >      >      > +    }
> >      >      > +    return true;
> >      >      > +}
> >      >      > +
> >      >      > +
> >      >      > +static void vmnet_send_bh(void *opaque)
> >      >      > +{
> >      >      > +    NetClientState *nc =3D (NetClientState *) opaque;
> >      >      > +    VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, =
nc,
> >     nc);
> >      >      > +    struct vmpktdesc *packets =3D s->packets_buf;
> >      >      > +    vmnet_return_t status;
> >      >      > +    int i;
> >      >      > +
> >      >      > +    /*
> >      >      > +     * Do nothing if QEMU is not ready - wait
> >      >      > +     * for completion callback invocation
> >      >      > +     */
> >      >      > +    if (!s->send_enabled) {
> >      >      > +        return;
> >      >      > +    }
> >      >      > +
> >      >      > +    /* Read as many packets as present */
> >      >      > +    s->packets_send_current_pos =3D 0;
> >      >      > +    s->packets_send_end_pos =3D VMNET_PACKETS_LIMIT;
> >      >      > +    for (i =3D 0; i < s->packets_send_end_pos; ++i) {
> >      >      > +        packets[i].vm_pkt_size =3D s->max_packet_size;
> >      >      > +        packets[i].vm_pkt_iovcnt =3D 1;
> >      >      > +        packets[i].vm_flags =3D 0;
> >      >      > +    }
> >      >      > +
> >      >      > +    status =3D vmnet_read(s->vmnet_if, packets,
> >      >     &s->packets_send_end_pos);
> >      >      > +    if (status !=3D VMNET_SUCCESS) {
> >      >      > +        error_printf("vmnet: read failed: %s\n",
> >      >      > +                     vmnet_status_map_str(status));
> >      >      > +        s->packets_send_current_pos =3D 0;
> >      >      > +        s->packets_send_end_pos =3D 0;
> >      >      > +        return;
> >      >      > +    }
> >      >      > +
> >      >      > +    /* Send packets to QEMU */
> >      >      > +    s->send_enabled =3D vmnet_qemu_send_wrapper(s);
> >      >      > +}
> >      >      > +
> >      >      > +
> >      >      > +static void vmnet_bufs_init(VmnetCommonState *s)
> >      >      > +{
> >      >      > +    struct vmpktdesc *packets =3D s->packets_buf;
> >      >      > +    struct iovec *iov =3D s->iov_buf;
> >      >      > +    int i;
> >      >      > +
> >      >      > +    for (i =3D 0; i < VMNET_PACKETS_LIMIT; ++i) {
> >      >      > +        iov[i].iov_len =3D s->max_packet_size;
> >      >      > +        iov[i].iov_base =3D g_malloc0(iov[i].iov_len);
> >      >      > +        packets[i].vm_pkt_iov =3D iov + i;
> >      >      > +    }
> >      >      > +}
> >      >      > +
> >      >      > +
> >      >      > +const char *vmnet_status_map_str(vmnet_return_t status)
> >      >      > +{
> >      >      > +    switch (status) {
> >      >      > +    case VMNET_SUCCESS:
> >      >      > +        return "success";
> >      >      > +    case VMNET_FAILURE:
> >      >      > +        return "general failure (possibly not enough
> >     privileges)";
> >      >      > +    case VMNET_MEM_FAILURE:
> >      >      > +        return "memory allocation failure";
> >      >      > +    case VMNET_INVALID_ARGUMENT:
> >      >      > +        return "invalid argument specified";
> >      >      > +    case VMNET_SETUP_INCOMPLETE:
> >      >      > +        return "interface setup is not complete";
> >      >      > +    case VMNET_INVALID_ACCESS:
> >      >      > +        return "invalid access, permission denied";
> >      >      > +    case VMNET_PACKET_TOO_BIG:
> >      >      > +        return "packet size is larger than MTU";
> >      >      > +    case VMNET_BUFFER_EXHAUSTED:
> >      >      > +        return "buffers exhausted in kernel";
> >      >      > +    case VMNET_TOO_MANY_PACKETS:
> >      >      > +        return "packet count exceeds limit";
> >      >      > +#if defined(MAC_OS_VERSION_11_0) && \
> >      >      > +    MAC_OS_X_VERSION_MIN_REQUIRED >=3D MAC_OS_VERSION_11=
_0
> >      >      > +    case VMNET_SHARING_SERVICE_BUSY:
> >      >      > +        return "conflict, sharing service is in use";
> >      >      > +#endif
> >      >      > +    default:
> >      >      > +        return "unknown vmnet error";
> >      >      > +    }
> >      >      > +}
> >      >      > +
> >      >      > +
> >      >      > +int vmnet_if_create(NetClientState *nc,
> >      >      > +                    xpc_object_t if_desc,
> >      >      > +                    Error **errp)
> >      >      > +{
> >      >      > +    VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, =
nc,
> >     nc);
> >      >      > +    dispatch_semaphore_t if_created_sem =3D
> >      >     dispatch_semaphore_create(0);
> >      >      > +    __block vmnet_return_t if_status;
> >      >      > +
> >      >      > +    s->if_queue =3D dispatch_queue_create(
> >      >      > +        "org.qemu.vmnet.if_queue",
> >      >      > +        DISPATCH_QUEUE_SERIAL
> >      >      > +    );
> >      >      > +
> >      >      > +    xpc_dictionary_set_bool(
> >      >      > +        if_desc,
> >      >      > +        vmnet_allocate_mac_address_key,
> >      >      > +        false
> >      >      > +    );
> >      >      > +
> >      >      > +#ifdef DEBUG
> >      >      > +    qemu_log("vmnet.start.interface_desc:\n");
> >      >      > +    xpc_dictionary_apply(if_desc,
> >      >      > +                         ^bool(const char *k,
> >     xpc_object_t v) {
> >      >      > +                             char *desc =3D
> >     xpc_copy_description(v);
> >      >      > +                             qemu_log("  %s=3D%s\n", k,
> desc);
> >      >      > +                             free(desc);
> >      >      > +                             return true;
> >      >      > +                         });
> >      >      > +#endif /* DEBUG */
> >      >      > +
> >      >      > +    s->vmnet_if =3D vmnet_start_interface(
> >      >      > +        if_desc,
> >      >      > +        s->if_queue,
> >      >      > +        ^(vmnet_return_t status, xpc_object_t
> >     interface_param) {
> >      >      > +            if_status =3D status;
> >      >      > +            if (status !=3D VMNET_SUCCESS ||
> >     !interface_param) {
> >      >      > +                dispatch_semaphore_signal(if_created_sem=
);
> >      >      > +                return;
> >      >      > +            }
> >      >      > +
> >      >      > +#ifdef DEBUG
> >      >      > +            qemu_log("vmnet.start.interface_param:\n");
> >      >      > +            xpc_dictionary_apply(interface_param,
> >      >      > +                                 ^bool(const char *k,
> >      >     xpc_object_t v) {
> >      >      > +                                     char *desc =3D
> >      >     xpc_copy_description(v);
> >      >      > +                                     qemu_log("
> >     %s=3D%s\n", k, desc);
> >      >      > +                                     free(desc);
> >      >      > +                                     return true;
> >      >      > +                                 });
> >      >      > +#endif /* DEBUG */
> >      >      > +
> >      >      > +            s->mtu =3D xpc_dictionary_get_uint64(
> >      >      > +                interface_param,
> >      >      > +                vmnet_mtu_key);
> >      >      > +            s->max_packet_size =3D
> xpc_dictionary_get_uint64(
> >      >      > +                interface_param,
> >      >      > +                vmnet_max_packet_size_key);
> >      >      > +
> >      >      > +            dispatch_semaphore_signal(if_created_sem);
> >      >      > +        });
> >      >      > +
> >      >      > +    if (s->vmnet_if =3D=3D NULL) {
> >      >      > +        dispatch_release(s->if_queue);
> >      >      > +        dispatch_release(if_created_sem);
> >      >      > +        error_setg(errp,
> >      >      > +                   "unable to create interface with
> requested
> >      >     params");
> >      >      > +        return -1;
> >      >      > +    }
> >      >      > +
> >      >      > +    dispatch_semaphore_wait(if_created_sem,
> >     DISPATCH_TIME_FOREVER);
> >      >      > +    dispatch_release(if_created_sem);
> >      >      > +
> >      >      > +    if (if_status !=3D VMNET_SUCCESS) {
> >      >      > +        dispatch_release(s->if_queue);
> >      >      > +        error_setg(errp,
> >      >      > +                   "cannot create vmnet interface: %s",
> >      >      > +                   vmnet_status_map_str(if_status));
> >      >      > +        return -1;
> >      >      > +    }
> >      >      > +
> >      >      > +    s->send_bh =3D aio_bh_new(qemu_get_aio_context(),
> >      >     vmnet_send_bh, nc);
> >      >      > +    s->send_enabled =3D true;
> >      >      > +    vmnet_bufs_init(s);
> >      >      > +
> >      >      > +    vmnet_interface_set_event_callback(
> >      >      > +        s->vmnet_if,
> >      >      > +        VMNET_INTERFACE_PACKETS_AVAILABLE,
> >      >      > +        s->if_queue,
> >      >      > +        ^(interface_event_t event_id, xpc_object_t event=
)
> {
> >      >      > +            assert(event_id =3D=3D
> >     VMNET_INTERFACE_PACKETS_AVAILABLE);
> >      >      > +            /*
> >      >      > +             * This function is being called from a non
> qemu
> >      >     thread, so
> >      >      > +             * we only schedule a BH, and do the rest of
> >     the io
> >      >     completion
> >      >      > +             * handling from vmnet_send_bh() which runs
> in a
> >      >     qemu context.
> >      >      > +             */
> >      >      > +            qemu_bh_schedule(s->send_bh);
> >      >      > +        });
> >      >      > +
> >      >      > +    return 0;
> >      >      > +}
> >      >      > +
> >      >      > +
> >      >      > +ssize_t vmnet_receive_common(NetClientState *nc,
> >      >      > +                             const uint8_t *buf,
> >      >      > +                             size_t size)
> >      >      > +{
> >      >      > +    VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, =
nc,
> >     nc);
> >      >      > +    struct vmpktdesc packet;
> >      >      > +    struct iovec iov;
> >      >      > +    int pkt_cnt;
> >      >      > +    vmnet_return_t if_status;
> >      >      > +
> >      >      > +    if (size > s->max_packet_size) {
> >      >      > +        warn_report("vmnet: packet is too big, %zu > %"
> >     PRIu64,
> >      >      > +        packet.vm_pkt_size,
> >      >      > +        s->max_packet_size);
> >      >      > +        return -1;
> >      >      > +    }
> >      >      > +
> >      >      > +    iov.iov_base =3D (char *) buf;
> >      >      > +    iov.iov_len =3D size;
> >      >      > +
> >      >      > +    packet.vm_pkt_iovcnt =3D 1;
> >      >      > +    packet.vm_flags =3D 0;
> >      >      > +    packet.vm_pkt_size =3D size;
> >      >      > +    packet.vm_pkt_iov =3D &iov;
> >      >      > +    pkt_cnt =3D 1;
> >      >      > +
> >      >      > +    if_status =3D vmnet_write(s->vmnet_if, &packet,
> &pkt_cnt);
> >      >      > +    if (if_status !=3D VMNET_SUCCESS) {
> >      >      > +        error_report("vmnet: write error: %s\n",
> >      >      > +                     vmnet_status_map_str(if_status));
> >      >      > +        return -1;
> >      >      > +    }
> >      >      > +
> >      >      > +    if (if_status =3D=3D VMNET_SUCCESS && pkt_cnt) {
> >      >
> >      >     `if_status =3D=3D VMNET_SUCCESS` is redundant.
> >      >
> >      >
> >      > Missed this, thanks.
> >      >
> >      >     Regards,
> >      >     Akihiko Odaki
> >      >
> >      >      > +        return size;
> >      >      > +    }
> >      >      > +    return 0;
> >      >      > +}
> >      >      > +
> >      >      > +
> >      >      > +void vmnet_cleanup_common(NetClientState *nc)
> >      >      > +{
> >      >      > +    VmnetCommonState *s =3D DO_UPCAST(VmnetCommonState, =
nc,
> >     nc);
> >      >      > +    dispatch_semaphore_t if_stopped_sem;
> >      >      > +
> >      >      > +    if (s->vmnet_if =3D=3D NULL) {
> >      >      > +        return;
> >      >      > +    }
> >      >      > +
> >      >      > +    vmnet_interface_set_event_callback(
> >      >      > +        s->vmnet_if,
> >      >      > +        VMNET_INTERFACE_PACKETS_AVAILABLE,
> >      >      > +        NULL,
> >      >      > +        NULL);
> >      >
> >      >     I don't think this vmnet_interface_set_event_callback call i=
s
> >     necessary.
> >      >
> >      >
> >      > I kept in mind that vmnet processing lives in a separate thread
> >      > and while cleanup it may continue receiving packets. While the
> >      > queue is not empty, vmnet_stop_interface hangs. Unregistering
> >      > callback ensures that this queue will be emptied asap.
> >      >
> >      > It will work without vmnet_interface_set_event_callback here,
> >      > but I think it's better to be respectful to vmnet and clean
> >     everything
> >      > we can :)
> >
> >     You may put qemu_purge_queued_packets after vmnet_stop_interface if
> you
> >     think about the case it keeps receving packets while cleaning up
> since
> >     it is the only thing it does before calling vmnet_stop_interface.
> >     vmnet_stop_interface would then stop things in the proper order. It
> may
> >     decide to stop event callbacks first. Otherwise, it may decide to
> stop
> >     some internal heavy functionality first. It is up to vmnet.framewor=
k.
> >
> >     Regards,
> >     Akihiko Odaki
> >
> >      > Thank you!
> >      >
> >      > Best Regards,
> >      >
> >      > Vladislav
> >      >
> >      >      > +
> >      >      > +    qemu_purge_queued_packets(nc);
> >      >      > +
> >      >      > +    if_stopped_sem =3D dispatch_semaphore_create(0);
> >      >      > +    vmnet_stop_interface(
> >      >      > +        s->vmnet_if,
> >      >      > +        s->if_queue,
> >      >      > +        ^(vmnet_return_t status) {
> >      >      > +            assert(status =3D=3D VMNET_SUCCESS);
> >      >      > +            dispatch_semaphore_signal(if_stopped_sem);
> >      >      > +        });
> >      >      > +    dispatch_semaphore_wait(if_stopped_sem,
> >     DISPATCH_TIME_FOREVER);
> >      >      > +
> >      >      > +    qemu_bh_delete(s->send_bh);
> >      >      > +    dispatch_release(if_stopped_sem);
> >      >      > +    dispatch_release(s->if_queue);
> >      >      > +
> >      >      > +    for (int i =3D 0; i < VMNET_PACKETS_LIMIT; ++i) {
> >      >      > +        g_free(s->iov_buf[i].iov_base);
> >      >      > +    }
> >      >      > +}
> >      >      > diff --git a/net/vmnet-shared.c b/net/vmnet-shared.c
> >      >      > index f07afaaf21..2f4eb1db2d 100644
> >      >      > --- a/net/vmnet-shared.c
> >      >      > +++ b/net/vmnet-shared.c
> >      >      > @@ -10,16 +10,103 @@
> >      >      >
> >      >      >   #include "qemu/osdep.h"
> >      >      >   #include "qapi/qapi-types-net.h"
> >      >      > +#include "qapi/error.h"
> >      >      >   #include "vmnet_int.h"
> >      >      >   #include "clients.h"
> >      >      > -#include "qemu/error-report.h"
> >      >      > -#include "qapi/error.h"
> >      >      >
> >      >      >   #include <vmnet/vmnet.h>
> >      >      >
> >      >      > +typedef struct VmnetSharedState {
> >      >      > +    VmnetCommonState cs;
> >      >      > +} VmnetSharedState;
> >      >      > +
> >      >      > +
> >      >      > +static bool validate_options(const Netdev *netdev, Error
> >     **errp)
> >      >      > +{
> >      >      > +    const NetdevVmnetSharedOptions *options =3D
> >      >     &(netdev->u.vmnet_shared);
> >      >      > +
> >      >      > +#if !defined(MAC_OS_VERSION_11_0) || \
> >      >      > +    MAC_OS_X_VERSION_MIN_REQUIRED < MAC_OS_VERSION_11_0
> >      >      > +    if (options->has_isolated) {
> >      >      > +        error_setg(errp,
> >      >      > +                   "vmnet-shared.isolated feature is "
> >      >      > +                   "unavailable: outdated vmnet.framewor=
k
> >     API");
> >      >      > +        return false;
> >      >      > +    }
> >      >      > +#endif
> >      >      > +
> >      >      > +    if ((options->has_start_address ||
> >      >      > +         options->has_end_address ||
> >      >      > +         options->has_subnet_mask) &&
> >      >      > +        !(options->has_start_address &&
> >      >      > +          options->has_end_address &&
> >      >      > +          options->has_subnet_mask)) {
> >      >      > +        error_setg(errp,
> >      >      > +                   "'start-address', 'end-address',
> >     'subnet-mask' "
> >      >      > +                   "should be provided together"
> >      >      > +        );
> >      >      > +        return false;
> >      >      > +    }
> >      >      > +
> >      >      > +    return true;
> >      >      > +}
> >      >      > +
> >      >      > +static xpc_object_t build_if_desc(const Netdev *netdev)
> >      >      > +{
> >      >      > +    const NetdevVmnetSharedOptions *options =3D
> >      >     &(netdev->u.vmnet_shared);
> >      >      > +    xpc_object_t if_desc =3D xpc_dictionary_create(NULL,
> >     NULL, 0);
> >      >      > +
> >      >      > +    xpc_dictionary_set_uint64(
> >      >      > +        if_desc,
> >      >      > +        vmnet_operation_mode_key,
> >      >      > +        VMNET_SHARED_MODE
> >      >      > +    );
> >      >      > +
> >      >      > +    if (options->has_nat66_prefix) {
> >      >      > +        xpc_dictionary_set_string(if_desc,
> >      >      > +                                  vmnet_nat66_prefix_key=
,
> >      >      > +                                  options->nat66_prefix)=
;
> >      >      > +    }
> >      >      > +
> >      >      > +    if (options->has_start_address) {
> >      >      > +        xpc_dictionary_set_string(if_desc,
> >      >      > +                                  vmnet_start_address_ke=
y,
> >      >      > +                                  options->start_address=
);
> >      >      > +        xpc_dictionary_set_string(if_desc,
> >      >      > +                                  vmnet_end_address_key,
> >      >      > +                                  options->end_address);
> >      >      > +        xpc_dictionary_set_string(if_desc,
> >      >      > +                                  vmnet_subnet_mask_key,
> >      >      > +                                  options->subnet_mask);
> >      >      > +    }
> >      >      > +
> >      >      > +#if defined(MAC_OS_VERSION_11_0) && \
> >      >      > +    MAC_OS_X_VERSION_MIN_REQUIRED >=3D MAC_OS_VERSION_11=
_0
> >      >      > +    xpc_dictionary_set_bool(
> >      >      > +        if_desc,
> >      >      > +        vmnet_enable_isolation_key,
> >      >      > +        options->isolated
> >      >      > +    );
> >      >      > +#endif
> >      >      > +
> >      >      > +    return if_desc;
> >      >      > +}
> >      >      > +
> >      >      > +static NetClientInfo net_vmnet_shared_info =3D {
> >      >      > +    .type =3D NET_CLIENT_DRIVER_VMNET_SHARED,
> >      >      > +    .size =3D sizeof(VmnetSharedState),
> >      >      > +    .receive =3D vmnet_receive_common,
> >      >      > +    .cleanup =3D vmnet_cleanup_common,
> >      >      > +};
> >      >      > +
> >      >      >   int net_init_vmnet_shared(const Netdev *netdev, const
> >     char *name,
> >      >      >                             NetClientState *peer, Error
> >     **errp)
> >      >      >   {
> >      >      > -  error_setg(errp, "vmnet-shared is not implemented yet"=
);
> >      >      > -  return -1;
> >      >      > +    NetClientState *nc =3D
> >     qemu_new_net_client(&net_vmnet_shared_info,
> >      >      > +                                             peer,
> >      >     "vmnet-shared", name);
> >      >      > +    if (!validate_options(netdev, errp)) {
> >      >      > +        g_assert_not_reached();
> >      >      > +        return -1;
> >      >      > +    }
> >      >      > +    return vmnet_if_create(nc, build_if_desc(netdev),
> errp);
> >      >      >   }
> >      >      > diff --git a/net/vmnet_int.h b/net/vmnet_int.h
> >      >      > index aac4d5af64..8f3321ef3e 100644
> >      >      > --- a/net/vmnet_int.h
> >      >      > +++ b/net/vmnet_int.h
> >      >      > @@ -15,11 +15,50 @@
> >      >      >   #include "clients.h"
> >      >      >
> >      >      >   #include <vmnet/vmnet.h>
> >      >      > +#include <dispatch/dispatch.h>
> >      >      > +
> >      >      > +/**
> >      >      > + *  From vmnet.framework documentation
> >      >      > + *
> >      >      > + *  Each read/write call allows up to 200 packets to be
> >      >      > + *  read or written for a maximum of 256KB.
> >      >      > + *
> >      >      > + *  Each packet written should be a complete
> >      >      > + *  ethernet frame.
> >      >      > + *
> >      >      > + * https://developer.apple.com/documentation/vmnet
> >     <https://developer.apple.com/documentation/vmnet>
> >      >     <https://developer.apple.com/documentation/vmnet
> >     <https://developer.apple.com/documentation/vmnet>>
> >      >      > + */
> >      >      > +#define VMNET_PACKETS_LIMIT 200
> >      >      >
> >      >      >   typedef struct VmnetCommonState {
> >      >      > -  NetClientState nc;
> >      >      > +    NetClientState nc;
> >      >      > +    interface_ref vmnet_if;
> >      >      > +
> >      >      > +    uint64_t mtu;
> >      >      > +    uint64_t max_packet_size;
> >      >      >
> >      >      > +    dispatch_queue_t if_queue;
> >      >      > +
> >      >      > +    QEMUBH *send_bh;
> >      >      > +    bool send_enabled;
> >      >      > +
> >      >      > +    struct vmpktdesc packets_buf[VMNET_PACKETS_LIMIT];
> >      >      > +    int packets_send_current_pos;
> >      >      > +    int packets_send_end_pos;
> >      >      > +
> >      >      > +    struct iovec iov_buf[VMNET_PACKETS_LIMIT];
> >      >      >   } VmnetCommonState;
> >      >      >
> >      >      > +const char *vmnet_status_map_str(vmnet_return_t status);
> >      >      > +
> >      >      > +int vmnet_if_create(NetClientState *nc,
> >      >      > +                    xpc_object_t if_desc,
> >      >      > +                    Error **errp);
> >      >      > +
> >      >      > +ssize_t vmnet_receive_common(NetClientState *nc,
> >      >      > +                             const uint8_t *buf,
> >      >      > +                             size_t size);
> >      >      > +
> >      >      > +void vmnet_cleanup_common(NetClientState *nc);
> >      >      >
> >      >      >   #endif /* VMNET_INT_H */
> >      >
> >
>
>

--0000000000008bf6f805da35e60d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9ImF1dG8iPjxicj48YnI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiIGRpcj0iYXV0
byI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPtCy0YIsIDE1INC80LDRgC4gMjAy
MiDQsy4sIDI6MDYgQU0gQWtpaGlrbyBPZGFraSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmFraWhpa28u
b2Rha2lAZ21haWwuY29tIj5ha2loaWtvLm9kYWtpQGdtYWlsLmNvbTwvYT4mZ3Q7Ojxicj48L2Rp
dj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MCAwIDAgLjhl
eDtib3JkZXItbGVmdDoxcHggI2NjYyBzb2xpZDtwYWRkaW5nLWxlZnQ6MWV4Ij5PbiAyMDIyLzAz
LzE1IDg6MDIsIFZsYWRpc2xhdiBZYXJvc2hjaHVrIHdyb3RlOjxicj4NCiZndDsgPGJyPg0KJmd0
OyA8YnI+DQomZ3Q7INCy0YIsIDE1INC80LDRgC4gMjAyMiDQsy4sIDE6MzQgQU0gQWtpaGlrbyBP
ZGFraSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmFraWhpa28ub2Rha2lAZ21haWwuY29tIiB0YXJnZXQ9
Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj5ha2loaWtvLm9kYWtpQGdtYWlsLmNvbTwvYT4gPGJy
Pg0KJmd0OyAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpha2loaWtvLm9kYWtpQGdtYWlsLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+YWtpaGlrby5vZGFraUBnbWFpbC5j
b208L2E+Jmd0OyZndDs6PGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqBPbiAyMDIyLzAzLzE1
IDY6NTAsIFZsYWRpc2xhdiBZYXJvc2hjaHVrIHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
IFRoYW5rIHlvdSwgQWtpaGlrbzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgT24gTW9uLCBNYXIgMTQsIDIwMjIgYXQgMTA6NDYgUE0gQWtpaGlrbyBPZGFraTxi
cj4NCiZndDvCoCDCoCDCoCZsdDs8YSBocmVmPSJtYWlsdG86YWtpaGlrby5vZGFraUBnbWFpbC5j
b20iIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPmFraWhpa28ub2Rha2lAZ21haWwu
Y29tPC9hPiAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpha2loaWtvLm9kYWtpQGdtYWlsLmNv
bSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+YWtpaGlrby5vZGFraUBnbWFpbC5j
b208L2E+Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICZsdDttYWlsdG86PGEgaHJlZj0ibWFp
bHRvOmFraWhpa28ub2Rha2lAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVy
cmVyIj5ha2loaWtvLm9kYWtpQGdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7wqAgwqAgwqAmbHQ7bWFp
bHRvOjxhIGhyZWY9Im1haWx0bzpha2loaWtvLm9kYWtpQGdtYWlsLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiIHJlbD0ibm9yZWZlcnJlciI+YWtpaGlrby5vZGFraUBnbWFpbC5jb208L2E+Jmd0OyZndDsm
Z3Q7IHdyb3RlOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoE9uIDIwMjIvMDMvMTUgNDoxNSwgVmxhZGlzbGF2IFlhcm9zaGNodWsgd3JvdGU6PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7IHZtbmV0LmZyYW1ld29yayBzdXBwb3J0
cyBpb3YsIGJ1dCB3cml0aW5nIG1vcmUgdGhhbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgJmd0OyBvbmUgaW92IGludG8gdm1uZXQgaW50ZXJmYWNlIGZhaWxzIHdpdGg8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgJiMzOTtWTU5FVF9JTlZBTElEX0FSR1VNRU5UJiMz
OTsuIENvbGxlY3RpbmcgcHJvdmlkZWQgaW92cyBpbnRvPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCAmZ3Q7IG9uZSBhbmQgcGFzc2luZyBpdCB0byB2bW5ldCB3b3JrcyBmaW5lLiBUaGF0
JiMzOTtzIHRoZTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyByZWFzb24gd2h5
IHJlY2VpdmVfaW92KCkgbGVmdCB1bmltcGxlbWVudGVkLiBCdXQgaXQgc3RpbGw8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgd29ya3Mgd2l0aCBnb29kIGVub3VnaCBwZXJmb3Jt
YW5jZSBoYXZpbmcgLnJlY2VpdmUoKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0
OyBpbXBsZW1lbnRlZCBvbmx5Ljxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyBTaWduZWQtb2ZmLWJ5OiBQaGlsbGlw
IFRlbm5lbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOnBoaWxsaXBAYXhsZW9zLmNvbSIgdGFyZ2V0PSJf
YmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+cGhpbGxpcEBheGxlb3MuY29tPC9hPjxicj4NCiZndDvC
oCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnBoaWxsaXBAYXhsZW9zLmNvbSIgdGFy
Z2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+cGhpbGxpcEBheGxlb3MuY29tPC9hPiZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
cGhpbGxpcEBheGxlb3MuY29tIiB0YXJnZXQ9Il9ibGFuayIgcmVsPSJub3JlZmVycmVyIj5waGls
bGlwQGF4bGVvcy5jb208L2E+ICZsdDttYWlsdG86PGEgaHJlZj0ibWFpbHRvOnBoaWxsaXBAYXhs
ZW9zLmNvbSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+cGhpbGxpcEBheGxlb3Mu
Y29tPC9hPiZndDsmZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyBT
aWduZWQtb2ZmLWJ5OiBWbGFkaXNsYXYgWWFyb3NoY2h1azxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAmbHQ7PGEgaHJlZj0ibWFpbHRvOlZsYWRpc2xhdi5ZYXJvc2hjaHVrQGpldGJyYWlu
cy5jb20iIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIiPlZsYWRpc2xhdi5ZYXJvc2hj
aHVrQGpldGJyYWlucy5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVm
PSJtYWlsdG86VmxhZGlzbGF2Lllhcm9zaGNodWtAamV0YnJhaW5zLmNvbSIgdGFyZ2V0PSJfYmxh
bmsiIHJlbD0ibm9yZWZlcnJlciI+VmxhZGlzbGF2Lllhcm9zaGNodWtAamV0YnJhaW5zLmNvbTwv
YT4mZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCZsdDttYWlsdG86PGEgaHJlZj0i
bWFpbHRvOlZsYWRpc2xhdi5ZYXJvc2hjaHVrQGpldGJyYWlucy5jb20iIHRhcmdldD0iX2JsYW5r
IiByZWw9Im5vcmVmZXJyZXIiPlZsYWRpc2xhdi5ZYXJvc2hjaHVrQGpldGJyYWlucy5jb208L2E+
PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86VmxhZGlzbGF2Lllh
cm9zaGNodWtAamV0YnJhaW5zLmNvbSIgdGFyZ2V0PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+
VmxhZGlzbGF2Lllhcm9zaGNodWtAamV0YnJhaW5zLmNvbTwvYT4mZ3Q7Jmd0OyZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgLS0tPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqBuZXQvdm1uZXQtY29tbW9uLm0gfCAyOTg8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7wqAgwqBuZXQvdm1uZXQtc2hh
cmVkLmMgfMKgIDk1ICsrKysrKysrKysrKysrLTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgbmV0L3ZtbmV0X2ludC5owqAgwqAgfMKgIDQxICsrKysrKy08YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDvCoCDCoDMgZmlsZXMgY2hhbmdlZCwgNDI5IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAm
Z3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7IGRpZmYgLS1naXQgYS9uZXQv
dm1uZXQtY29tbW9uLm0gYi9uZXQvdm1uZXQtY29tbW9uLm08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgICZndDsgaW5kZXggNTY2MTJjNzJjZS4uMjBhMzNkMjU5MSAxMDA2NDQ8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgLS0tIGEvbmV0L3ZtbmV0LWNvbW1vbi5tPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICsrKyBiL25ldC92bW5ldC1jb21tb24u
bTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyBAQCAtMTAsNiArMTAsOCBAQDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgICovPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAjaW5jbHVkZSAmcXVvdDtxZW11L29zZGVwLmgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgICZndDsgKyNpbmNsdWRlICZxdW90O3FlbXUvbWFpbi1sb29wLmgmcXVvdDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgKyNpbmNsdWRlICZxdW90O3FlbXUv
bG9nLmgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDvCoCDCoCNpbmNs
dWRlICZxdW90O3FhcGkvcWFwaS10eXBlcy1uZXQuaCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgI2luY2x1ZGUgJnF1b3Q7dm1uZXRfaW50LmgmcXVvdDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDvCoCDCoCNpbmNsdWRlICZxdW90O2NsaWVu
dHMuaCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyBAQCAtMTcsNCAr
MTksMzAwIEBAPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAjaW5jbHVk
ZSAmcXVvdDtxYXBpL2Vycm9yLmgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
ICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDvCoCDCoCNpbmNsdWRlICZs
dDt2bW5ldC92bW5ldC5oJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyAr
I2luY2x1ZGUgJmx0O2Rpc3BhdGNoL2Rpc3BhdGNoLmgmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICtzdGF0
aWMgYm9vbCB2bW5ldF9xZW11X3NlbmRfd3JhcHBlcihWbW5ldENvbW1vblN0YXRlICpzKTs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBUaGUgbmFt
ZXMgb2Ygdm1uZXRfcWVtdV9zZW5kX3dyYXBwZXIgYW5kIHZtbmV0X3NlbmRfYmggZG9lczxicj4N
CiZndDvCoCDCoCDCoG5vdCB0ZWxsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoHRoZW0g
YXBhcnQgd2VsbC4gU2luY2Ugb25seSB2bW5ldF9zZW5kX2JoIGRvZXMgcmVhZGluZywgaXRzPGJy
Pg0KJmd0O8KgIMKgIMKgbmFtZSBtYXk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgaW5j
bHVkZSAmcXVvdDtyZWFkJnF1b3Q7IHRvIGNsYXJpZnkgdGhhdC4gJnF1b3Q7d3JhcHBlciZxdW90
OyBpbjxicj4NCiZndDvCoCDCoCDCoHZtbmV0X3FlbXVfc2VuZF93cmFwcGVyPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoG1heTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBiZSBh
bHNvIG1pc2xlYWRpbmcgYXMgaXQgZG9lcyBtb3JlIHRoYW4ganVzdCBjYWxsaW5nIHRoZTxicj4N
CiZndDvCoCDCoCDCoHVuZGVybHlpbmc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgUUVN
VTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBmYWNpbGl0eSwgYnV0IGl0IGFsc28gdXBk
YXRlcyBWbW5ldENvbW1vblN0YXRlLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBPaywgSSYjMzk7bGwgdGhpbmsgYWJv
dXQgaG93IHRvIG5hbWUgdGhlbSBiZXR0ZXIuPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICtzdGF0aWMg
dm9pZCB2bW5ldF9zZW5kX2NvbXBsZXRlZChOZXRDbGllbnRTdGF0ZSAqbmMsPGJyPg0KJmd0O8Kg
IMKgIMKgc3NpemVfdCBsZW4pPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICt7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBWbW5ldENvbW1vblN0
YXRlICpzID0gRE9fVVBDQVNUKFZtbmV0Q29tbW9uU3RhdGUsIG5jLDxicj4NCiZndDvCoCDCoCDC
oG5jKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIC8qIENvbXBs
ZXRlIHNlbmRpbmcgcGFja2V0cyBsZWZ0IGluIFZtbmV0Q29tbW9uU3RhdGU8YnI+DQomZ3Q7wqAg
wqAgwqBidWZmZXJzICovPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCBzLSZndDtzZW5kX2VuYWJsZWQgPSB2bW5ldF9xZW11X3NlbmRfd3JhcHBlcihzKTs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBJdCBtdXN0IHFl
bXVfYmhfc2NoZWR1bGUocy0mZ3Q7c2VuZF9iaCkgYWZ0ZXI8YnI+DQomZ3Q7wqAgwqAgwqB2bW5l
dF9xZW11X3NlbmRfd3JhcHBlci48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgQWdyZWUgd2l0aCB5b3UsIHRoYW5rcy48
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBBbHNv
LCBzZW5kX2VuYWJsZWQgZmxhZyBjYW4gYmUgcmVtb3ZlZCBhcyBleHBsYWluZWQgaW46PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgPGEgaHJlZj0iaHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS9x
ZW11LWRldmVsQG5vbmdudS5vcmcvbXNnODczOTIzLmh0bWwiIHJlbD0ibm9yZWZlcnJlciBub3Jl
ZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly93d3cubWFpbC1hcmNoaXZlLmNvbS9xZW11
LWRldmVsQG5vbmdudS5vcmcvbXNnODczOTIzLmh0bWw8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0
OzxhIGhyZWY9Imh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20vcWVtdS1kZXZlbEBub25nbnUu
b3JnL21zZzg3MzkyMy5odG1sIiByZWw9Im5vcmVmZXJyZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJf
YmxhbmsiPmh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20vcWVtdS1kZXZlbEBub25nbnUub3Jn
L21zZzg3MzkyMy5odG1sPC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20v
cWVtdS1kZXZlbEBub25nbnUub3JnL21zZzg3MzkyMy5odG1sIiByZWw9Im5vcmVmZXJyZXIgbm9y
ZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vd3d3Lm1haWwtYXJjaGl2ZS5jb20vcWVt
dS1kZXZlbEBub25nbnUub3JnL21zZzg3MzkyMy5odG1sPC9hPjxicj4NCiZndDvCoCDCoCDCoCZs
dDs8YSBocmVmPSJodHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL3FlbXUtZGV2ZWxAbm9uZ251
Lm9yZy9tc2c4NzM5MjMuaHRtbCIgcmVsPSJub3JlZmVycmVyIG5vcmVmZXJyZXIiIHRhcmdldD0i
X2JsYW5rIj5odHRwczovL3d3dy5tYWlsLWFyY2hpdmUuY29tL3FlbXUtZGV2ZWxAbm9uZ251Lm9y
Zy9tc2c4NzM5MjMuaHRtbDwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBOb3Qgc3VyZSBhYm91dCB0
aGlzLiBWYWx1ZXMgb2YgcGFja2V0c19zZW5kX2N1cnJlbnRfcG9zPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgYW5kIHBhY2tldHNfc2VuZF9lbmRfcG9zIG1heSBiZSBlcXVhbCwgYnV0IFFFTVUgbWF5
IGJlPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgbm90IHJlYWR5IHRvIHJlY2VpdmUgbmV3IHBhY2tl
dHMgLSB0aGUgZXhwbGFuYXRpb246PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgMS4gV2UgYXJlIHNl
bmRpbmcgcGFja2V0cyB0byBRRU1VIHdpdGggcWVtdV9zZW5kX3BhY2tldF9hc3luYzo8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIHBhY2tldHNfc2VuZF9jdXJyZW50X3BvcyA9IDA8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIHBhY2tldHNfc2VuZF9lbmRfcG9zID0gNTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7IDIuIEFsbCBmaXZlIHBhY2tldHMgKDAsIDEsIDIsIDMsIDQpIGhh
dmUgYmVlbiBzdWNjZXNzZnVsbHkgc2VudDxicj4NCiZndDvCoCDCoCDCoHRvIFFFTVUsPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCBidXQgcWVtdV9zZW5kX3BhY2tldF9hc3luYyByZXR1
cm5lZCAwICZxdW90O25vIG1vcmUgcGFja2V0cyZxdW90OyBhZnRlcjxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgdGhlIGxhc3QgaW52b2NhdGlvbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
IDMuIEluIHNwaXRlIG9mIHRoaXMsIGFsbCBmaXZlIHBhY2tldHMgYXJlIHNlbnQgYW5kPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCBwYWNrZXRzX3NlbmRfY3VycmVudF9wb3MgPT0gcGFj
a2V0c19zZW5kX2VuZF9wb3MgPT0gNTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IDQuIEl0IHNlZW1z
IHRoYXQgJnF1b3Q7cG9pbnRlcnMgYXJlIGVxdWFsIC0mZ3Q7wqAgUUVNVSBpcyByZWFkeSZxdW90
OywgYnV0IGFjdHVhbGx5PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCBpdCBpcyBub3Qu
PGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBBbHNvLCBoaWRp
bmcgUUVNVSAmcXVvdDtyZWFkeSZxdW90Oy8mcXVvdDtub3QgcmVhZHkmcXVvdDvCoHN0YXRlIGJl
aGluZCBwb2ludGVycyBpcyBhPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgYmFkIGNob2ljZSBJIHRo
aW5rLiBIYXZpbmcgYSBjb25jcmV0ZSBmbGFnIG1ha2VzIHRoaXMgbW9yZSBjbGVhci48YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyBJdCBwcm92aWRlc8KgdW5kZXJzdGFuZGFiaWxpdHksIG5vdCBjb21w
bGV4aXR5wqAoaW1obykuPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqBwYWNrZXRzX3NlbmRf
Y3VycmVudF9wb3MgbXVzdCBub3QgYmUgaW5jcmVtZW50ZWQgaWY8YnI+DQomZ3Q7wqAgwqAgwqBx
ZW11X3NlbmRfcGFja2V0X2FzeW5jIHJldHVybmVkIDAuIEl0IG11c3QgdGVsbCB0aGUgcG9zaXRp
b24gb2YgdGhlPGJyPg0KJmd0O8KgIMKgIMKgcGFja2V0IGN1cnJlbnRseSBiZWluZyBzZW50Ljxi
cj4NCiZndDsgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCAmZ3Q7IG11c3QgYmUg
aW5jcmVtZW50ZWQ8YnI+DQomZ3Q7IEl0IGNhbm5vdC48YnI+DQomZ3Q7IDxicj4NCiZndDsgSWYg
cWVtdV9zZW5kX3BhY2tldF9hc3luYyByZXR1cm5zIDAsPGJyPg0KJmd0OyBpdCBzdGlsbCBjb25z
dW1lcyAoISkgKHF1ZXVlcyBpbnRlcm5hbGx5KSB0aGUgcGFja2V0Ljxicj4NCiZndDsgU28gdGhl
IHBhY2tldHNfc2VuZF9jdXJyZW50X3BvcyBtdXN0IGJlPGJyPg0KJmd0OyBpbmNyZW1lbnRlZDxi
cj4NCiZndDsgdG8gcHJldmVudCBzZW5kaW5nIHNhbWUgcGFja2V0IG11bHRpcGxlIHRpbWVzLjxi
cj4NCiZndDsgPGJyPg0KJmd0OyBUaGUgaWRlYSBpcyBzaW1wbGU6PGJyPg0KJmd0OyAxLiBXZSYj
Mzk7dmUgc2VudCB0aGUgcGFja2V0IC0gaW5jcmVtZW50PGJyPg0KJmd0OyAyLiBQYWNrZWQgaXMg
bm90IHNlbmQgLSBub3QgaW5jcmVtZW50PGJyPg0KJmd0OyA8YnI+DQomZ3Q7IHFlbXVfc2VuZF9w
YWNrZXRfYXN5bmMgd2l0aCAwIHJldHVybmVkIG1lZXRzPGJyPg0KJmd0OyB0aGUgMXN0IGNhc2Us
IGJlY2F1c2UgaXQgc3RpbGwgcXVldWVzIHRoZSBwYWNrZXQuPGJyPg0KJmd0OyA8YnI+DQomZ3Q7
IFdoaWxlIHRoZSBpbmNyZW1lbnQgYWN0aW9uIGlzIG5vdCBkZXBlbmRzIG9uIHRoZTxicj4NCiZn
dDsgcmV0dXJuZWQgdmFsdWUsIHdlIGNhbm5vdCB1c2UgcG9zaXRpb24gcG9pbnRlcnMgYXMgYTxi
cj4NCiZndDsgY3JpdGVyaWEgdG8gc2VuZCBtb3JlIHBhY2tldHMgb3Igbm90LiBBbm90aGVyIHN0
YXRlPGJyPg0KJmd0OyBzdG9yYWdlIChmbGFnKSBpcyByZXF1aXJlZC48YnI+DQomZ3Q7IDxicj4N
CiZndDsgPGJyPg0KJmd0OyBJZiBZb3UgYXJlIG5vdCBhZ2FpbnN0LCBJJiMzOTtsbCBjb3ZlciB0
aGlzIHdpdGggcHJvcGVyPGJyPg0KJmd0OyBkb2N1bWVudGF0aW9uIChjb21tZW50cykgdG8gc2lt
cGxpZnkgZnV0dXJlIHN1cHBvcnQ8YnI+DQomZ3Q7IGFuZCBtYWtlIGl0IG1vcmUgY2xlYXIuPGJy
Pg0KPGJyPg0KSSBmb3Jnb3QgdG8gbm90ZSB0aGF0IHBhY2tldHNfc2VuZF9jdXJyZW50X3BvcyBz
aG91bGQgYmUgaW5jcmVtZW50ZWQgaW4gPGJyPg0Kdm1uZXRfc2VuZF9jb21wbGV0ZWQgaW5zdGVh
ZC4gSXQgd291bGQgbWFrZSBwYWNrZXRzX3NlbmRfY3VycmVudF9wb3MgPGJyPg0KcHJvcGVybHkg
cmVwcmVzZW50IGNhc2UgMS48YnI+DQo8YnI+PGJyPsKgPC9ibG9ja3F1b3RlPjwvZGl2PjxkaXYg
ZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2IGRpcj0i
YXV0byI+VGhlIHRydXRoIGJlZ2lucyBmcm9tIGRpc2N1c3Npb24gOik8L2Rpdj48ZGl2IGRpcj0i
YXV0byI+SSYjMzk7bGwgdHJ5IHRvIHJlZmFjdG9yIGFuZCBkb2N1bWVudCB0aGlzIHBhcnQgYSBi
aXQsPC9kaXY+PGRpdiBkaXI9ImF1dG8iPnRvIG1ha2UgaXQgbW9yZSBjbGVhciBzaW5jZSBpdCBp
cyBub3QuIFRoYW5rIHlvdSHCoDwvZGl2PjxkaXYgZGlyPSJhdXRvIj48YnI+PC9kaXY+PGRpdiBk
aXI9ImF1dG8iPkJlc3QgcmVnYXJkcyw8L2Rpdj48ZGl2IGRpcj0iYXV0byI+PGJyPjwvZGl2Pjxk
aXYgZGlyPSJhdXRvIj5WbGFkaXNsYXYgWWFyb3NoY2h1azwvZGl2PjxkaXYgZGlyPSJhdXRvIj48
YnI+PC9kaXY+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiIGRpcj0iYXV0byI+PC9kaXY+PGRpdiBj
bGFzcz0iZ21haWxfcXVvdGUiIGRpcj0iYXV0byI+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1
b3RlIiBzdHlsZT0ibWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7
cGFkZGluZy1sZWZ0OjFleCI+DQomZ3Q7IDxicj4NCiZndDsgPGJyPg0KJmd0OyBCZXN0IHJlZ2Fy
ZHMsPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IFZsYWRpc2xhdiBZYXJvc2hjaHVrPGJyPg0KJmd0OyA8
YnI+DQomZ3Q7IDxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgSXQgd291bGQgbm90IGhpZGUg
dGhlIHN0YXRlLCBidXQgaXQgd291bGQgcmF0aGVyIG1ha2UgaXQgY2xlYXIgdGhhdCB0aGU8YnI+
DQomZ3Q7wqAgwqAgwqBjb25kaXRpb24gdm1uZXRfc2VuZF9iaCBjYW4gZXhlY3V0ZS4gSWYgeW91
IHNlZSB0aGUgY3VycmVudDxicj4NCiZndDvCoCDCoCDCoGltcGxlbWVudGF0aW9uIG9mIHZtbmV0
X3NlbmRfYmgsIHlvdSYjMzk7bGwgZmluZCB0aGUgc2VuZF9lbmFibGVkIGZsYWcsIGJ1dDxicj4N
CiZndDvCoCDCoCDCoGl0IGRvZXMgbm90IHRlbGwgdGhlIGV4YWN0IGNvbmRpdGlvbiBpdCByZXF1
aXJlcyB0byBiZSBlbmFibGVkLiBZb3U8YnI+DQomZ3Q7wqAgwqAgwqBoYXZlPGJyPg0KJmd0O8Kg
IMKgIMKgdG8gdGhlbiBqdW1wIHRvIGFsbCBhc3NpZ25tZW50cyBmb3IgdGhlIGZsYWcgdG8ga25v
dyBpdCBiZWNvbWVzIHRydWU8YnI+DQomZ3Q7wqAgwqAgwqBpZmY8YnI+DQomZ3Q7wqAgwqAgwqBl
dmVyeSBwYWNrZXRzIGluIHRoZSBidWZmZXIgYXJlIHNlbnQuIEl0IGlzIG9idmlvdXMgaWYgdm1u
ZXRfc2VuZF9iaDxicj4NCiZndDvCoCDCoCDCoGRpcmVjdGx5IHN0YXRlcyBgaWYgKHBhY2tldHNf
c2VuZF9jdXJyZW50X3BvcyAmbHQ7IHBhY2tldHNfc2VuZF9lbmRfcG9zKWAuPGJyPg0KJmd0OyA8
YnI+DQomZ3Q7wqAgwqAgwqBFbGltaW5hdGluZyB0aGUgZmxhZyB3b3VsZCBhbHNvIHJlbW92ZSB0
aGUgcG9zc2libGl0eSBvZiBmb3JnZXR0aW5nIHRvPGJyPg0KJmd0O8KgIMKgIMKgbWFpbnRhaW4g
dGhlIHNlcGFyYXRlIHN0YXRlLjxicj4NCiZndDsgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHNlbmRfZW5hYmxl
ZCBjYW4gYmUgZWxpbWluYXRlZC4gV2hlbiBpdCBpcyBlbmFibGVkLDxicj4NCiZndDvCoCDCoCDC
oHBhY2tldHNfc2VuZF9wb3M8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgJmd0OyBh
bmQgcGFja2V0c19iYXRjaF9zaXplIG11c3QgYmUgZXF1YWwuIFRoZXkgbXVzdCBub3QgYmUgZXF1
YWw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgJmd0OyBvdGhlcndpc2UuIHBhY2tl
dHNfc2VuZF9wb3MgbXVzdCByZXByZXNlbnQgdGhlIHBvc2l0aW9uPGJyPg0KJmd0O8KgIMKgIMKg
b2YgdGhlPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoHBhY2tldDxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgwqAmZ3Q7IHdoaWNoIGlzIG5vdCBzZW50IHlldCwgcG9zc2libHkg
aW4gdGhlIHByb2Nlc3Mgb2Ygc2VuZGluZy48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
IMKgJmd0OyB2bW5ldF9zZW5kX2NvbXBsZXRlZCBtdXN0IGNhbGwgcWVtdV9zZW5kX3dyYXBwZXIg
YmVmb3JlPGJyPg0KJmd0O8KgIMKgIMKgc2NoZWR1bGluZzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgwqAmZ3Q7IHNlbmRfYmguIGJoX3NlbmQgc2hvdWxkIGRvIG5vdGhpbmcgaWYgcy0m
Z3Q7cGFja2V0c19zZW5kX3BvcyAmbHQ7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDC
oCZndDsgcy0mZ3Q7cGFja2V0c19iYXRjaF9zaXplLjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICt9PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgKzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArc3RhdGljIGJvb2wgdm1uZXRfcWVt
dV9zZW5kX3dyYXBwZXIoVm1uZXRDb21tb25TdGF0ZSAqcykgezxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgc3NpemVfdCBzaXplOzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvC
oCDCoCAvKjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAqIFBh
Y2tldHMgdG8gc2VuZCBsYXkgaW4gW2N1cnJlbnRfcG9zLi5lbmRfcG9zKTxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAqIChpbmNsdWRpbmcgY3VycmVudF9wb3Ms
IGV4Y2x1ZGluZyBlbmRfcG9zKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgwqAqLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgd2hp
bGUgKHMtJmd0O3BhY2tldHNfc2VuZF9jdXJyZW50X3BvcyAmbHQ7PGJyPg0KJmd0O8KgIMKgIMKg
cy0mZ3Q7cGFja2V0c19zZW5kX2VuZF9wb3MpIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIMKgIMKgIHNpemUgPSBxZW11X3NlbmRfcGFja2V0X2FzeW5jKCZhbXA7
cy0mZ3Q7bmMsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgcy0mZ3Q7aW92X2J1ZltzLSZndDtwYWNrZXRzX3NlbmRfY3Vy
cmVudF9wb3NdLmlvdl9iYXNlLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyAr
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoHMtJmd0O3BhY2tldHNfYnVmW3MtJmd0O3Bh
Y2tldHNfc2VuZF9jdXJyZW50X3Bvc10udm1fcGt0X3NpemUsPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCB2bW5ldF9zZW5kX2NvbXBsZXRlZCk7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCArK3MtJmd0O3BhY2tldHNfc2VuZF9jdXJy
ZW50X3Bvczs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKg
IGlmIChzaXplID09IDApIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIC8qIFFFTVUgaXMgbm90IHJlYWR5IC0gd2FpdCBmb3IgY29tcGxldGlv
bjxicj4NCiZndDvCoCDCoCDCoGNhbGxiYWNrPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oGNhbGwgKi88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIHJldHVybiBmYWxzZTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKg
IH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHJldHVybiB0cnVl
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArfTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7
ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK3N0YXRpYyB2b2lkIHZtbmV0
X3NlbmRfYmgodm9pZCAqb3BhcXVlKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0
OyArezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgTmV0Q2xpZW50
U3RhdGUgKm5jID0gKE5ldENsaWVudFN0YXRlICopIG9wYXF1ZTs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIFZtbmV0Q29tbW9uU3RhdGUgKnMgPSBET19VUENBU1Qo
Vm1uZXRDb21tb25TdGF0ZSwgbmMsPGJyPg0KJmd0O8KgIMKgIMKgbmMpOzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgc3RydWN0IHZtcGt0ZGVzYyAqcGFja2V0cyA9
IHMtJmd0O3BhY2tldHNfYnVmOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgdm1uZXRfcmV0dXJuX3Qgc3RhdHVzOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgaW50IGk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7
ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIC8qPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCogRG8gbm90aGluZyBpZiBRRU1V
IGlzIG5vdCByZWFkeSAtIHdhaXQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgKiBmb3IgY29tcGxldGlvbiBjYWxsYmFjayBpbnZvY2F0aW9uPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCovPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBpZiAoIXMtJmd0O3NlbmRfZW5hYmxlZCkgezxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgcmV0dXJuOzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgfTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvC
oCDCoCAvKiBSZWFkIGFzIG1hbnkgcGFja2V0cyBhcyBwcmVzZW50ICovPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBzLSZndDtwYWNrZXRzX3NlbmRfY3VycmVudF9w
b3MgPSAwOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgcy0mZ3Q7
cGFja2V0c19zZW5kX2VuZF9wb3MgPSBWTU5FVF9QQUNLRVRTX0xJTUlUOzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgZm9yIChpID0gMDsgaSAmbHQ7IHMtJmd0O3Bh
Y2tldHNfc2VuZF9lbmRfcG9zOyArK2kpIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
ICZndDsgK8KgIMKgIMKgIMKgIHBhY2tldHNbaV0udm1fcGt0X3NpemUgPSBzLSZndDttYXhfcGFj
a2V0X3NpemU7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDC
oCBwYWNrZXRzW2ldLnZtX3BrdF9pb3ZjbnQgPSAxOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgcGFja2V0c1tpXS52bV9mbGFncyA9IDA7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIHN0YXR1cyA9IHZtbmV0X3JlYWQocy0mZ3Q7dm1uZXRfaWYsIHBhY2tldHMsPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCZhbXA7cy0mZ3Q7cGFja2V0c19zZW5kX2VuZF9wb3MpOzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgaWYgKHN0YXR1cyAhPSBW
TU5FVF9TVUNDRVNTKSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoCDCoCBlcnJvcl9wcmludGYoJnF1b3Q7dm1uZXQ6IHJlYWQgZmFpbGVkOiAlc1xuJnF1b3Q7
LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqB2bW5ldF9zdGF0dXNfbWFwX3N0cihzdGF0dXMpKTs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHMtJmd0O3BhY2tldHNfc2VuZF9j
dXJyZW50X3BvcyA9IDA7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoCDCoCBzLSZndDtwYWNrZXRzX3NlbmRfZW5kX3BvcyA9IDA7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCByZXR1cm47PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIC8qIFNl
bmQgcGFja2V0cyB0byBRRU1VICovPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCBzLSZndDtzZW5kX2VuYWJsZWQgPSB2bW5ldF9xZW11X3NlbmRfd3JhcHBlcihzKTs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK308YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyAr
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICtzdGF0aWMgdm9pZCB2bW5ldF9i
dWZzX2luaXQoVm1uZXRDb21tb25TdGF0ZSAqcyk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgICZndDsgK3s8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHN0
cnVjdCB2bXBrdGRlc2MgKnBhY2tldHMgPSBzLSZndDtwYWNrZXRzX2J1Zjs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHN0cnVjdCBpb3ZlYyAqaW92ID0gcy0mZ3Q7
aW92X2J1Zjs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGludCBp
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBmb3IgKGkgPSAwOyBpICZsdDsgVk1ORVRfUEFDS0VU
U19MSU1JVDsgKytpKSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoCDCoCBpb3ZbaV0uaW92X2xlbiA9IHMtJmd0O21heF9wYWNrZXRfc2l6ZTs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIGlvdltpXS5pb3ZfYmFzZSA9
IGdfbWFsbG9jMChpb3ZbaV0uaW92X2xlbik7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCDCoCDCoCBwYWNrZXRzW2ldLnZtX3BrdF9pb3YgPSBpb3YgKyBpOzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgfTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgJmd0OyArfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0
OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgICZndDsgK2NvbnN0IGNoYXIgKnZtbmV0X3N0YXR1c19tYXBfc3RyKHZt
bmV0X3JldHVybl90IHN0YXR1cyk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsg
K3s8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHN3aXRjaCAoc3Rh
dHVzKSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBjYXNlIFZN
TkVUX1NVQ0NFU1M6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDC
oCDCoCByZXR1cm4gJnF1b3Q7c3VjY2VzcyZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIGNhc2UgVk1ORVRfRkFJTFVSRTo8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHJldHVybiAmcXVvdDtnZW5lcmFsIGZhaWx1
cmUgKHBvc3NpYmx5IG5vdCBlbm91Z2g8YnI+DQomZ3Q7wqAgwqAgwqBwcml2aWxlZ2VzKSZxdW90
Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGNhc2UgVk1ORVRf
TUVNX0ZBSUxVUkU6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDC
oCDCoCByZXR1cm4gJnF1b3Q7bWVtb3J5IGFsbG9jYXRpb24gZmFpbHVyZSZxdW90Ozs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGNhc2UgVk1ORVRfSU5WQUxJRF9B
UkdVTUVOVDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKg
IHJldHVybiAmcXVvdDtpbnZhbGlkIGFyZ3VtZW50IHNwZWNpZmllZCZxdW90Ozs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGNhc2UgVk1ORVRfU0VUVVBfSU5DT01Q
TEVURTo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHJl
dHVybiAmcXVvdDtpbnRlcmZhY2Ugc2V0dXAgaXMgbm90IGNvbXBsZXRlJnF1b3Q7Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgY2FzZSBWTU5FVF9JTlZBTElEX0FD
Q0VTUzo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHJl
dHVybiAmcXVvdDtpbnZhbGlkIGFjY2VzcywgcGVybWlzc2lvbiBkZW5pZWQmcXVvdDs7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBjYXNlIFZNTkVUX1BBQ0tFVF9U
T09fQklHOjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAg
cmV0dXJuICZxdW90O3BhY2tldCBzaXplIGlzIGxhcmdlciB0aGFuIE1UVSZxdW90Ozs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGNhc2UgVk1ORVRfQlVGRkVSX0VY
SEFVU1RFRDo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKg
IHJldHVybiAmcXVvdDtidWZmZXJzIGV4aGF1c3RlZCBpbiBrZXJuZWwmcXVvdDs7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBjYXNlIFZNTkVUX1RPT19NQU5ZX1BB
Q0tFVFM6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBy
ZXR1cm4gJnF1b3Q7cGFja2V0IGNvdW50IGV4Y2VlZHMgbGltaXQmcXVvdDs7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICsjaWYgZGVmaW5lZChNQUNfT1NfVkVSU0lPTl8xMV8w
KSAmYW1wOyZhbXA7IFw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKg
IE1BQ19PU19YX1ZFUlNJT05fTUlOX1JFUVVJUkVEICZndDs9IE1BQ19PU19WRVJTSU9OXzExXzA8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGNhc2UgVk1ORVRfU0hB
UklOR19TRVJWSUNFX0JVU1k6PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvC
oCDCoCDCoCDCoCByZXR1cm4gJnF1b3Q7Y29uZmxpY3QsIHNoYXJpbmcgc2VydmljZSBpcyBpbiB1
c2UmcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICsjZW5kaWY8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGRlZmF1bHQ6PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCByZXR1cm4gJnF1b3Q7dW5r
bm93biB2bW5ldCBlcnJvciZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK308YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICtpbnQgdm1u
ZXRfaWZfY3JlYXRlKE5ldENsaWVudFN0YXRlICpuYyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHhwY19vYmplY3RfdCBp
Zl9kZXNjLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgRXJyb3IgKiplcnJwKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgJmd0OyArezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAg
Vm1uZXRDb21tb25TdGF0ZSAqcyA9IERPX1VQQ0FTVChWbW5ldENvbW1vblN0YXRlLCBuYyw8YnI+
DQomZ3Q7wqAgwqAgwqBuYyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvC
oCDCoCBkaXNwYXRjaF9zZW1hcGhvcmVfdCBpZl9jcmVhdGVkX3NlbSA9PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoGRpc3BhdGNoX3NlbWFwaG9yZV9jcmVhdGUoMCk7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBfX2Jsb2NrIHZtbmV0X3JldHVybl90IGlm
X3N0YXR1czs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgcy0mZ3Q7aWZfcXVldWUgPSBkaXNwYXRj
aF9xdWV1ZV9jcmVhdGUoPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoCDCoCAmcXVvdDtvcmcucWVtdS52bW5ldC5pZl9xdWV1ZSZxdW90Oyw8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIERJU1BBVENIX1FVRVVFX1NFUklB
TDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgKTs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgeHBjX2RpY3Rpb25hcnlfc2V0X2Jvb2woPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBpZl9kZXNjLDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgdm1uZXRfYWxsb2NhdGVfbWFjX2FkZHJl
c3Nfa2V5LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAg
ZmFsc2U8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgICk7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgICZndDsgKyNpZmRlZiBERUJVRzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
Jmd0OyArwqAgwqAgcWVtdV9sb2coJnF1b3Q7dm1uZXQuc3RhcnQuaW50ZXJmYWNlX2Rlc2M6XG4m
cXVvdDspOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgeHBjX2Rp
Y3Rpb25hcnlfYXBwbHkoaWZfZGVzYyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXmJvb2woY29uc3QgY2hh
ciAqayw8YnI+DQomZ3Q7wqAgwqAgwqB4cGNfb2JqZWN0X3Qgdikgezxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjaGFyICpkZXNjID08YnI+DQomZ3Q7wqAgwqAgwqB4cGNfY29weV9kZXNjcmlwdGlv
bih2KTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcWVtdV9sb2coJnF1b3Q7wqAgJXM9JXNcbiZx
dW90OywgaywgZGVzYyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZyZWUoZGVzYyk7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiB0cnVlOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9KTs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgKyNlbmRpZiAvKiBERUJVRyAqLzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCBzLSZndDt2bW5ldF9pZiA9IHZtbmV0X3N0YXJ0X2ludGVyZmFj
ZSg8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIGlmX2Rl
c2MsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBzLSZn
dDtpZl9xdWV1ZSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKg
IMKgIF4odm1uZXRfcmV0dXJuX3Qgc3RhdHVzLCB4cGNfb2JqZWN0X3Q8YnI+DQomZ3Q7wqAgwqAg
wqBpbnRlcmZhY2VfcGFyYW0pIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIGlmX3N0YXR1cyA9IHN0YXR1czs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIGlmIChzdGF0dXMgIT0gVk1ORVRf
U1VDQ0VTUyB8fDxicj4NCiZndDvCoCDCoCDCoCFpbnRlcmZhY2VfcGFyYW0pIHs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGRpc3Bh
dGNoX3NlbWFwaG9yZV9zaWduYWwoaWZfY3JlYXRlZF9zZW0pOzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmV0dXJuOzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgfTxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCAmZ3Q7ICsjaWZkZWYgREVCVUc8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIHFlbXVfbG9nKCZxdW90O3ZtbmV0LnN0YXJ0LmludGVyZmFj
ZV9wYXJhbTpcbiZxdW90Oyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCB4cGNfZGljdGlvbmFyeV9hcHBseShpbnRlcmZhY2VfcGFyYW0sPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoF5ib29sKGNvbnN0IGNoYXIgKmssPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoHhwY19vYmplY3RfdCB2KSB7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoGNoYXIgKmRlc2MgPTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqB4cGNfY29weV9kZXNjcmlwdGlvbih2KTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcWVtdV9sb2coJnF1b3Q7IDxicj4NCiZndDvCoCDCoCDCoCVzPSVzXG4mcXVvdDss
IGssIGRlc2MpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBmcmVlKGRlc2Mp
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXR1cm4gdHJ1ZTs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfSk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCAmZ3Q7ICsjZW5kaWYgLyogREVCVUcgKi88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
ICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgcy0mZ3Q7bXR1ID0geHBjX2RpY3Rpb25hcnlfZ2V0X3VpbnQ2NCg8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGludGVyZmFj
ZV9wYXJhbSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIHZtbmV0X210dV9rZXkpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgcy0mZ3Q7bWF4X3BhY2tldF9zaXplID0geHBjX2Rp
Y3Rpb25hcnlfZ2V0X3VpbnQ2NCg8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGludGVyZmFjZV9wYXJhbSw8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHZtbmV0X21heF9w
YWNrZXRfc2l6ZV9rZXkpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBkaXNw
YXRjaF9zZW1hcGhvcmVfc2lnbmFsKGlmX2NyZWF0ZWRfc2VtKTs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIH0pOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCBpZiAocy0mZ3Q7dm1uZXRfaWYgPT0gTlVMTCkgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgZGlzcGF0Y2hfcmVsZWFzZShzLSZndDtpZl9xdWV1ZSk7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBkaXNwYXRj
aF9yZWxlYXNlKGlmX2NyZWF0ZWRfc2VtKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
ICZndDsgK8KgIMKgIMKgIMKgIGVycm9yX3NldGcoZXJycCw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7dW5hYmxl
IHRvIGNyZWF0ZSBpbnRlcmZhY2Ugd2l0aCByZXF1ZXN0ZWQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgcGFyYW1zJnF1b3Q7KTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIMKgIMKgIHJldHVybiAtMTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
ICZndDsgK8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgKzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgZGlzcGF0Y2hfc2VtYXBob3Jl
X3dhaXQoaWZfY3JlYXRlZF9zZW0sPGJyPg0KJmd0O8KgIMKgIMKgRElTUEFUQ0hfVElNRV9GT1JF
VkVSKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGRpc3BhdGNo
X3JlbGVhc2UoaWZfY3JlYXRlZF9zZW0pOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
Jmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBpZiAoaWZf
c3RhdHVzICE9IFZNTkVUX1NVQ0NFU1MpIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
ICZndDsgK8KgIMKgIMKgIMKgIGRpc3BhdGNoX3JlbGVhc2Uocy0mZ3Q7aWZfcXVldWUpOzxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgZXJyb3Jfc2V0Zyhl
cnJwLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAmcXVvdDtjYW5ub3QgY3JlYXRlIHZtbmV0IGludGVyZmFjZTogJXMmcXVv
dDssPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHZtbmV0X3N0YXR1c19tYXBfc3RyKGlmX3N0YXR1cykpOzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgcmV0dXJuIC0xOzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgfTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvC
oCDCoCBzLSZndDtzZW5kX2JoID0gYWlvX2JoX25ldyhxZW11X2dldF9haW9fY29udGV4dCgpLDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqB2bW5ldF9zZW5kX2JoLCBuYyk7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBzLSZndDtzZW5kX2VuYWJsZWQgPSB0
cnVlOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgdm1uZXRfYnVm
c19pbml0KHMpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCB2bW5ldF9pbnRlcmZhY2Vfc2V0X2V2
ZW50X2NhbGxiYWNrKDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAg
wqAgwqAgcy0mZ3Q7dm1uZXRfaWYsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCDCoCDCoCBWTU5FVF9JTlRFUkZBQ0VfUEFDS0VUU19BVkFJTEFCTEUsPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBzLSZndDtpZl9xdWV1ZSw8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIF4oaW50ZXJm
YWNlX2V2ZW50X3QgZXZlbnRfaWQsIHhwY19vYmplY3RfdCBldmVudCkgezxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgYXNzZXJ0KGV2ZW50X2lk
ID09PGJyPg0KJmd0O8KgIMKgIMKgVk1ORVRfSU5URVJGQUNFX1BBQ0tFVFNfQVZBSUxBQkxFKTs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIC8q
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCogVGhpcyBmdW5jdGlvbiBpcyBiZWluZyBjYWxsZWQgZnJvbSBhIG5vbiBxZW11PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoHRocmVhZCwgc288YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgKiB3ZSBvbmx5IHNjaGVkdWxlIGEgQkgs
IGFuZCBkbyB0aGUgcmVzdCBvZjxicj4NCiZndDvCoCDCoCDCoHRoZSBpbzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqBjb21wbGV0aW9uPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCogaGFuZGxpbmcgZnJvbSB2bW5ldF9zZW5kX2Jo
KCkgd2hpY2ggcnVucyBpbiBhPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoHFlbXUgY29u
dGV4dC48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgKi88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIHFlbXVfYmhfc2NoZWR1bGUocy0mZ3Q7c2VuZF9iaCk7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCB9KTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAg
wqAgcmV0dXJuIDA7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICt9PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArc3NpemVf
dCB2bW5ldF9yZWNlaXZlX2NvbW1vbihOZXRDbGllbnRTdGF0ZSAqbmMsPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGNvbnN0IHVpbnQ4X3QgKmJ1Ziw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2l6
ZV90IHNpemUpPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICt7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBWbW5ldENvbW1vblN0YXRlICpzID0g
RE9fVVBDQVNUKFZtbmV0Q29tbW9uU3RhdGUsIG5jLDxicj4NCiZndDvCoCDCoCDCoG5jKTs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHN0cnVjdCB2bXBrdGRlc2Mg
cGFja2V0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgc3RydWN0
IGlvdmVjIGlvdjs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGlu
dCBwa3RfY250Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgdm1u
ZXRfcmV0dXJuX3QgaWZfc3RhdHVzOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0
OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBpZiAoc2l6ZSAm
Z3Q7IHMtJmd0O21heF9wYWNrZXRfc2l6ZSkgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgwqAgwqAgd2Fybl9yZXBvcnQoJnF1b3Q7dm1uZXQ6IHBhY2tldCBpcyB0
b28gYmlnLCAlenUgJmd0OyAlJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgUFJJdTY0LDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgcGFja2V0LnZtX3BrdF9z
aXplLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgcy0m
Z3Q7bWF4X3BhY2tldF9zaXplKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgIMKgIHJldHVybiAtMTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgaW92Lmlvdl9iYXNlID0gKGNoYXIg
KikgYnVmOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgaW92Lmlv
dl9sZW4gPSBzaXplOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBwYWNrZXQudm1fcGt0X2lvdmNu
dCA9IDE7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBwYWNrZXQu
dm1fZmxhZ3MgPSAwOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAg
cGFja2V0LnZtX3BrdF9zaXplID0gc2l6ZTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
ICZndDsgK8KgIMKgIHBhY2tldC52bV9wa3RfaW92ID0gJmFtcDtpb3Y7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBwa3RfY250ID0gMTs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0
OyArwqAgwqAgaWZfc3RhdHVzID0gdm1uZXRfd3JpdGUocy0mZ3Q7dm1uZXRfaWYsICZhbXA7cGFj
a2V0LCAmYW1wO3BrdF9jbnQpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgaWYgKGlmX3N0YXR1cyAhPSBWTU5FVF9TVUNDRVNTKSB7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBlcnJvcl9yZXBvcnQoJnF1b3Q7dm1uZXQ6
IHdyaXRlIGVycm9yOiAlc1xuJnF1b3Q7LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB2bW5ldF9zdGF0dXNfbWFwX3N0
cihpZl9zdGF0dXMpKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKg
IMKgIMKgIHJldHVybiAtMTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgaWYgKGlmX3N0YXR1cyA9PSBWTU5FVF9TVUND
RVNTICZhbXA7JmFtcDsgcGt0X2NudCkgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoGBpZl9zdGF0dXMgPT0gVk1ORVRfU1VDQ0VTU2AgaXMgcmVk
dW5kYW50Ljxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyBNaXNzZWQgdGhpcywgdGhhbmtzLjxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoFJlZ2FyZHMsPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoEFraWhpa28gT2Rha2k8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgcmV0dXJuIHNp
emU7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCB9PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCByZXR1cm4gMDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK308YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
ICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICt2b2lkIHZtbmV0X2NsZWFudXBfY29tbW9uKE5ldENs
aWVudFN0YXRlICpuYyk8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK3s8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIFZtbmV0Q29tbW9uU3RhdGUg
KnMgPSBET19VUENBU1QoVm1uZXRDb21tb25TdGF0ZSwgbmMsPGJyPg0KJmd0O8KgIMKgIMKgbmMp
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgZGlzcGF0Y2hfc2Vt
YXBob3JlX3QgaWZfc3RvcHBlZF9zZW07PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAm
Z3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGlmIChzLSZn
dDt2bW5ldF9pZiA9PSBOVUxMKSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCDCoCDCoCByZXR1cm47PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIHZtbmV0X2ludGVyZmFjZV9zZXRfZXZl
bnRfY2FsbGJhY2soPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDC
oCDCoCBzLSZndDt2bW5ldF9pZiw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgIMKgIFZNTkVUX0lOVEVSRkFDRV9QQUNLRVRTX0FWQUlMQUJMRSw8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIE5VTEwsPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBOVUxMKTs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqBJIGRvbiYjMzk7dCB0aGlu
ayB0aGlzIHZtbmV0X2ludGVyZmFjZV9zZXRfZXZlbnRfY2FsbGJhY2sgY2FsbCBpczxicj4NCiZn
dDvCoCDCoCDCoG5lY2Vzc2FyeS48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgSSBrZXB0IGluIG1pbmQgdGhhdCB2bW5l
dCBwcm9jZXNzaW5nIGxpdmVzIGluIGEgc2VwYXJhdGUgdGhyZWFkPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgYW5kIHdoaWxlIGNsZWFudXAgaXQgbWF5IGNvbnRpbnVlIHJlY2VpdmluZyBwYWNrZXRz
LiBXaGlsZSB0aGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBxdWV1ZSBpcyBub3QgZW1wdHksIHZt
bmV0X3N0b3BfaW50ZXJmYWNlIGhhbmdzLiBVbnJlZ2lzdGVyaW5nPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgY2FsbGJhY2sgZW5zdXJlcyB0aGF0IHRoaXMgcXVldWUgd2lsbCBiZSBlbXB0aWVkIGFz
YXAuPGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBJdCB3aWxs
IHdvcmsgd2l0aG91dCB2bW5ldF9pbnRlcmZhY2Vfc2V0X2V2ZW50X2NhbGxiYWNrIGhlcmUsPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsgYnV0IEkgdGhpbmsgaXQmIzM5O3MgYmV0dGVyIHRvIGJlIHJl
c3BlY3RmdWwgdG8gdm1uZXQgYW5kIGNsZWFuPGJyPg0KJmd0O8KgIMKgIMKgZXZlcnl0aGluZzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7IHdlIGNhbiA6KTxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKg
IMKgWW91IG1heSBwdXQgcWVtdV9wdXJnZV9xdWV1ZWRfcGFja2V0cyBhZnRlciB2bW5ldF9zdG9w
X2ludGVyZmFjZSBpZiB5b3U8YnI+DQomZ3Q7wqAgwqAgwqB0aGluayBhYm91dCB0aGUgY2FzZSBp
dCBrZWVwcyByZWNldmluZyBwYWNrZXRzIHdoaWxlIGNsZWFuaW5nIHVwIHNpbmNlPGJyPg0KJmd0
O8KgIMKgIMKgaXQgaXMgdGhlIG9ubHkgdGhpbmcgaXQgZG9lcyBiZWZvcmUgY2FsbGluZyB2bW5l
dF9zdG9wX2ludGVyZmFjZS48YnI+DQomZ3Q7wqAgwqAgwqB2bW5ldF9zdG9wX2ludGVyZmFjZSB3
b3VsZCB0aGVuIHN0b3AgdGhpbmdzIGluIHRoZSBwcm9wZXIgb3JkZXIuIEl0IG1heTxicj4NCiZn
dDvCoCDCoCDCoGRlY2lkZSB0byBzdG9wIGV2ZW50IGNhbGxiYWNrcyBmaXJzdC4gT3RoZXJ3aXNl
LCBpdCBtYXkgZGVjaWRlIHRvIHN0b3A8YnI+DQomZ3Q7wqAgwqAgwqBzb21lIGludGVybmFsIGhl
YXZ5IGZ1bmN0aW9uYWxpdHkgZmlyc3QuIEl0IGlzIHVwIHRvIHZtbmV0LmZyYW1ld29yay48YnI+
DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoFJlZ2FyZHMsPGJyPg0KJmd0O8KgIMKgIMKgQWtpaGlr
byBPZGFraTxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgVGhhbmsgeW91ITxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgQmVzdCBSZWdhcmRzLDxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgVmxhZGlzbGF2PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsg
Kzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgcWVtdV9wdXJnZV9x
dWV1ZWRfcGFja2V0cyhuYyk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGlmX3N0b3BwZWRfc2Vt
ID0gZGlzcGF0Y2hfc2VtYXBob3JlX2NyZWF0ZSgwKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIHZtbmV0X3N0b3BfaW50ZXJmYWNlKDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgcy0mZ3Q7dm1uZXRfaWYsPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBzLSZndDtpZl9xdWV1ZSw8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIF4odm1uZXRf
cmV0dXJuX3Qgc3RhdHVzKSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCBhc3NlcnQoc3RhdHVzID09IFZNTkVUX1NVQ0NFU1MpOzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgZGlzcGF0Y2hf
c2VtYXBob3JlX3NpZ25hbChpZl9zdG9wcGVkX3NlbSk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCB9KTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIGRpc3BhdGNoX3NlbWFwaG9yZV93YWl0KGlmX3N0b3BwZWRfc2VtLDxi
cj4NCiZndDvCoCDCoCDCoERJU1BBVENIX1RJTUVfRk9SRVZFUik7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIHFlbXVfYmhfZGVsZXRlKHMtJmd0O3NlbmRfYmgpOzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgZGlzcGF0Y2hfcmVsZWFzZShpZl9zdG9wcGVkX3NlbSk7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBkaXNwYXRjaF9yZWxl
YXNlKHMtJmd0O2lmX3F1ZXVlKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsg
Kzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgZm9yIChpbnQgaSA9
IDA7IGkgJmx0OyBWTU5FVF9QQUNLRVRTX0xJTUlUOyArK2kpIHs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIGdfZnJlZShzLSZndDtpb3ZfYnVmW2ldLmlv
dl9iYXNlKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIH08YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK308YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgICZndDsgZGlmZiAtLWdpdCBhL25ldC92bW5ldC1zaGFyZWQuYyBiL25ldC92bW5l
dC1zaGFyZWQuYzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyBpbmRleCBmMDdh
ZmFhZjIxLi4yZjRlYjFkYjJkIDEwMDY0NDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
Jmd0OyAtLS0gYS9uZXQvdm1uZXQtc2hhcmVkLmM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgICZndDsgKysrIGIvbmV0L3ZtbmV0LXNoYXJlZC5jPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCAmZ3Q7IEBAIC0xMCwxNiArMTAsMTAzIEBAPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAjaW5j
bHVkZSAmcXVvdDtxZW11L29zZGVwLmgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgICZndDvCoCDCoCNpbmNsdWRlICZxdW90O3FhcGkvcWFwaS10eXBlcy1uZXQuaCZxdW90Ozxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArI2luY2x1ZGUgJnF1b3Q7cWFwaS9l
cnJvci5oJnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAjaW5j
bHVkZSAmcXVvdDt2bW5ldF9pbnQuaCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgI2luY2x1ZGUgJnF1b3Q7Y2xpZW50cy5oJnF1b3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCAmZ3Q7IC0jaW5jbHVkZSAmcXVvdDtxZW11L2Vycm9yLXJlcG9ydC5o
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7IC0jaW5jbHVkZSAmcXVv
dDtxYXBpL2Vycm9yLmgmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDvCoCDCoCNpbmNsdWRlICZsdDt2bW5l
dC92bW5ldC5oJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArdHlwZWRlZiBzdHJ1Y3QgVm1uZXRTaGFyZWRT
dGF0ZSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBWbW5ldENv
bW1vblN0YXRlIGNzOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArfSBWbW5l
dFNoYXJlZFN0YXRlOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgICZndDsgK3N0YXRpYyBib29sIHZhbGlkYXRlX29wdGlvbnMoY29uc3QgTmV0ZGV2ICpu
ZXRkZXYsIEVycm9yPGJyPg0KJmd0O8KgIMKgIMKgKiplcnJwKTxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgJmd0OyArezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgY29uc3QgTmV0ZGV2Vm1uZXRTaGFyZWRPcHRpb25zICpvcHRpb25zID08YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgIMKgJmFtcDsobmV0ZGV2LSZndDt1LnZtbmV0X3NoYXJlZCk7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgICZndDsgKyNpZiAhZGVmaW5lZChNQUNfT1NfVkVSU0lPTl8xMV8wKSB8fCBcPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBNQUNfT1NfWF9WRVJTSU9O
X01JTl9SRVFVSVJFRCAmbHQ7IE1BQ19PU19WRVJTSU9OXzExXzA8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGlmIChvcHRpb25zLSZndDtoYXNfaXNvbGF0ZWQpIHs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIGVycm9yX3Nl
dGcoZXJycCw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgJnF1b3Q7dm1uZXQtc2hhcmVkLmlzb2xhdGVkIGZlYXR1cmUgaXMg
JnF1b3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCZxdW90O3VuYXZhaWxhYmxlOiBvdXRkYXRlZCB2bW5ldC5mcmFtZXdv
cms8YnI+DQomZ3Q7wqAgwqAgwqBBUEkmcXVvdDspOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgcmV0dXJuIGZhbHNlOzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
Jmd0OyArI2VuZGlmPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGlmICgob3B0aW9ucy0mZ3Q7aGFz
X3N0YXJ0X2FkZHJlc3MgfHw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIMKgIMKgIMKgb3B0aW9ucy0mZ3Q7aGFzX2VuZF9hZGRyZXNzIHx8PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoG9wdGlvbnMtJmd0O2hhc19zdWJu
ZXRfbWFzaykgJmFtcDsmYW1wOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgwqAgwqAgIShvcHRpb25zLSZndDtoYXNfc3RhcnRfYWRkcmVzcyAmYW1wOyZhbXA7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCBvcHRpb25z
LSZndDtoYXNfZW5kX2FkZHJlc3MgJmFtcDsmYW1wOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgb3B0aW9ucy0mZ3Q7aGFzX3N1Ym5ldF9tYXNrKSkg
ezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgZXJyb3Jf
c2V0ZyhlcnJwLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAmcXVvdDsmIzM5O3N0YXJ0LWFkZHJlc3MmIzM5OywgJiMzOTtl
bmQtYWRkcmVzcyYjMzk7LDxicj4NCiZndDvCoCDCoCDCoCYjMzk7c3VibmV0LW1hc2smIzM5OyAm
cXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgJnF1b3Q7c2hvdWxkIGJlIHByb3ZpZGVkIHRvZ2V0aGVyJnF1b3Q7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCApOzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgcmV0dXJuIGZhbHNlOzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgfTxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCByZXR1cm4gdHJ1ZTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZn
dDsgK308YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArc3RhdGljIHhwY19vYmplY3RfdCBidWlsZF9pZl9kZXNj
KGNvbnN0IE5ldGRldiAqbmV0ZGV2KTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0
OyArezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgY29uc3QgTmV0
ZGV2Vm1uZXRTaGFyZWRPcHRpb25zICpvcHRpb25zID08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmFtcDsobmV0ZGV2LSZndDt1LnZtbmV0X3NoYXJlZCk7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCB4cGNfb2JqZWN0X3QgaWZfZGVzYyA9IHhwY19kaWN0
aW9uYXJ5X2NyZWF0ZShOVUxMLDxicj4NCiZndDvCoCDCoCDCoE5VTEwsIDApOzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCB4cGNfZGljdGlvbmFyeV9zZXRfdWludDY0KDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgaWZfZGVzYyw8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHZtbmV0X29wZXJhdGlvbl9tb2RlX2tl
eSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIFZNTkVU
X1NIQVJFRF9NT0RFPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCAp
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBpZiAob3B0aW9ucy0mZ3Q7aGFzX25hdDY2X3ByZWZp
eCkgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgeHBj
X2RpY3Rpb25hcnlfc2V0X3N0cmluZyhpZl9kZXNjLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgdm1uZXRfbmF0NjZfcHJlZml4X2tleSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIG9wdGlvbnMtJmd0O25hdDY2X3ByZWZpeCk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCB9PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGlmIChvcHRpb25zLSZn
dDtoYXNfc3RhcnRfYWRkcmVzcykgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0
OyArwqAgwqAgwqAgwqAgeHBjX2RpY3Rpb25hcnlfc2V0X3N0cmluZyhpZl9kZXNjLDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdm1uZXRfc3RhcnRfYWRkcmVzc19rZXksPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBvcHRpb25zLSZndDtzdGFydF9hZGRyZXNzKTs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIHhwY19kaWN0aW9uYXJ5
X3NldF9zdHJpbmcoaWZfZGVzYyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHZtbmV0
X2VuZF9hZGRyZXNzX2tleSw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIG9wdGlvbnMt
Jmd0O2VuZF9hZGRyZXNzKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIMKgIMKgIHhwY19kaWN0aW9uYXJ5X3NldF9zdHJpbmcoaWZfZGVzYyw8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIHZtbmV0X3N1Ym5ldF9tYXNrX2tleSw8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIG9wdGlvbnMtJmd0O3N1Ym5ldF9tYXNrKTs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKg
IMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArI2lmIGRlZmlu
ZWQoTUFDX09TX1ZFUlNJT05fMTFfMCkgJmFtcDsmYW1wOyBcPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBNQUNfT1NfWF9WRVJTSU9OX01JTl9SRVFVSVJFRCAmZ3Q7
PSBNQUNfT1NfVkVSU0lPTl8xMV8wPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCB4cGNfZGljdGlvbmFyeV9zZXRfYm9vbCg8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIGlmX2Rlc2MsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCB2bW5ldF9lbmFibGVfaXNvbGF0aW9uX2tleSw8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIG9wdGlvbnMtJmd0
O2lzb2xhdGVkPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCApOzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArI2VuZGlmPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIHJldHVybiBpZl9kZXNjOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
Jmd0OyArfTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICtzdGF0aWMgTmV0Q2xpZW50SW5mbyBuZXRfdm1uZXRf
c2hhcmVkX2luZm8gPSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCAudHlwZSA9IE5FVF9DTElFTlRfRFJJVkVSX1ZNTkVUX1NIQVJFRCw8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIC5zaXplID0gc2l6ZW9mKFZtbmV0U2hhcmVkU3Rh
dGUpLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgLnJlY2VpdmUg
PSB2bW5ldF9yZWNlaXZlX2NvbW1vbiw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIC5jbGVhbnVwID0gdm1uZXRfY2xlYW51cF9jb21tb24sPGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCAmZ3Q7ICt9Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
Jmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7wqAgwqBpbnQgbmV0X2lu
aXRfdm1uZXRfc2hhcmVkKGNvbnN0IE5ldGRldiAqbmV0ZGV2LCBjb25zdDxicj4NCiZndDvCoCDC
oCDCoGNoYXIgKm5hbWUsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBOZXRDbGllbnRTdGF0ZSAqcGVl
ciwgRXJyb3I8YnI+DQomZ3Q7wqAgwqAgwqAqKmVycnApPGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7IC3C
oCBlcnJvcl9zZXRnKGVycnAsICZxdW90O3ZtbmV0LXNoYXJlZCBpcyBub3QgaW1wbGVtZW50ZWQg
eWV0JnF1b3Q7KTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgLcKgIHJldHVy
biAtMTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIE5ldENsaWVu
dFN0YXRlICpuYyA9PGJyPg0KJmd0O8KgIMKgIMKgcWVtdV9uZXdfbmV0X2NsaWVudCgmYW1wO25l
dF92bW5ldF9zaGFyZWRfaW5mbyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgcGVlciw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgJnF1b3Q7dm1u
ZXQtc2hhcmVkJnF1b3Q7LCBuYW1lKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIGlmICghdmFsaWRhdGVfb3B0aW9ucyhuZXRkZXYsIGVycnApKSB7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCBnX2Fzc2VydF9ub3RfcmVh
Y2hlZCgpOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAg
cmV0dXJuIC0xOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgfTxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgcmV0dXJuIHZtbmV0X2lm
X2NyZWF0ZShuYywgYnVpbGRfaWZfZGVzYyhuZXRkZXYpLCBlcnJwKTs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgICZndDvCoCDCoH08YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKg
ICZndDsgZGlmZiAtLWdpdCBhL25ldC92bW5ldF9pbnQuaCBiL25ldC92bW5ldF9pbnQuaDxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyBpbmRleCBhYWM0ZDVhZjY0Li44ZjMzMjFl
ZjNlIDEwMDY0NDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyAtLS0gYS9uZXQv
dm1uZXRfaW50Lmg8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgKysrIGIvbmV0
L3ZtbmV0X2ludC5oPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7IEBAIC0xNSwx
MSArMTUsNTAgQEA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDvCoCDCoCNpbmNs
dWRlICZxdW90O2NsaWVudHMuaCZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgI2luY2x1ZGUgJmx0
O3ZtbmV0L3ZtbmV0LmgmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICsj
aW5jbHVkZSAmbHQ7ZGlzcGF0Y2gvZGlzcGF0Y2guaCZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0
O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArLyoq
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICsgKsKgIEZyb20gdm1uZXQuZnJh
bWV3b3JrIGRvY3VtZW50YXRpb248YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsg
KyAqPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICsgKsKgIEVhY2ggcmVhZC93
cml0ZSBjYWxsIGFsbG93cyB1cCB0byAyMDAgcGFja2V0cyB0byBiZTxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgJmd0OyArICrCoCByZWFkIG9yIHdyaXR0ZW4gZm9yIGEgbWF4aW11bSBv
ZiAyNTZLQi48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgKyAqPGJyPg0KJmd0
O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICsgKsKgIEVhY2ggcGFja2V0IHdyaXR0ZW4gc2hv
dWxkIGJlIGEgY29tcGxldGU8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgKyAq
wqAgZXRoZXJuZXQgZnJhbWUuPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICsg
Kjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArICogPGEgaHJlZj0iaHR0cHM6
Ly9kZXZlbG9wZXIuYXBwbGUuY29tL2RvY3VtZW50YXRpb24vdm1uZXQiIHJlbD0ibm9yZWZlcnJl
ciBub3JlZmVycmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9kZXZlbG9wZXIuYXBwbGUuY29t
L2RvY3VtZW50YXRpb24vdm1uZXQ8L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0OzxhIGhyZWY9Imh0
dHBzOi8vZGV2ZWxvcGVyLmFwcGxlLmNvbS9kb2N1bWVudGF0aW9uL3ZtbmV0IiByZWw9Im5vcmVm
ZXJyZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0dHBzOi8vZGV2ZWxvcGVyLmFwcGxl
LmNvbS9kb2N1bWVudGF0aW9uL3ZtbmV0PC9hPiZndDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8Kg
IMKgIMKgJmx0OzxhIGhyZWY9Imh0dHBzOi8vZGV2ZWxvcGVyLmFwcGxlLmNvbS9kb2N1bWVudGF0
aW9uL3ZtbmV0IiByZWw9Im5vcmVmZXJyZXIgbm9yZWZlcnJlciIgdGFyZ2V0PSJfYmxhbmsiPmh0
dHBzOi8vZGV2ZWxvcGVyLmFwcGxlLmNvbS9kb2N1bWVudGF0aW9uL3ZtbmV0PC9hPjxicj4NCiZn
dDvCoCDCoCDCoCZsdDs8YSBocmVmPSJodHRwczovL2RldmVsb3Blci5hcHBsZS5jb20vZG9jdW1l
bnRhdGlvbi92bW5ldCIgcmVsPSJub3JlZmVycmVyIG5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5r
Ij5odHRwczovL2RldmVsb3Blci5hcHBsZS5jb20vZG9jdW1lbnRhdGlvbi92bW5ldDwvYT4mZ3Q7
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArICovPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICsjZGVmaW5lIFZNTkVUX1BBQ0tFVFNfTElNSVQgMjAw
PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqB0eXBlZGVmIHN0cnVjdCBWbW5ldENvbW1vblN0YXRlIHs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgLcKgIE5ldENsaWVudFN0YXRlIG5jOzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgTmV0Q2xpZW50U3RhdGUg
bmM7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBpbnRlcmZhY2Vf
cmVmIHZtbmV0X2lmOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCB1aW50NjRfdCBtdHU7PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCB1aW50NjRfdCBtYXhfcGFja2V0
X3NpemU7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBkaXNwYXRjaF9xdWV1ZV90IGlmX3F1ZXVlOzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBRRU1VQkggKnNlbmRfYmg7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCBib29sIHNlbmRfZW5hYmxlZDs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
Jmd0OyArwqAgwqAgc3RydWN0IHZtcGt0ZGVzYyBwYWNrZXRzX2J1ZltWTU5FVF9QQUNLRVRTX0xJ
TUlUXTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIGludCBwYWNr
ZXRzX3NlbmRfY3VycmVudF9wb3M7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCBpbnQgcGFja2V0c19zZW5kX2VuZF9wb3M7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK8KgIMKg
IHN0cnVjdCBpb3ZlYyBpb3ZfYnVmW1ZNTkVUX1BBQ0tFVFNfTElNSVRdOzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgfSBWbW5ldENvbW1vblN0YXRlOzxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
Jmd0OyArY29uc3QgY2hhciAqdm1uZXRfc3RhdHVzX21hcF9zdHIodm1uZXRfcmV0dXJuX3Qgc3Rh
dHVzKTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyAraW50IHZtbmV0X2lmX2NyZWF0ZShOZXRDbGllbnRTdGF0
ZSAqbmMsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCB4cGNfb2JqZWN0X3QgaWZfZGVzYyw8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIEVycm9yICoq
ZXJycCk7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgICZndDsgK3NzaXplX3Qgdm1uZXRfcmVjZWl2ZV9jb21tb24oTmV0
Q2xpZW50U3RhdGUgKm5jLDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb25zdCB1aW50OF90ICpi
dWYsPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNpemVfdCBzaXplKTs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0
OyArdm9pZCB2bW5ldF9jbGVhbnVwX2NvbW1vbihOZXRDbGllbnRTdGF0ZSAqbmMpOzxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgI2VuZGlmIC8qIFZNTkVUX0lOVF9IICovPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDs8YnI+DQomZ3Q7IDxicj4NCjxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj48L2Rpdj4NCg==
--0000000000008bf6f805da35e60d--

