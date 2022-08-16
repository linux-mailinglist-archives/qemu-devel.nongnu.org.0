Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F44594F5B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 06:24:29 +0200 (CEST)
Received: from localhost ([::1]:34190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNo7w-0001EN-B8
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 00:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaishu071998@gmail.com>)
 id 1oNo6L-0008H8-US
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 00:22:49 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:45860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vaishu071998@gmail.com>)
 id 1oNo6K-00021x-6l
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 00:22:49 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-3246910dac3so121500127b3.12
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 21:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Z4HclG8aTio85EIYPum+zbH5b8VK+0gJfbyj7KApy5M=;
 b=d/NI74yJxEAF3o7+4VI/iDcf87abaVxGpkNX/qSrfI4w6aS2WORDV4yJKsQugRENLm
 KltZusQxUA2zeuyiwFjiLvcHutanDQ7NdWfp9k2ftxVcr6TYkk2AFrTs8aKwLTZXO4Xu
 bI+Zx3APIGEJsu7gHlMQpljn7S3IrIOmVQv1Y8soCB9w0rwOzlQ7/bgl/xaOHd2EMJ2z
 Jqv2zeE9/H0qFrP4LEDbHmfzOlResBV2ghtFoy/bcbKn8Dq8I4gmiIMxgfyq36/kLmnB
 rgnDWGw5HUJ0tOvQdhr7yKXP+y4aZVibOp1T7V1253dwPwu4VFKEUZWReJkN0+67e46u
 lCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Z4HclG8aTio85EIYPum+zbH5b8VK+0gJfbyj7KApy5M=;
 b=Jk9J9KuLu2fW7lELRWeUO91Vrd1VSPlUSiF4OUiNfM3cVJRhlaV09XgNU5bRyBwclD
 SLY+NdpncBW8RQfvIdycGWYBuKGpffqEx4JVw+boPglQxPISjjb61ueknN8t2fC7IACi
 mqV3GQtFghCguLya+Ijuu0xJj2s46fivBgN/66/VBOyTiAEhBkm3nKNzXeNKved6WSl3
 qipzBD4QIOEzQ51ee/oxrUr9bxv2cEosHuRuWolMT5VbwC9ArWGJctCbNGiF7+EOYwUL
 l51ioHcIcuh1EOwfCXyNCJIQ0cs6KHDjG1FT+rF0Dbo9hDQYlZagEL4YPm6GqpSJQpYO
 C7DA==
X-Gm-Message-State: ACgBeo1LEBxGEEOjh55c5B8ZLvhtqC3ULptGW4donE2J4PzXJ5f4Aj5S
 MjXBC8mxn7JhnnCzDVxhf8VCxNoof/0+60jvorc=
X-Google-Smtp-Source: AA6agR5w1P2xQA75I51qstyIdAuhWCHpk2IuIbglPEFVv11xwxM/b/2mdqYdA+W+yHOwqlWeiB6j9NoEYS4MIoH5T28=
X-Received: by 2002:a05:6902:244:b0:66f:8383:b51c with SMTP id
 k4-20020a056902024400b0066f8383b51cmr15285976ybs.471.1660623767064; Mon, 15
 Aug 2022 21:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <CAEcBaE1DOVtq+D1jh42ZO01guWo_zVRbFWoAOigpD2xm0YPSKQ@mail.gmail.com>
 <9e3a4a71-7d96-9fab-2d4e-4167b2f248f7@redhat.com>
In-Reply-To: <9e3a4a71-7d96-9fab-2d4e-4167b2f248f7@redhat.com>
From: vaishu venkat <vaishu071998@gmail.com>
Date: Tue, 16 Aug 2022 09:52:34 +0530
Message-ID: <CAEcBaE1fmko6BTgKXtUdd3JcJRZP7Obq6LvXLdUtDAkVmrG9hQ@mail.gmail.com>
Subject: Re: Bluetooth support in QEMU
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000bdd52805e65419bd"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=vaishu071998@gmail.com; helo=mail-yw1-x1131.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--000000000000bdd52805e65419bd
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

