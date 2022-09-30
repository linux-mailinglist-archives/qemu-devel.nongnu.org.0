Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE375F0290
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Sep 2022 04:06:56 +0200 (CEST)
Received: from localhost ([::1]:51490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oe5QV-0003u5-JH
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 22:06:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1oe5PL-0002Lx-6O
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 22:05:43 -0400
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930]:42644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1oe5PJ-0005Ml-Cv
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 22:05:42 -0400
Received: by mail-ua1-x930.google.com with SMTP id i17so1213184uaq.9
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 19:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Uej2jeiBA29GttESJFxtbQamkMVoYJjgiYi9kukk0EY=;
 b=RUy5HC4sWMg33CyKg9jbBIBf7ItFmCfOZ0QlsC8/p0eibbjxQ3SQ19UsiP6bZF9uMq
 x7P+n4TC2IBKOEbGcK8q+WC5I4CWEnj04xDaWVdQTojFrzCy79cTvzF/t3m17CdLVleP
 70Ah1GO4mONFlNqQ2KdfaX3JFfL7zRCKh3u5f92Ihu+SI2aAo48fzy9p2Xlr2u+cDI9Z
 ykzIZXOylp/xM0k13dOTY9c7kN4/xdCuGZh4yhK92EFe/crneoe9Qx3DMpcKn1zFMEA2
 9YKaPTdSHtz/XFLssqebkHRjyeilSGqpMnHk+3ql4U9W++StbS3Q7UcRYIupVBcCikZ2
 GDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Uej2jeiBA29GttESJFxtbQamkMVoYJjgiYi9kukk0EY=;
 b=rrTjAYETxWhkmiDtRLJzuXOQxItkplS5GJDuMLtPQhGJGDcI0USBlF09WSH0euiT61
 yAPXBBEWd6Y+VCWLkSvfELGa8CbFlfFhIKmQcyi3UcbmSzYKInRiWrdrXoU+hyDFlibU
 tPxOQfHqNxzoLUE796sS92DNGapo/80iH9+lkk6QJ+UJqN7ykKMq4j7g1+p2SvA5SlBa
 zLmjI4ZJcdAybul2OM4Ia8uDSeefBi9CpXQEYYWfs7XE4bYpdL8FKVln68gUVmnJE4DB
 5JFqYaX7cYnNQLxpQd27Up7NvVaF1c7in4Fk3djvphE5rUgXh31H1hyEtZ/5HsnkcMk1
 nv6w==
X-Gm-Message-State: ACrzQf0N0X2Qc8Gc2NrcQmCtYuglJVVCli2SPdMiZKshGvJGon65/6oN
 mMqjMsMJmtTJOnlTEo0oKoNWdLBiPJr9iIYhrdFHMA==
X-Google-Smtp-Source: AMsMyM607ZmwRVXeMYx6RnIZqbujBnIi5RWzrS4/IqNK3qwNTkmP5AuHz33KEDxfdzYdN57/DRm7HK2+dCD0mqAMhNI=
X-Received: by 2002:ab0:725a:0:b0:3cf:b399:773f with SMTP id
 d26-20020ab0725a000000b003cfb399773fmr3485078uap.110.1664503540201; Thu, 29
 Sep 2022 19:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220921234646.949273-1-venture@google.com>
 <CAFEAcA8f+JA4WKMwGFNxg7tRxTwL=RzDLgdJLrP8Dw_jB4XoRA@mail.gmail.com>
 <CACGkMEvMtAjGQVzwUgjD20Hb=Za8KmRanmp-FWrUQD8xS+7Pkw@mail.gmail.com>
 <CAO=notwnOKMd=n2qQC=iFX-cofeKP=ZUKX2VNXobMgXO64Y+sw@mail.gmail.com>
 <CAFEAcA97oHsQdk2fSq=umiUv8nNue0xCLtboRR2yPt_Gxh_zEg@mail.gmail.com>
 <CAO=notwsgvtZBLyWGu+PSnmHTrm6anakwFwoq3oBEJ-8nqPFaQ@mail.gmail.com>
 <CAO=notzN3E_OA-_jBvXsB8_LGbTXpE=G50RX8APbHHFN6eHE3A@mail.gmail.com>
 <CAFEAcA8_WM_-w7HDc+cRvvxZVEdatczsj18D3beN3+MUg7P3cA@mail.gmail.com>
In-Reply-To: <CAFEAcA8_WM_-w7HDc+cRvvxZVEdatczsj18D3beN3+MUg7P3cA@mail.gmail.com>
From: Patrick Venture <venture@google.com>
Date: Thu, 29 Sep 2022 19:05:29 -0700
Message-ID: <CAO=notyLkM1ZDL0QCCvv_hNZr74EEYO-PrBPZRP=3YLOvOj6uQ@mail.gmail.com>
Subject: Re: [PATCH] hw/net: npcm7xx_emc: set MAC in register space
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jason Wang <jasowang@redhat.com>,
 Havard Skinnemoen <hskinnemoen@google.com>, 
 CS20 KFTing <kfting@nuvoton.com>, qemu-arm <qemu-arm@nongnu.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Hao Wu <wuhaotsh@google.com>
Content-Type: multipart/alternative; boundary="0000000000003e17e305e9db6e79"
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=venture@google.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

