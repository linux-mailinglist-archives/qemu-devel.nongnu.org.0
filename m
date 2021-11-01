Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9A3441D3B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 16:14:23 +0100 (CET)
Received: from localhost ([::1]:52400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhZ0w-0007kr-D5
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 11:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhZ01-0006r5-P4
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 11:13:25 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhYzz-0006MU-Qa
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 11:13:25 -0400
Received: by mail-wr1-x433.google.com with SMTP id o14so28511059wra.12
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 08:13:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nYUa+dBsj0I9rT98PP8O/lh/lW8QAI7b1M9uO1VKdD0=;
 b=FWHQjrP2aUZFIhgoGhi0ZXO5msZ3MuXy+nE838b1kEk9S2jVoa//zimdPYtIVdyPU+
 E/Kxc+o6kKY5TjMo0LBb+XwGEA9cTP0yWKxIpylKWmWGurV7MjrCULrU8X0jJixY/WhE
 Yc/7fhBxK2+xfb5jYPWyvs3SgPK82f94869azjxXNGqryUBI76RF/o9uRMZAuNnsBDBa
 PcvcN7YfQfErmfU6cuBDGJOUWFrrs6iqtGqk5k9JIeBPxwhLuucPezqpbVAqKg/JkmxH
 VUphLvDCLBV1KnUtca5yD6LHMcc150mZ5hqINB/19h4/rxUjHy1CHZM72hIstb7g9jTC
 GyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nYUa+dBsj0I9rT98PP8O/lh/lW8QAI7b1M9uO1VKdD0=;
 b=1cblahNLUecMB8vzwWF2JeamywY0hfwIwaJQ5lwBrlujUSA5TQZRlWik7IjQ3lJ0nk
 hewIxz7KFe4G9B1BkZPZ4Dp/b+Hrytn9YEGhv6tWMSwBjxwd0JspE+wvlM6+56EsheeO
 B0L0IEs7SzPXx741VYM0ZEUWm4pHBHeQyiagWiqlK3gSfqZwWGWWLwdpvcCegaToTE7v
 oIKnfUpOr4xur8eryLRlOIi+jMPSv7isJRjDNw1NhQEDekdKQI7jkTQJy5PVnxx5sfZg
 cvY3hkDd/VmEeQPpkf7AIgbipT6Up/dPKI+ClW0WZSSuCRLFRf3zlWq6dW9+02Whpy+k
 qGLg==
X-Gm-Message-State: AOAM532sHOHrICZf64Ag3jqLZ28SvBaiRRXwB3PmZSbOxsYLxO8nnFVe
 cwFm2KBXAC3bpedItV6PD8qe3mGYaOdKK28U5Sewvg==
X-Google-Smtp-Source: ABdhPJyT4wSOUFakmIAz/dMtClGs6Cx4RF+7+LLEUqGiiTLPWxsoP66pCVXPTvaTkt5pOmmdsfgKcEWgRbZnWLtSBww=
X-Received: by 2002:a5d:6151:: with SMTP id y17mr30587886wrt.275.1635779602166; 
 Mon, 01 Nov 2021 08:13:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_UiCrYEkv3uC_6VD9mY3jzKY+ziKTxSE4ydDbHd4U5vw@mail.gmail.com>
 <YYACktMpIIswE9Zi@redhat.com>
In-Reply-To: <YYACktMpIIswE9Zi@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 15:13:10 +0000
Message-ID: <CAFEAcA8eND_knYS23YDyX6ZboXJxn-0FYiQ3kq2gAMot14ZkaA@mail.gmail.com>
Subject: Re: meson complains about "broken python installation"
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Nov 2021 at 15:07, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> On Mon, Nov 01, 2021 at 02:53:44PM +0000, Peter Maydell wrote:
> > At some point in the last month a meson change landed, and now
> > when meson runs it complains:
> >
> >  WARNING: Broken python installation detected. Python files installed
> >  by Meson might not be found by python interpreter.

> > Any idea what meson is complaning about ?
>
> The source code emitting this warning message has a comment
> pointing to:
>
>   https://github.com/mesonbuild/meson/issues/8739
>
> It seems that there is something broken about Python on Debian but
> can't say i especially understand the bug report discussion there.

Me neither. The warning is pretty unhelpful (in the sense that it
does not clearly describe what/where the problem is or how it might be
fixed) and seems mostly likely to cause our users who run Ubuntu or
Debian to come and complain at us about something that's not under
our control.

Also, Debian have been shipping Python for years and years and
years with nothing obviously being badly wrong with it.

thanks
-- PMM

