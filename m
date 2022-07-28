Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C523583ABF
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 10:54:32 +0200 (CEST)
Received: from localhost ([::1]:58034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGzHr-0003TX-6E
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 04:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leiyang@redhat.com>)
 id 1oGyua-00019b-Iw
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 04:30:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26746)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leiyang@redhat.com>)
 id 1oGyuS-00076J-9J
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 04:30:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658997019;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gA7j0Ef1jmGtj9ic0gjL36dDHz0ixEX2L7aa2GwAxzs=;
 b=Gk1f0QmBCHRwoPemqJARIPbqsYuIgEieTN0n4/qDdx/2L1TqfvvbuwjsUk00OrzRaEr2aG
 /3l1qFh5MhTykdL1Tsdt9t19L1unQQO6569aSwfZxBSL8Wo2UA/kPY7cwJMa5arjRIGUdS
 5kV7AUQSFD2fX1VheZX+4SD7VJeCR4Q=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-i0QN7NqjPte5m2tm_JLp5w-1; Thu, 28 Jul 2022 04:30:17 -0400
X-MC-Unique: i0QN7NqjPte5m2tm_JLp5w-1
Received: by mail-ej1-f70.google.com with SMTP id
 hv22-20020a17090760d600b0072f2cce7d10so401229ejc.19
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 01:30:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gA7j0Ef1jmGtj9ic0gjL36dDHz0ixEX2L7aa2GwAxzs=;
 b=Y4Cf7/QPYX+PMWurSWCJ/7uFQvpCtmw6vvCE66JXeZj1WJKcSoBltEMRjg/fc4gNIy
 dYvbrDagvrB4dalI3Q99GoKmhpBS5p1BUoa9q1T14cH5C56k3IGS49+EfziaRJ5bzzoz
 QPDSzbS+ZH6mvvT3ldGVF/7OtCGP+unhWsXhKm5ve7zVnuInJSzy6ZmMMzn/NZX0OuNf
 fYt7/xlHZYdkr8wwRDrkM5fCdfdgIfymiTaLC+jC2rF8t9bRo5Ia+HxmfJozGd0LY1XW
 xPzCftPZrSvu4wOdY9q9/5kFKgqMvA7i0HhpslRNBdxZh2sP3LQKOzl7FxP//46mwUqc
 qwsA==
X-Gm-Message-State: AJIora/KDpxIJBZgMdYPOKYASV7zuyS9WUqGDvp8Rj3aOk7FFhakBGDT
 2U3ADtAhN3wE6lTwRC2MU8+bJYK+5xWmYIJoAhXWjk+XUye3McP8if3LnE431iq6Ww/hn9zfz/U
 HnauIx/sidnvSTvDsWap7g4G2nfumfV4=
X-Received: by 2002:a05:6402:1e8a:b0:43c:570d:760f with SMTP id
 f10-20020a0564021e8a00b0043c570d760fmr11533671edf.109.1658997016079; 
 Thu, 28 Jul 2022 01:30:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t3wwHfpyczos6iHBBf/Rsgmn7Iun5Y5AyA8uC5HHa6KcadcGW+15RsesjLAehGVmwfr7gUVpewRvPM4EB6Zd0=
X-Received: by 2002:a05:6402:1e8a:b0:43c:570d:760f with SMTP id
 f10-20020a0564021e8a00b0043c570d760fmr11533649edf.109.1658997015713; Thu, 28
 Jul 2022 01:30:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220726085055.17239-1-jasowang@redhat.com>
 <20220726085055.17239-4-jasowang@redhat.com>
 <CAPpAL=xujv=gkkQXn=bsiVRXvOLKPWDwASTxfJZKNbBty+dTNQ@mail.gmail.com>
 <CACGkMEtBUK1e=hqm9VhxweuQKV+U+MAHhqeuQFqmr4hUpB98Lw@mail.gmail.com>
