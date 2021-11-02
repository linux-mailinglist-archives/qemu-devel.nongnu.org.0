Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C18B44357A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 19:22:42 +0100 (CET)
Received: from localhost ([::1]:43336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhyQj-0002b2-Dh
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 14:22:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhyDx-0003me-9R
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:09:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mhyDv-0005dU-18
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 14:09:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635876566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=b/Tun746SEhZ+2ztpIjmbQlGp+7PqF5bZfxt4bCPsFo=;
 b=CK5NX0bfTC7VR+TJXsT+c0FFWAO17qw34/TieoTDrIKGMssXKPNmnIr237U9yQe+fjAVKI
 MjwSkcPfVtFmqE0p0wHJ4SASdVtoEekSKu1TH8Jmv4ZPxeaX/MzyX+uGmYIa1XdCmS9qpT
 5zMlRHeJoa/byvCZaJ0jfkSW+9OpWLM=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-484-HA1DnfLTNgKFRr0xu6s4QQ-1; Tue, 02 Nov 2021 14:09:25 -0400
X-MC-Unique: HA1DnfLTNgKFRr0xu6s4QQ-1
Received: by mail-vk1-f199.google.com with SMTP id
 f11-20020a1f9c0b000000b002e52d613018so56290vke.20
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 11:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b/Tun746SEhZ+2ztpIjmbQlGp+7PqF5bZfxt4bCPsFo=;
 b=1P+c3uPwBtRf7LjJBRgT781YVbKqUxHTSxAgculrME7s5zcn7wA/k1rBpUFmE3NV3u
 WBWY9WLl3JrTUdGwFedmP9iRcBdXsRoam80dg7jvuNIXwBDR+1s/ixiMA7MAz8Bc18l2
 R5kteYl/gP8+DxpP6LQjwkDJBl6sgIyzAdJ5iIpV+O/dDo4IzC8iOT8yewq3wfKzigYN
 7hkq1Nq4WOiFqtjyqhj9tCu6a/8hEgKwAPQLRM+eAvlvCbvdooPhM41wBoTiU3hIEOO5
 7gClzhEhaEmDkroVMNkvJbq+NZCnhB/EE9zDdR+iKDPMPYy52vYxeMpIQ1mSiCTzYbIJ
 8Ekw==
X-Gm-Message-State: AOAM532K2yMPEhX0GHCTjontste0B2ivRPeJSchzwATjFdOMPYKf1tbk
 SJTBU1EEveRuqLSqos9sJ1g5SleOnqmNsXzKIdRvTPRbtM3XHqwng6+db6K/We0EODUuIMBT3n2
 jAyQv5+nJeQRTP2lz9az1/LnSwD2HvDw=
X-Received: by 2002:a67:c194:: with SMTP id h20mr4041558vsj.19.1635876564591; 
 Tue, 02 Nov 2021 11:09:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy2lQ7Ph5tjivWsK17PcTvtuHAINJBmd5oV4NvHNasWbiVhVYtScWamN+52vWvj6BHwHTxwVFLDewCUDLMqRYg=
X-Received: by 2002:a67:c194:: with SMTP id h20mr4041516vsj.19.1635876564310; 
 Tue, 02 Nov 2021 11:09:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210929144311.1168561-1-lvivier@redhat.com>
 <20210929144311.1168561-3-lvivier@redhat.com>
 <20211102110043-mutt-send-email-mst@kernel.org>
 <5139c0a8-6aa0-48df-f353-84a15ffc4dd1@redhat.com>
 <20211102130811-mutt-send-email-mst@kernel.org> <87v91afozo.fsf@secure.mitica>
 <fcd90239-6152-fde8-db95-a3692ae151ba@redhat.com>
In-Reply-To: <fcd90239-6152-fde8-db95-a3692ae151ba@redhat.com>
From: Juan Quintela <quintela@redhat.com>
Date: Tue, 2 Nov 2021 19:09:13 +0100
Message-ID: <CAGiv1-W-1f=VQLZ1XgO-bspwF+UC_F-h6iBp6tYccPofh1JAoA@mail.gmail.com>
Subject: Re: [PATCH 2/2] failover: don't allow to migrate a paused VM that
 needs PCI unplug
To: Laurent Vivier <lvivier@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000083326605cfd23114"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000083326605cfd23114
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 2, 2021, 18:47 Laurent Vivier <lvivier@redhat.com> wrote:

> On 02/11/2021 18:26, Juan Quintela wrote:
> > "Michael S. Tsirkin" <mst@redhat.com> wrote:
> >> On Tue, Nov 02, 2021 at 06:06:51PM +0100, Laurent Vivier wrote:
> >>> On 02/11/2021 16:04, Michael S. Tsirkin wrote:
> >>>> On Wed, Sep 29, 2021 at 04:43:11PM +0200, Laurent Vivier wrote:
> >>>>> As the guest OS is paused, we will never receive the unplug event
> >>>>> from the kernel and the migration cannot continue.
> >>>>>
> >>>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> >>>>
> >>>> Well ... what if user previously did
> >>>>
> >>>> pause
> >>>> start migration
> >>>> unpause
> >>>>
> >>>> we are breaking it now for no good reason.
> >>>>
> >>>> Further, how about
> >>>>
> >>>> start migration
> >>>> pause
> >>>>
> >>>> are we going to break this too? by failing pause?
> >>>>
> >>>>
> >>>
> >>> TL;DR: This patch only prevents to migrate a VFIO device as failover
> allows
> >>> to start a migration with a VFIO device plugged in.
> >>>
> >>> Long Story:
> >>>
> >>> * before this patch:
> >>>
> >>> - pause and start migration and unpause-> fails if we unpause too late
> >>> because we migrate a VFIO device, works otherwise
> >>
> >>
> >> confused about this one. can you explain pls?
> >
> > Pause the guest.
> > Start migration.
> >
> >       if (migration_in_setup(s) && !should_be_hidden) {
> >          if (failover_unplug_primary(n, dev)) {
> >               vmstate_unregister(VMSTATE_IF(dev), qdev_get_vmsd(dev),
> dev);
> >               qapi_event_send_unplug_primary(dev->id);
> >
> > We send the unplug request, but the guest is paused.
> >
> >               qatomic_set(&n->failover_primary_hidden, true);
> >
> > callbacks, callbacks, callbacks.
> >
> >          while (s->state == MIGRATION_STATUS_WAIT_UNPLUG &&
> >                 qemu_savevm_state_guest_unplug_pending()) {
> >              qemu_sem_timedwait(&s->wait_unplug_sem, 250);
> >          }
> >
> > And we are not able to get out of that loop, because we never get to the
> > point where the guest send the unplug command.
> >
> > So, the only other thing that I can think of is putting one timeout
> > there, but how much?  That is a good question.
> >
>
> Please, no timeout, IMHO timeout is worse than a clean exit on failure.
>


How long should we wait for the guest? If not a timeout....


> Thanks,
> Laurent
>
>

--00000000000083326605cfd23114
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, Nov 2, 2021, 18:47 Laurent Vivier &lt;<a href=
=3D"mailto:lvivier@redhat.com">lvivier@redhat.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">On 02/11/2021 18:26, Juan Quintela wrote:<br>
&gt; &quot;Michael S. Tsirkin&quot; &lt;<a href=3D"mailto:mst@redhat.com" t=
arget=3D"_blank" rel=3D"noreferrer">mst@redhat.com</a>&gt; wrote:<br>
&gt;&gt; On Tue, Nov 02, 2021 at 06:06:51PM +0100, Laurent Vivier wrote:<br=
>
&gt;&gt;&gt; On 02/11/2021 16:04, Michael S. Tsirkin wrote:<br>
&gt;&gt;&gt;&gt; On Wed, Sep 29, 2021 at 04:43:11PM +0200, Laurent Vivier w=
rote:<br>
&gt;&gt;&gt;&gt;&gt; As the guest OS is paused, we will never receive the u=
nplug event<br>
&gt;&gt;&gt;&gt;&gt; from the kernel and the migration cannot continue.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Signed-off-by: Laurent Vivier &lt;<a href=3D"mailto:lv=
ivier@redhat.com" target=3D"_blank" rel=3D"noreferrer">lvivier@redhat.com</=
a>&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Well ... what if user previously did<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; pause<br>
&gt;&gt;&gt;&gt; start migration<br>
&gt;&gt;&gt;&gt; unpause<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; we are breaking it now for no good reason.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Further, how about<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; start migration<br>
&gt;&gt;&gt;&gt; pause<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; are we going to break this too? by failing pause?<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; TL;DR: This patch only prevents to migrate a VFIO device as fa=
ilover allows<br>
&gt;&gt;&gt; to start a migration with a VFIO device plugged in.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Long Story:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; * before this patch:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; - pause and start migration and unpause-&gt; fails if we unpau=
se too late<br>
&gt;&gt;&gt; because we migrate a VFIO device, works otherwise<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; confused about this one. can you explain pls?<br>
&gt; <br>
&gt; Pause the guest.<br>
&gt; Start migration.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if (migration_in_setup(s) &amp;&amp; !should=
_be_hidden) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (failover_unplug_primary(n, dev))=
 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmstate_unregist=
er(VMSTATE_IF(dev), qdev_get_vmsd(dev), dev);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qapi_event_send_=
unplug_primary(dev-&gt;id);<br>
&gt; <br>
&gt; We send the unplug request, but the guest is paused.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qatomic_set(&amp=
;n-&gt;failover_primary_hidden, true);<br>
&gt; <br>
&gt; callbacks, callbacks, callbacks.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (s-&gt;state =3D=3D MIGRATION_=
STATUS_WAIT_UNPLUG &amp;&amp;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_save=
vm_state_guest_unplug_pending()) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_sem_timedwait(&am=
p;s-&gt;wait_unplug_sem, 250);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; <br>
&gt; And we are not able to get out of that loop, because we never get to t=
he<br>
&gt; point where the guest send the unplug command.<br>
&gt; <br>
&gt; So, the only other thing that I can think of is putting one timeout<br=
>
&gt; there, but how much?=C2=A0 That is a good question.<br>
&gt; <br>
<br>
Please, no timeout, IMHO timeout is worse than a clean exit on failure.<br>=
</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">How long should we wait for the guest? If not a tim=
eout....</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<br>
Thanks,<br>
Laurent<br>
<br>
</blockquote></div></div></div>

--00000000000083326605cfd23114--


