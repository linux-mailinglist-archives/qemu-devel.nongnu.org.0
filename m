Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E814B48C8
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 10:58:47 +0100 (CET)
Received: from localhost ([::1]:38406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJY86-0002vF-4D
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 04:58:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJY4z-0001bM-UA
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 04:55:33 -0500
Received: from [2a00:1450:4864:20::430] (port=45842
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJY4w-0002CM-KG
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 04:55:32 -0500
Received: by mail-wr1-x430.google.com with SMTP id p9so5319186wra.12
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 01:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MPDlzBdsYCgOqZiSii9sOPCftsGgd5egnwDczylP+Q8=;
 b=ljJTWW/2qwfzpY5EVNwgDZx7YG4tzL1E5Wbp9iNHu6ffawkou39hZMFc4dgB/wTgIR
 mIsjyDQMBvoCRLdUMjOvgPN8ZDd4+2gBQQZHBkH8m8tjY8cm3uaXdjI5S4L73LN7tInT
 rB5iYQI6l6sR/8KpDiMlhy6EDPkIAYa+lmzVFaNKOtqDp+s6QQqTIWniNxbrW/yYkCXW
 vVLe+bCWpK6tNKdmqzqs2Tr6AHbvigAvgED1J0awc4/C7B0BtmvDHVbptt6PeLj1B4CD
 1s3E2iCVXJhdDZTadSToJzpS7A83I0ICw6nMNkX5Om84UzAcy4O90+z1i2hvav8RfYAg
 PHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MPDlzBdsYCgOqZiSii9sOPCftsGgd5egnwDczylP+Q8=;
 b=1m+XrkFa0iZxpSAxCAYsrKwx1MI8/kq2gDMpw9eVFygFViLx6dHIycsmg7Y1S4pxEw
 nndz9jKmqgIBjIeko+Xr+SN0tKmfsLTCGwm2l8AqatomYB1cRI4OCOxl6G16rYkzqpnW
 YH7bHO0eeeYnJCHweSZfQ1cPWTyc67DyM8fSIdhFa6GHeHB86eLh6uDS4O6E1eSYcrHp
 RxEdZ1iLmfGHnK4IVqoHE9vSU5sr43EYQO7YbYZlhWjNepkO6cHlRUUlXn7kvh/P5FBF
 BYhup/h4xiDK70sYmcnInqAjBkTJoyGveMGc2yYli45W3Tq5oIWbwbVxaeVNiFXWsFCF
 C7EA==
X-Gm-Message-State: AOAM531CTmJ7JK1PnTgAeLfrDooQ5o3H3QXhyNmc/LKX9FptVZTQd6jk
 upOwB+waTONPprUyLQuT4+aCQwtcJr8kHzZ7RaC1kQ==
X-Google-Smtp-Source: ABdhPJxR3MBZbfjVWYRR9ouHjPK3WhVqW+oN4mopMNFyTm8528WuF2NdTwJkHEObfrRQHqOVKPBiP1Nna6T5scFu60Q=
X-Received: by 2002:a5d:62c4:: with SMTP id o4mr10492023wrv.319.1644832528993; 
 Mon, 14 Feb 2022 01:55:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1644492115.git.qemu_oss@crudebyte.com>
 <CAFEAcA-VRNzxOwMX4nPPm0vQba1ufL5yVwW5P1j9S2u7_fbW-w@mail.gmail.com>
 <2037112.271zI61438@silver>
In-Reply-To: <2037112.271zI61438@silver>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Feb 2022 09:55:17 +0000
Message-ID: <CAFEAcA9vHYw=hKaRqw4LBk7dHReR43duoCCEpH-VC2sEXoQKHA@mail.gmail.com>
Subject: Re: [PULL 0/5] 9p queue 2022-02-10
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.785, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Vitaly Chikunov <vt@altlinux.org>, "Dmitry V . Levin" <ldv@altlinux.org>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Feb 2022 at 09:47, Christian Schoenebeck
<qemu_oss@crudebyte.com> wrote:
> So this is about the 'dirent' patch:
> https://github.com/cschoenebeck/qemu/commit/de19c79dad6a2cad54ae04ce754d47c07bf9bc93
>
> In conjunction with the 9p fuzzing tests:
> https://wiki.qemu.org/Documentation/9p#Fuzzing
>
> I first thought it might be a false positive due to the unorthodox handling of
> dirent duplication by that patch, but from the ASan output below I am not
> really sure about that.
>
> Is there a way to get the content of local variables?

Yes. You can build locally with the clang sanitizers enabled and then
run under gdb and with the appropriate environment variables to tell the
sanitizer to abort() on failures.

> Would it be possible that the following issue (g_memdup vs. g_memdup2) might
> apply here?
> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538

It seems unlikely that the problem is that you're allocating more than
4 gigabytes and thus hitting a 64-to-32 truncation.

thanks
-- PMM

