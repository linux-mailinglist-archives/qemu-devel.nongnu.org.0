Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E89324A98
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 07:37:52 +0100 (CET)
Received: from localhost ([::1]:57970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFAHX-0002nS-Ch
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 01:37:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <keiichiw@chromium.org>)
 id 1lFAGC-0001v5-11
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 01:36:28 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:43599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <keiichiw@chromium.org>)
 id 1lFAG5-0004HV-Mh
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 01:36:27 -0500
Received: by mail-lf1-x136.google.com with SMTP id d3so6872541lfg.10
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 22:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ueQVAMXIQs4LxzFA+2iwIlefPUTNO7piqCZeNmBQbHY=;
 b=m3U9d428Q8n3BOt0VMU/13HketPuGUzIOGnkab7GfjfWrdq7AZZJWYGfgnlltlzHHE
 WCASkir2Q4nUvcDQ5Hs+njfwMRST5CxjNJRU97LriR5BUBPvrImMKGc7trc8/mwQhutu
 /MmdxA+Fv1Hq9aIzi+A9FJc3fMljF/bQdZmT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ueQVAMXIQs4LxzFA+2iwIlefPUTNO7piqCZeNmBQbHY=;
 b=T4OcYi0VQROzGSV56HyTTT1NzevxVgRoOeDzmXa5WqCuWQWPKTGtanvcFWqN/EhVGg
 pyWp4p14KYnInAcRLXc1kBZ8E01thDaTmr+L5g8Pa36ECo3jAFlgyaOZqc1oQkzRNgbB
 fWJRFD1cgL5fxVEA4rZUyLCifD1Cz251dmsOnfoLtyCJTGdsVg+EfcNRrRHe5rCxaDh/
 EXz1MHgj0HO5z3cBdD6pTEG6ZMbwSha165cabA0l74vOpE9AvWiGtF2rBomT9LkOgLJK
 HzaX2+elQ14Y9BHgxg+H3XEo1KdWaM48FXoov9p0hfoU8czPyTNrFwKv5O2mrnzqhOUz
 A9oQ==
X-Gm-Message-State: AOAM53127W2VswTqXU2pxhOerBN0VuxYiZNe2lgfLiv3HWdQbDbExAMl
 XIGGUNZoN1iDPr6vTxiN5ggwHmuCWdpx6NLocWs49Q==
X-Google-Smtp-Source: ABdhPJwYS7Ba7FMQGqjhQmjQPwdgUgc0BdojW/Tr0+QX9Wp5wVRq0f0j85opZecy7yOfmrExvUrTHdDTp5w1u5VEl/w=
X-Received: by 2002:a05:6512:6d6:: with SMTP id
 u22mr1155858lff.454.1614234978535; 
 Wed, 24 Feb 2021 22:36:18 -0800 (PST)
MIME-Version: 1.0
References: <8735xskm7j.fsf@linaro.org>
 <20210223064312-mutt-send-email-mst@kernel.org>
 <CAEUnVG5twgJ+=_fzrPQCoc1PtJhFpD0tDpKD4WsTHG0jBmcD2A@mail.gmail.com>
In-Reply-To: <CAEUnVG5twgJ+=_fzrPQCoc1PtJhFpD0tDpKD4WsTHG0jBmcD2A@mail.gmail.com>
From: Keiichi Watanabe <keiichiw@chromium.org>
Date: Thu, 25 Feb 2021 15:36:07 +0900
Message-ID: <CAD90VcbisE1eW1OYejC+DvSFcUb37yo_jXXhgE2xdF-Hy+8o9Q@mail.gmail.com>
Subject: Re: [Rust-VMM] vhost reply_ack negotiation (a.k.a differences in
 vhost-user behaviour with libvhost-user and vhost-user-backend.rs)
