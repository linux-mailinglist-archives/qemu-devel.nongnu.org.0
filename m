Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AD469231E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 17:18:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQW64-0007Uc-1f; Fri, 10 Feb 2023 11:18:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQW61-0007UT-9t
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:17:57 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pQW5z-0004eJ-CL
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 11:17:56 -0500
Received: by mail-pj1-x102c.google.com with SMTP id pj3so5678244pjb.1
 for <qemu-devel@nongnu.org>; Fri, 10 Feb 2023 08:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=z386OrgC0qZ45jmFowK1MUQp1qTHcI3ZIUz9+Q/1B5U=;
 b=jEgnr/RsvmK6O0qewRMj8zhwUUsq2E7XpWnjCzHvQZgCohf6pYdO5YlYh4aQGwn1Rh
 FGtTuwUHWzG0GzP/VAUm8/4A6l9T1RwbDXiwUE9wTBaQJMSTR8C2sbrGzxZ7b6yHsQEC
 vHiIKK6KYrn7a7fMMjDdC4WvilK36r+33G9HmnxUMlXTlJ3c/uYJgxFIAXYNWGds5THi
 tK89bjXXoUknj4/AUuu9T1ACfumCCQZjHbwcax6I3R03HlgW3psfglVLmZSS34avs1j7
 GR5EgsNS6vrRjVUCihgzzh8Dn5Ch+DAT/5KtjNqdi/jGf9729PUOyzgfz1cPxr1XJUYj
 /neg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=z386OrgC0qZ45jmFowK1MUQp1qTHcI3ZIUz9+Q/1B5U=;
 b=lpqAahu/LjR9t7nsaa6DEeoxc/wAvwB08mYzK05vupOJBlZeUhArbyY6cFKmEfR7Gk
 MmJMoCXfeCvXy8ChZn3BPhnFOGo/xannkWAdOJmdaFuatSvdXwIzeFOnkyWdSIHu92ZS
 o1idjMTzmFxwp6sZyM7cFVg080kZ5gCumMx2NtTxxWxo3V4yk5DmEA9LpMhpOfBl8D1c
 XzpYfuFkjUwXjKPZeRlTrkZZ1dFnAwr9XleeuUu6fCxTqjLehQwB4DuXKdNI65nM5JxS
 AT277O0ojjBUJPhoiCFdSZMqi5Q7pqpzlLc9hYtyS+ubhgTU0MzHg46DWOk0TSVqK/l9
 1HTw==
X-Gm-Message-State: AO0yUKVg3qOqtKqMX0qDvXXwTF37/+dirc32wNP73/YdUKLsd8kOsVZl
 86byMqXyeJOHdEmlqhqJirWX2WN4wh0sm9i4cBSLRw==
X-Google-Smtp-Source: AK7set8CoQNvdtuQ5N0z1SHxuNOdM734bNbotniAk8x3KQfciFelnNewiRKDgidLq0l2zfjbhmbfRiH2RkXDDvnOz6Y=
X-Received: by 2002:a17:90a:d353:b0:230:c24b:f22c with SMTP id
 i19-20020a17090ad35300b00230c24bf22cmr2746960pjx.53.1676045873790; Fri, 10
 Feb 2023 08:17:53 -0800 (PST)
MIME-Version: 1.0
References: <20230209233426.37811-1-quintela@redhat.com>
 <CAFEAcA-qSWck=ga4XBGvGXJohtGrSPO6t6+U4KqRvJdN8hrAug@mail.gmail.com>
 <87r0uxy528.fsf@secure.mitica>
 <CAFEAcA-SOpRiX+s14OxCJ+Lwx6kzUdroM9ufugzTVLM9Tq2gHA@mail.gmail.com>
 <87edqxxzur.fsf@secure.mitica>
In-Reply-To: <87edqxxzur.fsf@secure.mitica>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Feb 2023 16:17:42 +0000
Message-ID: <CAFEAcA_DdytX0qF-WwjgVeOWm-D7Hpfd3F2eZhahdDtJZctFeA@mail.gmail.com>
Subject: Re: [PULL 00/17] Migration 20230209 patches
To: quintela@redhat.com
Cc: qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 10 Feb 2023 at 16:13, Juan Quintela <quintela@redhat.com> wrote:
> Again, I don't know why it fails.
>
> diff --git a/tests/bench/meson.build b/tests/bench/meson.build
> index daefead58d..7477a1f401 100644
> --- a/tests/bench/meson.build
> +++ b/tests/bench/meson.build
> @@ -3,9 +3,11 @@ qht_bench = executable('qht-bench',
>                         sources: 'qht-bench.c',
>                         dependencies: [qemuutil])
>
> +if have_system
>  xbzrle_bench = executable('xbzrle-bench',
>                         sources: 'xbzrle-bench.c',
>                         dependencies: [qemuutil,migration])
> +endif
>
>  executable('atomic_add-bench',
>             sources: files('atomic_add-bench.c'),
>
> This make it works.

Before you added your test, meson had no need to compile
any of the object files in 'migration', so it didn't. Now
you tell meson to build a new executable, and it says "OK,
I must build these object files". Only it turns out that
they won't actually compile in this config, so you get an
error.

The same issue can happen in good old Make :-)

thanks
-- PMM

