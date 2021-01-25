Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 710A930274B
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 16:57:37 +0100 (CET)
Received: from localhost ([::1]:50562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l44FC-0001b3-Sc
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 10:57:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l44Dw-00016m-GG
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 10:56:16 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:36126)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l44Du-0002Nv-Rh
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 10:56:16 -0500
Received: by mail-ej1-x634.google.com with SMTP id l9so18758296ejx.3
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 07:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fw9kgh1uQ8Wu2C3EJFZD0EOPiXo7lWwU8pM8EsoJSyo=;
 b=ClCW8Pw5J245mp3J+6cvuXNsr8BCf/8c0K+dKM7Nl9p51++FTgRr/DwZw8MIMp9k7G
 qTYViyJslMYvJPD2JVCt+G/7/5TTNcek6S0T4JqJhQ4tuYdRADqbiTZ983it2NnkofNh
 6vU1o0KnatoR1rDFAkOkW/x7269LCb2mAPGFcpGDyXKi3aAeg/bY6kcXGYpAW/3NgXP7
 OZ75Z2APubGVTxQW1G71JkphQj/6uFyAntSGxmx3VQoJ0rcBYt74wBKySxw2I/JMt32J
 E9VpT7I1VRQqoUep6HeGxbQ2zIKuE1DVbqMeYVe6tTEj5cEPLJe7fVkTwRZSW5wL7hS6
 koqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fw9kgh1uQ8Wu2C3EJFZD0EOPiXo7lWwU8pM8EsoJSyo=;
 b=Y7CiwDVsvOsG8HhFoQFrTfomDOM0s1/Pd+gKm00eEIyghCZvSvhTJ4D42nl9hbHq+h
 9+9KTIY9Ab5bXWabBlyW4EBLUkEXn0Z+guVGkWIRUeJDXJIm2fqYRVPjQoGFoMtHLq8j
 m35r7W+sY6wqrWDDzwc3jgWsmnoW7vAleYFt6DIVY2n5XjPQ3lqFFe5IQFAZp5PwdGMa
 6l5uOggVO4VUucFPL1GH8IMa4xBKaqQUSmMMM/BvmqP2PFEsvpIid71PP5pItMzzFUYW
 OibAJgXef2aEQt9pvcqgCQF+foOTRvqIY+phnxRdMkVK7rrQspbYnEob1s9OaD3NgV6C
 PDfg==
X-Gm-Message-State: AOAM532OZsOtpX2q+1QzMdCIzl7CEPdGg1kIk+KrYTs2PbEWONySGpPL
 jWv/eoiA0rY7ye8ca5nE9xkpo8lNEm/nCS2O5NzgeQ==
X-Google-Smtp-Source: ABdhPJy4hedK0y2COYkXHjwzz0MZG92zgKA7i0ZCNohXxNYY9W5AbfzxlB0mlzXpx/Q/WLPY9F6bdYufpVnEE05ehoA=
X-Received: by 2002:a17:906:3603:: with SMTP id
 q3mr772217ejb.382.1611590173128; 
 Mon, 25 Jan 2021 07:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20210125114443.933857-1-groug@kaod.org>
In-Reply-To: <20210125114443.933857-1-groug@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jan 2021 15:56:01 +0000
Message-ID: <CAFEAcA-5NhbEJVboEGfyDXA4Zx7fGwrBDEfE+7HgAr97nn5zQQ@mail.gmail.com>
Subject: Re: [PULL 0/5] 9p next patches
To: Greg Kurz <groug@kaod.org>
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 25 Jan 2021 at 11:44, Greg Kurz <groug@kaod.org> wrote:
>
> The following changes since commit fef80ea073c4862bc9eaddb6ddb0ed970b8ad7c4:
>
>   Merge remote-tracking branch 'remotes/ericb/tags/pull-nbd-2021-01-20' into staging (2021-01-21 10:44:28 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/gkurz/qemu.git tags/9p-next-pull-request
>
> for you to fetch changes up to 81f9766b7a16ccfcfd19e0b4525a5eeba862c851:
>
>   9pfs: Convert reclaim list to QSLIST (2021-01-22 18:26:40 +0100)
>
> ----------------------------------------------------------------
> This fixes a Coverity report and improves the fid reclaim logic.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

