Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BBA1A6633
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Apr 2020 14:13:09 +0200 (CEST)
Received: from localhost ([::1]:43686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jNxxc-0005gm-7j
	for lists+qemu-devel@lfdr.de; Mon, 13 Apr 2020 08:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35732)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jNxwB-0004nV-1F
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 08:11:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jNxw9-0000sy-OM
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 08:11:38 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39590)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jNxw9-0000rJ-G2
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 08:11:37 -0400
Received: by mail-ot1-x343.google.com with SMTP id x11so8825750otp.6
 for <qemu-devel@nongnu.org>; Mon, 13 Apr 2020 05:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=x4PL3qxfCKcaGwpQp253ilxiL9UIhYrq/i1qoeCyctw=;
 b=KKAYPHXtc9TG1QWuxQbG9NgpJA/o60jL8nxroCsvnF+VufKchO+qCMUX6Kg7TfRu7s
 vnXAa7KJMRJNTaSl/Y4Ausi33mLwDMcxZuyByRc6jXSh/RHR46z+guqVfOncylxLcyOf
 QGP/8s0aPOP+f5ntzTjU71tSH7Q/xABJ/GJ1nr2ZfzxBQFt/mgQKn/mS3SkvLq6oJQ2P
 Z0Rc7+qj6SU0VdKQgb/Qdo2mbo2YQy0XLPrpuoeqSJZSBLJr5RGXFc2nR8wdwy/HWB3o
 h8kQXKnR12Du2dsHQKjCuvC6GwJYE9ZTKa4kC0iQ+aW+2XKoDsJG3iOBD5dDPhPm4kXN
 9A+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x4PL3qxfCKcaGwpQp253ilxiL9UIhYrq/i1qoeCyctw=;
 b=AU4bv5e4hpFNcSx8OzutYtbMHlaUIbW53FgAeN0SlFXp48yjeuAQ//si6tCEQk5Ecg
 yBhnqpdAAhogU/3ydG8x2c3WXcgwGQXwrxRd+zmsNsFehER3fHgTsK6eix9TrTxmINlx
 QSUTYM9+VYwYcaP1QaZ1asI5cTY96q1OwBevfTSQu2os/zqD7Q0Fb9QCaZ+JUpKu75t+
 nNG5L7ZxkvtZuLR92YCORZ9NYRNx7HQcaMhs0yczsyxM2YPxR6G24QapU6DxqIkr/6ln
 jUOSB4J4JPCqJ4KpVTW2VovgRMsueBT84zqjhcP65iEtF4awqPVF0TXVsDZKr53RyXI7
 ttDg==
X-Gm-Message-State: AGi0PuZSimRoqmq7XNxDsw3Pu5gurKZSFkMPRb2/PBVTAEKUb+2vQjIn
 9gkB+bBD3B+26SowuLCyqkVE8ko8o2FsHw8ZamR/8Q==
X-Google-Smtp-Source: APiQypKx12ujieeEzSJifbi3Wp2VWGJOaIhVA7cLlTRBATF3eIoN3/vFsuOHjbGUXLjcyOvhS44SIjJRBqQ1hBemHs4=
X-Received: by 2002:a05:6830:11d5:: with SMTP id
 v21mr4338914otq.91.1586779894372; 
 Mon, 13 Apr 2020 05:11:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200412211121.13579-1-richard.henderson@linaro.org>
In-Reply-To: <20200412211121.13579-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Apr 2020 13:11:23 +0100
Message-ID: <CAFEAcA-x7PUGQQfn7R0-181B6Q9ZGLDb55TU8Y-5Q0NK_p6+Sg@mail.gmail.com>
Subject: Re: [PULL for-5.0 0/1] tcg patch queue
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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

On Sun, 12 Apr 2020 at 22:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The following changes since commit 17e1e49814096a3daaa8e5a73acd56a0f30bdc18:
>
>   Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging (2020-04-09 19:00:41 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/rth7680/qemu.git tags/pull-tcg-20200412
>
> for you to fetch changes up to a4e57084c16d5b0eff3651693fba04f26b30b551:
>
>   tcg/mips: mips sync* encode error (2020-04-12 14:07:07 -0700)
>
> ----------------------------------------------------------------
> Fix tcg/mips barrier encoding
>
> ----------------------------------------------------------------
> lixinyu (1):
>       tcg/mips: mips sync* encode error
>
>  tcg/mips/tcg-target.inc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

