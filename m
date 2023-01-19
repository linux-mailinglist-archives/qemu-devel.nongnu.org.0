Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 842386743A0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 21:42:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIbik-00022R-TH; Thu, 19 Jan 2023 15:41:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pIbij-00022J-T0
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:41:13 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pIbie-0000F7-Mt
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 15:41:11 -0500
Received: by mail-yb1-xb30.google.com with SMTP id d62so4138404ybh.8
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 12:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=tVYg0LBfQpP8CMRxfGLMTEolOS8290sTF9hgzf8Dl0I=;
 b=frq33kGhTJDP4oOHPvM71EYLssFKZWJ3Cqstj6n1znaLGo5MFp2R6SX5oSt1vHgo7p
 UxAjXDHSa6UDWPdLnm+489ToEqbd/TqvAkbABB+BcOKdSnthOyP0pLvufpcFTRN/HcjM
 t8+1tzJ5k/0CC+mhS6bnKVspkRK2uwmvc7InBbPn9nUgvzXpQMEtajw/a28OucSvvd2z
 7KS+Fr3uu30TVfihqQJ4P71SEzfxG0ZXH4quOQXpUfIb99u+c4V9tmxRnxJPZEn8D/xC
 sf6wkqbRz99ocOA8eQzKtvINst+nFVXYuKC7ohHcpgi6TWikzHKAoxUTZgVsFw5sMGTU
 cq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tVYg0LBfQpP8CMRxfGLMTEolOS8290sTF9hgzf8Dl0I=;
 b=41bvlRCiD+OX8wL17zSGY9v4onvDcQlPn1PI7jXeWQJ82NxDEEOY4EBwUnHo3GIUy8
 53zpnIaXpYv/J6jFw1C3it+k2F7LfZfKZry2ejziYUA7kgVtVqdjzEEvO0JGHIHIltw6
 Hvfbvy9eTA9sVJn2Dj3PSkH33TACrVR9llakNkAXJWzi6VN+vbU9jSvJETGklQ19YHzt
 KR3IKltQMqEQ1D001RGrQHQE9gJAsF8DS1DFoLdyPLREpLxftqfSfl/Rh4GZDQ+WjfZy
 Ri4WEFfhhADmLiDkGzqsgOTpQgMKuG3r9gKQoP28JrcdMci+BaRikXho22d1gIY4jeCf
 DhJg==
X-Gm-Message-State: AFqh2krS3VCxQEiVTAFo5oLDwc9YA+8rHdtYoJEeFhmOIpJUppSKLyUn
 xQ++DaEfFcZDIjYYJ33yO92ojLbbw8SZtcco7TY=
X-Google-Smtp-Source: AMrXdXtWESN+ZGI8pkqf7A18PPDy3KhXwcKn+M/OupkHqpXuAYIqjZ/xLBzPl6s9n4KyOvD2mtDCIqu1WqhTpF+yolg=
X-Received: by 2002:a25:4057:0:b0:7fe:7449:5f65 with SMTP id
 n84-20020a254057000000b007fe74495f65mr277717yba.642.1674160867479; Thu, 19
 Jan 2023 12:41:07 -0800 (PST)
MIME-Version: 1.0
References: <20230115170903.3416105-1-antonkuchin@yandex-team.ru>
 <CAJSP0QVKUKgkBMw1PiN8-L8Ykhq=gfvNTTs4sf1tuzoqHu+GXw@mail.gmail.com>
 <0d57cc40-693b-b36c-a135-fdac60dd00ec@yandex-team.ru>
 <CAJSP0QUXB0kgsCSsmi8dpnJFYho2cR_2Liep=pGmp6WzDZ_7pw@mail.gmail.com>
 <d6bf0b9a-a167-817d-2c17-c2e472961155@yandex-team.ru>
 <CAJSP0QXXe6KgLN2PJvi-5GqcELhUKJPB2pUARL2ktO9TQYAq=g@mail.gmail.com>
 <2fb6efb4-9155-99ad-3acd-c274783436ed@yandex-team.ru>
