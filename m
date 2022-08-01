Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E36958687E
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 13:49:13 +0200 (CEST)
Received: from localhost ([::1]:38652 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oITv5-00082y-Ft
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 07:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oITpL-0003zF-L9
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 07:43:17 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:42883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oITpJ-0007sM-S2
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 07:43:15 -0400
Received: by mail-yb1-xb32.google.com with SMTP id p71so167819yba.9
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 04:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=IcsEV3vhdN02tGAQKKi0KloFsNuYzLqirpxuTM6ZcYA=;
 b=xkUuUh7N0zPNsK5NSNo1G8Ie6jb5YQ9NtU70gEMc7u9JF50FAcH+BrTFZ/PzKscgQw
 +WAw+ndv/OsYVlJZKUPOcDRPTc+j5izyUQD8NfeFKuUPNSnSDbhR94MngIAvnj2dVYWh
 oxyAPle67lRGT11VPSPIkq6cBO9tYYMo5OtjU+Fcp6MaO25D7UbUwlYQp1v4KwRVeGYl
 bwlCbohr6LpaHiWLMYoPJEPD/ZWuTEseWAyjTF4CD4/q3hbgSkxFC98KDb/J5j5XyfVv
 RkqF3d8S7z4asqBmXbSJs/Sr97v2ut9lRpxn+J4B406M/QJDi3pkUAJJq1zus3/BnQw+
 qgYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=IcsEV3vhdN02tGAQKKi0KloFsNuYzLqirpxuTM6ZcYA=;
 b=ukdbylyFklTE18ZCbFdlajwWynDrVpSSEmYwe3CzJXOkra1Cd9LwIoRz0LMJgHueRw
 7baAidm7XqjOPuqmLwVOwzmf1xpe84Hb662P5Zpo1ob5034noXWAwMjAzv1aWdkefiit
 EoiPkgSk+5MmLYdaJmNjB7YVk4wvpieKJtose3NvDz6YLM2RilLd/HpsIW0FxJnL/dqw
 MmF8qdio4cBFqyserKLclS2W2U7ACwSiVY9MGShUN8+1HrPaC69VsjNbvc7QBg3/0ziW
 0+Xc7bQ9kiwjPIQuAnOI4sp9NVyxZYvyrMxRvj68OeAtAX9ONsg/piXwfZh+dR//lPNY
 C6sQ==
X-Gm-Message-State: ACgBeo22Ai0sk7566SNkGEA1Lyb5BGJKrytoic7eLCWv0id6G/DFT8IN
 2udFPSE8DuRX/sVcjJaprvbENUiqBWN2qNejcPukXg==
X-Google-Smtp-Source: AA6agR4rNHL0aH3Ie1aWWKReSoEQG/3mpdSU7eHOzzhIYaFRr+5YQACe7cLURceuLp/ZW6FKCzg34XUKDQdP4GFwol0=
X-Received: by 2002:a25:cf47:0:b0:671:8224:75c6 with SMTP id
 f68-20020a25cf47000000b00671822475c6mr10597606ybg.288.1659354192756; Mon, 01
 Aug 2022 04:43:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220725110035.1273441-1-peter.maydell@linaro.org>
 <Yt561CDN+UjmaDK3@redhat.com>
In-Reply-To: <Yt561CDN+UjmaDK3@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2022 12:43:01 +0100
Message-ID: <CAFEAcA86gdio-3_XcNJGum8qiC93iVR0RK-g_sV1QRAhb8VGUw@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Don't assume 0 is not a valid host timer_t
 value
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>, 
 Jon Alduan <jon.alduan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 25 Jul 2022 at 12:13, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Mon, Jul 25, 2022 at 12:00:35PM +0100, Peter Maydell wrote:
> > For handling guest POSIX timers, we currently use an array
> > g_posix_timers[], whose entries are a host timer_t value, or 0 for
> > "this slot is unused".  When the guest calls the timer_create syscall
> > we look through the array for a slot containing 0, and use that for
> > the new timer.
> >
> > This scheme assumes that host timer_t values can never be zero.  This
> > is unfortunately not a valid assumption -- for some host libc
> > versions, timer_t values are simply indexes starting at 0.  When
> > using this kind of host libc, the effect is that the first and second
> > timers end up sharing a slot, and so when the guest tries to operate
> > on the first timer it changes the second timer instead.
>
> For sake of historical record, could you mention here which specific
> libc impl / version highlights the problem.

How about:

"This can happen if you are using glibc's backwards-compatible
'timer_t is an integer' compat code for some reason. This happens
when a glibc newer than 2.3.3 is used for a program that was
linked to work with glibc 2.2 to 2.3.3."

Laurent, I'm going to assume you don't need a v2 sending just
for a commit message tweak, unless you'd like me to do that.

thanks
-- PMM

