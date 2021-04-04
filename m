Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC35353849
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Apr 2021 15:56:54 +0200 (CEST)
Received: from localhost ([::1]:49326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lT3FF-0002lh-Bd
	for lists+qemu-devel@lfdr.de; Sun, 04 Apr 2021 09:56:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lT3Dt-0002HY-24
 for qemu-devel@nongnu.org; Sun, 04 Apr 2021 09:55:29 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:43639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lT3Dq-0006Yg-JO
 for qemu-devel@nongnu.org; Sun, 04 Apr 2021 09:55:28 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso4640083pjh.2
 for <qemu-devel@nongnu.org>; Sun, 04 Apr 2021 06:55:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rU3mLtijJgi0BZ9ilFZSxhZU/3FrAi+dgrJI80PwAjU=;
 b=TAOMw5t7dhRvYaqn/jOVpInEcR20g/n6E9NOW0MKDq2fh7hrSXlkeQJGXTUKxfbvXS
 TqOhly7/Qz9Ni+0ZQ3H7ZzRIyhMnDMrtaDLgzlr/IZp3PgoUbyPDGzvYszuR/GHs+b/h
 g59OnvMqhteRUzFwyKHGrJ6i95WOAQvuOfynZO6BcfHnnn589ndK99IMIpmR+2r7GaJg
 xKF5hmyiYjmPaYJ3+LrkTnuSSw1A/bWR813VeSG+Tp7w6+n5qRkH5dWJozKoiZ9yCd2f
 7vkBVcwdz58C0NDH7mZud0jlj+V90tUjZWE12f34KvJhAuGQmVhmWAgVRjZFXVcx9PYY
 0AOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rU3mLtijJgi0BZ9ilFZSxhZU/3FrAi+dgrJI80PwAjU=;
 b=STYm3MVfbjKXO1EPtfqn9SzBUxw4TmPKWI+gymJ2SnKAg6JAEbgbyOtv4JX8TOvof7
 SaVTaCosCr8UXZrhWixNUir0FivTt43TJe77eHhzGnUYVMQGFBDvFoH1a90OAoa5mzMo
 1WuhE6ZDqibUDoRVz+1RmiZlswCBoVF4vV7KJRgYzhN4P2X/u4t/uKYA7ws+WaUfOJ48
 nASx1UFgHpngIbRpU+1Qoy0jxPZuWC6eEnIHkYu4FSEaAFFYUrQc/g5+BSF3ORu7MBkS
 dmFYTfDKGJSgW501URZHL0WMtqCcUG8VKnLveRr/XEr2YbxtoCWYV7aQzVY8tQP+FO08
 vMCw==
X-Gm-Message-State: AOAM533sX1wOWmFNeekm8AJ7aNTkHVEmt1PwT3JRYJPPICR39wvo795T
 gTVgDByO2ICl1SJi1cfOQRQaZODKtvgCQK8w0wA=
X-Google-Smtp-Source: ABdhPJwTShN9NoMOv0paM0D8lnWoKhrYgsKv6PsfY/hnz+DNhr09B0EC5pWx+d/bE8+1X536ZUJhym/rwrYNHDZyDhw=
X-Received: by 2002:a17:902:d718:b029:e6:77c9:faeb with SMTP id
 w24-20020a170902d718b02900e677c9faebmr20864777ply.30.1617544523984; Sun, 04
 Apr 2021 06:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAAQ-SiPcBeGGgYcPHn7WSnz4jLAza+hE7tSMYSHJ-caC66D48A@mail.gmail.com>
 <CAAQ-SiPPk9EfrEq7ja0X2E7gq5x9dH9C3LBDNc4frNi8Ssijug@mail.gmail.com>
 <CAAQ-SiMsrkDYzqqqRXONw_HCdORqssw-yL9dFGF32y7aG68iCQ@mail.gmail.com>
 <87v9blmf1x.fsf@linaro.org>
 <CAAQ-SiNRykBeMFRvjumJ1hbcT3vjuL2bcGU=RBLpksNJNGYm+Q@mail.gmail.com>
 <20210128112541.qjpve3qbjy46ofkk@sirius.home.kraxel.org>
 <CAAQ-SiOYkxRMw=OjnPb5tFD0aNb+ZQykLVfAjOGmwFa2Lzc26w@mail.gmail.com>
 <20210128163001.jjptft2t5fbdlvyn@sirius.home.kraxel.org>
 <CAAQ-SiOU5vkcVODOvBEf=PXzRDQbhzJC6ZU3wLpnRzhD58cuGg@mail.gmail.com>
 <CAAQ-SiMpZZ3yVCRjapCuResP38HFmtykFuLvpwH_23kEPg6v_w@mail.gmail.com>
 <20210215143934.sz6tdtoaaffkvla7@sirius.home.kraxel.org>
In-Reply-To: <20210215143934.sz6tdtoaaffkvla7@sirius.home.kraxel.org>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Sun, 4 Apr 2021 19:25:12 +0530
Message-ID: <CAAQ-SiO_cTe3bQKDQ-tyeUU-DqTSf=1kRUcc+a=tktZb0ZhVog@mail.gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000c2b11805bf25ee9c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pj1-x1032.google.com
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c2b11805bf25ee9c
Content-Type: text/plain; charset="UTF-8"

Hey everyone!
I wrote code for PCM streams, which I'd like to discuss here. But since it
isn't
really complete yet, I thought I'd ask if I can copy paste the functions
that I want to ask
about and clear things that way.

For now I will just write my queries here and try to explain them as best
as I can.

Starting off with the get config function for pcm streams. Initially I
thought I
was supposed to store those configs in the VirtIOSound struct but then I
realized
these configurations should be queried from the backend and then be
presented to the driver/guest.

Now, the virtio sound card supports multiple formats and bit rates. If we
have fixed settings
turned on in the audiodev, the virtio sound card should support only a
single freq and frame rate
depending upon what was passed to the command line which we can get from
audio_get_pdo_out.
Is this correct?

Secondly if fixed settings was not set, what should the get config query
return with for supported
formats and bitrates? For now I am returning the formats defined in the
enum for the qemu
audio subsystem. I read in the man pages that if the mixing engine is off,
qemu assumes that
the backend supports the the multiple streams and channels that are
supported by the
virtual card. So should I return everything that the virito sound card can
support?

Thirdly, for the set params function, how do I change the params for an
SWVoiceOut stream? I could
not find a function for changing the audsettings for a stream. Should I
close the stream and
reopen it? Should I directly change the values in the pcm info struct
inside the stream?

I learned that the callback passed in AUD_open_out, (lets call it the write
audio callback,)  is supposed to mix and write the
buffers to HWVoiceOut. I have written that, the basic algorithm being:

1. Pop element from tx virtqueue.
2. Get the xfer header from the elem->out_sg (iov_to_buf(elem->out_sg, 1,
0, &hdr, sizeof(hdr)))
3. Get the buffer from elem->out_sg (iov_to_buf(elem->out_sg, 1,
sizeof(hdr), &mixbuf, period_bytes))
4. AUD_write the buffer
5. Initialize an VIRTIO_SND_S_OK response.
6. Write the response to elem->in_sg (iov_from_buf(elem->in_sg,
elem->in_num, 0, &resp, sizeof(resp)))
7. If tx queue is not empty go back to step 1.

I think I can send a period elapsed notification too after reading
period_bytes from the tx_virtqueue.

Will this be enough? From other sound card implementations I found out
about a lot of pointers which
I think were read and write pointers for the buffer. But since we are doing
this via a virtqueue, I don't
feel as if those pointers will be necessary.

Also I do not understand what the tx virtqueue handler is supposed to do. I
have written a handler
for the control queue. But I don't know what to do about the tx queue for
now. I thought it would be
something similar to what the callback does, it wouldn't play the audio
though.

Also since the callback does so many things, I do not understand how I can
implement the
pcm stream prepare, start, stop and release functions. The prepare function
is supposed to
allocate resources for the stream, but we already do that in the realize_fn
for the device
(AUD_open_out). So should I move that part out of the realize function and
into the prepare
stream function? I can then have the write audio callback called in the
start stream function.
The release function would just g_free the stream. This version would have
set_params store
the params of the streams in the device itself, or in a new device state
structure. Then when
prepare is called for a stream, we use the stored audsettings for
AUD_open_out. The start
function would simply call the virtio_snd_callback and write the audio
using AUD_write. I still
do not know what I would have to write in the stop stream function.

Another thing that I wanted to ask was about the hda codec. The
specification mentions that
the virtio sound card has a single codec device in it. I saw a lot of codec
device related code
in hda-codec.c which I think can be re-used for this. But there were no
headers that exposed
the code elsewhere. After reading through the hda specification I realized
that these function
group nids all come under the codec, so the jacks will be pin widgets
attached to this codec.
And the streams will be the streams associated with this codec. But I do
not understand how
I should go about implementing the codec, or if I need to implement it
considering the
already existing source from intel-hda and hda-codec.c.

Also sorry for the late response, I had fallen ill. Also I had to move
thrice in the past
month, so I couldn't really work on this a lot, and I didn't want to write
a mail without
having any work to show to you guys. Thanks a lot for being patient with
me. :)

