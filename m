Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEB7392E36
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 14:44:40 +0200 (CEST)
Received: from localhost ([::1]:60108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmFNP-0001qD-27
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 08:44:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lmE9B-0000ad-M8; Thu, 27 May 2021 07:25:57 -0400
Received: from [201.28.113.2] (port=18872 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lmE98-00051A-Tw; Thu, 27 May 2021 07:25:52 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 27 May 2021 08:24:41 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 651268013E1;
 Thu, 27 May 2021 08:24:41 -0300 (-03)
Subject: Re: [PATCH 4/5] monitor: removed cpustats command
To: Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210526202104.127910-1-bruno.larsen@eldorado.org.br>
 <20210526202104.127910-5-bruno.larsen@eldorado.org.br>
 <20210527084038.512c5270@bahia.lan> <YK9T02A3IwwnKYUl@work-vm>
 <20210527103034.23f3c8ce@bahia.lan>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <9581ce18-19f3-88fa-a042-c34eb7752eb4@eldorado.org.br>
Date: Thu, 27 May 2021 08:24:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527103034.23f3c8ce@bahia.lan>
Content-Type: multipart/alternative;
 boundary="------------86291356B748B0CAD28358A1"
Content-Language: en-US
X-OriginalArrivalTime: 27 May 2021 11:24:41.0779 (UTC)
 FILETIME=[E32B0030:01D752EA]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: farosas@linux.ibm.com, richard.henderson@linaro.org,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 lucas.araujo@eldorado.org.br, luis.pires@eldorado.org.br,
 fernando.valle@eldorado.org.br, qemu-ppc@nongnu.org,
 matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------86291356B748B0CAD28358A1
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 27/05/2021 05:30, Greg Kurz wrote:
> On Thu, 27 May 2021 09:09:55 +0100
> "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
>
>> * Greg Kurz (groug@kaod.org) wrote:
>>> On Wed, 26 May 2021 17:21:03 -0300
>>> "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br> wrote:
>>>
>>>> Since ppc was the last architecture to collect these statistics and
>>>> it is currently phasing this collection out, the command that would query
>>>> this information is being removed.
>>>>
>>> So this is removing an obviously user visible feature. This should be
>>> mentioned in docs/system/removed-features.rst... but, wait, I don't
>>> see anything for it in docs/system/deprecated.rst. This is dropping
>>> a feature without following the usual deprecation policy, i.e.
>>> marking the feature as deprecated and only remove it 2 QEMU versions
>>> later. Any justification for that ?

The command called a function that ultimately called an empty callback 
unless you changed target/ppc/translate.c and removed the comments 
around #define DO_PPC_STATISTICS. And like I mentioned in the cover 
letter (which may not have been CC'ed to you, sorry) ppc was the last 
architecture to support this feature while they were using the legacy 
decode system, but as they move to decodetree, this data wouldn't even 
be collected.

That's the justification, basically.

>> As long as the command really isn't useful any more, I wouldn't object
>> to that from an HMP point of view.
>>
> Ok then this should be documented in docs/system/removed-features.rst at
> least.
Sure, will send a patch later today with the update
>
>> Dave
>>
>>> David,
>>>
>>> Unrelated, I saw that you already applied this to ppc-for-6.1 on gitlab
>>> but the commit title appears to be broken:
>>>
>>> '65;6401;1cmonitor: removed cpustats command
>>>
>>> https://gitlab.com/dgibson/qemu/-/commit/532be563eae6b8ae834ff7e9ebb1428f53569a69
>>>
>>>> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
>>>> Signed-off-by: Bruno Larsen (billionai) <bruno.larsen@eldorado.org.br>
>>>> ---
>>>>   hmp-commands-info.hx | 13 -------------
>>>>   monitor/misc.c       | 11 -----------
>>>>   2 files changed, 24 deletions(-)
>>>>
>>>> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
>>>> index ab0c7aa5ee..b2347a6aea 100644
>>>> --- a/hmp-commands-info.hx
>>>> +++ b/hmp-commands-info.hx
>>>> @@ -500,19 +500,6 @@ SRST
>>>>       Show the current VM UUID.
>>>>   ERST
>>>>   
>>>> -    {
>>>> -        .name       = "cpustats",
>>>> -        .args_type  = "",
>>>> -        .params     = "",
>>>> -        .help       = "show CPU statistics",
>>>> -        .cmd        = hmp_info_cpustats,
>>>> -    },
>>>> -
>>>> -SRST
>>>> -  ``info cpustats``
>>>> -    Show CPU statistics.
>>>> -ERST
>>>> -
>>>>   #if defined(CONFIG_SLIRP)
>>>>       {
>>>>           .name       = "usernet",
>>>> diff --git a/monitor/misc.c b/monitor/misc.c
>>>> index f3a393ea59..1539e18557 100644
>>>> --- a/monitor/misc.c
>>>> +++ b/monitor/misc.c
>>>> @@ -369,17 +369,6 @@ static void hmp_info_history(Monitor *mon, const QDict *qdict)
>>>>       }
>>>>   }
>>>>   
>>>> -static void hmp_info_cpustats(Monitor *mon, const QDict *qdict)
>>>> -{
>>>> -    CPUState *cs = mon_get_cpu(mon);
>>>> -
>>>> -    if (!cs) {
>>>> -        monitor_printf(mon, "No CPU available\n");
>>>> -        return;
>>>> -    }
>>>> -    cpu_dump_statistics(cs, 0);
>>>> -}
>>>> -
>>>>   static void hmp_info_trace_events(Monitor *mon, const QDict *qdict)
>>>>   {
>>>>       const char *name = qdict_get_try_str(qdict, "name");
-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------86291356B748B0CAD28358A1
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 27/05/2021 05:30, Greg Kurz wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210527103034.23f3c8ce@bahia.lan">
      <pre class="moz-quote-pre" wrap="">On Thu, 27 May 2021 09:09:55 +0100
"Dr. David Alan Gilbert" <a class="moz-txt-link-rfc2396E" href="mailto:dgilbert@redhat.com">&lt;dgilbert@redhat.com&gt;</a> wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">* Greg Kurz (<a class="moz-txt-link-abbreviated" href="mailto:groug@kaod.org">groug@kaod.org</a>) wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">On Wed, 26 May 2021 17:21:03 -0300
"Bruno Larsen (billionai)" <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a> wrote:

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Since ppc was the last architecture to collect these statistics and
it is currently phasing this collection out, the command that would query
this information is being removed.

</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
So this is removing an obviously user visible feature. This should be
mentioned in docs/system/removed-features.rst... but, wait, I don't
see anything for it in docs/system/deprecated.rst. This is dropping
a feature without following the usual deprecation policy, i.e.
marking the feature as deprecated and only remove it 2 QEMU versions
later. Any justification for that ?</pre>
        </blockquote>
      </blockquote>
    </blockquote>
    <p>The command called a function that ultimately called an empty
      callback unless you changed target/ppc/translate.c and removed the
      comments around #define DO_PPC_STATISTICS. And like I mentioned in
      the cover letter (which may not have been CC'ed to you, sorry) ppc
      was the last architecture to support this feature while they were
      using the legacy decode system, but as they move to decodetree,
      this data wouldn't even be collected.</p>
    <p>That's the justification, basically.<br>
    </p>
    <blockquote type="cite" cite="mid:20210527103034.23f3c8ce@bahia.lan">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
As long as the command really isn't useful any more, I wouldn't object
to that from an HMP point of view.

</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Ok then this should be documented in docs/system/removed-features.rst at
least.</pre>
    </blockquote>
    Sure, will send a patch later today with the update<br>
    <blockquote type="cite" cite="mid:20210527103034.23f3c8ce@bahia.lan">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Dave

</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">David,

Unrelated, I saw that you already applied this to ppc-for-6.1 on gitlab
but the commit title appears to be broken:

'65;6401;1cmonitor: removed cpustats command

<a class="moz-txt-link-freetext" href="https://gitlab.com/dgibson/qemu/-/commit/532be563eae6b8ae834ff7e9ebb1428f53569a69">https://gitlab.com/dgibson/qemu/-/commit/532be563eae6b8ae834ff7e9ebb1428f53569a69</a>

</pre>
          <blockquote type="cite">
            <pre class="moz-quote-pre" wrap="">Suggested-by: Richard Henderson <a class="moz-txt-link-rfc2396E" href="mailto:richard.henderson@linaro.org">&lt;richard.henderson@linaro.org&gt;</a>
Signed-off-by: Bruno Larsen (billionai) <a class="moz-txt-link-rfc2396E" href="mailto:bruno.larsen@eldorado.org.br">&lt;bruno.larsen@eldorado.org.br&gt;</a>
---
 hmp-commands-info.hx | 13 -------------
 monitor/misc.c       | 11 -----------
 2 files changed, 24 deletions(-)

diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
index ab0c7aa5ee..b2347a6aea 100644
--- a/hmp-commands-info.hx
+++ b/hmp-commands-info.hx
@@ -500,19 +500,6 @@ SRST
     Show the current VM UUID.
 ERST
 
-    {
-        .name       = "cpustats",
-        .args_type  = "",
-        .params     = "",
-        .help       = "show CPU statistics",
-        .cmd        = hmp_info_cpustats,
-    },
-
-SRST
-  ``info cpustats``
-    Show CPU statistics.
-ERST
-
 #if defined(CONFIG_SLIRP)
     {
         .name       = "usernet",
diff --git a/monitor/misc.c b/monitor/misc.c
index f3a393ea59..1539e18557 100644
--- a/monitor/misc.c
+++ b/monitor/misc.c
@@ -369,17 +369,6 @@ static void hmp_info_history(Monitor *mon, const QDict *qdict)
     }
 }
 
-static void hmp_info_cpustats(Monitor *mon, const QDict *qdict)
-{
-    CPUState *cs = mon_get_cpu(mon);
-
-    if (!cs) {
-        monitor_printf(mon, "No CPU available\n");
-        return;
-    }
-    cpu_dump_statistics(cs, 0);
-}
-
 static void hmp_info_trace_events(Monitor *mon, const QDict *qdict)
 {
     const char *name = qdict_get_try_str(qdict, "name");
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">
</pre>
        </blockquote>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      Bruno Piazera Larsen<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Analista de Software Trainee<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------86291356B748B0CAD28358A1--

