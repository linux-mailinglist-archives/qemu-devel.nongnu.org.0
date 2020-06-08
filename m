Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D8E1F21C0
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 00:16:33 +0200 (CEST)
Received: from localhost ([::1]:54550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jiQ4F-0002RJ-Vu
	for lists+qemu-devel@lfdr.de; Mon, 08 Jun 2020 18:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jiQ2u-0001px-AA
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 18:15:08 -0400
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42]:45165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jiQ2t-0003ey-0k
 for qemu-devel@nongnu.org; Mon, 08 Jun 2020 18:15:07 -0400
Received: by mail-vs1-xe42.google.com with SMTP id d21so10425265vsh.12
 for <qemu-devel@nongnu.org>; Mon, 08 Jun 2020 15:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gwtv4IjPm3W/47yWBHlgJMaTuoF3z9vgsEf55kpSKzk=;
 b=l/DVRVbmsP0eL2ExJ9PFQZCWSmOGdmAz1pNg/olI0pooQ14iSHn7N1cobWsYq5O97r
 SkXZXbIjgtQlWncYrLxrIykFxQqWx10c1NKbKIchIp/uZ4lGRtyK4dk5WiGLHyWPq9xj
 mUgZQsajgkhYOA90Qb0HwoGigpXTSymwkJGuA8Shl+SQzDnsR0etGpYbukaJPtlLHRQ6
 Rjw/Y/US31Qb5cU4NEc4zqcU+UZmkrWsDkG0xlf5le0hz3ce+jtRa2ufpJzu9LBE3V1G
 3idfWENI+hzQg+Qk4VjztAkBH1aWgNmJsYDX5qNnPECuULUoetsJ6T5zEqkGcoLaIAqn
 q+9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gwtv4IjPm3W/47yWBHlgJMaTuoF3z9vgsEf55kpSKzk=;
 b=bhdp3pXlYRUaNTMSN1skhSsLGY7fgc/Ueizb1VjuzG9iFXz8640Y+x//zbpAEOKFgV
 UVK1lg5BqLQPY2ucJbrEU/202tcEoOrMFhQVO7tqF2HetqVs0g8q+3EdDx6Glwo/+UqM
 TPgpMAx+o586iUvrXChtdxJkR8UqBQGmTZ9O3ijdQfb7XS0rBbafSHdBgSMum6/19jNM
 MJir9SonntrArOKGfHWEDWeSQ2sWQl0GguuY8b5KTNmOQoZ5iK/XkFKqmZC1kbKgdo0k
 qpYD45oFlnz+6IbH3OdXCP4MjPM3lT4hq8t/gVREz/bqHgRELwfgNPRWtKtQPd+WaO56
 5rLQ==
X-Gm-Message-State: AOAM531VypZZmecAITxXcE5/1/itMEB7oxcWZ0AxlKP3z6d3M8oYUMEz
 YxUwIdgDvGm9mdXeIbICmHEwZ8hKS/NlGPzjCntKIg==
X-Google-Smtp-Source: ABdhPJwzdFZsAwSjmMrgjDO+DrD16pbzd3Rzyb3XrpfQRBX2my3CPd9qh1UGOdy7Jm0ruYQPa6SVb/mgYVxyZeZLp3Y=
X-Received: by 2002:a05:6102:22ca:: with SMTP id
 a10mr749158vsh.152.1591654504367; 
 Mon, 08 Jun 2020 15:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200521192133.127559-1-hskinnemoen@google.com>
In-Reply-To: <20200521192133.127559-1-hskinnemoen@google.com>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Mon, 8 Jun 2020 15:14:53 -0700
Message-ID: <CAFQmdRYYhoWu7q350n0vNOE+pesp-UG975v1f1Yjwf9Ao0mjcg@mail.gmail.com>
Subject: Re: [PATCH 0/6] Add Nuvoton NPCM730/NPCM750 SoCs and two BMC machines
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, CS20 KFTing <kfting@nuvoton.com>
Content-Type: multipart/alternative; boundary="00000000000056fedb05a799f17c"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e42;
 envelope-from=hskinnemoen@google.com; helo=mail-vs1-xe42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=_AUTOLEARN
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

--00000000000056fedb05a799f17c
Content-Type: text/plain; charset="UTF-8"

On Thu, May 21, 2020 at 12:21 PM Havard Skinnemoen <hskinnemoen@google.com>
wrote:

> This patch series models enough of the Nuvoton NPCM730 and NPCM750 SoCs to
> boot
> a minimal Linux kernel. This includes device models for:
>

Does anyone have comments on this series? I'm currently finishing up a
second patch series that adds flash support and a few other things so qemu
can boot a full OpenBMC flash image built for npcm7xx.

If you prefer, I can combine them both into one series and send it to the
list.

This series can be found here:
https://patchwork.kernel.org/project/qemu-devel/list/?series=291809

Thanks,

Havard

--00000000000056fedb05a799f17c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, May 21, 2020 at 12:21 PM Havard S=
kinnemoen &lt;<a href=3D"mailto:hskinnemoen@google.com">hskinnemoen@google.=
com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">This patch series models enough of the Nuvoto=
n NPCM730 and NPCM750 SoCs to boot<br>
a minimal Linux kernel. This includes device models for:<br></blockquote><d=
iv><br></div><div>Does anyone have comments on this series? I&#39;m current=
ly finishing up a second patch series that adds flash support and a few oth=
er things so qemu can boot a full OpenBMC flash image built for npcm7xx.</d=
iv><div><br></div><div>If you prefer, I can combine them both into one seri=
es and send it to the list.</div><div><br></div><div>This series can be fou=
nd here:=C2=A0<a href=3D"https://patchwork.kernel.org/project/qemu-devel/li=
st/?series=3D291809" class=3D"cremed">https://patchwork.kernel.org/project/=
qemu-devel/list/?series=3D291809</a></div><div><br></div><div>Thanks,</div>=
<div><br></div><div>Havard</div></div></div>

--00000000000056fedb05a799f17c--

