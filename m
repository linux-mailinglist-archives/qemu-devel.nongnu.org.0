Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A8036B4EB
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Apr 2021 16:30:54 +0200 (CEST)
Received: from localhost ([::1]:48060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lb2GC-000740-68
	for lists+qemu-devel@lfdr.de; Mon, 26 Apr 2021 10:30:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hello@adns.io>) id 1lb1su-0001XK-R8
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:06:48 -0400
Received: from mail.adnsio.dev ([51.159.160.147]:51390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hello@adns.io>) id 1lb1so-0005uv-Kn
 for qemu-devel@nongnu.org; Mon, 26 Apr 2021 10:06:48 -0400
Authentication-Results: mail.adnsio.dev; auth=pass (plain);
 spf=softfail smtp.mailfrom=adns.io
Received-SPF: SoftFail (mail.adnsio.dev: domain of adns.io does not designate
 2001:b07:ad4:c4c1:bc98:c9b:d77f:6678 as permitted sender)
 receiver=mail.adnsio.dev; identity=mailfrom;
 client-ip=2001:b07:ad4:c4c1:bc98:c9b:d77f:6678
 helo=[IPv6:2001:b07:ad4:c4c1:bc98:c9b:d77f:6678];
 envelope-from=<hello@adns.io>
From: Alessio Dionisi <hello@adns.io>
Message-Id: <B1205E88-C4E0-4808-B117-F4E277F1EAB9@adns.io>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_A22587D6-1288-42FD-9FE5-1663BC9E9796"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v4] net/macos: implement vmnet-based netdev
Date: Mon, 26 Apr 2021 16:05:46 +0200
In-Reply-To: <CAAi_9z78mV-KF6msw+NDrTigu=FwgnRRYeYQbVDgcv2aW55ALQ@mail.gmail.com>
To: Phillip Tennen <phillip.ennen@gmail.com>
References: <20210218134947.1860-1-phillip.ennen@gmail.com>
 <YDWOxkr1/p07UaFE@SPB-NB-133.local>
 <CAAi_9z78mV-KF6msw+NDrTigu=FwgnRRYeYQbVDgcv2aW55ALQ@mail.gmail.com>
DKIM-Signature: v=1; a=rsa-sha256;
 bh=QTU9DeNS95rHwLzOci40KF60U7tzxHCyqFXnRXLp4xQ=; c=relaxed/simple; d=adns.io;
 h=from:subject:date:message-id:to:cc:mime-version; s=s20191010754;
 b=eoaUU+1y3q2DM9yguYRatMGcMvP0xsOxCc8P5sWSX+LcFjXrfj3oJ8Z8N7USoRLkOmbAmx2Utk9skLtFP1qrPlyzcXB0qKQJYGSHi0CV8P+NlexLzSnTgFR2CEcILClJUBdBP/McJn271J7/f18XTtBw1Rgh7O1jplDwn7xlJ6uAchL1Kyyl5ffWLBAgTP0U9v7qjlrpYQXdUEDefCKnq+04MYhh/2K09nLLH0WBYhefMNgmuvxSdFfKwvuoH1jvl13mpT7hJnvbU6/61gVtfGhOaNlm0N2sy9HmkUCjmQfSJ6LevQeSQ255Pc6h4jpbxT+7RjIin4vhwpXmk/5Q2A==
Received: from localhost (Unknown [127.0.0.1])
 by mail.adnsio.dev (Haraka) with ESMTPSA id
 944700D8-ED36-49C5-9795-DC997C8FAFD2.1
 envelope-from <hello@adns.io> (authenticated bits=0)
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Mon, 26 Apr 2021 16:06:18 +0200
Received-SPF: pass client-ip=51.159.160.147; envelope-from=hello@adns.io;
 helo=mail.adnsio.dev
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 MSGID_FROM_MTA_HEADER=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 26 Apr 2021 10:28:51 -0400
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 jasowang@redhat.com, Markus Armbruster <armbru@redhat.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Phillip Tennen <phillip@axleos.com>,
 Howard Spoelstra <hsp.cat7@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Apple-Mail=_A22587D6-1288-42FD-9FE5-1663BC9E9796
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello,

I'm replying to this thread to let you know that I am available to help =
out on this patch as I have been working on the same feature for a few =
weeks.

AD

