Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A757330CAF
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 12:51:13 +0100 (CET)
Received: from localhost ([::1]:54262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJEPo-0000ak-6s
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 06:51:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJEOj-0008UP-BS
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:50:05 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJEOg-0000JD-2n
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 06:50:05 -0500
Received: by mail-ej1-x62e.google.com with SMTP id lr13so19781807ejb.8
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 03:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=I0cTEGciH93yK2OQJ7ERUXxWdW62A8EbYWx+gCLYCdA=;
 b=rmGIPYnsUphFDquFUN7o3RhTQpA0SVlxWOCK2+TsrlXxlIFlRbrZR1SSJPGwDUElck
 VB60voJfZiiDdkS9nAIr5OiKL6PLVnK2vB5xfsX87HhIbH0tQhB4eDgN7YzYw8dV8BYn
 rK0ZWpq/Gvi+05P3dJV6cgrjgnPMdEWzD3OsCx0KsPHHgNVCmWNKojwmZmJH6r/HhiQe
 9o8ShN2QbASiDAbevAtU/BEpoCP2Z7a/5z02DZSBj187+XtYivUOYgMslwjOr+7siF+1
 tFUg2MOqhOzEn9e+UNzXa1byPOLdGY22VjG+CxyOqCCp7koz8n+IF8t74JwGp17mW9Fm
 cStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=I0cTEGciH93yK2OQJ7ERUXxWdW62A8EbYWx+gCLYCdA=;
 b=EIneJxqWji5vXFG0rzr2OStYOn0C8fHXWaMXVQu6ydLJ7zRqM6ENJPzx8+wLwD0Odx
 6edDQLSGl0bLWEUpze+mRp2A1udqA/QeuqYMNfVyAKPknaY2IxKgVWWVKxIjXhnYW0fT
 /TzD9FLlIKH6qP5zSV0Q2M/Cwdg7rvuAgpW/iyRaMIsKz9O/oPx8rprQHhIUzCSuURik
 qn8T5TnfgiEuAXfyUYu2DR1PvIR2p6MyyfAn/7HzixcE8R7zaqJzR0VSoMxRwTiYQ07M
 WyjhbbZ2ktEny88Tqp3DhNLCP1eorL1eUqvEbWohxuQt5oWjXWHFo5p5ldLYcJRtqAZX
 s6Ig==
X-Gm-Message-State: AOAM531hmFElvhusyxjXifc15/nLRhi14wWS1GgMZ8GWxZ/LlIgTAv5l
 0e1pqaRQX6nNyHh6LDko4uoXwLltAxW+HBWpTgWlFQ==
X-Google-Smtp-Source: ABdhPJxyQNTdfs79b+rqVO1xRqZBjNKbKlnTIb57vAuThUN/0H5X5YzTeQbl0GuX1sUyRCiFUWjurkNcJK+2cSiyqhY=
X-Received: by 2002:a17:906:1ecc:: with SMTP id
 m12mr14557119ejj.4.1615204200305; 
 Mon, 08 Mar 2021 03:50:00 -0800 (PST)
MIME-Version: 1.0
References: <20210307155654.993-1-imp@bsdimp.com>
 <f1045149-077f-e3cd-cad9-42eb3a2e2516@redhat.com>
 <CAFEAcA-kuUEYC7ovT4CELNDjGxnf_Y1scSb_dCmWQfvSeaOXjw@mail.gmail.com>
 <f6665ee9-e279-6a4d-687f-b94579d71b8d@redhat.com>
In-Reply-To: <f6665ee9-e279-6a4d-687f-b94579d71b8d@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Mar 2021 11:49:43 +0000
Message-ID: <CAFEAcA-TmtTPmr7AfjCg6_kK9+q4KrmOGTgHmiEtGJdYLi7ffA@mail.gmail.com>
Subject: Re: RESEND [PATCH v2] bsd-user: Add new maintainers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 8 Mar 2021 at 11:16, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Hi Peter,
>
> +Markus/Paolo/Laurent/Richard
>
> On 3/8/21 11:24 AM, Peter Maydell wrote:
> > On Mon, 8 Mar 2021 at 10:09, Thomas Huth <thuth@redhat.com> wrote:
> >>
> >> On 07/03/2021 16.56, Warner Losh wrote:
> >>> The FreeBSD project has a number of enhancements to bsd-user. Add mys=
elf
> >>> as maintainer and Kyle Evans as a reviewer. Also add our github repo.
> >>>
> >>> Signed-off-by: Warner Losh <imp@bsdimp.com>
> >>> Signed-off-by: Kyle Evans <kevans@freebsd.org>
> >>> Reviewed-by: Thomas Huth <thuth@redhat.com>
> >>> ---
> >>>   MAINTAINERS | 5 ++++-
> >>>   1 file changed, 4 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/MAINTAINERS b/MAINTAINERS
> >>> index 26c9454823..ec0e935038 100644
> >>> --- a/MAINTAINERS
> >>> +++ b/MAINTAINERS
> >>> @@ -2896,9 +2896,12 @@ F: thunk.c
> >>>   F: accel/tcg/user-exec*.c
> >>>
> >>>   BSD user
> >>> -S: Orphan
> >>> +M: Warner Losh <imp@bsdimp.com>
> >>> +R: Kyle Evans <kevans@freebsd.org>
> >>> +S: Maintained
> >>>   F: bsd-user/
> >>>   F: default-configs/targets/*-bsd-user.mak
> >>> +T: git https://github.com/qemu-bsd-user/qemu-bsd-user bsd-user-rebas=
e-3.1
> >>
> >> BSD is not really my home turf, but since nobody else picked this up a=
nd I
> >> plan to send a pull request for a bunch of patches anyway this week, I=
 can
> >> also put it into my queue.
> >
> > Fine with me. (The v1 was in my to-review queue, but I'm currently
> > running somewhat behind on processing patches.)
>
> This is a patch for mainstream QEMU, I'm having hard time
> understanding the point of it. This is some official way
> to say that BSD-user is not maintained in mainstream but
> has to be used in the referred fork which is way different
> that mainstream...
>
> I'd rather wait for more mainstream contributions from Warner
> and Kyle, or blow the current orphan/dead code and import
> bsd-user-rebase-3.1 adding the maintainer entries along, but
> certainly not mark this dead code as maintained.

I guess it depends what the intention is here. If the idea is
that now Warner and Kyle will look at patches that come in to
the existing bsd-user/ code in mainline, then that counts as
maintained. If they don't want to do that, then maybe we should
wait until we actually have something in mainline that they want
to maintain.

I think I agree with you about not referring to the out-of-tree
3.1-based fork; that's not relevant to upstream.

thanks
-- PMM

