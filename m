Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856CC3B0D59
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 21:00:30 +0200 (CEST)
Received: from localhost ([::1]:53958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvldN-0002ZB-KB
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 15:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lvlbX-0001im-8d
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 14:58:35 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:38900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1lvlbN-0001lQ-1z
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 14:58:34 -0400
Received: by mail-il1-x12b.google.com with SMTP id v5so258054ilo.5
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 11:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nVl2PHca7rZ8bMwa1dfXtrEt1G5hXRi8Gq6H6Yapuic=;
 b=gZ6k8kl+61FpKmsFFGz10bEr5Rsei6S0fNPgPRRlba4L6bZ8G5C7AR/C02emnV2gvD
 nuvdQ9aCFut9kYPYQe8smOuN8gndF0BTg1eIRIRqzzUWgrSvyZU0NETAsln4v70Ttx/b
 LK04glVsZhFxk+sOYjPnD9WV6q/v2QdU5sSYrTLCDNuBcspWNMBYpD3G20hket3lHh0o
 4Oo6S3MYCN70N0aoCaK2gRmVsyqOmw20GUIqGMi/ldvgwkn5fbyGwW3s/zcqILHdT/5B
 /bAuTLiZtFrQNWNNTHSvrOz8C6wYAVHJUX8SbCdcT9Jgro0U8HL6wq1NY5qVqhMiNUKu
 ANvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nVl2PHca7rZ8bMwa1dfXtrEt1G5hXRi8Gq6H6Yapuic=;
 b=ujDMbrmj71QwWdlHKBYp0uFP0NqNLinK5OseW16xubPdWD50f8ZAuz4QMqnwj3ciqa
 YvqvGMf124EPs24HDr63joqGiPfZfqSNqxdWSGRkUgWW8+NFm26kc9GNsC7pPWuxZTc5
 iU5tzeagNZ2lqEVmfhDS1QQ3iaNM/LnRzsieiSvxtBiQClkE5mEd7k6/KoN+9gvXgnGm
 sm6l/A8kCh5fu3Cvi6H8TtuTPkPs/gR98PGbAdpZeHEV+aZn04obVViaRFUbJFEOpsV1
 S816TWkwvXuEtj3dxibotnVMxOMz3Jg2pEzYJW4u17hgV2NN08SxBosS/YzCiY7uPGll
 YrVA==
X-Gm-Message-State: AOAM532mhHNT02L6Bg+wOYdwjaUWw4W5B076HX4JnGyncb494HYhx/kN
 +hVEvnWw55BHP7cjvRxm/T5Y6cBqt5h6lvWFYKU=
X-Google-Smtp-Source: ABdhPJyjbAvVCMm+LAGV5orpYvS0krEmJWn/KMTAdFl2bSr1mEECk2/0jBgWXcqUEy20mReWkpNFAMkZ+aCEe3/HsWU=
X-Received: by 2002:a05:6e02:156c:: with SMTP id
 k12mr112625ilu.188.1624388301656; 
 Tue, 22 Jun 2021 11:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAN6ztm8D4VMf7p-trHNHoOA+1kAXXufTTaHpbyNXZ5qO2_uuPg@mail.gmail.com>
 <6fb6d9d7-3af2-c487-a1d4-aa1140c5a54d@redhat.com>
 <CAN6ztm8bjVnFf_X-vEzYOmTdw09bcoQSkVH9h6BdPFr-PEsP_A@mail.gmail.com>
 <YNGu80s+NHMGw6jf@stefanha-x1.localdomain>
In-Reply-To: <YNGu80s+NHMGw6jf@stefanha-x1.localdomain>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Wed, 23 Jun 2021 00:27:55 +0530
Message-ID: <CAN6ztm-cMNAM7C=y=NzmF6mLjXmqsVL45Zmtv0+=6+fT3a6q=g@mail.gmail.com>
Subject: Re: RFC: Implementation of QMP documentation retrieval command
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000b29c9b05c55f5f8b"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=niteesh.gs@gmail.com; helo=mail-il1-x12b.google.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, ehabkost@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 armbru@redhat.com, wainersm@redhat.com, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000b29c9b05c55f5f8b
Content-Type: text/plain; charset="UTF-8"

Hi Stefan,
On Tue, Jun 22, 2021 at 3:05 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Mon, Jun 21, 2021 at 11:56:30PM +0530, Niteesh G. S. wrote:
> > TLDR: The goal of this mail wasn't to review the dummy command I had
> posted
> > but
> > rather start a discussion regarding the implementation of the QMP
> > documentation
> > retrieval command for the TUI.
>
> It's not clear to me what exactly you wanted to discuss. Here is the QMP
> schema from the commit you linked. It's something concrete that we can
> discuss:
>

I wanted to discuss the implementation of the documentation retrieval
command. Things like
1) The JSON schema we will be using to represent the documentation.
2) How will we be parsing documentation from the JSON files under qemu/qapi?
3) How will/where we'll be storing this parsed information?
And other questions which will have to be answered before proceeding to
implement this command.
4) Where to get data for autocomplete for the TUI?

