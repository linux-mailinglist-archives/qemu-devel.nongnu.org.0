Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA2F5A7D75
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 14:35:12 +0200 (CEST)
Received: from localhost ([::1]:49374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTMw2-0003C2-PC
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 08:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTMrR-0008Uu-NB
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 08:30:25 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:44852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oTMrE-0005Sm-7J
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 08:30:20 -0400
Received: by mail-lj1-x22d.google.com with SMTP id by6so14441416ljb.11
 for <qemu-devel@nongnu.org>; Wed, 31 Aug 2022 05:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=nvWMQqBwnCNiUhPaqnDd4e6H/uu/D2AqPyRgITyfk9Y=;
 b=cKa902m0hystLOmZScZJZqf68kQSvZA3nWRM547jxZbQW1hWpoo6N9C4hUiA2ytRcV
 Th3qaXM0yiAcQpG75tUhqNZ17+h9DLkMu2EKsAtItfZ8O3TmfT/+gwnKyJ5UFwTA2Y2Z
 2U/SoVS4Zuz3u3ywHNTJoCKQAWJQIlPdpxbN1t43EaPLqaeFgsoNogfCg0iiVotJNg1c
 qO9p6uR9CyEHI/L8RDeQBGIAkAJb6eEf2gUO/LhZ4m3OLhKiHY+6/qc845WfMuhoKmr8
 DHO1AtAyqEYfrVtswYPXISPp3RpzRtOSXOyH0DkfKhZfARoqzovB7qTiX7cRBtX5Gkxz
 kO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=nvWMQqBwnCNiUhPaqnDd4e6H/uu/D2AqPyRgITyfk9Y=;
 b=SoLq34iXo64U+No20m10uPIk66PguZxOhDTj9w5gg/THVirK3yqBIxTvEQL+hJm7Go
 cpikfgHtr4kPW6NP3qgMtdsa0z3ClEC9h7j9z7Xb1EFBDA0ftlY98zRTye0KiGjk9kF8
 o5szcCq6Gg58qmK5BkvqSian35+MLTgbWoC0VrHUf9BFtynzIXpsxpuBk/0gqZgUm1M7
 w4x888NbqGwWyJ9R60TiBDrD0ODbWZeEI9tk5fEjfrjf97+J3l/Q/2WfKv00tOx9f9wZ
 rBlMX0qGuD207h6wd31QO1BIcy4ImFoDe8x0SkKwscJzWsBB2LQN6x68Sx9qwilZuzxk
 aWVg==
X-Gm-Message-State: ACgBeo0KqsKm2gXrWTzgySsON16/QMAGTUmHEpcd+NxWP6+boPzelaQc
 77j5swTCboKOMscPHNd7h3XgnmyJO2xzaX7bmcA=
X-Google-Smtp-Source: AA6agR52gq6EIb33MVNvqzwMejYl3XztTn/IXDtvTFoOuZU/8cLJabGmEy+aipmHx+x9A7xiN3MX5gSYbQb/IZBNauw=
X-Received: by 2002:a2e:9942:0:b0:265:e313:7fb7 with SMTP id
 r2-20020a2e9942000000b00265e3137fb7mr3542135ljj.449.1661949002987; Wed, 31
 Aug 2022 05:30:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220822131021.975656-1-marcandre.lureau@redhat.com>
 <3b739f0d-69aa-5588-b603-8145406902cf@t-online.de>
In-Reply-To: <3b739f0d-69aa-5588-b603-8145406902cf@t-online.de>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 31 Aug 2022 16:29:51 +0400
Message-ID: <CAJ+F1CJSC1LzETe5TDbij6_sdgb6hYsHDv03ddqOhDgqpxpW8Q@mail.gmail.com>
Subject: Re: [PATCH] audio: exit(1) if audio backend failed to be found or
 initialized
To: =?UTF-8?Q?Volker_R=C3=BCmelin?= <vr_qemu@t-online.de>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f53cac05e788a7e8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

--000000000000f53cac05e788a7e8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Aug 23, 2022 at 10:53 PM Volker R=C3=BCmelin <vr_qemu@t-online.de> =
wrote:

> > From: Marc-Andr=C3=A9 Lureau<marcandre.lureau@redhat.com>
> >
> > If you specify a known backend but it isn't compiled in, or failed to
> > initialize, you get a simple warning and the "none" backend as a
> > fallback, and QEMU runs happily:
> >
> > $ qemu-system-x86_64 -audiodev id=3Daudio,driver=3Ddsound
> > audio: Unknown audio driver `dsound'
> > audio: warning: Using timer based audio emulation
> > ...
> >
> > Instead, QEMU should fail to start:
> > $ qemu-system-x86_64 -audiodev id=3Daudio,driver=3Ddsound
> > audio: Unknown audio driver `dsound'
> > $
> >
> > Resolves:
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D1983493
> >
> > Signed-off-by: Marc-Andr=C3=A9 Lureau<marcandre.lureau@redhat.com>
> > ---
> >   audio/audio.h |  2 +-
> >   audio/audio.c | 14 +++++++++++---
> >   softmmu/vl.c  |  4 +++-
> >   3 files changed, 15 insertions(+), 5 deletions(-)
> >
> > diff --git a/audio/audio.h b/audio/audio.h
> > index b5e17cd218..27e67079a0 100644
> > --- a/audio/audio.h
> > +++ b/audio/audio.h
> > @@ -170,7 +170,7 @@ void audio_sample_from_uint64(void *samples, int po=
s,
> >
> >   void audio_define(Audiodev *audio);
> >   void audio_parse_option(const char *opt);
> > -void audio_init_audiodevs(void);
> > +bool audio_init_audiodevs(void);
> >   void audio_legacy_help(void);
> >
> >   AudioState *audio_state_by_name(const char *name);
> > diff --git a/audio/audio.c b/audio/audio.c
> > index a02f3ce5c6..76b8735b44 100644
> > --- a/audio/audio.c
> > +++ b/audio/audio.c
> > @@ -1743,7 +1743,6 @@ static AudioState *audio_init(Audiodev *dev, cons=
t
> char *name)
> >           atexit(audio_cleanup);
> >           atexit_registered =3D true;
> >       }
> > -    QTAILQ_INSERT_TAIL(&audio_states, s, list);
> >
> >       s->ts =3D timer_new_ns(QEMU_CLOCK_VIRTUAL, audio_timer, s);
> >
> > @@ -1769,6 +1768,10 @@ static AudioState *audio_init(Audiodev *dev,
> const char *name)
> >           } else {
> >               dolog ("Unknown audio driver `%s'\n", drvname);
> >           }
> > +        if (!done) {
> > +            free_audio_state(s);
> > +            return NULL;
>
> Hi Marc-Andr=C3=A9,
>
> I don't understand why you move the QTAILQ_INSERT_TAIL(&audio_states, s,
> list) macro down. Without this you don't need the additional
> free_audio_state() call. audio_cleanup() takes care to free the audio
> state.


