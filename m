Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617785538D0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jun 2022 19:23:11 +0200 (CEST)
Received: from localhost ([::1]:53370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3han-0003bh-Lj
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 13:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1o3hYU-0002oK-0o
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 13:20:46 -0400
Received: from [187.72.171.209] (port=21680 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>) id 1o3hYR-0000FA-LO
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 13:20:45 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 21 Jun 2022 14:19:38 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id 4FA2F80012C;
 Tue, 21 Jun 2022 14:19:38 -0300 (-03)
Content-Type: multipart/alternative;
 boundary="------------mevlaa5lMcTfCCFDnn905wgX"
Message-ID: <c90515d4-36a1-a044-7961-3e55e81f4a3f@eldorado.org.br>
Date: Tue, 21 Jun 2022 14:19:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC PATCH RESEND] scripts/checkpatch.pl: Change line limit
 warning
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philippe.mathieu.daude@gmail.com>,
 Gan Qixin <ganqixin@huawei.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <20220606143419.656598-1-lucas.araujo@eldorado.org.br>
 <CAFEAcA-yMZjJW=AJm=XLbrub1D-8iX0OKE78V_TzQmfC2RdXyw@mail.gmail.com>
From: Lucas Mateus Martins Araujo e Castro <lucas.araujo@eldorado.org.br>
In-Reply-To: <CAFEAcA-yMZjJW=AJm=XLbrub1D-8iX0OKE78V_TzQmfC2RdXyw@mail.gmail.com>
X-OriginalArrivalTime: 21 Jun 2022 17:19:38.0589 (UTC)
 FILETIME=[1628D0D0:01D88593]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------mevlaa5lMcTfCCFDnn905wgX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 09/06/2022 10:56, Peter Maydell wrote:
>
> On Mon, 6 Jun 2022 at 15:34, Lucas Mateus Castro(alqotel)
> <lucas.araujo@eldorado.org.br>  wrote:
>> ---
>> Currently there's a disagreement between the checkpatch code and the
>> documentation, this RFC just changes the checkpatch to match the
>> documentation.
>> But there was a discussion in 2020 as the best way to deal with this,
>> some alternatives mentioned are: change the warning to remind people to
>> not blindly wrap just because of the warning, change to warn at 90 columns
>> (which would mean changing the column limit for the error as well). If any
>> of those are preferred I'll send a next version updating the documentation
>> as well as changing checkpatch.pl to the preferred behavior.
> The reason the code doesn't match the style docs is partly
> my fault I guess. The style docs were updated with
> commit a998de0dcd ("CODING_STYLE.rst: Be less strict about 80 character limit");
> that commit message says "this goes with the checkpatch changes to warn at
> 100 characters rather than 80", but we never committed the checkpatch
> changes. Those were this patch:
> https://lore.kernel.org/qemu-devel/20201105154208.12442-1-ganqixin@huawei.com/
> (which started the discussion out on an awkward footing by not including
> the rationale in its commit message; it was prompted by a discussion on
> a previous patchset:
> https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg05653.html
>
> Equivalent kernel checkpatch.pl loosening:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bdc48fa11e46f867ea4d75fa59ee87a7f48be144
Sorry I should've added those links to the commit message to update 
anyone getting in this discussion now, thanks for adding them.
>
> Anyway, I think the main objector last time around was Markus, and
> there's kind of an unresolvable difference of views here

My main idea with the RFC is mostly to revive the discussion to fix the 
difference between the style docs and the code, so I hope it's not 
completely unresolvable

Also my emails to Markus are bouncing back so hopefully he finds this 
patch in the qemu list.

>
> (1) I want checkpatch not to warn about line lengths that in fact
> we'd be happy to include in the tree (because it's noise, and it
> pushes people into wrapping the cases which the style guide describes
> as "awkwardly wrapped" and better not wrapped, to silence the warning),
> so I don't want checkpatch to even warn on less than 90 or 100 chars.
> This is effectively also the position that the Linux kernel
> checkpatch takes these days.
Philippe Mathieu-Daudé talked about keeping some error to avoid overly 
long lines, so that part I added to my patch.
>
> (2) Markus (as I understand his point of view from the 2020 thread)
> wants checkpatch to warn about anything over the "this is definitely
> fine" 80 column mark, so that developers are reminded that
> they might want to make a judgement call there.
>
> The coding-style text reflects my point of view, because I
> wrote it, and therefore personally I'm happy to update checkpatch
> to match it :-)
>
>> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
>> index d900d18048..2c2d7b31ab 100755
>> --- a/scripts/checkpatch.pl
>> +++ b/scripts/checkpatch.pl
>> @@ -1639,12 +1639,12 @@ sub process {
>>                  if ($line =~ /^\+/ &&
>>                      !($line =~ /^\+\s*"[^"]*"\s*(?:\s*|,|\)\s*;)\s*$/) &&
>>                      !($rawline =~ /^[^[:alnum:]]*https?:\S*$/) &&
>> -                   $length > 80)
>> +                   $length > 100)
> Gan Qixin's patch has the advantage of putting the max length into
> a variable rather than continuing to hardcode it.
I can send a v2 with these changes if this is the way we're heading, or 
maybe we could use Gan Qixin's patch (although a more detailed commit 
message might be desired)
>
> thanks
> -- PMM
-- 
Lucas Mateus M. Araujo e Castro
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>
--------------mevlaa5lMcTfCCFDnn905wgX
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 09/06/2022 10:56, Peter Maydell
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFEAcA-yMZjJW=AJm=XLbrub1D-8iX0OKE78V_TzQmfC2RdXyw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