- One easy way is to hardcode all available commands in the TUI
   autocomplete. But then we have to make sure to update the autocomplete
   list for TUI every time one new command gets added to QMP.


  ##
>   # @CommandDocumentation:
>   #
>   # A object representing documentation for a command.
>   #
>   # @name: Command name
>   #
>   # @doc: A string containing the documentation.
>
> Is @doc in some kind of markup or plain text?
>

Since this is just a prototype I have used plain text. But for the real
command
I expect something more structured since the comments I have seen in the
QAPI schema has some structure associated with them.
eg:
##
# @query-status:
#
# Query the run status of all VCPUs
#
# Returns: @StatusInfo reflecting all VCPUs
#
# Since:  0.14
#
# Example:
#
# -> { "execute": "query-status" }
# <- { "return": { "running": true,
#                  "singlestep": false,
#                  "status": "running" } }
#
##
We have the following structure
1) Command name
2) Documentation
3) Arguments (if any)
4) Return type with reference to non-primitive data types like
structs/enums etc
5) Since
6) Example

In the case of commands referring structures/enums and other non-primitive
data types
if possible we should also add their documentation along with the
documentation
for the command.
Yes, we could find out all the data types referenced by the current command
and
add them to the documentation if possible. This will make it easy for the
user.
If it isn't possible then we must allow to also query documentation related
to struct/enums etc.

  #
>   ##
>   { 'struct': 'CommandDocumentation',
>     'data': {'name': 'str', 'doc': 'str'} }
>
>   ##
>   # @query-cmd-doc:
>   #
>   # (A simple *prototype* implementation)
>   # Command query-cmd-doc will return the documentation for the command
>   # specified. This will help QMP clients currently the AQMP TUI to show
>   # documentation related to a specific command.
>   #
>   # @command-name: The command name to query documentation for
>   #
>   # Returns: A @CommandDocumentation object containing the documentation.
>   #
>   # Since: TODO: Add a number
>   ##
>   { 'command': 'query-cmd-doc',
>     'data': { 'command-name': 'str' },
>     'returns': 'CommandDocumentation' }
>
> Is there a way to retrieve struct/enum/etc documentation?
>
Not sure. I have gone through the parser code in qemu/scripts/qapi and also
have
seen the parser being used for documentation generation but I still don't
understand
the capabilities of the parser.


> Do you see a need to query multiple items of documentation in a single
> command? A single item query command can become a performance bottleneck
> if the clients wants to query the documentation for all commands, for
> example. This can be solved by making the the return value an array and
> allowing multiple commands to be queried at once.
>
Why will clients want to query the documentation for all commands? Even if
they do
won't that be an infrequent operation?
From the TUI perspective, I think it will be enough if we just have the
capability to
service one command at a time. We can also have the TUI cache the results
and
validate the cache during the greeting process by sending some kind of hash
to
notify if any documentation has changed or not.

>
> Do you see a need for wildcard queries where the client does not have
> the full command name? I guess the client has enough auto-completion
> information to search all commands on the client side, so maybe this
> functionality isn't necessary here?
>
One of my major questions(also mentioned above) is how will the client-side
get information regarding all the commands available in QMP? If we implement
a proper autocomplete feature then I don't think we will have to worry about
wildcard queries.


> Stefan
>

--000000000000b29c9b05c55f5f8b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><div dir=3D"ltr"><div dir=3D"ltr"><div style=
=3D"font-size:small"><br></div></div><div class=3D"gmail_default" style=3D"=
font-size:small">Hi Stefan,</div><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Jun 22, 2021 at 3:05 PM Stefan Hajnoczi &lt;=
<a href=3D"mailto:stefanha@redhat.com" target=3D"_blank">stefanha@redhat.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>On Mon, Jun 21, 2021 at 11:56:30PM +0530, Niteesh G. S. wrote:<br>
&gt; TLDR: The goal of this mail wasn&#39;t to review the dummy command I h=
ad posted<br>
&gt; but<br>
&gt; rather start a discussion regarding the implementation of the QMP<br>
&gt; documentation<br>
&gt; retrieval command for the TUI.<br>
<br>
It&#39;s not clear to me what exactly you wanted to discuss. Here is the QM=
P<br>
schema from the commit you linked. It&#39;s something concrete that we can<=
br>
discuss:<br></blockquote><div>=C2=A0</div><div><div class=3D"gmail_default"=
 style=3D"font-size:small">I wanted to discuss the=C2=A0implementation of t=
