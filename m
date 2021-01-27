Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 077F630641F
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 20:34:07 +0100 (CET)
Received: from localhost ([::1]:37852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4qZp-0003Av-Oj
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 14:34:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l4qXz-0002gw-3o
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:32:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1l4qXr-0004ri-LM
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 14:32:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611775916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K3+SoSS/WaZlDxrK4Qw9R0epigjWo8U3IS4fzlN2trM=;
 b=fv0+jXYHOtWXiWNMnxnygf4q7UC9z9SIY2RNeTg/O6dm+ZKU6kSW/OrM/5WAzRMs0obFg6
 pwDQLe7O7LuoyC8FWWQuz9Q8MEVlGpMej9f8hpmT3hIqs93hMgIhLTZ+3d7NwQ0P6GJOkw
 QgOqouBjfy+Go8a9XgOxqe9Gy/LXf4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-sqe07B3tOum328J50A5t6g-1; Wed, 27 Jan 2021 14:31:54 -0500
X-MC-Unique: sqe07B3tOum328J50A5t6g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32EA71922960;
 Wed, 27 Jan 2021 19:31:53 +0000 (UTC)
Received: from localhost (unknown [10.40.208.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6C5B05D766;
 Wed, 27 Jan 2021 19:31:51 +0000 (UTC)
Date: Wed, 27 Jan 2021 20:31:49 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Michal Privoznik <mprivozn@redhat.com>
Subject: Re: [PATCH v3] machine: add missing doc for memory-backend option
Message-ID: <20210127203149.59a34624@redhat.com>
In-Reply-To: <2a90bb34-3950-ef4a-9c1c-81d6cb6b1155@redhat.com>
References: <20210121161504.1007247-1-imammedo@redhat.com>
 <20210127104511.GF3653144@redhat.com>
 <20210127105436.GG3653144@redhat.com>
 <756c025a-3811-4a36-98a2-3a02bd756523@redhat.com>
 <20210127163522.5a8db09a@redhat.com>
 <2a90bb34-3950-ef4a-9c1c-81d6cb6b1155@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.308,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, pkrempa@redhat.com, "Daniel P.
 =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Jan 2021 18:03:27 +0100
Michal Privoznik <mprivozn@redhat.com> wrote:

> On 1/27/21 4:35 PM, Igor Mammedov wrote:
> > On Wed, 27 Jan 2021 15:24:26 +0100
> > Michal Privoznik <mprivozn@redhat.com> wrote:
> >  =20
> >> On 1/27/21 11:54 AM, Daniel P. Berrang=C3=A9 wrote: =20
> >>> On Wed, Jan 27, 2021 at 10:45:11AM +0000, Daniel P. Berrang=C3=A9 wro=
te: =20
> >>>> On Thu, Jan 21, 2021 at 11:15:04AM -0500, Igor Mammedov wrote: =20
> >>
> >> =20
> >>>>
> >>>> How does a mgmt app know which machine types need to use this
> >>>> option ? The machine type names are opaque strings, and apps
> >>>> must not attempt to parse or interpret the version number
> >>>> inside the machine type name, as they can be changed by
> >>>> distros.  IOW, saying to use it for machine types 4.0 and
> >>>> older isn't a valid usage strategy IMHO. =20
> > it's possible (but no necessary) to use knob with new machine types
> > (defaults for these match suggested property value).
> > Limiting knob usage to 4.0 and older would allow us to drop
> > without extra efforts once 4.0 is deprecated/removed. =20
>=20
> Problem here is that libvirt treats machine type as an opaque string.=20
> Therefore, as could be seen in my patch for libvirt, the property is=20
> disabled for all started VMs, regardless of machine type:
>=20
> https://www.redhat.com/archives/libvir-list/2021-January/msg00686.html
>=20
> So it can't really go away ever, can it?
>=20
> >  =20
> >>> Looking at the libvirt patch, we do indeed use his property
> >>> unconditionally for all machine types, precisely because parsing
> >>> version numbers from the machine type is not allowed.
> >>>
> >>> https://www.redhat.com/archives/libvir-list/2021-January/msg00633.htm=
l
> >>>
> >>> So this doc is telling apps to do something that isn't viable =20
> >>
> >> The other approach that I was suggesting was, that QEMU stops reportin=
g
> >> 'default-ram-id' for affected machine types. The way the switch from '=
-m
> >> XMB' to memory-backend-* was implemented in libvirt is that if libvirt
> >> sees 'default-ram-id' attribute for given machine type it uses
> >> memory-backend-* otherwise it falls back to -m.
> >>
> >> Since we know which machine types are "broken", we can stop reporting
> >> the attribute and thus stop tickling this bug. I agree that it puts mo=
re
> >> burden on distro maintainers to backport the change, but I think it's
> >> acceptable risk. =20
> >=20
> > default-ram-id is already exposed in wild including old machine types
> > starting from 5.2 =20
>=20
> It is, but according to qapi/machine.json it is optional. Mgmt apps have=
=20
> to be able to deal with it missing.
>=20
> >=20
> > if libvirt will take care this one quirk, then I guess we can
> > do as suggested. I can post an additional patch to this effect if there
> > is agreement to go this route. =20
>=20
> The beauty of this solution is that libvirt wouldn't need to do anything=
=20
> :-)  As I said earlier, if no default-ram-id is found then libvirt falls=
=20
> back to '-m X'.
>=20
> I've cooked a dirty patch that works in my testing:
we can discuss this separately from the current topic as it doesn't
affect libvirt side directly.
I'm still not sure we actually need it,
since 5.2 will expose default_ram_id for all machine types, and who knows
what other users do with it (aside libvirt).
It looks to me that following usual deprecation process is simpler,
than adding hacks on top of existing ones.

> diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> index affffe0c4a..2214782d72 100644
> --- a/hw/core/machine-qmp-cmds.c
> +++ b/hw/core/machine-qmp-cmds.c
> @@ -238,8 +238,33 @@ MachineInfoList *qmp_query_machines(Error **errp)
>               info->has_default_cpu_type =3D true;
>           }
>           if (mc->default_ram_id) {
> -            info->default_ram_id =3D g_strdup(mc->default_ram_id);
> -            info->has_default_ram_id =3D true;
> +            int i;
> +            bool broken =3D false;
> +
> +            /* Default RAM ID is broken if=20
> x-use-canonical-path-for-ramblock-id
> +             * property of memory-backend is on. That's why it's=20
> disabled in
> +             * create_default_memdev(). However, some machine types=20
> turn it on
> +             * for backwards compatibility. */
> +            for (i =3D 0; i < mc->compat_props->len; i++) {
> +                GlobalProperty *p =3D g_ptr_array_index(mc->compat_props=
, i);
> +
> +                if (strcmp(p->driver, TYPE_MEMORY_BACKEND_FILE) !=3D 0)
> +                    continue;
> +
> +                if (strcmp(p->property,=20
> "x-use-canonical-path-for-ramblock-id") !=3D 0)
> +                    continue;
> +
> +                if (strcmp(p->value, "true") !=3D 0)
> +                    continue;
> +
> +                broken =3D true;
> +                break;
> +            }
> +
> +            if (!broken) {
> +                info->default_ram_id =3D g_strdup(mc->default_ram_id);
> +                info->has_default_ram_id =3D true;
> +            }
>           }
>=20
>           QAPI_LIST_PREPEND(mach_list, info);
>=20
>=20
> Michal
>=20
>=20


