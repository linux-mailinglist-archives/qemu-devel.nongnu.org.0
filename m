Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C0D3641C6
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 14:36:43 +0200 (CEST)
Received: from localhost ([::1]:37904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYT8s-0000eY-7G
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 08:36:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lYT5i-0006h8-7s
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 08:33:26 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:45873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chouhan.shreyansh2702@gmail.com>)
 id 1lYT5g-0003q6-0t
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 08:33:25 -0400
Received: by mail-pl1-x633.google.com with SMTP id p16so13650344plf.12
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 05:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DEe6zdYgh7g283HFwY45ii6A2MPaobZVDaA+8dj7oNA=;
 b=cNbvxXt2mpRbTx7e3GjVg7o9VM/JGS35MAs2NNSOrJGbxseoSPtk7ckEz+YqRP4aWh
 rkGD2UbJHi7NQFgjKX92QtXChcQi7PaYKQDkW5zxyB57aIeAKRAclFR2VcvsFx9EnZYT
 RJn1FfY+jksBH/g9OFsRUZUA6F18GNmfyGtetcPJeqUGaxQXgWyDwCC7Hmk7ydUoIpG6
 GmxMPxgh6ojT0Q0X5GPXQF6034971E6Hz25PuAi6Y2jvYZn5IOC6yQoDNsWACreFrlt2
 wyVchL9Tb4gLtyhVzwqm5nhAAEllhN1EK4i6y3HXo/b5am5ml7j0wZ4eeju1EfvmU96G
 z5Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DEe6zdYgh7g283HFwY45ii6A2MPaobZVDaA+8dj7oNA=;
 b=q+3kJf72wXTHsfQSOc7bB4Y8jpZp4TZ1G/XszRgkD2CJ26+I9gdPFkg4dv1Dluy+cK
 WLvF8ky3FJsVPCXpBmdbmfLEnezg4oCf6b3eJZ4EDhgDG6RcTqbJCSXUNKKeOX/bxIQy
 HqTZkdYZHfmi49z5+SsINNvDyIsAfh9bt+es0E9wY55r0rmhur+xNBFRk+9qDpi47ztg
 CBLACxGLUGieImz2pI/vu4rKvaFGtg7xULmSYr/SV7TIcQ/YQVRgUUSVtIMF8vCnLDbh
 0y9vfd206xx6YJg3a++slKW+PFWyCT6p3QzU/03APOWYzsyjYI6mkvfr5J6q0N3L63h5
 1FUA==
X-Gm-Message-State: AOAM532dCVIRoQrY4C+u0x4/Q+tTy5I+T4/yWbY01Bg1rBrbRpi0RAfh
 OEsMgFJmEdyk+rrFFFmWgDFdGLXUtxwbkv0kB28=
X-Google-Smtp-Source: ABdhPJzyR1QNhb54MAvrwd8J9vdmmzibYms+3z8p+eg+wlyYTojBLBge6as6b7Fhg+xA6JPQNxnSQmB6+8h0aUsfxTQ=
X-Received: by 2002:a17:90a:20b:: with SMTP id
 c11mr25137510pjc.183.1618835602511; 
 Mon, 19 Apr 2021 05:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAAQ-SiMsrkDYzqqqRXONw_HCdORqssw-yL9dFGF32y7aG68iCQ@mail.gmail.com>
 <87v9blmf1x.fsf@linaro.org>
 <CAAQ-SiNRykBeMFRvjumJ1hbcT3vjuL2bcGU=RBLpksNJNGYm+Q@mail.gmail.com>
 <20210128112541.qjpve3qbjy46ofkk@sirius.home.kraxel.org>
 <CAAQ-SiOYkxRMw=OjnPb5tFD0aNb+ZQykLVfAjOGmwFa2Lzc26w@mail.gmail.com>
 <20210128163001.jjptft2t5fbdlvyn@sirius.home.kraxel.org>
 <CAAQ-SiOU5vkcVODOvBEf=PXzRDQbhzJC6ZU3wLpnRzhD58cuGg@mail.gmail.com>
 <CAAQ-SiMpZZ3yVCRjapCuResP38HFmtykFuLvpwH_23kEPg6v_w@mail.gmail.com>
 <20210215143934.sz6tdtoaaffkvla7@sirius.home.kraxel.org>
 <CAAQ-SiO_cTe3bQKDQ-tyeUU-DqTSf=1kRUcc+a=tktZb0ZhVog@mail.gmail.com>
 <20210416113252.km4w72vnruv6s2oi@sirius.home.kraxel.org>
 <CAAQ-SiOSw9u=yFrakjjjTvozpAW3nxhC+QeW7wswMSzSeZ_AVg@mail.gmail.com>