In-Reply-To: <CACGkMEtBUK1e=hqm9VhxweuQKV+U+MAHhqeuQFqmr4hUpB98Lw@mail.gmail.com>
From: Lei Yang <leiyang@redhat.com>
Date: Thu, 28 Jul 2022 16:29:39 +0800
Message-ID: <CAPpAL=wwPG9x+FMQmmL__X=22eOQ1u5yTRUc8v7Xn1hMxo3FEA@mail.gmail.com>
Subject: Re: [PULL 3/3] vdpa: Fix memory listener deletions of iova tree
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000ce2b8d05e4d957fd"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leiyang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000ce2b8d05e4d957fd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jason Wang <jasowang@redhat.com> =E4=BA=8E2022=E5=B9=B47=E6=9C=8828=E6=97=
=A5=E5=91=A8=E5=9B=9B 14:27=E5=86=99=E9=81=93=EF=BC=9A

> On Thu, Jul 28, 2022 at 2:14 PM Lei Yang <leiyang@redhat.com> wrote:
> >
> > I tried to manually changed this line then test this branch on local
> host. After the migration is successful, the qemu core dump occurs on the
> shutdown inside guest.
> >
> > Compiled qemu Steps:
> > # git clone https://gitlab.com/eperezmartin/qemu-kvm.git
> > # cd qemu-kvm/
> > # mkdir build
> > # cd build/
> > # git checkout bd85496c2a8c1ebf34f908fca2be2ab9852fd0e9
>
> I got this
>
> fatal: reference is not a tree: bd85496c2a8c1ebf34f908fca2be2ab9852fd0e9
>
> and my HEAD is:
>
> commit 7b17a1a841fc2336eba53afade9cadb14bd3dd9a (HEAD -> master, tag:
> v7.1.0-rc0, origin/master, origin/HEAD)
> Author: Richard Henderson <richard.henderson@linaro.org>
> Date:   Tue Jul 26 18:03:16 2022 -0700
>
>     Update version for v7.1.0-rc0 release
>
>     Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>

I tried to recompile it use you mentioned commit, but the problem is
reproduced again:
# git clone git://git.qemu.org/qemu.git
# cd qemu/
# git log
# mkdir build
# cd build/
# vim /root/qemu/hw/virtio/vhost-vdpa.c
# ../configure --target-list=3Dx86_64-softmmu --enable-debug
# make

Latest commit:
commit 7b17a1a841fc2336eba53afade9cadb14bd3dd9a (HEAD -> master, tag:
v7.1.0-rc0, origin/master, origin/HEAD)
Author: Richard Henderson <richard.henderson@linaro.org>
Date:   Tue Jul 26 18:03:16 2022 -0700

    Update version for v7.1.0-rc0 release

    Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

>
> > # vim /root/qemu-kvm/hw/virtio/vhost-vdpa.c
> > =EF=BC=88Chanege "vhost_iova_tree_remove(v->iova_tree, &mem_region);" t=
o
> "vhost_iova_tree_remove(v->iova_tree, result);"=EF=BC=89
>
> Any reason you need to manually change the line since it has been merged?
>
> > # ../configure --target-list=3Dx86_64-softmmu --enable-debug
> > # make
>
> So if I understand you correctly, you meant the issue is not fixed?
>

From my side, this is a new issue. Because the guest can boot up normally
and complete the migration. It is just that after the migration is
successful, after shutdown in the guest, a core dump occurs

Thanks