> On 3 Mar 2021, at 12:24, Phillip Tennen <phillip.ennen@gmail.com =
<mailto:phillip.ennen@gmail.com>> wrote:
>=20
> Thanks very much for your help and feedback!
>=20
> Apologies for my delay in following up. I'll submit a new version that =
implements the feedback you've provided here, as well as the QAPI schema =
changes @Markus Armbruster <mailto:armbru@redhat.com> (thanks to you as =
well for your time and review!) pointed out.
>=20
> Phillip
>=20
> On Wed, Feb 24, 2021 at 12:25 AM Roman Bolshakov =
<r.bolshakov@yadro.com <mailto:r.bolshakov@yadro.com>> wrote:
> On Thu, Feb 18, 2021 at 02:49:47PM +0100, phillip.ennen@gmail.com =
<mailto:phillip.ennen@gmail.com> wrote:
> > From: Phillip Tennen <phillip@axleos.com =
<mailto:phillip@axleos.com>>
> >=20
> > This patch implements a new netdev device, reachable via -netdev
> > vmnet-macos, that=E2=80=99s backed by macOS=E2=80=99s vmnet =
framework.
> >=20
> > The vmnet framework provides native bridging support, and its usage =
in
> > this patch is intended as a replacement for attempts to use a tap =
device
> > via the tuntaposx kernel extension. Notably, the tap/tuntaposx =
approach
> > never would have worked in the first place, as QEMU interacts with =
the
> > tap device via poll(), and macOS does not support polling device =
files.
> >=20
> > vmnet requires either a special entitlement, granted via a =
provisioning
> > profile, or root access. Otherwise attempts to create the virtual
> > interface will fail with a =E2=80=9Cgeneric error=E2=80=9D status =
code. QEMU may not
> > currently be signed with an entitlement granted in a provisioning
> > profile, as this would necessitate pre-signed binary build =
distribution,
> > rather than source-code distribution. As such, using this netdev
> > currently requires that qemu be run with root access. I=E2=80=99ve =
opened a
> > feedback report with Apple to allow the use of the relevant =
entitlement
> > with this use case:
> > https://openradar.appspot.com/radar?id=3D5007417364447232 =
<https://openradar.appspot.com/radar?id=3D5007417364447232>
> >=20
> > vmnet offers three operating modes, all of which are supported by =
this
> > patch via the =E2=80=9Cmode=3Dhost|shared|bridge=E2=80=9D option:
> >=20
> > * "Host" mode: Allows the vmnet interface to communicate with other
> > * vmnet
> > interfaces that are in host mode and also with the native host.
> > * "Shared" mode: Allows traffic originating from the vmnet interface =
to
> > reach the Internet through a NAT. The vmnet interface can also
> > communicate with the native host.
> > * "Bridged" mode: Bridges the vmnet interface with a physical =
network
> > interface.
> >=20
> > Each of these modes also provide some extra configuration that=E2=80=99=
s
> > supported by this patch:
> >=20
> > * "Bridged" mode: The user may specify the physical interface to =
bridge
> > with. Defaults to en0.
> > * "Host" mode / "Shared" mode: The user may specify the DHCP range =
and
> > subnet. Allocated by vmnet if not provided.
> >=20
> > vmnet also offers some extra configuration options that are not
> > supported by this patch:
> >=20
> > * Enable isolation from other VMs using vmnet
> > * Port forwarding rules
> > * Enabling TCP segmentation offload
> > * Only applicable in "shared" mode: specifying the NAT IPv6 prefix
> > * Only available in "host" mode: specifying the IP address for the =
VM
> > within an isolated network
> >=20
> > Note that this patch requires macOS 10.15 as a minimum, as this is =
when
> > bridging support was implemented in vmnet.framework.
> >=20
> > Signed-off-by: Phillip Tennen <phillip@axleos.com =
<mailto:phillip@axleos.com>>
> > ---
> >  configure         |   2 +-
> >  net/clients.h     |   6 +
> >  net/meson.build   |   1 +
> >  net/net.c         |   3 +
> >  net/vmnet-macos.c | 447 =
++++++++++++++++++++++++++++++++++++++++++++++
> >  qapi/net.json     | 120 ++++++++++++-
> >  qemu-options.hx   |   9 +
> >  7 files changed, 585 insertions(+), 3 deletions(-)
> >  create mode 100644 net/vmnet-macos.c
> >=20
>=20
> Hi Phillip,
>=20
> Thanks for working on this!
>=20
> Note that the patch doesn't apply to current master and there's a lot =
of
> warnings wrt trailing whitespaces:
>=20
> git am v4-net-macos-implement-vmnet-based-netdev.patch
> Applying: net/macos: implement vmnet-based netdev
> .git/rebase-apply/patch:462: trailing whitespace.
>          * If QEMU is started with -nographic, no Cocoa event loop =
will be
> .git/rebase-apply/patch:465: trailing whitespace.
>         =
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,
> .git/rebase-apply/patch:466: trailing whitespace.
>                                                  0),
> .git/rebase-apply/patch:532: trailing whitespace.
> # @host: the guest may communicate with the host
> .git/rebase-apply/patch:535: trailing whitespace.
> # @shared: the guest may reach the Internet through a NAT,
> error: patch failed: configure:778
> error: configure: patch does not apply
> Patch failed at 0001 net/macos: implement vmnet-based netdev
> hint: Use 'git am --show-current-patch' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am =
--abort".
>=20
> Also it would be helpful to provide a changelog under commit message
> delimiter ("---")  for reach new version of the patch to provide an
> overview of what has been changed between the versions.
>=20
> > diff --git a/configure b/configure
> > index 4afd22bdf5..f449198db1 100755
> > --- a/configure
> > +++ b/configure
> > @@ -778,7 +778,7 @@ Darwin)
> >    fi
> >    audio_drv_list=3D"coreaudio try-sdl"
> >    audio_possible_drivers=3D"coreaudio sdl"
> > -  QEMU_LDFLAGS=3D"-framework CoreFoundation -framework IOKit =
$QEMU_LDFLAGS"
> > +  QEMU_LDFLAGS=3D"-framework CoreFoundation -framework IOKit =
-framework vmnet $QEMU_LDFLAGS"
>=20
> I'm not sure this is right approach. Instead, we need a new
> configuration option for the feature + proper discovery. Something =
like
> this should work:
>=20
> =
https://github.com/roolebo/qemu/commit/e6c52d6bedb92f16defb5782b696853824b=
14bd9 =
<https://github.com/roolebo/qemu/commit/e6c52d6bedb92f16defb5782b696853824=
b14bd9>
>=20
> >    # Disable attempts to use ObjectiveC features in os/object.h =
since they
> >    # won't work when we're compiling with gcc as a C compiler.
> >    QEMU_CFLAGS=3D"-DOS_OBJECT_USE_OBJC=3D0 $QEMU_CFLAGS"
> > diff --git a/net/clients.h b/net/clients.h
> > index 92f9b59aed..463a9b2f67 100644
> > --- a/net/clients.h
> > +++ b/net/clients.h
> > @@ -63,4 +63,10 @@ int net_init_vhost_user(const Netdev *netdev, =
const char *name,
> > =20
> >  int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
> >                          NetClientState *peer, Error **errp);
> > +
> > +#ifdef CONFIG_DARWIN
>=20
> Respectively, it would be wrapped with #ifdef CONFIG_VMNET instead of
> more generic CONFIG_DARWIN.
>=20
> > +int net_init_vmnet_macos(const Netdev *netdev, const char *name,
> > +                        NetClientState *peer, Error **errp);
> > +#endif
> > +
> >  #endif /* QEMU_NET_CLIENTS_H */
> > diff --git a/net/meson.build b/net/meson.build
> > index 1076b0a7ab..8c7c32f775 100644
> > --- a/net/meson.build
> > +++ b/net/meson.build
> > @@ -37,5 +37,6 @@ endif
> >  softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files(tap_posix))
> >  softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('tap-win32.c'))
> >  softmmu_ss.add(when: 'CONFIG_VHOST_NET_VDPA', if_true: =
files('vhost-vdpa.c'))
> > +softmmu_ss.add(when: 'CONFIG_DARWIN', if_true: =
files('vmnet-macos.c'))
> > =20
> >  subdir('can')
> > diff --git a/net/net.c b/net/net.c
> > index c1cd9c75f6..e68a410a89 100644
> > --- a/net/net.c
> > +++ b/net/net.c
> > @@ -977,6 +977,9 @@ static int (* const =
net_client_init_fun[NET_CLIENT_DRIVER__MAX])(
> >  #ifdef CONFIG_L2TPV3
> >          [NET_CLIENT_DRIVER_L2TPV3]    =3D net_init_l2tpv3,
> >  #endif
> > +#ifdef CONFIG_DARWIN
>=20
> CONFIG_VMNET should be used here as well.
>=20
> > +        [NET_CLIENT_DRIVER_VMNET_MACOS] =3D net_init_vmnet_macos,
> > +#endif
> >  };
> > =20
> > =20
> > diff --git a/net/vmnet-macos.c b/net/vmnet-macos.c
> > new file mode 100644
> > index 0000000000..1a762751dd
> > --- /dev/null
> > +++ b/net/vmnet-macos.c
> > @@ -0,0 +1,447 @@
> > +/*
> > + * vmnet.framework backed netdev for macOS 10.15+ hosts
> > + *
> > + * Copyright (c) 2021 Phillip Tennen <phillip@axleos.com =
<mailto:phillip@axleos.com>>
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 =
or later.
> > + * See the COPYING file in the top-level directory.
> > + *
> > + */
> > +#include "qemu/osdep.h"
> > +#include "qemu/main-loop.h"
> > +#include "qemu/error-report.h"
> > +#include "qapi/qapi-types-net.h"
> > +#include "net/net.h"
> > +/* macOS vmnet framework header */
> > +#include <vmnet/vmnet.h>
> > +
> > +typedef struct vmnet_state {
> > +    NetClientState nc;
> > +    interface_ref vmnet_iface_ref;
> > +    /* Switched on after vmnet informs us that the interface has =
started */
> > +    bool link_up;
> > +    /*
> > +     * If qemu_send_packet_async returns 0, this is switched off =
until our
> > +     * delivery callback is invoked
> > +     */
> > +    bool qemu_ready_to_receive;
> > +} vmnet_state_t;
> > +
> > +int net_init_vmnet_macos(const Netdev *netdev, const char *name,
> > +                         NetClientState *peer, Error **errp);
> > +
> > +static const char *_vmnet_status_repr(vmnet_return_t status)
>=20
> Underscore may be dropped.
>=20
> > +{
> > +    switch (status) {
> > +    case VMNET_SUCCESS:
> > +        return "success";
> > +    case VMNET_FAILURE:
> > +        return "generic failure";
> > +    case VMNET_MEM_FAILURE:
> > +        return "out of memory";
> > +    case VMNET_INVALID_ARGUMENT:
> > +        return "invalid argument";
> > +    case VMNET_SETUP_INCOMPLETE:
> > +        return "setup is incomplete";
> > +    case VMNET_INVALID_ACCESS:
> > +        return "insufficient permissions";
> > +    case VMNET_PACKET_TOO_BIG:
> > +        return "packet size exceeds MTU";
> > +    case VMNET_BUFFER_EXHAUSTED:
> > +        return "kernel buffers temporarily exhausted";
> > +    case VMNET_TOO_MANY_PACKETS:
> > +        return "number of packets exceeds system limit";
> > +    /* This error code was introduced in macOS 11.0 */
> > +#if __MAC_OS_X_VERSION_MAX_ALLOWED >=3D 110000
> > +    case VMNET_SHARING_SERVICE_BUSY:
> > +        return "sharing service busy";
> > +#endif
> > +    default:
> > +        return "unknown status code";
> > +    }
> > +}
> > +
> > +static operating_modes_t _vmnet_operating_mode_enum_compat(
> > +    VmnetOperatingMode mode)
>=20
> Underscore may be dropped.
>=20
> > +{
> > +    switch (mode) {
> > +    case VMNET_OPERATING_MODE_HOST:
> > +        return VMNET_HOST_MODE;
> > +    case VMNET_OPERATING_MODE_SHARED:
> > +        return VMNET_SHARED_MODE;
> > +    case VMNET_OPERATING_MODE_BRIDGED:
> > +        return VMNET_BRIDGED_MODE;
> > +    default:
> > +        /* Should never happen as the modes are parsed before we =
get here */
> > +        assert(false);
> > +    }
> > +}
> > +
> > +static bool vmnet_can_receive(NetClientState *nc)
> > +{
> > +    vmnet_state_t *s =3D DO_UPCAST(vmnet_state_t, nc, nc);
> > +    return s->link_up;
>=20
> I'm not sure this is correct.
> Did you mean s->qemu_ready_to_receive?
>=20
> > +}
> > +
> > +static ssize_t vmnet_receive_iov(NetClientState *nc,
> > +                                 const struct iovec *iovs,
> > +                                 int iovcnt)
> > +{
> > +    vmnet_state_t *s =3D DO_UPCAST(vmnet_state_t, nc, nc);
> > +
> > +    /* Combine the provided iovs into a single vmnet packet */
> > +    struct vmpktdesc *packet =3D g_new0(struct vmpktdesc, 1);
>=20
> packet_count could be used instead of 1.
>=20
> > +    packet->vm_pkt_iov =3D g_new0(struct iovec, iovcnt);
> > +    memcpy(packet->vm_pkt_iov, iovs, sizeof(struct iovec) * =
iovcnt);
> > +    packet->vm_pkt_iovcnt =3D iovcnt;
>=20
> Should we use iov_copy() instead?
>=20
> > +    packet->vm_flags =3D 0;
>=20
> The line is redundant with g_new0.
>=20
> > +
> > +    /* Figure out the packet size by iterating the iov's */
> > +    for (int i =3D 0; i < iovcnt; i++) {
> > +        const struct iovec *iov =3D iovs + i;
> > +        packet->vm_pkt_size +=3D iov->iov_len;
> > +    }
>=20
> I wonder if we should add a check if packet->vm_pkt_size is beyond
> vmnet_max_packet_size_key?
>=20
> Also I'm not entirely sure that we should at most transmit only one
> packet, a sort of coalescing might be helpful (Apple claims up ot 200
> packets per one vmnet_write) but I'm not an expert of net part of =
QEMU.
> Stefan may provide more info on that.
>=20
> > +
> > +    /* Finally, write the packet to the vmnet interface */
> > +    int packet_count =3D 1;
> > +    vmnet_return_t result =3D vmnet_write(s->vmnet_iface_ref, =
packet,
> > +                                        &packet_count);
> > +    if (result !=3D VMNET_SUCCESS || packet_count !=3D 1) {
> > +        error_printf("Failed to send packet to host: %s\n",
> > +            _vmnet_status_repr(result));
> > +    }
> > +    ssize_t wrote_bytes =3D packet->vm_pkt_size;
>=20
> That's going to mismatch with actual number of bytes written if
> packet_count returned from vmnet_write equals zero.
>=20
> > +    g_free(packet->vm_pkt_iov);
> > +    g_free(packet);
> > +    return wrote_bytes;
> > +}
> > +
> > +static void vmnet_send_completed(NetClientState *nc, ssize_t len)
> > +{
> > +    vmnet_state_t *vmnet_client_state =3D DO_UPCAST(vmnet_state_t, =
nc, nc);
> > +    /* Ready to receive more packets! */
> > +    vmnet_client_state->qemu_ready_to_receive =3D true;
> > +}
> > +
> > +static NetClientInfo net_vmnet_macos_info =3D {
> > +    .type =3D NET_CLIENT_DRIVER_VMNET_MACOS,
> > +    .size =3D sizeof(vmnet_state_t),
> > +    .receive_iov =3D vmnet_receive_iov,
> > +    .can_receive =3D vmnet_can_receive,
> > +};
> > +
> > +static bool _validate_ifname_is_valid_bridge_target(const char =
*ifname)
>=20
> Underscore may be dropped from the function.
>=20
> > +{
> > +    /* Iterate available bridge interfaces, ensure the provided one =
is valid */
> > +    xpc_object_t bridge_interfaces =3D =
vmnet_copy_shared_interface_list();
> > +    bool failed_to_match_iface_name =3D xpc_array_apply(
> > +        bridge_interfaces,
> > +        ^bool(size_t index, xpc_object_t  _Nonnull value) {
> > +        if (!strcmp(xpc_string_get_string_ptr(value), ifname)) {
> > +            /* The interface name is valid! Stop iterating */
> > +            return false;
> > +        }
> > +        return true;
> > +    });
> > +
> > +    if (failed_to_match_iface_name) {
> > +        error_printf("Invalid bridge interface name provided: =
%s\n", ifname);
> > +        error_printf("Valid bridge interfaces:\n");
> > +        xpc_array_apply(
> > +            vmnet_copy_shared_interface_list(),
> > +            ^bool(size_t index, xpc_object_t  _Nonnull value) {
> > +            error_printf("\t%s\n", =
xpc_string_get_string_ptr(value));
> > +            /* Keep iterating */
> > +            return true;
> > +        });
> > +        exit(1);
> > +        return false;
> > +    }
> > +
> > +    return true;
> > +}
> > +
> > +static xpc_object_t _construct_vmnet_interface_description(
>=20
> Underscore is not needed I think.
>=20
> > +    const NetdevVmnetModeOptions *vmnet_opts)
> > +{
> > +    operating_modes_t mode =3D _vmnet_operating_mode_enum_compat(
> > +        vmnet_opts->mode);
> > +
> > +    /* Validate options */
> > +    if (mode =3D=3D VMNET_HOST_MODE || mode =3D=3D =
VMNET_SHARED_MODE) {
> > +        NetdevVmnetModeOptionsHostOrShared mode_opts =3D =
vmnet_opts->u.host;
> > +        /* If one DHCP parameter is configured, all 3 are required =
*/
> > +        if (mode_opts.has_dhcp_start_address ||
> > +            mode_opts.has_dhcp_end_address ||
> > +            mode_opts.has_dhcp_subnet_mask) {
> > +            if (!(mode_opts.has_dhcp_start_address &&
> > +                  mode_opts.has_dhcp_end_address &&
> > +                  mode_opts.has_dhcp_subnet_mask)) {
> > +                error_printf("Incomplete DHCP configuration =
provided\n");
> > +                exit(1);
> > +            }
> > +        }
> > +    } else if (mode =3D=3D VMNET_BRIDGED_MODE) {
>=20
> I think we want to enable bridging mode only on macOS 10.15 and above
> where vmnet_copy_shared_interface_list() is supported.
>=20
>=20
> > +        /* Nothing to validate */
> > +    } else {
> > +        error_printf("Unknown vmnet mode %d\n", mode);
> > +        exit(1);
> > +    }
> > +
> > +    xpc_object_t interface_desc =3D xpc_dictionary_create(NULL, =
NULL, 0);
> > +    xpc_dictionary_set_uint64(
> > +        interface_desc,
> > +        vmnet_operation_mode_key,
> > +        mode
> > +    );
> > +
> > +    if (mode =3D=3D VMNET_BRIDGED_MODE) {
> > +        /*
> > +         * Configure the provided physical interface to act
> > +         * as a bridge with QEMU
> > +         */
> > +        NetdevVmnetModeOptionsBridged mode_opts =3D =
vmnet_opts->u.bridged;
> > +        /* Bridge with en0 by default */
> > +        const char *physical_ifname =3D mode_opts.has_ifname ? =
mode_opts.ifname :
> > +                                                             "en0";
>=20
> I think a default interface is not needed here, it's better to require
> an explicit inteface to bridge with. Some people prefer wired, others
> wireless. Ocasionally some do both :)
>=20
> More comments later!
>=20
> Thanks,
> Roman
>=20
> > +        _validate_ifname_is_valid_bridge_target(physical_ifname);
> > +        xpc_dictionary_set_string(interface_desc,
> > +                                  vmnet_shared_interface_name_key,
> > +                                  physical_ifname);
> > +    } else if (mode =3D=3D VMNET_HOST_MODE || mode =3D=3D =
VMNET_SHARED_MODE) {
> > +        /* Pass the DHCP configuration to vmnet, if the user =
provided one */
> > +        NetdevVmnetModeOptionsHostOrShared mode_opts =3D =
vmnet_opts->u.host;
> > +        if (mode_opts.has_dhcp_start_address) {
> > +            /* All DHCP arguments are available, as per the checks =
above */
> > +            xpc_dictionary_set_string(interface_desc,
> > +                                      vmnet_start_address_key,
> > +                                      =
mode_opts.dhcp_start_address);
> > +            xpc_dictionary_set_string(interface_desc,
> > +                                      vmnet_end_address_key,
> > +                                      mode_opts.dhcp_end_address);
> > +            xpc_dictionary_set_string(interface_desc,
> > +                                      vmnet_subnet_mask_key,
> > +                                      mode_opts.dhcp_subnet_mask);
> > +        }
> > +    }
> > +
> > +    return interface_desc;
> > +}
> > +
> > +int net_init_vmnet_macos(const Netdev *netdev, const char *name,
> > +                        NetClientState *peer, Error **errp)
> > +{
> > +    assert(netdev->type =3D=3D NET_CLIENT_DRIVER_VMNET_MACOS);
> > +
> > +    NetdevVmnetModeOptions *vmnet_opts =3D =
netdev->u.vmnet_macos.options;
> > +    xpc_object_t iface_desc =3D =
_construct_vmnet_interface_description(vmnet_opts);
> > +
> > +    NetClientState *nc =3D =
qemu_new_net_client(&net_vmnet_macos_info, peer,
> > +                                             "vmnet", name);
> > +    vmnet_state_t *vmnet_client_state =3D DO_UPCAST(vmnet_state_t, =
nc, nc);
> > +
> > +    dispatch_queue_t vmnet_dispatch_queue =3D =
dispatch_queue_create(
> > +        "org.qemu.vmnet.iface_queue",
> > +        DISPATCH_QUEUE_SERIAL
> > +    );
> > +
> > +    __block vmnet_return_t vmnet_start_status =3D 0;
> > +    __block uint64_t vmnet_iface_mtu =3D 0;
> > +    __block uint64_t vmnet_max_packet_size =3D 0;
> > +    __block const char *vmnet_mac_address =3D NULL;
> > +    /*
> > +     * We can't refer to an array type directly within a block,
> > +     * so hold a pointer instead.
> > +     */
> > +    uuid_string_t vmnet_iface_uuid =3D {0};
> > +    __block uuid_string_t *vmnet_iface_uuid_ptr =3D =
&vmnet_iface_uuid;
> > +    /* These are only provided in VMNET_HOST_MODE and =
VMNET_SHARED_MODE */
> > +    bool vmnet_provides_dhcp_info =3D (
> > +        vmnet_opts->mode =3D=3D VMNET_OPERATING_MODE_HOST ||
> > +        vmnet_opts->mode =3D=3D VMNET_OPERATING_MODE_SHARED);
> > +    __block const char *vmnet_subnet_mask =3D NULL;
> > +    __block const char *vmnet_dhcp_range_start =3D NULL;
> > +    __block const char *vmnet_dhcp_range_end =3D NULL;
> > +
> > +    /* Create the vmnet interface */
> > +    dispatch_semaphore_t vmnet_iface_sem =3D =
dispatch_semaphore_create(0);
> > +    interface_ref vmnet_iface_ref =3D vmnet_start_interface(
> > +        iface_desc,
> > +        vmnet_dispatch_queue,
> > +        ^(vmnet_return_t status, xpc_object_t  _Nullable =
interface_param) {
> > +        vmnet_start_status =3D status;
> > +        if (vmnet_start_status !=3D VMNET_SUCCESS || =
!interface_param) {
> > +            /* Early return if the interface couldn't be started */
> > +            dispatch_semaphore_signal(vmnet_iface_sem);
> > +            return;
> > +        }
> > +
> > +        /*
> > +         * Read the configuration that vmnet provided us.
> > +         * The provided dictionary is owned by XPC and may be freed
> > +         * shortly after this block's execution.
> > +         * So, copy data buffers now.
> > +         */
> > +        vmnet_iface_mtu =3D xpc_dictionary_get_uint64(
> > +            interface_param,
> > +            vmnet_mtu_key
> > +        );
> > +        vmnet_max_packet_size =3D xpc_dictionary_get_uint64(
> > +            interface_param,
> > +            vmnet_max_packet_size_key
> > +        );
> > +        vmnet_mac_address =3D strdup(xpc_dictionary_get_string(
> > +            interface_param,
> > +            vmnet_mac_address_key
> > +        ));
> > +
> > +        const uint8_t *iface_uuid =3D xpc_dictionary_get_uuid(
> > +            interface_param,
> > +            vmnet_interface_id_key
> > +        );
> > +        uuid_unparse_upper(iface_uuid, *vmnet_iface_uuid_ptr);
> > +
> > +        /* If we're in a mode that provides DHCP info, read it out =
now */
> > +        if (vmnet_provides_dhcp_info) {
> > +            vmnet_dhcp_range_start =3D =
strdup(xpc_dictionary_get_string(
> > +                interface_param,
> > +                vmnet_start_address_key
> > +            ));
> > +            vmnet_dhcp_range_end =3D =
strdup(xpc_dictionary_get_string(
> > +                interface_param,
> > +                vmnet_end_address_key
> > +            ));
> > +            vmnet_subnet_mask =3D strdup(xpc_dictionary_get_string(
> > +                interface_param,
> > +                vmnet_subnet_mask_key
> > +            ));
> > +        }
> > +        dispatch_semaphore_signal(vmnet_iface_sem);
> > +    });
> > +
> > +    /* And block until we receive a response from vmnet */
> > +    dispatch_semaphore_wait(vmnet_iface_sem, =
DISPATCH_TIME_FOREVER);
> > +
> > +    /* Did we manage to start the interface? */
> > +    if (vmnet_start_status !=3D VMNET_SUCCESS || !vmnet_iface_ref) =
{
> > +        error_printf("Failed to start interface: %s\n",
> > +            _vmnet_status_repr(vmnet_start_status));
> > +        if (vmnet_start_status =3D=3D VMNET_FAILURE) {
> > +            error_printf("Hint: vmnet requires running with root =
access\n");
> > +        }
> > +        return -1;
> > +    }
> > +
> > +    info_report("Started vmnet interface with configuration:");
> > +    info_report("MTU:              %llu", vmnet_iface_mtu);
> > +    info_report("Max packet size:  %llu", vmnet_max_packet_size);
> > +    info_report("MAC:              %s", vmnet_mac_address);
> > +    if (vmnet_provides_dhcp_info) {
> > +        info_report("DHCP IPv4 start:  %s", =
vmnet_dhcp_range_start);
> > +        info_report("DHCP IPv4 end:    %s", vmnet_dhcp_range_end);
> > +        info_report("IPv4 subnet mask: %s", vmnet_subnet_mask);
> > +    }
> > +    info_report("UUID:             %s", vmnet_iface_uuid);
> > +
> > +    /* The interface is up! Set a block to run when packets are =
received */
> > +    vmnet_client_state->vmnet_iface_ref =3D vmnet_iface_ref;
> > +    vmnet_return_t event_cb_stat =3D =
vmnet_interface_set_event_callback(
> > +        vmnet_iface_ref,
> > +        VMNET_INTERFACE_PACKETS_AVAILABLE,
> > +        vmnet_dispatch_queue,
> > +        ^(interface_event_t event_mask, xpc_object_t  _Nonnull =
event) {
> > +        if (event_mask !=3D VMNET_INTERFACE_PACKETS_AVAILABLE) {
> > +            error_printf("Unknown vmnet interface event 0x%08x\n", =
event_mask);
> > +            return;
> > +        }
> > +
> > +        /* If we're unable to handle more packets now, drop this =
packet */
> > +        if (!vmnet_client_state->qemu_ready_to_receive) {
> > +            return;
> > +        }
> > +
> > +        /*
> > +         * TODO(Phillip Tennen <phillip@axleos.com =
<mailto:phillip@axleos.com>>): There may be more than
> > +         * one packet available.
> > +         * As an optimization, we could read
> > +         * vmnet_estimated_packets_available_key packets now.
> > +         */
> > +        char *packet_buf =3D g_malloc0(vmnet_max_packet_size);
> > +        struct iovec *iov =3D g_new0(struct iovec, 1);
> > +        iov->iov_base =3D packet_buf;
> > +        iov->iov_len =3D vmnet_max_packet_size;
> > +
> > +        int pktcnt =3D 1;
> > +        struct vmpktdesc *v =3D g_new0(struct vmpktdesc, pktcnt);
> > +        v->vm_pkt_size =3D vmnet_max_packet_size;
> > +        v->vm_pkt_iov =3D iov;
> > +        v->vm_pkt_iovcnt =3D 1;
> > +        v->vm_flags =3D 0;
> > +
> > +        vmnet_return_t result =3D vmnet_read(vmnet_iface_ref, v, =
&pktcnt);
> > +        if (result !=3D VMNET_SUCCESS) {
> > +            error_printf("Failed to read packet from host: %s\n",
> > +                _vmnet_status_repr(result));
> > +        }
> > +
> > +        /* Ensure we read exactly one packet */
> > +        assert(pktcnt =3D=3D 1);
> > +
> > +        /* Dispatch this block to a global queue instead of the =
main queue,
> > +         * which is only created when the program has a Cocoa event =
loop.
> > +         * If QEMU is started with -nographic, no Cocoa event loop =
will be=20
> > +         * created and thus the main queue will be unavailable.
> > +         */
> > +        =
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,=20=

> > +                                                 0),=20
> > +                       ^{
> > +            qemu_mutex_lock_iothread();
> > +
> > +            /*
> > +             * Deliver the packet to the guest
> > +             * If the delivery succeeded synchronously, this =
returns the length
> > +             * of the sent packet.
> > +             */
> > +            if (qemu_send_packet_async(nc, iov->iov_base,
> > +                                       v->vm_pkt_size,
> > +                                       vmnet_send_completed) =3D=3D =
0) {
> > +                vmnet_client_state->qemu_ready_to_receive =3D =
false;
> > +            }
> > +
> > +            /*
> > +             * It's safe to free the packet buffers.
> > +             * Even if delivery needs to wait, =
qemu_net_queue_append copies
> > +             * the packet buffer.
> > +             */
> > +            g_free(v);
> > +            g_free(iov);
> > +            g_free(packet_buf);
> > +
> > +            qemu_mutex_unlock_iothread();
> > +        });
> > +    });
> > +
> > +    /* Did we manage to set an event callback? */
> > +    if (event_cb_stat !=3D VMNET_SUCCESS) {
> > +        error_printf("Failed to set up a callback to receive =
packets: %s\n",
> > +            _vmnet_status_repr(vmnet_start_status));
> > +        exit(1);
> > +    }
> > +
> > +    /* We're now ready to receive packets */
> > +    vmnet_client_state->qemu_ready_to_receive =3D true;
> > +    vmnet_client_state->link_up =3D true;
> > +
> > +    /* Include DHCP info if we're in a relevant mode */
> > +    if (vmnet_provides_dhcp_info) {
> > +        snprintf(nc->info_str, sizeof(nc->info_str),
> > +                 "dhcp_start=3D%s,dhcp_end=3D%s,mask=3D%s",
> > +                 vmnet_dhcp_range_start, vmnet_dhcp_range_end,
> > +                 vmnet_subnet_mask);
> > +    } else {
> > +        snprintf(nc->info_str, sizeof(nc->info_str),
> > +                 "mac=3D%s", vmnet_mac_address);
> > +    }
> > +
> > +    return 0;
> > +}
> > diff --git a/qapi/net.json b/qapi/net.json
> > index c31748c87f..e4d4143243 100644
> > --- a/qapi/net.json
> > +++ b/qapi/net.json
> > @@ -450,6 +450,115 @@
> >      '*vhostdev':     'str',
> >      '*queues':       'int' } }
> > =20
> > +##
> > +# @VmnetOperatingMode:
> > +#
> > +# The operating modes in which a vmnet netdev can run
> > +# Only available on macOS
> > +#
> > +# @host: the guest may communicate with the host=20
> > +#        and other guest network interfaces
> > +#
> > +# @shared: the guest may reach the Internet through a NAT,=20
> > +#          and may communicate with the host and other guest=20
> > +#          network interfaces
> > +#
> > +# @bridged: the guest's traffic is bridged with a=20
> > +#           physical network interface of the host
> > +#
> > +# Since: 6.0
> > +##
> > +{ 'enum': 'VmnetOperatingMode',
> > +  'data': [ 'host', 'shared', 'bridged' ],
> > +  'if': 'defined(CONFIG_DARWIN)' }
> > +
> > +##
> > +# @NetdevVmnetModeOptionsBridged:
> > +#
> > +# Options for the vmnet-macos netdev
> > +# that are only available in 'bridged' mode
> > +# Only available on macOS
> > +#
> > +# @ifname: the physical network interface to bridge with=20
> > +#          (defaults to en0 if not specified)
> > +#
> > +# Since: 6.0
> > +##
> > +{ 'struct': 'NetdevVmnetModeOptionsBridged',
> > +  'data': { '*ifname':  'str' },
> > +  'if': 'defined(CONFIG_DARWIN)' }
> > +
> > +##
> > +# @NetdevVmnetModeOptionsHostOrShared:
> > +#
> > +# Options for the vmnet-macos netdev
> > +# that are only available in 'host' or 'shared' mode
> > +# Only available on macOS
> > +#
> > +# @dhcp-start-address: the gateway address to use for the =
interface.=20
> > +#                      The range to dhcp_end_address is placed in =
the DHCP pool.
> > +#                      (only valid with mode=3Dhost|shared)
> > +#                      (must be specified with dhcp-end-address and=20=