To: Dylan Reid <dgreid@chromium.org>, woodychow@chromium.org
Content-Type: multipart/alternative; boundary="0000000000007ae05605bc235e54"
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=keiichiw@chromium.org; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Sergio Lopez <slp@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Chirantan Ekbote <chirantan@chromium.org>, qemu-devel <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "rust-vmm@lists.opendev.org" <rust-vmm@lists.opendev.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 raphael.norwitz@nutanix.com,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007ae05605bc235e54
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2021 at 1:20 PM Dylan Reid <dgreid@chromium.org> wrote:

> On Tue, Feb 23, 2021 at 8:20 AM Michael S. Tsirkin <mst@redhat.com> wrote=
:
> >
> > Cc: Raphael
> >
> > On Fri, Feb 19, 2021 at 04:04:34PM +0000, Alex Benn=C3=A9e wrote:
> > > Hi,
> > >
> > > I finally got a chance to get down into the guts of vhost-user while
> > > attempting to port my original C RPMB daemon to Rust using the
> > > vhost-user-backend and related crates. I ended up with this hang duri=
ng
> > > negotiation:
> > >
> > >   startup
> > >
> > >   vhost_user_write req:1 flags:0x1
> > >   vhost_user_read_start
> > >   vhost_user_read req:1 flags:0x5
> > >   vhost_user_backend_init: we got 170000000
> > >   vhost_user_write req:15 flags:0x1
> > >   vhost_user_read_start
> > >   vhost_user_read req:15 flags:0x5
> > >   vhost_user_set_protocol_features: 2008
> > >   vhost_user_write req:16 flags:0x1
> > >   vhost_user_write req:3 flags:0x1
> > >   vhost_user_write req:1 flags:0x1
> > >   vhost_user_read_start
> > >   vhost_user_read req:1 flags:0x5
> > >   vhost_user_write req:13 flags:0x1
> > >
> > >   kernel initialises device
> > >
> > >   virtio_rpmb virtio1: init done!
> > >   vhost_user_write req:13 flags:0x1
> > >   vhost_dev_set_features: 130000000
> > >   vhost_user_set_features: 130000000
> > >   vhost_user_write req:2 flags:0x1
> > >   vhost_user_write req:5 flags:0x9
> > >   vhost_user_read_start
> > >
> > > The proximate cause is the vhost crate handling:
> > >
> > >   MasterReq::SET_MEM_TABLE =3D> {
> > >       let res =3D self.set_mem_table(&hdr, size, &buf, rfds);
> > >       self.send_ack_message(&hdr, res)?;
> > >   }
> > >
> > > which gates on the replay_ack_enabled flag:
> > >
> > >     fn send_ack_message(
> > >         &mut self,
> > >         req: &VhostUserMsgHeader<MasterReq>,
> > >         res: Result<()>,
> > >     ) -> Result<()> {
> > >         if dbg!(self.reply_ack_enabled) {
> > >             let hdr =3D self.new_reply_header::<VhostUserU64>(req, 0)=
?;
> > >             let val =3D match res {
> > >                 Ok(_) =3D> 0,
> > >                 Err(_) =3D> 1,
> > >             };
> > >             let msg =3D VhostUserU64::new(val);
> > >             self.main_sock.send_message(&hdr, &msg, None)?;
> > >         }
> > >         Ok(())
> > >     }
> > >
> > > which is only set when we have all the appropriate acknowledged flags=
:
> > >
> > >     fn update_reply_ack_flag(&mut self) {
> > >         let vflag =3D VhostUserVirtioFeatures::PROTOCOL_FEATURES.bits=
();
> > >         let pflag =3D VhostUserProtocolFeatures::REPLY_ACK;
> > >         if (self.virtio_features & vflag) !=3D 0
> > >             && (self.acked_virtio_features & vflag) !=3D 0
> > >             && self.protocol_features.contains(pflag)
> > >             && (self.acked_protocol_features & pflag.bits()) !=3D 0
> > >         {
> > >             self.reply_ack_enabled =3D true;
> > >         } else {
> > >             self.reply_ack_enabled =3D false;
> > >         }
> > >     }
> > >
> > > which from above you can see QEMU helpfully dropped those bits in the
> > > reply. It does however work in the C/libvhost version:
> > >
> > >   virtio_rpmb virtio1: init done!
> > >   vhost_user_write req:13 flags:0x1
> > >   vhost_dev_set_features: 130000000
> > >   vhost_user_set_features: 130000000
> > >   vhost_user_write req:2 flags:0x1
> > >   vhost_user_write req:37 flags:0x9
> > >   vhost_user_read_start
> > >   vhost_user_read req:37 flags:0x5
> > >   vhost_user_write req:8 flags:0x1
> > >   vhost_user_write req:10 flags:0x1
> > >   vhost_user_write req:9 flags:0x1
> > >   vhost_user_write req:12 flags:0x1
> > >   vhost_user_write req:13 flags:0x1
> > >
> > > albeit with a slightly different message sequence
> > > (VHOST_USER_ADD_MEM_REG instead of VHOST_USER_SET_MEM_TABLE). Reading
> > > the C code you can see why:
> > >
> > >     need_reply =3D vmsg.flags & VHOST_USER_NEED_REPLY_MASK;
> > >
> > >     reply_requested =3D vu_process_message(dev, &vmsg);
> > >     if (!reply_requested && need_reply) {
> > >         vmsg_set_reply_u64(&vmsg, 0);
> > >         reply_requested =3D 1;
> > >     }
> > >
> > > So regardless of what may have been negotiated it will always reply
> with
> > > something if the master requested it do so. This points us at the
> > > specification which reads:
> > >
> > >   - Bit 3 is the need_reply flag - see :ref:`REPLY_ACK <reply_ack>` f=
or
> > >     details.
> > >
> > > which says in VHOST_USER_PROTOCOL_F_REPLY_ACK that this bit should on=
ly
> > > be honoured when the feature has been negotiated. Which brings us to =
a
> > > series of questions:
> > >
> > >  - Should QEMU have preserved
> VhostUserVirtioFeatures::PROTOCOL_FEATURES
> > >    when doing the eventual VHOST_USER_SET_FEATURES reply?
> >
> > Hmm looks like a bug indeed ... Anyone wants to look
> > into fixing that? Marc-Andr=C3=A9?
>
> chirantan and keiichi will be implementing vhost-user-vitio-fs on
> Chrome OS, maybe one of you two can take a look?
>
>
Yeah, our team is working on vhost-user virtiofs. I think +Woody Chow
<woodychow@chromium.org> will probably be able to look into this issue.


