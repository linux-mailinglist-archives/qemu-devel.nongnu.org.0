Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FA514AA67
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jan 2020 20:24:26 +0100 (CET)
Received: from localhost ([::1]:49880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iw9zl-0006V4-6i
	for lists+qemu-devel@lfdr.de; Mon, 27 Jan 2020 14:24:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53977)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <palmerdabbelt@google.com>) id 1iw9yh-0005rp-Nk
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 14:23:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <palmerdabbelt@google.com>) id 1iw9yg-0005bo-JV
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 14:23:19 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:36373)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <palmerdabbelt@google.com>)
 id 1iw9yg-0005Wy-BZ
 for qemu-devel@nongnu.org; Mon, 27 Jan 2020 14:23:18 -0500
Received: by mail-pj1-x102d.google.com with SMTP id gv17so3511382pjb.1
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2020 11:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:cc:from:to:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=JbOpXni6WU5muY6ZX256vLuCT+7/Qgls9M9WK/J6QbA=;
 b=LxzTXA/2FZFrTdc3nMBhrnRTi7FGybheo1WgFZnukzmL8sJyuG8Ha9/ULLTYCLLtlB
 EDKVv78hn6O16mbGvnLBsRlSyVu4vVWu0EJIlR2p5GsXgllRak6jbxfE6wpyoy6/mHGs
 LSLCYihR/bS1vVXRPuSb604uv7oswp0QOeOy6sWDXMKTDi0L+epNoMAl9NrFv0LKEzEX
 vIUyeZIeq6iXEKu5ZqTx7eLHTLwno7DR3ZSW8mhML/0Km89Zy8x25s0zag1gJI1ga90P
 GmIs3vADNEp+1QykkQoEjY+QXnOyZUgj4tDOWL693Ckqo5vdTKGOXiBsjvODslx7trRv
 buIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=JbOpXni6WU5muY6ZX256vLuCT+7/Qgls9M9WK/J6QbA=;
 b=VaR5VO6b4Vlq3f00QhuO+iw5IvUd+Y9TtfOST1IcbBmwXpa0vA6CJV4DvUY0PVZXuQ
 6NwkO7QPJF8BMQeI3reVAkiF0B7uGcg2nCWKoX4NkyDIcoxJWc1NaVFHcbfwcfp/GD4h
 3lyEwXjSGBWF4p7JTObOGBCfRk+5AlKqOMRn7HnZOCfEUHU3+aw5D7as/pv7AWvrHzuN
 w5Yv0qaJpbCIAnkrzckb7Z1lk9wHmRAAVqXOfmJd6dpGn9JkD8ryRumO9KjmlGIamD+w
 /NluPFII4kc4X/FmyQe6izRnMITC5S/mNEOnfmcP71n8YziXM6COzdULTMKGW9Xiv5AY
 HM6A==
X-Gm-Message-State: APjAAAWoAdLw3anTZZ3IkyrMCv8K7JNaSUAaWwUWUflJddidZlSZ9rrg
 2qReqoQq7ss3wir9BRrHBIqA3w==
X-Google-Smtp-Source: APXvYqzjhnYbCujhvxLhAAx/fAUl7D4yF+p/dyU3g+lPmEOfeP5tsHM5eb7OAc5mBP9mRnKDa+CB3Q==
X-Received: by 2002:a17:90a:36af:: with SMTP id
 t44mr184738pjb.25.1580152996110; 
 Mon, 27 Jan 2020 11:23:16 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:7e26:c73d:3c43:9c13])
 by smtp.gmail.com with ESMTPSA id v9sm17127654pja.26.2020.01.27.11.23.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2020 11:23:15 -0800 (PST)
Date: Mon, 27 Jan 2020 11:23:15 -0800 (PST)
X-Google-Original-Date: Mon, 27 Jan 2020 11:23:12 PST (-0800)
Subject: Re: [PULL] RISC-V Patches for the 5.0 Soft Freeze, Part 1
CC: qemu-riscv@nongnu.org, qemu-devel@nongnu.org
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA9HnhKE1nS+ubmCD4AgS-EZ_J_XcWapzUvM2pegHs-imw@mail.gmail.com>
References: <CAFEAcA9HnhKE1nS+ubmCD4AgS-EZ_J_XcWapzUvM2pegHs-imw@mail.gmail.com>
 <20200121225703.148465-1-palmerdabbelt@google.com>
 <CAFEAcA9YoAjASu4F1hZRjbq5S+h8GtBUVb9dgecMdaWb9YENEw@mail.gmail.com>
 <mhng-ea4d4047-6dfa-4be0-8ce7-424b1d17560a@palmerdabbelt-glaptop1>
Message-ID: <mhng-3bff4d7f-3418-49db-879f-0df5612feccd@palmerdabbelt-glaptop2>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::102d
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 24 Jan 2020 04:35:14 PST (-0800), Peter Maydell wrote:
> On Thu, 23 Jan 2020 at 18:43, Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>> On Thu, 23 Jan 2020 06:38:07 PST (-0800), Peter Maydell wrote:
>> > Hi. This pull request doesn't seem to be signed with the GPG
>> > key that I have on record for you...
>>
>> When I moved to Google I got a Yubikey and made new subkeys for it.  If I
>> understand correctly the new subkeys should be signed by my main key, but maybe
>> that didn't make it to your keyring?  I see
>>
>>     $ gpg --list-keys palmer@dabbelt.com
>>     pub   rsa4096 2017-06-06 [SC] [expires: 2027-11-13]
>>           00CE76D1834960DFCE886DF8EF4CA1502CCBAB41
>>     uid           [ultimate] Palmer Dabbelt <palmer@dabbelt.com>
>>     uid           [ultimate] Palmer Dabbelt <palmerdabbelt@google.com>
>>     sub   rsa4096 2017-06-06 [E]
>>     sub   rsa4096 2019-11-26 [S] [expires: 2024-11-24]
>>     sub   rsa4096 2019-11-26 [A] [expires: 2024-11-24]
>>     sub   rsa4096 2019-11-26 [E] [expires: 2024-11-24]
>
> Yeah, I have those. I think I must have fumbled something
> when I retried the pullreq after doing a refresh of your
> gpg key, because I just did a retry now and it's fine.
> (I'm just running the pull through my tests now.)

Thanks!