Regards,
Shreyansh

--000000000000c2b11805bf25ee9c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hey everyone!<br></div><div>I wrote code for PCM stre=
ams, which I&#39;d like to discuss here. But since it isn&#39;t</div><div>r=
eally complete yet, I thought I&#39;d ask if I can copy paste the functions=
 that I want to ask</div><div>about and clear things that way. <br></div><d=
iv><br></div><div>For now I will just write my queries here and try to expl=
ain them as best as I can.</div><div><br></div><div>Starting off with the g=
et config function for pcm streams. Initially I thought I</div><div>was sup=
posed to store those configs in the VirtIOSound struct but then I realized<=
/div><div>these configurations should be queried from the backend and then =
be presented to the driver/guest.</div><div><br></div><div>Now, the virtio =
sound card supports multiple formats and bit rates. If we have fixed settin=
gs</div><div>turned on in the audiodev, the virtio sound card should suppor=
t only a single freq and frame rate</div><div>depending upon what was passe=
d to the command line which we can get from audio_get_pdo_out.</div><div>Is=
 this correct? <br></div><div><br></div><div>Secondly if fixed settings was=
 not set, what should the get config query return with for supported</div><=
div>formats and bitrates? For now I am returning the formats defined in the=
 enum for the qemu</div><div>audio subsystem. I read in the man pages that =