> > +#                       dhcp-subnet-mask)
> > +#                      (allocated automatically if unset)
> > +#
> > +# @dhcp-end-address: the DHCP IPv4 range end address to use for the =
interface.=20
> > +#                      (only valid with mode=3Dhost|shared)
> > +#                      (must be specified with dhcp-start-address =
and=20
> > +#                       dhcp-subnet-mask)
> > +#                      (allocated automatically if unset)
> > +#
> > +# @dhcp-subnet-mask: the IPv4 subnet mask (string) to use on the =
interface.
> > +#                    (only valid with mode=3Dhost|shared)
> > +#                    (must be specified with dhcp-start-address and=20=

> > +#                     dhcp-end-address)
> > +#                    (allocated automatically if unset)
> > +#
> > +# Since: 6.0
> > +##
> > +{ 'struct': 'NetdevVmnetModeOptionsHostOrShared',
> > +  'data': {=20
> > +    '*dhcp-start-address': 'str' ,
> > +    '*dhcp-end-address':   'str',
> > +    '*dhcp-subnet-mask':   'str' },
> > +  'if': 'defined(CONFIG_DARWIN)' }
> > +
> > +##
> > +# @NetdevVmnetModeOptions:
> > +#
> > +# Options specific to different operating modes of a vmnet netdev
> > +# Only available on macOS
> > +#
> > +# @mode: the operating mode vmnet should run in
> > +#
> > +# Since: 6.0
> > +##
> > +{ 'union': 'NetdevVmnetModeOptions',
> > +  'base': { 'mode': 'VmnetOperatingMode' },
> > +  'discriminator': 'mode',
> > +  'data': {
> > +    'bridged':      'NetdevVmnetModeOptionsBridged',
> > +    'host':         'NetdevVmnetModeOptionsHostOrShared',
> > +    'shared':       'NetdevVmnetModeOptionsHostOrShared' },
> > +  'if': 'defined(CONFIG_DARWIN)' }
> > +
> > +##
> > +# @NetdevVmnetOptions:
> > +#
> > +# vmnet network backend
> > +# Only available on macOS
> > +#
> > +# @options: a structure specifying the mode and mode-specific =
options
> > +#           (once QAPI supports a union type as a branch to another =
union type,
> > +#            this structure can be changed to a union, and the =
contents of
> > +#            NetdevVmnetModeOptions moved here)
> > +#
> > +# Since: 6.0
> > +##
> > +{ 'struct': 'NetdevVmnetOptions',
> > +  'data': {'options': 'NetdevVmnetModeOptions' },
> > +  'if': 'defined(CONFIG_DARWIN)' }
> > +
> >  ##
> >  # @NetClientDriver:
> >  #
> > @@ -458,10 +567,13 @@
> >  # Since: 2.7
> >  #
> >  #        @vhost-vdpa since 5.1
> > +#
> > +#        @vmnet-macos since 6.0 (only available on macOS)
> >  ##
> >  { 'enum': 'NetClientDriver',
> >    'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', 'socket', =
'vde',
> > -            'bridge', 'hubport', 'netmap', 'vhost-user', =
'vhost-vdpa' ] }
> > +            'bridge', 'hubport', 'netmap', 'vhost-user', =
'vhost-vdpa',
> > +            { 'name': 'vmnet-macos', 'if': 'defined(CONFIG_DARWIN)' =
} ] }
> > =20
> >  ##
> >  # @Netdev:
> > @@ -475,6 +587,8 @@
> >  # Since: 1.2
> >  #
> >  #        'l2tpv3' - since 2.1
> > +#
> > +#        'vmnet-macos' since 6.0 (only available on macOS)
> >  ##
> >  { 'union': 'Netdev',
> >    'base': { 'id': 'str', 'type': 'NetClientDriver' },
> > @@ -490,7 +604,9 @@
> >      'hubport':  'NetdevHubPortOptions',
> >      'netmap':   'NetdevNetmapOptions',
> >      'vhost-user': 'NetdevVhostUserOptions',
> > -    'vhost-vdpa': 'NetdevVhostVDPAOptions' } }
> > +    'vhost-vdpa': 'NetdevVhostVDPAOptions',
> > +    'vmnet-macos': { 'type': 'NetdevVmnetOptions',=20
> > +                     'if': 'defined(CONFIG_DARWIN)' } } }
> > =20
> >  ##
> >  # @NetFilterDirection:
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 9172d51659..ec6b40b079 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -2483,6 +2483,15 @@ DEF("netdev", HAS_ARG, QEMU_OPTION_netdev,
> >  #ifdef __linux__
> >      "-netdev vhost-vdpa,id=3Dstr,vhostdev=3D/path/to/dev\n"
> >      "                configure a vhost-vdpa network,Establish a =
vhost-vdpa netdev\n"
> > +#endif
> > +#ifdef CONFIG_DARWIN
> > +    "-netdev vmnet-macos,id=3Dstr,mode=3Dbridged[,ifname=3Difname]\n"=

> > +    "         configure a macOS-provided vmnet network in =
\"physical interface bridge\" mode\n"
> > +    "         the physical interface to bridge with defaults to en0 =
if unspecified\n"
> > +    "-netdev vmnet-macos,id=3Dstr,mode=3Dhost|shared\n"
> > +    "                     =
[,dhcp_start_address=3Daddr,dhcp_end_address=3Daddr,dhcp_subnet_mask=3Dmas=
k]\n"
> > +    "         configure a macOS-provided vmnet network in \"host\" =
or \"shared\" mode\n"
> > +    "         the DHCP configuration will be set automatically if =
unspecified\n"
> >  #endif
> >      "-netdev hubport,id=3Dstr,hubid=3Dn[,netdev=3Dnd]\n"
> >      "                configure a hub port on the hub with ID =
'n'\n", QEMU_ARCH_ALL)
> > --=20
> > 2.24.3 (Apple Git-128)
> >=20
> >=20


--Apple-Mail=_A22587D6-1288-42FD-9FE5-1663BC9E9796
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><meta=
 http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8" =
class=3D""><div style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D""><meta =
http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8" =
class=3D""><div style=3D"word-wrap: break-word; -webkit-nbsp-mode: =
space; line-break: after-white-space;" class=3D""><div =
class=3D"">Hello,</div><div class=3D""><br class=3D""></div><div =
class=3D"">I'm replying to this thread to let you know that I am =
available to help out on this patch as I have been working on the same =
feature for a few weeks.</div><br class=3D""><div class=3D"">
<i class=3D"">AD</i>

</div>
<div style=3D"" class=3D""><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D"">On 3 Mar 2021, at 12:24, Phillip Tennen =
&lt;<a href=3D"mailto:phillip.ennen@gmail.com" =
class=3D"">phillip.ennen@gmail.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D"">Thanks very much for your help and feedback!<div class=3D""><br=
 class=3D""></div><div class=3D"">Apologies for my delay in following =
up. I'll submit a new version that implements the feedback you've =
provided here, as well as the QAPI schema changes&nbsp;<a =
class=3D"gmail_plusreply" id=3D"plusReplyChip-1" =
href=3D"mailto:armbru@redhat.com" tabindex=3D"-1">@Markus =
Armbruster</a>&nbsp;(thanks to you as well for your time and review!) =
pointed out.</div><div class=3D""><br class=3D""></div><div =
class=3D"">Phillip</div></div><br class=3D""><div =
class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb =
24, 2021 at 12:25 AM Roman Bolshakov &lt;<a =
href=3D"mailto:r.bolshakov@yadro.com" =
class=3D"">r.bolshakov@yadro.com</a>&gt; wrote:<br =
class=3D""></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px =
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(=
204,204,204);padding-left:1ex">On Thu, Feb 18, 2021 at 02:49:47PM +0100, =
<a href=3D"mailto:phillip.ennen@gmail.com" target=3D"_blank" =
class=3D"">phillip.ennen@gmail.com</a> wrote:<br class=3D"">
&gt; From: Phillip Tennen &lt;<a href=3D"mailto:phillip@axleos.com" =
target=3D"_blank" class=3D"">phillip@axleos.com</a>&gt;<br class=3D"">
&gt; <br class=3D"">
&gt; This patch implements a new netdev device, reachable via -netdev<br =
class=3D"">
&gt; vmnet-macos, that=E2=80=99s backed by macOS=E2=80=99s vmnet =
framework.<br class=3D"">
&gt; <br class=3D"">
&gt; The vmnet framework provides native bridging support, and its usage =
in<br class=3D"">
&gt; this patch is intended as a replacement for attempts to use a tap =
device<br class=3D"">
&gt; via the tuntaposx kernel extension. Notably, the tap/tuntaposx =
approach<br class=3D"">
&gt; never would have worked in the first place, as QEMU interacts with =
the<br class=3D"">
&gt; tap device via poll(), and macOS does not support polling device =
files.<br class=3D"">
&gt; <br class=3D"">
&gt; vmnet requires either a special entitlement, granted via a =
provisioning<br class=3D"">
&gt; profile, or root access. Otherwise attempts to create the =
virtual<br class=3D"">
&gt; interface will fail with a =E2=80=9Cgeneric error=E2=80=9D status =
code. QEMU may not<br class=3D"">
&gt; currently be signed with an entitlement granted in a =
provisioning<br class=3D"">
&gt; profile, as this would necessitate pre-signed binary build =
distribution,<br class=3D"">
&gt; rather than source-code distribution. As such, using this netdev<br =
class=3D"">
&gt; currently requires that qemu be run with root access. I=E2=80=99ve =
opened a<br class=3D"">
&gt; feedback report with Apple to allow the use of the relevant =
entitlement<br class=3D"">
&gt; with this use case:<br class=3D"">
&gt; <a href=3D"https://openradar.appspot.com/radar?id=3D5007417364447232"=
 rel=3D"noreferrer" target=3D"_blank" =
class=3D"">https://openradar.appspot.com/radar?id=3D5007417364447232</a><b=
r class=3D"">
&gt; <br class=3D"">
&gt; vmnet offers three operating modes, all of which are supported by =
this<br class=3D"">
&gt; patch via the =E2=80=9Cmode=3Dhost|shared|bridge=E2=80=9D =
option:<br class=3D"">
&gt; <br class=3D"">
&gt; * "Host" mode: Allows the vmnet interface to communicate with =
other<br class=3D"">
&gt; * vmnet<br class=3D"">
&gt; interfaces that are in host mode and also with the native host.<br =
class=3D"">
&gt; * "Shared" mode: Allows traffic originating from the vmnet =
interface to<br class=3D"">
&gt; reach the Internet through a NAT. The vmnet interface can also<br =
class=3D"">
&gt; communicate with the native host.<br class=3D"">
&gt; * "Bridged" mode: Bridges the vmnet interface with a physical =
network<br class=3D"">
&gt; interface.<br class=3D"">
&gt; <br class=3D"">
&gt; Each of these modes also provide some extra configuration =
that=E2=80=99s<br class=3D"">
&gt; supported by this patch:<br class=3D"">
&gt; <br class=3D"">
&gt; * "Bridged" mode: The user may specify the physical interface to =
bridge<br class=3D"">
&gt; with. Defaults to en0.<br class=3D"">
&gt; * "Host" mode / "Shared" mode: The user may specify the DHCP range =
and<br class=3D"">
&gt; subnet. Allocated by vmnet if not provided.<br class=3D"">
&gt; <br class=3D"">
&gt; vmnet also offers some extra configuration options that are not<br =
class=3D"">
&gt; supported by this patch:<br class=3D"">
&gt; <br class=3D"">
&gt; * Enable isolation from other VMs using vmnet<br class=3D"">
&gt; * Port forwarding rules<br class=3D"">
&gt; * Enabling TCP segmentation offload<br class=3D"">
&gt; * Only applicable in "shared" mode: specifying the NAT IPv6 =
prefix<br class=3D"">
&gt; * Only available in "host" mode: specifying the IP address for the =
VM<br class=3D"">
&gt; within an isolated network<br class=3D"">
&gt; <br class=3D"">
&gt; Note that this patch requires macOS 10.15 as a minimum, as this is =
when<br class=3D"">
&gt; bridging support was implemented in vmnet.framework.<br class=3D"">
&gt; <br class=3D"">
&gt; Signed-off-by: Phillip Tennen &lt;<a =
href=3D"mailto:phillip@axleos.com" target=3D"_blank" =
class=3D"">phillip@axleos.com</a>&gt;<br class=3D"">
&gt; ---<br class=3D"">
&gt;&nbsp; configure&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp;2 =
+-<br class=3D"">
&gt;&nbsp; net/clients.h&nbsp; &nbsp; &nbsp;|&nbsp; &nbsp;6 +<br =
class=3D"">
&gt;&nbsp; net/meson.build&nbsp; &nbsp;|&nbsp; &nbsp;1 +<br class=3D"">
&gt;&nbsp; net/net.c&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; &nbsp;3 =
+<br class=3D"">
&gt;&nbsp; net/vmnet-macos.c | 447 =
++++++++++++++++++++++++++++++++++++++++++++++<br class=3D"">
&gt;&nbsp; qapi/net.json&nbsp; &nbsp; &nbsp;| 120 ++++++++++++-<br =
class=3D"">
&gt;&nbsp; qemu-options.hx&nbsp; &nbsp;|&nbsp; &nbsp;9 +<br class=3D"">
&gt;&nbsp; 7 files changed, 585 insertions(+), 3 deletions(-)<br =
class=3D"">
&gt;&nbsp; create mode 100644 net/vmnet-macos.c<br class=3D"">
&gt; <br class=3D"">
<br class=3D"">
Hi Phillip,<br class=3D"">
<br class=3D"">
Thanks for working on this!<br class=3D"">
<br class=3D"">
Note that the patch doesn't apply to current master and there's a lot =
of<br class=3D"">
warnings wrt trailing whitespaces:<br class=3D"">
<br class=3D"">
git am v4-net-macos-implement-vmnet-based-netdev.patch<br class=3D"">
Applying: net/macos: implement vmnet-based netdev<br class=3D"">
.git/rebase-apply/patch:462: trailing whitespace.<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* If QEMU is started with -nographic, =
no Cocoa event loop will be<br class=3D"">
.git/rebase-apply/patch:465: trailing whitespace.<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; =
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH,<br =
class=3D"">
.git/rebase-apply/patch:466: trailing whitespace.<br class=3D"">
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0),<br class=3D"">
.git/rebase-apply/patch:532: trailing whitespace.<br class=3D"">
# @host: the guest may communicate with the host<br class=3D"">
.git/rebase-apply/patch:535: trailing whitespace.<br class=3D"">
# @shared: the guest may reach the Internet through a NAT,<br class=3D"">
error: patch failed: configure:778<br class=3D"">
error: configure: patch does not apply<br class=3D"">
Patch failed at 0001 net/macos: implement vmnet-based netdev<br =
class=3D"">
hint: Use 'git am --show-current-patch' to see the failed patch<br =
class=3D"">
When you have resolved this problem, run "git am --continue".<br =
class=3D"">
If you prefer to skip this patch, run "git am --skip" instead.<br =
class=3D"">
To restore the original branch and stop patching, run "git am =
--abort".<br class=3D"">
<br class=3D"">
Also it would be helpful to provide a changelog under commit message<br =
class=3D"">
delimiter ("---")&nbsp; for reach new version of the patch to provide =
an<br class=3D"">
overview of what has been changed between the versions.<br class=3D"">
<br class=3D"">
&gt; diff --git a/configure b/configure<br class=3D"">
&gt; index 4afd22bdf5..f449198db1 100755<br class=3D"">
&gt; --- a/configure<br class=3D"">
&gt; +++ b/configure<br class=3D"">
&gt; @@ -778,7 +778,7 @@ Darwin)<br class=3D"">
&gt;&nbsp; &nbsp; fi<br class=3D"">
&gt;&nbsp; &nbsp; audio_drv_list=3D"coreaudio try-sdl"<br class=3D"">
&gt;&nbsp; &nbsp; audio_possible_drivers=3D"coreaudio sdl"<br class=3D"">
&gt; -&nbsp; QEMU_LDFLAGS=3D"-framework CoreFoundation -framework IOKit =
$QEMU_LDFLAGS"<br class=3D"">
&gt; +&nbsp; QEMU_LDFLAGS=3D"-framework CoreFoundation -framework IOKit =
-framework vmnet $QEMU_LDFLAGS"<br class=3D"">
<br class=3D"">
I'm not sure this is right approach. Instead, we need a new<br class=3D"">=

