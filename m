Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C5B6C40DE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 04:17:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peoxw-00037b-Qq; Tue, 21 Mar 2023 23:16:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1peoxs-00037A-NH
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 23:16:42 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dinahbaum123@gmail.com>)
 id 1peoxk-0004Bx-TQ
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 23:16:35 -0400
Received: by mail-ed1-x532.google.com with SMTP id h8so67522592ede.8
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 20:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679454990;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eNKIS2sWBCp/RAXiGK/R/lTaHivwmq0MO9F858ZfgIw=;
 b=px2ZfXEOh4zA4UN2D6dBauWF6WVMQVRoXn8LXM/5LnSzyJCd6Yaw8FJNV5hwMrNn+9
 KO17BN8y5yWxfmPIWZ3NTUY2hCmTYnzCojtEQEUpadVjBNCMU55SjiTDn0fkGViahtgi
 9xLUmqORntxhiigmzI8lURIgYMGo7jW4nS0C/J4kOjSJmRQVfJ5MEOf+oOVPlOk3UJcv
 wZ3tQbk4Pghe5P08z8oi9ZSwv6sjnQ3L1rs6X/iyLMpwQqZIjSXiw2PLUQcEbLInkkZy
 nt141qoBYAqK7leNI8xlSDE5ByxqyckRIXc4KT2KYmcRfpWDbe2KhIfDhr9jqVwJvwkU
 8D0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679454990;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eNKIS2sWBCp/RAXiGK/R/lTaHivwmq0MO9F858ZfgIw=;
 b=P038AvmekK0UrppaWrDqbfEQYvLt6Iy/AOUQPLLoYLpTyaRuZKTUqkSVh5gqTT5XRK
 fcoAelO/49Y5wm4K/TVJkaB661oPvQ6jIiNwareayu6XoCNkRm2KwJy+j2/nqMxiY8Ii
 5UZnh4VOG11yMXw++mBNY6onl4jESWbJAlTdu7mCTNj5eNBaYozNr5tHVIwDjtV5V94o
 /Vxtn3i+JFC9kJwbrXH5/Hq32U3eIneOXshkla7bksufBXdhm5K586jExSCPpi2rewgb
 szllQSdM+pLVQUb8dqga5MSlOXve+LVJvkBY3SCcgMy0BgfSeQYAmqiNg915ofq1LXJd
 vGtw==
X-Gm-Message-State: AO0yUKURhlbqo8bvI1ubAiJhepVZ4s5TUYUSYa58MhwBxTsQOCP1L+x8
 gW0VLMukDfYQGOebTvnlARofDpfl0UiALAqiSL3ghpN+klQ=
X-Google-Smtp-Source: AK7set/o543ULzmldrASbRCUyncUjwFBO7K31jLTUHg1nHVwFYrUrQ2w19rwXfTJGmmDf24rqR1N7XGUtGcWO5cEWgQ=
X-Received: by 2002:a17:906:6613:b0:92e:a234:110a with SMTP id
 b19-20020a170906661300b0092ea234110amr2344744ejp.3.1679454990050; Tue, 21 Mar
 2023 20:16:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230314100026.536079-1-dinahbaum123@gmail.com>
In-Reply-To: <20230314100026.536079-1-dinahbaum123@gmail.com>
From: Dinah B <dinahbaum123@gmail.com>
Date: Tue, 21 Mar 2023 23:16:18 -0400
Message-ID: <CAH50XRfsX=7Qm3uBsGZy9ZNih_5W7Ey=2Pxw5Sq17QJtqoy7PA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Enable -cpu <cpu>,help
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001928fc05f7749675"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=dinahbaum123@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--0000000000001928fc05f7749675
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Friendly ping for code review on this patch series.

Full series:
https://lore.kernel.org/qemu-devel/20230314100026.536079-1-dinahbaum123@gma=
il.com/

Thanks,
-DInah

On Tue, Mar 14, 2023 at 6:00=E2=80=AFAM Dinah Baum <dinahbaum123@gmail.com>=
 wrote:

> Part 1 is a refactor/code motion patch for
> qapi/machine target required for setup of
>
> Part 2 which enables query-cpu-model-expansion
> on all architectures
>
> Part 3 implements the '<cpu>,help' feature
>
> Limitations:
> Currently only 'FULL' expansion queries are implemented since
> that's the only type enabled on the architectures that
> allow feature probing
>
> Unlike the 'device,help' command, default values aren't
> printed
>
> Dinah Baum (3):
>   qapi/machine-target: refactor machine-target
>   cpu, qapi, target/arm, i386, s390x: Generalize
>     query-cpu-model-expansion
>   cpu, qdict, vl: Enable printing options for CPU type
>
>  MAINTAINERS                      |   1 +
>  cpu.c                            |  61 +++++++++++++++
>  include/exec/cpu-common.h        |  10 +++
>  include/qapi/qmp/qdict.h         |   2 +
>  qapi/machine-target-common.json  | 130 +++++++++++++++++++++++++++++++
>  qapi/machine-target.json         | 129 +-----------------------------
>  qapi/meson.build                 |   1 +
>  qemu-options.hx                  |   7 +-
>  qobject/qdict.c                  |   5 ++
>  softmmu/vl.c                     |  36 ++++++++-
>  target/arm/arm-qmp-cmds.c        |   7 +-
>  target/arm/cpu.h                 |   7 +-
>  target/i386/cpu-sysemu.c         |   7 +-
>  target/i386/cpu.h                |   6 ++
>  target/s390x/cpu.h               |   7 ++
>  target/s390x/cpu_models_sysemu.c |   6 +-
>  16 files changed, 278 insertions(+), 144 deletions(-)
>  create mode 100644 qapi/machine-target-common.json
>
> --
> 2.30.2
>
>

--0000000000001928fc05f7749675
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Friendly ping for code review on this patch series.</=
div><div><br></div><div>Full series: <a href=3D"https://lore.kernel.org/qem=
u-devel/20230314100026.536079-1-dinahbaum123@gmail.com/">https://lore.kerne=
l.org/qemu-devel/20230314100026.536079-1-dinahbaum123@gmail.com/</a></div><=
div><br></div><div>Thanks,</div><div>-DInah<br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Mar 14, 2023=
 at 6:00=E2=80=AFAM Dinah Baum &lt;<a href=3D"mailto:dinahbaum123@gmail.com=
">dinahbaum123@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Part 1 is a refactor/code motion patch for<br>
qapi/machine target required for setup of<br>
<br>
Part 2 which enables query-cpu-model-expansion<br>
on all architectures<br>
<br>
Part 3 implements the &#39;&lt;cpu&gt;,help&#39; feature<br>
<br>
Limitations:<br>
Currently only &#39;FULL&#39; expansion queries are implemented since<br>
that&#39;s the only type enabled on the architectures that<br>
allow feature probing<br>
<br>
Unlike the &#39;device,help&#39; command, default values aren&#39;t<br>
printed<br>
<br>
Dinah Baum (3):<br>
=C2=A0 qapi/machine-target: refactor machine-target<br>
=C2=A0 cpu, qapi, target/arm, i386, s390x: Generalize<br>
=C2=A0 =C2=A0 query-cpu-model-expansion<br>
=C2=A0 cpu, qdict, vl: Enable printing options for CPU type<br>
<br>
=C2=A0MAINTAINERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 +<br>
=C2=A0cpu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 61 +++++++++++++++<br>
=C2=A0include/exec/cpu-common.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 10 +++<b=
r>
=C2=A0include/qapi/qmp/qdict.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A02 +<br>
=C2=A0qapi/machine-target-common.json=C2=A0 | 130 +++++++++++++++++++++++++=
++++++<br>
=C2=A0qapi/machine-target.json=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 129 +----=
-------------------------<br>
=C2=A0qapi/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0qemu-options.hx=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A07 +-<br>
=C2=A0qobject/qdict.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A05 ++<br>
=C2=A0softmmu/vl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 36 ++++++++-<br>
=C2=A0target/arm/arm-qmp-cmds.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 =
+-<br>
=C2=A0target/arm/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 =C2=A07 +-<br>
=C2=A0target/i386/cpu-sysemu.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A07 +-<br>
=C2=A0target/i386/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A06 ++<br>
=C2=A0target/s390x/cpu.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 =C2=A07 ++<br>
=C2=A0target/s390x/cpu_models_sysemu.c |=C2=A0 =C2=A06 +-<br>
=C2=A016 files changed, 278 insertions(+), 144 deletions(-)<br>
=C2=A0create mode 100644 qapi/machine-target-common.json<br>
<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div>

--0000000000001928fc05f7749675--

