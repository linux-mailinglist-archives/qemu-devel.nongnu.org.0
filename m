Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5D648AD7C
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 13:19:10 +0100 (CET)
Received: from localhost ([::1]:33498 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7G7J-0004sO-H2
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 07:19:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7G0H-0005KD-2V
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:11:56 -0500
Received: from [2a00:1450:4864:20::42d] (port=36690
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7G06-0004T4-5X
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 07:11:52 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r28so4186201wrc.3
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 04:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=baYtVBFyl2TA4XP5+yotCpNy9aYDLGXCqmkMXsPz02I=;
 b=qorhMpQ/ab0WeDdkOn+RHSRiwmwKLlv/OAKXVuy4GoQM1hr7qJCG6gQ/NkYfwyRltS
 bzoLwfJzDjCGiqsrLfxqa6kCu9NCeuxd1redmuMu4veQglQysspg13/Ls+Y3oT5H1YWJ
 o35rY01wgYSDGh1uzc/ghcIO4GrTu1U157ae9ADrIDOMJrsU3saXXTC44ZmFmsnh5Esu
 GEru808n9zyzl+Ux7wvqGe+frRhTf/314CAWsU61acpXN+34bxAk3tXFnZEbeAnxonPa
 rIwYM1Gwy6z15keTsOsLE+ku2GUIm9fE+wyrTqGqP9/CbO7iNQk3DGcbf8oo+SB2clKi
 j0pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=baYtVBFyl2TA4XP5+yotCpNy9aYDLGXCqmkMXsPz02I=;
 b=YXMvwxwtonIsyaCkaGSgpHk5LFIF1BL26pY4o9Lhzh9ojICOPeRTQjjCWkij/tt1SW
 cpFfzdXxq5aFBY3Al2fH5V2xzyGbhWh0BGzqIll7bD06J+IYvUAoAcTaRs6qWKKB9S1x
 B72o5mdO6yygjebBiGMuFdlLWbNsch2yVZtx2cnWpAjA28aj17Md211sdsYqDMYskoX/
 Wmt0KK6Ww+cheow4Mu6rfT8q8Qo7ChTWxUjp7qp29gjjHtnGKMzJsN8mTo9LpYCgUQdr
 IOSwdR+hdcgp9CSgm5jH524NjrgXgZwv/Uot80ISZ8p+BaIl+nAe86WIRgMJTB1t0uN/
 ztwQ==
X-Gm-Message-State: AOAM5322M6lTtRJ53dvdIEnhaCbFTYWRaL0v+OW6CdfwazLqUJoIIWGK
 6cicGE9yvkEuVQ8XIP7LgIIJV01YgGT7FkIXo2B2EA==
X-Google-Smtp-Source: ABdhPJw9s+v3rGedsKNkUyrvJVdnaY3nEo/XplozIlfcH+NoOevXUk35hs50svtXvJAKawDU4BNDN1tG1ci6ITZRsmg=
X-Received: by 2002:adf:e907:: with SMTP id f7mr2863572wrm.319.1641903094123; 
 Tue, 11 Jan 2022 04:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20220111101934.115028-1-dgilbert@redhat.com>
In-Reply-To: <20220111101934.115028-1-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Jan 2022 12:11:23 +0000
Message-ID: <CAFEAcA-RkY+UDgd=C14WoQrPOk2QD1wTF8bvM02SsMg28LjH6Q@mail.gmail.com>
Subject: Re: [PATCH] clock-vmstate: Add missing END_OF_LIST
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: damien.hedde@greensocs.com, alex.bennee@linaro.org, luc@lmichel.fr,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 11 Jan 2022 at 10:19, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>
> Add the missing VMSTATE_END_OF_LIST to vmstate_muldiv
>
> Fixes: 99abcbc7600 ("clock: Provide builtin multiplier/divider")
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> ---
>  hw/core/clock-vmstate.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/hw/core/clock-vmstate.c b/hw/core/clock-vmstate.c
> index 9d9174ffbd..7eccb6d4ea 100644
> --- a/hw/core/clock-vmstate.c
> +++ b/hw/core/clock-vmstate.c
> @@ -44,6 +44,7 @@ const VMStateDescription vmstate_muldiv = {
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(multiplier, Clock),
>          VMSTATE_UINT32(divider, Clock),
> +        VMSTATE_END_OF_LIST()
>      },
>  };

Cc: qemu-stable@nongnu.org
seems appropriate here ?

thanks
-- PMM

