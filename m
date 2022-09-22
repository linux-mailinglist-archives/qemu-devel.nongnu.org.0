Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4596E5E5C9D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 09:43:58 +0200 (CEST)
Received: from localhost ([::1]:54126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obGsG-0003q4-QK
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 03:43:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1obGns-0002DY-D0
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 03:39:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1obGnk-0001Cq-QD
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 03:39:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663832355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gOwBy5VYJzQfcVzL2NcckfVn/Lyi2ef3fWnGXtMB1EY=;
 b=Imik+K+V+rZH9hGjribN4KCArt0BOpZSe7T5ssm1mv3K2LECMeETlYZ2NbXopOYgRTlA5P
 jv4mRskix6UpvKNHixO1/lm3gE8WM/bYRO63BP48efLKeHZpb7JVJCr6cuGt49Ay+Jl7kv
 uIrrl0ANt6O/tRCxyM1lmL32QeQYsBY=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-274-2I6AXTNcPEyUOh-DBwdZ4g-1; Thu, 22 Sep 2022 03:39:13 -0400
X-MC-Unique: 2I6AXTNcPEyUOh-DBwdZ4g-1
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-34d188806a8so71351477b3.19
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 00:39:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=gOwBy5VYJzQfcVzL2NcckfVn/Lyi2ef3fWnGXtMB1EY=;
 b=t9Bh3iOUi1FBjGwVkAmFAqn+4PXa8uqBkWcQhDTjWcO/cyA0hQcFGQJEAND9z2uYjO
 sAY1BVP+xjs8rqN0G9i8u9sewLmJYjCm011gNWMWsuqt3nd5WQI2uRmfG1lUDJiJH8Ji
 t+YmvaoFmtU3lrK0G59VvBCL8nNKFV3NNB05EpkF+tVbONlYjIbUVoxrbWbo5ou2SP4t
 V+3mjfCbCYgnLM5aAnVXUtkB5YDjf2+L6rsv52QZuEF/+vapO/I90wH5X8Xey2LxGvg1
 gjBfoziWL+6jGwtLefLTt43X5EUi5o/ILrTehwX2q5hsFVzqiELvFeTmcxwjPttwabCb
 uI8Q==
X-Gm-Message-State: ACrzQf3nm8dgLS2eatYNUdKA9/7HxCh9tImPWe402SLMhQG1edepHKQ+
 iFdp+KkVsROccUIZyjk20tfDVb40j9SWUIjhhyCXu/z2PtmVdFdhKNN4IWmEgWv4Db/3W6SMNa7
 p5LDGr1PI0CsVd+Xer2o2trb3Mpv5wEk=
X-Received: by 2002:a81:dd2:0:b0:345:2004:b797 with SMTP id
 201-20020a810dd2000000b003452004b797mr1912852ywn.381.1663832353385; 
 Thu, 22 Sep 2022 00:39:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5SXyHiDdplFwvj4/X9gwf1pU0OgIhWV5hLMzij/XWJJmCXjJaRlDDExUMZrOMfjb4XNhqbofIHd1f1+60O+bE=
X-Received: by 2002:a81:dd2:0:b0:345:2004:b797 with SMTP id
 201-20020a810dd2000000b003452004b797mr1912845ywn.381.1663832353191; Thu, 22
 Sep 2022 00:39:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220921142036.1758-1-luzhipeng@cestc.cn>
 <87sfkkaie2.fsf@pond.sub.org>
In-Reply-To: <87sfkkaie2.fsf@pond.sub.org>
From: Konstantin Kostiuk <kkostiuk@redhat.com>
Date: Thu, 22 Sep 2022 10:39:01 +0300
Message-ID: <CAPMcbCoY1AhUm1Vk0r9_P-KHFzxmG-x+oOh=eQsvAV0mEoc8Eg@mail.gmail.com>
Subject: Re: [PATCH] qga: fix possible memory leak
To: Markus Armbruster <armbru@redhat.com>
Cc: luzhipeng <luzhipeng@cestc.cn>, qemu-devel <qemu-devel@nongnu.org>,
 michael.roth@amd.com
Content-Type: multipart/alternative; boundary="00000000000060cd5405e93f28d9"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--00000000000060cd5405e93f28d9
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 21, 2022 at 5:53 PM Markus Armbruster <armbru@redhat.com> wrote:

> luzhipeng <luzhipeng@cestc.cn> writes:
>
> > From: lu zhipeng <luzhipeng@cestc.cn>
> >
> > Signed-off-by: lu zhipeng <luzhipeng@cestc.cn>
> > ---
> >  qga/main.c | 19 ++++++++++++++-----
> >  1 file changed, 14 insertions(+), 5 deletions(-)
> >
> > diff --git a/qga/main.c b/qga/main.c
> > index 5f1efa2333..73ea1aae65 100644
> > --- a/qga/main.c
> > +++ b/qga/main.c
> > @@ -1287,7 +1287,7 @@ static GAState *initialize_agent(GAConfig *config,
> int socket_activation)
> >      if (g_mkdir_with_parents(config->state_dir, S_IRWXU) == -1) {
> >          g_critical("unable to create (an ancestor of) the state
> directory"
> >                     " '%s': %s", config->state_dir, strerror(errno));
> > -        return NULL;
> > +        goto failed;
> >      }
> >  #endif
> >
> > @@ -1312,7 +1312,7 @@ static GAState *initialize_agent(GAConfig *config,
> int socket_activation)
> >              if (!log_file) {
> >                  g_critical("unable to open specified log file: %s",
> >                             strerror(errno));
> > -                return NULL;
> > +                goto failed;
> >              }
> >              s->log_file = log_file;
> >          }
> > @@ -1323,7 +1323,7 @@ static GAState *initialize_agent(GAConfig *config,
> int socket_activation)
> >                                 s->pstate_filepath,
> >                                 ga_is_frozen(s))) {
> >          g_critical("failed to load persistent state");
> > -        return NULL;
> > +        goto failed;
> >      }
> >
> >      config->blacklist = ga_command_blacklist_init(config->blacklist);
> > @@ -1344,7 +1344,7 @@ static GAState *initialize_agent(GAConfig *config,
> int socket_activation)
> >  #ifndef _WIN32
> >      if (!register_signal_handlers()) {
> >          g_critical("failed to register signal handlers");
> > -        return NULL;
> > +        goto failed;
> >      }
> >  #endif
> >
> > @@ -1357,12 +1357,21 @@ static GAState *initialize_agent(GAConfig
> *config, int socket_activation)
> >      s->wakeup_event = CreateEvent(NULL, TRUE, FALSE, TEXT("WakeUp"));
> >      if (s->wakeup_event == NULL) {
> >          g_critical("CreateEvent failed");
> > -        return NULL;
> > +        goto failed;
> >      }
> >  #endif
> >
> >      ga_state = s;
> >      return s;
> > +
> > +failed:
> > +    g_free(s->pstate_filepath);
> > +    g_free(s->state_filepath_isfrozen);
> > +    if (s->log_file && s->log_file != stderr) {
> > +        fclose(s->log_file);
> > +    }
> > +    g_free(s);
>

