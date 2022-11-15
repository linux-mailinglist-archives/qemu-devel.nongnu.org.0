Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF10628F8A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 02:50:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oul4P-0004gH-2Z; Mon, 14 Nov 2022 20:49:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oul4J-0004g1-8x
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 20:48:58 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1oul4G-0005X2-IN
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 20:48:54 -0500
Received: by mail-yb1-xb36.google.com with SMTP id b131so14935201yba.11
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 17:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bevsmtVfFta9cyLMHpGPw0tG332YBEDo3Ul8r6b7tus=;
 b=l4ehISjzq3KPdPsG3TqLvMu2ScU+LhZDynrIVIj4j1KGvRGlqziLUjpKpO9k25V5/Q
 CitnHbKniVTkfnneqnEPOCYZV/3ZEwb4JTAlRxQivdPLYz7y+R4yVjGLH14KJT0WSD/q
 tehwt8+LyulI3jjvdudUG3YBQsIp+yLAR1uE7QsSKaxxdxtTswG4v66bfrqGl4TPpfWf
 /FgHSuRE8vyLOZAChJdKqlB2196bGa7ZEY8eLxyqoUnCdPa8dZxcHPuca+4oCqZODZxZ
 BwgBihADuCVI6KqRiHfTJqZyoTeESMQsNdhGjasWA4kTodJvUqtRohIUleiKa9Cse/0q
 MOeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bevsmtVfFta9cyLMHpGPw0tG332YBEDo3Ul8r6b7tus=;
 b=wqR8penE+1qy6rJCzg6mLMjsR387kKROi5ELA36rjJJ/EyOWVJ6TbfrHzIe9lniIwL
 uroSsEb3NP3u9IeP1C011NpCKWkodvGrDLllOOTGwqE1DHVWIXbGGng5BuPCf7WEGRkF
 JNLG6ZvEsNfia2vPla7x2ReOydbdm7zvowQEAOcsSTTxhFJhsnoRTO6S4SHacVlQz1Ji
 dpW6qCNPhYvk34M8zh/r6GcSUB6QF39NijRWrgA/pYdYOEHWb2Q38zDIfqKh7oO1Jw/7
 wrhXPzFgnZCCCme8dgDqIyhFLKOQ8tp8DZCeTY0vI1AkFgU2+d9g7sL+ghyG5F+AACih
 G61A==
X-Gm-Message-State: ANoB5pnYQTFGEQQwbTRMk4o6QJ4jATdkOsPVSWM/whtbti9F/GNya5Wf
 vBNdrDrQWPzUa9JzJ0wVbbYpXVsFhmBEtxcMjCw=
X-Google-Smtp-Source: AA0mqf5fDIqHCuMCrCs9f2MTrCUUaOHaRaxZE035P+Ml5LU/vwOAH9jy101a3xfAcPBv6rprXhkNziKyvoZUdkJpQ88=
X-Received: by 2002:a25:d2c3:0:b0:6dc:e3ee:3e60 with SMTP id
 j186-20020a25d2c3000000b006dce3ee3e60mr14934534ybg.58.1668476931239; Mon, 14
 Nov 2022 17:48:51 -0800 (PST)
MIME-Version: 1.0
References: <CAJSP0QXFBKY1_aXSs9=0=FN0M5GhgqFyM_Wxq9028znz=-MvyQ@mail.gmail.com>
 <24823397-e799-cd80-5e57-18eebefa64dc@linaro.org>
In-Reply-To: <24823397-e799-cd80-5e57-18eebefa64dc@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 14 Nov 2022 20:48:39 -0500
Message-ID: <CAJSP0QVLng6f9+KyaPDvLZ3VCbUwp4VtN7nECxvn6yj8hG=-8w@mail.gmail.com>
Subject: Re: aarch64 GitLab CI runner down
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Mon, 14 Nov 2022 at 19:39, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
> On 14/11/22 22:56, Stefan Hajnoczi wrote:
> > Hi Alex and Richard,
> > The aarch64 GitLab CI runner is down again. Are you able to restart it?
>
> Alex wrote to your RH account :/ This is a scheduled shutdown.
> Equinix is relocating the hardware and this runner will be down
> for (at least) 4 days.

Thanks for letting me know. I hadn't seen the email yet.

> > Any idea why it disconnects sometimes?
>
> Sometimes? Odd. Can we check on the GitLab concentrator logs when
> the runner is unreachable?

The runner was offline recently and Alex fixed it.

Stefan