>
> >
> >
> >
> > >  - Is vhost.rs being to strict or libvhost-user too lax in
> interpreting
> > >    the negotiated features before processing the ``need_reply`` [Bit =
3]
> > >    field of the messages?
> > >
> > >  - are VHOST_USER_SET_MEM_TABLE to VHOST_USER_SET_INFLIGHT_FD include=
d
> > >    in the "list of the ones that do" require replies or do they only
> > >    reply when REPLY_ACK has been negotiated as the ambiguous
> "seealso::"
> > >    box out seems to imply?
> > >
> > > Currently I have some hacks in:
> > >
> > >   https://github.com/stsquad/vhost/tree/my-hacks
> > >
> > > which gets my daemon booting up to the point we actually need to do a
> > > transaction. However I won't submit a PR until I've worked out exactl=
y
> > > where the problems are.
> > >
> > > --
> > > Alex Benn=C3=A9e
> >
> >
> > _______________________________________________
> > Rust-vmm mailing list
> > Rust-vmm@lists.opendev.org
> > http://lists.opendev.org/cgi-bin/mailman/listinfo/rust-vmm
>

--0000000000007ae05605bc235e54
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 25, 2021 at 1:20 PM Dylan=
 Reid &lt;<a href=3D"mailto:dgreid@chromium.org">dgreid@chromium.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue,=
 Feb 23, 2021 at 8:20 AM Michael S. Tsirkin &lt;<a href=3D"mailto:mst@redha=