configuration option for the feature + proper discovery. Something =
like<br class=3D"">
this should work:<br class=3D"">
<br class=3D"">
<a =
href=3D"https://github.com/roolebo/qemu/commit/e6c52d6bedb92f16defb5782b69=
6853824b14bd9" rel=3D"noreferrer" target=3D"_blank" =
class=3D"">https://github.com/roolebo/qemu/commit/e6c52d6bedb92f16defb5782=
b696853824b14bd9</a><br class=3D"">
<br class=3D"">
&gt;&nbsp; &nbsp; # Disable attempts to use ObjectiveC features in =
os/object.h since they<br class=3D"">
&gt;&nbsp; &nbsp; # won't work when we're compiling with gcc as a C =
compiler.<br class=3D"">
&gt;&nbsp; &nbsp; QEMU_CFLAGS=3D"-DOS_OBJECT_USE_OBJC=3D0 =
$QEMU_CFLAGS"<br class=3D"">
&gt; diff --git a/net/clients.h b/net/clients.h<br class=3D"">
&gt; index 92f9b59aed..463a9b2f67 100644<br class=3D"">
&gt; --- a/net/clients.h<br class=3D"">
&gt; +++ b/net/clients.h<br class=3D"">
&gt; @@ -63,4 +63,10 @@ int net_init_vhost_user(const Netdev *netdev, =
const char *name,<br class=3D"">
&gt;&nbsp; <br class=3D"">
&gt;&nbsp; int net_init_vhost_vdpa(const Netdev *netdev, const char =
*name,<br class=3D"">
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; NetClientState *peer, Error **errp);<br =
class=3D"">
&gt; +<br class=3D"">
&gt; +#ifdef CONFIG_DARWIN<br class=3D"">
<br class=3D"">
Respectively, it would be wrapped with #ifdef CONFIG_VMNET instead of<br =
class=3D"">
more generic CONFIG_DARWIN.<br class=3D"">
<br class=3D"">
&gt; +int net_init_vmnet_macos(const Netdev *netdev, const char =
*name,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; NetClientState *peer, Error **errp);<br class=3D"">
&gt; +#endif<br class=3D"">
&gt; +<br class=3D"">
&gt;&nbsp; #endif /* QEMU_NET_CLIENTS_H */<br class=3D"">
&gt; diff --git a/net/meson.build b/net/meson.build<br class=3D"">
&gt; index 1076b0a7ab..8c7c32f775 100644<br class=3D"">
&gt; --- a/net/meson.build<br class=3D"">
&gt; +++ b/net/meson.build<br class=3D"">
&gt; @@ -37,5 +37,6 @@ endif<br class=3D"">
&gt;&nbsp; softmmu_ss.add(when: 'CONFIG_POSIX', if_true: =
files(tap_posix))<br class=3D"">
&gt;&nbsp; softmmu_ss.add(when: 'CONFIG_WIN32', if_true: =
files('tap-win32.c'))<br class=3D"">
&gt;&nbsp; softmmu_ss.add(when: 'CONFIG_VHOST_NET_VDPA', if_true: =
files('vhost-vdpa.c'))<br class=3D"">
&gt; +softmmu_ss.add(when: 'CONFIG_DARWIN', if_true: =
files('vmnet-macos.c'))<br class=3D"">
&gt;&nbsp; <br class=3D"">
&gt;&nbsp; subdir('can')<br class=3D"">
&gt; diff --git a/net/net.c b/net/net.c<br class=3D"">
&gt; index c1cd9c75f6..e68a410a89 100644<br class=3D"">
&gt; --- a/net/net.c<br class=3D"">
&gt; +++ b/net/net.c<br class=3D"">
&gt; @@ -977,6 +977,9 @@ static int (* const =
net_client_init_fun[NET_CLIENT_DRIVER__MAX])(<br class=3D"">
&gt;&nbsp; #ifdef CONFIG_L2TPV3<br class=3D"">
&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; [NET_CLIENT_DRIVER_L2TPV3]&nbsp; =
&nbsp; =3D net_init_l2tpv3,<br class=3D"">
&gt;&nbsp; #endif<br class=3D"">
&gt; +#ifdef CONFIG_DARWIN<br class=3D"">
<br class=3D"">
CONFIG_VMNET should be used here as well.<br class=3D"">
<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; [NET_CLIENT_DRIVER_VMNET_MACOS] =3D =
net_init_vmnet_macos,<br class=3D"">
&gt; +#endif<br class=3D"">
&gt;&nbsp; };<br class=3D"">
&gt;&nbsp; <br class=3D"">
&gt;&nbsp; <br class=3D"">
&gt; diff --git a/net/vmnet-macos.c b/net/vmnet-macos.c<br class=3D"">
&gt; new file mode 100644<br class=3D"">
&gt; index 0000000000..1a762751dd<br class=3D"">
&gt; --- /dev/null<br class=3D"">
&gt; +++ b/net/vmnet-macos.c<br class=3D"">
&gt; @@ -0,0 +1,447 @@<br class=3D"">
&gt; +/*<br class=3D"">
&gt; + * vmnet.framework backed netdev for macOS 10.15+ hosts<br =
class=3D"">
&gt; + *<br class=3D"">
&gt; + * Copyright (c) 2021 Phillip Tennen &lt;<a =
href=3D"mailto:phillip@axleos.com" target=3D"_blank" =
class=3D"">phillip@axleos.com</a>&gt;<br class=3D"">
&gt; + *<br class=3D"">
&gt; + * This work is licensed under the terms of the GNU GPL, version 2 =
or later.<br class=3D"">
&gt; + * See the COPYING file in the top-level directory.<br class=3D"">
&gt; + *<br class=3D"">
&gt; + */<br class=3D"">
&gt; +#include "qemu/osdep.h"<br class=3D"">
&gt; +#include "qemu/main-loop.h"<br class=3D"">
&gt; +#include "qemu/error-report.h"<br class=3D"">
&gt; +#include "qapi/qapi-types-net.h"<br class=3D"">
&gt; +#include "net/net.h"<br class=3D"">
&gt; +/* macOS vmnet framework header */<br class=3D"">
&gt; +#include &lt;vmnet/vmnet.h&gt;<br class=3D"">
&gt; +<br class=3D"">
&gt; +typedef struct vmnet_state {<br class=3D"">
&gt; +&nbsp; &nbsp; NetClientState nc;<br class=3D"">
&gt; +&nbsp; &nbsp; interface_ref vmnet_iface_ref;<br class=3D"">
&gt; +&nbsp; &nbsp; /* Switched on after vmnet informs us that the =
interface has started */<br class=3D"">
&gt; +&nbsp; &nbsp; bool link_up;<br class=3D"">
&gt; +&nbsp; &nbsp; /*<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp;* If qemu_send_packet_async returns 0, this is =
switched off until our<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp;* delivery callback is invoked<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp;*/<br class=3D"">
&gt; +&nbsp; &nbsp; bool qemu_ready_to_receive;<br class=3D"">
&gt; +} vmnet_state_t;<br class=3D"">
&gt; +<br class=3D"">
&gt; +int net_init_vmnet_macos(const Netdev *netdev, const char =
*name,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;NetClientState *peer, Error **errp);<br =
class=3D"">
&gt; +<br class=3D"">
&gt; +static const char *_vmnet_status_repr(vmnet_return_t status)<br =
class=3D"">
<br class=3D"">
Underscore may be dropped.<br class=3D"">
<br class=3D"">
&gt; +{<br class=3D"">
&gt; +&nbsp; &nbsp; switch (status) {<br class=3D"">
&gt; +&nbsp; &nbsp; case VMNET_SUCCESS:<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; return "success";<br class=3D"">
&gt; +&nbsp; &nbsp; case VMNET_FAILURE:<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; return "generic failure";<br class=3D"">=

&gt; +&nbsp; &nbsp; case VMNET_MEM_FAILURE:<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; return "out of memory";<br class=3D"">
&gt; +&nbsp; &nbsp; case VMNET_INVALID_ARGUMENT:<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; return "invalid argument";<br =
class=3D"">
&gt; +&nbsp; &nbsp; case VMNET_SETUP_INCOMPLETE:<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; return "setup is incomplete";<br =
class=3D"">
&gt; +&nbsp; &nbsp; case VMNET_INVALID_ACCESS:<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; return "insufficient permissions";<br =
class=3D"">
&gt; +&nbsp; &nbsp; case VMNET_PACKET_TOO_BIG:<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; return "packet size exceeds MTU";<br =
class=3D"">
&gt; +&nbsp; &nbsp; case VMNET_BUFFER_EXHAUSTED:<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; return "kernel buffers temporarily =
exhausted";<br class=3D"">
&gt; +&nbsp; &nbsp; case VMNET_TOO_MANY_PACKETS:<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; return "number of packets exceeds =
system limit";<br class=3D"">
&gt; +&nbsp; &nbsp; /* This error code was introduced in macOS 11.0 =
*/<br class=3D"">
&gt; +#if __MAC_OS_X_VERSION_MAX_ALLOWED &gt;=3D 110000<br class=3D"">
&gt; +&nbsp; &nbsp; case VMNET_SHARING_SERVICE_BUSY:<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; return "sharing service busy";<br =
class=3D"">
&gt; +#endif<br class=3D"">
&gt; +&nbsp; &nbsp; default:<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; return "unknown status code";<br =
class=3D"">
&gt; +&nbsp; &nbsp; }<br class=3D"">
&gt; +}<br class=3D"">
&gt; +<br class=3D"">
&gt; +static operating_modes_t _vmnet_operating_mode_enum_compat(<br =
class=3D"">
&gt; +&nbsp; &nbsp; VmnetOperatingMode mode)<br class=3D"">
<br class=3D"">
Underscore may be dropped.<br class=3D"">
<br class=3D"">
&gt; +{<br class=3D"">
&gt; +&nbsp; &nbsp; switch (mode) {<br class=3D"">
&gt; +&nbsp; &nbsp; case VMNET_OPERATING_MODE_HOST:<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; return VMNET_HOST_MODE;<br class=3D"">
&gt; +&nbsp; &nbsp; case VMNET_OPERATING_MODE_SHARED:<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; return VMNET_SHARED_MODE;<br class=3D"">=

&gt; +&nbsp; &nbsp; case VMNET_OPERATING_MODE_BRIDGED:<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; return VMNET_BRIDGED_MODE;<br =
class=3D"">
&gt; +&nbsp; &nbsp; default:<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; /* Should never happen as the modes =
are parsed before we get here */<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; assert(false);<br class=3D"">
&gt; +&nbsp; &nbsp; }<br class=3D"">
&gt; +}<br class=3D"">
&gt; +<br class=3D"">
&gt; +static bool vmnet_can_receive(NetClientState *nc)<br class=3D"">
&gt; +{<br class=3D"">
&gt; +&nbsp; &nbsp; vmnet_state_t *s =3D DO_UPCAST(vmnet_state_t, nc, =
nc);<br class=3D"">
&gt; +&nbsp; &nbsp; return s-&gt;link_up;<br class=3D"">
<br class=3D"">
I'm not sure this is correct.<br class=3D"">
Did you mean s-&gt;qemu_ready_to_receive?<br class=3D"">
<br class=3D"">
&gt; +}<br class=3D"">
&gt; +<br class=3D"">
&gt; +static ssize_t vmnet_receive_iov(NetClientState *nc,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;const struct =
iovec *iovs,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int iovcnt)<br =
class=3D"">
&gt; +{<br class=3D"">
&gt; +&nbsp; &nbsp; vmnet_state_t *s =3D DO_UPCAST(vmnet_state_t, nc, =
nc);<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; /* Combine the provided iovs into a single vmnet =
packet */<br class=3D"">
&gt; +&nbsp; &nbsp; struct vmpktdesc *packet =3D g_new0(struct =
vmpktdesc, 1);<br class=3D"">
<br class=3D"">
packet_count could be used instead of 1.<br class=3D"">
<br class=3D"">
&gt; +&nbsp; &nbsp; packet-&gt;vm_pkt_iov =3D g_new0(struct iovec, =
iovcnt);<br class=3D"">
&gt; +&nbsp; &nbsp; memcpy(packet-&gt;vm_pkt_iov, iovs, sizeof(struct =
iovec) * iovcnt);<br class=3D"">
&gt; +&nbsp; &nbsp; packet-&gt;vm_pkt_iovcnt =3D iovcnt;<br class=3D"">
<br class=3D"">
Should we use iov_copy() instead?<br class=3D"">
<br class=3D"">
&gt; +&nbsp; &nbsp; packet-&gt;vm_flags =3D 0;<br class=3D"">
<br class=3D"">
The line is redundant with g_new0.<br class=3D"">
<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; /* Figure out the packet size by iterating the iov's =
*/<br class=3D"">
&gt; +&nbsp; &nbsp; for (int i =3D 0; i &lt; iovcnt; i++) {<br class=3D"">=

&gt; +&nbsp; &nbsp; &nbsp; &nbsp; const struct iovec *iov =3D iovs + =
i;<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; packet-&gt;vm_pkt_size +=3D =
iov-&gt;iov_len;<br class=3D"">
&gt; +&nbsp; &nbsp; }<br class=3D"">
<br class=3D"">
I wonder if we should add a check if packet-&gt;vm_pkt_size is beyond<br =
class=3D"">
vmnet_max_packet_size_key?<br class=3D"">
<br class=3D"">
Also I'm not entirely sure that we should at most transmit only one<br =
class=3D"">
packet, a sort of coalescing might be helpful (Apple claims up ot 200<br =
class=3D"">
packets per one vmnet_write) but I'm not an expert of net part of =
QEMU.<br class=3D"">
Stefan may provide more info on that.<br class=3D"">
<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; /* Finally, write the packet to the vmnet interface =
*/<br class=3D"">
&gt; +&nbsp; &nbsp; int packet_count =3D 1;<br class=3D"">
&gt; +&nbsp; &nbsp; vmnet_return_t result =3D =
vmnet_write(s-&gt;vmnet_iface_ref, packet,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &amp;packet_count);<br class=3D"">
&gt; +&nbsp; &nbsp; if (result !=3D VMNET_SUCCESS || packet_count !=3D =
1) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; error_printf("Failed to send packet to =
host: %s\n",<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
_vmnet_status_repr(result));<br class=3D"">
&gt; +&nbsp; &nbsp; }<br class=3D"">
&gt; +&nbsp; &nbsp; ssize_t wrote_bytes =3D packet-&gt;vm_pkt_size;<br =
class=3D"">
<br class=3D"">
That's going to mismatch with actual number of bytes written if<br =
class=3D"">
packet_count returned from vmnet_write equals zero.<br class=3D"">
<br class=3D"">
&gt; +&nbsp; &nbsp; g_free(packet-&gt;vm_pkt_iov);<br class=3D"">
&gt; +&nbsp; &nbsp; g_free(packet);<br class=3D"">
&gt; +&nbsp; &nbsp; return wrote_bytes;<br class=3D"">
&gt; +}<br class=3D"">
&gt; +<br class=3D"">
&gt; +static void vmnet_send_completed(NetClientState *nc, ssize_t =
len)<br class=3D"">
&gt; +{<br class=3D"">
&gt; +&nbsp; &nbsp; vmnet_state_t *vmnet_client_state =3D =
DO_UPCAST(vmnet_state_t, nc, nc);<br class=3D"">
&gt; +&nbsp; &nbsp; /* Ready to receive more packets! */<br class=3D"">
&gt; +&nbsp; &nbsp; vmnet_client_state-&gt;qemu_ready_to_receive =3D =
true;<br class=3D"">
&gt; +}<br class=3D"">
&gt; +<br class=3D"">
&gt; +static NetClientInfo net_vmnet_macos_info =3D {<br class=3D"">
&gt; +&nbsp; &nbsp; .type =3D NET_CLIENT_DRIVER_VMNET_MACOS,<br =
class=3D"">
&gt; +&nbsp; &nbsp; .size =3D sizeof(vmnet_state_t),<br class=3D"">
&gt; +&nbsp; &nbsp; .receive_iov =3D vmnet_receive_iov,<br class=3D"">
&gt; +&nbsp; &nbsp; .can_receive =3D vmnet_can_receive,<br class=3D"">
&gt; +};<br class=3D"">
&gt; +<br class=3D"">
&gt; +static bool _validate_ifname_is_valid_bridge_target(const char =
*ifname)<br class=3D"">
<br class=3D"">
Underscore may be dropped from the function.<br class=3D"">
<br class=3D"">
&gt; +{<br class=3D"">
&gt; +&nbsp; &nbsp; /* Iterate available bridge interfaces, ensure the =
provided one is valid */<br class=3D"">
&gt; +&nbsp; &nbsp; xpc_object_t bridge_interfaces =3D =
vmnet_copy_shared_interface_list();<br class=3D"">
&gt; +&nbsp; &nbsp; bool failed_to_match_iface_name =3D =
xpc_array_apply(<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; bridge_interfaces,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; ^bool(size_t index, xpc_object_t&nbsp; =
_Nonnull value) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; if =
(!strcmp(xpc_string_get_string_ptr(value), ifname)) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* The interface name is =
valid! Stop iterating */<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return false;<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; }<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; return true;<br class=3D"">
&gt; +&nbsp; &nbsp; });<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; if (failed_to_match_iface_name) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; error_printf("Invalid bridge interface =
name provided: %s\n", ifname);<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; error_printf("Valid bridge =
interfaces:\n");<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; xpc_array_apply(<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
vmnet_copy_shared_interface_list(),<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ^bool(size_t index, =
xpc_object_t&nbsp; _Nonnull value) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; error_printf("\t%s\n", =
xpc_string_get_string_ptr(value));<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* Keep iterating */<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return true;<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; });<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; exit(1);<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; return false;<br class=3D"">
&gt; +&nbsp; &nbsp; }<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; return true;<br class=3D"">
&gt; +}<br class=3D"">
&gt; +<br class=3D"">
&gt; +static xpc_object_t _construct_vmnet_interface_description(<br =
class=3D"">
<br class=3D"">
Underscore is not needed I think.<br class=3D"">
<br class=3D"">
&gt; +&nbsp; &nbsp; const NetdevVmnetModeOptions *vmnet_opts)<br =
class=3D"">
&gt; +{<br class=3D"">
&gt; +&nbsp; &nbsp; operating_modes_t mode =3D =
_vmnet_operating_mode_enum_compat(<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; vmnet_opts-&gt;mode);<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; /* Validate options */<br class=3D"">
&gt; +&nbsp; &nbsp; if (mode =3D=3D VMNET_HOST_MODE || mode =3D=3D =
VMNET_SHARED_MODE) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; NetdevVmnetModeOptionsHostOrShared =
mode_opts =3D vmnet_opts-&gt;u.host;<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; /* If one DHCP parameter is =
configured, all 3 are required */<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; if (mode_opts.has_dhcp_start_address =
||<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
mode_opts.has_dhcp_end_address ||<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
mode_opts.has_dhcp_subnet_mask) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if =
(!(mode_opts.has_dhcp_start_address &amp;&amp;<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
mode_opts.has_dhcp_end_address &amp;&amp;<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
mode_opts.has_dhcp_subnet_mask)) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
error_printf("Incomplete DHCP configuration provided\n");<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
exit(1);<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; }<br class=3D"">
&gt; +&nbsp; &nbsp; } else if (mode =3D=3D VMNET_BRIDGED_MODE) {<br =
class=3D"">
<br class=3D"">
I think we want to enable bridging mode only on macOS 10.15 and above<br =
class=3D"">
where vmnet_copy_shared_interface_list() is supported.<br class=3D"">
<br class=3D"">
<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; /* Nothing to validate */<br class=3D"">=

&gt; +&nbsp; &nbsp; } else {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; error_printf("Unknown vmnet mode =
%d\n", mode);<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; exit(1);<br class=3D"">
&gt; +&nbsp; &nbsp; }<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; xpc_object_t interface_desc =3D =
xpc_dictionary_create(NULL, NULL, 0);<br class=3D"">
&gt; +&nbsp; &nbsp; xpc_dictionary_set_uint64(<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; interface_desc,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; vmnet_operation_mode_key,<br class=3D"">=

&gt; +&nbsp; &nbsp; &nbsp; &nbsp; mode<br class=3D"">
&gt; +&nbsp; &nbsp; );<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; if (mode =3D=3D VMNET_BRIDGED_MODE) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; /*<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* Configure the provided =
physical interface to act<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* as a bridge with QEMU<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*/<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; NetdevVmnetModeOptionsBridged =
mode_opts =3D vmnet_opts-&gt;u.bridged;<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; /* Bridge with en0 by default */<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; const char *physical_ifname =3D =
mode_opts.has_ifname ? mode_opts.ifname :<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;"en0";<br class=3D"">
<br class=3D"">
I think a default interface is not needed here, it's better to =
require<br class=3D"">
an explicit inteface to bridge with. Some people prefer wired, others<br =
class=3D"">
wireless. Ocasionally some do both :)<br class=3D"">
<br class=3D"">
More comments later!<br class=3D"">
<br class=3D"">
Thanks,<br class=3D"">
Roman<br class=3D"">
<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; =
_validate_ifname_is_valid_bridge_target(physical_ifname);<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; =
xpc_dictionary_set_string(interface_desc,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
vmnet_shared_interface_name_key,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
physical_ifname);<br class=3D"">
&gt; +&nbsp; &nbsp; } else if (mode =3D=3D VMNET_HOST_MODE || mode =3D=3D =
VMNET_SHARED_MODE) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; /* Pass the DHCP configuration to =
vmnet, if the user provided one */<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; NetdevVmnetModeOptionsHostOrShared =
mode_opts =3D vmnet_opts-&gt;u.host;<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; if (mode_opts.has_dhcp_start_address) =
{<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* All DHCP arguments =
are available, as per the checks above */<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
xpc_dictionary_set_string(interface_desc,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
vmnet_start_address_key,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
mode_opts.dhcp_start_address);<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
xpc_dictionary_set_string(interface_desc,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
vmnet_end_address_key,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
mode_opts.dhcp_end_address);<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
xpc_dictionary_set_string(interface_desc,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
vmnet_subnet_mask_key,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
mode_opts.dhcp_subnet_mask);<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; }<br class=3D"">
&gt; +&nbsp; &nbsp; }<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; return interface_desc;<br class=3D"">
&gt; +}<br class=3D"">
&gt; +<br class=3D"">
&gt; +int net_init_vmnet_macos(const Netdev *netdev, const char =
*name,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; NetClientState *peer, Error **errp)<br class=3D"">
&gt; +{<br class=3D"">
&gt; +&nbsp; &nbsp; assert(netdev-&gt;type =3D=3D =
NET_CLIENT_DRIVER_VMNET_MACOS);<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; NetdevVmnetModeOptions *vmnet_opts =3D =
netdev-&gt;u.vmnet_macos.options;<br class=3D"">
&gt; +&nbsp; &nbsp; xpc_object_t iface_desc =3D =
_construct_vmnet_interface_description(vmnet_opts);<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; NetClientState *nc =3D =
qemu_new_net_client(&amp;net_vmnet_macos_info, peer,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp;"vmnet", name);<br class=3D"">
&gt; +&nbsp; &nbsp; vmnet_state_t *vmnet_client_state =3D =
DO_UPCAST(vmnet_state_t, nc, nc);<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; dispatch_queue_t vmnet_dispatch_queue =3D =
dispatch_queue_create(<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; "org.qemu.vmnet.iface_queue",<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; DISPATCH_QUEUE_SERIAL<br class=3D"">
&gt; +&nbsp; &nbsp; );<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; __block vmnet_return_t vmnet_start_status =3D 0;<br =
class=3D"">
&gt; +&nbsp; &nbsp; __block uint64_t vmnet_iface_mtu =3D 0;<br class=3D"">=

&gt; +&nbsp; &nbsp; __block uint64_t vmnet_max_packet_size =3D 0;<br =
class=3D"">
&gt; +&nbsp; &nbsp; __block const char *vmnet_mac_address =3D NULL;<br =
class=3D"">
&gt; +&nbsp; &nbsp; /*<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp;* We can't refer to an array type directly =
within a block,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp;* so hold a pointer instead.<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp;*/<br class=3D"">
&gt; +&nbsp; &nbsp; uuid_string_t vmnet_iface_uuid =3D {0};<br class=3D"">=

&gt; +&nbsp; &nbsp; __block uuid_string_t *vmnet_iface_uuid_ptr =3D =
&amp;vmnet_iface_uuid;<br class=3D"">
&gt; +&nbsp; &nbsp; /* These are only provided in VMNET_HOST_MODE and =
VMNET_SHARED_MODE */<br class=3D"">
&gt; +&nbsp; &nbsp; bool vmnet_provides_dhcp_info =3D (<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; vmnet_opts-&gt;mode =3D=3D =
VMNET_OPERATING_MODE_HOST ||<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; vmnet_opts-&gt;mode =3D=3D =
VMNET_OPERATING_MODE_SHARED);<br class=3D"">
&gt; +&nbsp; &nbsp; __block const char *vmnet_subnet_mask =3D NULL;<br =
class=3D"">
&gt; +&nbsp; &nbsp; __block const char *vmnet_dhcp_range_start =3D =
NULL;<br class=3D"">
&gt; +&nbsp; &nbsp; __block const char *vmnet_dhcp_range_end =3D =
NULL;<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; /* Create the vmnet interface */<br class=3D"">
&gt; +&nbsp; &nbsp; dispatch_semaphore_t vmnet_iface_sem =3D =
dispatch_semaphore_create(0);<br class=3D"">
&gt; +&nbsp; &nbsp; interface_ref vmnet_iface_ref =3D =
vmnet_start_interface(<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; iface_desc,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; vmnet_dispatch_queue,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; ^(vmnet_return_t status, =
xpc_object_t&nbsp; _Nullable interface_param) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; vmnet_start_status =3D status;<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; if (vmnet_start_status !=3D =
VMNET_SUCCESS || !interface_param) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /* Early return if the =
interface couldn't be started */<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
dispatch_semaphore_signal(vmnet_iface_sem);<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; }<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; /*<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* Read the configuration that =
vmnet provided us.<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* The provided dictionary is =
owned by XPC and may be freed<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* shortly after this block's =
execution.<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* So, copy data buffers now.<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*/<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; vmnet_iface_mtu =3D =
xpc_dictionary_get_uint64(<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; interface_param,<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vmnet_mtu_key<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; );<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; vmnet_max_packet_size =3D =
xpc_dictionary_get_uint64(<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; interface_param,<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
vmnet_max_packet_size_key<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; );<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; vmnet_mac_address =3D =
strdup(xpc_dictionary_get_string(<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; interface_param,<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vmnet_mac_address_key<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; ));<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; const uint8_t *iface_uuid =3D =
xpc_dictionary_get_uuid(<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; interface_param,<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
vmnet_interface_id_key<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; );<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; uuid_unparse_upper(iface_uuid, =
*vmnet_iface_uuid_ptr);<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; /* If we're in a mode that provides =
DHCP info, read it out now */<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; if (vmnet_provides_dhcp_info) {<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vmnet_dhcp_range_start =3D=
 strdup(xpc_dictionary_get_string(<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
interface_param,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
vmnet_start_address_key<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ));<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vmnet_dhcp_range_end =3D =
strdup(xpc_dictionary_get_string(<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
interface_param,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
vmnet_end_address_key<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ));<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; vmnet_subnet_mask =3D =
strdup(xpc_dictionary_get_string(<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
interface_param,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
vmnet_subnet_mask_key<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ));<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; }<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; =
dispatch_semaphore_signal(vmnet_iface_sem);<br class=3D"">
&gt; +&nbsp; &nbsp; });<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; /* And block until we receive a response from vmnet =
*/<br class=3D"">
&gt; +&nbsp; &nbsp; dispatch_semaphore_wait(vmnet_iface_sem, =
DISPATCH_TIME_FOREVER);<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; /* Did we manage to start the interface? */<br =
class=3D"">
&gt; +&nbsp; &nbsp; if (vmnet_start_status !=3D VMNET_SUCCESS || =
!vmnet_iface_ref) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; error_printf("Failed to start =
interface: %s\n",<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
_vmnet_status_repr(vmnet_start_status));<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; if (vmnet_start_status =3D=3D =
VMNET_FAILURE) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; error_printf("Hint: =
vmnet requires running with root access\n");<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; }<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; return -1;<br class=3D"">
&gt; +&nbsp; &nbsp; }<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; info_report("Started vmnet interface with =
configuration:");<br class=3D"">
&gt; +&nbsp; &nbsp; info_report("MTU:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; %llu", vmnet_iface_mtu);<br class=3D"">
&gt; +&nbsp; &nbsp; info_report("Max packet size:&nbsp; %llu", =
vmnet_max_packet_size);<br class=3D"">
&gt; +&nbsp; &nbsp; info_report("MAC:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; %s", vmnet_mac_address);<br class=3D"">
&gt; +&nbsp; &nbsp; if (vmnet_provides_dhcp_info) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; info_report("DHCP IPv4 start:&nbsp; =
%s", vmnet_dhcp_range_start);<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; info_report("DHCP IPv4 end:&nbsp; =
&nbsp; %s", vmnet_dhcp_range_end);<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; info_report("IPv4 subnet mask: %s", =
vmnet_subnet_mask);<br class=3D"">
&gt; +&nbsp; &nbsp; }<br class=3D"">
&gt; +&nbsp; &nbsp; info_report("UUID:&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;%s", vmnet_iface_uuid);<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; /* The interface is up! Set a block to run when =
packets are received */<br class=3D"">
&gt; +&nbsp; &nbsp; vmnet_client_state-&gt;vmnet_iface_ref =3D =
vmnet_iface_ref;<br class=3D"">
&gt; +&nbsp; &nbsp; vmnet_return_t event_cb_stat =3D =
vmnet_interface_set_event_callback(<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; vmnet_iface_ref,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; VMNET_INTERFACE_PACKETS_AVAILABLE,<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; vmnet_dispatch_queue,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; ^(interface_event_t event_mask, =
xpc_object_t&nbsp; _Nonnull event) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; if (event_mask !=3D =
VMNET_INTERFACE_PACKETS_AVAILABLE) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; error_printf("Unknown =
vmnet interface event 0x%08x\n", event_mask);<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; }<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; /* If we're unable to handle more =
packets now, drop this packet */<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; if =
(!vmnet_client_state-&gt;qemu_ready_to_receive) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return;<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; }<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; /*<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* TODO(Phillip Tennen &lt;<a =
href=3D"mailto:phillip@axleos.com" target=3D"_blank" =
class=3D"">phillip@axleos.com</a>&gt;): There may be more than<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* one packet available.<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* As an optimization, we could =
read<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* =
vmnet_estimated_packets_available_key packets now.<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*/<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; char *packet_buf =3D =
g_malloc0(vmnet_max_packet_size);<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; struct iovec *iov =3D g_new0(struct =
iovec, 1);<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; iov-&gt;iov_base =3D packet_buf;<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; iov-&gt;iov_len =3D =
vmnet_max_packet_size;<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; int pktcnt =3D 1;<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; struct vmpktdesc *v =3D g_new0(struct =
vmpktdesc, pktcnt);<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; v-&gt;vm_pkt_size =3D =
vmnet_max_packet_size;<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; v-&gt;vm_pkt_iov =3D iov;<br class=3D"">=

&gt; +&nbsp; &nbsp; &nbsp; &nbsp; v-&gt;vm_pkt_iovcnt =3D 1;<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; v-&gt;vm_flags =3D 0;<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; vmnet_return_t result =3D =
vmnet_read(vmnet_iface_ref, v, &amp;pktcnt);<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; if (result !=3D VMNET_SUCCESS) {<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; error_printf("Failed to =
read packet from host: %s\n",<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
_vmnet_status_repr(result));<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; }<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; /* Ensure we read exactly one packet =
*/<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; assert(pktcnt =3D=3D 1);<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; /* Dispatch this block to a global =
queue instead of the main queue,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* which is only created when the =
program has a Cocoa event loop.<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* If QEMU is started with =
-nographic, no Cocoa event loop will be <br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* created and thus the main =
queue will be unavailable.<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*/<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; =
dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, =
<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0), <br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;^{<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
qemu_mutex_lock_iothread();<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /*<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* Deliver the =
packet to the guest<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* If the delivery =
succeeded synchronously, this returns the length<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* of the sent =
packet.<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*/<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if =
(qemu_send_packet_async(nc, iov-&gt;iov_base,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;v-&gt;vm_pkt_size,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;vmnet_send_completed) =3D=3D 0) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
vmnet_client_state-&gt;qemu_ready_to_receive =3D false;<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; /*<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* It's safe to =
free the packet buffers.<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* Even if delivery =
needs to wait, qemu_net_queue_append copies<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;* the packet =
buffer.<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;*/<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; g_free(v);<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; g_free(iov);<br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; g_free(packet_buf);<br =
class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
qemu_mutex_unlock_iothread();<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; });<br class=3D"">
&gt; +&nbsp; &nbsp; });<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; /* Did we manage to set an event callback? */<br =
class=3D"">
&gt; +&nbsp; &nbsp; if (event_cb_stat !=3D VMNET_SUCCESS) {<br class=3D"">=

&gt; +&nbsp; &nbsp; &nbsp; &nbsp; error_printf("Failed to set up a =
callback to receive packets: %s\n",<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
_vmnet_status_repr(vmnet_start_status));<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; exit(1);<br class=3D"">
&gt; +&nbsp; &nbsp; }<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; /* We're now ready to receive packets */<br =
class=3D"">
&gt; +&nbsp; &nbsp; vmnet_client_state-&gt;qemu_ready_to_receive =3D =
true;<br class=3D"">
&gt; +&nbsp; &nbsp; vmnet_client_state-&gt;link_up =3D true;<br =
class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; /* Include DHCP info if we're in a relevant mode =
*/<br class=3D"">
&gt; +&nbsp; &nbsp; if (vmnet_provides_dhcp_info) {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; snprintf(nc-&gt;info_str, =
sizeof(nc-&gt;info_str),<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;"dhcp_start=3D%s,dhcp_end=3D%s,mask=3D%s",<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;vmnet_dhcp_range_start, vmnet_dhcp_range_end,<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;vmnet_subnet_mask);<br class=3D"">
&gt; +&nbsp; &nbsp; } else {<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; snprintf(nc-&gt;info_str, =
sizeof(nc-&gt;info_str),<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;"mac=3D%s", vmnet_mac_address);<br class=3D"">
&gt; +&nbsp; &nbsp; }<br class=3D"">
&gt; +<br class=3D"">
&gt; +&nbsp; &nbsp; return 0;<br class=3D"">
&gt; +}<br class=3D"">
&gt; diff --git a/qapi/net.json b/qapi/net.json<br class=3D"">
&gt; index c31748c87f..e4d4143243 100644<br class=3D"">
&gt; --- a/qapi/net.json<br class=3D"">
&gt; +++ b/qapi/net.json<br class=3D"">
&gt; @@ -450,6 +450,115 @@<br class=3D"">
&gt;&nbsp; &nbsp; &nbsp; '*vhostdev':&nbsp; &nbsp; &nbsp;'str',<br =
class=3D"">
&gt;&nbsp; &nbsp; &nbsp; '*queues':&nbsp; &nbsp; &nbsp; &nbsp;'int' } =
}<br class=3D"">
&gt;&nbsp; <br class=3D"">
&gt; +##<br class=3D"">
&gt; +# @VmnetOperatingMode:<br class=3D"">
&gt; +#<br class=3D"">
&gt; +# The operating modes in which a vmnet netdev can run<br class=3D"">=

