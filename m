Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80EE8102303
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Nov 2019 12:29:46 +0100 (CET)
Received: from localhost ([::1]:44192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iX1hZ-0003Mh-Jg
	for lists+qemu-devel@lfdr.de; Tue, 19 Nov 2019 06:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49013)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iX1gm-0002vb-0M
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 06:28:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iX1gk-0002oq-Ga
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 06:28:55 -0500
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:34314)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iX1gk-0002oU-A8
 for qemu-devel@nongnu.org; Tue, 19 Nov 2019 06:28:54 -0500
Received: by mail-ot1-x330.google.com with SMTP id 1so689000otk.1
 for <qemu-devel@nongnu.org>; Tue, 19 Nov 2019 03:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3X/DAgBo9tV5kdMhZcb2TNuI5Wa9TpLRjx2CVHjytkY=;
 b=v9ubHRBW7il1Af/Ioc0JOAkkm6QoV4SmfAZ6RoOj5i6k5k/OJ10SMp7HUweOvnNc4N
 m1bdHtiuw+V1JOuUJq+Kme0FKQ25tyw5XzLr4H0/wS+kO5rSNT4rq1fgRF53uoI9dicB
 n/bvJCQ+FILS+8YHU8YEdGBfqgNVKCxcdV64gNTxhrKCwNH4qATn6eFv0uvI+AIFSVIv
 xL6TIxIU5xPyCIo/q54T2NaF7Owx99JMXdT6xSMVf8ZgaHXun5o95+X2k9I/vb9TaU66
 K6SYuZvinun6HfgLp2NJfgmXMqTw8ipAGt4uxX+GnoK3PNavwjW49Q7jWGgCiyRfWaY6
 8ASw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3X/DAgBo9tV5kdMhZcb2TNuI5Wa9TpLRjx2CVHjytkY=;
 b=GaJPymJazu34Mh8pCwhiwmfW/VaSs+YwdgeQyE4fHAy/Z1JbFRp31Z+HmNEOIje+Kt
 s0dqiiIInwqshQGHalqZa4kGn8a93GsDWxtwqEyXbadoVIa4oBrv5sB2ivOlGiK795kC
 +ntWkLXoUUUzWRNRbsyeayNduzvs4UtxyoXyfsPAHVv9QMX4DjeIQCEVuRRU6794cjQb
 r45+q0NHx4IoeVDXXuPDkVf6b8//cD07bxo0EK3RmrbFMBQlM2T7Z8OrroCKb2mfL6Pn
 qBfHCWCA6AY4CMVqHSHuv6TvlWC5l2KIu6oqb7/f5Xk9udT2XWYEVgJ164wWTEe4SAxM
 AppA==
X-Gm-Message-State: APjAAAVUiReLpRWi2KkOsH6JiCmcZK/671cs/7OBNjiP7DLtcfvDvuyd
 TwJjModJX0tbUvEwccEnaKJ6hPPbRPgZE6WAWm89fQ==
X-Google-Smtp-Source: APXvYqxzD4HwLQWJUxZ78SiEsC4vI1IMrKteeqKesEk+R+o0ohhwQvFHg3sO2qa2QON/39QCIC9JFNmWZuHTjBWDKNA=
X-Received: by 2002:a9d:68cc:: with SMTP id i12mr3103857oto.97.1574162933401; 
 Tue, 19 Nov 2019 03:28:53 -0800 (PST)
MIME-Version: 1.0
References: <20191119030759.24907-1-eblake@redhat.com>
In-Reply-To: <20191119030759.24907-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Nov 2019 11:28:42 +0000
Message-ID: <CAFEAcA9vVKmpAb7Ow=cPk+80SBt0rEvuhhgprNSXwoNtOAAKwQ@mail.gmail.com>
Subject: Re: [PULL 00/10] NBD patches for 2019-11-19 for 4.2-rc2
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::330
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

On Tue, 19 Nov 2019 at 03:10, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit a5c2a235103ab366ad5318636ec138e52c6dcfa4:
>
>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2019-11-18 17:06:17 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2019-11-19
>
> for you to fetch changes up to 296416ff0f519d762fbb87ac59f0770824267f3f:
>
>   tests: More iotest 223 improvements (2019-11-18 20:34:37 -0600)
>
> ----------------------------------------------------------------
> nbd patches for 2019-11-19
>
> - iotests: more tests of NBD reconnect, various test output improvements
> - nbd: fix spec compliance issue with long strings
> - slience a Coverity warning on coroutines
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

