Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C90D388180
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 22:39:44 +0200 (CEST)
Received: from localhost ([::1]:49784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj6VD-0005AJ-53
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 16:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj6Af-0007DL-LN
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:18:29 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:45812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lj6Ad-0001l8-Tg
 for qemu-devel@nongnu.org; Tue, 18 May 2021 16:18:29 -0400
Received: by mail-ej1-x62d.google.com with SMTP id s22so16344882ejv.12
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 13:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U2Ft6EhCOei2a7ktDXKIpH3Ihh9lTXyz2jBQAlS+/Pc=;
 b=ABh5tuDDtM/QQtpu9TGItSLMfTw6YJgK3V4OAY9mb6QhAIdqjLNz9hmLC0RUqXepAi
 qQRag/CIweQKtQ90EBxakCZJ+OvQtNMSgp3AMP0ldvz5hVTUFjii7yjS5wXDmzqzGE7y
 c6YB62BoZYslBLBbjnDud7/DhkAG/KJL3B2i3OeA87jtO45imRqBJbqSWfoPYAR8Wmpg
 TOgeidcee7Y0UCQqvLiMOCf3pQQ8zPeqcNfypumEsVqwv7OkerhdnWEewTBwlxUwYn57
 mv8y+BflMvcsknVSDlFqtj9vxHp/88hsbwdmVt8051fj3FFYx71s8tJNq8fpUy+JDtaF
 pBAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U2Ft6EhCOei2a7ktDXKIpH3Ihh9lTXyz2jBQAlS+/Pc=;
 b=s/8fdzWUizSsv3uTDgQLzpLZNieQ7AWBn/hrAfuFQ6tpkRtXjXspWZBTMTCisi/xHD
 DIsQSmlesqOD6cQRr1+NmrZuqWU+N92Ze1WH5rTt/+ofQjZhaaOmvWFJXBV8oI9VZsPC
 xLa42fZ9NrT8/e68i7J9QkNUK1m8mJjYQ3GsPDPWqISHgT+pfI7jv9mGHXysfGsMCBqW
 VGMWZzXrQ2PdYxdX5gT6k/znbF4H714cI5sYqDwv7Ty0p4DQOijr3Zft6NHJR6gdDeqb
 jcGXLJuHUF/FhS5zayBMwPug/d+qKKV20o7XCIkIVrvVqac94EE8jje1FI8gqPyp9Qlh
 h0wQ==
X-Gm-Message-State: AOAM533h6bsw1kzJHL2UpvFFY9zXKN9J51AqyWAf5sONeMM0om2VJawN
 RWXO/wmICaRJC5AHyTzFMfjJcDEjSnOgB1mNEwj/fNGxcJo=
X-Google-Smtp-Source: ABdhPJwoF+b57V2+LVVhzFu0M/d1WGH2XZdefcdBb7MYPPCKl5MupeuZaxLZR3kXYD5j2FH/KzkgaDF1Iv0Vgmm0cYk=
X-Received: by 2002:a17:906:9bd6:: with SMTP id
 de22mr7780548ejc.382.1621369106291; 
 Tue, 18 May 2021 13:18:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210518053131.87212-1-laurent@vivier.eu>
In-Reply-To: <20210518053131.87212-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 May 2021 21:18:09 +0100
Message-ID: <CAFEAcA-1mDa6UEWiJnWywM0kJrEUrLkLDWytzoxCb2u1aXLr5A@mail.gmail.com>
Subject: Re: [PULL 00/59] Linux user for 6.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Tue, 18 May 2021 at 06:33, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 6d34aa9969ff85ca6eaeb4dc1988a4d4e13e7d79:
>
>   Merge remote-tracking branch 'remotes/marcandre/tags/rtd-pull-request' into staging (2021-05-14 17:20:08 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-6.1-pull-request
>
> for you to fetch changes up to 4a1e8931eca05077afd0b7ed092ab0f10c5b457e:
>
>   linux-user/elfload: add s390x core dumping support (2021-05-18 07:10:46 +0200)
>
> ----------------------------------------------------------------
> linux-user pull request 20210517
>
> - alpha sigaction fixes/cleanups
> - s390x sigaction fixes/cleanup
> - sparc sigaction fixes/cleanup
> - s390x core dumping support
> - core dump fix (app name)
> - arm  fpa11 fix and cleanup
> - strace fixes (unshare(), llseek())
> - fix copy_file_range()
> - use GDateTime
> - Remove dead code
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

