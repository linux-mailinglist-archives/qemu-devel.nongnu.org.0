Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 832CA3A6E93
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 21:09:27 +0200 (CEST)
Received: from localhost ([::1]:57260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsrxe-0000Eh-JG
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 15:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsrwZ-0007MU-Kv
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:08:19 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsrwX-0006ev-Di
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 15:08:19 -0400
Received: by mail-ej1-x633.google.com with SMTP id my49so18387117ejc.7
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 12:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QrmcDiIkL5nKIlSaOVlPYtAXD8LpK7Ivx/+X1afy+V0=;
 b=W2HOJskZiLh+TqVdE4YkMIg0+9UWuKWkBe+IJwkW1uinwfJaOM6+T1AmfjLz8BSrL3
 TLACDq846SBO6qtmneIOEPxCSnJdSDqzTclWjalzKQ+tYPc4w2D3y0OnUIJ6mRuZynAz
 OtUIooxIVVJexlMF8O4uMyRADn/7xUKWVmRM4Fs1Rh3/l04srpy9GJjtm4/e6SpDnkQp
 Zl/70e/baqjJEz5B8VwPI0HDCW4o84AL4XC6rUVzPPazNoUcFvvqNmpveva86WPsjtor
 kxotrTczoA7hwn0FaMVhu9QbOguYr9NJYC/RvFeJJmdSUSWxy8+fhGC5XSkT10N23sXD
 h3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QrmcDiIkL5nKIlSaOVlPYtAXD8LpK7Ivx/+X1afy+V0=;
 b=uWUrGYlbEdo4qEi8A0PdDtcRA9sB+qSMRnMbdUuoHR8VEw7lmDmMgRQ33reReiOcj8
 iPHfnWAmZeJcw98DbhgISJOf9siZj241/wUG+/oYlmhGwLGyG12d+r37oD3H+3+nPS3m
 5T4Dfhb3bIFZ/mMeUzfelQBJiwWjiUyd62GPpwk4JjyEglGLulTy0qepueb0Ys4Un5Br
 twwclffbwoNaF62YlBWLaqKD/qFWVypjNxTDcD0FK+xCCSAHmsJiAEKjVp8VpA1hF3VV
 SZqXod8E4ubcFKu/+YMsCUtE+RzdUkAUQvmnsZYgMlqU6XrT25aP1oBzp9n6yuOgIeij
 Nd3Q==
X-Gm-Message-State: AOAM531rzeEQt+npDwT+Adizk/rFRu+6FUrtUAdO6cyJY1TTD42IV84O
 kUZXyzDfjB2r9nOpCDwIuTt7gYy7pHS+ki+sw4MQsw==
X-Google-Smtp-Source: ABdhPJyI5Chy3Ir2fumGZ1fATSNGREbGTOhtvR6VoMCfWc0WDxykeyxIjWygTBWdzbzNOFQoryuiLL7gwculkPX1bgs=
X-Received: by 2002:a17:906:a458:: with SMTP id
 cb24mr16777110ejb.482.1623697695902; 
 Mon, 14 Jun 2021 12:08:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210614141549.100410-1-berrange@redhat.com>
In-Reply-To: <20210614141549.100410-1-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 20:07:41 +0100
Message-ID: <CAFEAcA-OwgKRk22HYXO4xAjefPV_XCt5+pXJU705GDH=hU0axg@mail.gmail.com>
Subject: Re: [PULL 00/13] Misc fixes patches
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Max Reitz <mreitz@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Jun 2021 at 15:18, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> The following changes since commit 894fc4fd670aaf04a67dc7507739f914ff4bac=
f2:
>
>   Merge remote-tracking branch 'remotes/jasowang/tags/net-pull-request' i=
nto staging (2021-06-11 09:21:48 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/berrange/qemu tags/misc-fixes-pull-request
>
> for you to fetch changes up to 970bc16f60937bcfd334f14c614bd4407c247961:
>
>   usb/dev-mtp: use GDateTime for formatting timestamp for objects (2021-0=
6-14 13:28:50 +0100)
>
> ----------------------------------------------------------------
> Merge misc patches
>
>  - Add documentation of secrets passing
>  - Add documentation of authorization framework
>  - Modernize SASL documentation
>  - Improve tracing of block/migration interaction
>  - Use GDateTime for timestamp formatting
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