In-Reply-To: <CAAQ-SiOSw9u=yFrakjjjTvozpAW3nxhC+QeW7wswMSzSeZ_AVg@mail.gmail.com>
From: Shreyansh Chouhan <chouhan.shreyansh2702@gmail.com>
Date: Mon, 19 Apr 2021 18:03:11 +0530
Message-ID: <CAAQ-SiPqqbZnUFmOa=qYuLW-zC6kazg_n=u3p9YS80rnka3n=A@mail.gmail.com>
Subject: Re: Fwd: VirtioSound device emulation implementation
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000099abe05c0528942"
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=chouhan.shreyansh2702@gmail.com; helo=mail-pl1-x633.google.com
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

--000000000000099abe05c0528942
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Apr 2021 at 18:00, Shreyansh Chouhan <
chouhan.shreyansh2702@gmail.com> wrote:

>
> On Fri, 16 Apr 2021 at 17:02, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>>   Hi,
>>
>> > I learned that the callback passed in AUD_open_out, (lets call it the
>> write
>> > audio callback,)  is supposed to mix and write the
>> > buffers to HWVoiceOut. I have written that, the basic algorithm being:
>> >
>> > 1. Pop element from tx virtqueue.
>> > 2. Get the xfer header from the elem->out_sg (iov_to_buf(elem->out_sg,
>> 1,
>> > 0, &hdr, sizeof(hdr)))
>> > 3. Get the buffer from elem->out_sg (iov_to_buf(elem->out_sg, 1,
>> > sizeof(hdr), &mixbuf, period_bytes))
>> > 4. AUD_write the buffer
>>
>> AUD_write returns the number of bytes actually accepted.
>>
>> In case the audio backend consumed the complete buffer you can go ahead
>> as described.  Otherwise stop here and resume (try AUD_write() the
>> remaining data) when the callback is called again.
>>
> The callback that is supposed to write the buffers to HWVoiceOut has to
> do it such that it only writes the buffers for the streams that it was
> called by. The tx
> virtqueue is going to have buffers for all the streams. How do I handle
> this situation?
>
> Say, I have 3 output streams 0, 1 and 2, the callback was called on stream
> 0, how do
> I only play buffers corresponding to this stream? Is there a way by which
> I could iterate over
> the virtqeueue?
>
> If not then I should probably store the VirtQueueElements corresponding to
> a specific stream
> in the stream itself. I have to store the elements because I'd have to
> write to the response and
> mark these elements as used, (via virtqueue_push i think.)
>
> Also, is virtqueue a 'queue'? I remember reading in the specs that the
> device can consume
> the buffers in any order it prefers unless a feature bit is negotiated. So
> does virtqueue_pop
> always return the first element that entered the queue? (FIFO?)
>
> If it is FIFO, then I think the only way would be to iterate over the
> virtqueue. However if `virtqueu_pop`
> does return the last inserted element, I can use `handle_tx`
>
to get the last element inserted and then add it to the corresponding
stream.

Sorry for the incomplete mail. I don't know how I hit send.