On Mon, 6 Jun 2022 at 15:34, Lucas Mateus Castro(alqotel)
<a class="moz-txt-link-rfc2396E" href="mailto:lucas.araujo@eldorado.org.br">&lt;lucas.araujo@eldorado.org.br&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
---
Currently there's a disagreement between the checkpatch code and the
documentation, this RFC just changes the checkpatch to match the
documentation.
But there was a discussion in 2020 as the best way to deal with this,
some alternatives mentioned are: change the warning to remind people to
not blindly wrap just because of the warning, change to warn at 90 columns
(which would mean changing the column limit for the error as well). If any
of those are preferred I'll send a next version updating the documentation
as well as changing checkpatch.pl to the preferred behavior.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
The reason the code doesn't match the style docs is partly
my fault I guess. The style docs were updated with
commit a998de0dcd ("CODING_STYLE.rst: Be less strict about 80 character limit");
that commit message says "this goes with the checkpatch changes to warn at
100 characters rather than 80", but we never committed the checkpatch
changes. Those were this patch:
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/qemu-devel/20201105154208.12442-1-ganqixin@huawei.com/">https://lore.kernel.org/qemu-devel/20201105154208.12442-1-ganqixin@huawei.com/</a>
(which started the discussion out on an awkward footing by not including
the rationale in its commit message; it was prompted by a discussion on
a previous patchset:
<a class="moz-txt-link-freetext" href="https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg05653.html">https://lists.gnu.org/archive/html/qemu-devel/2020-10/msg05653.html</a>

Equivalent kernel checkpatch.pl loosening:
<a class="moz-txt-link-freetext" href="https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bdc48fa11e46f867ea4d75fa59ee87a7f48be144">https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=bdc48fa11e46f867ea4d75fa59ee87a7f48be144</a></pre>
    </blockquote>
    Sorry I should've added those links to the commit message to update
    anyone getting in this discussion now, thanks for adding them.<br>
    <blockquote type="cite"
cite="mid:CAFEAcA-yMZjJW=AJm=XLbrub1D-8iX0OKE78V_TzQmfC2RdXyw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

Anyway, I think the main objector last time around was Markus, and
there's kind of an unresolvable difference of views here</pre>
    </blockquote>
    <p>My main idea with the RFC is mostly to revive the discussion to
      fix the difference between the style docs and the code, so I hope
      it's not completely unresolvable</p>
    <p>Also my emails to Markus are bouncing back so hopefully he finds
      this patch in the qemu list.<br>
    </p>
    <blockquote type="cite"
cite="mid:CAFEAcA-yMZjJW=AJm=XLbrub1D-8iX0OKE78V_TzQmfC2RdXyw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

(1) I want checkpatch not to warn about line lengths that in fact
we'd be happy to include in the tree (because it's noise, and it
pushes people into wrapping the cases which the style guide describes
as "awkwardly wrapped" and better not wrapped, to silence the warning),
so I don't want checkpatch to even warn on less than 90 or 100 chars.
This is effectively also the position that the Linux kernel
checkpatch takes these days.</pre>
    </blockquote>
    Philippe Mathieu-Daudé talked about keeping some error to avoid
    overly long lines, so that part I added to my patch.<br>
    <blockquote type="cite"
cite="mid:CAFEAcA-yMZjJW=AJm=XLbrub1D-8iX0OKE78V_TzQmfC2RdXyw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

(2) Markus (as I understand his point of view from the 2020 thread)
wants checkpatch to warn about anything over the "this is definitely
fine" 80 column mark, so that developers are reminded that
they might want to make a judgement call there.

The coding-style text reflects my point of view, because I
wrote it, and therefore personally I'm happy to update checkpatch
to match it :-)

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index d900d18048..2c2d7b31ab 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1639,12 +1639,12 @@ sub process {
                if ($line =~ /^\+/ &amp;&amp;
                    !($line =~ /^\+\s*"[^"]*"\s*(?:\s*|,|\)\s*;)\s*$/) &amp;&amp;
                    !($rawline =~ /^[^[:alnum:]]*https?:\S*$/) &amp;&amp;
-                   $length &gt; 80)
+                   $length &gt; 100)
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Gan Qixin's patch has the advantage of putting the max length into
a variable rather than continuing to hardcode it.</pre>
    </blockquote>
    I can send a v2 with these changes if this is the way we're heading,
    or maybe we could use Gan Qixin's patch (although a more detailed
    commit message might be desired)<br>
    <blockquote type="cite"
cite="mid:CAFEAcA-yMZjJW=AJm=XLbrub1D-8iX0OKE78V_TzQmfC2RdXyw@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

thanks
-- PMM
</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      Lucas Mateus M. Araujo e Castro<br>
      <a
href="https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&amp;utm_medium=email&amp;utm_source=RD+Station">Instituto
        de Pesquisas ELDORADO</a><br>
      Departamento Computação Embarcada<br>
      Analista de Software Trainee<br>
      <a href="https://www.eldorado.org.br/disclaimer.html">Aviso Legal
        - Disclaimer</a></div>
  </body>
</html>

--------------mevlaa5lMcTfCCFDnn905wgX--

