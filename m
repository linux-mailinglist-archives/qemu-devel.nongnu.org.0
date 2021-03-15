Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA68933C012
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 16:36:43 +0100 (CET)
Received: from localhost ([::1]:48462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLpGt-0002KX-0P
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 11:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLpEh-0001VV-66
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:34:27 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:34556)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLpEf-0004Uu-GQ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 11:34:26 -0400
Received: by mail-ed1-x52a.google.com with SMTP id y6so17808276eds.1
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 08:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/zd86v1IPnxZo7C6hFBLI/656tsB312B6m0Fo/EPjA8=;
 b=R80cfXUMwS/kdn1lhbOM7KJhnHKtGN2GGcVC1IeQQUI32uFfk2FyEkA6TSzPhchL3Q
 X6V6TsmEEkl3kbOmNxIkvq7YkTrWMgOTHKi4Nz9GfoKbgCd6TgzE+CwzuO2PMlLeeKjI
 poLCuhDdUzf6K1oMYduXwK8/H5t0yjybmfSnPCZvoTIZhYewp+IC50QcnXt6cABP5rCL
 QFE6rjCn35ghqjPocqe5gfkTE93km+KyPWWAKM8gAb2566G32nx7Qk4lFxLDiW7IM3X8
 xoYyUuhH6IGHqR9V8dXEyMilz1+vyrceS7ax5nEOlYi2WG1UoGKh6ZtwVC+SBorWLrVG
 bNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/zd86v1IPnxZo7C6hFBLI/656tsB312B6m0Fo/EPjA8=;
 b=QpvVLFvAz56Oyt4iAXh78ncWgdDKeWZNqLk7/GYKx+hEjPHnWWUX000CYIntWsxtUh
 QexiYMGefaJQolNGxNQSnKinhRD4vZqMXzxKY2GleUXOM4eb3j4LOr1WkXdJsDDmICgM
 cX8O4m5gEy64sbzROFCJ2tfRVY3SJbCmCgkhbmBJzkhQvIDprfY/E5gpP30TKCez8Ups
 fK2JVStp7JUhvi/fDl/nL0d2ITuXW4Ap+vWV2VlpQj5ChqE+zGSLJ65i2Qx8UMS4pbyK
 52DAo29AKDj5xWc8/GZPiSkqaHYqkDxhNrw9SZnWikiygGWdLQF+ztrBjatE3d9K9l8B
 uCgA==
X-Gm-Message-State: AOAM531CWLR90xBQnYnkZJXRnPD7izqBOugwU+7zMUsfVOm4gubqUwn2
 6gu2BUX6uxGGHJBtDIOv3afMNeECs9zVakTq1QnJkg==
X-Google-Smtp-Source: ABdhPJz9YGO7mAeL2aWK1YemSKXiIxk5MZFsBNnyULHc7xk33TTAWoj3KZTU4wSc3zsLQnooWXA2Y1QAdKwYhePOwCk=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr30323867edv.44.1615822463841; 
 Mon, 15 Mar 2021 08:34:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210313194829.2193621-1-f4bug@amsat.org>
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Mar 2021 15:34:02 +0000
Message-ID: <CAFEAcA9hUnbswDurhOJsA0DcBc5nR1oepOSxt3UjFUNpmsn76g@mail.gmail.com>
Subject: Re: [PULL 00/27] MIPS patches for 2021-03-13
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 13 Mar 2021 at 19:50, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> The following changes since commit 3f8d1885e48e4d72eab0688f604de62e0aea7a=
38:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/ui-20210311-pull-requ=
est' into staging (2021-03-12 13:53:44 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/philmd/qemu.git tags/mips-20210313
>
> for you to fetch changes up to 4a86bf271eed1a8ed56e2556d7b8eb4f0fddae7a:
>
>   target/mips/tx79: Salvage instructions description comment (2021-03-13 =
20:29:36 +0100)
>
> Nothing particularly exciting, but good diffstat.
>
> ----------------------------------------------------------------
> MIPS patches queue
>
> - Tidy up the GT64120 north bridge
> - Move XBurst Media eXtension Unit code to mxu_translate.c
> - Convert TX79 to decodetree


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