he documentation retrieval</div><div class=3D"gmail_default" style=3D"font-=
size:small">command. Things like</div><div class=3D"gmail_default" style=3D=
"font-size:small">1) The JSON schema we will be using to represent the docu=
mentation.</div><div class=3D"gmail_default" style=3D"font-size:small">2) H=
ow will we be parsing documentation from the JSON files under qemu/qapi?</d=
iv><div class=3D"gmail_default" style=3D"font-size:small">3) How will/where=
 we&#39;ll be storing this parsed information?</div></div><div class=3D"gma=
il_default" style=3D"font-size:small">And other questions which will have t=
o be answered=C2=A0before proceeding to</div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">implement this command.</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">4) Where to get data for=C2=A0autocomplet=
e for the TUI?</div></div></div><blockquote style=3D"margin:0 0 0 40px;bord=
er:none;padding:0px"><div dir=3D"ltr"><div class=3D"gmail_quote"><div class=
=3D"gmail_default" style=3D"font-size:small">- One easy way is to hardcode =
all available commands in the TUI</div><div class=3D"gmail_default" style=
=3D"font-size:small">=C2=A0 =C2=A0autocomplete. But then we have to make su=
re to update the autocomplete</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">=C2=A0 =C2=A0list for TUI every time one new command gets ad=
ded to QMP.=C2=A0</div></div></div></blockquote><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div><br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
=C2=A0 ##<br>
=C2=A0 # @CommandDocumentation:<br>
=C2=A0 #<br>
=C2=A0 # A object representing documentation for a command.<br>
=C2=A0 #<br>
=C2=A0 # @name: Command name<br>
=C2=A0 #<br>
=C2=A0 # @doc: A string containing the documentation.<br>
<br>
Is @doc in some kind of markup or plain text?<br></blockquote><div>=C2=A0</=
div><div><span class=3D"gmail_default" style=3D"font-size:small">Since this=
 is just a prototype I have used plain text. But for the real command</span=
></div><div><span class=3D"gmail_default" style=3D"font-size:small">I expec=
t something more structured since the comments I have seen in the</span></d=
iv><div><span class=3D"gmail_default" style=3D"font-size:small">QAPI schema=
 has some structure associated with them.</span></div><div><span class=3D"g=
mail_default" style=3D"font-size:small">eg:</span></div><div><span class=3D=
"gmail_default" style=3D"font-size:small">##<br># @query-status:<br>#<br># =
Query the run status of all VCPUs<br>#<br># Returns: @StatusInfo reflecting=
 all VCPUs<br>#<br># Since: =C2=A00.14<br>#<br># Example:<br>#<br># -&gt; {=
 &quot;execute&quot;: &quot;query-status&quot; }<br># &lt;- { &quot;return&=
quot;: { &quot;running&quot;: true,<br># =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;singlestep&quot;: false,<br># =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;status&quot;: &qu=
ot;running&quot; } }<br>#<br>##<br></span></div><div><div class=3D"gmail_de=
fault" style=3D"font-size:small">We have the following structure</div><div =
class=3D"gmail_default" style=3D"font-size:small">1) Command name</div><div=
 class=3D"gmail_default" style=3D"font-size:small">2) Documentation</div><d=
iv class=3D"gmail_default" style=3D"font-size:small">3) Arguments (if any)<=
/div><div class=3D"gmail_default" style=3D"font-size:small">4) Return type =
with reference to non-primitive data types like structs/enums etc</div><div=
 class=3D"gmail_default" style=3D"font-size:small">5) Since</div><div class=
=3D"gmail_default" style=3D"font-size:small">6) Example</div></div><div><sp=
an class=3D"gmail_default" style=3D"font-size:small"><br></span></div><div>=
<span class=3D"gmail_default" style=3D"font-size:small">In the case of comm=
ands referring structures/enums and other non-primitive data types</span></=
div><div><span class=3D"gmail_default" style=3D"font-size:small">if possibl=
e we should also=C2=A0</span>add their<span class=3D"gmail_default" style=
=3D"font-size:small"></span> documentation<span class=3D"gmail_default" sty=
le=3D"font-size:small"> along with the documentation</span></div><div><span=
 class=3D"gmail_default" style=3D"font-size:small">for the command.</span><=
