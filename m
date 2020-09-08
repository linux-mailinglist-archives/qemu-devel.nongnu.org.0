Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FB6261708
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 19:24:29 +0200 (CEST)
Received: from localhost ([::1]:45038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFhM4-0007LW-Uw
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 13:24:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFhLN-0006qz-3a
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 13:23:45 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:40925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kFhLL-0007n5-Ao
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 13:23:44 -0400
Received: by mail-ed1-x534.google.com with SMTP id t16so12032204edw.7
 for <qemu-devel@nongnu.org>; Tue, 08 Sep 2020 10:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XVPF6/ymD/Z4OruoPhQNVBtwWeqCFPrGkmdjKrpjvRs=;
 b=a92NLwMxSxXRGt+AbGR8jIAjh/rCerPQ+sEPd0szSVUYsTpG2+jMNo2RggByI11Pwj
 5m/TZLGwY+CCAloEh6Yp6CjvxAIH85DzBQ9WhiC59+goLL9GI5RPN1Ug4aGC4q+QhrRp
 UP2wush2PS+lgraTTmwZTAsTxCewV1/kzNSx/fdAbPtePybWk3zRI7eSCwqHKMeizrza
 POxiCzl5tqtw23aBvDNy3uFdyErPaICAdUGKcw7jWC5ZWIFxQNU4qLtU7EX8P1iGDkfJ
 xnceL4pxej1cirQSPhZkEBclDfoV1Zlro93UkKEsTb9YDRgFodusUOcSQTLDzDpVi+vb
 LGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XVPF6/ymD/Z4OruoPhQNVBtwWeqCFPrGkmdjKrpjvRs=;
 b=I6KgJdExlPS/3/kSmofEzaskhjefqrEkWyA2L/mBp6lra2D/d80vbZ5Bazvf6jZj+s
 4rukp25pgzIXx1vtAtpCSW4PL3kkcFdtHA7kVZugfegsEa8ZRxx15gooqiFgFU99m0Mz
 B162F/9gO2Aq7DR8TRzOYJHz/IzBDjwsHpGBgh49vNiEt4lmPAjA+sZA22cWNZBfkK6B
 JYUibx3vSIUT31rF5bIAnJLrcmwht75ef9ZY4N3HOqDJo6lWaagaDpUBPmg/XHezlCab
 lyKBGAfe/uUuDUuCUNpDTCiWyDGM8g2jqMpqsYlipCKbP+lfDNXBZirTKyb0XynJ7VKU
 cE1A==
X-Gm-Message-State: AOAM532/NKrvmsk6jw0iP2wdyZT98udxaCTVovHLHTM2T1zBxF6lwPAZ
 C64WWqWkYap+/2Bdjn1dCYUHLjMijJXjIaEx75pglw==
X-Google-Smtp-Source: ABdhPJyOOmRfToNdIFwkZ2Hri3n/fld7jUiOQ4bKwjVP5zB/ui7m7DYmVkCgE2jBl13q7hwcysoxXqfkqeOMms7e3no=
X-Received: by 2002:a50:f28b:: with SMTP id f11mr32012edm.44.1599585821083;
 Tue, 08 Sep 2020 10:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200908065417.3158250-1-armbru@redhat.com>
In-Reply-To: <20200908065417.3158250-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Sep 2020 18:23:30 +0100
Message-ID: <CAFEAcA8P8RXdGLkZwU1VEyFyn=38k1PQ48d-f67sz-PmvYzxOw@mail.gmail.com>
Subject: Re: [PULL 0/5] QAPI patches patches for 2020-09-08
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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

On Tue, 8 Sep 2020 at 07:54, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 62f9256052df85194faa33137bbe0afb1c95b6e6:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/vga-20200904-pull-request' into staging (2020-09-07 13:27:20 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2020-09-08
>
> for you to fetch changes up to 6b306786cafd6ff939f1c831f0065c136105dca7:
>
>   qapi/block-core.json: Fix nbd-server-start docs (2020-09-07 17:13:30 +0200)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2020-09-08
>
> ----------------------------------------------------------------
> Markus Armbruster (2):
>       qapi: Reject section markup in definition documentation
>       qapi: Make section headings start a new doc comment block
>
> Peter Maydell (3):
>       qapi/migration.json: Fix indentation
>       qapi: Fix indentation, again
>       qapi/block-core.json: Fix nbd-server-start docs


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