t.com" target=3D"_blank">mst@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Cc: Raphael<br>
&gt;<br>
&gt; On Fri, Feb 19, 2021 at 04:04:34PM +0000, Alex Benn=C3=A9e wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; I finally got a chance to get down into the guts of vhost-user wh=
ile<br>
&gt; &gt; attempting to port my original C RPMB daemon to Rust using the<br=
>
&gt; &gt; vhost-user-backend and related crates. I ended up with this hang =
during<br>
&gt; &gt; negotiation:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0startup<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_write req:1 flags:0x1<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_read_start<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_read req:1 flags:0x5<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_backend_init: we got 170000000<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_write req:15 flags:0x1<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_read_start<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_read req:15 flags:0x5<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_set_protocol_features: 2008<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_write req:16 flags:0x1<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_write req:3 flags:0x1<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_write req:1 flags:0x1<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_read_start<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_read req:1 flags:0x5<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_write req:13 flags:0x1<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0kernel initialises device<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0virtio_rpmb virtio1: init done!<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_write req:13 flags:0x1<br>
&gt; &gt;=C2=A0 =C2=A0vhost_dev_set_features: 130000000<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_set_features: 130000000<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_write req:2 flags:0x1<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_write req:5 flags:0x9<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_read_start<br>
&gt; &gt;<br>
&gt; &gt; The proximate cause is the vhost crate handling:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0MasterReq::SET_MEM_TABLE =3D&gt; {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0let res =3D self.set_mem_table(&amp;hdr=
, size, &amp;buf, rfds);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0self.send_ack_message(&amp;hdr, res)?;<=
br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; which gates on the replay_ack_enabled flag:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0fn send_ack_message(<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;mut self,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0req: &amp;VhostUserMsgHeader&lt;=
MasterReq&gt;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0res: Result&lt;()&gt;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0) -&gt; Result&lt;()&gt; {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if dbg!(self.reply_ack_enabled) =
{<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0let hdr =3D self.n=
ew_reply_header::&lt;VhostUserU64&gt;(req, 0)?;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0let val =3D match =
res {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ok(_=
) =3D&gt; 0,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Err(=
_) =3D&gt; 1,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0let msg =3D VhostU=
serU64::new(val);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.main_sock.sen=
d_message(&amp;hdr, &amp;msg, None)?;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Ok(())<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; which is only set when we have all the appropriate acknowledged f=
lags:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0fn update_reply_ack_flag(&amp;mut self) {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0let vflag =3D VhostUserVirtioFea=
tures::PROTOCOL_FEATURES.bits();<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0let pflag =3D VhostUserProtocolF=
eatures::REPLY_ACK;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (self.virtio_features &amp; v=
flag) !=3D 0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (self.a=
cked_virtio_features &amp; vflag) !=3D 0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; self.pr=
otocol_features.contains(pflag)<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;&amp; (self.a=
cked_protocol_features &amp; pflag.bits()) !=3D 0<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.reply_ack_ena=
bled =3D true;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.reply_ack_ena=
bled =3D false;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; which from above you can see QEMU helpfully dropped those bits in=
 the<br>
&gt; &gt; reply. It does however work in the C/libvhost version:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0virtio_rpmb virtio1: init done!<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_write req:13 flags:0x1<br>
&gt; &gt;=C2=A0 =C2=A0vhost_dev_set_features: 130000000<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_set_features: 130000000<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_write req:2 flags:0x1<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_write req:37 flags:0x9<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_read_start<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_read req:37 flags:0x5<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_write req:8 flags:0x1<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_write req:10 flags:0x1<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_write req:9 flags:0x1<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_write req:12 flags:0x1<br>
&gt; &gt;=C2=A0 =C2=A0vhost_user_write req:13 flags:0x1<br>
&gt; &gt;<br>
&gt; &gt; albeit with a slightly different message sequence<br>
&gt; &gt; (VHOST_USER_ADD_MEM_REG instead of VHOST_USER_SET_MEM_TABLE). Rea=
ding<br>
&gt; &gt; the C code you can see why:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0need_reply =3D vmsg.flags &amp; VHOST_USER_NEE=
D_REPLY_MASK;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0reply_requested =3D vu_process_message(dev, &a=
mp;vmsg);<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0if (!reply_requested &amp;&amp; need_reply) {<=
br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vmsg_set_reply_u64(&amp;vmsg, 0)=
;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reply_requested =3D 1;<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt;<br>
&gt; &gt; So regardless of what may have been negotiated it will always rep=
ly with<br>
&gt; &gt; something if the master requested it do so. This points us at the=
<br>
&gt; &gt; specification which reads:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0- Bit 3 is the need_reply flag - see :ref:`REPLY_ACK =
&lt;reply_ack&gt;` for<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0details.<br>
&gt; &gt;<br>
&gt; &gt; which says in VHOST_USER_PROTOCOL_F_REPLY_ACK that this bit shoul=
d only<br>
&gt; &gt; be honoured when the feature has been negotiated. Which brings us=
 to a<br>
&gt; &gt; series of questions:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 - Should QEMU have preserved VhostUserVirtioFeatures::PROTO=
COL_FEATURES<br>
&gt; &gt;=C2=A0 =C2=A0 when doing the eventual VHOST_USER_SET_FEATURES repl=
y?<br>
&gt;<br>
&gt; Hmm looks like a bug indeed ... Anyone wants to look<br>
&gt; into fixing that? Marc-Andr=C3=A9?<br>
<br>
chirantan and keiichi will be implementing vhost-user-vitio-fs on<br>
Chrome OS, maybe one of you two can take a look?<br>
<br></blockquote><div><br></div><div>Yeah, our team is working on vhost-use=
r virtiofs. I think=C2=A0<a class=3D"gmail_plusreply" id=3D"plusReplyChip-2=
" href=3D"mailto:woodychow@chromium.org" tabindex=3D"-1">+Woody Chow</a>=C2=
=A0will probably be able to look into this issue.</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; &gt;=C2=A0 - Is <a href=3D"http://vhost.rs" rel=3D"noreferrer" target=
=3D"_blank">vhost.rs</a> being to strict or libvhost-user too lax in interp=
reting<br>
&gt; &gt;=C2=A0 =C2=A0 the negotiated features before processing the ``need=
_reply`` [Bit 3]<br>
&gt; &gt;=C2=A0 =C2=A0 field of the messages?<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 - are VHOST_USER_SET_MEM_TABLE to VHOST_USER_SET_INFLIGHT_F=
D included<br>
&gt; &gt;=C2=A0 =C2=A0 in the &quot;list of the ones that do&quot; require =
replies or do they only<br>
&gt; &gt;=C2=A0 =C2=A0 reply when REPLY_ACK has been negotiated as the ambi=
guous &quot;seealso::&quot;<br>
&gt; &gt;=C2=A0 =C2=A0 box out seems to imply?<br>
&gt; &gt;<br>
&gt; &gt; Currently I have some hacks in:<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 =C2=A0<a href=3D"https://github.com/stsquad/vhost/tree/my-h=
acks" rel=3D"noreferrer" target=3D"_blank">https://github.com/stsquad/vhost=
/tree/my-hacks</a><br>
&gt; &gt;<br>
&gt; &gt; which gets my daemon booting up to the point we actually need to =
do a<br>
&gt; &gt; transaction. However I won&#39;t submit a PR until I&#39;ve worke=
d out exactly<br>
&gt; &gt; where the problems are.<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Alex Benn=C3=A9e<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Rust-vmm mailing list<br>
&gt; <a href=3D"mailto:Rust-vmm@lists.opendev.org" target=3D"_blank">Rust-v=
mm@lists.opendev.org</a><br>
&gt; <a href=3D"http://lists.opendev.org/cgi-bin/mailman/listinfo/rust-vmm"=
 rel=3D"noreferrer" target=3D"_blank">http://lists.opendev.org/cgi-bin/mail=
man/listinfo/rust-vmm</a><br>
</blockquote></div></div>

--0000000000007ae05605bc235e54--