Thanks for prompt response.

We currently using the QEMU version as below,



*qemu-system-aarch64 -versionQEMU emulator version 4.2.1 (Debian
1:4.2-3ubuntu6.23)Copyright (c) 2003-2019 Fabrice Bellard and the QEMU
Project developers*

Could you please guide us with the, how to access the real bluetooth
devices in the guest

On Mon, Aug 15, 2022 at 9:40 PM Thomas Huth <thuth@redhat.com> wrote:

> On 15/08/2022 13.27, vaishu venkat wrote:
> > Hi team,
> >              We are currently required to use QEMU for virtualization of
> > customized application. The application requires Bluetooth and Wi-fi
> > support, as observed below warning,
> > *qemu-system-aarch64: -bt hci,host: warning: The bluetooth subsystem is
> > deprecated and will be removed soon. If the bluetooth subsystem is still
> > useful for you, please send a mail to qemu-devel@nongnu.org
> > <mailto:qemu-devel@nongnu.org> with your usecase.*
> >
> >   Could you please help us with the support of bluetooth in QEMU.
>
> Which version of QEMU are you using? Bluetooth support has been completely
> removed in QEMU v5.0.0 (which was released more than two years ago
> already)
> since nobody spoke up saying that they were still using the completely
> bit-rotten code. So sorry, but it's gone now and cannot be used anymore in
> recent versions.
>
> If you just need access to real bluetooth devices in the guest, you could
> try to passthrough a real bluetooth USB device to the guest instead.
>
>   HTH,
>    Thomas
>
>

--000000000000bdd52805e65419bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hi Thomas,<br><div><br><=
/div><div>Thanks for prompt response.</div><div><br></div><div>We currently=
 using the QEMU version as below,</div><div><b><br></b></div><div><b>qemu-s=
ystem-aarch64 -version<br>QEMU emulator version 4.2.1 (Debian 1:4.2-3ubuntu=
6.23)<br>Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project devel=
opers</b></div><div><br></div><div>Could you please guide us with the, how =
to access the real bluetooth devices in the guest<b><br></b></div></div></d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, Aug 15, 2022 at 9:40 PM Thomas Huth &lt;<a href=3D"mailto:thuth@=
redhat.com">thuth@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">On 15/08/2022 13.27, vaishu venkat wrote:<br>
&gt; Hi team,<br>
&gt;=C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 We are currently required to use QEMU for virtualization of <br>
&gt; customized application. The application requires Bluetooth and Wi-fi <=
br>
&gt; support, as observed below warning,<br>
&gt; *qemu-system-aarch64: -bt hci,host: warning: The bluetooth subsystem i=
s <br>
&gt; deprecated and will be removed soon. If the bluetooth subsystem is sti=
ll <br>
&gt; useful for you, please send a mail to <a href=3D"mailto:qemu-devel@non=
gnu.org" target=3D"_blank">qemu-devel@nongnu.org</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:qemu-devel@nongnu.org" target=3D"_blank">=
qemu-devel@nongnu.org</a>&gt; with your usecase.*<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Could you please help us with the support of bluetooth in =
QEMU.<br>
<br>
Which version of QEMU are you using? Bluetooth support has been completely =
<br>
removed in QEMU v5.0.0 (which was released more than two years ago already)=
 <br>
since nobody spoke up saying that they were still using the completely <br>
bit-rotten code. So sorry, but it&#39;s gone now and cannot be used anymore=
 in <br>
recent versions.<br>
<br>
If you just need access to real bluetooth devices in the guest, you could <=
br>
try to passthrough a real bluetooth USB device to the guest instead.<br>
<br>
=C2=A0 HTH,<br>
=C2=A0 =C2=A0Thomas<br>
<br>
</blockquote></div>

--000000000000bdd52805e65419bd--

