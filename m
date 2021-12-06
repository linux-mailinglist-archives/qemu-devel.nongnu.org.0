Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F78E4694BC
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 12:06:35 +0100 (CET)
Received: from localhost ([::1]:58562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muBpK-0004NB-A7
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 06:06:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muBcq-0002BA-Fc
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:53:40 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:37748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1muBco-0000T8-HL
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 05:53:40 -0500
Received: by mail-ot1-f51.google.com with SMTP id
 h19-20020a9d3e53000000b0056547b797b2so13038308otg.4
 for <qemu-devel@nongnu.org>; Mon, 06 Dec 2021 02:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dYur0J85j1uWrqa+F3tdsGV6z5lPp1EVuHntFhSZ/JA=;
 b=OwTwBMtKP5/WRIizEnznSTeL6kzpxEKHzFj2KO6vb5IaLFn9PMbG+X9WzkItZqyD/p
 ZTQDUJYiG5BlEgYF2T7maHyoKYO3MseN4Iq77Rf1l6YLoQDJWNWFxnHM7uDR22jMA6aB
 UiJXPLuZl8AYLdCZGfLZ1zpb++6N/i2ivUenLI16JIl4dqAo2ST3JV7IcLTE3T609ZK8
 0HnvUyQute2D9/fmcHmAwr6DrY/t2GOJnvKZ7TmS5w0iep+xXti1pPkDo+LhEqTIGnfM
 rUU0sQ8alKVX8hLLi5HRbm6kiCtMFudmNpJ/5SOx1z+sExqD8MmIAawvFCFnz1m9CkCx
 NQEg==
X-Gm-Message-State: AOAM530qbKjQjWg/6SSWjZUTTJ4IKaFvCvWLmaV0NC0OSnHIZZSLlTpZ
 2M8+hjhdRZPd69hm228BUGDybLcmXIeHRZgOPzI=
X-Google-Smtp-Source: ABdhPJwcPVRHXraW8ZBBA+7Fxd/3yBPLyWrNFhOSELnuhqXRpodbRWRY4BkmEWZuOVfOilXWB+kiVNu+HaUTVsLMcxE=
X-Received: by 2002:a9d:1e1:: with SMTP id e88mr28449260ote.75.1638788016639; 
 Mon, 06 Dec 2021 02:53:36 -0800 (PST)
MIME-Version: 1.0
References: <20211206095209.2332376-1-alex.bennee@linaro.org>
 <5523cd8d-ef7c-e9a1-d04d-67e6db01f688@amsat.org>
 <6d014e00-59f8-1f52-883f-384dfc016f19@amsat.org>
In-Reply-To: <6d014e00-59f8-1f52-883f-384dfc016f19@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 6 Dec 2021 11:53:25 +0100
Message-ID: <CAAdtpL6DL-+ed9cy4-yvgUt-X2oAK-s2oA0ekkX6V23H9VMRkw@mail.gmail.com>
Subject: Re: [PATCH for 6.2? v2] Revert "vga: don't abort when adding a
 duplicate isa-vga device"
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.51;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f51.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 6, 2021 at 11:50 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
> On 12/6/21 11:43, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 12/6/21 10:52, Alex Benn=C3=A9e wrote:
> >> This reverts commit 7852a77f598635a67a222b6c1463c8b46098aed2.
> >>
> >> The check is bogus as it ends up finding itself and falling over.
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/733
> >> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> >> Message-Id: <20211202164929.1119036-1-alex.bennee@linaro.org>
> >>
> >> ---
> >> v2
> >>   - fixed bug link
> >
> > IIUC Cornelia & Mark said the correct fix is simply:
> >
> > -- >8 --
> > -    if (object_resolve_path_type("", TYPE_ISA_VGA, NULL)) {
> > +    if (!object_resolve_path_type("", TYPE_ISA_VGA, NULL)) {
> > ---
>
> Bah I just noticed your update on v1:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg854596.html
>
> So:
>
> Acked-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

I meant:
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

> and queued to mips-fixes, thanks.

(still valid).

