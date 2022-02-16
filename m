Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D414B8DAE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 17:18:03 +0100 (CET)
Received: from localhost ([::1]:38002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKN0E-0005Hl-93
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 11:18:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nKMya-0004OA-0Z
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 11:16:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nKMyT-0008Iz-La
 for qemu-devel@nongnu.org; Wed, 16 Feb 2022 11:16:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645028172;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PtIwYt/c/PQDPuzQTyhCrDstDurDhHTJKa/JlrUTwIU=;
 b=N2ZhHWkkhM0GlpFedrycGoy4x8TqTJNOPfnK1BEqwz6TsKxLAjGDq0zVtB+rva0dMRac5a
 BOvAaDnuJaXesVGnAIK6Z51x1DN7BV6YkBc+kAoj99cEM3Q5GhNPA8tzdD/pN9tG0BO7qs
 tr2j7tTRPaS80P/FciRpbDuPr1lo/pQ=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-WuCELKlmNf2NRoPjxYrvoA-1; Wed, 16 Feb 2022 11:16:09 -0500
X-MC-Unique: WuCELKlmNf2NRoPjxYrvoA-1
Received: by mail-vk1-f197.google.com with SMTP id
 t62-20020a1faa41000000b0032abe59f22dso407716vke.14
 for <qemu-devel@nongnu.org>; Wed, 16 Feb 2022 08:16:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PtIwYt/c/PQDPuzQTyhCrDstDurDhHTJKa/JlrUTwIU=;
 b=5q22Tqy/EqdhKmtWnM9XHCdzjRjwBEF//2XKMo60KJxQqy/mu00rzXkGuU1MumLxWr
 +R8gX5YWOWdyN+7eCJ7tVMBrWhpzsPk9tGPEaPDWmendKvdIebT91YZ/8lsi/5dsI5gg
 syBnfriXDojB0LdAr5l9BmQO6qqZM4VWIllaaHZMroEsqbtkaZj0hMEwZRTxNvOxwbNu
 QlgS/6K++9GJS5gts8o/2QwwfdPbrgFZVC1wB2JYmcSwktZHw1iPXLaNLEmBnBNSLuvj
 dL1PYfOwC51yhzbdRDlhVujt4xbehPegWYI39WPO1wfXhpc5S9g+4HVyAHFJ375t1peW
 GUIA==
X-Gm-Message-State: AOAM531EKRHuDb+4oR0pIxyCP1W51aFn5UGeqld89Uc91drk5zsEIddM
 u1HLVT5L04UZsHGi11n6Hd9UdMnKnkRrp8qgfHxe9FqPoRUR1X8TEkLWSvNHd6OTQjoRlUOuZPl
 JmYgTDsDcGZ/vvGhHHv5UdpsamLx3nmc=
X-Received: by 2002:a67:ca1b:0:b0:30b:9d28:1ce5 with SMTP id
 z27-20020a67ca1b000000b0030b9d281ce5mr1244263vsk.61.1645028169094; 
 Wed, 16 Feb 2022 08:16:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwh7R4fFiD+DJaA4xxlS4YyPZzGzp5b6Br8NShkCCU3v4LXqt1mje49XwPwIi6Vg0B+qznUhpjLp9yYBVMIxEY=
X-Received: by 2002:a67:ca1b:0:b0:30b:9d28:1ce5 with SMTP id
 z27-20020a67ca1b000000b0030b9d281ce5mr1244250vsk.61.1645028168837; Wed, 16
 Feb 2022 08:16:08 -0800 (PST)
MIME-Version: 1.0
References: <20220215220853.4179173-1-jsnow@redhat.com>
 <20220215220853.4179173-2-jsnow@redhat.com>
 <20220215225502.uuqqjkbbhqwuajn2@redhat.com>
 <CAFn=p-be7D7DW3cxti3oC60EjhgPAeXyDhHW4owcEWb_Mvf-gQ@mail.gmail.com>
 <bb420d6b-02f1-b8b8-2f53-680bd765a323@amsat.org>
In-Reply-To: <bb420d6b-02f1-b8b8-2f53-680bd765a323@amsat.org>
From: John Snow <jsnow@redhat.com>
Date: Wed, 16 Feb 2022 11:16:00 -0500
Message-ID: <CAFn=p-ZEWubCO+cGL19vo3esdPHux5KT3OO1V9=TGjYX5AfFPA@mail.gmail.com>
Subject: Re: [PATCH 1/4] python/utils: add enboxify() text decoration utility
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Eric Blake <eblake@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a6451a05d824f79d"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a6451a05d824f79d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 15, 2022, 6:57 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
wrote:

> On 16/2/22 00:53, John Snow wrote:
> > On Tue, Feb 15, 2022 at 5:55 PM Eric Blake <eblake@redhat.com> wrote:
> >>
> >> On Tue, Feb 15, 2022 at 05:08:50PM -0500, John Snow wrote:
> >>>>>> print(enboxify(msg, width=3D72, name=3D"commit message"))
> >>> =E2=94=8F=E2=94=81 commit message
> =E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=93
> >>> =E2=94=83 enboxify() takes a chunk of text and wraps it in a text art=
 box that
> =E2=94=83
> >>> =E2=94=83  adheres to a specified width. An optional title label may =
be given,
> =E2=94=83
> >>> =E2=94=83  and any of the individual glyphs used to draw the box may =
be
> =E2=94=83
> >>
> >> Why do these two lines have a leading space,
> >>
> >>> =E2=94=83 replaced or specified as well.
>  =E2=94=83
> >>
> >> but this one doesn't?  It must be an off-by-one corner case when your
> >> choice of space to wrap on is exactly at the wrap column.
> >>
> >
> > Right, you're probably witnessing the right-pad *and* the actual space.
> >
> >>>
> =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=9B
> >>>
> >>> Signed-off-by: John Snow <jsnow@redhat.com>
> >>> ---
> >>>   python/qemu/utils/__init__.py | 58
> +++++++++++++++++++++++++++++++++++
> >>>   1 file changed, 58 insertions(+)
>
> >>> +    def _wrap(line: str) -> str:
> >>> +        return os.linesep.join([
> >>> +            wrapped_line.ljust(lwidth) + suffix
> >>> +            for wrapped_line in textwrap.wrap(
> >>> +                    line, width=3Dlwidth, initial_indent=3Dprefix,
> >>> +                    subsequent_indent=3Dprefix,
> replace_whitespace=3DFalse,
> >>> +                    drop_whitespace=3DFalse, break_on_hyphens=3DFals=
e)
> >>
> >> Always nice when someone else has written the cool library function to
> >> do all the hard work for you ;)  But this is probably where you have
> the off-by-one I called out above.
> >>
> >
> > Yeah, I just didn't want it to eat multiple spaces if they were
> > present -- I wanted it to reproduce them faithfully. The tradeoff is
> > some silliness near the margins.
> >
> > Realistically, if I want something any better than what I've done
> > here, I should find a library to do it for me instead -- but for the
> > sake of highlighting some important information, this may be
> > just-enough-juice.
>
> 's/^=E2=94=83  /=E2=94=83 /' on top ;D
>

I have to admit that this function is actually very fragile. Last night, I
did some reading on unicode and emoji encodings and discovered that it's
*basically impossible* to predict the "visual width" of a sequence of
unicode codepoints.

So, this function as written will only really work if we stick to
single-codepoint glyphs that can be rendered 1:1 in a monospace font.

I could probably improve it to work with "some" (but certainly not all)
wide glyphs and emoji, but it's a very complex topic and far outside my
specialty. Support for multi-codepoint narrow/halfwidth glyphs is also an
issue. (This affects some Latin characters outside of ascii if they are
encoded using combining codepoints.)

(See https://hsivonen.fi/string-length/ ... It's nasty.)

So I must admit that this function has some very serious limitations to it.
I want to explain why I wrote it, though.

First: Tracebacks make people's eyes cross over. It's a very long sequence
of mumbo jumbo that most people don't read, because it's program debug
information. I don't blame them. Setting apart the error summary visually
is a helpful tool for drawing one's eyes to the most critical pieces of
information.

Second: In my AQMP library, I use the ascii vertical bar | as a left-hand
border decoration to provide a kind of visual quoting mechanism to
illustrate in the logfile which subsequent confusing lines of jargon belong
to the same log entry. I really like this formatting mechanism, but...

Third: If a line of text becomes so long that it wraps in your terminal,
the visual quote mechanism breaks, making the output messy and hard to
read. Forcibly re-wrapping the text in a virtual box is a necessary
mechanism to preserve readability in this circumstance - the lines from
qemu-img et al may be much wider than your terminal column width.

And so, I drew a box instead of just a left border, because I needed to
re-wrap the text anyway. Visually, I believed it to help explain that the
output was being re-formatted to fit in a certain dimensionality.
Unfortunately, it's inadequate.

So ... what to do.

(1) I can just remove the right margin decoration and call the function
visual_quote or something. If any of the lines get too "long" because of
emoji/=E6=97=A5=E6=9C=AC=E8=AA=9E, it MAY break the indent line, but occasi=
onal uses of one or two
wide characters probably won't cause wrapping that breaks the "visual quote
line" on a terminal with at least 85 columns. Essentially it'd still be
broken, but without a solid right border it'd be harder to notice *small*
breakages.

(2) If there is a genuine interest in using visual highlighting techniques
to make iotest failures easier to diagnose (and making sure it is properly
multilingual), I could use the urwid helper library to estimate visual text
width to make drawing terminal boxes more resilient than what I could do on
my own power. Downside is a new third party dependency. I already use urwid
for the aqmp tui that we're working on, but it's remained an optional
dependency so far.

(3) I can take a swing at improving this text decoration utility and having
it account for the most basic cases. East Asian language support is a low
hanging fruit, though I have only rudimentary familiarity with Hangul. (And
virtually no exposure to Thai or other south-eastern Asian scripts.)

(4) Just leave it alone for now, don't you have IDE/FDC patches to work on?

Sigh. The punishment for trying to do something nice is swift.

--js

>

--000000000000a6451a05d824f79d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Tue, Feb 15, 2022, 6:57 PM Philippe Mathieu-Daud=C3=A9 =
&lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">On 16/2/22 00:53, John Snow wrote:<br>
&gt; On Tue, Feb 15, 2022 at 5:55 PM Eric Blake &lt;<a href=3D"mailto:eblak=
e@redhat.com" target=3D"_blank" rel=3D"noreferrer">eblake@redhat.com</a>&gt=
; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Tue, Feb 15, 2022 at 05:08:50PM -0500, John Snow wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt; print(enboxify(msg, width=3D72, name=3D&quot;commi=
t message&quot;))<br>
&gt;&gt;&gt; =E2=94=8F=E2=94=81 commit message =E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=93<br>
&gt;&gt;&gt; =E2=94=83 enboxify() takes a chunk of text and wraps it in a t=
ext art box that =E2=94=83<br>
&gt;&gt;&gt; =E2=94=83=C2=A0 adheres to a specified width. An optional titl=
e label may be given, =E2=94=83<br>
&gt;&gt;&gt; =E2=94=83=C2=A0 and any of the individual glyphs used to draw =
the box may be=C2=A0 =C2=A0 =C2=A0 =C2=A0 =E2=94=83<br>
&gt;&gt;<br>
&gt;&gt; Why do these two lines have a leading space,<br>
&gt;&gt;<br>
&gt;&gt;&gt; =E2=94=83 replaced or specified as well.=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=E2=94=83<br>
&gt;&gt;<br>
&gt;&gt; but this one doesn&#39;t?=C2=A0 It must be an off-by-one corner ca=
se when your<br>
&gt;&gt; choice of space to wrap on is exactly at the wrap column.<br>
&gt;&gt;<br>
&gt; <br>
&gt; Right, you&#39;re probably witnessing the right-pad *and* the actual s=
pace.<br>
&gt; <br>
&gt;&gt;&gt; =E2=94=97=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=
=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=
=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=
=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=81=E2=94=9B<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.co=
m" target=3D"_blank" rel=3D"noreferrer">jsnow@redhat.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0python/qemu/utils/__init__.py | 58 +++++++++++++++=
++++++++++++++++++++<br>
&gt;&gt;&gt;=C2=A0 =C2=A01 file changed, 58 insertions(+)<br>
<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 def _wrap(line: str) -&gt; str:<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return os.linesep.join([<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wrapped_line.ljust(=
lwidth) + suffix<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for wrapped_line in=
 textwrap.wrap(<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 line, width=3Dlwidth, initial_indent=3Dprefix,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 subsequent_indent=3Dprefix, replace_whitespace=3DFalse,<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 drop_whitespace=3DFalse, break_on_hyphens=3DFalse)<br>
&gt;&gt;<br>
&gt;&gt; Always nice when someone else has written the cool library functio=
n to<br>
&gt;&gt; do all the hard work for you ;)=C2=A0 But this is probably where y=
ou have the off-by-one I called out above.<br>
&gt;&gt;<br>
&gt; <br>
&gt; Yeah, I just didn&#39;t want it to eat multiple spaces if they were<br=
>
&gt; present -- I wanted it to reproduce them faithfully. The tradeoff is<b=
r>
&gt; some silliness near the margins.<br>
&gt; <br>
&gt; Realistically, if I want something any better than what I&#39;ve done<=
br>
&gt; here, I should find a library to do it for me instead -- but for the<b=
r>
&gt; sake of highlighting some important information, this may be<br>
&gt; just-enough-juice.<br>
<br>
&#39;s/^=E2=94=83=C2=A0 /=E2=94=83 /&#39; on top ;D<br></blockquote></div><=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">I have to admit that thi=
s function is actually very fragile. Last night, I did some reading on unic=
ode and emoji encodings and discovered that it&#39;s *basically impossible*=
 to predict the &quot;visual width&quot; of a sequence of unicode codepoint=
s.<div dir=3D"auto"><br></div><div dir=3D"auto">So, this function as writte=
n will only really work if we stick to single-codepoint glyphs that can be =
rendered 1:1 in a monospace font.</div><div dir=3D"auto"><br></div><div dir=
=3D"auto">I could probably improve it to work with &quot;some&quot; (but ce=
rtainly not all) wide glyphs and emoji, but it&#39;s a very complex topic a=
nd far outside my specialty. Support for multi-codepoint narrow/halfwidth g=
lyphs is also an issue. (This affects some Latin characters outside of asci=
i if they are encoded using combining codepoints.)</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">(See=C2=A0<a href=3D"https://hsivonen.fi/string-=
length/">https://hsivonen.fi/string-length/</a> ... It&#39;s nasty.)</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">So I must admit that this func=
tion has some very serious limitations to it. I want to explain why I wrote=
 it, though.</div><div dir=3D"auto"><br></div><div dir=3D"auto">First: Trac=
ebacks make people&#39;s eyes cross over. It&#39;s a very long sequence of =
mumbo jumbo that most people don&#39;t read, because it&#39;s program debug=
 information. I don&#39;t blame them. Setting apart the error summary visua=
lly is a helpful tool for drawing one&#39;s eyes to the most critical piece=
s of information.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Second=
: In my AQMP library, I use the ascii vertical bar | as a left-hand border =
decoration to provide a kind of visual quoting mechanism to illustrate in t=
he logfile which subsequent confusing lines of jargon belong to the same lo=
g entry. I really like this formatting mechanism, but...</div><div dir=3D"a=
uto"><br></div><div dir=3D"auto">Third: If a line of text becomes so long t=
hat it wraps in your terminal, the visual quote mechanism breaks, making th=
e output messy and hard to read. Forcibly re-wrapping the text in a virtual=
 box is a necessary mechanism to preserve readability in this circumstance =
- the lines from qemu-img et al may be much wider than your terminal column=
 width.</div><div dir=3D"auto"><br></div><div dir=3D"auto">And so, I drew a=
 box instead of just a left border, because I needed to re-wrap the text an=
yway. Visually, I believed it to help explain that the output was being re-=
formatted to fit in a certain dimensionality. Unfortunately, it&#39;s inade=
quate.</div><div dir=3D"auto"><br></div><div dir=3D"auto">So ... what to do=
.</div><div dir=3D"auto"><br></div><div dir=3D"auto">(1) I can just remove =
the right margin decoration and call the function visual_quote or something=
. If any of the lines get too &quot;long&quot; because of emoji/=E6=97=A5=
=E6=9C=AC=E8=AA=9E, it MAY break the indent line, but occasional uses of on=
e or two wide characters probably won&#39;t cause wrapping that breaks the =
&quot;visual quote line&quot; on a terminal with at least 85 columns. Essen=
tially it&#39;d still be broken, but without a solid right border it&#39;d =
be harder to notice *small* breakages.</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">(2) If there is a genuine interest in using visual highlight=
ing techniques to make iotest failures easier to diagnose (and making sure =
it is properly multilingual), I could use the urwid helper library to estim=
ate visual text width to make drawing terminal boxes more resilient than wh=
at I could do on my own power. Downside is a new third party dependency. I =
already use urwid for the aqmp tui that we&#39;re working on, but it&#39;s =
remained an optional dependency so far.</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">(3) I can take a swing at improving this text decoration ut=
ility and having it account for the most basic cases. East Asian language s=
upport is a low hanging fruit, though I have only rudimentary familiarity w=
ith Hangul. (And virtually no exposure to Thai or other south-eastern Asian=
 scripts.)</div><div dir=3D"auto"><br></div><div dir=3D"auto">(4) Just leav=
e it alone for now, don&#39;t you have IDE/FDC patches to work on?</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Sigh. The punishment for trying =
to do something nice is swift.</div><div dir=3D"auto"><br></div><div dir=3D=
"auto">--js</div></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex"></blockquote></div></div></div>

--000000000000a6451a05d824f79d--


