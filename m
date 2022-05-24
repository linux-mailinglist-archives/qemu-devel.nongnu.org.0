Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3613753271A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 May 2022 12:09:33 +0200 (CEST)
Received: from localhost ([::1]:42688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntRTn-0003lX-P4
	for lists+qemu-devel@lfdr.de; Tue, 24 May 2022 06:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntRMb-0008IY-01
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:02:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1ntRMY-0002E8-DY
 for qemu-devel@nongnu.org; Tue, 24 May 2022 06:02:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653386521;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u7t9PrbS5xnpy7o6Chd2rXC87BmInMmmfo6hj556i1Y=;
 b=RWtbHnfQthM/yKD4O4H4D6S6uuAw3w2rn8CI1ycqDYwC7xdyzwrwV73drrO3t136b2oScO
 tj+5B+A++yW0kpiRKSJV2Qo3voKtg2hG3LMVEZRqwxe2lfysEH38LYM/6ofyetxkEGX32B
 ICxz53bj96b3oY3OKdBwKYw/5ZmPJ0s=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-453-YrzfnZ9YMSCujKKj92RQtw-1; Tue, 24 May 2022 06:02:00 -0400
X-MC-Unique: YrzfnZ9YMSCujKKj92RQtw-1
Received: by mail-yb1-f197.google.com with SMTP id
 o7-20020a256b47000000b0064ddc3bea70so15378879ybm.4
 for <qemu-devel@nongnu.org>; Tue, 24 May 2022 03:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u7t9PrbS5xnpy7o6Chd2rXC87BmInMmmfo6hj556i1Y=;
 b=iRT7KVVS9ZKlUCCe49kBZWqDdf3MFaEE3GuOOZqxCshWsjU/vayv/j6m42sHZTVd4h
 d0Z8wIiamSURcqqlOh3jKnQYpLmX0BToKWpJSYI7IvGSjvIAnmct/6unnTNdl9mcFdSa
 wcR3SIYY/otKAX0EUshyBrWZO3WOQkBVbuz/f1YWP/j3wbTXDsdU+Uo7xHbosRKrk8qX
 qJzqs24CTToiqfg6GMeoslx7AoEWiP/GJQTBj5UldFi7abX5B8oORL4GUIdmPD7evgZ9
 V12yIMPDSs2Aolgj32hWNkpXdp0lLR+mjzSrTM2xDM7cmNSf+f1XKmwl9nLqfLcn3bkt
 PiKQ==
X-Gm-Message-State: AOAM533GiB2LaqtYJnPVWVuUAhHUAVuDTQrBpLUJD+7e3m0alFmZtgtg
 7ylxSOQEAi6i6ieIQe1v2cJZ3ryNXgZ96t4DIQJNRqZzf+FGxsHohtrmSpxlJZxRRgCypaNTWB0
 89bcctqgGaGf0I+pHIluMzKe7deXhJDA=
X-Received: by 2002:a25:7e84:0:b0:650:10e0:87bd with SMTP id
 z126-20020a257e84000000b0065010e087bdmr5744051ybc.257.1653386519300; 
 Tue, 24 May 2022 03:01:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzT3hzrfodNnuqcphg+TabHVolONMhbM8MiezV++lPB5+bN+AVPESl8O2crUWIQWmzsHt7AXrlrAWujHDglLw=
X-Received: by 2002:a25:7e84:0:b0:650:10e0:87bd with SMTP id
 z126-20020a257e84000000b0065010e087bdmr5744035ybc.257.1653386519084; Tue, 24
 May 2022 03:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220523194111.827805-1-kkostiuk@redhat.com>
 <20220523194111.827805-3-kkostiuk@redhat.com>
 <541f46cf-fc45-f7bb-e121-2aad216e11d5@linaro.org>
 <CAPMcbCq7fzubG4ej7p164vwQkCMChjWBubx27R=kVxukWDhuBg@mail.gmail.com>
In-Reply-To: <CAPMcbCq7fzubG4ej7p164vwQkCMChjWBubx27R=kVxukWDhuBg@mail.gmail.com>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Tue, 24 May 2022 13:01:48 +0300
Message-ID: <CAPMcbCqeQ_7YuJg+eS9Qqtq9ptRb57_wfT=jGOuHYtx64M5azA@mail.gmail.com>
Subject: Re: [PULL 2/3] qga-win32: Add support for NVME but type
To: Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: QEMU <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000002594ff05dfbf0cfd"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000002594ff05dfbf0cfd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard and Marc-Andr=C3=A9

I looked into the compilation problem and have 2 solutions:
1. We can add some conditions to the win2qemu definition and
skip NVME support when old mingw-headers are used.
2. We can bump the version of the Fedora docker image to 36 or 37
that is used for cross-compilation tests.

I think the second option is more valuable because we remove
pregenerated qga-vss.tlb file and now we can check VSS build only
at Fedora 37.

What do you think?

Best Regards,
Konstantin Kostiuk.


On Tue, May 24, 2022 at 12:26 PM Konstantin Kostiuk <kkostiuk@redhat.com>
wrote:

> Thanks for the report. I will think about how to fix the build with old
> mingw-headers.
> BusTypeNvme and BusTypeSpaces were added to mingw-headers v 9.0.0
>
>
> On Mon, May 23, 2022 at 11:55 PM Richard Henderson <
> richard.henderson@linaro.org> wrote:
>
>> On 5/23/22 12:41, Konstantin Kostiuk wrote:
>> > Bus type spaces (Indicates a storage spaces bus) is not
>> > supported, so return it as unknown.
>> >
>> > Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
>> > Message-Id: <20220520201401.706630-1-kkostiuk@redhat.com>
>> > Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>> > Signed-off-by: Konstantin Kostiuk <kkostiuk@redhat.com>
>> > ---
>> >   qga/commands-win32.c | 5 +++++
>> >   1 file changed, 5 insertions(+)
>> >
>> > diff --git a/qga/commands-win32.c b/qga/commands-win32.c
>> > index dcdeb76a68..36f94c0f9c 100644
>> > --- a/qga/commands-win32.c
>> > +++ b/qga/commands-win32.c
>> > @@ -490,6 +490,11 @@ static GuestDiskBusType win2qemu[] =3D {
>> >   #if (_WIN32_WINNT >=3D 0x0601)
>> >       [BusTypeVirtual] =3D GUEST_DISK_BUS_TYPE_VIRTUAL,
>> >       [BusTypeFileBackedVirtual] =3D
>> GUEST_DISK_BUS_TYPE_FILE_BACKED_VIRTUAL,
>> > +    /*
>> > +     * BusTypeSpaces currently is not suported
>> > +     */
>> > +    [BusTypeSpaces] =3D GUEST_DISK_BUS_TYPE_UNKNOWN,
>> > +    [BusTypeNvme] =3D GUEST_DISK_BUS_TYPE_NVME,
>> >   #endif
>> >   };
>> >
>>
>> Build fails:
>>
>> ../qga/commands-win32.c:496:6: error: 'BusTypeSpaces' undeclared here
>> (not in a function);
>> did you mean 'BusTypeSas'?
>>    496 |     [BusTypeSpaces] =3D GUEST_DISK_BUS_TYPE_UNKNOWN,
>>        |      ^~~~~~~~~~~~~
>>        |      BusTypeSas
>> ../qga/commands-win32.c:496:6: error: array index in initializer not of
>> integer type
>> ../qga/commands-win32.c:496:6: note: (near initialization for 'win2qemu'=
)
>> ../qga/commands-win32.c:497:6: error: 'BusTypeNvme' undeclared here (not
>> in a function);
>> did you mean 'BusTypeMmc'?
>>    497 |     [BusTypeNvme] =3D GUEST_DISK_BUS_TYPE_NVME,
>>        |      ^~~~~~~~~~~
>>        |      BusTypeMmc
>> ../qga/commands-win32.c:497:6: error: array index in initializer not of
>> integer type
>> ../qga/commands-win32.c:497:6: note: (near initialization for 'win2qemu'=
)
>>
>>
>
>> r~
>>
>>

--0000000000002594ff05dfbf0cfd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Richard and Marc-Andr=C3=A9<br></=
div><div><br></div><div>I looked into the compilation problem and have 2 so=
lutions:</div><div>1. We can add some conditions to <span class=3D"gmail-im=
">the win2qemu definition</span> and <br></div><div>skip NVME support when =
old mingw-headers <span class=3D"gmail-im">are used.<br></span></div><div><=
span class=3D"gmail-im">2. We can bump the version of the Fedora docker ima=
ge to 36 or 37 <br></span></div><div><span class=3D"gmail-im">that is used =
for cross-compilation tests.<br></span></div><div><span class=3D"gmail-im">=
<br></span></div><div><span class=3D"gmail-im">I think the second option is=
 more valuable because we remove <br></span></div><div><span class=3D"gmail=
-im">pregenerated qga-vss.tlb file and now we can check VSS build only</spa=
n></div><div><span class=3D"gmail-im">at Fedora 37.</span></div><div><span =
class=3D"gmail-im"><br></span></div><div><span class=3D"gmail-im">What do y=
ou think?<br></span></div><div><br></div><div><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><d=
iv>Best Regards,</div><div>Konstantin Kostiuk.</div></div></div></div><br><=
/div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Tue, May 24, 2022 at 12:26 PM Konstantin Kostiuk &lt;<a href=3D"mai=
lto:kkostiuk@redhat.com">kkostiuk@redhat.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div>Thanks fo=
r the report. I will think about how to fix the build with old mingw-header=
s.</div><div>BusTypeNvme and BusTypeSpaces were added to  mingw-headers v 9=
.0.0<br></div><div><br></div><div><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Mon, May 23, 2022 at 11:55 PM Richard =
Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_bl=
ank">richard.henderson@linaro.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">On 5/23/22 12:41, Konstantin Kostiuk wrote=
:<br>
&gt; Bus type spaces (Indicates a storage spaces bus) is not<br>
&gt; supported, so return it as unknown.<br>
&gt; <br>
&gt; Signed-off-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redha=
t.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<br>
&gt; Message-Id: &lt;<a href=3D"mailto:20220520201401.706630-1-kkostiuk@red=
hat.com" target=3D"_blank">20220520201401.706630-1-kkostiuk@redhat.com</a>&=
gt;<br>
&gt; Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Konstantin Kostiuk &lt;<a href=3D"mailto:kkostiuk@redha=
t.com" target=3D"_blank">kkostiuk@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0qga/commands-win32.c | 5 +++++<br>
&gt;=C2=A0 =C2=A01 file changed, 5 insertions(+)<br>
&gt; <br>
&gt; diff --git a/qga/commands-win32.c b/qga/commands-win32.c<br>
&gt; index dcdeb76a68..36f94c0f9c 100644<br>
&gt; --- a/qga/commands-win32.c<br>
&gt; +++ b/qga/commands-win32.c<br>
&gt; @@ -490,6 +490,11 @@ static GuestDiskBusType win2qemu[] =3D {<br>
&gt;=C2=A0 =C2=A0#if (_WIN32_WINNT &gt;=3D 0x0601)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[BusTypeVirtual] =3D GUEST_DISK_BUS_TYPE_VIR=
TUAL,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0[BusTypeFileBackedVirtual] =3D GUEST_DISK_BU=
S_TYPE_FILE_BACKED_VIRTUAL,<br>
&gt; +=C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0* BusTypeSpaces currently is not suported<br>
&gt; +=C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 [BusTypeSpaces] =3D GUEST_DISK_BUS_TYPE_UNKNOWN,<br>
&gt; +=C2=A0 =C2=A0 [BusTypeNvme] =3D GUEST_DISK_BUS_TYPE_NVME,<br>
&gt;=C2=A0 =C2=A0#endif<br>
&gt;=C2=A0 =C2=A0};<br>
&gt;=C2=A0 =C2=A0<br>
<br>
Build fails:<br>
<br>
../qga/commands-win32.c:496:6: error: &#39;BusTypeSpaces&#39; undeclared he=
re (not in a function); <br>
did you mean &#39;BusTypeSas&#39;?<br>
=C2=A0 =C2=A0496 |=C2=A0 =C2=A0 =C2=A0[BusTypeSpaces] =3D GUEST_DISK_BUS_TY=
PE_UNKNOWN,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 BusTypeSas<br>
../qga/commands-win32.c:496:6: error: array index in initializer not of int=
eger type<br>
../qga/commands-win32.c:496:6: note: (near initialization for &#39;win2qemu=
&#39;)<br>
../qga/commands-win32.c:497:6: error: &#39;BusTypeNvme&#39; undeclared here=
 (not in a function); <br>
did you mean &#39;BusTypeMmc&#39;?<br>
=C2=A0 =C2=A0497 |=C2=A0 =C2=A0 =C2=A0[BusTypeNvme] =3D GUEST_DISK_BUS_TYPE=
_NVME,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 ^~~~~~~~~~~<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 BusTypeMmc<br>
../qga/commands-win32.c:497:6: error: array index in initializer not of int=
eger type<br>
../qga/commands-win32.c:497:6: note: (near initialization for &#39;win2qemu=
&#39;)<br>=C2=A0 <br></blockquote><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
r~<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--0000000000002594ff05dfbf0cfd--


