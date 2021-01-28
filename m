Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33308307A03
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 16:46:09 +0100 (CET)
Received: from localhost ([::1]:47122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59Um-0005Ba-5K
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 10:46:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59Rq-0001xZ-T4
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:43:08 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:38117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1l59Rj-0004J7-3Z
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 10:43:04 -0500
Received: by mail-wm1-x334.google.com with SMTP id y187so4950809wmd.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 07:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=12mnrR8ms+5WwSs+PQVzHOmb66VScSLabLuV3gix8ak=;
 b=kuTguAq0PIxh75dPU2EoEK+kClZITPzeJAUWVxlLI4qXRRy0EHl5JbOERJ2BxGOyRM
 yT9Tn2JPqLmUg1A3k8U6kD+EsS/KfoJGq9MFVYh1n8kwm6jXSeAX2yYYRA7aC9a1Tz6n
 0GCdFo8Jl+PO5frszxrgjaOu4QaG1xRcSPJ8EJY2gfZN8GPFN+cNDPBLf9r43uEjFP1y
 cNa99zIFL8b2J2DfkG7gudABYoDzAsb7EoAiXxTgM9xjF4L79iif28PCWFM98gV85lYI
 mF4/w+be+bo5oU8WNNF4yL9GPmFxOZgI2MR7EO0+zvwHSE+o8VkEvGppO+YJPgKIMJB2
 deLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=12mnrR8ms+5WwSs+PQVzHOmb66VScSLabLuV3gix8ak=;
 b=sHRVmJsQ9yjzDF9C6K0Qat5scA//IyqfUPbgy+kXYz3+EtGGhGZtCKhY8gcR0/H7gx
 R9B3h7gHUKFhNiyJjeZgNm3n8b/cDEnKniHlsQ4w5yDWwUl8mAs0rLZmLlbKm6csY0ni
 tshlvQ9t7VnMM7QtyV8u7Bii67ixyGr2VM+smHXukvSBQimbSf87ckMh3jwdsRJFygWv
 GKLyzXIUeyonlsFETRjAa192QFjiyYVlwG+L9qU+wpQHibfDrDaNjF6UiC//5tAzwgUg
 DVIkO9W3TLQkwxPoVRfBqcYd57OuiUQAVti1zy/zktnHnjLC4ba6OJTa8vGKjkJ/rooY
 jYUQ==
X-Gm-Message-State: AOAM532uGM+kPpzQOojUrc7LMrgsVM5+FaJqBUpvcKUzj8zPrhx6wfTU
 LGWFyc4XUpVzfHllOn538w2k5w==
X-Google-Smtp-Source: ABdhPJyuRinAeKRNz0U8QY7HX488Da2kP0mO3x8wMmScPfiPSOxC3b+qIw/y4ga4d/V9tTSnOTvOrQ==
X-Received: by 2002:a1c:ed0b:: with SMTP id l11mr9248340wmh.47.1611848576851; 
 Thu, 28 Jan 2021 07:42:56 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id y14sm7258669wro.58.2021.01.28.07.42.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 07:42:55 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A63981FF7E;
 Thu, 28 Jan 2021 15:42:54 +0000 (GMT)
References: <20200929224355.1224017-1-philmd@redhat.com>
 <87r1m5x56h.fsf@linaro.org>
 <98f06a0a-efe6-c630-8e68-0e4559f04d58@redhat.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 00/12] Support disabling TCG on ARM (part 2)
Date: Thu, 28 Jan 2021 15:42:38 +0000
In-reply-to: <98f06a0a-efe6-c630-8e68-0e4559f04d58@redhat.com>
Message-ID: <87bld9ukxt.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi Alex,
>
> On 1/28/21 1:41 AM, Alex Benn=C3=A9e wrote:
>> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>>=20
>>> Cover from Samuel Ortiz from (part 1) [1]:
>>>
>>>   This patchset allows for building and running ARM targets with TCG
>>>   disabled. [...]
>>>
>>>   The rationale behind this work comes from the NEMU project where we're
>>>   trying to only support x86 and ARM 64-bit architectures, without
>>>   including the TCG code base. We can only do so if we can build and run
>>>   ARM binaries with TCG disabled.
>>>
>>> v4 almost 2 years later... [2]:
>>> - Rebased on Meson
>>> - Addressed Richard review comments
>>> - Addressed Claudio review comments
>>=20
>> Have you re-based recently because I was having a look but ran into
>> merge conflicts. I'd like to get the merged at some point because I ran
>> into similar issues with the Xen only build without TCG.
>
> I addressed most of this review comments locally. Since Claudio's
> accelerator series was getting more attention (and is bigger) I was
> waiting it gets merged first. He just respun v14:
> https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg07171.html

OK I'll have a look at Claudio's first ;-)



--=20
Alex Benn=C3=A9e

