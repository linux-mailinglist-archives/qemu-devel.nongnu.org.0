Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD0533ECA10
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 17:48:57 +0200 (CEST)
Received: from localhost ([::1]:39586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFINd-00019l-0H
	for lists+qemu-devel@lfdr.de; Sun, 15 Aug 2021 11:48:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFIMs-0000No-Py
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 11:48:10 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:40536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mFIMr-0001tN-FI
 for qemu-devel@nongnu.org; Sun, 15 Aug 2021 11:48:10 -0400
Received: by mail-ej1-x62b.google.com with SMTP id lo4so27302330ejb.7
 for <qemu-devel@nongnu.org>; Sun, 15 Aug 2021 08:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zG9oYU+WxlsK2/2DY3DayrQwS4i7eM6pyTBjfpnBN34=;
 b=iLr0YHRm/2rm+lKeIFhkaG0DDEwyQiCEfgafuk/mMJpmoadxjB5MNM9jlD2gSv9ZbS
 wPOJ8Z0neEK3bsoSVyHzRPyR4V+Ys2QIQZYevqMwaRPWiPx5WKl1+LWmoTxuiQZx3T4B
 VBIKLcCYh0qMDSqEbGKx3slDcvfZHSBU4x2XDAWd2ZIzpl5DcLPsxcLznADSl3OUou3H
 mVoLAabGwUAdlyN86ybVvkVhDGJLg1pkhIADkJHScxHbgrL+E//Me5W5vxmSAjDeP1LM
 p2PiFRR7QE7qj9Az8oP7ZgC69kACGyHw2DSIVPcLXdJg7f+pjunW4xFnEGWlnWIDQ2r/
 dS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zG9oYU+WxlsK2/2DY3DayrQwS4i7eM6pyTBjfpnBN34=;
 b=KwBW5A9BXnN50o9LDi3gK7u0kwO29PBrAn0/z2JZyODbrqhAI2VOj6wVe5Q4BlRR37
 xUrZWdEeMamEjomTwI0Fli6SzIj1EC2E65UDG9sr5Zuuf3KqYUFoCap0YrgJoIfcjWS6
 GKBcK/d9eKByCkyDmFgYFkBh7zvoo0iR7s4iuqrmJp9L/TJMm29NdTCyj8pdXlXrATth
 ek5VmFyqptOKpqGmGRWb6p463FOu+pjz6FYSM/5Y056/+udqdqW6Z1uvg0+hhxPpB/4U
 0YnGRRBGi/S80j4NS6YPg/PAdCmjKDLUFFUUN1YzbhyvodgnZMzg2OQTFF4fGqgGxYRS
 CW+A==
X-Gm-Message-State: AOAM530HV7HvNVri6dn1P67yOYjE9ahfJ32zkrNpu6obNQGrEyZgpZBE
 oH+DpQaTvYVM2ynTTS9J/5Eiq/1tzzuJhvqRL2pFHg==
X-Google-Smtp-Source: ABdhPJzkSeiORkBgWrcYYPGIsC6DX4MGPFw/DptQRi9pARgUQc7evAyr+IyT+UbLKkoWsIguBXkByZVAamMPQ0iZCkY=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr12298508ejz.250.1629042487598; 
 Sun, 15 Aug 2021 08:48:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210814060956.12852-1-thuth@redhat.com>
 <20210814060956.12852-3-thuth@redhat.com>
In-Reply-To: <20210814060956.12852-3-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 15 Aug 2021 16:47:22 +0100
Message-ID: <CAFEAcA-0Ef37OpBy2hegA5XMR7wT8zWjb7_dMauBJ3sh09ph7w@mail.gmail.com>
Subject: Re: [PULL 02/11] gitlab: skip many more targets in windows cross
 builds
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 14 Aug 2021 at 07:10, Thomas Huth <thuth@redhat.com> wrote:
>
> From: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>
> The windows cross builds still take way too long in gitlab CI, so need
> more targets to be skipped. We don't want to hurt coverage of other
> cross builds more though, so we let jobs fine tune with a new env
> variale $CROSS_SKIP_TARGETS.
>
> We take the set of targets that are considered relatively niche or
> very old architectures, and skip approx half of them in win32 builds
> and the other half of them in win64.

I think this pullreq is an improvement on the current situation,
so I'm planning to apply it since we need an rc4 anyway, but
after we reopen for 6.2 I think we might want to reconsider
this one. The Windows builds are pretty good at flagging up
nonportabilities because the host OS is so different, so
I'd rather we covered the whole codebase with both win32 and
win64 rather than doing only half with each.

thanks
-- PMM

