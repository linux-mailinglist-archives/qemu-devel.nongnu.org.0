Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C13523AE0AA
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Jun 2021 23:23:32 +0200 (CEST)
Received: from localhost ([::1]:59428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lv4uh-0000mP-BW
	for lists+qemu-devel@lfdr.de; Sun, 20 Jun 2021 17:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <unai.martinezcorral@ehu.eus>)
 id 1lv4tZ-0008Vt-BT
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:22:21 -0400
Received: from smtp.lg.ehu.es ([158.227.0.66]:25009 helo=smtp.ehu.eus)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <unai.martinezcorral@ehu.eus>)
 id 1lv4tW-0001Nw-6y
 for qemu-devel@nongnu.org; Sun, 20 Jun 2021 17:22:20 -0400
Received: from imsva2.lgp.ehu.es (imsva2.lgp.ehu.es [10.0.3.246])
 by postfix.smtp1.imsva1 (Postfix) with ESMTPS id 5F9D8183FFB
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 23:22:15 +0200 (CEST)
Received: from imsva2.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1028A5A054
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 23:22:15 +0200 (CEST)
Received: from imsva2.lgp.ehu.es (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 044E55A053
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 23:22:15 +0200 (CEST)
Received: from smtp.ehu.eus (unknown [10.0.100.79])
 by imsva2.lgp.ehu.es (Postfix) with ESMTPS
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 23:22:14 +0200 (CEST)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169]) by smtp-2 (Postfix) with ESMTPSA id B8AC3183FC8
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 23:22:14 +0200 (CEST)
Received: by mail-il1-f169.google.com with SMTP id x12so13478879ill.4
 for <qemu-devel@nongnu.org>; Sun, 20 Jun 2021 14:22:14 -0700 (PDT)
X-Gm-Message-State: AOAM5320zwJaey2HThacrfgd3hRzOyXntg47R/0FPxfuBFYuP3Jjpgvn
 qGR/+AQHFzytjYSPXVQQB8pG1aPbp22GkHhx5Q==
X-Google-Smtp-Source: ABdhPJzav13nvuq5dG0+i2SuGXpnFUTtDw+gBGPw+SZ6RfVWI4YncTJi71zodvE/r+onbcHmghEued0doyJBYs/Vr7M=
X-Received: by 2002:a92:8e03:: with SMTP id c3mr16318748ild.167.1624224132847; 
 Sun, 20 Jun 2021 14:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210620201509.GA9@c22643ce596e>
 <13e577e3-c85a-578e-e33f-dd7affaf00ca@vivier.eu>
In-Reply-To: <13e577e3-c85a-578e-e33f-dd7affaf00ca@vivier.eu>
From: Unai Martinez Corral <unai.martinezcorral@ehu.eus>
Date: Sun, 20 Jun 2021 23:22:02 +0200
X-Gmail-Original-Message-ID: <CAGZZdDEetfWS55-crF8mgEEtoo3eWS6dmSV5Xcv7QS+4MOnxcA@mail.gmail.com>
Message-ID: <CAGZZdDEetfWS55-crF8mgEEtoo3eWS6dmSV5Xcv7QS+4MOnxcA@mail.gmail.com>
Subject: Re: qemu-binfmt-conf.sh: enforce style consistency
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: multipart/alternative; boundary="00000000000079603505c5392653"
X-Greylist: ACL 200 matched, not delayed by milter-greylist-4.6.2 (smtp-2
 [10.0.100.79]); Sun, 20 Jun 2021 23:22:14 +0200 (CEST)
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSVA-9.1.0.1631-8.6.0.1013-26232.003
X-TM-AS-Result: No--3.782-7.0-31-10
X-imss-scan-details: No--3.782-7.0-31-10
X-TMASE-Version: IMSVA-9.1.0.1631-8.6.1013-26232.003
X-TMASE-Result: 10--3.782300-10.000000
X-TMASE-MatchedRID: Dy1l3ZSJ5PGgBUTSh64wSUKGB4JJ2ELXWyQijpt1UQlcybOKQAEmSMlB
 Lll1g/6SzjqJngvc26iVSb9bh6Zf6wV6K461K3zKz1H9Spactbgh/JA0dHadpmjliw+xvItd5Gq
 XKGHXOXNBr+HZ53J2jmnAMISGh8gyRCaWYV6Qw3y628cXbnOhT22cGRBBb/0+DpnuR5eZKJbTqA
 oW2PGHdK0lnfUsoSBdT5TVrzzFxZBhaj10i6TXQGY0Io4Kxb86fS0Ip2eEHnyvXSmSdlcYmuo86
 dL2DqU+zhVd8sjYP1BYF3qW3Je6+yEhlioOhBqbmV1FwnHkHdVD1M3VfqQZjJkOdw7THWHdKWfB
 JvPEXqIezGz2llhk+IjsD3B4S6rNcVSFvUdAGTkd4yF+FRKvn0yjwIKdtHjj5Gm1NPUV5WF6Nw5
 pMPz9bxpXp9DzpIDfCG8TfIlwX7Az1TBYQEBeOBczEz2LDF+7Sqf/T3DdPSTShH/RuJUUcA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-12:0,22:0,33:0,34:0-0
X-Greylist: Sender IP whitelisted, Sender succeeded SMTP AUTH, not delayed by
 milter-greylist-4.6.2 (postfix.smtp1.imsva1 [10.0.100.79]);
 Sun, 20 Jun 2021 23:22:15 +0200 (CEST)
Received-SPF: pass client-ip=158.227.0.66;
 envelope-from=unai.martinezcorral@ehu.eus; helo=smtp.ehu.eus
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Reply-To: unai.martinezcorral@ehu.eus
Cc: Peter Maydell <peter.maydell@linaro.org>,
 umarcor <unai.martinezcorral@ehu.eus>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000079603505c5392653
Content-Type: text/plain; charset="UTF-8"

Hi Laurent,

Well, I'm not sure there is a real consistency with this in the other
> scripts...
>

Changes look good, but can someone confirm this is the style we want to use
> everywhere?
>
> Peter?
>

Please, see
https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg02267.html


> Please use your real name, not a nickname.
>

Sorry about that. It's 'Unai Martinez-Corral'.
Shall I resend the patch?

Cheers

Unai

--00000000000079603505c5392653
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Laurent,<br></div><div><br></div><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Well, I&#39;m not sure there is a real consistency with this in the other s=
cripts...<br></blockquote><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div>

Changes look good, but can someone confirm this is the style we want to use=
 everywhere?<br>
<br>
Peter?=C2=A0 <br></div></blockquote><div><br></div><div>Please, see <a href=
=3D"https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg02267.html">ht=
tps://lists.gnu.org/archive/html/qemu-devel/2020-03/msg02267.html</a></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">

Please use your real name, not a nickname.<br>
</blockquote><div><br></div><div>Sorry about that. It&#39;s &#39;Unai Marti=
nez-Corral&#39;.<br>Shall I resend the patch?<br></div><div>=C2=A0</div><di=
v>Cheers<br><br></div><div>Unai<br></div><br></div></div>

--00000000000079603505c5392653--


