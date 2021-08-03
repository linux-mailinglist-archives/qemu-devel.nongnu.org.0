Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 134293DF138
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 17:16:39 +0200 (CEST)
Received: from localhost ([::1]:59578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAw9m-0003br-3u
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 11:16:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAw7k-00025w-Up
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:14:32 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:36725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAw7j-0001zN-EN
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:14:32 -0400
Received: by mail-ej1-x633.google.com with SMTP id c25so201625ejb.3
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 08:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OTIq2qqI8Xj2rSyaw0pbbX1YejKINRD4MpWlN1JUrKs=;
 b=KV7xenceAMpl00q2nLRAJbuUARucLzdXkQnyJD8HZYqsVwM5QVkxbHTW8lETxekml2
 +Edl4JLuNw8bjYLUud0Gsn/GjZS82yfX/p57VaeIHb+DmwnMn6jbFBQHYcPg2BzZThBN
 LzXxnT/qyBDQewBeg5NkVl+jzQzi8NEAvrJpUHGD+OWSuGmasC+uUc76exUDtw2XQMGi
 O9JBTm83XnyzqY4xA1ZWRu4CzRKOSeEr/HlQD1I7yhGY/2zLVAuZSohsYGdn/lHXf69f
 APP/dT0tpgIbUAjCA5r3ovZio99IGdho44OBrOcMTLF1roSCuuxbkAJaczNUwWHVSuXN
 nvSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OTIq2qqI8Xj2rSyaw0pbbX1YejKINRD4MpWlN1JUrKs=;
 b=rt0aPdu0Gu+MNkiAOR1C46/ZrqI90AQ2ApUMMmosWarmDXkekweYrz86zI+b+kE/1U
 PxXzZEaMLjkH/m2zRuNFukfJa1aGuOQ7w/e14ZiLYZIbXIWLVnmmA8LE9LgKyVR1K6Vr
 iXknmZaKcU7aGI2de5rDyB7zioSU4BtSqYBzmjkyRaHSxIlKprVnv2hjrrLfQ4wga4I+
 awZ8x9RfuPLYHPGIhmy0304pdMPzvIp447jrS66QPmvbN5sq8A2a2zQrGW4anFovtE2x
 SQ1aNk43OVrR72Hx9NJeuUW/c12rwBd8j7BqtpocNMvTxRrRkcJkZM/kcyHyjK0uuZto
 6B6A==
X-Gm-Message-State: AOAM530n+N89RdGxrqIQuEkxxQEOfGR8aZQdCbZ5wizZJB9iaOTMGsts
 H+1fPVwxwtrTqfw5N72vDknkQ+X1zHUbn8jx+fvFPg==
X-Google-Smtp-Source: ABdhPJx02561UlMrYDnluPeQ/VBlsIyHg8XbyYCuVmHZB02fdWHUWEZvTsD/+9V+uFnbFjbV3OwWtY4Bu9XovYppGME=
X-Received: by 2002:a17:906:d93a:: with SMTP id
 rn26mr20685772ejb.382.1628003669932; 
 Tue, 03 Aug 2021 08:14:29 -0700 (PDT)
MIME-Version: 1.0
References: <005fe0a5-10cd-aa47-d649-0a296283a4eb@gmx.de>
In-Reply-To: <005fe0a5-10cd-aa47-d649-0a296283a4eb@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Aug 2021 16:13:46 +0100
Message-ID: <CAFEAcA_EmJ9R73RE_oMqoE7hvz1ALJdKhrWpOy7U6=74xXnzwQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] doc: Remove trailing spaces
To: Axel Heider <axelheider@gmx.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Tue, 3 Aug 2021 at 15:14, Axel Heider <axelheider@gmx.de> wrote:
>
> Signed-off-by: Axel Heider <axelheider@gmx.de>
> ---
>   qemu-options.hx | 30 +++++++++++++++---------------
>   1 file changed, 15 insertions(+), 15 deletions(-)
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index e3f256fa72..ed91246114 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -244,15 +244,15 @@ DEF("numa", HAS_ARG, QEMU_OPTION_numa,
>       QEMU_ARCH_ALL)
>   SRST
>   ``-numa node[,mem=size][,cpus=firstcpu[-lastcpu]][,nodeid=node][,initiator=initiator]``
> -  \
> +  \

Something seems to have gone wrong in sending your patch here --
the commit message claims it's deleting trailing spaces but the
patch itself doesn't do that. Something in the email path deleted
trailing spaces in the patch (I suspect the issue is the 'format=flowed'
in your email).

Also, did you check that the docs still build without warnings
from a range of Sphinx versions and that the rendered HTML still
looks the same ? These trailing spaces were largely added deliberately
in commit 09ce5f2d6bd6739144, with the comment
  * rST does not like definition list entries with no actual
    definition, but it is possible to work around this by putting a
    single escaped literal space as the definition line.

so we should be careful not to delete them again unless we've
confirmed that we definitely don't re-introduce the issue that
we put them in to avoid...

thanks
-- PMM

