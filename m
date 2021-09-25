Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E32D941807F
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Sep 2021 10:47:16 +0200 (CEST)
Received: from localhost ([::1]:38992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mU3L1-0001bO-AL
	for lists+qemu-devel@lfdr.de; Sat, 25 Sep 2021 04:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mU3Ja-0000qO-HT
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 04:45:46 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mU3JY-0000AZ-6K
 for qemu-devel@nongnu.org; Sat, 25 Sep 2021 04:45:46 -0400
Received: by mail-wr1-x42d.google.com with SMTP id i24so18618074wrc.9
 for <qemu-devel@nongnu.org>; Sat, 25 Sep 2021 01:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uu8HaPePC3Bm+4YcAv0L3KecDXzD0HQ9k0+Tb6gizBE=;
 b=sI50nIfF1K5yCpYYY8tiN2BfWT62rZGPIUz9gijBwmQMqpJwJ4VE0SJbbYPG0bRoX1
 h8uyUl6Tq/Q5u+mX9GM6ds7XLjnzAHXk5JoEs8RoulEUyzXvHFolVnXYNfSbSVyLaqvY
 DU4Mct25ceWUDJcBgyKzYRNHxxT13pBnPPlE+SJAjXMH2K3hGByJ+qmP9BMi7ig+68jZ
 E0XUAqdJBGy2dVTew3yyCI67+OvzGRJvGuXfKUuAXq2Sh/KdxPavH9zNGxOaB2fjatWC
 euHacMlKnjFZNvOZBkfpPMIdNt0cU8hlt9tlxx9wKenDlitcRt1z1UZTDC3+tUcqZJQl
 pwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uu8HaPePC3Bm+4YcAv0L3KecDXzD0HQ9k0+Tb6gizBE=;
 b=amJnKZW8pKdABXTB5IAM03F21IxhuluvFZd1eIhrau+j7svdLUfoCVzzViUjqesa+c
 RKXkgmp2rK6U+kNePF2GFW7RFcrLTQarqtZhscqj+eG/EbJ3guV/saXX8+bkUhK0G68c
 79hkNpz8prFY9nIVIvkG3nzM+zLvzulR7hM81Aki7wXrxcuvqWqqWo5QXoYWBymFnNpP
 jf5t0uaGE7ilmcZiQasLcThqZh6XHip5dQ6JOFyWTMLUTlnGDtH5pVCIimHpsqtHqfxR
 WFA9ZrT80csASmYlI4Ykl+sXlC/otAhK9empxfU0VhgwzLXC7DQ40NkqSTK0d2Tmivv/
 /WAw==
X-Gm-Message-State: AOAM532p+RPaT5pSBYroLAFb2q6XQsdzC+wBozyXhzJfu4yjA8U6Y+av
 iI9N40805ZPJP3+Z4FpIGvbq+MaJENpeVK6kgbZ8Bg==
X-Google-Smtp-Source: ABdhPJweCLabk5F9JQMPUWfHdBKwasz3aEX1IW7zqJagGYwY36Qj1zvEcADXL1oZhwe0Dz5lF1dDRHLAsQoSIJztke8=
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr6119262wmo.21.1632559542261; 
 Sat, 25 Sep 2021 01:45:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210925062525.988405-1-armbru@redhat.com>
In-Reply-To: <20210925062525.988405-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 25 Sep 2021 09:44:49 +0100
Message-ID: <CAFEAcA9YRXCKxZJ=LiGqoKRmrk_JdB16ch140dh9ACYPuwTo4w@mail.gmail.com>
Subject: Re: [PULL 00/25] QAPI patches patches for 2021-09-25
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

On Sat, 25 Sept 2021 at 07:25, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit 11a11998460ed84d9a127c025f50f7234e5a483f:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20210921' into staging (2021-09-24 13:21:18 -0400)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-09-25
>
> for you to fetch changes up to 5757c0904e2e8a7f5d9ff359b30542cfcb70556b:
>
>   tests/qapi-schema: Make test-qapi.py -u work when files are absent (2021-09-25 07:00:50 +0200)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2021-09-25
>

Fails to build, all hosts except x86-64 Linux:

In file included from qapi/qapi-visit-char.h:17,
                 from qapi/qapi-commands-char.c:19:
qapi/qapi-types-char.h:500:5: error: unknown type name 'ChardevSpiceChannel'
  500 |     ChardevSpiceChannel *data;
      |     ^~~~~~~~~~~~~~~~~~~
qapi/qapi-types-char.h:507:5: error: unknown type name 'ChardevSpicePort'
  507 |     ChardevSpicePort *data;
      |     ^~~~~~~~~~~~~~~~
qapi/qapi-types-char.h:514:5: error: unknown type name 'ChardevQemuVDAgent'
  514 |     ChardevQemuVDAgent *data;
      |     ^~~~~~~~~~~~~~~~~~


thanks
-- PMM