if the mixing engine is off, qemu assumes that</div><div>the backend suppor=
ts the the multiple streams and channels that are supported by the</div><di=
v>virtual card. So should I return everything that the virito sound card ca=
n support?</div><div><br></div><div><div>Thirdly, for the set params functi=
on, how do I change the params for an SWVoiceOut stream? I could</div><div>=
not find a function for changing the audsettings for a stream. Should I clo=
se the stream and</div><div>reopen it? Should I directly change the values =
in the pcm info struct inside the stream?</div></div><div><br></div><div>I =
learned that the callback passed in AUD_open_out, (lets call it the write a=
udio callback,)=C2=A0 is supposed to mix and write the</div><div>buffers to=
 HWVoiceOut. I have written that, the basic algorithm being:</div><div><br>=
</div><div>1. Pop element from tx virtqueue.</div><div>2. Get the xfer head=
er from the elem-&gt;out_sg (iov_to_buf(elem-&gt;out_sg, 1, 0, &amp;hdr, si=
zeof(hdr)))<br></div><div>3. Get the buffer from elem-&gt;out_sg (iov_to_bu=
f(elem-&gt;out_sg, 1, sizeof(hdr), &amp;mixbuf, period_bytes))</div><div>4.=
 AUD_write the buffer</div><div>5. Initialize an VIRTIO_SND_S_OK response.<=
/div><div>6. Write the response to elem-&gt;in_sg (iov_from_buf(elem-&gt;in=
_sg, elem-&gt;in_num, 0, &amp;resp, sizeof(resp)))</div><div>7. If tx queue=
 is not empty go back to step 1.</div><div><br></div><div>I think I can sen=
d a period elapsed notification too after reading period_bytes from the tx_=
virtqueue.<br></div><div><br></div><div>Will this be enough? From other sou=
nd card implementations I found out about a lot of pointers which</div><div=
>I think were read and write pointers for the buffer. But since we are doin=
g this via a virtqueue, I don&#39;t</div><div>feel as if those pointers wil=
l be necessary. <br></div><div><br></div><div>Also I do not understand what=
 the tx virtqueue handler is supposed to do. I have written a handler</div>=
<div>for the control queue. But I don&#39;t know what to do about the tx qu=
eue for now. I thought it would be<br></div><div>something similar to what =
the callback does, it wouldn&#39;t play the audio though.<br></div><div><br=
></div><div>Also since the callback does so many things, I do not understan=
d how I can implement the</div><div>pcm stream prepare, start, stop and rel=
ease functions. The prepare function is supposed to</div><div>allocate reso=
urces for the stream, but we already do that in the realize_fn for the devi=
ce</div><div>(AUD_open_out). So should I move that part out of the realize =
function and into the prepare</div><div>stream function? I can then have th=
e write audio callback called in the start stream function.</div><div>The r=
elease function would just g_free the stream. This version would have set_p=
arams store</div><div>the params of the streams in the device itself, or in=
 a new device state structure. Then when</div><div>prepare is called for a =
stream, we use the stored audsettings for AUD_open_out. The start</div><div=
>function would simply call the virtio_snd_callback and write the audio usi=
ng AUD_write. I still</div><div>do not know what I would have to write in t=
he stop stream function.<br></div><div><br></div><div>Another thing that I =
wanted to ask was about the hda codec. The specification mentions that</div=
><div>the virtio sound card has a single codec device in it. I saw a lot of=
 codec device related code</div><div>in hda-codec.c which I think can be re=
-used for this. But there were no headers that exposed</div><div>the code e=
lsewhere. After reading through the hda specification I realized that these=
 function</div><div>group nids all come under the codec, so the jacks will =
be pin widgets attached to this codec.</div><div>And the streams will be th=
e streams associated with this codec. But I do not understand how</div><div=
>I should go about implementing the codec, or if I need to implement it con=
sidering the</div><div>already existing source from intel-hda and hda-codec=
.c.</div><div><br></div><div>Also sorry for the late response, I had fallen=
 ill. Also I had to move thrice in the past</div><div>month, so I couldn&#3=
9;t really work on this a lot, and I didn&#39;t want to write a mail withou=
t</div><div>having any work to show to you guys. Thanks a lot for being pat=
ient with me. :)</div><div><br></div><div>Regards,</div><div>Shreyansh<br><=
/div><div><br></div></div>

--000000000000c2b11805bf25ee9c--