/div><div class=3D"gmail_default" style=3D"font-size:small">Yes, we could f=
ind out all the data types referenced by the current command and</div><div =
class=3D"gmail_default" style=3D"font-size:small">add them to the documenta=
tion if possible. This will make it easy for the user.</div><div class=3D"g=
mail_default" style=3D"font-size:small">If it isn&#39;t possible then we mu=
st allow to also query documentation related to struct/enums etc.</div><div=
><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 #<br>
=C2=A0 ##<br>
=C2=A0 { &#39;struct&#39;: &#39;CommandDocumentation&#39;,<br>
=C2=A0 =C2=A0 &#39;data&#39;: {&#39;name&#39;: &#39;str&#39;, &#39;doc&#39;=
: &#39;str&#39;} }<br>
<br>
=C2=A0 ##<br>
=C2=A0 # @query-cmd-doc:<br>
=C2=A0 #<br>
=C2=A0 # (A simple *prototype* implementation)<br>
=C2=A0 # Command query-cmd-doc will return the documentation for the comman=
d<br>
=C2=A0 # specified. This will help QMP clients currently the AQMP TUI to sh=
ow<br>
=C2=A0 # documentation related to a specific command.<br>
=C2=A0 #<br>
=C2=A0 # @command-name: The command name to query documentation for<br>
=C2=A0 #<br>
=C2=A0 # Returns: A @CommandDocumentation object containing the documentati=
on.<br>
=C2=A0 #<br>
=C2=A0 # Since: TODO: Add a number<br>
=C2=A0 ##<br>
=C2=A0 { &#39;command&#39;: &#39;query-cmd-doc&#39;,<br>
=C2=A0 =C2=A0 &#39;data&#39;: { &#39;command-name&#39;: &#39;str&#39; },<br=
>
=C2=A0 =C2=A0 &#39;returns&#39;: &#39;CommandDocumentation&#39; }<br>
<br>
Is there a way to retrieve struct/enum/etc documentation?<br></blockquote><=
div><div class=3D"gmail_default" style=3D"font-size:small">Not sure. I have=
 gone through the parser code in qemu/scripts/qapi and also have</div><div =
class=3D"gmail_default" style=3D"font-size:small">seen the parser being use=
d for documentation generation but I still don&#39;t understand</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">the capabilities of the pa=
rser.</div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Do you see a need to query multiple items of documentation in a single<br>
command? A single item query command can become a performance bottleneck<br=
>
if the clients wants to query the documentation for all commands, for<br>
example. This can be solved by making the the return value an array and<br>
allowing multiple commands to be queried at once.<br></blockquote><div><spa=
n class=3D"gmail_default" style=3D"font-size:small">Why will clients want t=
o query the documentation for all commands? Even if they do</span></div><di=
v><span class=3D"gmail_default" style=3D"font-size:small">won&#39;t that be=
 an infrequent operation?</span></div><div class=3D"gmail_default" style=3D=
"font-size:small">From the TUI perspective, I think it will be enough if we=
 just have the capability to</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">service one command at a time. We can also have the TUI cache=
 the results and</div><div class=3D"gmail_default" style=3D"font-size:small=
">validate the cache during the greeting process by sending some kind of ha=
sh to</div><div class=3D"gmail_default" style=3D"font-size:small">notify if=
 any documentation has changed or not.</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
Do you see a need for wildcard queries where the client does not have<br>
the full command name? I guess the client has enough auto-completion<br>
information to search all commands on the client side, so maybe this<br>
functionality isn&#39;t necessary here?<br></blockquote><div><div class=3D"=
gmail_default" style=3D"font-size:small">One of my major questions(also men=
tioned above) is how will the client-side</div><div class=3D"gmail_default"=
 style=3D"font-size:small">get information regarding all the commands avail=
able in QMP? If we implement</div><div class=3D"gmail_default" style=3D"fon=
t-size:small">a proper autocomplete feature then I don&#39;t think we will =
have to worry about</div><div class=3D"gmail_default" style=3D"font-size:sm=
all">wildcard queries.</div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
Stefan<br>
</blockquote></div></div>
</div>

--000000000000b29c9b05c55f5f8b--

