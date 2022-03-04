Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0160F4CE123
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 00:45:32 +0100 (CET)
Received: from localhost ([::1]:52006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQHc2-0007eG-JV
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 18:45:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1nQHa3-0006jh-37
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 18:43:27 -0500
Received: from [2a00:1450:4864:20::52c] (port=42520
 helo=mail-ed1-x52c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1nQHa1-00042r-IV
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 18:43:26 -0500
Received: by mail-ed1-x52c.google.com with SMTP id i11so12610188eda.9
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 15:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kRqs1yUy3Hy2Jh9AbP/seSdeTZP/Cdtr+ApNmnZ/uyM=;
 b=Ps/xAP41f5VDpPxGztxcg9Wih8NaGUPYllZxbUJDQP5qnScYPs94CCOc3bW1TD6uvo
 wC6nbdjc7M26wv4MHJstjN8bE9X50KxdjGJMwzHXQNyBIeZIdk2eAjHxEavk+PEq0/kT
 Bx8xkd2WUF8M57DXSSAY7tEcJx75EyPkxGXKfyF6oyI6MVzfJSkYWfnYtpSeod1DZED1
 Rp1M8++4eZWghpmQnlfm/AgKn1zzEgZm9nlUPiNOQjBbzlrbjc40mPCzcDMPSX4WZhCE
 kT5rbydeAzB7qfRhFVQtCRdsHaQy9pveRSG2eLG748js8Nt9Ky/HOB4ATzMjbfvJjmy3
 HsPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kRqs1yUy3Hy2Jh9AbP/seSdeTZP/Cdtr+ApNmnZ/uyM=;
 b=sZDr4vlIEnyg3qa7EeIGd30Dv8s3mAa9wASOzBMs7/cdlDGRFndiN5Cd6k6IW6B7dd
 k+PcL8fQGu9Fl/yHq7tHLq4umr4d/j0j9vpgoBE0gwHWM1CSUdCxldoVXzdZZ5NLjw4E
 dwPhEXU3ca5JhxNlFGmnOGk803u0zSjv4TWpb6YTevrx4XIHmVn1sCHAo5izQQyhjZat
 yjR3CU7ItfEd+J/qp1x3rQlCj5qpUq4BLxXjAY/7TQ/8e0UD6n8se1aOekIra17TiPwb
 1VGfyIKC3QfKXD8iUrQNDvyuC7ByHoxakaWw9keJyPffui0vszUA4NEWNp92OGrIz0E/
 CA2w==
X-Gm-Message-State: AOAM5320rll5kLfsBieLRs13dS/LVnboYgKV4zDRw/z2spytKCMCqwWb
 QCM2B4D/aHRT8DU3nGFtUXe363+SkXsk1dyirWYBRg==
X-Google-Smtp-Source: ABdhPJxvC5KlNpNCmnBWvqq1H/wbwvFMq2o7rctGBLDPt8GY2Brcm+IRUVecFIWuJFAtw8U0mGylBOnmIljwcgbWmMc=
X-Received: by 2002:a05:6402:68e:b0:415:d29e:dfe8 with SMTP id
 f14-20020a056402068e00b00415d29edfe8mr805081edy.351.1646437402415; Fri, 04
 Mar 2022 15:43:22 -0800 (PST)
MIME-Version: 1.0
References: <20220302015053.1984165-1-titusr@google.com>
 <20220304214354.GL3457@minyard.net>
In-Reply-To: <20220304214354.GL3457@minyard.net>
From: Titus Rwantare <titusr@google.com>
Date: Fri, 4 Mar 2022 15:42:46 -0800
Message-ID: <CAMvPwGpzO3VyCqGJY28QVQoo9AwYxxrvP3RqPS6JTgpTk8ojtw@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] This patch series contains updates to PMBus in
 QEMU along with some PMBus device models for Renesas regulators. I have also
 added myself to MAINTAINERS as this code is in use daily, where I am
 responsible for it.
To: minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, f4bug@amsat.org, 
 wuhaotsh@google.com, venture@google.com, peter.maydell@linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=titusr@google.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -161
X-Spam_score: -16.2
X-Spam_bar: ----------------
X-Spam_report: (-16.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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

On Fri, 4 Mar 2022 at 13:43, Corey Minyard <minyard@acm.org> wrote:
>
> On Tue, Mar 01, 2022 at 05:50:44PM -0800, Titus Rwantare wrote:
> > v2:
> >   - split PMBus commit with updates into individual fixes
> >   - renamed isl_pmbus[.ch] adding _vr for voltage regulators
> >
> > v3:
> >   - split uint refactor commit and removed commit renaming files
> >   - rename rolled into preceding commits
> >   - update commit description for uint refactoring change
>
> This all looks good to me:
>
> Acked-by: Corey Minyard <cminyard@mvista.com>
>
> Do you have a plan for getting this in to qemu?  Like through the ARM
> tree?  I could take it into an I2C tree, but there's really not much
> activity or work there.
>
> -corey

In general PMBus is more specific to i2c than ARM, but I'm not sure of
the QEMU implications.

Titus

