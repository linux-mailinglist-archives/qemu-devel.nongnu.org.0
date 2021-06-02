Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A003987BF
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 13:11:36 +0200 (CEST)
Received: from localhost ([::1]:36878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loOmd-0000RJ-0t
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 07:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1loOju-0007yX-Vm
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 07:08:47 -0400
Received: from [201.28.113.2] (port=20485 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>) id 1loOjs-0001Y8-OD
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 07:08:46 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Wed, 2 Jun 2021 08:08:40 -0300
Received: from [127.0.0.1] (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTPS id 9426A80148C;
 Wed,  2 Jun 2021 08:08:40 -0300 (-03)
Subject: Re: GSoC Intro - TUI interface for QMP
To: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Niteesh G. S." <niteesh.gs@gmail.com>
References: <CAN6ztm-J2GoQKkLb=Az0H2Q8UKK4oE3PgXg7g14=T53sQAUyDg@mail.gmail.com>
 <CAN6ztm9JKPo05_qJo1cFGq2P6f1DzB9vu+VZ054e9MdHVkRLog@mail.gmail.com>
 <YKuq242kdKxhvHAr@stefanha-x1.localdomain>
 <351d1344-a243-ca77-396b-0c1d071b9066@redhat.com>
From: Bruno Piazera Larsen <bruno.larsen@eldorado.org.br>
Message-ID: <1b8a4ade-4d86-df43-df3b-be7986264489@eldorado.org.br>
Date: Wed, 2 Jun 2021 08:08:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <351d1344-a243-ca77-396b-0c1d071b9066@redhat.com>
Content-Type: multipart/alternative;
 boundary="------------B0E01495E4C878D805E91E53"
Content-Language: en-US
X-OriginalArrivalTime: 02 Jun 2021 11:08:40.0869 (UTC)
 FILETIME=[A4E64550:01D7579F]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.613, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, armbru@redhat.com, qemu-devel@nongnu.org,
 wainersm@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a multi-part message in MIME format.
--------------B0E01495E4C878D805E91E53
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 24/05/2021 14:34, John Snow wrote:
> On 5/24/21 9:32 AM, Stefan Hajnoczi wrote:
>> On Sat, May 22, 2021 at 12:32:00AM +0530, Niteesh G. S. wrote:
>
> Welcome Niteesh :) I look forward to working with you this summer.
>
>>> By end of this summer, I would like to get a basic TUI with some 
>>> desirable
>>> features working. Some of the features I would like to get working are
>
> As a reminder to anyone reading this thread, the goal is to create a 
> qmp-shell that functions more as a TUI, akin to mutt, irssi, or (my 
> favorite example) mitmproxy. The idea is that there will be, at 
> minimum, a history panel showing QMP messages that have occurred so 
> far and a text entry panel for entering new commands.
>
> This shell can then be augmented with various other features to 
> facilitate testing, debugging, etc. One of the core upgrades over the 
> existing qmp-shell will be the featuring of truly asynchronous events 
> which will appear in the history panel without requiring the human 
> user to press <enter> to allow them to display. This will use a new 
> Asynchronous QMP library to facilitate this feature, bringing with it 
> fixes over our current use of undocumented Python features abusing 
> non-blocking sockets in the old QMP library.
>
> My plan is to worry about implementing the very basics of the shell 
> first, and then to add more features on as we feel comfortable with 
> the basics. We can discuss what we consider to be the bare minimum for 
> this project and lay out the feature requirements that define a 
> successful minimum.
>
>>> 1) Syntax checking
>
> To a limited extent. I don't want to disallow the user from sending 
> commands that are invalid in the event that we want to test the 
> server's ability to cope with and reply to invalid commands.
>
> However, if the syntax is malformed enough that we can't understand it 
> to send it to the server, good error messages that point out what 
> exactly went wrong are helpful.
>
I would actually suggest going the other way around. If there is a plan 
to test a server's ability to deal with invalid commands, it should be 
very obviously malformed, and when a user is trying to enter a command 
but has a small mistake (like a typo or something) telling the user that 
this was the likely mistake would make it more user-friendly.

