Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 143054E3283
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 23:01:47 +0100 (CET)
Received: from localhost ([::1]:40666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWQ5w-0002fi-4u
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 18:01:44 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1nWQ3o-0001gQ-Ph
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:59:32 -0400
Received: from [2607:f8b0:4864:20::a33] (port=43779
 helo=mail-vk1-xa33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1nWQ3m-0005bu-VP
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:59:32 -0400
Received: by mail-vk1-xa33.google.com with SMTP id w189so190116vke.10
 for <qemu-devel@nongnu.org>; Mon, 21 Mar 2022 14:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gZ7Nr50TObh0E4s+KWOaMZF+1hdJ4QbQLHWRvZ43u7s=;
 b=XhybpOUrP1dQ17N/YrkOGPyTcTZqfAJ/7BCieDUEoGUYkSmd0dBQr6dItI/VH5JuSO
 +G7tAM8Ww31NQ9GgR8afambNhJAJ3aurbQU38HNXpOH3vtllapUVGLQWikoFQIauAEUK
 GSOd2LP+/QmEvuEcQAMieFzvDbbfFZaBGklwqpIYLDm6avg0dgirYf/8mjFIpMo+HReQ
 iTn9S+hIs+utw5gJNT0YVgV1llngSQ8ddMcqbs/hWYfWGDrZmQfbr+bcRhpLIDI1txS4
 ug3cA6g/Shjm2zlLWVqAtXThRS6ChKZQuCi0/1i7uV6oGmOk4Wtyii88v/N1El8lQSEz
 bBJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gZ7Nr50TObh0E4s+KWOaMZF+1hdJ4QbQLHWRvZ43u7s=;
 b=STyoB/qAyOtp63UI91CxehVaOQutUKS+pNfXX1CnUEEkvEBus1SBcZZZoGTpQLS6hb
 VXIMV3FcUQ4MMQn69r1yue3nA/mphrLI4YWKV8IQ030cDj143B/HUyVFBBurnANUBpe/
 vfgBcPCPVGZRWHzb9Yw8D0xAe837GpNSHWUnJbfymGPuCd10bgnP8LN3zUOnep8ht0I4
 QD31nr4TmMxnZby+ZjvH7f4s8EhPQU3LqzdWaFIDNqL/E1HhCCrJw098Aug2wemHbYnF
 cOBt8bfCHrJlcinH9JF85BtP5uJxlUmlnc4j/P8uyH7aZSqq6mOkRWm1i+uV9b0NAuW7
 7sAg==
X-Gm-Message-State: AOAM533F/Yn/FWWuHR7PZyjLxe7FGZdPQppDpn3X11NFueU+HbSUmvH0
 ellWag8fnWjPI2Ung3e1Gzuw2PLQ2dxvHjH18Rv66AUbVT8=
X-Google-Smtp-Source: ABdhPJz3wd8prfDcGF1j8QWia7ekAo0fnv9YtJYLgFAo3+8pFOvQn40NQ54O/MHKoZ7ApaWIJgu1cXPTCYkdpdMqyDU=
X-Received: by 2002:a1f:b40e:0:b0:33e:5f4a:317e with SMTP id
 d14-20020a1fb40e000000b0033e5f4a317emr8802593vkf.17.1647899969794; Mon, 21
 Mar 2022 14:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220201100940.47788-1-david@redhat.com>
 <18ed54d6-c4e2-404a-f68b-002a67546445@redhat.com>
 <CAPan3WqFr1wtiZbmtiE8FUqPtW3tGcYRK648MVOzf1m+L_795g@mail.gmail.com>
In-Reply-To: <CAPan3WqFr1wtiZbmtiE8FUqPtW3tGcYRK648MVOzf1m+L_795g@mail.gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Mon, 21 Mar 2022 22:59:18 +0100
Message-ID: <CAPan3WroBRWwgUb+u36HmFwU5OfBgfvVh45id4YcptxBGtMT4Q@mail.gmail.com>
Subject: Re: [PATCH] memory: Make memory_region_readd_subregion() properly
 handle mapped aliases
To: Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="00000000000053378a05dac19ca0"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-vk1-xa33.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000053378a05dac19ca0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Paolo, Peter,

With the 7.0 release approaching, just a friendly reminder that the patch
in this thread is not yet in master
(2058fdbe81e2985c226a026851dd26b146d3395c).
It's currently preventing the orangepi-pc board to boot SD card images from
U-Boot, terminating with an assert:
   https://www.mail-archive.com/qemu-devel@nongnu.org/msg865382.html

If it helps, I did a full build with David's patch and re-ran all the
boot_linux_console.py tests and all passed OK.

Would it be possible to get this in before the upcoming release?

Thanks in advance,
Niek

On Mon, Feb 28, 2022 at 9:03 PM Niek Linnenbank <nieklinnenbank@gmail.com>
wrote:

> Hi Paolo,
>
> Thanks for queing this patch. I did not yet see it appear in master. Do
> you know when we can expect to see it?
>
> Regards,
> Niek
>
> On Tue, Feb 1, 2022 at 11:51 AM Paolo Bonzini <pbonzini@redhat.com> wrote=
:
>
>> On 2/1/22 11:09, David Hildenbrand wrote:
>> > memory_region_readd_subregion() wants to readd a region by first
>> > removing it and then readding it. For readding, it doesn't use one of
>> > the memory_region_add_*() variants, which is why fail to re-increment
>> the
>> > mr->mapped_via_alias counters, resulting in the
>> > assert(alias->mapped_via_alias >=3D 0) in memory_region_del_subregion(=
)
>> > triggering the next time we call memory_region_readd_subregion().
>> >
>> > Fix it by using memory_region_add_subregion_common() for readding the
>> > region.
>> >
>> > Reported-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>> > Fixes: 5ead62185d23 ("memory: Make memory_region_is_mapped() succeed
>> when mapped via an alias")
>> > Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>> > Cc: Paolo Bonzini <pbonzini@redhat.com>
>> > Cc: Peter Xu <peterx@redhat.com>
>> > Cc: "Philippe Mathieu-Daud=C3=A9" <f4bug@amsat.org>
>> > Signed-off-by: David Hildenbrand <david@redhat.com>
>> > ---
>> >   softmmu/memory.c | 3 +--
>> >   1 file changed, 1 insertion(+), 2 deletions(-)
>> >
>> > diff --git a/softmmu/memory.c b/softmmu/memory.c
>> > index 678dc62f06..76bb1677fe 100644
>> > --- a/softmmu/memory.c
>> > +++ b/softmmu/memory.c
>> > @@ -2626,8 +2626,7 @@ static void
>> memory_region_readd_subregion(MemoryRegion *mr)
>> >           memory_region_transaction_begin();
>> >           memory_region_ref(mr);
>> >           memory_region_del_subregion(container, mr);
>> > -        mr->container =3D container;
>> > -        memory_region_update_container_subregions(mr);
>> > +        memory_region_add_subregion_common(container, mr->addr, mr);
>> >           memory_region_unref(mr);
>> >           memory_region_transaction_commit();
>> >       }
>>
>> Queued, thanks.
>>
>> Paolo
>>
>
>
> --
> Niek Linnenbank
>
>

--=20
Niek Linnenbank

--00000000000053378a05dac19ca0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Paolo, Peter,</div><div><br></div><div>With the 7.=
0 release approaching, just a friendly reminder that the patch in this thre=
ad is not yet in master (2058fdbe81e2985c226a026851dd26b146d3395c).</div><d=
iv>It&#39;s currently preventing the orangepi-pc board to boot SD card imag=
es from U-Boot, terminating with an assert:</div><div>=C2=A0=C2=A0 <a href=
=3D"https://www.mail-archive.com/qemu-devel@nongnu.org/msg865382.html">http=
s://www.mail-archive.com/qemu-devel@nongnu.org/msg865382.html</a></div><div=
><br></div><div>If it helps, I did a full build with David&#39;s patch and =
re-ran all the boot_linux_console.py tests and all passed OK.</div><div><br=
></div><div>Would it be possible to get this in before the upcoming release=
?</div><div><br></div><div>Thanks in advance,</div><div>Niek<br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mo=
n, Feb 28, 2022 at 9:03 PM Niek Linnenbank &lt;<a href=3D"mailto:nieklinnen=
bank@gmail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
<div>Hi Paolo,</div><div><br></div><div>Thanks for queing this patch. I did=
 not yet see it appear in master. Do you know when we can expect to see it?=
</div><div><br></div><div>Regards,</div><div>Niek<br></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 1, 2=
022 at 11:51 AM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" ta=
rget=3D"_blank">pbonzini@redhat.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">On 2/1/22 11:09, David Hildenbrand wrote=
:<br>
&gt; memory_region_readd_subregion() wants to readd a region by first<br>
&gt; removing it and then readding it. For readding, it doesn&#39;t use one=
 of<br>
&gt; the memory_region_add_*() variants, which is why fail to re-increment =
the<br>
&gt; mr-&gt;mapped_via_alias counters, resulting in the<br>
&gt; assert(alias-&gt;mapped_via_alias &gt;=3D 0) in memory_region_del_subr=
egion()<br>
&gt; triggering the next time we call memory_region_readd_subregion().<br>
&gt; <br>
&gt; Fix it by using memory_region_add_subregion_common() for readding the<=
br>
&gt; region.<br>
&gt; <br>
&gt; Reported-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmai=
l.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt; Fixes: 5ead62185d23 (&quot;memory: Make memory_region_is_mapped() succ=
eed when mapped via an alias&quot;)<br>
&gt; Tested-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.=
com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt; Cc: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D=
"_blank">pbonzini@redhat.com</a>&gt;<br>
&gt; Cc: Peter Xu &lt;<a href=3D"mailto:peterx@redhat.com" target=3D"_blank=
">peterx@redhat.com</a>&gt;<br>
&gt; Cc: &quot;Philippe Mathieu-Daud=C3=A9&quot; &lt;<a href=3D"mailto:f4bu=
g@amsat.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
&gt; Signed-off-by: David Hildenbrand &lt;<a href=3D"mailto:david@redhat.co=
m" target=3D"_blank">david@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0softmmu/memory.c | 3 +--<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/softmmu/memory.c b/softmmu/memory.c<br>
&gt; index 678dc62f06..76bb1677fe 100644<br>
&gt; --- a/softmmu/memory.c<br>
&gt; +++ b/softmmu/memory.c<br>
&gt; @@ -2626,8 +2626,7 @@ static void memory_region_readd_subregion(Memory=
Region *mr)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_transaction_begi=
n();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_ref(mr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_del_subregion(co=
ntainer, mr);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 mr-&gt;container =3D container;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_update_container_subregions=
(mr);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_add_subregion_common(contai=
ner, mr-&gt;addr, mr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_unref(mr);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_transaction_comm=
it();<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
Queued, thanks.<br>
<br>
Paolo<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><div>Niek Linnenbank<br><br></div></div></div>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><div>Niek Linnenbank<br><br></div></div></div>

--00000000000053378a05dac19ca0--

