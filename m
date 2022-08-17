Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA05C59689A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 07:29:15 +0200 (CEST)
Received: from localhost ([::1]:37634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOBcA-0000bl-Hc
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 01:29:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vaishu071998@gmail.com>)
 id 1oOBaR-0007fS-P0
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 01:27:28 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:34344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <vaishu071998@gmail.com>)
 id 1oOBaQ-000481-5B
 for qemu-devel@nongnu.org; Wed, 17 Aug 2022 01:27:27 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-333b049f231so92894327b3.1
 for <qemu-devel@nongnu.org>; Tue, 16 Aug 2022 22:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc; bh=cWbv8i6s9c0/RIDXHyl58PZl4jLVug3vpGp7nwdqBxE=;
 b=FCH9wMK4VBubPuSvCxIlGDTgoqG2bFsfgWQnjN5+dFkAmziGTQOIGezGd+YYh2ji2Q
 WAW4EGmAfs1eogvi0IJSaP54e7pqDc45EZG0y/yeg7PbBxl8D8C2iqYoKc+E6pVij3El
 qKYIW0U5FmHHml0RLO4vz4XZMSM1lXke8DcPPNOqB6mSnquiCYaSgIWEt5Cb1abIs4+k
 oKS/zcMgALgNfVBBhERsaLLRspxyq7pTh/9TuGtDtxzNVq4By3Dp4NT0vXDXr8A9cEwI
 UtZGyRerQ85TDDXy+0MmnlIyJgARLSh5VWRNlTJ6ow9MjP0XxK7XDNTUwMzz4L3KdpMd
 Vunw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc;
 bh=cWbv8i6s9c0/RIDXHyl58PZl4jLVug3vpGp7nwdqBxE=;
 b=7gv5d3MrclESTLJy/XhuJfcjiFnbdxgTYsgSjdV5i9oLr/7bB0Ld3WpPEfDCqJvyKb
 ttM4P9mvCwC6CN+8h35/eVvAwvSuenA4F68m70tsc/TmGEb4B+nKLm8bGKuMEgjlW/hU
 W8ENjYR8GX456DMHmhui1KbxopY3ybaLmslz0YJVO2DYNsr0VkyJk2jShLsA8Sn50Q7Q
 GZFUpmdRg/A7Wyn06qrgUvrho19R875bsKxCpbiXF/B2wrx7+l9/JpS0l/TWZA3Pwgzx
 cDlQYNUGGxW0Xwj1+WZPzX4BpOaWXuvDOm4NbUuA/WwZgb2TBcdKEifOHnEEV3MXDWqp
 lcRw==
X-Gm-Message-State: ACgBeo0LOpt0ksRVvF9mBt+jpz9Jg2Tk4+cemoCQq1Kn9tWuuRoa20aA
 w6sdG2Si3st4c6RDkr2xMX7aEq2CZoszh6ZYMp8=
X-Google-Smtp-Source: AA6agR7kIAtNH57iqj+NvHTVkwhTNrqZn+X9gzEFJtBrKoeH7rEXSsW9zX1zjmEhVxhTHV9iByat5PqwO6jTCr0I5xY=
X-Received: by 2002:a05:6902:244:b0:66f:8383:b51c with SMTP id
 k4-20020a056902024400b0066f8383b51cmr19537738ybs.471.1660714044571; Tue, 16
 Aug 2022 22:27:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAEcBaE1DOVtq+D1jh42ZO01guWo_zVRbFWoAOigpD2xm0YPSKQ@mail.gmail.com>
 <9e3a4a71-7d96-9fab-2d4e-4167b2f248f7@redhat.com>
 <CAEcBaE1fmko6BTgKXtUdd3JcJRZP7Obq6LvXLdUtDAkVmrG9hQ@mail.gmail.com>
 <5be99de3-f5d1-e850-f59f-13571a83fafb@redhat.com>
 <CAEcBaE3QQ-Q_tjqGnx94UYv+Unj2aXyo73RP4uA4JLq_SF57Og@mail.gmail.com>
In-Reply-To: <CAEcBaE3QQ-Q_tjqGnx94UYv+Unj2aXyo73RP4uA4JLq_SF57Og@mail.gmail.com>
From: vaishu venkat <vaishu071998@gmail.com>
Date: Wed, 17 Aug 2022 10:57:12 +0530
Message-ID: <CAEcBaE2mfwVsXbhiya-RNRZnxq92NLuh3CwFoaSKUOktzwXA=w@mail.gmail.com>
Subject: Re: Bluetooth support in QEMU
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000b3433605e6691e91"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=vaishu071998@gmail.com; helo=mail-yw1-x1133.google.com
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

--000000000000b3433605e6691e91
Content-Type: text/plain; charset="UTF-8"

Hi Team,

Could you have any thoughts or solutions for accessing the wireless adapter
interface inside the QEMU.


Thanks and regards,
Vaishnavi

On Tue, Aug 16, 2022 at 11:33 AM vaishu venkat <vaishu071998@gmail.com>
wrote:

> Thomas,
>
> Sure will try with the USB Passthrough. Do you have any thoughts on
> accessing the wireless interface inside the QEMU.
>
> Thanks in Anticipation.
>
>
>
>
> Regards,
> Vaishnavi
>
> On Tue, Aug 16, 2022 at 11:27 AM Thomas Huth <thuth@redhat.com> wrote:
>
>> On 16/08/2022 06.22, vaishu venkat wrote:
>> > Hi Thomas,
>> >
>> > Thanks for prompt response.
>> >
>> > We currently using the QEMU version as below,
>> > *
>> > *
>> > *qemu-system-aarch64 -version
>> > QEMU emulator version 4.2.1 (Debian 1:4.2-3ubuntu6.23)
>> > Copyright (c) 2003-2019 Fabrice Bellard and the QEMU Project developers*
>> >
>> > Could you please guide us with the, how to access the real bluetooth
>> devices
>> > in the guest*
>>
>> Simply search for "QEMU USB passthrough" with your favourite search
>> engine,
>> there are plenty of help pages out there.
>>
>>   Thomas
>>
>>

--000000000000b3433605e6691e91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Team,</div><div><br></div><div>Could you have any =
thoughts or solutions for accessing the wireless adapter interface inside t=
he QEMU.=C2=A0</div><div><br></div><div><br></div><div>Thanks and regards,<=
/div><div>Vaishnavi<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Tue, Aug 16, 2022 at 11:33 AM vaishu venka=
t &lt;<a href=3D"mailto:vaishu071998@gmail.com">vaishu071998@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div>Thomas,</div><div><br></div><div>Sure will try with the US=
B Passthrough. Do you have any thoughts on accessing the wireless interface=
 inside the QEMU.</div><div><br></div><div>Thanks in Anticipation.</div><di=
v><br></div><div><br></div><div><br></div><div><br></div><div>Regards,</div=
><div>Vaishnavi<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Tue, Aug 16, 2022 at 11:27 AM Thomas Huth &lt;<=
a href=3D"mailto:thuth@redhat.com" target=3D"_blank">thuth@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 16/=
08/2022 06.22, vaishu venkat wrote:<br>
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
</blockquote></div>

--000000000000b3433605e6691e91--

