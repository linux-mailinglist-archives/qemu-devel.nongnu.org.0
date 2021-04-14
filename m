Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 400BC35EC08
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 06:51:33 +0200 (CEST)
Received: from localhost ([::1]:52126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWXUx-0004fZ-TJ
	for lists+qemu-devel@lfdr.de; Wed, 14 Apr 2021 00:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jwsu1986@gmail.com>)
 id 1lWXSq-0003gi-ML
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 00:49:20 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:38627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jwsu1986@gmail.com>)
 id 1lWXSp-0004cb-1h
 for qemu-devel@nongnu.org; Wed, 14 Apr 2021 00:49:20 -0400
Received: by mail-yb1-xb29.google.com with SMTP id x76so10704369ybe.5
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 21:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=MLZIcbRktslCSz4srfUbi0IN1LzLt+OJiKpPEnw+ErM=;
 b=l58xFepIbh7k7OTmWFh2XTGvfz3T29P/BmRr/7TgOqsQkjk6qVrGHWn+i2wR4wbFO2
 jjt0qt4VncQ/vXCPVZ2odKGJ2teOsH7yeWiJ1nQDYXXuJ6vBLBareKcMVx4PenfJamQz
 AH0J/PWanWKe0oaJq+iuTlTjDbp5ngrOsXJtNc1mru0r+7s6D6l7OiZt1Qn0+/amYzAy
 o97ISAjJUY8o9VfEnaNpnACDsafIi5eQCiFwvEDe0SsDYsgVkq6cH/tEnaR1sBIMCge9
 l7wgd2Gjt65m040CXgcrHgRJ2q8YAfiKXOy9D7l9WdPVf798VRdvcNF3OxBEhfPTrtvk
 djxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=MLZIcbRktslCSz4srfUbi0IN1LzLt+OJiKpPEnw+ErM=;
 b=CHykMzomkaNell2Id1Piitwo34WttfpLDEiM9xKLnCb1itmGniuz6TWcYA89t6PrIl
 W9YQ1eQk4e0P3DD+8HYoPk/GGa9qTJ1HySC7nJrnMVZRPA9+PHh5A1YjIJf7lYFtWQtS
 JmiJMYQdg/DLmPJDvLZhp+asOtfcBUOl/isH8O8WlygKnbpEUBQ5ynsIvY+7/tEQPo9K
 fdEH4mTDYJB6W0uzvV70QeNmVqFq+6Ju2UDa0OrbEyyY4mUVXDO7FpgD3x0xeqSREz6A
 gZqU9P51nPiX7NZqAe/JGiatLnUwe9Mf2woYJLnan9T5RLOkJ2feeEXepYwk6fux6oJP
 N2Ew==
X-Gm-Message-State: AOAM532aOqLUBd4ZIChLlwY+Rwj5GApKxxVD4K1nYNJkEWY2povnUcSQ
 AoNYFW0XQXSbY1EaZh0fkXDNacPIk+PCYKMKE54YTXTE4A6Yeg==
X-Google-Smtp-Source: ABdhPJwbxVtzxtFS/i47rXNdJ3x9NbXC/6Pzr9EQTIhdjRCrMYpfT1WjqpmsKmnY+cME9q4eWD/Nks34kZQ6ct1EudM=
X-Received: by 2002:a25:b049:: with SMTP id e9mr10751676ybj.111.1618375756680; 
 Tue, 13 Apr 2021 21:49:16 -0700 (PDT)
MIME-Version: 1.0
From: Jing-Wei Su <jwsu1986@gmail.com>
Date: Wed, 14 Apr 2021 12:49:05 +0800
Message-ID: <CAFKS8hW6mwS89HHteyYcjRuvw7c5LxLdUrYo705Op7XreJBjTQ@mail.gmail.com>
Subject: Live migration using a specified networking adapter
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000017110d05bfe778eb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=jwsu1986@gmail.com; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 NUMERIC_HTTP_ADDR=1.242, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, WEIRD_PORT=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000017110d05bfe778eb
Content-Type: text/plain; charset="UTF-8"

Hello experts,


I have a network topology like this diagram.

When start live migration moving a VM from Host A to B,

the migration process uses either 10GbE (10.0.0.1) or 1 GbE (10.0.0.2),

but the user cannot specify the source NIC by current migrate command.


To solve the problem, my rough idea is to add a source ipv4:port argument,

the migration command seems like

```

migrate -b tcp:10.0.0.1:4444 -d tcp:10.0.0.3:4444.

```


Is it an available solution? Or, is there any concern and sugesstion?

Besides the idea, is there any good way to this issue?


   +-----------------------------------------------------+
   |                     10GbE switch                    |
   +-----------------------------------------------------+
           |            |                |
           |            |                |
           |            |                |
  10.0.0.1 |    10.0.0.2|        10.0.0.3|
   +-+----------+-+--------+-+  +--+----------+---------+
   |  |10GbE NIC | |1GbE NIC||  |  |10GbE NIE |         |
   |  +----------+ +--------+|  |  +----------+         |
   |                         |  |                       |
   |      +---------+        |  |                       |
   |      |   VM    |        |  |                       |
   |      +---------+        |  |                       |
   +-------------------------+  +-----------------------+
           Host A                         Host B


Thank you.


Regards,

Derek.