&gt; +# Only available on macOS<br class=3D"">
&gt; +#<br class=3D"">
&gt; +# @host: the guest may communicate with the host <br class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; and other guest network interfaces<br =
class=3D"">
&gt; +#<br class=3D"">
&gt; +# @shared: the guest may reach the Internet through a NAT, <br =
class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; and may communicate with the =
host and other guest <br class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; network interfaces<br =
class=3D"">
&gt; +#<br class=3D"">
&gt; +# @bridged: the guest's traffic is bridged with a <br class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;physical network =
interface of the host<br class=3D"">
&gt; +#<br class=3D"">
&gt; +# Since: 6.0<br class=3D"">
&gt; +##<br class=3D"">
&gt; +{ 'enum': 'VmnetOperatingMode',<br class=3D"">
&gt; +&nbsp; 'data': [ 'host', 'shared', 'bridged' ],<br class=3D"">
&gt; +&nbsp; 'if': 'defined(CONFIG_DARWIN)' }<br class=3D"">
&gt; +<br class=3D"">
&gt; +##<br class=3D"">
&gt; +# @NetdevVmnetModeOptionsBridged:<br class=3D"">
&gt; +#<br class=3D"">
&gt; +# Options for the vmnet-macos netdev<br class=3D"">
&gt; +# that are only available in 'bridged' mode<br class=3D"">
&gt; +# Only available on macOS<br class=3D"">
&gt; +#<br class=3D"">
&gt; +# @ifname: the physical network interface to bridge with <br =
class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; (defaults to en0 if not =
specified)<br class=3D"">
&gt; +#<br class=3D"">
&gt; +# Since: 6.0<br class=3D"">
&gt; +##<br class=3D"">
&gt; +{ 'struct': 'NetdevVmnetModeOptionsBridged',<br class=3D"">
&gt; +&nbsp; 'data': { '*ifname':&nbsp; 'str' },<br class=3D"">
&gt; +&nbsp; 'if': 'defined(CONFIG_DARWIN)' }<br class=3D"">
&gt; +<br class=3D"">
&gt; +##<br class=3D"">
&gt; +# @NetdevVmnetModeOptionsHostOrShared:<br class=3D"">
&gt; +#<br class=3D"">
&gt; +# Options for the vmnet-macos netdev<br class=3D"">
&gt; +# that are only available in 'host' or 'shared' mode<br class=3D"">
&gt; +# Only available on macOS<br class=3D"">
&gt; +#<br class=3D"">
&gt; +# @dhcp-start-address: the gateway address to use for the =
interface. <br class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; The range to dhcp_end_address is placed in the DHCP =
pool.<br class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; (only valid with mode=3Dhost|shared)<br class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; (must be specified with dhcp-end-address and <br class=3D"">=

&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;dhcp-subnet-mask)<br class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; (allocated automatically if unset)<br class=3D"">
&gt; +#<br class=3D"">
&gt; +# @dhcp-end-address: the DHCP IPv4 range end address to use for =
the interface. <br class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; (only valid with mode=3Dhost|shared)<br class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; (must be specified with dhcp-start-address and <br =
class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp;dhcp-subnet-mask)<br class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; (allocated automatically if unset)<br class=3D"">
&gt; +#<br class=3D"">
&gt; +# @dhcp-subnet-mask: the IPv4 subnet mask (string) to use on the =
interface.<br class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; (only valid with mode=3Dhost|shared)<br class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; (must be specified with dhcp-start-address and <br class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;dhcp-end-address)<br class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; (allocated automatically if unset)<br class=3D"">
&gt; +#<br class=3D"">
&gt; +# Since: 6.0<br class=3D"">
&gt; +##<br class=3D"">
&gt; +{ 'struct': 'NetdevVmnetModeOptionsHostOrShared',<br class=3D"">
&gt; +&nbsp; 'data': { <br class=3D"">
&gt; +&nbsp; &nbsp; '*dhcp-start-address': 'str' ,<br class=3D"">
&gt; +&nbsp; &nbsp; '*dhcp-end-address':&nbsp; &nbsp;'str',<br class=3D"">=

&gt; +&nbsp; &nbsp; '*dhcp-subnet-mask':&nbsp; &nbsp;'str' },<br =
class=3D"">
&gt; +&nbsp; 'if': 'defined(CONFIG_DARWIN)' }<br class=3D"">
&gt; +<br class=3D"">
&gt; +##<br class=3D"">
&gt; +# @NetdevVmnetModeOptions:<br class=3D"">
&gt; +#<br class=3D"">
&gt; +# Options specific to different operating modes of a vmnet =
netdev<br class=3D"">
&gt; +# Only available on macOS<br class=3D"">
&gt; +#<br class=3D"">
&gt; +# @mode: the operating mode vmnet should run in<br class=3D"">
&gt; +#<br class=3D"">
&gt; +# Since: 6.0<br class=3D"">
&gt; +##<br class=3D"">
&gt; +{ 'union': 'NetdevVmnetModeOptions',<br class=3D"">
&gt; +&nbsp; 'base': { 'mode': 'VmnetOperatingMode' },<br class=3D"">
&gt; +&nbsp; 'discriminator': 'mode',<br class=3D"">
&gt; +&nbsp; 'data': {<br class=3D"">
&gt; +&nbsp; &nbsp; 'bridged':&nbsp; &nbsp; &nbsp; =
'NetdevVmnetModeOptionsBridged',<br class=3D"">
&gt; +&nbsp; &nbsp; 'host':&nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp;'NetdevVmnetModeOptionsHostOrShared',<br class=3D"">
&gt; +&nbsp; &nbsp; 'shared':&nbsp; &nbsp; &nbsp; =
&nbsp;'NetdevVmnetModeOptionsHostOrShared' },<br class=3D"">
&gt; +&nbsp; 'if': 'defined(CONFIG_DARWIN)' }<br class=3D"">
&gt; +<br class=3D"">
&gt; +##<br class=3D"">
&gt; +# @NetdevVmnetOptions:<br class=3D"">
&gt; +#<br class=3D"">
&gt; +# vmnet network backend<br class=3D"">
&gt; +# Only available on macOS<br class=3D"">
&gt; +#<br class=3D"">
&gt; +# @options: a structure specifying the mode and mode-specific =
options<br class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(once QAPI supports a =
union type as a branch to another union type,<br class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; this structure can be =
changed to a union, and the contents of<br class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; NetdevVmnetModeOptions =
moved here)<br class=3D"">
&gt; +#<br class=3D"">
&gt; +# Since: 6.0<br class=3D"">
&gt; +##<br class=3D"">
&gt; +{ 'struct': 'NetdevVmnetOptions',<br class=3D"">
&gt; +&nbsp; 'data': {'options': 'NetdevVmnetModeOptions' },<br =
class=3D"">
&gt; +&nbsp; 'if': 'defined(CONFIG_DARWIN)' }<br class=3D"">
&gt; +<br class=3D"">
&gt;&nbsp; ##<br class=3D"">
&gt;&nbsp; # @NetClientDriver:<br class=3D"">
&gt;&nbsp; #<br class=3D"">
&gt; @@ -458,10 +567,13 @@<br class=3D"">
&gt;&nbsp; # Since: 2.7<br class=3D"">
&gt;&nbsp; #<br class=3D"">
&gt;&nbsp; #&nbsp; &nbsp; &nbsp; &nbsp; @vhost-vdpa since 5.1<br =
class=3D"">
&gt; +#<br class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; @vmnet-macos since 6.0 (only =
available on macOS)<br class=3D"">
&gt;&nbsp; ##<br class=3D"">
&gt;&nbsp; { 'enum': 'NetClientDriver',<br class=3D"">
&gt;&nbsp; &nbsp; 'data': [ 'none', 'nic', 'user', 'tap', 'l2tpv3', =
'socket', 'vde',<br class=3D"">
&gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'bridge', 'hubport', =
'netmap', 'vhost-user', 'vhost-vdpa' ] }<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 'bridge', 'hubport', =
'netmap', 'vhost-user', 'vhost-vdpa',<br class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; { 'name': 'vmnet-macos', =
'if': 'defined(CONFIG_DARWIN)' } ] }<br class=3D"">
&gt;&nbsp; <br class=3D"">
&gt;&nbsp; ##<br class=3D"">
&gt;&nbsp; # @Netdev:<br class=3D"">
&gt; @@ -475,6 +587,8 @@<br class=3D"">
&gt;&nbsp; # Since: 1.2<br class=3D"">
&gt;&nbsp; #<br class=3D"">
&gt;&nbsp; #&nbsp; &nbsp; &nbsp; &nbsp; 'l2tpv3' - since 2.1<br =
class=3D"">
&gt; +#<br class=3D"">
&gt; +#&nbsp; &nbsp; &nbsp; &nbsp; 'vmnet-macos' since 6.0 (only =
available on macOS)<br class=3D"">
&gt;&nbsp; ##<br class=3D"">
&gt;&nbsp; { 'union': 'Netdev',<br class=3D"">
&gt;&nbsp; &nbsp; 'base': { 'id': 'str', 'type': 'NetClientDriver' },<br =
class=3D"">
&gt; @@ -490,7 +604,9 @@<br class=3D"">
&gt;&nbsp; &nbsp; &nbsp; 'hubport':&nbsp; 'NetdevHubPortOptions',<br =
class=3D"">
&gt;&nbsp; &nbsp; &nbsp; 'netmap':&nbsp; &nbsp;'NetdevNetmapOptions',<br =
class=3D"">
&gt;&nbsp; &nbsp; &nbsp; 'vhost-user': 'NetdevVhostUserOptions',<br =
class=3D"">
&gt; -&nbsp; &nbsp; 'vhost-vdpa': 'NetdevVhostVDPAOptions' } }<br =
class=3D"">
&gt; +&nbsp; &nbsp; 'vhost-vdpa': 'NetdevVhostVDPAOptions',<br class=3D"">=

