Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7D0340898
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:17:39 +0100 (CET)
Received: from localhost ([::1]:59056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMuP4-0004Nz-BX
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:17:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaojun.zhao141@gmail.com>)
 id 1lMuMo-0002yR-Ew; Thu, 18 Mar 2021 11:15:18 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:45937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xiaojun.zhao141@gmail.com>)
 id 1lMuMm-0006Ha-J9; Thu, 18 Mar 2021 11:15:18 -0400
Received: by mail-ot1-x32e.google.com with SMTP id
 f73-20020a9d03cf0000b02901b4d889bce0so5481382otf.12; 
 Thu, 18 Mar 2021 08:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wwfX3rVj67NkYhC1ceFz0SuZ6D5Wm1ZGPkDXcugvkbA=;
 b=dx+58LKVUklnH7t0xWdoKSBd9JwL5t/T23MFdWsuI/YJ+6i00W7JqKD5KTh9ikc7Fx
 K7FBuvOAwgridTgqwELhazYBN6AlXu2eE0QK2F8LS9qIzOe1ZRq7Rdu86X/Wwukd18nU
 cZKrSj8RMLopCU9uasLjLYtzI+lWJr42H8WCJicp+KIo45GwO4T1jIZcuTUgyi84mOva
 cXQDkVbW5xhySz8R8HpRVJfRgFk2zFtTssfg/TjiqcRxz+Dz1vGiVebbY8C/+So7GBoj
 IqDBRJl5ANzgjW68BL9nG4PRKxdiQl5GerGzy9ycZWi37S6IJIgpTOh62h2C6Gn5s0du
 xxPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wwfX3rVj67NkYhC1ceFz0SuZ6D5Wm1ZGPkDXcugvkbA=;
 b=hP1/Ij0gNeGQX5rG0X3MM407KVsd9T/NGDTdQQU7c2fUsPXxcc+0RdF+7rWmHGtWTp
 lk9ZTfoI3zBG87LbR5c6rc3NFt4hE3dunU8C4Zm8f/eqYQ9ZTKYBIQcFOr8m1my19CXw
 4G07TmV6jMUg9uks2PHFzJ4Vx/63/v9iJiudu01R2Td9RLeRUP80RZQrJGCeDqCeAn3e
 9Z4r3TRnbb4ONpqxyeTOq5DvsdfC09wybvf6NcsOW0tWPSoolLblWTjM8mD3wJa4jfKU
 mnsGxYBm05qktcbT2rfA8HkOUmAvllWhfViX7f/R3bvvMoLbnAf8c/GOy0+J8i4jXu6m
 GFew==
X-Gm-Message-State: AOAM531Q+hu4r+ryWrKLoabq69k2KMtgyAkyUpbIoK83A2j5dkLm3iem
 7hObXMx7I/1RWcDtWKJWwC7izOHE9pLAaquI+Ec=
X-Google-Smtp-Source: ABdhPJzD3gjZGUsqN952rRNHkJR/o/vQwLRZOnxfN546JUnamSrcfV+kZaFSI1iYUxDLb13X6EQaFyzp6jM1wiIS5do=
X-Received: by 2002:a9d:6e18:: with SMTP id e24mr5357535otr.284.1616080514826; 
 Thu, 18 Mar 2021 08:15:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAAeqyDvGXBLRxB-KRe2QZH6SV7KKZp=oFQ3wQ_bdsUo1z1_rvw@mail.gmail.com>
 <ac58e1ea-6745-7e62-f8c2-68fceebe1c2d@redhat.com>
 <YFMwWFbRi6wNWFtG@merkur.fritz.box>
In-Reply-To: <YFMwWFbRi6wNWFtG@merkur.fritz.box>
From: zhao xiaojun <xiaojun.zhao141@gmail.com>
Date: Thu, 18 Mar 2021 23:15:04 +0800
Message-ID: <CAAeqyDsxuwuyeMR4zd-=LSSt3U-Ma-AzJmnqaBk0=V4zRzvGww@mail.gmail.com>
Subject: Re: Can not use hmp block_resize command with -blockdev option
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000003c42405bdd1112d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=xiaojun.zhao141@gmail.com; helo=mail-ot1-x32e.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000003c42405bdd1112d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks you, that's really good idea. And I also have the following question=
:

There are some hmp and qmp commands in my scripts, they need the device as
an argument. Recently. i used the -blockdev replace the -drive to
specify the disk drive, then use  qmp's query_block to query the device,
but the device is NULL string. For the hmp's block_resize, I can use qmp's
block_resize do. But the other commands(qpm's block-job-cancel etc.), they
only support the device argument. So I can only continue to use -drive to
specify disk drive.

I was trying to see the source(qemu v5.1.0):
qmp_query_device()
  -> bdrv_query_info()
      info->device =3D g_strdup(blk_name(blk))
the device is set to blk_name(blk), and the blk->name is set in
the monitor_add_blk()

the -blockdev:
qmp_blockdev_add()
   -> bds_tree_init()
     -> bdrv_open()
   ...
the qmp_blockdev_add() doesn't call the monitor_add_blk().

Questions:
Why can not qmp_blockdev_add() call the monitor_add_blk()?
Will the hmp and qmp commands that only support device as an argument be
compat with the -blockdev option?

Kevin Wolf <kwolf@redhat.com> =E4=BA=8E2021=E5=B9=B43=E6=9C=8818=E6=97=A5=
=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:50=E5=86=99=E9=81=93=EF=BC=9A

> Am 17.03.2021 um 23:49 hat John Snow geschrieben:
> > On 3/16/21 11:43 PM, zhao xiaojun wrote:
> > > Hi,
> > > I use -blockdev option to specify a drive when qemu boot and i want t=
o
> > > resize it with hmp block_resize command. The hmp block_resize comand'=
s
> > > arguments: block_resize device new_size.
> > > So I query the device by qmp query_block command, but the device file=
d
> > > of the result output is NULL string.
> > >
> > > result output:
> > > {
> > >    "return": [
> > >      {
> > >        "io-status": "ok",
> > >        "device": "",
> > >          ...
> > > }
> > >
> > > I noticed that the qmp block_resize command supports device or
> node-name
> > > as argument.
> > >
> > > If i can continue use the the hmp block_resize command with the devic=
e
> > > argument?
> > >
> > > Regards.
> >
> > I'm not sure what you're asking: hmp's block_resize doesn't accept
> node-name
> > arguments as you've found. Are you not able to use QMP's block_resize?
>
> We should probably fix HMP block_resize to accept node names.
>
> Kevin
>
>

--00000000000003c42405bdd1112d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks you, that&#39;s really good idea. And I also h=
ave the following question:</div><div><br></div>There are some hmp and qmp =
commands in my scripts, they need the device as an argument.=C2=A0Recently.=
 i used the -blockdev replace the -drive to specify=C2=A0the disk drive, th=
en use=C2=A0=C2=A0<font color=3D"#500050">qmp&#39;s query_block to query th=
e device,=C2=A0 but the device is NULL string. For the hmp&#39;s block_resi=
ze, I can use qmp&#39;s block_resize do. But the other commands(qpm&#39;s=
=C2=A0</font>block-job-cancel etc.<font color=3D"#500050">), they only supp=
ort the device argument. So I can only continue to use -drive to specify di=
sk drive.=C2=A0=C2=A0</font><div><br></div><div><font color=3D"#500050">I w=
as trying to see the source(qemu v5.1.0):</font></div><div><font color=3D"#=
500050">qmp_query_device()</font></div><div><font color=3D"#500050">=C2=A0 =
-&gt;=C2=A0</font>bdrv_query_info()</div><div>=C2=A0 =C2=A0 =C2=A0 info-&gt=
;device =3D g_strdup(blk_name(blk))</div><div>the device is set to=C2=A0blk=
_name(blk), and the blk-&gt;name is set in the=C2=A0monitor_add_blk()</div>=
<div><br></div><div>the -blockdev:</div><div>qmp_blockdev_add()</div><div>=
=C2=A0 =C2=A0-&gt;=C2=A0bds_tree_init()</div><div>=C2=A0 =C2=A0 =C2=A0-&gt;=
=C2=A0bdrv_open()</div><div>=C2=A0 =C2=A0...</div><div>the qmp_blockdev_add=
() doesn&#39;t call the monitor_add_blk().</div><div><br></div><div>Questio=
ns:</div><div>Why can not qmp_blockdev_add() call the monitor_add_blk()?=C2=
=A0</div><div>Will the hmp and qmp commands that only support device as an =
argument be compat with the -blockdev option?=C2=A0</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Kevin Wolf &lt;<a =
href=3D"mailto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; =E4=BA=8E2021=E5=
=B9=B43=E6=9C=8818=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=886:50=E5=86=
=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Am 17.03.2021 um 23:49 hat John Snow geschrieben:<br>
&gt; On 3/16/21 11:43 PM, zhao xiaojun wrote:<br>
&gt; &gt; Hi,<br>
&gt; &gt; I use -blockdev option to specify a drive when qemu boot and i wa=
nt to<br>
&gt; &gt; resize it with hmp block_resize command. The hmp block_resize com=
and&#39;s<br>
&gt; &gt; arguments: block_resize device new_size.<br>
&gt; &gt; So I query the device by qmp query_block command, but the device =
filed<br>
&gt; &gt; of the result output is NULL string.<br>
&gt; &gt; <br>
&gt; &gt; result output:<br>
&gt; &gt; {<br>
&gt; &gt;=C2=A0 =C2=A0 &quot;return&quot;: [<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;io-status&quot;: &quot;ok&quot;,=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;device&quot;: &quot;&quot;,<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ...<br>
&gt; &gt; }<br>
&gt; &gt; <br>
&gt; &gt; I noticed that the qmp block_resize command supports device or no=
de-name<br>
&gt; &gt; as argument.<br>
&gt; &gt; <br>
&gt; &gt; If i can continue use the the hmp block_resize command with the d=
evice<br>
&gt; &gt; argument?<br>
&gt; &gt; <br>
&gt; &gt; Regards.<br>
&gt; <br>
&gt; I&#39;m not sure what you&#39;re asking: hmp&#39;s block_resize doesn&=
#39;t accept node-name<br>
&gt; arguments as you&#39;ve found. Are you not able to use QMP&#39;s block=
_resize?<br>
<br>
We should probably fix HMP block_resize to accept node names.<br>
<br>
Kevin<br>
<br>
</blockquote></div>

--00000000000003c42405bdd1112d--

