Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 171771441B7
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 17:09:27 +0100 (CET)
Received: from localhost ([::1]:57360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itw5l-00069S-Se
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 11:09:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33406)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1itw1v-0002kY-D6
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 11:05:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1itw1u-0000w0-0R
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 11:05:27 -0500
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:39846)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1itw1t-0000vJ-Oz
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 11:05:25 -0500
Received: by mail-ot1-x32c.google.com with SMTP id 77so3374941oty.6
 for <qemu-devel@nongnu.org>; Tue, 21 Jan 2020 08:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=HnNLuEP/VeahBjDipy7YPDkO4ayGjWZWswqt6Qo4bx8=;
 b=pRLM9KCVkK/If4mOFEIN1dqSPorYlmPmUJgTavuSei7GxLXqUvJ2FpAnND10caveQz
 +1PFMKdXtN2OXienmiLFa4+8MoVkvTbStMmaCmmG+FTHggGdsd3T9sNJX/VBLBPNf+2w
 ZCOCmgG14cs+FFJnOFsuTuhzCzBr606lV8QcN0enZ9JyX9l5dSro6d33gru23uOB1Ud4
 FiRDph+aNS0nAYJ1OvBU6o5n0j6iv3tCOw5otLClTvnZc/hcdJoNqN9ExMREuZ0Clsxz
 mD0TnFN8JyAHmnfzLA5g7SA6GeiX0BUaNMQ/s75hTZjUyty/+UDj9RuziWdCMFKjnROS
 ET2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=HnNLuEP/VeahBjDipy7YPDkO4ayGjWZWswqt6Qo4bx8=;
 b=E36+mls43ou4OTFW3bLwxdNGtL1ueAmKanYcSZ/iP5nA6n154x5u25FYI4E7kUbsGW
 t21JqPxdK0Cp/ae/MwU1iD1Mqi11NulkLrrvydAGGndQx3ow+7cgJ9OHWAUvN5HJdqsC
 qEvlMBlL6Xd7XBY+BseNgkIRKJdOaN7I1Qw8D7hI1noht/6GyWXy78PgFgdpHirZVKT6
 3KzNlPmmptD6lXoA902amcbLDwS6FxkYcq2wNBxjOmdQZ3kzzDM3SDmLp0aybAmJkI+T
 wXFZy43KpTTxcMacVe1FaPGWDIWgrRRbT91zJW7Hd33Fs5uESOR6PrYQcWdjv+uUH91Q
 yhhQ==
X-Gm-Message-State: APjAAAVJP5x7dR8kugh5vzJhO/yJKNmMMvMJMZksuJTicXDBuf2oTSaM
 XV7aDn42GS6bHsX+9Mrp77mX62wdk8bPvgDOECH7sA==
X-Google-Smtp-Source: APXvYqyhI61siyLHlHAYbli+KUFyUXQRrzaunrvTsV42TS7uWYBSJsOOvfCsNZ9Hz5a5LRa1tJysx6ZPnSMXdPEwXXY=
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr4073167otq.135.1579622724887; 
 Tue, 21 Jan 2020 08:05:24 -0800 (PST)
MIME-Version: 1.0
References: <20200121151543.18538-1-philmd@redhat.com>
In-Reply-To: <20200121151543.18538-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jan 2020 16:05:13 +0000
Message-ID: <CAFEAcA_d-QfcCmZY53xFciea3o8KRGN2Nvi=Ss+JBksZ9R-ZcA@mail.gmail.com>
Subject: Re: [PULL 0/2] EDK2 firmware patches
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32c
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
Cc: Thomas Huth <thuth@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 21 Jan 2020 at 15:19, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> The following changes since commit 43d1455cf84283466e5c22a217db5ef4b8197b=
14:
>
>   qapi: Fix code generation with Python 3.5 (2020-01-20 12:17:38 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/philmd/qemu.git tags/edk2-next-20200121
>
> for you to fetch changes up to 71920809ceabedf7dbec67dda4d649bcbb11f55c:
>
>   gitlab-ci.yml: Add jobs to build EDK2 firmware binaries (2020-01-21 14:=
15:48 +0100)
>
> ----------------------------------------------------------------
>
> Another set of build-sys patches, to help building the firmware
> binaries we use for testing. We almost have reproducible builds.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

