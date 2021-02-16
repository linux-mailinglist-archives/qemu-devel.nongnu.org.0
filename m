Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1825E31C960
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 12:08:37 +0100 (CET)
Received: from localhost ([::1]:57600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lByDc-00024U-4Y
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 06:08:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBy9Z-0007Va-UO
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:04:25 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:42069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBy9X-0005KD-OQ
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 06:04:25 -0500
Received: by mail-ej1-x62f.google.com with SMTP id lu16so971751ejb.9
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 03:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yflNk9ZbpvNA/7sLz3Umn0Z9Fb6K/5rmk+h2bEvmfDU=;
 b=PA05E05ud3PLRdEkpTLNX4nO2N9aFjmOULKd1S6ZlgYQD8dYHbjq285B1QWimtzoAG
 oOEJjU31qzb1HApY/sJRbpuSB5E9TfW/1kJLWDHx/76l/wOCnZBXtLjLP1UxffxLZn58
 9suATErO825aSplXfoNeziBm5q7CF30dajndr8HrATs/0l871UO/UnDJSYCdeseQ2maT
 UKLQ3hmS9q/hfGNbW2WtOZCo5Y6VpDRGSeGiqsbvw10fazbhOh74GG85iu0pBGBfgu0+
 9RmnMdA/8HQdGnhqGvz9XyzI9an6NkiMltr43h96N1pcW0OQcCEpuzzc2XB+K6r1quYo
 h/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yflNk9ZbpvNA/7sLz3Umn0Z9Fb6K/5rmk+h2bEvmfDU=;
 b=IDzVM7PE/NQWNzU1+roMYZoNxTgUPLr2V9CqQkl5Jjy0keirZKCxu9RHP0Zu/HXQGH
 2hluE8a4xbfV8uVbYfMDEUDJpu6TDxqkjfAeapX9zUpalKoXbVR/odlebMGWNzcN2tvQ
 Hx5YchBKiWg2QRhcnrHNZhSIuVWZ1Qm6uViYlL8G9dj5SohpwKx13rz2J0DgDzcd9mPT
 DNznsuuJrzwZywQnQ2xiDcXTSHAfiIQVPkir6scmHBK8+QkvB8OWkN8aCy2+aVG6UYnx
 UoUWSBevZPgKgALHOFg/GsWWjuFqvN6rx+oiGBGqCfSISLjszA0LAILib6UulyF+uSlr
 nYTw==
X-Gm-Message-State: AOAM530DQobyrJMx9p+ALrtiHn3A44gv88jsuhaKvzZwmgEeulScrYh2
 F+r79lEQFJjuep+burIhywH4iYQ4zJcReBBNcJL98g==
X-Google-Smtp-Source: ABdhPJwGgmgqFciyRbXp37QQjMrY5E5YnH4+Yg4qkpBlkGGcF4BBYYHAd3i3SG40WIO5Mj8KqDDAIaNpL5t0D9WE4a8=
X-Received: by 2002:a17:907:98c3:: with SMTP id
 kd3mr20054069ejc.482.1613473461307; 
 Tue, 16 Feb 2021 03:04:21 -0800 (PST)
MIME-Version: 1.0
References: <20210123143128.1167797-1-pbonzini@redhat.com>
 <20210123143128.1167797-32-pbonzini@redhat.com>
 <CAFEAcA8R84_-BPG-suKDvkpE1BxG8o1edGv=zfU_CCw27pK4eg@mail.gmail.com>
 <CABgObfZNy_j3DYt3NKKvC1Ou8TW2zACZ2LffnrR7LU8PeS5hww@mail.gmail.com>
 <CAFEAcA_6RiR+ud5U0Y9K3jNmEoQ-Ex8fZN3-o0MkLxpK8PROgw@mail.gmail.com>
 <378df6af-8383-8a51-4286-54739dba99e4@redhat.com>
In-Reply-To: <378df6af-8383-8a51-4286-54739dba99e4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 11:04:10 +0000
Message-ID: <CAFEAcA9-bOggKPjJiZNc3WXD9Uu-TxzDc7NMvUDGgoM7ERg3hg@mail.gmail.com>
Subject: Re: [PULL 31/31] qemu-option: warn for short-form boolean options
To: Paolo Bonzini <pbonzini@redhat.com>
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

On Tue, 16 Feb 2021 at 10:43, Paolo Bonzini <pbonzini@redhat.com> wrote:
> For this to work, one would need to have a typed string->QAPI parser,
> i.e. one that takes the schema as input rather than doing a generic
> parsing to QDict and then using the schema via the visitor.  That would
> IMHO be overengineered for the purpose of saving five keystrokes on
> "server,nowait".

The point is not that it's saving five keystrokes. The point
is that "server,nowait" is how we've documented that users
should select that functionality since forever, and indeed
is how we're still documenting it today, and therefore changing
it is breaking the existing working setups of a very large
group of users.

Historical warts that nobody much was really using can be safely
excised; historical warts with many many users much less so.

thanks
-- PMM