>
> Thanks
>
> >
> > Core dump messages:
> > # gdb /root/qemu-kvm/build/x86_64-softmmu/qemu-system-x86_64
> core.qemu-system-x86.7419
> > (gdb) bt full
> > #0  0x000056107c19afa9 in vhost_vdpa_listener_region_del
> (listener=3D0x7ff9a9c691a0, section=3D0x7ffd3889ad20)
> >     at ../hw/virtio/vhost-vdpa.c:290
> >         result =3D 0x0
> >         vaddr =3D 0x7ff29be00000
> >         mem_region =3D {iova =3D 0, translated_addr =3D 140679973961728=
, size
> =3D 30064771071, perm =3D IOMMU_NONE}
> >         v =3D 0x7ff9a9c69190
> >         iova =3D 4294967296
> >         llend =3D 34359738368
> >         llsize =3D 30064771072
> >         ret =3D 32765
> >         __func__ =3D "vhost_vdpa_listener_region_del"
> > #1  0x000056107c1ca915 in listener_del_address_space
> (listener=3D0x7ff9a9c691a0, as=3D0x56107cccbc00 <address_space_memory>)
> >     at ../softmmu/memory.c:2939
> >         section =3D
> >           {size =3D 30064771072, mr =3D 0x56107e116270, fv =3D 0x7ff1e0=
2a4090,
> offset_within_region =3D 2147483648, offset_within_address_space =3D
> 4294967296, readonly =3D false, nonvolatile =3D false}
> >         view =3D 0x7ff1e02a4090
> >         fr =3D 0x7ff1e04027f0
> > #2  0x000056107c1cac39 in memory_listener_unregister
> (listener=3D0x7ff9a9c691a0) at ../softmmu/memory.c:2989
> > #3  0x000056107c19d007 in vhost_vdpa_dev_start (dev=3D0x56107e126ea0,
> started=3Dfalse) at ../hw/virtio/vhost-vdpa.c:1134
> >         v =3D 0x7ff9a9c69190
> >         ok =3D true
> > #4  0x000056107c190252 in vhost_dev_stop (hdev=3D0x56107e126ea0,
> vdev=3D0x56107f40cb50) at ../hw/virtio/vhost.c:1828
> >         i =3D 32761
> >         __PRETTY_FUNCTION__ =3D "vhost_dev_stop"
> > #5  0x000056107bebe26c in vhost_net_stop_one (net=3D0x56107e126ea0,
> dev=3D0x56107f40cb50) at ../hw/net/vhost_net.c:315
> >         file =3D {index =3D 0, fd =3D -1}
> >         __PRETTY_FUNCTION__ =3D "vhost_net_stop_one"
> > #6  0x000056107bebe6bf in vhost_net_stop (dev=3D0x56107f40cb50,
> ncs=3D0x56107f421850, data_queue_pairs=3D1, cvq=3D0)
> >     at ../hw/net/vhost_net.c:425
> >         qbus =3D 0x56107f40cac8
> >         vbus =3D 0x56107f40cac8
> >         k =3D 0x56107df1a220
> >         n =3D 0x56107f40cb50
> >         peer =3D 0x7ff9a9c69010
> >         total_notifiers =3D 2
> >         nvhosts =3D 1
> >         i =3D 0
> > --Type <RET> for more, q to quit, c to continue without paging--
> >         r =3D 32765
> >         __PRETTY_FUNCTION__ =3D "vhost_net_stop"
> > #7  0x000056107c14af24 in virtio_net_vhost_status (n=3D0x56107f40cb50,
> status=3D15 '\017') at ../hw/net/virtio-net.c:298
> >         vdev =3D 0x56107f40cb50
> >         nc =3D 0x56107f421850
> >         queue_pairs =3D 1
> >         cvq =3D 0
> > #8  0x000056107c14b17e in virtio_net_set_status (vdev=3D0x56107f40cb50,
> status=3D15 '\017') at ../hw/net/virtio-net.c:372
> >         n =3D 0x56107f40cb50
> >         q =3D 0x56107f40cb50
> >         i =3D 32765
> >         queue_status =3D 137 '\211'
> > #9  0x000056107c185af2 in virtio_set_status (vdev=3D0x56107f40cb50, val=
=3D15
> '\017') at ../hw/virtio/virtio.c:1947
> >         k =3D 0x56107dfe2c60
> > #10 0x000056107c188cbb in virtio_vmstate_change (opaque=3D0x56107f40cb5=
0,
> running=3Dfalse, state=3DRUN_STATE_SHUTDOWN)
> >     at ../hw/virtio/virtio.c:3195
> >         vdev =3D 0x56107f40cb50
> >         qbus =3D 0x56107f40cac8
> >         k =3D 0x56107df1a220
> >         backend_run =3D false
> > #11 0x000056107bfdca5e in vm_state_notify (running=3Dfalse,
> state=3DRUN_STATE_SHUTDOWN) at ../softmmu/runstate.c:334
> >         e =3D 0x56107f419950
> >         next =3D 0x56107f224b80
> > #12 0x000056107bfd43e6 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN,
> send_stop=3Dfalse) at ../softmmu/cpus.c:263
> >         ret =3D 0
> > #13 0x000056107bfd4420 in vm_shutdown () at ../softmmu/cpus.c:281
> > #14 0x000056107bfdd584 in qemu_cleanup () at ../softmmu/runstate.c:813
> > #15 0x000056107bd81a5b in main (argc=3D65, argv=3D0x7ffd3889b178,
> envp=3D0x7ffd3889b388) at ../softmmu/main.c:51
> >
> >
> > Thanks
> > Lei
> >
> > Jason Wang <jasowang@redhat.com> =E4=BA=8E2022=E5=B9=B47=E6=9C=8826=E6=
=97=A5=E5=91=A8=E4=BA=8C 16:51=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> From: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>
> >> vhost_vdpa_listener_region_del is always deleting the first iova entry
> >> of the tree, since it's using the needle iova instead of the result's
> >> one.
> >>
> >> This was detected using a vga virtual device in the VM using vdpa SVQ.
> >> It makes some extra memory adding and deleting, so the wrong one was
> >> mapped / unmapped. This was undetected before since all the memory was
> >> mappend and unmapped totally without that device, but other conditions
> >> could trigger it too:
> >>
> >> * mem_region was with .iova =3D 0, .translated_addr =3D (correct GPA).
> >> * iova_tree_find_iova returned right result, but does not update
> >>   mem_region.
> >> * iova_tree_remove always removed region with .iova =3D 0. Right iova =
were
> >>   sent to the device.
> >> * Next map will fill the first region with .iova =3D 0, causing a mapp=
ing
> >>   with the same iova and device complains, if the next action is a map=
.
> >> * Next unmap will cause to try to unmap again iova =3D 0, causing the
> >>   device to complain that no region was mapped at iova =3D 0.
> >>
> >> Fixes: 34e3c94edaef ("vdpa: Add custom IOTLB translations to SVQ")
> >> Reported-by: Lei Yang <leiyang@redhat.com>
> >> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >> Signed-off-by: Jason Wang <jasowang@redhat.com>
> >> ---
> >>  hw/virtio/vhost-vdpa.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >> index bce64f4..3ff9ce3 100644
> >> --- a/hw/virtio/vhost-vdpa.c
> >> +++ b/hw/virtio/vhost-vdpa.c
> >> @@ -290,7 +290,7 @@ static void
> vhost_vdpa_listener_region_del(MemoryListener *listener,
> >>
> >>          result =3D vhost_iova_tree_find_iova(v->iova_tree, &mem_regio=
n);
> >>          iova =3D result->iova;
> >> -        vhost_iova_tree_remove(v->iova_tree, &mem_region);
> >> +        vhost_iova_tree_remove(v->iova_tree, result);
> >>      }
> >>      vhost_vdpa_iotlb_batch_begin_once(v);
> >>      ret =3D vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
> >> --
> >> 2.7.4
> >>
>
>

