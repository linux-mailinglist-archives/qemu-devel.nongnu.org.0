Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A432C53E5
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:24:29 +0100 (CET)
Received: from localhost ([::1]:40222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiGK4-0004T9-EE
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiGAy-0006Df-CC
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:15:08 -0500
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641]:42213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiGAu-0004a4-OW
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:15:04 -0500
Received: by mail-ej1-x641.google.com with SMTP id d17so706878ejy.9
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 04:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PPMYSpW1oRvUcUazLR1FH53oFJ/sZPVetrUYaZgkZ0o=;
 b=DVQpMrWnothmwnoLxMf05Oh/jtwGFk5lR7RxoZV0356XWPF46qUcekZwNhe+upyE3y
 J9EE+bNwW3NVc0cZiZCP05RdDhD2wNfwwPXBnczimZLvomnsWFpNperRGinjy0dlU7ZB
 ATK+jJ3om15ycBRKleFKYSGaF3A/jfqBKNkbalLBplosaqjOK3/qMrv+qT/CnBUGQdSn
 QpGSOHmPPRr0KUqlJDwa043Rv9p6nFJaedqysK9PSHijqIC5FJBUSD5YH0CgcSbHmNYr
 Io4/zRjhy3VeIxJoQCxdXWbBfmKUcC9guCiE/62SLf+UOS3qF69ytzsYZL9MOFtUD8h6
 h06A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PPMYSpW1oRvUcUazLR1FH53oFJ/sZPVetrUYaZgkZ0o=;
 b=VSUG1Z+6R51eHSU9qs8c8sibHkH/rH7vrHAOPuH1CSIRlC/hD3ASpduSLNNW6zBck6
 7Ng3NQtB+ipyn2kqd94661looollNr0AT8sRxtX1aWxG1WrJvACBXM7iwPq/gxB+6b/8
 Wg0so34vgm4gVMmtbQGF9aatfwZUZNsAJqaSE6F6LxlLmS6RuK+iUoovHQBuAsFVCc9c
 plIH8UFUF1zl93a3StUhcmYRaGlmKBJB3t6Y3e8jRppEtPMlFwLbaQPQxKvfYcgdFBBJ
 8ic4GyaaMQPh3xYknpto3VcpBrL53p40T5yAg7VZTy8dxg3OncRJipNglWTedw61oFF3
 5oUg==
X-Gm-Message-State: AOAM530VjJVUWVZmRRYEW49oVbF0nruq3bBlU+yy9loWmQ2CMuGkyiGz
 mmLJhG6vD7p1P/8iKqZ5H2kbnGfZD6hnEgh/J6Cu1Q==
X-Google-Smtp-Source: ABdhPJyZ9Y6YOGzVPMi9cyMjEn2uU9a9zyUHMJ1mj5H8GiKuSse3TIBJcYV8NKgVkS7kLxylitaMGUX4XEbrU19GgI0=
X-Received: by 2002:a17:906:5a88:: with SMTP id
 l8mr2397822ejq.407.1606392899224; 
 Thu, 26 Nov 2020 04:14:59 -0800 (PST)
MIME-Version: 1.0
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-6-marcandre.lureau@redhat.com>
 <CAFEAcA9+hV2L9qjCj8naNX1GuPgGenE2CLBuKR+LHa415jrmRw@mail.gmail.com>
 <20201126121243.GF1122957@redhat.com>
In-Reply-To: <20201126121243.GF1122957@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 12:14:48 +0000
Message-ID: <CAFEAcA8QqAq=+UQ2m7ztD7-Qh6y0YJ=qY3koabX7koWi-9b_MA@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] qemu-plugin.h: remove GCC < 4
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::641;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x641.google.com
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 12:12, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> On Thu, Nov 26, 2020 at 11:57:14AM +0000, Peter Maydell wrote:
> > This is an interesting case, because it's a header intended
> > for external use (people compiling plugins), not part of
> > QEMU proper. I don't know whether we want to impose the
> > same clang/gcc requirements on plugin builders, though it's
> > probably not a bad idea to do so. Alex ?
>
> IIUC, we expect that the plugins are built specifically to go with
> the QEMU you have built.

No, the point of the plugin interface is that it actually is
a (constrained) stable ABI with version-querying and checking
so you don't have to build a plugin against the exact matching
QEMU version. (But "don't use really ancient gcc" doesn't seem
like a very major thing to ask of its users.)

thanks
-- PMM

