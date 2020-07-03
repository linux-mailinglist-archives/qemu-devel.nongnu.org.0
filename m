Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F4B213BC4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jul 2020 16:24:12 +0200 (CEST)
Received: from localhost ([::1]:34436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jrMbr-00065k-7K
	for lists+qemu-devel@lfdr.de; Fri, 03 Jul 2020 10:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrMb8-0005bx-O3
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 10:23:26 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:45473)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jrMb6-0007nl-Oa
 for qemu-devel@nongnu.org; Fri, 03 Jul 2020 10:23:26 -0400
Received: by mail-ot1-x32e.google.com with SMTP id h1so4624195otq.12
 for <qemu-devel@nongnu.org>; Fri, 03 Jul 2020 07:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VRqwJTDtw7bRZvbmy7nxWBfJhrW4XqAfa9gleuVlBxI=;
 b=XAZlkHIYaO1C73gGJAlU25SiO1fyVLuZNbdfYimIJnWCyf881TSAv1AM7HM1ZKPvYe
 PABjVC8++e3cZkJQIs/ryZ8dnBauEl6Oq+kLqUoNIzpi9zxSakVQNmy3/EKJuexKjXG1
 u7VisfZzECxQak6K4L9igaXsGIwDdmd1ruKQ8QVbgBxostdBlLD9f4GKL8P92Xq3mhIp
 QEoAsvj1DDAURM68jMgMvjYKtJuoFa8Oe0/8FcWNKJOa03/EhKkTGgRR6GOiPzPuahBV
 JgHojVaeSfR148fZb51qMIc+CiavzcR3THJLhyDFR7SXERpjHVtu8hGg/hlPV/3/yYs6
 vNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VRqwJTDtw7bRZvbmy7nxWBfJhrW4XqAfa9gleuVlBxI=;
 b=VKtaNeCbflx9XgXAtd37ay2DWUVbohhMpgkvDV4PWdA7YBXD74BapJJyzJnvgiHg+5
 aJ5oIOUDYcdOlqydqeQKGVtKZ+Mkf1e+m5qf9idiSuxBajbTsjZhesi2l0pGv8PielNr
 V6cES4KSwx7H2Udm6zLTGufexhybA1PHcSsrrZ0XyHPrkriXhC4aDvtomMnt/y7Kw4/x
 R5gsWbo4nHHRozt1cvaRSr4wr/i9W1h+aQQn2mKetGKeQ4mZVcfe5vlLRocl4v3q5nEq
 O3sbtcdI5pu8JeziLCMehB9UAoxznCLb7sUmXT7ODTFG8P7QYDqKznGbDDdewagfbWaK
 p1aQ==
X-Gm-Message-State: AOAM532aida+2pHTctYHnyWQBimJCV0sM/oIafGxulluj+dz7oXbMMCG
 SI1LF+3F1yUbzCzx+dXWjhXdE8l6uKywTF7HdOtGXg==
X-Google-Smtp-Source: ABdhPJydyM1jxm2tE04n3QwGQj2zxZVzkKsLLjitWnrWoIefq+4Xiu5yl1X3orzwUsnGzTptAVyF3nSurO9Gy1fNx1A=
X-Received: by 2002:a05:6830:1bd3:: with SMTP id
 v19mr28604917ota.91.1593786203326; 
 Fri, 03 Jul 2020 07:23:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200702152710.84602-1-laurent@vivier.eu>
In-Reply-To: <20200702152710.84602-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jul 2020 15:23:12 +0100
Message-ID: <CAFEAcA_CDZqch-dB2LhTrwQ1pGi_GGn=6RE2CWM8WvLducZigw@mail.gmail.com>
Subject: Re: [PULL v2 00/12] Linux user for 5.1 patches
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x32e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Riku Voipio <riku.voipio@iki.fi>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2 Jul 2020 at 16:31, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit e7651153a8801dad6805d450ea8bef9b46c1adf5:
>
>   Merge remote-tracking branch 'remotes/amarkovic/tags/mips-gsoc-queue-jun-27-2020' into staging (2020-06-27 22:57:36 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/linux-user-for-5.1-pull-request
>
> for you to fetch changes up to 89ddeec7f060a9f403aead414bb883a52f2b5024:
>
>   MAINTAINERS: update linux-user maintainer (2020-07-02 16:55:16 +0200)
>
> ----------------------------------------------------------------
> linux-user pull request 2020-07-02
>
> Update linux-user maintainer
> Improve strace output for some syscalls
> Display contents of ioctl() parameters
> Fix sparc64 flushw operation
>

Hi; I'm afraid this failed to build on 32-bit arm:

/home/peter.maydell/qemu/thunk.c: In function 'thunk_print':
/home/peter.maydell/qemu/thunk.c:304:51: error: expected expression
before ')' token
         qemu_log("%" PRIu32, tswap32(*(uint32_t *))arg);
                                                   ^
/home/peter.maydell/qemu/rules.mak:69: recipe for target 'thunk.o' failed

Looks like a misplaced close-bracket in a section of code
that's inside #if HOST_LONG_BITS == 32 && TARGET_ABI_BITS == 32.

thanks
-- PMM