A way to implement this would be to calculate a "proximity" value to all 
likely commands, and if it is very far from all known commands you send 
it to test, if it is very close to one or more, you print some helpful 
information. Other option is that you always show the closest command, 
say there's a mistake, and ask if the command should be sent anyway, 
which is easier to implement, but is a worse UX.

I admit this is pretty counter intuitive, but I think if it is well 
documented, it could be a better way to implement the feature

-- 
Bruno Piazera Larsen
Instituto de Pesquisas ELDORADO 
<https://www.eldorado.org.br/?utm_campaign=assinatura_de_e-mail&utm_medium=email&utm_source=RD+Station>
Departamento Computação Embarcada
Analista de Software Trainee
Aviso Legal - Disclaimer <https://www.eldorado.org.br/disclaimer.html>

--------------B0E01495E4C878D805E91E53
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
    <div class="moz-cite-prefix">On 24/05/2021 14:34, John Snow wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:351d1344-a243-ca77-396b-0c1d071b9066@redhat.com">On
      5/24/21 9:32 AM, Stefan Hajnoczi wrote:
      <br>
      <blockquote type="cite">On Sat, May 22, 2021 at 12:32:00AM +0530,
        Niteesh G. S. wrote:
        <br>
      </blockquote>
      <br>
      Welcome Niteesh :) I look forward to working with you this summer.
      <br>
      <br>
      <blockquote type="cite">
        <blockquote type="cite">By end of this summer, I would like to
          get a basic TUI with some desirable
          <br>
          features working. Some of the features I would like to get
          working are
          <br>
        </blockquote>
      </blockquote>
      <br>
      As a reminder to anyone reading this thread, the goal is to create
      a qmp-shell that functions more as a TUI, akin to mutt, irssi, or
      (my favorite example) mitmproxy. The idea is that there will be,
      at minimum, a history panel showing QMP messages that have
      occurred so far and a text entry panel for entering new commands.
      <br>
      <br>
      This shell can then be augmented with various other features to
      facilitate testing, debugging, etc. One of the core upgrades over
      the existing qmp-shell will be the featuring of truly asynchronous
      events which will appear in the history panel without requiring
      the human user to press &lt;enter&gt; to allow them to display.
      This will use a new Asynchronous QMP library to facilitate this
      feature, bringing with it fixes over our current use of
      undocumented Python features abusing non-blocking sockets in the
      old QMP library.
      <br>
      <br>
      My plan is to worry about implementing the very basics of the
      shell first, and then to add more features on as we feel
      comfortable with the basics. We can discuss what we consider to be
      the bare minimum for this project and lay out the feature
      requirements that define a successful minimum.
      <br>
      <br>
      <blockquote type="cite">
        <blockquote type="cite">1) Syntax checking
          <br>
        </blockquote>
      </blockquote>
      <br>
      To a limited extent. I don't want to disallow the user from
      sending commands that are invalid in the event that we want to
      test the server's ability to cope with and reply to invalid
      commands.
      <br>
      <br>
      However, if the syntax is malformed enough that we can't
      understand it to send it to the server, good error messages that
      point out what exactly went wrong are helpful.
      <br>
      <br>
    </blockquote>
    <p>I would actually suggest going the other way around. If there is
      a plan to test a server's ability to deal with invalid commands,
      it should be very obviously malformed, and when a user is trying
      to enter a command but has a small mistake (like a typo or
      something) telling the user that this was the likely mistake would
      make it more user-friendly.</p>
    <p>A way to implement this would be to calculate a "proximity" value
      to all likely commands, and if it is very far from all known
      commands you send it to test, if it is very close to one or more,
      you print some helpful information. Other option is that you
      always show the closest command, say there's a mistake, and ask if
      the command should be sent anyway, which is easier to implement,
      but is a worse UX.<br>
    </p>
    <p>I admit this is pretty counter intuitive, but I think if it is
      well documented, it could be a better way to implement the feature<br>
    </p>
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

--------------B0E01495E4C878D805E91E53--

