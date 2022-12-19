Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8396509AA
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 10:57:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Ctu-0002we-IB; Mon, 19 Dec 2022 04:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1p7Ctr-0002r2-Qh
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:57:35 -0500
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuval.shaia.ml@gmail.com>)
 id 1p7Ctq-00039e-0X
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 04:57:35 -0500
Received: by mail-pf1-x431.google.com with SMTP id g1so5855889pfk.2
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 01:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8+/oq2YAhmXCP74KFTuyYZf22KDkAeC3apEnnrvBVYA=;
 b=H5ozhgqgyxXv1VMpB3laP1TYDnYuyGUmXa1Q9ivuaRJQg44X+trKEFW0wM6e0q+zPL
 ZIqn7Vknfs7keejqXhig3lhNHFYDZylJ7dDPEEIF3VpEhuPbsLayyUdU7vDnWOa0FKKu
 qpCDLQ0PltqiT/LcLYb9V3YH4j1isbtYUDoIbLydRgKkBjS2S9g5OdCqRy9YtYqvjTnE
 wm/goRNlyXV07IJpAcYzMS9uuJTvNsTCV185fmJ9BP20Wi/5k4Vot6R7daMscS0tI1Q9
 H7hGJKre/oBzNS7vJH6JRGHUrjYVBxn1ZltkxBcST3Pi7Z57AHvYtp0F+aCUpMtxo5ZS
 gkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8+/oq2YAhmXCP74KFTuyYZf22KDkAeC3apEnnrvBVYA=;
 b=cFUm0IpJw2EkaJbhJ1xRNXDiAg5CxtuPr3yvD3n8tW8v+yJEOUuu3R/digdRRhxy3G
 xhpZpAYnZPYAnsBliSw8DkjQm/wQBor4VPge1bn5JEslgLUiHrW3JnMCy77wQb6cbvoW
 WGTCwbK3iGo6iiUigXGAFC8abkfznHOqJIBkBOnoQs67sy5vRYrxi1MuwZo2Kf8xNbDR
 kUhGHexE4qhuX7FXF1qvh2cKuLLoCI+OdNu0DyvW90IBe7S7VLJfCVZatmanJE0JujNC
 H//N1LK7rU3Wldx78LgjjOKTcI2ZsbdfF5owwXqia6DuReVN6S2GIjR2i3Dr0gUuNoId
 0MfA==
X-Gm-Message-State: ANoB5pmQ9IPTtvhPNPymAKgpvLFjZ6qoZdKt91yQzRT84FRAp3gQOxze
 /kZZ2ywX9lb7BuiZxS5fFOS9lTn2jPEAUq7W2pI=
X-Google-Smtp-Source: AA0mqf7qbyt/vvYmgXI/64wh5gcZEs4E3UZPhdb0gK2fnwzBIEr1OBalbHDhLFALgufsvfd7hrft7eKJvG1kqS1a+tY=
X-Received: by 2002:a65:6843:0:b0:47c:9cee:84b8 with SMTP id
 q3-20020a656843000000b0047c9cee84b8mr1357744pgt.67.1671443852201; Mon, 19 Dec
 2022 01:57:32 -0800 (PST)
MIME-Version: 1.0
References: <20220403095234.2210-1-yuval.shaia.ml@gmail.com>
 <CAC_L=vXsKpai6Wr0Fi2r5sr4U+tshPB9VizqntDppqE=1_FbVQ@mail.gmail.com>
 <339b8c7d-1f54-a515-8854-c22d10f79d1d@suse.de>
In-Reply-To: <339b8c7d-1f54-a515-8854-c22d10f79d1d@suse.de>
From: Yuval Shaia <yuval.shaia.ml@gmail.com>
Date: Mon, 19 Dec 2022 11:57:21 +0200
Message-ID: <CAMPkWoOFXfyx=ZOv8i6AJ8Lv2GFKt11gnXYZ2W_4roS9UP9m5w@mail.gmail.com>
Subject: Re: [PATCH v3] hw/pvrdma: Protect against buggy or malicious guest
 driver
To: Claudio Fontana <cfontana@suse.de>
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, wxhusst@gmail.com, 
 Mauro Matteo Cascella <mcascell@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="00000000000012944005f02b5903"
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=yuval.shaia.ml@gmail.com; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--00000000000012944005f02b5903
Content-Type: text/plain; charset="UTF-8"

Can anyone else pick this one?

Thanks,
Yuval

On Wed, 7 Dec 2022 at 17:05, Claudio Fontana <cfontana@suse.de> wrote:

