Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 730DC6393D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 18:22:57 +0200 (CEST)
Received: from localhost ([::1]:51788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkstL-00067v-Lc
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 12:22:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33649)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hksrR-0004tH-2g
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 12:20:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hksrP-0004UX-QD
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 12:20:56 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43041)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hksrP-0004PR-Ks
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 12:20:55 -0400
Received: by mail-oi1-x242.google.com with SMTP id w79so15809711oif.10
 for <qemu-devel@nongnu.org>; Tue, 09 Jul 2019 09:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pQXOoDlCMk8cm6Ibha7iQG8F7Rmtie0wGpbWEC2fFIA=;
 b=dHeDxZ08ZuhoNkuT/SlAkXVxkfd/EZi4a3hHi/BQSUEi1YyJ5Uni+IwZuya8U3bt2G
 zzT31wTD4Vyu2rZAtbojf4GNKRLVu4vC4PE9KXG6K+8oP7xtXSpRwhh931nTOvoALtsP
 GKUJbwbwVm/J00U0g/72jOXtp2+cVEK5fW3LUu2WefZ7QhyViFYIrzSFT303qbjBqf3e
 hNzbycYr9Byp0zEpW6J/yiUKQcqJMzMci861kbGtfMVTU/kT+o8IPqa7xceYpq+93vSq
 fPUbvKtF63mw96tjM3e6SH/9++K6nb1jIGZVBa00ZfiIN6AiniqzrSOMDC0Fml5r7Dfg
 Asrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pQXOoDlCMk8cm6Ibha7iQG8F7Rmtie0wGpbWEC2fFIA=;
 b=cK0Y8eiH01UxG1M7nb6ujbAs/ipvewOQMGLc4D3p3FCPVQTH0HuD2gcjJ9WQSPKQY4
 SkGamnOaouh8R7/UFIJO5o+bp/iGWgS7f3ppZNWwI9xzV0ezgJa7BMv0hHGTEjH/L6jK
 Rcsf3wG6nXux1tyvyonhwCdJOT7JgdXHECp1E+zCL0rXibkBUPb2tjRlIyUqHqrdLylK
 3kqTUWwDRD/zWhkp8D5OdmHmpsFukjcqd5pCRzAmDtRqL3STzYEc7ZdaLLtsw6DV1UjP
 jIIdZ1oPnpmDnn5BIJVL9vULMoZF1PA9pc0XC5IT9LMEWykChRHqcS+2YRhcElqLZhkx
 nktA==
X-Gm-Message-State: APjAAAUYc0b3S5seR0bLJhOW9eijCOgvCt2R8SO25NBE4r83aClf8MK7
 g6pMc35Uj9j33RpWjFr2+YvwZSJ7cQoe+1XxBMQAFw==
X-Google-Smtp-Source: APXvYqzVuaCdcSVtoJHNoN6rq/WQSIUv3gOv7qtfFHgGHxDIaLUNh/LDpAIYPp7L255n+XkYnSWJEfVFVXP+mgiuNLQ=
X-Received: by 2002:aca:6185:: with SMTP id v127mr500320oib.163.1562689251827; 
 Tue, 09 Jul 2019 09:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190709152145.21308-1-philmd@redhat.com>
In-Reply-To: <20190709152145.21308-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jul 2019 17:20:41 +0100
Message-ID: <CAFEAcA_KCxe-JYS+ShSHyzqr+1wj9A8okGHPfVe7NCCE3nC8ZQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PULL 0/1] pflash-next patches for hard features
 freeze
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 9 Jul 2019 at 16:21, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> The following changes since commit a538626aff7c8934ec47bc6ed41cac5bd1b772=
3c:
>
>   Merge remote-tracking branch 'remotes/rth/tags/pull-tcg-20190709' into =
staging (2019-07-09 11:49:26 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/philmd/qemu.git tags/pflash-next-20190709
>
> for you to fetch changes up to 51500d37700904a0ee1ef775a585d871b36f7060:
>
>   Revert "hw/block/pflash_cfi02: Reduce I/O accesses to 16-bit" (2019-07-=
09 17:14:39 +0200)
>
> ----------------------------------------------------------------
> Restore 32-bit I/O accesses on AMD flashes
> (precautionary revert).
>
> ----------------------------------------------------------------
>
> Philippe Mathieu-Daud=C3=A9 (1):
>   Revert "hw/block/pflash_cfi02: Reduce I/O accesses to 16-bit"
>
>  hw/block/pflash_cfi02.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM

