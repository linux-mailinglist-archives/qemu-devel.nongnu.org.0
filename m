Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1754E3EDF45
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Aug 2021 23:21:37 +0200 (CEST)
Received: from localhost ([::1]:34336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFk35-0004F5-F5
	for lists+qemu-devel@lfdr.de; Mon, 16 Aug 2021 17:21:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mFk20-0003Rc-A0
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:20:28 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:43686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1mFk1w-00069X-PR
 for qemu-devel@nongnu.org; Mon, 16 Aug 2021 17:20:28 -0400
Received: by mail-io1-xd32.google.com with SMTP id n24so6801062ion.10
 for <qemu-devel@nongnu.org>; Mon, 16 Aug 2021 14:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AmnDX1QXpM/sZ8Up6d3ZDpxhl64++Vgid4bF/QohkLM=;
 b=t9dwNCAeBupZ/mJJVQJ/CNQHMIWH3UcqaFKvN7Px8mqhso0g+F+19MjvENipyPk5r2
 jNgaAvJzbr6bCkfHePgyaXsdg8bso7/S0Umyaz+YVB54c6sRfky44XX0AKu7Zf9C1Lv6
 sd4Tk7FTXBspVT0LjhgD1k+JcjFDGwxaW1N3rsGLcwT6CYsRZyUq31VtUb9WotOXRYLT
 0XGDbFHNg+Lz3F5wzAfhhtXMNfTcL6DP1/8wGDCoSPwDx0VxQo76/q23fnmDXF8jH7Qs
 8Rch0iyYKlyw69DMwNZCMcg8DCwiObxaqpXRbUCK6l8pcfEYFfc+953WS2SKM/jNVAPx
 i4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AmnDX1QXpM/sZ8Up6d3ZDpxhl64++Vgid4bF/QohkLM=;
 b=mXt3Xph7TZNiG2k5sjFWI7nFvYb6YJSUSZ7+KlEv/RfLebZ31Bv9aIbAdH2gpKgoNd
 oIz+VUxeckJ9nWyPiyfxXqCIJJNMtKEvU4X4Sa13N6Tumn5eFDNJ8Kd5a3cMociZApS8
 IdMIt+bnswlUAMXFXf/5IyV2nqyz75natnH29x8VeVATkK69BANL9P+crIT1XoIGFP1E
 r8ZFPwTwise/sizAZM1dSDEoF+otLyoK166C1p9q1Yda5j4XkxNkWs1LG3+npqOjrCLc
 vdzK9llYTIuheivGVl2paqi6AB3kiymz2MxF8xE3poOOlmQroUuiHC6OnM2+nvzx5Pr9
 LbSw==
X-Gm-Message-State: AOAM532VcA0a2v/K3fpLTmicbJfh6pZAdtj6KedDxUeyzQOG5eXWuP9m
 oN6EI13HC8JK1V36dLjcNZSUEWFdWM75mcYw8Ps=
X-Google-Smtp-Source: ABdhPJxeDDXl9B6tgmuLMmT2bar5htGblR9GHiAokfdsyYZJVOYG0cYAcA2c8GCvA+31lxRBw3CUxEsEbzOnyI790aA=
X-Received: by 2002:a02:7f48:: with SMTP id r69mr583945jac.17.1629148823123;
 Mon, 16 Aug 2021 14:20:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
 <20210730201846.5147-9-niteesh.gs@gmail.com>
 <CAFn=p-ZR0BF_G05rn07tDiBWOQZNYhOb091-Dgs+JnXrG1OjFQ@mail.gmail.com>
In-Reply-To: <CAFn=p-ZR0BF_G05rn07tDiBWOQZNYhOb091-Dgs+JnXrG1OjFQ@mail.gmail.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Tue, 17 Aug 2021 02:49:57 +0530
Message-ID: <CAN6ztm-Pad9Pg=sNS5DGyTETn5RpTwnAwgc6KrRyXC=BkVBiTA@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] python/aqmp-tui: add syntax highlighting
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000e3798b05c9b3c43d"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=niteesh.gs@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000e3798b05c9b3c43d
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 17, 2021 at 1:14 AM John Snow <jsnow@redhat.com> wrote:

>
>
> On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh Babu <niteesh.gs@gmail.com>
> wrote:
>
>> Add syntax highlighting for the incoming and outgoing QMP messages.
>> This is achieved using the pygments module which was added in a
>> previous commit.
>>
>> The current implementation is a really simple one which doesn't
>> allow for any configuration. In future this has to be improved
>> to allow for easier theme config using an external config of
>> some sort.
>>
>> Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
>> ---
>>  python/qemu/aqmp/aqmp_tui.py | 52 +++++++++++++++++++++++++++---------
>>  1 file changed, 40 insertions(+), 12 deletions(-)
>>
>> diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
>> index ab9ada793a..0d5ec62cb7 100644
>> --- a/python/qemu/aqmp/aqmp_tui.py
>> +++ b/python/qemu/aqmp/aqmp_tui.py
>> @@ -19,6 +19,8 @@
>>      Union,
>>  )
>>
>> +from pygments import lexers
>> +from pygments import token as Token
>>  import urwid
>>  import urwid_readline
>>
>> @@ -35,6 +37,22 @@
>>  LOGGER = logging.getLogger()
>>
>>
>> +palette = [
>> +    (Token.Punctuation, '', '', '', 'h15,bold', 'g7'),
>> +    (Token.Text, '', '', '', '', 'g7'),
>> +    (Token.Name.Tag, '', '', '', 'bold,#f88', 'g7'),
>> +    (Token.Literal.Number.Integer, '', '', '', '#fa0', 'g7'),
>> +    (Token.Literal.String.Double, '', '', '', '#6f6', 'g7'),
>> +    (Token.Keyword.Constant, '', '', '', '#6af', 'g7'),
>> +    ('DEBUG', '', '', '', '#ddf', 'g7'),
>> +    ('INFO', '', '', '', 'g100', 'g7'),
>> +    ('WARNING', '', '', '', '#ff6', 'g7'),
>> +    ('ERROR', '', '', '', '#a00', 'g7'),
>> +    ('CRITICAL', '', '', '', '#a00', 'g7'),
>> +    ('background', '', 'black', '', '', 'g7'),
>> +]
>> +
>> +
>>  def format_json(msg: str) -> str:
>>      """
>>      Formats given multiline JSON message into a single line message.
>> @@ -57,17 +75,14 @@ def __init__(self, address: Union[str, Tuple[str,
>> int]]) -> None:
>>          self.aloop: Optional[Any] = None  # FIXME: Use more concrete
>> type.
>>          super().__init__()
>>
>> -    def add_to_history(self, msg: str) -> None:
>> -        urwid.emit_signal(self, UPDATE_MSG, msg)
>> +    def add_to_history(self, msg: str, level: Optional[str] = None) ->
>> None:
>> +        urwid.emit_signal(self, UPDATE_MSG, msg, level)
>>
>>      def _cb_outbound(self, msg: Message) -> Message:
>>          # FIXME: I think the ideal way to omit these messages during
>> in-TUI
>> -        # logging will be to add a filter to the logger. We can use
>> regex to
>> -        # filter out messages starting with 'Request:' or 'Response:'
>> but I
>> -        # think a better approach will be encapsulate the message in an
>> object
>> -        # and filter based on the object. Encapsulation of the message
>> will
>> -        # also be necessary when we want different formatting of messages
>> -        # inside TUI.
>> +        # logging will be to add a filter to the logger. We can use
>> +        # regex/startswith to filter out messages starting with
>> 'Request:' or
>> +        # 'Response:'. If possible please suggest other ideas.
>>
>
> We'll want to fix this up earlier in the series -- the finished version of
> your series shouldn't have FIXME comments, and later patches in the series
> shouldn't edit comments added earlier. We chatted on IRC about the right
> strategy for filtering log messages, so I think V4 should have a strategy
> in place to avoid this comment, right?
>
Yes, this has been addressed in the v4.
We avoid logging messages when we log the messages to the TUI screen. This
is done by checking if TUILogHandler is installed on the logger or not.

>
>
>>          handler = LOGGER.handlers[0]
>>          if not isinstance(handler, TUILogHandler):
>>              LOGGER.debug('Request: %s', str(msg))
>> @@ -156,6 +171,9 @@ def _get_formatted_address(self) -> str:
>>              self._set_status('Server shutdown')
>>
>>      def run(self, debug: bool = False) -> None:
>> +        screen = urwid.raw_display.Screen()
>> +        screen.set_terminal_properties(256)
>>
>
> I'm not sure if this will work everywhere, but ... it's fine for now, I
> assume.
>
I'll add a note here.

> +
>>          self.aloop = asyncio.get_event_loop()
>>          self.aloop.set_debug(debug)
>>
>> @@ -167,6 +185,8 @@ def run(self, debug: bool = False) -> None:
>>          event_loop = urwid.AsyncioEventLoop(loop=self.aloop)
>>          main_loop = urwid.MainLoop(urwid.AttrMap(self.window,
>> 'background'),
>>                                     unhandled_input=self.unhandled_input,
>> +                                   screen=screen,
>> +                                   palette=palette,
>>                                     handle_mouse=True,
>>                                     event_loop=event_loop)
>>
>> @@ -251,7 +271,8 @@ def __init__(self, master: App) -> None:
>>          self.history = urwid.SimpleFocusListWalker([])
>>          super().__init__(self.history)
>>
>> -    def add_to_history(self, history: str) -> None:
>> +    def add_to_history(self,
>> +                       history: Union[str, List[Tuple[str, str]]]) ->
>> None:
>>          self.history.append(urwid.Text(history))
>>          if self.history:
>>              self.history.set_focus(len(self.history) - 1)
>> @@ -271,8 +292,15 @@ def __init__(self, master: App) -> None:
>>          super().__init__(self.body)
>>          urwid.connect_signal(self.master, UPDATE_MSG,
>> self.cb_add_to_history)
>>
>> -    def cb_add_to_history(self, msg: str) -> None:
>> -        self.history.add_to_history(msg)
>> +    def cb_add_to_history(self, msg: str, level: Optional[str] = None)
>> -> None:
>> +        formatted = []
>> +        if level:
>> +            formatted.append((level, msg))
>> +        else:
>> +            lexer = lexers.JsonLexer()  # pylint: disable=no-member
>> +            for token in lexer.get_tokens(msg):
>> +                formatted.append(token)
>> +        self.history.add_to_history(formatted)
>>
>
> This looks like it's conflating having a debugging level with receiving a
> message that's already formatted.
>
> i.e., the code here assumes that if it receives a level, it is ALSO
> already formatted. That smells like trouble -- but I think there are some
> changes to the logging and rendering you had planned for V4 anyway, I
> believe?
>
Why do you think it is trouble?
When a level is provided, it is most probably going to be text messages or
QMP messages with text. In either case, there is no formatting to be done.
In the second case, we don't have a JSON formattor that can format
a JSON message along with text without breaking. So I thought it is better
to leave the formatting to the user and just use the level to provide
syntax highlighting.

One thing I have changed in v4 is the level is prefixed to the messages
rather than the user adding it manually.
i.e. in v3 -
         self.add_to_history('[ERROR]: This is error', 'ERROR')   results
in  [ERROR]: This is error
     in v4 -
         self.add_to_history('This is error', 'ERROR')   results in
[ERROR]: This is error


>>  class Window(urwid.Frame):
>> @@ -298,7 +326,7 @@ def emit(self, record: LogRecord) -> None:
>>          level = record.levelname
>>          msg = record.getMessage()
>>          msg = f'[{level}]: {msg}'
>> -        self.tui.add_to_history(msg)
>> +        self.tui.add_to_history(msg, level)
>>
>>
>>  def main() -> None:
>> --
>> 2.17.1
>>
>>

--000000000000e3798b05c9b3c43d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Aug 17, 2021 at 1:14 AM John Snow &lt;<a hr=
ef=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@redhat.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, Jul 30, 2021 at 4:19 PM G S Niteesh B=
abu &lt;<a href=3D"mailto:niteesh.gs@gmail.com" target=3D"_blank">niteesh.g=
s@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Add syntax highlighting for the incoming and outgoing QMP messag=
es.<br>
This is achieved using the pygments module which was added in a<br>
previous commit.<br>
<br>
The current implementation is a really simple one which doesn&#39;t<br>
allow for any configuration. In future this has to be improved<br>
to allow for easier theme config using an external config of<br>
some sort.<br>
<br>
Signed-off-by: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com"=
 target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br>
---<br>
=C2=A0python/qemu/aqmp/aqmp_tui.py | 52 +++++++++++++++++++++++++++--------=
-<br>
=C2=A01 file changed, 40 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py<br=
>
index ab9ada793a..0d5ec62cb7 100644<br>
--- a/python/qemu/aqmp/aqmp_tui.py<br>
+++ b/python/qemu/aqmp/aqmp_tui.py<br>
@@ -19,6 +19,8 @@<br>
=C2=A0 =C2=A0 =C2=A0Union,<br>
=C2=A0)<br>
<br>
+from pygments import lexers<br>
+from pygments import token as Token<br>
=C2=A0import urwid<br>
=C2=A0import urwid_readline<br>
<br>
@@ -35,6 +37,22 @@<br>
=C2=A0LOGGER =3D logging.getLogger()<br>
<br>
<br>
+palette =3D [<br>
+=C2=A0 =C2=A0 (Token.Punctuation, &#39;&#39;, &#39;&#39;, &#39;&#39;, &#39=
;h15,bold&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (Token.Text, &#39;&#39;, &#39;&#39;, &#39;&#39;, &#39;&#39;,=
 &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (Token.Name.Tag, &#39;&#39;, &#39;&#39;, &#39;&#39;, &#39;bo=
ld,#f88&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (Token.Literal.Number.Integer, &#39;&#39;, &#39;&#39;, &#39;=
&#39;, &#39;#fa0&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (Token.Literal.String.Double, &#39;&#39;, &#39;&#39;, &#39;&=
#39;, &#39;#6f6&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (Token.Keyword.Constant, &#39;&#39;, &#39;&#39;, &#39;&#39;,=
 &#39;#6af&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (&#39;DEBUG&#39;, &#39;&#39;, &#39;&#39;, &#39;&#39;, &#39;#=
ddf&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (&#39;INFO&#39;, &#39;&#39;, &#39;&#39;, &#39;&#39;, &#39;g1=
00&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (&#39;WARNING&#39;, &#39;&#39;, &#39;&#39;, &#39;&#39;, &#39=
;#ff6&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (&#39;ERROR&#39;, &#39;&#39;, &#39;&#39;, &#39;&#39;, &#39;#=
a00&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (&#39;CRITICAL&#39;, &#39;&#39;, &#39;&#39;, &#39;&#39;, &#3=
9;#a00&#39;, &#39;g7&#39;),<br>
+=C2=A0 =C2=A0 (&#39;background&#39;, &#39;&#39;, &#39;black&#39;, &#39;&#3=
9;, &#39;&#39;, &#39;g7&#39;),<br>
+]<br>
+<br>
+<br>
=C2=A0def format_json(msg: str) -&gt; str:<br>
=C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0Formats given multiline JSON message into a single line=
 message.<br>
@@ -57,17 +75,14 @@ def __init__(self, address: Union[str, Tuple[str, int]]=
) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.aloop: Optional[Any] =3D None=C2=A0 =
# FIXME: Use more concrete type.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super().__init__()<br>
<br>
-=C2=A0 =C2=A0 def add_to_history(self, msg: str) -&gt; None:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 urwid.emit_signal(self, UPDATE_MSG, msg)<br>
+=C2=A0 =C2=A0 def add_to_history(self, msg: str, level: Optional[str] =3D =
None) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 urwid.emit_signal(self, UPDATE_MSG, msg, level=
)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def _cb_outbound(self, msg: Message) -&gt; Message:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# FIXME: I think the ideal way to omit th=
ese messages during in-TUI<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # logging will be to add a filter to the logge=
r. We can use regex to<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # filter out messages starting with &#39;Reque=
st:&#39; or &#39;Response:&#39; but I<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # think a better approach will be encapsulate =
the message in an object<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # and filter based on the object. Encapsulatio=
n of the message will<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # also be necessary when we want different for=
matting of messages<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # inside TUI.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # logging will be to add a filter to the logge=
r. We can use<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # regex/startswith to filter out messages star=
ting with &#39;Request:&#39; or<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # &#39;Response:&#39;. If possible please sugg=
est other ideas.<br></blockquote><div><br></div><div>We&#39;ll want to fix =
this up earlier in the series -- the finished version of your series should=
n&#39;t have FIXME comments, and later patches in the series shouldn&#39;t =
edit comments added earlier. We chatted on IRC about the right strategy for=
 filtering log messages, so I think V4 should have a strategy in place to a=
void this comment, right?<br></div></div></div></blockquote><div><span clas=
s=3D"gmail_default" style=3D"font-size:small">Yes, this has been addressed =
in the v4.</span></div><div><span class=3D"gmail_default" style=3D"font-siz=
e:small">We avoid logging messages when we log the messages to the TUI scre=
en. This is done by checking if TUILogHandler is installed on the logger or=
 not.</span></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div di=
r=3D"ltr"><div class=3D"gmail_quote"><div></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0handler =3D LOGGER.handlers[0]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not isinstance(handler, TUILogHandler)=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0LOGGER.debug(&#39;Request: =
%s&#39;, str(msg))<br>
@@ -156,6 +171,9 @@ def _get_formatted_address(self) -&gt; str:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._set_status(&#39;Serve=
r shutdown&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def run(self, debug: bool =3D False) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 screen =3D urwid.raw_display.Screen()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 screen.set_terminal_properties(256)<br></block=
quote><div><br></div><div>I&#39;m not sure if this will work everywhere, bu=
t ... it&#39;s fine for now, I assume.</div></div></div></blockquote><div><=
span class=3D"gmail_default" style=3D"font-size:small">I&#39;ll add a note =
here.</span>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><=
div dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.aloop =3D asyncio.get_event_loop()<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.aloop.set_debug(debug)<br>
<br>
@@ -167,6 +185,8 @@ def run(self, debug: bool =3D False) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0event_loop =3D urwid.AsyncioEventLoop(loo=
p=3Dself.aloop)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0main_loop =3D urwid.MainLoop(urwid.AttrMa=
p(self.window, &#39;background&#39;),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unhandled_input=3Dself=
.unhandled_input,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0screen=3Dscreen,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0palette=3Dpalette,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 handle_mouse=3DTrue,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 event_loop=3Devent_loo=
p)<br>
<br>
@@ -251,7 +271,8 @@ def __init__(self, master: App) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.history =3D urwid.SimpleFocusListWal=
ker([])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super().__init__(self.history)<br>
<br>
-=C2=A0 =C2=A0 def add_to_history(self, history: str) -&gt; None:<br>
+=C2=A0 =C2=A0 def add_to_history(self,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0history: Union[str, List[Tuple[str, str]]]) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.history.append(urwid.Text(history))<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.history:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.history.set_focus(len(=
self.history) - 1)<br>
@@ -271,8 +292,15 @@ def __init__(self, master: App) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super().__init__(self.body)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0urwid.connect_signal(self.master, UPDATE_=
MSG, self.cb_add_to_history)<br>
<br>
-=C2=A0 =C2=A0 def cb_add_to_history(self, msg: str) -&gt; None:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history.add_to_history(msg)<br>
+=C2=A0 =C2=A0 def cb_add_to_history(self, msg: str, level: Optional[str] =
=3D None) -&gt; None:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 formatted =3D []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if level:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 formatted.append((level, msg))<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lexer =3D lexers.JsonLexer()=C2=
=A0 # pylint: disable=3Dno-member<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for token in lexer.get_tokens(ms=
g):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 formatted.append(t=
oken)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.history.add_to_history(formatted)<br></bl=
ockquote><div><br></div><div>This looks like it&#39;s conflating having a d=
ebugging level with receiving a message that&#39;s already formatted.</div>=
<div><br></div><div>i.e., the code here assumes that if it receives a level=
, it is ALSO already formatted. That smells like trouble -- but I think the=
re are some changes to the logging and rendering you had planned for V4 any=
way, I believe?</div></div></div></blockquote><div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Why do you think it is=C2=A0trouble?</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">When a level is provid=
ed, it is most probably going to be text messages or QMP messages with text=
. In either case, there is no formatting to be done. In the second case, we=
 don&#39;t have a JSON formattor that can format</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">a JSON message along with text without br=
eaking. So I thought it is better to leave the formatting to the user and j=
ust use the level to provide syntax highlighting.</div></div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">One thing I have changed in v4 is the level =
is prefixed to the messages rather than the user adding it manually.</div><=
div class=3D"gmail_default" style=3D"font-size:small">i.e. in v3 -=C2=A0</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0self.add_to_history(&#39;[ERROR]: This is error&#39;, &#39=
;ERROR&#39;)=C2=A0 =C2=A0results in=C2=A0 [ERROR]: This is error</div><div =
class=3D"gmail_default" style=3D"font-size:small">=C2=A0 =C2=A0 =C2=A0in v4=
 -=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small"><div c=
lass=3D"gmail_default">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.add_to_histor=
y(&#39;This is error&#39;, &#39;ERROR&#39;)=C2=A0 =C2=A0results in=C2=A0 [E=
RROR]: This is error</div></div><div class=3D"gmail_default" style=3D"font-=
size:small"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><di=
v dir=3D"ltr"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
<br>
=C2=A0class Window(urwid.Frame):<br>
@@ -298,7 +326,7 @@ def emit(self, record: LogRecord) -&gt; None:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0level =3D record.levelname<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D record.getMessage()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg =3D f&#39;[{level}]: {msg}&#39;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tui.add_to_history(msg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.tui.add_to_history(msg, level)<br>
<br>
<br>
=C2=A0def main() -&gt; None:<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>
</blockquote></div></div>

--000000000000e3798b05c9b3c43d--