Ah I see what you mean, atexit will be called. But since exit() is called
outside the function, it's not a good idea to rely on the caller imho.
Better not add it at all imho, and free state on failure.



> The rest looks good. You can add my
>
> Reviewed-by: Volker R=C3=BCmelin <vr_qemu@t-online.de>


> even if you insist on keeping the patch as it is.
>

thanks


>
> With best regards,
> Volker
>
> > +        }
> >       } else {
> >           for (i =3D 0; audio_prio_list[i]; i++) {
> >               AudiodevListEntry *e =3D audiodev_find(&head,
> audio_prio_list[i]);
> > @@ -1806,6 +1809,7 @@ static AudioState *audio_init(Audiodev *dev, cons=
t
> char *name)
> >                  "(Audio can continue looping even after stopping the
> VM)\n");
> >       }
> >
> > +    QTAILQ_INSERT_TAIL(&audio_states, s, list);
> >       QLIST_INIT (&s->card_head);
> >       vmstate_register (NULL, 0, &vmstate_audio, s);
> >       return s;
> > @@ -2119,13 +2123,17 @@ void audio_define(Audiodev *dev)
> >       QSIMPLEQ_INSERT_TAIL(&audiodevs, e, next);
> >   }
> >
> > -void audio_init_audiodevs(void)
> > +bool audio_init_audiodevs(void)
> >   {
> >       AudiodevListEntry *e;
> >
> >       QSIMPLEQ_FOREACH(e, &audiodevs, next) {
> > -        audio_init(e->dev, NULL);
> > +        if (!audio_init(e->dev, NULL)) {
> > +            return false;
> > +        }
> >       }
> > +
> > +    return true;
> >   }
> >
> >   audsettings audiodev_to_audsettings(AudiodevPerDirectionOptions *pdo)
> > diff --git a/softmmu/vl.c b/softmmu/vl.c
> > index 706bd7cff7..dea4005e47 100644
> > --- a/softmmu/vl.c
> > +++ b/softmmu/vl.c
> > @@ -1885,7 +1885,9 @@ static void qemu_create_early_backends(void)
> >        * setting machine properties, so they can be referred to.
> >        */
> >       configure_blockdev(&bdo_queue, machine_class, snapshot);
> > -    audio_init_audiodevs();
> > +    if (!audio_init_audiodevs()) {
> > +        exit(1);
> > +    }
> >   }
> >
> >
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000f53cac05e788a7e8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Aug 23, 2022 at 10:53 PM Vo=
lker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de">vr_qemu@t-onli=
ne.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div>&gt; From: Marc-Andr=C3=A9 Lureau&lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt;<br>
&gt; If you specify a known backend but it isn&#39;t compiled in, or failed=
 to<br>