--0000000000003e17e305e9db6e79
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 29, 2022 at 8:54 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 29 Sept 2022 at 16:28, Patrick Venture <venture@google.com> wrote:
> > On Mon, Sep 26, 2022 at 8:45 AM Patrick Venture <venture@google.com>
> wrote:
> >>> I think what Jason is suggesting is that that should depend on what
> >>> the real hardware does. On a physical board, if the guest sets the
> >>> MAC address, and then you power-cycle the hardware, does the MAC
> >>> that it set still persist after powercycle ? Does the guest writing
> >>> to these MAC registers correspond to writing to an EEPROM ?
> >>
> >>
> >> Thanks, Peter - we've reached out to the vendor off-list to seek out
> some details, I'll update this with a v2 when I get an answer.
>
> > "No, The EMC driver reset the MAC address registers during boot
> cycle/reset."
>
> OK, I guess that's clear enough. In a real full-software-stack
> setup is the MAC address setup usually done by a BIOS/firmware,
> or is it done by Linux ?
>

The MAC address is usually set up in u-boot or by linux.  The openbmc stack
currently doesn't actually read what the device thinks its mac address is,
but it could :)  It just sets it blindly.  We found this register issue
because we were debugging why the MAC address we were setting in the qemu
command line had no effect.  Turns out, per this patch, we weren't using
that value anywhere.  But even with that fixed, the firmware didn't care. :)


>
> > So in that case, we should disregard the value the user sets in
> > reset and use the value provided through Qemu.  Or, should we just
> > not allow Qemu to set the MAC address at all?
>
> I think that the behaviour for QEMU's model should be that
> on reset we should reset the MAC address registers to the
> user-provided value. That is, if the guest writes to the
> MAC address registers then that does have an effect, but
> only until the next reset.
>
> That gives you reasonably plausible behaviour for both:
> (1) you're emulating some guest that always sets up its
> own MAC address when it starts up (eg if it's done by
> some BIOS-level code that you're running in the guest)
> (2) you're booting a guest kernel directly that expects
> that the firmware/BIOS/whatever has already set up
> a MAC address -- then the MAC address provided by QEMU/the
> user fills that role
>
> More concretely:
>  * on reset, set the emc->regs[] fields from emc->conf.macaddr
>  * when using the MAC address, always use emc->regs[], never
>    emc->conf.macaddr
>  * to handle the guest writes to the MAC registers, set
>    emc->regs[], but not emc->conf.macaddr
>
> Thanks! That actually made it much easier to parse what you wanted to
match the behavior :)


> Assuming that doesn't break your existing booting workloads,
> of course :-)
>
> thanks
> -- PMM
>

--0000000000003e17e305e9db6e79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 29, 2022 at 8:54 AM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Thu, 29 Sept 2022 at 16:28, Patrick Venture &lt;<a href=3D"mailto:=
venture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt; On Mon, Sep 26, 2022 at 8:45 AM Patrick Venture &lt;<a href=3D"mailto:=
venture@google.com" target=3D"_blank">venture@google.com</a>&gt; wrote:<br>
&gt;&gt;&gt; I think what Jason is suggesting is that that should depend on=
 what<br>
&gt;&gt;&gt; the real hardware does. On a physical board, if the guest sets=
 the<br>
&gt;&gt;&gt; MAC address, and then you power-cycle the hardware, does the M=
AC<br>
&gt;&gt;&gt; that it set still persist after powercycle ? Does the guest wr=
iting<br>
&gt;&gt;&gt; to these MAC registers correspond to writing to an EEPROM ?<br=
>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Thanks, Peter - we&#39;ve reached out to the vendor off-list to se=
ek out some details, I&#39;ll update this with a v2 when I get an answer.<b=
r>
<br>
&gt; &quot;No, The EMC driver reset the MAC address registers during boot c=
ycle/reset.&quot;<br>
<br>
OK, I guess that&#39;s clear enough. In a real full-software-stack<br>
setup is the MAC address setup usually done by a BIOS/firmware,<br>
or is it done by Linux ?<br></blockquote><div><br></div><div>The MAC addres=
s is usually set up in u-boot or by linux.=C2=A0 The openbmc stack currentl=
y doesn&#39;t actually read what the device thinks its mac address is, but =
it could :)=C2=A0 It just sets it blindly.=C2=A0 We found this register iss=
ue because we were debugging why the MAC address we were setting in the qem=
u command line had no effect.=C2=A0 Turns out, per this patch, we weren&#39=
;t using that value anywhere.=C2=A0 But even with that fixed, the firmware =
didn&#39;t care. :)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
&gt; So in that case, we should disregard the value the user sets in<br>
&gt; reset and use the value provided through Qemu.=C2=A0 Or, should we jus=
t<br>
&gt; not allow Qemu to set the MAC address at all?<br>
<br>
I think that the behaviour for QEMU&#39;s model should be that<br>
on reset we should reset the MAC address registers to the<br>
user-provided value. That is, if the guest writes to the<br>
MAC address registers then that does have an effect, but<br>
only until the next reset.<br>
<br>
That gives you reasonably plausible behaviour for both:<br>
(1) you&#39;re emulating some guest that always sets up its<br>
own MAC address when it starts up (eg if it&#39;s done by<br>
some BIOS-level code that you&#39;re running in the guest)<br>
(2) you&#39;re booting a guest kernel directly that expects<br>
that the firmware/BIOS/whatever has already set up<br>
a MAC address -- then the MAC address provided by QEMU/the<br>
user fills that role<br>
<br>
More concretely:<br>
=C2=A0* on reset, set the emc-&gt;regs[] fields from emc-&gt;conf.macaddr<b=
r>
=C2=A0* when using the MAC address, always use emc-&gt;regs[], never<br>
=C2=A0 =C2=A0emc-&gt;conf.macaddr<br>
=C2=A0* to handle the guest writes to the MAC registers, set<br>
=C2=A0 =C2=A0emc-&gt;regs[], but not emc-&gt;conf.macaddr<br>
<br></blockquote><div>Thanks! That actually made it much easier to parse wh=
at you wanted to match the behavior :)</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
Assuming that doesn&#39;t break your existing booting workloads,<br>
of course :-)<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--0000000000003e17e305e9db6e79--