--00000000000017110d05bfe778eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><pre style=3D"margin-top:0px;margin-bottom:0px;padding:0px=
;overflow:hidden;line-height:1.2em;color:rgb(0,0,0)">Hello experts,</pre><p=
re style=3D"margin-top:0px;margin-bottom:0px;padding:0px;overflow:hidden;li=
ne-height:1.2em;color:rgb(0,0,0)"><br></pre><pre style=3D"margin-top:0px;ma=
rgin-bottom:0px;padding:0px;overflow:hidden;line-height:1.2em;color:rgb(0,0=
,0)">I have a network topology like this diagram.</pre><pre style=3D"margin=
-top:0px;margin-bottom:0px;padding:0px;overflow:hidden;line-height:1.2em;co=
lor:rgb(0,0,0)">When start live migration moving a VM from Host A to B,</pr=
e><pre style=3D"margin-top:0px;margin-bottom:0px;padding:0px;overflow:hidde=
n;line-height:1.2em;color:rgb(0,0,0)">the migration process uses either 10G=
bE (10.0.0.1) or 1 GbE (10.0.0.2),</pre><pre style=3D"margin-top:0px;margin=
-bottom:0px;padding:0px;overflow:hidden;line-height:1.2em;color:rgb(0,0,0)"=
>but the user cannot specify the source NIC by current migrate command.</pr=
e><pre style=3D"margin-top:0px;margin-bottom:0px;padding:0px;overflow:hidde=
n;line-height:1.2em;color:rgb(0,0,0)"><br></pre><pre style=3D"margin-top:0p=
x;margin-bottom:0px;padding:0px;overflow:hidden;line-height:1.2em;color:rgb=
(0,0,0)">To solve the problem, my rough idea is to add a source ipv4:port a=
rgument,</pre><pre style=3D"margin-top:0px;margin-bottom:0px;padding:0px;ov=
erflow:hidden;line-height:1.2em;color:rgb(0,0,0)">the migration command see=
ms like</pre><pre style=3D"margin-top:0px;margin-bottom:0px;padding:0px;ove=
rflow:hidden;line-height:1.2em;color:rgb(0,0,0)">```</pre><pre style=3D"mar=
gin-top:0px;margin-bottom:0px;padding:0px;overflow:hidden;line-height:1.2em=
;color:rgb(0,0,0)">migrate -b tcp:<a href=3D"http://10.0.0.1:4444">10.0.0.1=
:4444</a> -d tcp:<a href=3D"http://10.0.0.3:4444">10.0.0.3:4444</a>.<br></p=
re><pre style=3D"margin-top:0px;margin-bottom:0px;padding:0px;overflow:hidd=
en;line-height:1.2em;color:rgb(0,0,0)">```</pre><pre style=3D"margin-top:0p=
x;margin-bottom:0px;padding:0px;overflow:hidden;line-height:1.2em;color:rgb=
(0,0,0)"><br></pre><pre style=3D"margin-top:0px;margin-bottom:0px;padding:0=
px;overflow:hidden;line-height:1.2em;color:rgb(0,0,0)">Is it an available s=
olution? Or, is there any concern and sugesstion?</pre><pre style=3D"margin=
-top:0px;margin-bottom:0px;padding:0px;overflow:hidden;line-height:1.2em;co=
lor:rgb(0,0,0)">Besides the idea, is there any good way to this issue?</pre=
><pre style=3D"margin-top:0px;margin-bottom:0px;padding:0px;overflow:hidden=
;line-height:1.2em;color:rgb(0,0,0)">                                      =
                                                                           =
                   =20
   +-----------------------------------------------------+                 =
                                                       =20
   |                     10GbE switch                    |                 =
                                                       =20
   +-----------------------------------------------------+                 =
                                                       =20
           |            |                |                                 =
                                                          =20
           |            |                |                                 =
                                                          =20
           |            |                |                                 =
                                                          =20
  10.0.0.1 |    10.0.0.2|        10.0.0.3|                                 =
                                                          =20
   +-+----------+-+--------+-+  +--+----------+---------+                  =
                                                      =20
   |  |10GbE NIC | |1GbE NIC||  |  |10GbE NIE |         |                  =
                                                      =20
   |  +----------+ +--------+|  |  +----------+         |                  =
                                                      =20
   |                         |  |                       |                  =
                                                      =20
   |      +---------+        |  |                       |                  =
                                                      =20
   |      |   VM    |        |  |                       |                  =
                                                      =20
   |      +---------+        |  |                       |                  =
                                                      =20
   +-------------------------+  +-----------------------+                  =
                                                      =20
           Host A                         Host B                           =
                                                          =20
                                                                           =
                                                          =20
<pre style=3D"margin-top:0px;margin-bottom:0px;padding:0px;overflow:hidden;=
line-height:1.2em">Thank you.</pre><pre style=3D"margin-top:0px;margin-bott=
om:0px;padding:0px;overflow:hidden;line-height:1.2em"><br></pre><pre style=
=3D"margin-top:0px;margin-bottom:0px;padding:0px;overflow:hidden;line-heigh=
t:1.2em">Regards,</pre><pre style=3D"margin-top:0px;margin-bottom:0px;paddi=
ng:0px;overflow:hidden;line-height:1.2em">Derek.</pre></pre></div>

--00000000000017110d05bfe778eb--