In-Reply-To: <2fb6efb4-9155-99ad-3acd-c274783436ed@yandex-team.ru>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 19 Jan 2023 15:40:53 -0500
Message-ID: <CAJSP0QVG3cHqjG4z7eoHJ-3Q5a4zdhH1rqpj5e1chme2xEroBg@mail.gmail.com>
Subject: Re: [PATCH] vhost-user-fs: add capability to allow migration
To: Anton Kuchin <antonkuchin@yandex-team.ru>
Cc: qemu-devel@nongnu.org, virtio-fs@redhat.com, 
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, yc-core@yandex-team.ru, 
 "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Thu, 19 Jan 2023 at 11:58, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
>
> On 19/01/2023 18:02, Stefan Hajnoczi wrote:
> > On Thu, 19 Jan 2023 at 10:29, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
> >> On 19/01/2023 16:30, Stefan Hajnoczi wrote:
> >>> On Thu, 19 Jan 2023 at 07:43, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
> >>>> On 18/01/2023 17:52, Stefan Hajnoczi wrote:
> >>>>> On Sun, 15 Jan 2023 at 12:21, Anton Kuchin <antonkuchin@yandex-team.ru> wrote:
> >>>>>> Now any vhost-user-fs device makes VM unmigratable, that also prevents
> >>>>>> qemu update without stopping the VM. In most cases that makes sense
> >>>>>> because qemu has no way to transfer FUSE session state.
> >>>>>>
> >>>>>> But we can give an option to orchestrator to override this if it can
> >>>>>> guarantee that state will be preserved (e.g. it uses migration to
> >>>>>> update qemu and dst will run on the same host as src and use the same
> >>>>>> socket endpoints).
> >>>>>>
> >>>>>> This patch keeps default behavior that prevents migration with such devices
> >>>>>> but adds migration capability 'vhost-user-fs' to explicitly allow migration.
> >>>>>>
> >>>>>> Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
> >>>>>> ---
> >>>>>>     hw/virtio/vhost-user-fs.c | 25 ++++++++++++++++++++++++-
> >>>>>>     qapi/migration.json       |  7 ++++++-
> >>>>>>     2 files changed, 30 insertions(+), 2 deletions(-)
> >>>>>>
> >>>>>> diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
> >>>>>> index f5049735ac..13d920423e 100644
> >>>>>> --- a/hw/virtio/vhost-user-fs.c
> >>>>>> +++ b/hw/virtio/vhost-user-fs.c
> >>>>>> @@ -24,6 +24,7 @@
> >>>>>>     #include "hw/virtio/vhost-user-fs.h"
> >>>>>>     #include "monitor/monitor.h"
> >>>>>>     #include "sysemu/sysemu.h"
> >>>>>> +#include "migration/migration.h"
> >>>>>>
> >>>>>>     static const int user_feature_bits[] = {
> >>>>>>         VIRTIO_F_VERSION_1,
> >>>>>> @@ -298,9 +299,31 @@ static struct vhost_dev *vuf_get_vhost(VirtIODevice *vdev)
> >>>>>>         return &fs->vhost_dev;
> >>>>>>     }
> >>>>>>
> >>>>>> +static int vhost_user_fs_pre_save(void *opaque)
> >>>>>> +{
> >>>>>> +    MigrationState *s = migrate_get_current();
> >>>>>> +
> >>>>>> +    if (!s->enabled_capabilities[MIGRATION_CAPABILITY_VHOST_USER_FS]) {
> >>>>>> +        error_report("Migration of vhost-user-fs devices requires internal FUSE "
> >>>>>> +                     "state of backend to be preserved. If orchestrator can "
> >>>>>> +                     "guarantee this (e.g. dst connects to the same backend "
> >>>>>> +                     "instance or backend state is migrated) set 'vhost-user-fs' "
> >>>>>> +                     "migration capability to true to enable migration.");
> >>>>>> +        return -1;
> >>>>>> +    }
> >>>>>> +
> >>>>>> +    return 0;
> >>>>>> +}
> >>>>>> +
> >>>>>>     static const VMStateDescription vuf_vmstate = {
> >>>>>>         .name = "vhost-user-fs",
> >>>>>> -    .unmigratable = 1,
> >>>>>> +    .minimum_version_id = 0,
> >>>>>> +    .version_id = 0,
> >>>>>> +    .fields = (VMStateField[]) {
> >>>>>> +        VMSTATE_VIRTIO_DEVICE,
> >>>>>> +        VMSTATE_END_OF_LIST()
> >>>>>> +    },
> >>>>>> +   .pre_save = vhost_user_fs_pre_save,
> >>>>>>     };
> >>>>> Will it be possible to extend this vmstate when virtiofsd adds support
> >>>>> for stateful migration without breaking migration compatibility?
> >>>>>
> >>>>> If not, then I think a marker field should be added to the vmstate:
> >>>>> 0 - stateless/reconnect migration (the approach you're adding in this patch)
> >>>>> 1 - stateful migration (future virtiofsd feature)
> >>>>>
> >>>>> When the field is 0 there are no further vmstate fields and we trust
> >>>>> that the destination vhost-user-fs server already has the necessary
> >>>>> state.
> >>>>>
> >>>>> When the field is 1 there are additional vmstate fields that contain
> >>>>> the virtiofsd state.
> >>>>>
> >>>>> The goal is for QEMU to support 3 migration modes, depending on the
> >>>>> vhost-user-fs server:
> >>>>> 1. No migration support.
> >>>>> 2. Stateless migration.
> >>>>> 3. Stateful migration.
> >>>> Sure. These vmstate fields are very generic and mandatory for any
> >>>> virtio device. If in future more state can be transfer in migration
> >>>> stream the vmstate can be extended with additional fields. This can
> >>>> be done with new subsections and/or bumping version_id.
> >>> My concern is that the vmstate introduced in this patch may be
> >>> unusable when stateful migration is added. So additional compatibility
> >>> code will need to be introduced to make your stateless migration
> >>> continue working with extended vmstate.
> >>>
> >>> By adding a marker field in this patch it should be possible to
> >>> continue using the same vmstate for stateless migration without adding
> >>> extra compatibility code in the future.
> >> I understand, but this fields in vmstate just packs generic virtio
> >> device state that is accessible by qemu. All additional data could be
> >> added later by extra fields. I believe we couldn't pull off any type
> >> of virtio device migration without transferring virtqueues so more
> >> sophisticated types of migration would require adding more data and
> >> not modification to this part of vmstate.
> > What I'm saying is that your patch could define the vmstate such that
> > it that contains a field to differentiate between stateless and
> > stateful migration. That way QEMU versions that only support stateless
> > migration (this patch) will be able to migrate to future QEMU versions
> > that support both stateless and stateful without compatibility issues.
> I double-checked migration documentation for subsections at
> https://www.qemu.org/docs/master/devel/migration.html#subsections
> and believe it perfectly describes our case: virtio device state
> should always be transferred both in stateless or stateful migration.
> With stateful one we would add new subsection with extra data that
> will be transferred only if stateless capability is not set. We can
> connect this subsection to device property and machine type if we
> need to.
> On the receiving side we always need basic virtio device state and
> newer versions will be able to load extra data from subsection if it
> is present, while older versions will be still able to accept the
> migrations that were initiated from new versions with stateless flag
> set and don't have extra subsection.
>
> The only scenario that will fail is older qemu won't be able to load
> new migration stream with additional subsection that it can't
> understand - this is general limitation of migration compatibility.
> So we can't completely protect older versions from future migration
> stream format because we don't know what will be in that stream
> but looks like we have all the tools to maintain compatibility
> reasonably wide.
> > I'm not sure if my suggestion to add a marker field to vuf_vmstate is
> > the best way to do this, but have you thought of how to handle the
> > future addition of stateful migration to the vmstate without breaking
> > stateless vmstates? Maybe David Gilbert has a suggestion for how to do
> > this cleanly.
> >
> > Stefan
>
> I think we'd be better without a new marker because migration code
> has standard generic way of solving such puzzles that I described
> above. So adding new marker would go against existing practice.

That sounds good to me, thanks!

Stefan