>
>
>> No problem.  I'm likewise busy or on (easter) vacation at times and fail
>> to send timely answers (sorry for that).
>>
> Also that's fine, I just got a bit worried :)

I think once this `tx` part is done I'll have the pcm streams ready, and I
can send in patches by tonight
or tomorrow evening latest.

>
>> HTH & take care,
>>   Gerd
>>
>>

--000000000000099abe05c0528942
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 19 Apr 2021 at 18:00, Shreyan=
sh Chouhan &lt;<a href=3D"mailto:chouhan.shreyansh2702@gmail.com">chouhan.s=
hreyansh2702@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Fri, 16 Apr 2021 at 17:02, Gerd Hoffman=
n &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D"_blank">kraxel@redhat.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">=C2=A0 Hi,<br>
<br>
&gt; I learned that the callback passed in AUD_open_out, (lets call it the =
write<br>
&gt; audio callback,)=C2=A0 is supposed to mix and write the<br>
&gt; buffers to HWVoiceOut. I have written that, the basic algorithm being:=
<br>
&gt; <br>
&gt; 1. Pop element from tx virtqueue.<br>
&gt; 2. Get the xfer header from the elem-&gt;out_sg (iov_to_buf(elem-&gt;o=
ut_sg, 1,<br>
&gt; 0, &amp;hdr, sizeof(hdr)))<br>
&gt; 3. Get the buffer from elem-&gt;out_sg (iov_to_buf(elem-&gt;out_sg, 1,=
<br>
&gt; sizeof(hdr), &amp;mixbuf, period_bytes))<br>
&gt; 4. AUD_write the buffer<br>
<br>
AUD_write returns the number of bytes actually accepted.<br>
<br>
In case the audio backend consumed the complete buffer you can go ahead<br>
as described.=C2=A0 Otherwise stop here and resume (try AUD_write() the<br>
remaining data) when the callback is called again.<br></blockquote><div>The=
 callback that is supposed to write the buffers to HWVoiceOut has to</div><=
div>do it such that it only writes the buffers for the streams that it was =
called by. The tx</div><div>virtqueue is going to have buffers for all the =
streams. How do I handle this situation?<br><br></div><div>Say, I have 3 ou=
tput streams 0, 1 and 2, the callback was called on stream 0, how do</div><=
div>I only play buffers corresponding to this stream? Is there a way by whi=
ch I could iterate over</div><div>the virtqeueue? <br></div><div><br></div>=
<div>If not then I should probably store the VirtQueueElements correspondin=
g to a specific stream</div><div>in the stream itself. I have to store the =
elements because I&#39;d have to write to the response and</div><div>mark t=
hese elements as used, (via virtqueue_push i think.) <br></div><div><br></d=
iv><div>Also, is virtqueue a &#39;queue&#39;? I remember reading in the spe=
cs that the device can consume</div><div>the buffers in any order it prefer=
s unless a feature bit is negotiated. So does virtqueue_pop</div><div>alway=
s return the first element that entered the queue? (FIFO?) <br></div><div><=
br></div><div>If it is FIFO, then I think the only way would be to iterate =
over the virtqueue. However if `virtqueu_pop`</div><div>does return the las=
t inserted element, I can use `handle_tx`<br></div></div></div></blockquote=
><div>to get the last element inserted and then add it to the corresponding=
 stream.</div><div><br></div><div>Sorry for the incomplete mail. I don&#39;=
t know how I hit send. <br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div></div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
No problem.=C2=A0 I&#39;m likewise busy or on (easter) vacation at times an=
d fail<br>
to send timely answers (sorry for that).<br></blockquote></div></div></bloc=
kquote><div>Also that&#39;s fine, I just got a bit worried :)</div><div><br=
></div><div>I think once this `tx` part is done I&#39;ll have the pcm strea=
ms ready, and I can send in patches by tonight</div><div>or tomorrow evenin=
g latest.<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
HTH &amp; take care,<br>
=C2=A0 Gerd<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000099abe05c0528942--