--000000000000ce2b8d05e4d957fd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Jason Wang &lt;<a href=3D"mailto:jaso=
wang@redhat.com">jasowang@redhat.com</a>&gt; =E4=BA=8E2022=E5=B9=B47=E6=9C=
=8828=E6=97=A5=E5=91=A8=E5=9B=9B 14:27=E5=86=99=E9=81=93=EF=BC=9A<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, Jul 28, 2022 at 2=
:14 PM Lei Yang &lt;<a href=3D"mailto:leiyang@redhat.com" target=3D"_blank"=
>leiyang@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; I tried to manually changed this line then test this branch on local h=
ost. After the migration is successful, the qemu core dump occurs on the sh=
utdown inside guest.<br>
&gt;<br>
&gt; Compiled qemu Steps:<br>
&gt; # git clone <a href=3D"https://gitlab.com/eperezmartin/qemu-kvm.git" r=
el=3D"noreferrer" target=3D"_blank">https://gitlab.com/eperezmartin/qemu-kv=
m.git</a><br>
&gt; # cd qemu-kvm/<br>
&gt; # mkdir build<br>
&gt; # cd build/<br>
&gt; # git checkout bd85496c2a8c1ebf34f908fca2be2ab9852fd0e9<br>
<br>
I got this<br>
<br>
fatal: reference is not a tree: bd85496c2a8c1ebf34f908fca2be2ab9852fd0e9<br=
>
<br>
and my HEAD is:<br>
<br>
commit 7b17a1a841fc2336eba53afade9cadb14bd3dd9a (HEAD -&gt; master, tag:<br=
>
v7.1.0-rc0, origin/master, origin/HEAD)<br>
Author: Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.or=
g" target=3D"_blank">richard.henderson@linaro.org</a>&gt;<br>
Date:=C2=A0 =C2=A0Tue Jul 26 18:03:16 2022 -0700<br>
<br>
=C2=A0 =C2=A0 Update version for v7.1.0-rc0 release<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richar=
d.henderson@linaro.org" target=3D"_blank">richard.henderson@linaro.org</a>&=
gt;<br></blockquote><div><br></div><div>I tried to recompile it use you men=
tioned commit, but the problem is reproduced again:<br></div><div># git clo=
ne git://<a href=3D"http://git.qemu.org/qemu.git">git.qemu.org/qemu.git</a>=
<br># cd qemu/<br># git log <br># mkdir build<br># cd build/<br># vim /root=
/qemu/hw/virtio/vhost-vdpa.c <br># ../configure --target-list=3Dx86_64-soft=
mmu --enable-debug<br># make<br></div><div><br></div><div>Latest commit:</d=
iv><div>commit 7b17a1a841fc2336eba53afade9cadb14bd3dd9a (HEAD -&gt; master,=
 tag: v7.1.0-rc0, origin/master, origin/HEAD)<br>Author: Richard Henderson =
