Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3983F0AFA
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 20:23:41 +0200 (CEST)
Received: from localhost ([::1]:35016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGQDz-0002nx-KU
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 14:23:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mGQD2-00026w-Re
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 14:22:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24160)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mGQCy-0002U1-AT
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 14:22:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629310954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RvD1XfSo5kg4tg0aAGKyJvnDXCUf03qSbB9xkK7ojMs=;
 b=HxNkYmtfLEQBt/dr2dB0OuPsxEesrC8HPsb9OeUCftbQlQkEyVXmj5dtxDGZEQssaBVDTI
 89FyBtbTl9y7sot0OTK88uTN7e4eZECtl9rSv8/jyyDutukCDm1IZQscJMBX5SzJEbGdZc
 AihrkhgGuLlwxkkcLHkdcZ5zJMio0x0=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-420-dGcxAMWVOS-WXxOZv6mUKA-1; Wed, 18 Aug 2021 14:22:32 -0400
X-MC-Unique: dGcxAMWVOS-WXxOZv6mUKA-1
Received: by mail-ot1-f71.google.com with SMTP id
 21-20020a9d0595000000b00519f857f5ecso1406230otd.16
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 11:22:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RvD1XfSo5kg4tg0aAGKyJvnDXCUf03qSbB9xkK7ojMs=;
 b=lc4AyUXkEjc4T7eS/M2ZeDvwQpsPHom85y+Rc0Yd/jVaS7cwVx4VWiy8AYZfmeYTNM
 yoyo2Yb1rr+qnF04LW9i9cUv35jRhCuRCOUNFpIAhFKijOZRaxXFiPdRLFoWGENyNMGk
 ByEgjVlSMNj2JsBOvC2Aq/lLExF+CVJoSDu965s5DeFTPzWfLS21WZfuZ8ZtxJ3rXbAk
 uBHhecvmHG3dhxo//rmgP/k9X1CeXS+Z0UeUs2HN8qg3d7J4nldplb7eL17IOWa7+CbB
 5MCb+uTXsJDyWs5VKixSyL/qwkJuTLlW4/DpoMjxixmlAzsgw2/jgbtJQgBz9Mr7vKHA
 8f1A==
X-Gm-Message-State: AOAM533Myf1exzHVuWtJJJ7konO7dimHwMk3Xbyssu9NdW2WIX8cKWyp
 XWIqYAofgvRRXZhDkK7lN6J7wMvfznpDQg6ZKPfUwNp/5mIDsTPJsClK32zsqqAg2LjH2UhpYZ8
 E/El9aay4iiiW5YfpWpVwHrjhsXmlSqY=
X-Received: by 2002:a05:6808:1906:: with SMTP id
 bf6mr7987648oib.52.1629310951770; 
 Wed, 18 Aug 2021 11:22:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtG87s1rhX8Lk7bIyyRFjx65RBvmKoDE/WJREqeRBRcVtFo6ZmRoWVWoAQcarNs/B+awO2aj8AU2LsiWYapNs=
X-Received: by 2002:a05:6808:1906:: with SMTP id
 bf6mr7987641oib.52.1629310951560; 
 Wed, 18 Aug 2021 11:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
 <20210730201846.5147-5-niteesh.gs@gmail.com>
 <CAFn=p-athv_gqZhpjZzpcBfYfBQ4Rek1+juqoXO3Zq8UfWyvCA@mail.gmail.com>
 <CAN6ztm9r9VACvnUJ72anDmpy7hsQi=tis5Lkd-vC8NE0DCFAPg@mail.gmail.com>
In-Reply-To: <CAN6ztm9r9VACvnUJ72anDmpy7hsQi=tis5Lkd-vC8NE0DCFAPg@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 18 Aug 2021 14:22:20 -0400
Message-ID: <CAFn=p-byqejuz=4_dZWTEw_ab4fq_ii--XPdLGhTQjwLPsrFGw@mail.gmail.com>
Subject: Re: [PATCH v3 04/13] python/aqmp-tui: Add AQMP TUI draft
To: "Niteesh G. S." <niteesh.gs@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000007f2a9005c9d98449"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000007f2a9005c9d98449
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 13, 2021 at 11:11 AM Niteesh G. S. <niteesh.gs@gmail.com> wrote:

>
> On Fri, Aug 6, 2021 at 12:28 AM John Snow <jsnow@redhat.com> wrote:
>
>>
>> On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh Babu <niteesh.gs@gmail.com>
>> wrote:
>>
>>> Added a draft of AQMP TUI.
>>>
>>> Implements the follwing basic features:
>>> 1) Command transmission/reception.
>>> 2) Shows events asynchronously.
>>> 3) Shows server status in the bottom status bar.
>>>
>>> Also added necessary pylint, mypy configurations
>>>
>>> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
>>>
>>
...


> +
>>> +# Using root logger to enable all loggers under qemu and asyncio
>>> +LOGGER = logging.getLogger()
>>>
>>
>> The comment isn't quite true; this is the root logger -- but you go on to
>> use it to directly log messages. I don't think you should; use a
>> module-level logger.
>>
>> (1) Create a module-level logger that is named after the current module
>> name (e.g. qemu.aqmp.aqmp_tui) and use that for logging messages relating
>> to this module:
>> LOGGER = logging.getLogger(__name__)
>>
>> (2) Where you need to address the root logger, just use `root_logger =
>> logging.getLogger() ` .... I think the main() function is the only place
>> you might need this.
>>
> The way of logging in the TUI is changed such that, all logging is done
> through the root level logger. The handlers and levels are installed to
> the root level
> logger to allow logging from other libraries to be rerouted to the screen
> or file.
>

We talked about this on IRC, so I'll assume our disagreement in vision here
is cleared up ... or at least different :)


> +
>>> +
>>> +def format_json(msg):
>>> +    """
>>> +    Formats given multiline JSON message into a single line message.
>>> +    Converting into single line is more asthetically pleasing when
>>> looking
>>> +    along with error messages compared to multiline JSON.
>>> +    """
>>> +    # FIXME: Use better formatting mechanism. Might break at more
>>> complex JSON
>>> +    # data.
>>> +    msg = msg.replace('\n', '')
>>> +    words = msg.split(' ')
>>> +    words = [word for word in words if word != '']
>>> +    return ' '.join(words)
>>> +
>>>
>>
>> You can use the JSON module to do this,
>> https://docs.python.org/3/library/json.html#json.dumps
>>
>> Message._serialize uses this technique to send JSON messages over the
>> wire that have no newlines:
>>
>> https://gitlab.com/jsnow/qemu/-/blob/python-async-qmp-aqmp/python/qemu/aqmp/message.py#L132
>>
>> by not specifying an indent and including separators with no spaces, we
>> can get a JSON representation with all the space squeezed out. You can add
>> spaces and still omit the indent/newlines and so on.
>>
>

> But will this work for invalid JSON messages? As far as I have tried it
> doesn't work.
>

Ah, I see ... Nope, that requires a valid JSON message ... Do we *need* to
pretty-print invalid JSON?


> +
>>> +def main():
>>> +    parser = argparse.ArgumentParser(description='AQMP TUI')
>>> +    parser.add_argument('qmp_server', help='Address of the QMP server'
>>> +                        '< UNIX socket path | TCP addr:port >')
>>> +    parser.add_argument('--log-file', help='The Log file name')
>>> +    parser.add_argument('--log-level', default='WARNING',
>>> +                        help='Log level
>>> <CRITICAL|ERROR|WARNING|INFO|DEBUG|>')
>>> +    parser.add_argument('--asyncio-debug', action='store_true',
>>> +                        help='Enable debug mode for asyncio loop'
>>> +                        'Generates lot of output, makes TUI unusable
>>> when'
>>> +                        'logs are logged in the TUI itself.'
>>> +                        'Use only when logging to a file')
>>>
>>
>> Needs spaces between the lines here so that the output reads correctly.
>>
> The output renders properly for me. Can you please post a pic if it
> doesn't render correctly for you?
>

No screenshot needed, just try running with '--help'. When you concatenate
strings like this:

parser.add_argument('--asyncio-debug', action='store_true',
                    help='Enable debug mode for asyncio loop'
                    'Generates lot of output, makes TUI unusable when'
                    'logs are logged in the TUI itself.'
                    'Use only when logging to a file')
Python is going to do this:

help='Enable debug mode for asyncio loop' + 'Generates lot of output, makes
TUI unusable when' + ...

so you'll get a string like this:

help='Enable debug mode for asyncio loopGenerates lot of output, makes TUI
unusable when' + ...

--0000000000007f2a9005c9d98449
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 13, 2021 at 11:11 AM Nite=
esh G. S. &lt;<a href=3D"mailto:niteesh.gs@gmail.com">niteesh.gs@gmail.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Fri, Aug 6, 2021 at 12:28 AM John Snow &lt;<a href=3D"mailto:j=
snow@redhat.com" target=3D"_blank">jsnow@redhat.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div di=
r=3D"ltr"><br></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh Babu &lt;<a href=3D"m=
ailto:niteesh.gs@gmail.com" target=3D"_blank">niteesh.gs@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Added a d=
raft of AQMP TUI.<br>
<br>
Implements the follwing basic features:<br>
1) Command transmission/reception.<br>
2) Shows events asynchronously.<br>
3) Shows server status in the bottom status bar.<br>
<br>
Also added necessary pylint, mypy configurations<br>
<br>
Signed-off-by: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com"=
 target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br></blockquote></div></div=
></blockquote></div></div></blockquote><div><br></div><div>...<br></div><di=
v>=C2=A0 <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div d=
ir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+<br>
+# Using root logger to enable all loggers under qemu and asyncio<br>
+LOGGER =3D logging.getLogger()<br></blockquote><div><br></div><div>The com=
ment isn&#39;t quite true; this is the root logger -- but you go on to use =
it to directly log messages. I don&#39;t think you should; use a module-lev=
el logger.</div><div><br></div><div>(1) Create a module-level logger that i=
s named after the current module name (e.g. qemu.aqmp.aqmp_tui) and use tha=
t for logging messages relating to this module:</div><div>LOGGER =3D loggin=
g.getLogger(__name__)<br><br></div><div>(2) Where you need to address the r=
oot logger, just use `root_logger =3D logging.getLogger() ` .... I think th=
e main() function is the only place you might need this.</div></div></div><=
/blockquote><div><span class=3D"gmail_default" style=3D"font-size:small">Th=
e way of logging in the TUI is changed such that, a</span>ll logging is don=
e through the root level logger<span class=3D"gmail_default" style=3D"font-=
size:small">. The handlers and levels are installed to the root level</span=
></div><div><span class=3D"gmail_default" style=3D"font-size:small">logger =
to allow logging from other libraries to be rerouted to the screen or file.=
</span></div></div></div></blockquote><div><br></div><div>We talked about t=
his on IRC, so I&#39;ll assume our disagreement in vision here is cleared u=
p ... or at least different :)<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
+<br>
+def format_json(msg):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 Formats given multiline JSON message into a single line mess=
age.<br>
+=C2=A0 =C2=A0 Converting into single line is more asthetically pleasing wh=
en looking<br>
+=C2=A0 =C2=A0 along with error messages compared to multiline JSON.<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 # FIXME: Use better formatting mechanism. Might break at mor=
e complex JSON<br>
+=C2=A0 =C2=A0 # data.<br>
+=C2=A0 =C2=A0 msg =3D msg.replace(&#39;\n&#39;, &#39;&#39;)<br>
+=C2=A0 =C2=A0 words =3D msg.split(&#39; &#39;)<br>
+=C2=A0 =C2=A0 words =3D [word for word in words if word !=3D &#39;&#39;]<b=
r>
+=C2=A0 =C2=A0 return &#39; &#39;.join(words)<br>
+<br></blockquote><div><br></div><div>You can use the JSON module to do thi=
s, <a href=3D"https://docs.python.org/3/library/json.html#json.dumps" targe=
t=3D"_blank">https://docs.python.org/3/library/json.html#json.dumps</a></di=
v><div><br></div><div>Message._serialize uses this technique to send JSON m=
essages over the wire that have no newlines:</div><div><a href=3D"https://g=
itlab.com/jsnow/qemu/-/blob/python-async-qmp-aqmp/python/qemu/aqmp/message.=
py#L132" target=3D"_blank">https://gitlab.com/jsnow/qemu/-/blob/python-asyn=
c-qmp-aqmp/python/qemu/aqmp/message.py#L132</a></div><div><br></div><div>by=
 not specifying an indent and including separators with no spaces, we can g=
et a JSON representation with all the space squeezed out. You can add space=
s and still omit the indent/newlines and so on.</div></div></div></blockquo=
te></div></div></blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div style=
=3D"font-size:small">But will this work for invalid JSON messages? As far a=
s I have tried it doesn&#39;t work.</div></div></div></blockquote><div><br>=
</div><div>Ah, I see ... Nope, that requires a valid JSON message ... Do we=
 *need* to pretty-print invalid JSON?<br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
+<br>
+def main():<br>
+=C2=A0 =C2=A0 parser =3D argparse.ArgumentParser(description=3D&#39;AQMP T=
UI&#39;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;qmp_server&#39;, help=3D&#39;Addres=
s of the QMP server&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;&lt; UNIX socket path | TCP addr:port &gt;&#39;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;--log-file&#39;, help=3D&#39;The Lo=
g file name&#39;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;--log-level&#39;, default=3D&#39;WA=
RNING&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 help=3D&#39;Log level &lt;CRITICAL|ERROR|WARNING|INFO|DEBUG|&gt;=
&#39;)<br>
+=C2=A0 =C2=A0 parser.add_argument(&#39;--asyncio-debug&#39;, action=3D&#39=
;store_true&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 help=3D&#39;Enable debug mode for asyncio loop&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;Generates lot of output, makes TUI unusable when&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;logs are logged in the TUI itself.&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &#39;Use only when logging to a file&#39;)<br></blockquote><div>=
<br></div><div>Needs spaces between the lines here so that the output reads=
 correctly.<br></div></div></div></blockquote><div><span class=3D"gmail_def=
ault" style=3D"font-size:small">The output renders properly for me. Can you=
 please post a pic if it doesn&#39;t render correctly for you?</span>=C2=A0=
</div></div></div></blockquote><div><br></div><div>No screenshot needed, ju=
st try running with &#39;--help&#39;. When you concatenate strings like thi=
s:</div><div><br></div><div>parser.add_argument(&#39;--asyncio-debug&#39;, =
action=3D&#39;store_true&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 help=
=3D&#39;Enable debug mode for asyncio loop&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
Generates lot of output, makes TUI unusable when&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
logs are logged in the TUI itself.&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;=
Use only when logging to a file&#39;)</div><div></div><div>Python is going =
to do this:</div><div><br></div><div>help=3D&#39;Enable debug mode for asyn=
cio loop&#39; +  &#39;Generates lot of output, makes TUI unusable when&#39;=
=C2=A0+ ...</div><div><br></div><div>so you&#39;ll get a string like this:<=
/div><div><br></div><div>help=3D&#39;Enable debug mode for asyncio loopGene=
rates lot of output, makes TUI unusable when&#39;=C2=A0+ ...<br></div><div>=
<br></div></div></div>

--0000000000007f2a9005c9d98449--


