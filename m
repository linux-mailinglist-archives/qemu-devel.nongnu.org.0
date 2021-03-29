Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B9A34CEC1
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 13:22:10 +0200 (CEST)
Received: from localhost ([::1]:42966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQpyD-00011V-Gh
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 07:22:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQpwJ-0000Kl-5W
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:20:11 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:43900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lQpwG-0006So-K6
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 07:20:10 -0400
Received: by mail-ej1-x633.google.com with SMTP id l4so18797066ejc.10
 for <qemu-devel@nongnu.org>; Mon, 29 Mar 2021 04:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zDOO0MyFI//uY6WNRV+L+f1fnu4FCLKyY/DK4quuFKs=;
 b=At5cohWODvzRPwBaVs4sX4OjgKAmTIhGJUynq6NY0XEHRVxZmio/zb+cwwo86jD1i5
 2MKap1ysPus0bW/Zb2MymFTK12LEaopFmXWlrAUM0HDdR64CEGeiSvKqvgmI1OJdtuRf
 rpsLMVriW4ilVph4vYd965xABuEwuBEYFAJE316l8X+kDqnUZLn0SDEsi3Q2FdeGQZQh
 NVmpYdvSSj8clZkJTtJLBluhmdIWFZm67cQ6EvpkVFEcvVUqHvCtwiIDIKYg5sTm9l2b
 XIaie4+hBRK+DGB/9Nbst3rtHaQVQ902EvkgeOQDRzk08hbjQZF1WBCZTBQWOSWFEszp
 X6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zDOO0MyFI//uY6WNRV+L+f1fnu4FCLKyY/DK4quuFKs=;
 b=eTVCad8vPp9PI8Vxo+VMERs+Ypvj/KHud6o30NESvvLGLFNcVcbpripVE3h+vuMvez
 7iw3Pp6KwiCU1wCTwVyxcRyFekCMNR6iQvXib4uVxh+OLwkV9bE8Ll+SKGHS0Jk2zD69
 iR7KbmEIZcjDfzEjTK2UuMJtcIF8rskYnonVwB1vUZexLEtlp6KcO94U8aIuaReuBuTy
 0sZ4fiArrkEOFja4gjNSDpsVMU3ycWxVxSeHk+6bYC1q84yycbiRRn3rzpXfWQ3MpTrs
 wPbNoUNGdXjVDJBKb1kCa1mj+CtX+H5lJ/x2bLvVO2O6XmDbZYX2Qd04eV5Onp1mwyck
 v2ZQ==
X-Gm-Message-State: AOAM5320dwS7QpsFI9TnMqyrVwc7wvxmEKWp2BFmQ1bI1uQpeNu69VGD
 Q2bkOOyQQwA35V6H1CJElbqS6l4x/xO1LMpa2e/JiQ==
X-Google-Smtp-Source: ABdhPJyBd9PQ4TEmm3XWCcVpRQMpSnvw4aS96gvVuN7psOrlsPrRy8tYxgu4qj/9KdQgoPTAMiXSD4dsIJf/XTe6nJ0=
X-Received: by 2002:a17:907:10ce:: with SMTP id
 rv14mr28482145ejb.56.1617016806042; 
 Mon, 29 Mar 2021 04:20:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210328160619.4015954-1-laurent@vivier.eu>
In-Reply-To: <20210328160619.4015954-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Mar 2021 11:19:35 +0000
Message-ID: <CAFEAcA9M1RDT-Qe5jCqW-GKs=SwHPZU+t6vZwO2VXZZyiMTWbg@mail.gmail.com>
Subject: Re: [PULL 0/2] Linux user for 6.0 patches
To: Laurent Vivier <laurent@vivier.eu>
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

On Sun, 28 Mar 2021 at 17:09, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 9e2e9fe3df9f539f8b6941ceb96d25355fdae47e:
>
>   Update version for v6.0.0-rc0 release (2021-03-24 19:50:49 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-6.0-pull-request
>
> for you to fetch changes up to 4a1e6bce2308b720d79d5ea0a3d24501c89bd80c:
>
>   linux-user: allow NULL msg in recvfrom (2021-03-27 16:48:45 +0100)
>
> ----------------------------------------------------------------
> linux-user pull request 20210328
>
> - Fix recvfrom with NULL msg
> - Fix sigreturn address on s390x
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