&lt;<a href=3D"mailto:richard.henderson@linaro.org">richard.henderson@linar=
o.org</a>&gt;<br>Date: =C2=A0 Tue Jul 26 18:03:16 2022 -0700<br><br>=C2=A0 =
=C2=A0 Update version for v7.1.0-rc0 release<br>=C2=A0 =C2=A0 <br>=C2=A0 =
=C2=A0 Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:richard.hende=
rson@linaro.org">richard.henderson@linaro.org</a>&gt;<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">
<br>
&gt; # vim /root/qemu-kvm/hw/virtio/vhost-vdpa.c<br>
&gt; =EF=BC=88Chanege &quot;vhost_iova_tree_remove(v-&gt;iova_tree, &amp;me=
m_region);&quot; to &quot;vhost_iova_tree_remove(v-&gt;iova_tree, result);&=
quot;=EF=BC=89<br>
<br>
Any reason you need to manually change the line since it has been merged?<b=
r>
<br>
&gt; # ../configure --target-list=3Dx86_64-softmmu --enable-debug<br>
&gt; # make<br>
<br>
So if I understand you correctly, you meant the issue is not fixed?<br></bl=
ockquote><div>=C2=A0</div><div>From my side, this is a new issue.=C2=A0Beca=
use the guest can boot up normally and complete the migration. It is just t=
hat after the migration is successful, after shutdown in the guest, a core =
dump occurs</div><div><br></div><div>Thanks</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
<br>
Thanks<br>
<br>
&gt;<br>
&gt; Core dump messages:<br>
&gt; # gdb /root/qemu-kvm/build/x86_64-softmmu/qemu-system-x86_64 core.qemu=
-system-x86.7419<br>
&gt; (gdb) bt full<br>
&gt; #0=C2=A0 0x000056107c19afa9 in vhost_vdpa_listener_region_del (listene=
r=3D0x7ff9a9c691a0, section=3D0x7ffd3889ad20)<br>
&gt;=C2=A0 =C2=A0 =C2=A0at ../hw/virtio/vhost-vdpa.c:290<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0result =3D 0x0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vaddr =3D 0x7ff29be00000<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mem_region =3D {iova =3D 0, translate=
d_addr =3D 140679973961728, size =3D 30064771071, perm =3D IOMMU_NONE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v =3D 0x7ff9a9c69190<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iova =3D 4294967296<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0llend =3D 34359738368<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0llsize =3D 30064771072<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 32765<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__func__ =3D &quot;vhost_vdpa_listene=
r_region_del&quot;<br>
&gt; #1=C2=A0 0x000056107c1ca915 in listener_del_address_space (listener=3D=
0x7ff9a9c691a0, as=3D0x56107cccbc00 &lt;address_space_memory&gt;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0at ../softmmu/memory.c:2939<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0section =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{size =3D 30064771072, mr =3D =
0x56107e116270, fv =3D 0x7ff1e02a4090, offset_within_region =3D 2147483648,=
 offset_within_address_space =3D 4294967296, readonly =3D false, nonvolatil=
e =3D false}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0view =3D 0x7ff1e02a4090<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fr =3D 0x7ff1e04027f0<br>
&gt; #2=C2=A0 0x000056107c1cac39 in memory_listener_unregister (listener=3D=
0x7ff9a9c691a0) at ../softmmu/memory.c:2989<br>
&gt; #3=C2=A0 0x000056107c19d007 in vhost_vdpa_dev_start (dev=3D0x56107e126=
ea0, started=3Dfalse) at ../hw/virtio/vhost-vdpa.c:1134<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0v =3D 0x7ff9a9c69190<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ok =3D true<br>
&gt; #4=C2=A0 0x000056107c190252 in vhost_dev_stop (hdev=3D0x56107e126ea0, =
vdev=3D0x56107f40cb50) at ../hw/virtio/vhost.c:1828<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D 32761<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__PRETTY_FUNCTION__ =3D &quot;vhost_d=
ev_stop&quot;<br>
&gt; #5=C2=A0 0x000056107bebe26c in vhost_net_stop_one (net=3D0x56107e126ea=
0, dev=3D0x56107f40cb50) at ../hw/net/vhost_net.c:315<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file =3D {index =3D 0, fd =3D -1}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__PRETTY_FUNCTION__ =3D &quot;vhost_n=
et_stop_one&quot;<br>
&gt; #6=C2=A0 0x000056107bebe6bf in vhost_net_stop (dev=3D0x56107f40cb50, n=
cs=3D0x56107f421850, data_queue_pairs=3D1, cvq=3D0)<br>
&gt;=C2=A0 =C2=A0 =C2=A0at ../hw/net/vhost_net.c:425<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qbus =3D 0x56107f40cac8<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vbus =3D 0x56107f40cac8<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0k =3D 0x56107df1a220<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D 0x56107f40cb50<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0peer =3D 0x7ff9a9c69010<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0total_notifiers =3D 2<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvhosts =3D 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D 0<br>
&gt; --Type &lt;RET&gt; for more, q to quit, c to continue without paging--=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0r =3D 32765<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__PRETTY_FUNCTION__ =3D &quot;vhost_n=
et_stop&quot;<br>
&gt; #7=C2=A0 0x000056107c14af24 in virtio_net_vhost_status (n=3D0x56107f40=
cb50, status=3D15 &#39;\017&#39;) at ../hw/net/virtio-net.c:298<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vdev =3D 0x56107f40cb50<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nc =3D 0x56107f421850<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0queue_pairs =3D 1<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cvq =3D 0<br>
&gt; #8=C2=A0 0x000056107c14b17e in virtio_net_set_status (vdev=3D0x56107f4=
0cb50, status=3D15 &#39;\017&#39;) at ../hw/net/virtio-net.c:372<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0n =3D 0x56107f40cb50<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0q =3D 0x56107f40cb50<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D 32765<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0queue_status =3D 137 &#39;\211&#39;<b=
r>
&gt; #9=C2=A0 0x000056107c185af2 in virtio_set_status (vdev=3D0x56107f40cb5=
0, val=3D15 &#39;\017&#39;) at ../hw/virtio/virtio.c:1947<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0k =3D 0x56107dfe2c60<br>
&gt; #10 0x000056107c188cbb in virtio_vmstate_change (opaque=3D0x56107f40cb=
50, running=3Dfalse, state=3DRUN_STATE_SHUTDOWN)<br>
&gt;=C2=A0 =C2=A0 =C2=A0at ../hw/virtio/virtio.c:3195<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vdev =3D 0x56107f40cb50<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qbus =3D 0x56107f40cac8<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0k =3D 0x56107df1a220<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0backend_run =3D false<br>
&gt; #11 0x000056107bfdca5e in vm_state_notify (running=3Dfalse, state=3DRU=
N_STATE_SHUTDOWN) at ../softmmu/runstate.c:334<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0e =3D 0x56107f419950<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0next =3D 0x56107f224b80<br>
&gt; #12 0x000056107bfd43e6 in do_vm_stop (state=3DRUN_STATE_SHUTDOWN, send=
_stop=3Dfalse) at ../softmmu/cpus.c:263<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D 0<br>
&gt; #13 0x000056107bfd4420 in vm_shutdown () at ../softmmu/cpus.c:281<br>
&gt; #14 0x000056107bfdd584 in qemu_cleanup () at ../softmmu/runstate.c:813=
<br>
&gt; #15 0x000056107bd81a5b in main (argc=3D65, argv=3D0x7ffd3889b178, envp=
=3D0x7ffd3889b388) at ../softmmu/main.c:51<br>
&gt;<br>
&gt;<br>
&gt; Thanks<br>
&gt; Lei<br>
&gt;<br>
&gt; Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.com" target=3D"_blank=
">jasowang@redhat.com</a>&gt; =E4=BA=8E2022=E5=B9=B47=E6=9C=8826=E6=97=A5=
=E5=91=A8=E4=BA=8C 16:51=E5=86=99=E9=81=93=EF=BC=9A<br>
&gt;&gt;<br>
&gt;&gt; From: Eugenio P=C3=A9rez &lt;<a href=3D"mailto:eperezma@redhat.com=
" target=3D"_blank">eperezma@redhat.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; vhost_vdpa_listener_region_del is always deleting the first iova e=
ntry<br>
&gt;&gt; of the tree, since it&#39;s using the needle iova instead of the r=
esult&#39;s<br>
&gt;&gt; one.<br>
&gt;&gt;<br>
&gt;&gt; This was detected using a vga virtual device in the VM using vdpa =
SVQ.<br>
&gt;&gt; It makes some extra memory adding and deleting, so the wrong one w=
as<br>
&gt;&gt; mapped / unmapped. This was undetected before since all the memory=
 was<br>
