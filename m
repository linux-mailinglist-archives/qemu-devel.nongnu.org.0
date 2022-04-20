Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6B8508D59
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 18:32:14 +0200 (CEST)
Received: from localhost ([::1]:54238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhDFV-00069Y-R8
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 12:32:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhCv7-0001Nm-Ig
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:11:09 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:44971)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhCv2-0006gZ-KU
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 12:11:09 -0400
Received: by mail-yb1-xb29.google.com with SMTP id h8so3713009ybj.11
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 09:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OwHUEDY2EXzaY0pEwGqTeB6dkRDc3iu9YRLJY5iV6xw=;
 b=CAvpzHmxBceOdz1vEToatSSJmct5B2tkYgEsZ73GRy6p4aDFiuy4JAgY0kMlw0gDH7
 HwPGpQHlFBMksWPRwriKncGI5hn9fQzkeBmvCR5gYwG0jdJ8jFpmxMXGEYR6xhwiLdNT
 v+vr0u/GG6p3XtqcEYpVJUQiFFdLzFAV8vanO/Kxeg5YI3IexbceF7gixtYZRoJQCk1T
 +vD3+3i6zPOQnD29UL8uZOj0ySyhmlbMzwNUxUXZ49eVHJa6sCh7ncPBFsnYYdKpnQ+4
 YLifpM8YX9Pza5Z4kRfLxc6zJ0+gdC9cEZP/V2Km6GvfMJSPCW+kmvpNmjmt3DyQzwK8
 q+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OwHUEDY2EXzaY0pEwGqTeB6dkRDc3iu9YRLJY5iV6xw=;
 b=IcopVfWF+56/q9F0XORCs4G9MjH4rsEUMrlEVdV6TmCKE0GCBE346x5tHSbbkenLT6
 s4nGFxSF37QNuo655ugh17WDfccvXH83j3MTvZSuaRcmhEeeOiiKuNB9Rz2x3OzzG/K/
 U1uypV6H+96Ow9gj/m3cuSZduM2k6iwiivoiaxK1bJrIwiHdRVkrK176ppkEWMV87cZa
 S1DEd7aGKAbieCclJp/tqTaTM8eJCKs7JBuyzPDGfRk/jEPIPJd9JMFLLT5Ux0y2yPer
 5isCXKgRoRf48pvFqxb4fXm499ZYDf1TyG18QiVYiAUZMwTigLAQK5fNHx15NGfLB5KY
 8PWA==
X-Gm-Message-State: AOAM533hYHCum3BF5jo2H7OgX9P0ZG6J3gmg52Ypwvbka+gINArBFgb8
 m8UFmnvvwBI2HXOZ+o00Y5RADShC7v9NgFadpWbMNA==
X-Google-Smtp-Source: ABdhPJx87Poy06PptwCqy9Y2UHuP1TqtPJbhcD/xIW+fgzwtoVIrGGtkH6AcOju9OV51c5JzsC+FQ3DlHnbyeO9UWfk=
X-Received: by 2002:a25:d4c5:0:b0:641:1569:17a8 with SMTP id
 m188-20020a25d4c5000000b00641156917a8mr20825427ybf.85.1650471063545; Wed, 20
 Apr 2022 09:11:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-7-marcandre.lureau@redhat.com>
 <YmAg+9GExN7wn6Yb@redhat.com>
In-Reply-To: <YmAg+9GExN7wn6Yb@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 20 Apr 2022 17:10:51 +0100
Message-ID: <CAFEAcA-n89moZJX5t72ek0iB0MEMQCAyq9jhVymcwyHEK_NNMw@mail.gmail.com>
Subject: Re: [PATCH 06/41] include: rename qemu-common.h qemu/copyright.h
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 Michael Roth <michael.roth@amd.com>, Kyle Evans <kevans@freebsd.org>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 "open list:virtiofs" <virtio-fs@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Akihiko Odaki <akihiko.odaki@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, marcandre.lureau@redhat.com,
 Eric Blake <eblake@redhat.com>, Warner Losh <imp@bsdimp.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Apr 2022 at 16:04, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Wed, Apr 20, 2022 at 05:25:49PM +0400, marcandre.lureau@redhat.com wro=
te:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> Could use a commit message explaining why this is a good
> idea.
>
> I see it contains QEMU_COPYRIGHT macro, but it also then
> contains QEMU_HELP_BOTTOM which is about bug reporting
> not copyright.
>
> IMHO something like 'qemu-cli.h' could be a better match

"-cli" is both too broad and also inaccurate, because we use
these macros in the GUI UI frontends too. It's "macros defining
strings for use in version/usage/help dialogs and output".
Maybe qemu/help-texts.h ?

-- PMM