&gt; initialize, you get a simple warning and the &quot;none&quot; backend =
as a<br>
&gt; fallback, and QEMU runs happily:<br>
&gt;<br>
&gt; $ qemu-system-x86_64 -audiodev id=3Daudio,driver=3Ddsound<br>
&gt; audio: Unknown audio driver `dsound&#39;<br>
&gt; audio: warning: Using timer based audio emulation<br>
&gt; ...<br>
&gt;<br>
&gt; Instead, QEMU should fail to start:<br>
&gt; $ qemu-system-x86_64 -audiodev id=3Daudio,driver=3Ddsound<br>
&gt; audio: Unknown audio driver `dsound&#39;<br>
&gt; $<br>
&gt;<br>
&gt; Resolves:<br>
&gt; <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1983493" rel=
=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug.cgi?=
id=3D1983493</a><br>
&gt;<br>
&gt; Signed-off-by: Marc-Andr=C3=A9 Lureau&lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0audio/audio.h |=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A0audio/audio.c | 14 +++++++++++---<br>
&gt;=C2=A0 =C2=A0softmmu/vl.c=C2=A0 |=C2=A0 4 +++-<br>
&gt;=C2=A0 =C2=A03 files changed, 15 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/audio/audio.h b/audio/audio.h<br>
&gt; index b5e17cd218..27e67079a0 100644<br>
&gt; --- a/audio/audio.h<br>
&gt; +++ b/audio/audio.h<br>
&gt; @@ -170,7 +170,7 @@ void audio_sample_from_uint64(void *samples, int p=
os,<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0void audio_define(Audiodev *audio);<br>
&gt;=C2=A0 =C2=A0void audio_parse_option(const char *opt);<br>
&gt; -void audio_init_audiodevs(void);<br>
&gt; +bool audio_init_audiodevs(void);<br>
&gt;=C2=A0 =C2=A0void audio_legacy_help(void);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0AudioState *audio_state_by_name(const char *name);<br>
&gt; diff --git a/audio/audio.c b/audio/audio.c<br>
&gt; index a02f3ce5c6..76b8735b44 100644<br>
&gt; --- a/audio/audio.c<br>
&gt; +++ b/audio/audio.c<br>
&gt; @@ -1743,7 +1743,6 @@ static AudioState *audio_init(Audiodev *dev, con=
st char *name)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0atexit(audio_cleanup);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0atexit_registered =3D true;<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; -=C2=A0 =C2=A0 QTAILQ_INSERT_TAIL(&amp;audio_states, s, list);<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;ts =3D timer_new_ns(QEMU_CLOCK_VIRTUAL=
, audio_timer, s);<br>
&gt;=C2=A0 =C2=A0<br>
&gt; @@ -1769,6 +1768,10 @@ static AudioState *audio_init(Audiodev *dev, co=
nst char *name)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dolog (&quot;Unk=
nown audio driver `%s&#39;\n&quot;, drvname);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!done) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 free_audio_state(s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
<br>
Hi Marc-Andr=C3=A9,<br>
<br>
I don&#39;t understand why you move the QTAILQ_INSERT_TAIL(&amp;audio_state=
s, s, <br>
list) macro down. Without this you don&#39;t need the additional <br></div>
free_audio_state() call. audio_cleanup() takes care to free the audio state=
.</blockquote><div><br></div><div>Ah I see what you mean, atexit will be ca=
lled. But since exit() is called outside the function, it&#39;s not a good =
idea to rely on the caller imho. Better not add it at all imho, and free st=
ate on failure.</div><div>=C2=A0<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
The rest looks good. You can add my<br>
<br>
Reviewed-by: Volker R=C3=BCmelin &lt;<a href=3D"mailto:vr_qemu@t-online.de"=
 target=3D"_blank">vr_qemu@t-online.de</a>&gt;=C2=A0</blockquote><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
even if you insist on keeping the patch as it is.<br></blockquote><div><br>=
</div><div>thanks</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
With best regards,<br>
Volker<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for (i =3D 0; audio_prio_list[=
i]; i++) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AudiodevListEntr=
y *e =3D audiodev_find(&amp;head, audio_prio_list[i]);<br>
&gt; @@ -1806,6 +1809,7 @@ static AudioState *audio_init(Audiodev *dev, con=
st char *name)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;(A=
udio can continue looping even after stopping the VM)\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +=C2=A0 =C2=A0 QTAILQ_INSERT_TAIL(&amp;audio_states, s, list);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QLIST_INIT (&amp;s-&gt;card_head);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0vmstate_register (NULL, 0, &amp;vmstate_audi=
o, s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0return s;<br>
&gt; @@ -2119,13 +2123,17 @@ void audio_define(Audiodev *dev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QSIMPLEQ_INSERT_TAIL(&amp;audiodevs, e, next=
);<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -void audio_init_audiodevs(void)<br>
&gt; +bool audio_init_audiodevs(void)<br>
&gt;=C2=A0 =C2=A0{<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0AudiodevListEntry *e;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0QSIMPLEQ_FOREACH(e, &amp;audiodevs, next) {<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 audio_init(e-&gt;dev, NULL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!audio_init(e-&gt;dev, NULL)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return true;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0audsettings audiodev_to_audsettings(AudiodevPerDirectionOp=
tions *pdo)<br>
&gt; diff --git a/softmmu/vl.c b/softmmu/vl.c<br>
&gt; index 706bd7cff7..dea4005e47 100644<br>
&gt; --- a/softmmu/vl.c<br>
&gt; +++ b/softmmu/vl.c<br>
&gt; @@ -1885,7 +1885,9 @@ static void qemu_create_early_backends(void)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 * setting machine properties, so they can b=
e referred to.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0configure_blockdev(&amp;bdo_queue, machine_c=
lass, snapshot);<br>
&gt; -=C2=A0 =C2=A0 audio_init_audiodevs();<br>
&gt; +=C2=A0 =C2=A0 if (!audio_init_audiodevs()) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 exit(1);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000f53cac05e788a7e8--