&gt;&gt; mappend and unmapped totally without that device, but other condit=
ions<br>
&gt;&gt; could trigger it too:<br>
&gt;&gt;<br>
&gt;&gt; * mem_region was with .iova =3D 0, .translated_addr =3D (correct G=
PA).<br>
&gt;&gt; * iova_tree_find_iova returned right result, but does not update<b=
r>
&gt;&gt;=C2=A0 =C2=A0mem_region.<br>
&gt;&gt; * iova_tree_remove always removed region with .iova =3D 0. Right i=
ova were<br>
&gt;&gt;=C2=A0 =C2=A0sent to the device.<br>
&gt;&gt; * Next map will fill the first region with .iova =3D 0, causing a =
mapping<br>
&gt;&gt;=C2=A0 =C2=A0with the same iova and device complains, if the next a=
ction is a map.<br>
&gt;&gt; * Next unmap will cause to try to unmap again iova =3D 0, causing =
the<br>
&gt;&gt;=C2=A0 =C2=A0device to complain that no region was mapped at iova =
=3D 0.<br>
&gt;&gt;<br>
&gt;&gt; Fixes: 34e3c94edaef (&quot;vdpa: Add custom IOTLB translations to =
SVQ&quot;)<br>
&gt;&gt; Reported-by: Lei Yang &lt;<a href=3D"mailto:leiyang@redhat.com" ta=
rget=3D"_blank">leiyang@redhat.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Eugenio P=C3=A9rez &lt;<a href=3D"mailto:eperezma@r=
edhat.com" target=3D"_blank">eperezma@redhat.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Jason Wang &lt;<a href=3D"mailto:jasowang@redhat.co=
m" target=3D"_blank">jasowang@redhat.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 hw/virtio/vhost-vdpa.c | 2 +-<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c<br>
&gt;&gt; index bce64f4..3ff9ce3 100644<br>
&gt;&gt; --- a/hw/virtio/vhost-vdpa.c<br>
&gt;&gt; +++ b/hw/virtio/vhost-vdpa.c<br>
&gt;&gt; @@ -290,7 +290,7 @@ static void vhost_vdpa_listener_region_del(Mem=
oryListener *listener,<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 result =3D vhost_iova_tree_find_=
iova(v-&gt;iova_tree, &amp;mem_region);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iova =3D result-&gt;iova;<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 vhost_iova_tree_remove(v-&gt;iova_tre=
e, &amp;mem_region);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 vhost_iova_tree_remove(v-&gt;iova_tre=
e, result);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 vhost_vdpa_iotlb_batch_begin_once(v);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D vhost_vdpa_dma_unmap(v, iova, int128_g=
et64(llsize));<br>
&gt;&gt; --<br>
&gt;&gt; 2.7.4<br>
&gt;&gt;<br>
<br>
</blockquote></div></div>

--000000000000ce2b8d05e4d957fd--