I think we can just add g_autofree/g_autoptr for all pointers in GAState
and GLib will clean it automatically



> > +    return NULL;
> >  }
> >
> >  static void cleanup_agent(GAState *s)
>
> The function's only caller is main():
>
>    int main(int argc, char **argv)
>    {
>        int ret = EXIT_SUCCESS;
>
>        ...
>
>        s = initialize_agent(config, socket_activation);
>        if (!s) {
>            g_critical("error initializing guest agent");
>            goto end;
>        }
>
>        ...
>
>    end:
>        if (config->daemonize) {
>            unlink(config->pid_filepath);
>        }
>
>        config_free(config);
>
>        return ret;
>    }
>
> When initialize_agent() fails, the process terminates immediately.
> There is no memory leak.
>
> We might want to free in initialize_agent() anyway.  Up to the
> maintainer.
>
> Bug (not related to this patch): when initialize_agent() fails, we still
> terminate successfully.  We should ret = EXIT_FAILURE before goto end,
> like we do elsewhere in main().
>

Yes, I agree with this.

--00000000000060cd5405e93f28d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div><span class=3D"gmail-pl-c1"><br></sp=
an></div><div><br></div><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Sep 21, 2022 at 5:53 PM Markus Armbru=
ster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">luzhipeng &l=
t;<a href=3D"mailto:luzhipeng@cestc.cn" target=3D"_blank">luzhipeng@cestc.c=
n</a>&gt; writes:<br>
<br>
&gt; From: lu zhipeng &lt;<a href=3D"mailto:luzhipeng@cestc.cn" target=3D"_=
blank">luzhipeng@cestc.cn</a>&gt;<br>
&gt;<br>
&gt; Signed-off-by: lu zhipeng &lt;<a href=3D"mailto:luzhipeng@cestc.cn" ta=
rget=3D"_blank">luzhipeng@cestc.cn</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 qga/main.c | 19 ++++++++++++++-----<br>
&gt;=C2=A0 1 file changed, 14 insertions(+), 5 deletions(-)<br>
&gt;<br>
&gt; diff --git a/qga/main.c b/qga/main.c<br>
&gt; index 5f1efa2333..73ea1aae65 100644<br>
&gt; --- a/qga/main.c<br>
&gt; +++ b/qga/main.c<br>
&gt; @@ -1287,7 +1287,7 @@ static GAState *initialize_agent(GAConfig *confi=
g, int socket_activation)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (g_mkdir_with_parents(config-&gt;state_dir, S_I=
RWXU) =3D=3D -1) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_critical(&quot;unable to create (a=
n ancestor of) the state directory&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot; &#39;%s&#39;: %s&quot;, config-&gt;state_dir, strerror(errno))=
;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto failed;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt; @@ -1312,7 +1312,7 @@ static GAState *initialize_agent(GAConfig *confi=
g, int socket_activation)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!log_file) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_critic=
al(&quot;unable to open specified log file: %s&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strerror(errno));<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto failed;<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;log_file =3D log=
_file;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -1323,7 +1323,7 @@ static GAState *initialize_agent(GAConfig *confi=
g, int socket_activation)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;pstate_filepath,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ga_is_frozen(s))) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_critical(&quot;failed to load pers=
istent state&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto failed;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 config-&gt;blacklist =3D ga_command_blacklist_init=
(config-&gt;blacklist);<br>
&gt; @@ -1344,7 +1344,7 @@ static GAState *initialize_agent(GAConfig *confi=
g, int socket_activation)<br>
&gt;=C2=A0 #ifndef _WIN32<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (!register_signal_handlers()) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_critical(&quot;failed to register =
signal handlers&quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto failed;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt; @@ -1357,12 +1357,21 @@ static GAState *initialize_agent(GAConfig *con=
fig, int socket_activation)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;wakeup_event =3D CreateEvent(NULL, TRUE, FAL=
SE, TEXT(&quot;WakeUp&quot;));<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (s-&gt;wakeup_event =3D=3D NULL) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_critical(&quot;CreateEvent failed&=
quot;);<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto failed;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 #endif<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ga_state =3D s;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return s;<br>
&gt; +<br>
&gt; +failed:<br>
&gt; +=C2=A0 =C2=A0 g_free(s-&gt;pstate_filepath);<br>
&gt; +=C2=A0 =C2=A0 g_free(s-&gt;state_filepath_isfrozen);<br>
&gt; +=C2=A0 =C2=A0 if (s-&gt;log_file &amp;&amp; s-&gt;log_file !=3D stder=
r) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 fclose(s-&gt;log_file);<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 g_free(s);<br></blockquote><div><br></div><div>I think =
we can just add g_autofree/<span class=3D"gmail-pl-c1">g_autoptr for all po=
inters in GAState and GLib will clean it automatically </span></div><div><b=
r></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +=C2=A0 =C2=A0 return NULL;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static void cleanup_agent(GAState *s)<br>
<br>
The function&#39;s only caller is main():<br>
<br>
=C2=A0 =C2=A0int main(int argc, char **argv)<br>
=C2=A0 =C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret =3D EXIT_SUCCESS;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0s =3D initialize_agent(config, socket_activation=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!s) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_critical(&quot;error initializin=
g guest agent&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto end;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0...<br>
<br>
=C2=A0 =C2=A0end:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (config-&gt;daemonize) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0unlink(config-&gt;pid_filepath);<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0config_free(config);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
=C2=A0 =C2=A0}<br>
<br>
When initialize_agent() fails, the process terminates immediately.<br>
There is no memory leak.<br>
<br>
We might want to free in initialize_agent() anyway.=C2=A0 Up to the<br>
maintainer.<br>
<br>
Bug (not related to this patch): when initialize_agent() fails, we still<br=
>
terminate successfully.=C2=A0 We should ret =3D EXIT_FAILURE before goto en=
d,<br>
like we do elsewhere in main().<br></blockquote><div><br></div><div>Yes, I =
agree with this.<br></div><div>=C2=A0</div></div></div>

--00000000000060cd5405e93f28d9--


