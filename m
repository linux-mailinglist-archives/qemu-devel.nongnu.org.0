Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2996F4095
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 12:04:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmrW-0007Lz-Qn; Tue, 02 May 2023 06:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptmrS-0007LY-OJ
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:03:56 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptmrP-00034d-NZ
 for qemu-devel@nongnu.org; Tue, 02 May 2023 06:03:54 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-50bc0117683so4750232a12.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 03:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683021825; x=1685613825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F2efKstLuFSV2MwPlPlbWp39OrAzVcirlyPZoHjWxX8=;
 b=WXgrKH9TumB8FN41nv5jkLm5kp9sv/0rQgdAgH6QETpu33M0KGkYACVYKeiWjL3Lad
 tlvZQCXvbkZath0dQF3Ge/5I9e9XC2/p4RvQOqv5XSDT5rmCqm4666UyPSpyS1+FrzWV
 UA7l2H9UmeLLhJycoAbqRdTXTfsjnZMvMnrCjcVA0KbPZhgYhT/yrcbpF2ipx+NuamZV
 fp7dIRA1PZkCjXh/w8jdJ/Nq6xcb8o9ubVxH0SST3OGNEyoSGkxvIHSanDCjyvsNRKXX
 qpFT1O+F6jlMNiJgm6H/tiTvjEiCI5I+yP4GKcMfJsP7bTaqJlV9qPfXK2iv59OAe7w8
 HC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683021825; x=1685613825;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F2efKstLuFSV2MwPlPlbWp39OrAzVcirlyPZoHjWxX8=;
 b=VZdCNjVWMTTWGwXd9oGvH5xQll8yuuUDOkKMR85E5Mco4/hpWVwAUfAVyB0zbQEqHE
 wLeImykYHi/FPBABOutkidtWw6q9pVal7W7kuUs1wzoCfDUOo25d2biMLTsxhACUO8ci
 7XuU1sUyQKpP9pXkjce2kvKJWOPt9XC6UlY4SepKMWFafJW4vKBh99OtduBK+0TKR2lm
 xFj+g4vzYmW8hgETVgIB5yS9OWf5L3/mqePMW2U1gYAsuz1XhyG5dDAbVmHLUsKGxMx7
 Uk59GvBEuhleBVctg6oIEXapF3kRCFX112GIlOjUXP1TOyp+54txbkBdSE/9TURBc2XS
 WgXQ==
X-Gm-Message-State: AC+VfDywr165VDVHJv1qvgFYCDyZRA4hY0feO8fqk9nUEnET8HDvXfPY
 kiifzU/R5C/9dFfseohfqUvP056KI5COfNjnzS2iUQ==
X-Google-Smtp-Source: ACHHUZ7C6Y9LlO4gQUzJ4kUA3wgxJEiKJGMtPfcyL6bbNTsLSZ+Vjw2ttjHnX8vCZ8/g6kAFKzBxE/72ReRP8AKJPlk=
X-Received: by 2002:aa7:c1c3:0:b0:506:82b7:10c3 with SMTP id
 d3-20020aa7c1c3000000b0050682b710c3mr7358687edp.41.1683021823680; Tue, 02 May
 2023 03:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221003173810.1933849-1-venture@google.com>
 <CAFEAcA9x7oC9sQy8XNJ8-WRc3X=qBVL1nMLB==dGM=+O5Z-CAQ@mail.gmail.com>
 <CAO=notw1yJeKPdjU65dAXbDgY0y8u1s5MDCcymLqCiw=pTcRiw@mail.gmail.com>
In-Reply-To: <CAO=notw1yJeKPdjU65dAXbDgY0y8u1s5MDCcymLqCiw=pTcRiw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 11:03:32 +0100
Message-ID: <CAFEAcA-c1fYqxaeJrWntfhhna9i4nb35MXtn6YTS6MrH8KYyww@mail.gmail.com>
Subject: Re: [PATCH v2] hw/net: npcm7xx_emc: set MAC in register space
To: Patrick Venture <venture@google.com>
Cc: hskinnemoen@google.com, kfting@nuvoton.com, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org, jasowang@redhat.com, Hao Wu <wuhaotsh@google.com>, 
 =?UTF-8?Q?Phil_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Tue, 25 Apr 2023 at 21:49, Patrick Venture <venture@google.com> wrote:
>
>
>
> On Thu, Oct 6, 2022 at 6:18=E2=80=AFAM Peter Maydell <peter.maydell@linar=
o.org> wrote:
>>
>> On Mon, 3 Oct 2022 at 18:38, Patrick Venture <venture@google.com> wrote:
>> >
>> > The MAC address set from Qemu wasn't being saved into the register spa=
ce.
>> >
>> > Reviewed-by: Hao Wu <wuhaotsh@google.com>
>> > Signed-off-by: Patrick Venture <venture@google.com>
>> > ---
>> > v2: only set the registers from qemu on reset
>> >     once registers set, only read and write to them
>>
>>
>>
>> Applied to target-arm.next, thanks.
>
>
> I think this was missed.  Please take a look.

Oops, I'm not sure where that got lost. I've applied it
to target-arm.next for real this time. (I corrected the
placement of the variable declaration but have not made
the changes to use the ld*_p/st*_p functions Philippe suggests,
because in this patch we're just moving that bit of code
from one place to another.)

thanks
-- PMM

