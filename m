Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 638893D90DD
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Jul 2021 16:44:21 +0200 (CEST)
Received: from localhost ([::1]:41628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8knD-0005Qa-Qb
	for lists+qemu-devel@lfdr.de; Wed, 28 Jul 2021 10:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8kmT-0004dA-Bp
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:43:33 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:46030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8kmR-00026x-FR
 for qemu-devel@nongnu.org; Wed, 28 Jul 2021 10:43:32 -0400
Received: by mail-ej1-x634.google.com with SMTP id qk33so4955533ejc.12
 for <qemu-devel@nongnu.org>; Wed, 28 Jul 2021 07:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KS50dv5fB/FRCmSA4JDDGlDAROOO+mRVrgqVIljKjA4=;
 b=BP89fqdrPAekhi0hsjLrb0VpfgR/UpsLTGMY7s+AdaNVq322TdFNBFZL+XbP6LZWaZ
 0RfZF/JUk7yReHCcBxW5NjXAU7hx5RiyljC3w7bGiYqKkP36AoDZ27kUuSFGZxgHitKU
 Cn4Up5aISkmrL4noAxzBGmfARYR6M9TjfjacYo0FxjnYkvOHE0lxCHAUFNo5iEuP+XGP
 Z9mqYfOTkQCfhaHjMg3CZcDxZiF9+Itrx0CXfziE8Ngqx2K/OSduBq5jIRRTPRMYYn+5
 aTz9wxz7QZLmE/1J9/JDA1vFSQ1hnX37qtdrcfjjh0ZLOlJyXOwxSLUCRQGnEYxin60q
 84UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KS50dv5fB/FRCmSA4JDDGlDAROOO+mRVrgqVIljKjA4=;
 b=bNlVqedyvr8gPEMxe+ylHoZ08TtocoI6yUsCUBLAicdx5eESLgILF+1fVYvMjeDfhT
 mby5C2z1ysmlVopW/iM8W5k928yo+KnMUO48soraK7AfE5ZRv1Y0jtrOmq+C+EWxspHV
 gCwmrHqv8nCtLk/bnphtcEdp3+ckzjWhQ0vOQQrI36xJ0AeW+G3oHEGotEc4LZZ5LrxX
 g48K9Ntf0nlKViVHDjSSk4L88WOcl9g+vuIb6PA5BBmqxauRyjVT6HYZJM5PnBiUH+j7
 NS2jHEhZACiINHv77RuM7sP9Yw9uPE333NsApMA5RgspYMsUqK1MVNaM4brVki4DcPMT
 wQ3A==
X-Gm-Message-State: AOAM530ZAs0ZGuSHKa6N0ilgoFE33FJJeDWUbxCNXa15ENcplmelIzOu
 H78INNAJxUuNjN46/cfioOYKTjkTWsMvICBC6OVBu1znjHc=
X-Google-Smtp-Source: ABdhPJyC8ktHRDXjSanyTmkkfREYcbBZkrAz6RAr1WGDE4uTwG40o/pbfkSxhIqycj1E1Rnb9Gd36spx5jfNRQiGxUc=
X-Received: by 2002:a17:906:d93a:: with SMTP id
 rn26mr14019047ejb.382.1627483409348; 
 Wed, 28 Jul 2021 07:43:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210727152239.829519-1-armbru@redhat.com>
In-Reply-To: <20210727152239.829519-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Jul 2021 15:42:46 +0100
Message-ID: <CAFEAcA8hV2qk24VZ01pNBHh3-FXdK1cXRRfeOEL3KfgLZzYKcA@mail.gmail.com>
Subject: Re: [PULL 0/1] Miscellaneous patches for 2021-07-27
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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

On Tue, 27 Jul 2021 at 16:22, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit ca4b5ef371d6602b73bc5eec08e3199b05caf146:
>
>   Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-migration-20210726a' into staging (2021-07-27 10:55:50 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-misc-2021-07-27
>
> for you to fetch changes up to 3e61a13af3d3a1942a1ec2f6dfd7b407a43e4273:
>
>   vl: Don't continue after -smp help. (2021-07-27 16:52:37 +0200)
>
> ----------------------------------------------------------------
> Miscellaneous patches for 2021-07-27
>
> ----------------------------------------------------------------
> Markus Armbruster (1):
>       vl: Don't continue after -smp help.
>
>  softmmu/vl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

