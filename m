Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10ED8496D28
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 18:59:06 +0100 (CET)
Received: from localhost ([::1]:53788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBKfI-0000kU-N5
	for lists+qemu-devel@lfdr.de; Sat, 22 Jan 2022 12:59:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBKdN-0007Mi-3l
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 12:57:05 -0500
Received: from [2a00:1450:4864:20::430] (port=46906
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nBKdL-000779-Ap
 for qemu-devel@nongnu.org; Sat, 22 Jan 2022 12:57:04 -0500
Received: by mail-wr1-x430.google.com with SMTP id l25so5813902wrb.13
 for <qemu-devel@nongnu.org>; Sat, 22 Jan 2022 09:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UYtphRDLrlJMGoOMbU+8RgOnQKcBl50/pHy7FLIhsg4=;
 b=KjKUgYXQz0COWn30dRlS7weAjKgMNe6TFeYDnk4l7g6fuzWgbQhSO3vlRM/wuzS04a
 tTY4ep1Lrdh6C9xNY2MPiabx3ogXUN03f6fvl5wx5R8eaIDKfTZFqXq1EnuAiFted+Pv
 VWVjArQo6izEJNkS26L7GEp3W9QZ9f/eICq1JcA+oM80vqocC0VD5WAV/b1JUJG2UC4C
 ccj+cDMHbQCfHmxfQWwuU1WKDK1X23w/jKn5eEDJYXyGcI2K4luP7G7uIS3yYGh8FHNq
 xJJxndDZPVUCM5sQUoHCWz0d27wmu26xT0xq0KxXZ6avdym3MBRzgQ1lXMTY9lfmcZ6v
 SdFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UYtphRDLrlJMGoOMbU+8RgOnQKcBl50/pHy7FLIhsg4=;
 b=hPot0+5o5Lh/EGBVWFB9+J8cIkQYpGaKw9eAjCPrD2oSib0VYy3mDILjRr63ESk76H
 Cy0LT9IaLS2k6J0GQDeU+hNWl332HzMensfxtCZwjYvStmmPH513MzkvQAaFJSImgQEN
 CktLJSAOcAeZgH9gk+ZXijjrAaVXYLTtMMbWSpuOuB0ZTAdaLHA+S7Q9oV1I+n/QvehL
 JC5cf4fqsBSp+yRwAluSYIULvw3sw0US9dQ+CcScECLp1N8kWJk+OD68ZkvnXo3z3HgD
 HakUsSxxKDZCMkwAhrhFv6V+rJ2AKEO2ETK15mhPulM2MuaAJzgTnBxod0OH4IimOFs+
 isEQ==
X-Gm-Message-State: AOAM533lCLH+vrZjfYROjG95TnyLsRKbRxY4VVle3IFixfBPkO38uTJN
 7ElndhSguaIKDoFfVnfYVzSDGyl9WxCE54Cdyw/oMw==
X-Google-Smtp-Source: ABdhPJwUajwaFM15Vb8ogYu766wiZXs2I8MgxlBn6ut+TWGatJOJLZy6TU01W4ffiozfpSzPUFf8l4J4NRqC0w6hsmI=
X-Received: by 2002:adf:e949:: with SMTP id m9mr8342821wrn.172.1642874221845; 
 Sat, 22 Jan 2022 09:57:01 -0800 (PST)
MIME-Version: 1.0
References: <20220122000931.536322-1-jsnow@redhat.com>
 <CAFEAcA8h++yFCYhx7Fecaz3AnSXA3HmmaRbUWeGkg8zWG9VptA@mail.gmail.com>
 <CAFn=p-bx+=GQGeKTXOBKdQ+8KKUL5g0u9_ryQ1X6D5pTBTA_LQ@mail.gmail.com>
In-Reply-To: <CAFn=p-bx+=GQGeKTXOBKdQ+8KKUL5g0u9_ryQ1X6D5pTBTA_LQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 22 Jan 2022 17:56:50 +0000
Message-ID: <CAFEAcA-2DxXogQP=D31jbvObStTqDgyD8zv53_KLs_g4iiF5mw@mail.gmail.com>
Subject: Re: [PULL 00/17] Python patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 22 Jan 2022 at 17:06, John Snow <jsnow@redhat.com> wrote:
>
>
>
> On Sat, Jan 22, 2022, 8:58 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> On Sat, 22 Jan 2022 at 00:09, John Snow <jsnow@redhat.com> wrote:
>> >
>> > The following changes since commit 5e9d14f2bea6df89c0675df953f9c839560d2266:
>> >
>> >   Merge remote-tracking branch 'remotes/alistair/tags/pull-riscv-to-apply-20220121-1' into staging (2022-01-21 10:31:25 +0000)
>> >
>> > are available in the Git repository at:
>> >
>> >   https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>> >
>> > for you to fetch changes up to 05908602429cf9d6fce9b60704b8395f6d295441:
>> >
>> >   scripts/render-block-graph: switch to AQMP (2022-01-21 16:01:31 -0500)
>> >
>> > ----------------------------------------------------------------
>> > Python patches
>> >
>> > A few fixes to the Python CI tests, a few fixes to the (async) QMP
>> > library, and a set of patches that begin to shift us towards using the
>> > new qmp lib.
>> >
>> > ----------------------------------------------------------------
>>
>> Was this set of patches supposed to fix the NetBSD VM intermittents?
>
>
> No, nobody reviewed or tested that series yet, so I didn't pull it.
>
> (Is that too conservative ...?)
>
> If you'd like, I can include them anyway in a v2 pull here and you can test it as part of your merge.

No, that's fine -- I just hadn't been keeping track of which patches
were intended as the fix.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

