Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2F81153A6
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 15:53:25 +0100 (CET)
Received: from localhost ([::1]:39038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idEyy-0007d3-6i
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 09:53:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40064)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1idEQE-0003Mj-Dc
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:17:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1idEQD-00044P-As
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:17:30 -0500
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:36231)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1idEQD-00043O-5X
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 09:17:29 -0500
Received: by mail-ua1-x944.google.com with SMTP id x15so2871472uar.3
 for <qemu-devel@nongnu.org>; Fri, 06 Dec 2019 06:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dmq/2j6nGIVBQGtDL6jBJ9TApdnLutBPJ157fatWu+4=;
 b=zLbDDOl1dLgyWsvAFLYNoGci9uF9Va2gzT3W/EoGykUNumLA2qDUDlRxfhLo37nbu5
 70eROptPAgLUvinZlMMwTqlAsRjvhiZkSg3cCj6FJ546zml5Lqikjcg98SaYOL4qTPLD
 pFBciYWkmfExoPToBX10HlCV/ds2vqXeklnl551MiwCRCtSIUL3sNqGwqZxCuwexGSVN
 i63YxB5aC0n0XUUytuMO6IqABiyx//NcXOsvtoN23JkVym1QygAmsmY4XqUH7wRumwbZ
 1zWQwQVCZnMndoRW8ylkqFV+g+zmngXtWr02YbycILpIWz7FYZYySEcWhBR3f6ruwJrN
 6eJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dmq/2j6nGIVBQGtDL6jBJ9TApdnLutBPJ157fatWu+4=;
 b=s1eScI8HdtnHCdbAEmAIIQaSInyHV/2091kD+/YceoMgZngpZfuSPF0cvUbedWcrdR
 Yn/1WBnDzpvTa6pLZUfqiM6bmVgQFfF1PechrPlC/8uST+OhBBriRppX7Se5+UOW6ME9
 dfb3166zfmdDfbQwc4tXAH9OxqPfCy4xWsmxw9ql98k9iXi6frl7XXxR6o1j8KsG/C/I
 tH6qNOG/roCRuKmTj4sM2Wgl3Kw7XpytKspLtMmhrGXVREs2FZseNU+uYi0HjoR3/Qz9
 m4Lw1lHA3bXlwKskQ9r8JSjXrIUnx16mqz73qKz08hhafdfBv1f2dEJEe1qfpjJejvDa
 fHzA==
X-Gm-Message-State: APjAAAUaqGnoL5KFAKjrFpmuAhbJr8mi/EZUuy1J8nyGMxNMftOcQEW5
 82m2it1B0mhfVJqu4VoJlUb9qtpAx3QGsZq35ZLGpxdK
X-Google-Smtp-Source: APXvYqxROLhRMAql+98WYp7dAbT5NVrgWi3zooCajKGV57yz+Ps8KZm3tVPYaQ2mI/1IkSgdmlYWZh8towZUC/cwhIw=
X-Received: by 2002:a05:6830:13d3:: with SMTP id
 e19mr11025372otq.135.1575638646107; 
 Fri, 06 Dec 2019 05:24:06 -0800 (PST)
MIME-Version: 1.0
References: <20191015163507.12153-1-richard.henderson@linaro.org>
In-Reply-To: <20191015163507.12153-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2019 13:23:55 +0000
Message-ID: <CAFEAcA9xAkQ+mu=0Y3M3PKbFo293WfiM5VGxp=CqH7Np_EmwHA@mail.gmail.com>
Subject: Re: [PATCH 0/3] target/arm: Implement ARMv8.5-MemTag, user mode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::944
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
Cc: elver@google.com, icb@rice.edu, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Oct 2019 at 17:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is a refresh of the user-only patch set from March.
>
> I do not attempt to implement any part of a kernel abi wrt mmap
> and/or mprotect.  Instead, it uses a x-tagged-pages property to
> assume that all anonymous pages have tags.
>
> The tests added are disabled by default, but do pass if you have
> binutils 2.32 installed.

I'm going to skip reviewing this until we have a defined
kernel ABI to compare against.

thanks
-- PMM