&gt; +&nbsp; &nbsp; 'vmnet-macos': { 'type': 'NetdevVmnetOptions', <br =
class=3D"">
&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;'if': 'defined(CONFIG_DARWIN)' } } }<br class=3D"">
&gt;&nbsp; <br class=3D"">
&gt;&nbsp; ##<br class=3D"">
&gt;&nbsp; # @NetFilterDirection:<br class=3D"">
&gt; diff --git a/qemu-options.hx b/qemu-options.hx<br class=3D"">
&gt; index 9172d51659..ec6b40b079 100644<br class=3D"">
&gt; --- a/qemu-options.hx<br class=3D"">
&gt; +++ b/qemu-options.hx<br class=3D"">
&gt; @@ -2483,6 +2483,15 @@ DEF("netdev", HAS_ARG, =
QEMU_OPTION_netdev,<br class=3D"">
&gt;&nbsp; #ifdef __linux__<br class=3D"">
&gt;&nbsp; &nbsp; &nbsp; "-netdev =
vhost-vdpa,id=3Dstr,vhostdev=3D/path/to/dev\n"<br class=3D"">
&gt;&nbsp; &nbsp; &nbsp; "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; configure a vhost-vdpa network,Establish a vhost-vdpa =
netdev\n"<br class=3D"">
&gt; +#endif<br class=3D"">
&gt; +#ifdef CONFIG_DARWIN<br class=3D"">
&gt; +&nbsp; &nbsp; "-netdev =
vmnet-macos,id=3Dstr,mode=3Dbridged[,ifname=3Difname]\n"<br class=3D"">
&gt; +&nbsp; &nbsp; "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;configure a =
macOS-provided vmnet network in \"physical interface bridge\" mode\n"<br =
class=3D"">
&gt; +&nbsp; &nbsp; "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;the physical =
interface to bridge with defaults to en0 if unspecified\n"<br class=3D"">
&gt; +&nbsp; &nbsp; "-netdev vmnet-macos,id=3Dstr,mode=3Dhost|shared\n"<br=
 class=3D"">
&gt; +&nbsp; &nbsp; "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; =
&nbsp;[,dhcp_start_address=3Daddr,dhcp_end_address=3Daddr,dhcp_subnet_mask=
=3Dmask]\n"<br class=3D"">
&gt; +&nbsp; &nbsp; "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;configure a =
macOS-provided vmnet network in \"host\" or \"shared\" mode\n"<br =
class=3D"">
&gt; +&nbsp; &nbsp; "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;the DHCP =
configuration will be set automatically if unspecified\n"<br class=3D"">
&gt;&nbsp; #endif<br class=3D"">
&gt;&nbsp; &nbsp; &nbsp; "-netdev =
hubport,id=3Dstr,hubid=3Dn[,netdev=3Dnd]\n"<br class=3D"">
&gt;&nbsp; &nbsp; &nbsp; "&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; configure a hub port on the hub with ID 'n'\n", =
QEMU_ARCH_ALL)<br class=3D"">
&gt; -- <br class=3D"">
&gt; 2.24.3 (Apple Git-128)<br class=3D"">
&gt; <br class=3D"">
&gt; <br class=3D"">
</blockquote></div>
</div></blockquote></div><br class=3D""></div></div></body></html>=

--Apple-Mail=_A22587D6-1288-42FD-9FE5-1663BC9E9796--

