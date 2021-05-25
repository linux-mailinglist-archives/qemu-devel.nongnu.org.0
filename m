Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D1B39085F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 20:01:29 +0200 (CEST)
Received: from localhost ([::1]:46822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llbMt-0004si-Kf
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 14:01:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llbLY-00046I-SH
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:00:05 -0400
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833]:36478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kit.westneat@gmail.com>)
 id 1llbLX-00058z-31
 for qemu-devel@nongnu.org; Tue, 25 May 2021 14:00:04 -0400
Received: by mail-qt1-x833.google.com with SMTP id s12so14542767qta.3
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 11:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=eOXD7o6wLctvgeL+nt1q6iawYp3GBBhYkdBfGkA3PnQ=;
 b=iu++9V5/dkmR2c7VFUcpwkwFBHJTNZdQCa9sf1B2DaLTM3z5RKcRCeYQv8s2CWWSyD
 I3mrfH9LpcVN+mYlCRkO5A/JUgztOjAxCpI9YUZ15pSHdBOc716bzYhvA8fWQrIO1cvd
 tZmeL2QXYY/cW/tmojlECd/dxhSKXWkePc795QGOFcbYTZhLBrQ2RzJSUKLfrivG41nE
 niPsb73Wv5wyna91ksBtmQiSvn4M4cNIe32hYUuOL5P6l6iAMfzxpuImWZJ1HcgDB563
 ixh8q/TLbWwxIw+LOmq0nRYe8PcutKMT+qJu1yundL5p7FQC66oFpeB5M9iIaalWexJW
 k23A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=eOXD7o6wLctvgeL+nt1q6iawYp3GBBhYkdBfGkA3PnQ=;
 b=YR03GCnQkkzdQAoJl9aY/oGyA7tQ7WLog4TIpiH+xyfG2NGX7xTcKeuYBxDj9hxgS6
 rstnVeIn/Tcinuaon+88cUZ5jCnpL2T6E1JzH2uBHFnwfmNeGPSj8YbG5fLvkU57WpNa
 ClJCI54ckga8LBh7cNVlX6nNkXcmy7ZXECm/VZEkjw7HL+J62R4KRd3qQzwSO+P3G4wD
 +i1UFUmrtH+dvbMpNiRXHfqWWH65d543Q2Lj/avlR53zFmt2/9IP+5ZCpxH+38/vH3sA
 gT9sV7T5/B79ngVaoF8JJPNHlasNDL87KqjkQWnTnvw4DlISmHIVi9YH5aFXgRuIsOEk
 Py1A==
X-Gm-Message-State: AOAM531paWZe0kJty5BQvG5aE2xKVRmw9ougAsz6PIr06HZKbHdH7CS/
 CfNxcrkYJwKv4mHtuS0Yx3vIAvKoWdMLspX7ExA=
X-Google-Smtp-Source: ABdhPJxsYO1ipP2byx2sALyAHhGTxYbA9+Im6TDk4Sm/Nndk6YW74tna6SM9aLE/eqX3A8KxtOBxjiS9Ug+osG67zvU=
X-Received: by 2002:ac8:5402:: with SMTP id b2mr14241301qtq.259.1621965601915; 
 Tue, 25 May 2021 11:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210525124753.528516-1-kit.westneat@gmail.com>
 <20210525124753.528516-2-kit.westneat@gmail.com>
 <20210525144604.vcbujj6tlpjp3qr2@redhat.com>
In-Reply-To: <20210525144604.vcbujj6tlpjp3qr2@redhat.com>
From: Kit Westneat <kit.westneat@gmail.com>
Date: Tue, 25 May 2021 13:59:49 -0400
Message-ID: <CA+F2jRdoF=Apsg0myqX+-Kd546F1=W-2C9rP8ovRnOSc19PqgA@mail.gmail.com>
Subject: Re: [PATCH 1/3] block/blkdebug: add blocksize parameter
To: Kit Westneat <kit.westneat@gmail.com>, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Content-Type: multipart/alternative; boundary="0000000000008a495105c32b4b57"
Received-SPF: pass client-ip=2607:f8b0:4864:20::833;
 envelope-from=kit.westneat@gmail.com; helo=mail-qt1-x833.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008a495105c32b4b57
Content-Type: text/plain; charset="UTF-8"

Makes sense. Sorry for the basic question, but is that just a matter of
adding it to qapi/block-core.json?

Thanks,
Kit

On Tue, May 25, 2021 at 10:46 AM Eric Blake <eblake@redhat.com> wrote:

> On Tue, May 25, 2021 at 12:47:51PM +0000, Kit Westneat wrote:
> > Allow users to specify the block size of the qdev for testing purposes.
> >
> > Signed-off-by: Kit Westneat <kit.westneat@gmail.com>
> > ---
> >  block/blkdebug.c | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
>
> Should this also be selectable when using QAPI to create a blkdebug
> device over QMP?
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>
>

--0000000000008a495105c32b4b57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Makes sense. Sorry for the basic question, but is tha=
t just a matter of adding it to qapi/block-core.json?</div><div><br></div><=
div>Thanks,</div><div>Kit<br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Tue, May 25, 2021 at 10:46 AM Eric Bl=
ake &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, May 2=
5, 2021 at 12:47:51PM +0000, Kit Westneat wrote:<br>
&gt; Allow users to specify the block size of the qdev for testing purposes=
.<br>
&gt; <br>
&gt; Signed-off-by: Kit Westneat &lt;<a href=3D"mailto:kit.westneat@gmail.c=
om" target=3D"_blank">kit.westneat@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 block/blkdebug.c | 27 +++++++++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 27 insertions(+)<br>
<br>
Should this also be selectable when using QAPI to create a blkdebug<br>
device over QMP?<br>
<br>
-- <br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3266<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer" target=
=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D"noreferrer=
" target=3D"_blank">libvirt.org</a><br>
<br>
</blockquote></div>

--0000000000008a495105c32b4b57--

