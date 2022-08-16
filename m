Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5B559525A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Aug 2022 08:06:52 +0200 (CEST)
Received: from localhost ([::1]:44780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNpj1-0001Ip-AC
	for lists+qemu-devel@lfdr.de; Tue, 16 Aug 2022 02:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaishu071998@gmail.com>)
 id 1oNpfr-00083L-Uu
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 02:03:36 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:36848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vaishu071998@gmail.com>)
 id 1oNpfp-0000T4-H2
 for qemu-devel@nongnu.org; Tue, 16 Aug 2022 02:03:34 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-332fc508d88so56041737b3.3
 for <qemu-devel@nongnu.org>; Mon, 15 Aug 2022 23:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=xv333n0nEL6iZafbOuioreY7iL7oCJT8BQRpi9JsJLA=;
 b=AR6cvDxOBSTBeI043Emt6AMyu5xGcgSdCykpUC4I2B9DB62vtgcvhu9G3LJittGnn0
 wNs2R7EzSFxnXOajMGo8fyqFuvEhyVErAypqE6SeGI2oihJbdOovh+vzjA4EldqVkTwU
 ePoEjBSTDY6zHdrKkBj1mSRPXPF1BOBM/dVwCiYm9RP46n0knQAADdFyIakNjcL2HWLb
 EFGGRNVvxmzBOF3A0Yadx2kf0zft9cpfQKyHNJKlz2xFmKbrgJYOuOGzYRQVyXxajTuT
 NzDQ1PSIWmIqjFgJDZoIBDnJFFWnykvBlsTgzQpKSudI61J7ERZqaeVcoptUkn3FFgvV
 aLIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=xv333n0nEL6iZafbOuioreY7iL7oCJT8BQRpi9JsJLA=;
 b=21xhzLDtfcWgrLCE8p+P1F2T6EjVxsZ0mBZJ97ZJmF5GLHqBh/2gMlQwIW+IJN5IUn
 JMOqU5J6PevIQqrqmdgvtNcBCrfw5Cc69h7sjxq0kkEoaso7SfwFIlRKkQ4UN9x9Ni5u
 nShee1e2bxYCMCKg6BKOqL44N6YY79Vcy3cODqT371L6QXcHiH6HzFAfCNOROLipctQl
 lc2tmrpP0+wV2PCxv8kdc1gowB3ftPZ9pBeLXqYaayEXWYvZcJPmVrtDxlzC6FLaht7n
 85v8UpQIJmyj5LMZVmLHidnO7P5IqtnpsS9NernSUC/DEF1UKTg51IeJ7NihYxn0Yizr
 pxiw==
X-Gm-Message-State: ACgBeo1qb+FUa5XCkRAnUcG9pwXgLORiWJX3JRoD2bJAmfFL11i/cMxM
 rlboTNxxiPvEjvZ9L5Lvdtp1A/P+OwCP1EKj+GU=
X-Google-Smtp-Source: AA6agR4rO/9FS5u7nHiTyOxCcKv/7gNfxUOVViUIbn4FXB1kc6zvPtxuv5dfgU82UTCY1a5SmA94Wkt/dYdsBXlazM4=
X-Received: by 2002:a0d:efc1:0:b0:32a:8e40:cd70 with SMTP id
 y184-20020a0defc1000000b0032a8e40cd70mr16084174ywe.83.1660629812289; Mon, 15
 Aug 2022 23:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAEcBaE1DOVtq+D1jh42ZO01guWo_zVRbFWoAOigpD2xm0YPSKQ@mail.gmail.com>
 <9e3a4a71-7d96-9fab-2d4e-4167b2f248f7@redhat.com>
 <CAEcBaE1fmko6BTgKXtUdd3JcJRZP7Obq6LvXLdUtDAkVmrG9hQ@mail.gmail.com>
 <5be99de3-f5d1-e850-f59f-13571a83fafb@redhat.com>
In-Reply-To: <5be99de3-f5d1-e850-f59f-13571a83fafb@redhat.com>
From: vaishu venkat <vaishu071998@gmail.com>
Date: Tue, 16 Aug 2022 11:33:20 +0530
Message-ID: <CAEcBaE3QQ-Q_tjqGnx94UYv+Unj2aXyo73RP4uA4JLq_SF57Og@mail.gmail.com>
Subject: Re: Bluetooth support in QEMU
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000010a44c05e655828a"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=vaishu071998@gmail.com; helo=mail-yw1-x1135.google.com
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

--00000000000010a44c05e655828a
Content-Type: text/plain; charset="UTF-8"

Thomas,

Sure will try with the USB Passthrough. Do you have any thoughts on
accessing the wireless interface inside the QEMU.

Thanks in Anticipation.




Regards,
Vaishnavi

On Tue, Aug 16, 2022 at 11:27 AM Thomas Huth <thuth@redhat.com> wrote:

> On 16/08/2022 06.22, vaishu venkat wrote:
> > Hi Thomas,
> >
> > Thanks for prompt response.
> >
> > We currently using the QEMU version as below,
> > *
> > *
> > *qemu-system-aarch64 -version
> > QEMU emulator version 4.2.1 (Debian 1:4.2-3ubuntu6.23)
> > Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers*
> >
> > Could you please guide us with the, how to access the real bluetooth
> devices
> > in the guest*
>
> Simply search for "QEMU USB passthrough" with your favourite search
> engine,
> there are plenty of help pages out there.
>
>   Thomas
>
>

--00000000000010a44c05e655828a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thomas,</div><div><br></div><div>Sure will try with t=
he USB Passthrough. Do you have any thoughts on accessing the wireless inte=
rface inside the QEMU.</div><div><br></div><div>Thanks in Anticipation.</di=
v><div><br></div><div><br></div><div><br></div><div><br></div><div>Regards,=
</div><div>Vaishnavi<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Aug 16, 2022 at 11:27 AM Thomas Huth =
&lt;<a href=3D"mailto:thuth@redhat.com">thuth@redhat.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On 16/08/2022 06.22=
, vaishu venkat wrote:<br>
&gt; Hi Thomas,<br>
&gt; <br>
&gt; Thanks for prompt response.<br>
&gt; <br>
&gt; We currently using the QEMU version as below,<br>
&gt; *<br>
&gt; *<br>
&gt; *qemu-system-aarch64 -version<br>
&gt; QEMU emulator version 4.2.1 (Debian 1:4.2-3ubuntu6.23)<br>
&gt; Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developer=
s*<br>
&gt; <br>
&gt; Could you please guide us with the, how to access the real bluetooth d=
evices <br>
&gt; in the guest*<br>
<br>
Simply search for &quot;QEMU USB passthrough&quot; with your favourite sear=
ch engine, <br>
there are plenty of help pages out there.<br>
<br>
=C2=A0 Thomas<br>
<br>
</blockquote></div>

--00000000000010a44c05e655828a--

