Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE28585643
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 22:47:39 +0200 (CEST)
Received: from localhost ([::1]:33144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHWtV-00076O-GE
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 16:47:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oHWqp-0005G5-I3; Fri, 29 Jul 2022 16:44:51 -0400
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c]:36597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oHWqn-0006Bs-KI; Fri, 29 Jul 2022 16:44:51 -0400
Received: by mail-vs1-xe2c.google.com with SMTP id a63so5744498vsa.3;
 Fri, 29 Jul 2022 13:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=mZLgjdkVLm2iISJVJG0LxmdM66gyDGNmYwAqVWrU4eg=;
 b=CbTWo7ezGH+Yp1een0sCkb/c/5v+cVK1VWONVTAdlpDgoRvA3xwZ0hiTbAS+zwMZyL
 /yZaXtEyt8UNWv2KudjzEzw/bob5L17L1zKzwtK95y8ZFZ6De2SA6g/KI2rIy9PR4e29
 7bXMhMjy5MaPLHrKgDgAf6zUahNgzJ9ta+MZ138KXWWqzXmu2U+6ze3jLNg7SlIo3nhe
 W8zaPngVnhGInCbdeM1I0u/yGJMtI18V5AkIAxomhaoAHayhBuz3rLN+E1Yg+TqdhV/6
 3T0Q61igw4ICBSITiWnXKed4p9QPqO7BgdS63H2tFKqH364VCQLaGsM8cZtcw21wiOqL
 1mgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=mZLgjdkVLm2iISJVJG0LxmdM66gyDGNmYwAqVWrU4eg=;
 b=TMTHEkYxM5v0Zvy7hMgVaZhxJpDK+BYt3afNqBZ9wq7AditSMxaapDYNY1q5QUoU/3
 uHcgTjWZylOo2NpkBaizCI1h6h5WQggdOEGrhE0JmnG72JFfMVl7zACzGMZ0TRgWIGAf
 hCE73OdbkBH3yFWAS66yW6X6rCqgFIxLI1K73PGWN69EQUgvxVweiB+dMlitrehHX9hI
 rwU2CkrUY1O/IKME1ftAjHlWELgdXXJtD0XOD1TmdVavASqJnusqC/3e1jAzODos8bXN
 qKva8TnOF6nGSLZmFAlrbORfL1nEkp/V7fdsczDmz+cvdSvSwLA4l+bkpMkNKNiCqZLx
 3hLQ==
X-Gm-Message-State: AJIora/VpUbNBlK1cmFqzs5fQ2ij2hcecyVdJr6LhfuYLmXnKb+5Xo0P
 7Ej+/NGXctxAlJpxl9KjPps=
X-Google-Smtp-Source: AGRyM1tr1yLP+46pefRf0rOB/rBBa5aGgH6UfQSIEg2KvvK1KWCR56ejHPCOU6dXFng5iYfUUxFnCw==
X-Received: by 2002:a67:a248:0:b0:357:ce3d:a46c with SMTP id
 t8-20020a67a248000000b00357ce3da46cmr2348477vsh.79.1659127488010; 
 Fri, 29 Jul 2022 13:44:48 -0700 (PDT)
Received: from [192.168.10.102] ([179.225.208.46])
 by smtp.gmail.com with ESMTPSA id
 g16-20020a67fad0000000b0035a1e404cc0sm1402997vsq.34.2022.07.29.13.44.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jul 2022 13:44:47 -0700 (PDT)
Message-ID: <61198099-b282-3289-aa22-f0176d59816a@gmail.com>
Date: Fri, 29 Jul 2022 17:44:45 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH for-7.1? 0/2] Re-enable ppc32 as a linux-user host
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: mark.cave-ayland@ilande.co.uk, qemu-ppc@nongnu.org, laurent@vivier.eu
References: <20220729172141.1789105-1-richard.henderson@linaro.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <20220729172141.1789105-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::e2c;
 envelope-from=danielhb413@gmail.com; helo=mail-vs1-xe2c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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



On 7/29/22 14:21, Richard Henderson wrote:
> This is, technically, a regression from 6.2, so it's not
> implausible to apply before rc1.  Thoughts?


In gitlab #1097 the author comments that:

https://gitlab.com/qemu-project/qemu/-/issues/1097#note_1044810483

"there are several distributions still available on 32-bit powerpc, e.g.
Adélie Linux, for now still Void Linux, afaik Debian and OpenSUSE also
still build packages"

I checked these claims. Latest version OpenSuse LEAP doesn't support
ppc32 bits:

https://get.opensuse.org/leap/15.4/#download

The last Debian that supports ppc32 was Debian 8:

https://www.debian.org/ports/powerpc/#powerpc

"Debian on 32-bit PowerPC (powerpc)
It first became an official release architecture with Debian GNU/Linux 2.2
(potato) and had retained that status until the publication of Debian 9 (stretch).
The last supported release for 32-bit PowerPC is Debian 8 (jessie)"

And Void Linux doesn't seem to support any PowerPC flavor:

https://voidlinux.org/download/

Adélie Linux supports ppc32. I can also add that FreeBSD also supports ppc32.

Checking about/build-platforms.rst I can see that we would only somewhat
care for FreeBSD here, since Debian 8 is already out of our support
window.

All that said, I don't have strong feelings against re-enabling it, specially
because this build issue was deliberated caused by us.

However, after re-enabling it, I would only care about build bugs that are
reproduced on ppc32 FreeBSD.



Daniel

> 
> 
> r~
> 
> 
> Richard Henderson (2):
>    common-user/host/ppc: Implement safe-syscall.inc.S
>    linux-user: Implment host/ppc/host-signal.h
> 
>   linux-user/include/host/ppc/host-signal.h |  39 ++++++++
>   common-user/host/ppc/safe-syscall.inc.S   | 107 ++++++++++++++++++++++
>   2 files changed, 146 insertions(+)
>   create mode 100644 linux-user/include/host/ppc/host-signal.h
>   create mode 100644 common-user/host/ppc/safe-syscall.inc.S
> 