> On 4/5/22 12:31, Marcel Apfelbaum wrote:
> > Hi Yuval,
> > Thank you for the changes.
> >
> > On Sun, Apr 3, 2022 at 11:54 AM Yuval Shaia <yuval.shaia.ml@gmail.com>
> wrote:
> >>
> >> Guest driver might execute HW commands when shared buffers are not yet
> >> allocated.
> >> This could happen on purpose (malicious guest) or because of some other
> >> guest/host address mapping error.
> >> We need to protect againts such case.
> >>
> >> Fixes: CVE-2022-1050
> >>
> >> Reported-by: Raven <wxhusst@gmail.com>
> >> Signed-off-by: Yuval Shaia <yuval.shaia.ml@gmail.com>
> >> ---
> >> v1 -> v2:
> >>         * Commit message changes
> >> v2 -> v3:
> >>         * Exclude cosmetic changes
> >> ---
> >>  hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++
> >>  1 file changed, 6 insertions(+)
> >>
> >> diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c
> >> index da7ddfa548..89db963c46 100644
> >> --- a/hw/rdma/vmw/pvrdma_cmd.c
> >> +++ b/hw/rdma/vmw/pvrdma_cmd.c
> >> @@ -796,6 +796,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)
> >>
> >>      dsr_info = &dev->dsr_info;
> >>
> >> +    if (!dsr_info->dsr) {
> >> +            /* Buggy or malicious guest driver */
> >> +            rdma_error_report("Exec command without dsr, req or rsp
> buffers");
> >> +            goto out;
> >> +    }
> >> +
> >>      if (dsr_info->req->hdr.cmd >= sizeof(cmd_handlers) /
> >>                        sizeof(struct cmd_handler)) {
> >>          rdma_error_report("Unsupported command");
> >> --
> >> 2.20.1
> >>
> >
> > cc-ing Peter and Philippe for a question:
> > Do we have a "Security Fixes" or a "Misc" subtree? Otherwise it will
> > have to wait a week or so.
> >
> > Reviewed by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > Thanks,
> > Marcel
> >
>
> Hi all,
>
> patch is reviewed, anything holding back the inclusion of this security
> fix?
>
> Thanks,
>
> Claudio
>

--00000000000012944005f02b5903
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can anyone else pick this one?<div><br></div><div>Thanks,<=
/div><div>Yuval</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, 7 Dec 2022 at 17:05, Claudio Fontana &lt;<a hr=
ef=3D"mailto:cfontana@suse.de">cfontana@suse.de</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On 4/5/22 12:31, Marcel Apfe=
lbaum wrote:<br>
&gt; Hi Yuval,<br>
&gt; Thank you for the changes.<br>
&gt; <br>
&gt; On Sun, Apr 3, 2022 at 11:54 AM Yuval Shaia &lt;<a href=3D"mailto:yuva=
l.shaia.ml@gmail.com" target=3D"_blank">yuval.shaia.ml@gmail.com</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt; Guest driver might execute HW commands when shared buffers are not=
 yet<br>
&gt;&gt; allocated.<br>
&gt;&gt; This could happen on purpose (malicious guest) or because of some =
other<br>
&gt;&gt; guest/host address mapping error.<br>
&gt;&gt; We need to protect againts such case.<br>
&gt;&gt;<br>
&gt;&gt; Fixes: CVE-2022-1050<br>
&gt;&gt;<br>
&gt;&gt; Reported-by: Raven &lt;<a href=3D"mailto:wxhusst@gmail.com" target=
=3D"_blank">wxhusst@gmail.com</a>&gt;<br>
&gt;&gt; Signed-off-by: Yuval Shaia &lt;<a href=3D"mailto:yuval.shaia.ml@gm=
ail.com" target=3D"_blank">yuval.shaia.ml@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; v1 -&gt; v2:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Commit message changes<br>
&gt;&gt; v2 -&gt; v3:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Exclude cosmetic changes<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 hw/rdma/vmw/pvrdma_cmd.c | 6 ++++++<br>
&gt;&gt;=C2=A0 1 file changed, 6 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/hw/rdma/vmw/pvrdma_cmd.c b/hw/rdma/vmw/pvrdma_cmd.c<b=
r>
&gt;&gt; index da7ddfa548..89db963c46 100644<br>
&gt;&gt; --- a/hw/rdma/vmw/pvrdma_cmd.c<br>
&gt;&gt; +++ b/hw/rdma/vmw/pvrdma_cmd.c<br>
&gt;&gt; @@ -796,6 +796,12 @@ int pvrdma_exec_cmd(PVRDMADev *dev)<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 dsr_info =3D &amp;dev-&gt;dsr_info;<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 if (!dsr_info-&gt;dsr) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Buggy or malicious g=
uest driver */<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rdma_error_report(&quot=
;Exec command without dsr, req or rsp buffers&quot;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 if (dsr_info-&gt;req-&gt;hdr.cmd &gt;=3D sizeo=
f(cmd_handlers) /<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 sizeof(struct cmd_handler)) {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rdma_error_report(&quot;Unsuppor=
ted command&quot;);<br>
&gt;&gt; --<br>
&gt;&gt; 2.20.1<br>
&gt;&gt;<br>
&gt; <br>
&gt; cc-ing Peter and Philippe for a question:<br>
&gt; Do we have a &quot;Security Fixes&quot; or a &quot;Misc&quot; subtree?=
 Otherwise it will<br>
&gt; have to wait a week or so.<br>
&gt; <br>
&gt; Reviewed by: Marcel Apfelbaum &lt;<a href=3D"mailto:marcel.apfelbaum@g=
mail.com" target=3D"_blank">marcel.apfelbaum@gmail.com</a>&gt;<br>
&gt; Thanks,<br>
&gt; Marcel<br>
&gt; <br>
<br>
Hi all,<br>
<br>
patch is reviewed, anything holding back the inclusion of this security fix=
?<br>
<br>
Thanks,<br>
<br>
Claudio<br>
</blockquote></div>

--00000000000012944005f02b5903--

