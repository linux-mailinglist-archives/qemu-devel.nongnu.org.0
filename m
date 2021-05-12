Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 364F437C795
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:37:10 +0200 (CEST)
Received: from localhost ([::1]:43206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgrrB-0001ze-80
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgrpN-0008N8-1G
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:35:17 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgrpK-0006qv-LY
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:35:16 -0400
Received: by mail-ed1-x52d.google.com with SMTP id c22so27812510edn.7
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 09:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BjfxxGBg9tZPwUvga/9CHyh1tYV+6fcU8m3ghIo5pOY=;
 b=nRzeRcxtbjCyuiHEiAx94ZVy0desuWi+yuTI9sWHR1FPVlOlpXQ5vi0iy5uGh2jwO9
 31gGIsSM7mmG++gFyE/lx672Tzu5MtJWIAyLpvwyawKeOdKu5dZGCtOXMrf6qQrncVF7
 eRffbfEmC7x7xA66otTn/hdT28LIcmRUscCjr7JoFByanHrtJP/7rHVWK9aKhxJexFJD
 8kvMFXMFlGE6gjR+V1rLfHRn8tF2QCm0V2XA+e2xGwn8KOrj0UdjGiODWa7WjkUXuv8+
 WqcdtQCMsVLOX7PwN7U8fOs6/NOXKJI0z/InLoGepPdqlTrkrkfaYDnDnHPOYzT2rY6F
 +epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BjfxxGBg9tZPwUvga/9CHyh1tYV+6fcU8m3ghIo5pOY=;
 b=OlUAYHVMI7yJBuSYX0NoL+PnAp3NP7afsEPWmU5EQzkOD+Oh69UCuT5N5K+dHzbWT7
 tn9cXpgCx/mpx8Y93xt9UoaUYmfvi4Yu+U1jcIhAZuKq6NLgM9aBc+BRviRKKiwXvNdw
 47nX89numhR+Rj3bDwbGgxl0lbUCkT1ohEV6AzkdesycCNOV54Th/cg3LxmvESO8K5Z7
 RfXbpVqmu1BYjOkrn+U73MG+oW4ptaehL4F6yFkN37/YnIuMWVKP6RQxi7jqEu3ClBSC
 GiTayH4BQZf/nWMXnS3teAuVGRT6rNCKYlFdhTmHLispTDkB7AziX2sKae8CazxSpK5A
 NtQw==
X-Gm-Message-State: AOAM532/BOAeDksVlj6+xqwOwcbY4yptKdtkPzXIRy1n4W2/twKI6Rkr
 ej8Gw6pyxYTIAJwSwYMow6ModeOMaT+q5LemZ0NqVw==
X-Google-Smtp-Source: ABdhPJy4eNBZCnyq1JrQ7MhniC9O734dENP92tgPgOr6GOI1vt1vP4rtKQxRiSrQdxHuTshoV6B9b6HOxW/x9KtTaZc=
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr44574363edv.204.1620837313199; 
 Wed, 12 May 2021 09:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210512162412.338120-1-armbru@redhat.com>
In-Reply-To: <20210512162412.338120-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 17:33:58 +0100
Message-ID: <CAFEAcA8MzER8PCJiiRJv0R3ydbGgCHdAthS-TXE=W6meYGQVJQ@mail.gmail.com>
Subject: Re: [PULL 0/5] Miscellaneous patches for 2021-05-12
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

On Wed, 12 May 2021 at 17:24, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit a5ccdccc97d6e0d75282ede5b866cf694e9602b0:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/vga-20210510-pull-request' into staging (2021-05-12 14:45:21 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-misc-2021-05-12
>
> for you to fetch changes up to 4369223902a79b7fc56ca076d99b88ff14964ddd:
>
>   Drop the deprecated unicore32 target (2021-05-12 18:20:52 +0200)
>
> ----------------------------------------------------------------
> Miscellaneous patches for 2021-05-12
>
> ----------------------------------------------------------------
> Markus Armbruster (3):
>       block: Drop the sheepdog block driver
>       Drop the deprecated lm32 target
>       Drop the deprecated unicore32 target
>
> Stefan Reiter (1):
>       monitor/qmp: fix race on CHR_EVENT_CLOSED without OOB
>
> Thomas Huth (1):
>       Remove the deprecated moxie target

The moxie removal failed to build on an incremental build
when Thomas submitted it in his pullreq:
https://lore.kernel.org/qemu-devel/CAFEAcA8k1DnOFT+5pjQ4ytene3asVDKB7TUOZgGhucTp_ypz2g@mail.gmail.com/

Does this pull include a fix for that ?

thanks
-- PMM

