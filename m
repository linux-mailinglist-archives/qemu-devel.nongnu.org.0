Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C9530A438
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 10:19:37 +0100 (CET)
Received: from localhost ([::1]:59572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6VMu-00057D-Qr
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 04:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6VKx-0004L0-7i
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 04:17:35 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l6VKv-000807-K6
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 04:17:34 -0500
Received: by mail-wr1-x436.google.com with SMTP id s7so12730515wru.5
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 01:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=HsmIBNIJJZzcY81YmcRsaJdH85GrJi6xc7aeBRWYiB8=;
 b=KdJh3oU6zcsrMgPQuXgG6mM32Jes+DwH8c+zPBnSJvyYNSOPe+64736RCCZfllvelG
 4ctPioxTWa7tpiNYSthul0J/FfH4/4K4C1GJ00S3Fv9gkiFwdg0x5LQg7ZA153DMKJ7/
 6mRO3GDtkCPA/bAjuEE8msuyKOvCQDlkckKZpEoWFeAnoXGFxPo7HCQl9UdpHhrQbIIE
 Qw93DShdizGxqRU5YGqEIOCrv+mvLan0xEk2zh3twsh66aUe/cv7elsF/NgyNyDPg1T9
 phDE3ex5RG5WoMapy81wkdKz6k0xfj+bIw3R7a0LhlaHgXn64b55ANnun27AUtMQ5TN7
 TeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=HsmIBNIJJZzcY81YmcRsaJdH85GrJi6xc7aeBRWYiB8=;
 b=I54AqfCsuCgVXxRztkcs792ZOfOO+BAPNo/VGDuvz6imu1ZezHHh6V67ky/p5EJ4OW
 VaSzQmuW4Mse26CS6QkqgVsDFu0l2+UkqNiJXWI/hEg7havkh35H7L6H6OwqA88dgvnS
 kwy0JkNjFKJeQ2Bx+rbVlOKeMLdPPqdXpYgkkwTRzjv971P6fxSaxRRwSM4nuyOQuW27
 OrK+B/I63L4XwkAht4lBrgmj/NhAnl+qYdSkLdFyWqvCaOqqZjaiILcTkB8OoXgeLngh
 iNjZ6OWKKNUoM1pMb6XKmcVmlAS+1XOA4vkOJDfm30/WaajwCtInqau4e9RfZR0wCW8N
 0HsA==
X-Gm-Message-State: AOAM531zbJfcHrLJRk5D7eXzRrLbltdbZbDp1wZxM0oM696hmNu+4A2D
 04qKumkvXctbQc0oEYt0LdQb0g==
X-Google-Smtp-Source: ABdhPJwV02n8SFFLoVpYFAf4pVWwVz92Fzks+D4EyzPA07MQ9xhAn69MdJMBbgul6XuFzyRj/G7kZA==
X-Received: by 2002:a5d:4391:: with SMTP id i17mr17027591wrq.57.1612171052032; 
 Mon, 01 Feb 2021 01:17:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id i7sm1829944wru.49.2021.02.01.01.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 01:17:30 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DBBE31FF7E;
 Mon,  1 Feb 2021 09:17:29 +0000 (GMT)
References: <20210128092814.8676-1-cfontana@suse.de>
 <20210128092814.8676-19-cfontana@suse.de>
 <64d8385c-db22-b647-2402-3840b0e0e9b5@redhat.com>
 <9a51a203-f6a8-686f-7859-475537b3607a@suse.de> <878s8dujj5.fsf@linaro.org>
 <40ed971e-a4fe-77c5-94b9-28691874ee32@redhat.com>
 <0943e736-6847-4b6a-8433-f28f4692a299@linaro.org>
 <aaafff05-f3c6-ef44-2d98-f6fcb74ccf64@suse.de>
 <03ac58b2-619b-572f-85ae-0760c0c12bac@linaro.org>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v14 18/22] accel: introduce AccelCPUClass extending
 CPUClass
Date: Mon, 01 Feb 2021 09:15:49 +0000
In-reply-to: <03ac58b2-619b-572f-85ae-0760c0c12bac@linaro.org>
Message-ID: <87v9bcw3iu.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud?= =?utf-8?Q?=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 1/30/21 12:53 AM, Claudio Fontana wrote:
>> To summarize:
>>=20
>> 1) accel->cpu_realizefn extends the current cpu target-specific realize =
functions with accelerator-specific code,
>>    which currently does not make use of errp at all (thus, the temptatio=
n to remove errp from the interface until it is actually needed by a target=
).
>
> No, arm does use errp in realizefn already.
> It's just that the void return value is hinky.

Sounds like fixing the void return would be part of a larger qdev
clean-up rather than this particular series. If I recall there have been
various phases of clean-ups and refactoring of the error code paths in
the past.

>
>
> r~


--=20
Alex Benn=C3=A9e

