Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 403CF346AE7
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 22:17:57 +0100 (CET)
Received: from localhost ([::1]:36612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOoPU-0001Ol-9A
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 17:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOoMv-0007vb-TJ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:15:18 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:44549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lOoMt-00014X-OJ
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 17:15:17 -0400
Received: by mail-ej1-x62f.google.com with SMTP id e14so11210501ejz.11
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 14:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hpxucCzKpKsBXKVfFphsDsepOWs4TocX/SEwbGtP8tE=;
 b=bpCMYzhSqyZHC/pftddlkWWHAR7Dh+MU5xfmYJsWgZLwPKTfB10x9t54LxsDncg9HY
 u4fog7wD9Deky0DJ78w2KeoEXuJMcERuiw55FeicyL03t5gPWGH02AgHoraWw3REtEE3
 2cKb5nIa/IE8O3JqtFpY1urYlnpmQsIWW1Qq79g73sRCnV/vtVdVSx8cBL80geq2inAe
 n6/Vts3Uosr4S9z3LWXee141/1I2Y4uB375XmlKMiDmuCp89x7JoO/Pl2SWsYkCD3yQ8
 E+cEUfviFqoH/a/vqYFNp9aehy2PkPk97bnsaCgzi6fOD8kzSA7yg56yyHCrhow4/BIs
 MBDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hpxucCzKpKsBXKVfFphsDsepOWs4TocX/SEwbGtP8tE=;
 b=GZ+mLJUDQ1onllLtQH3FQjiUikJ5vSRZUzRD3TBKhr+wAxrsh2E59l9NQBSrlwltBd
 R17CIH8+DbBZw3GNUBobAlDh4HzzSFe7ZCVLJ07BURbC90k7XIQjvoEs9S1ZXuzVmVe+
 kR9XcWK00EZ9gWeJwWuJILCKzvWI/F2kthcO130J01Dmy+f9cuepx0Yux65m8rWIea9w
 rgo/5RZQpvxgm+8wA1v7fJW1rhaVCjIbb7NWs2xqBPG7njNuoG19RQggv9DazVjbtPt9
 uMXoEC9r2MUlvsemwb1hedPz6OLA+xUA+SgzzKuwoQ/Z/DttGkb7AEGQXfaoigeQEO0z
 E27A==
X-Gm-Message-State: AOAM531rHOzfgDtZe7+7SghEYegviJsBotwVibaYgqOLE6QI7/jFkXco
 5dmGAGqroWikfH8SKmI2+Nx6Yz/TeXOOrA9wlyCfiA==
X-Google-Smtp-Source: ABdhPJyWL4/Ldk6Vzh6DD82fwh3V5+DnrR7mj0Wu73N/PijMVWnXlUaakviQF7TJM91S4sxUWcthGdrJpgiZ46q+gpg=
X-Received: by 2002:a17:906:1dd3:: with SMTP id v19mr189705ejh.4.1616534113898; 
 Tue, 23 Mar 2021 14:15:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210323120439.563855-1-anthony.perard@citrix.com>
In-Reply-To: <20210323120439.563855-1-anthony.perard@citrix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Mar 2021 21:14:44 +0000
Message-ID: <CAFEAcA9HBx++GnF+VAEV_9Cj-evA12+SDJEUz5vBL_oJ05oeMg@mail.gmail.com>
Subject: Re: [PULL 0/1] xen queue 2021-03-23
To: Anthony PERARD <anthony.perard@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Tue, 23 Mar 2021 at 12:04, Anthony PERARD <anthony.perard@citrix.com> wrote:
>
> The following changes since commit 5ca634afcf83215a9a54ca6e66032325b5ffb5f6:
>
>   Merge remote-tracking branch 'remotes/philmd/tags/sdmmc-20210322' into staging (2021-03-22 18:50:25 +0000)
>
> are available in the Git repository at:
>
>   https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20210323
>
> for you to fetch changes up to b807ca3fa0ca29ec015adcf4045e716337cd3635:
>
>   xen-block: Fix removal of backend instance via xenstore (2021-03-23 11:18:20 +0000)
>
> ----------------------------------------------------------------
> Xen patch
>
> - Fix Xen backend block detach via xenstore.
>
> ----------------------------------------------------------------
> Anthony PERARD (1):
>       xen-block: Fix removal of backend instance via xenstore


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

