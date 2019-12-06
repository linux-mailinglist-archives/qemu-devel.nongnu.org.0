Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1493115505
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 17:19:47 +0100 (CET)
Received: from localhost ([::1]:40620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idGKY-0004Kd-FC
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 11:19:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37524)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idFBQ-0006Lf-Er
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:06:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idFBP-00053K-1T
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:06:15 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42871)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idFBO-00050n-E0
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:06:14 -0500
Received: by mail-ot1-x343.google.com with SMTP id 66so6031701otd.9
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 07:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g4GC338kwUwOWFtRrAdw7Nq9znzrvcY4KhIV3i/Ypmw=;
 b=amfmWUn8bSx/CALD4rdp5FFbb27y9ASefWZLng3X0oiKmAssJhgHCjhV19maA03zWn
 qJPg+FySbKmQxUwrykKxZmEerCZAJ1RZY8EthUz/Yry4Z0JZT7w72wUDvMprSjf8VDpI
 s5QNV6N5yWU9LkDyWDaKcFa0epwDmZDl2uyIKbe9h+jFOwKeHUSPpq2V+cYZjCsrYCc2
 NzvQo5Th/96/MyA/cYpk7ZjiyQ3YTu98feKtNav4vFGYJ04xMhHIfKS+LuZeERPU30cO
 mzSFMgHvK2r8YLlOF3nEJ/fzk30bEgCuYFmLyzLz/GS/SkjUTCFZnKzL0jEQGGTTBYJf
 RzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g4GC338kwUwOWFtRrAdw7Nq9znzrvcY4KhIV3i/Ypmw=;
 b=FLQtpEAdS40UrKE12zrd5ktrenJTpw0jmJQDBIQK84UyeJ62sDlxMejC2xs7ngzXt9
 jFxXbpjKhSt7Tg6caZTiY/PPNyRVOEppuB8QrQMffASXHjMXbzVaKHtAQV7fmLLmfnn9
 Oi7tQyEsFprbhP9W53GESZavvHpPUVXZubPbXO+dlYbtk1p3jtUa8wnl37qv4ByaKCb3
 KdeegfkKLoXRY5wG0dyVAPcnZUQ9qxd5dVTKblF/LpohEcJFSRqUrmWs6+2KZw/RRspT
 RA/osLj/UtUpo4m2FZVlrRsTHatNasxjUoomd4HLvlh4EbtvfGnKycJgk417gVlJm0wj
 WAsA==
X-Gm-Message-State: APjAAAX9THkC7a2NZHLfRQx1zwiNIadjX2SFnW0khPxFC0k9PL6Pkndf
 LLmipzhtLjVAue4l4GbT6YqY+FZYYngZ7c072bSkjEt9
X-Google-Smtp-Source: APXvYqwH9jmXmBKoBw/YHL4jYc4KhEPHGvd5GCt2ArJYfDr9icaPNCVZGjTd0S3c2yx59aRUOCApz/JUsON4BHNrYbQ=
X-Received: by 2002:a9d:6745:: with SMTP id w5mr10792464otm.221.1575644773705; 
 Fri, 06 Dec 2019 07:06:13 -0800 (PST)
MIME-Version: 1.0
References: <20191206113635.6570-1-pbonzini@redhat.com>
In-Reply-To: <20191206113635.6570-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 15:06:02 +0000
Message-ID: <CAFEAcA-yb2ux5dZs1tYy_T8m9yqpVmtsv9g8i8T9V4fOAwuo5w@mail.gmail.com>
Subject: Re: [PULL 0/1] KVM fix for QEMU 4.2-rc
To: Paolo Bonzini <pbonzini@redhat.com>
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

On Fri, 6 Dec 2019 at 15:04, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit 1bdc319ab5d289ce6b822e06fb2b13666fd9278e:
>
>   Update version for v4.2.0-rc4 release (2019-12-03 17:56:30 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 2605188240f939fa9ae9353f53a0985620b34769:
>
>   target/i386: disable VMX features if nested=0 (2019-12-06 12:35:40 +0100)
>
> ----------------------------------------------------------------
> * fix for x86 KVM on older kernels (Yang Zhong)

I know you talked to me on irc about this, but pull request
cover letters at this stage in the release process really
need detailed discussion of what is being fixed, the
severity of the bug and why it needs to go into this
release rather than waiting for 5.0...

>
> ----------------------------------------------------------------
> Yang Zhong (1):
>       target/i386: disable VMX features if nested=0
>
>  target/i386/kvm.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> --
> 2.21.0

thanks
-- PMM

