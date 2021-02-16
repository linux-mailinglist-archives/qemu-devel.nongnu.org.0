Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A20E31CB42
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 14:39:19 +0100 (CET)
Received: from localhost ([::1]:55592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC0ZS-0005FZ-0y
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 08:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC0XF-0003AA-0T
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:37:01 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:35637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC0XD-0008K5-78
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 08:37:00 -0500
Received: by mail-ej1-x62a.google.com with SMTP id g5so13077323ejt.2
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 05:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DQ4jAVggB8EkG4i0r0VuWXJejQJDw8yQG3wZqaexqS8=;
 b=n8y2MqJmS2Y3tAN11hqlxHS81RmCbDZdDJUJuBYxTQjNfC1PAoiIwsjamx8BPGmb4i
 c6deMsbM50v9YHbhV3cr1STVaohsti/Z/jPYDRJr1GJf4x2I3e2a41Bn3xTBAfV/nYTc
 uG3HWDCxKR2ZUnYjlW8ztDSTkCHkp2uxOBr4qtwbxZwuqm+HRD9o7VpZ5ZqLMBaU2v9I
 URIX/IGHcWDLHczSXgy7l+timOF2+c7NYJIZBBSeDmEYCv45OeD7UvTGtw7yjV9aSlyt
 t2GKJ/BxaNTgojL6T6aYJOJdZAd3KNkNgeWSZ7wawP92B/JMYIST7MmdHwk7iR8iUUxW
 breQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DQ4jAVggB8EkG4i0r0VuWXJejQJDw8yQG3wZqaexqS8=;
 b=Ev1xzmb0RygzNmjR2B+JeGoM2dK1XralUcGn7M6Dg27mPY4b+sxe5LxlAnSsjiHpjP
 VmG2D1q8mL8Rp2qOJe66J4VGkPrggMRVsdT5mCT5JgbVRJkb8XL5CH0Iv9C5e/y37Vm9
 vqlg9aUr6pT0TlWETtG6xqq1JEesHKvCC5vXx0N4UP9MEGctqDPCjWtmGZWOan5MrFrA
 tODdZgQi3y9axugprcVF53jggdj/aNc5PU5xG97mZwuTwjQ2qSjPpuBBpAmLcYYtx2cc
 THIR5GIgjEFi/yUhPZmfaCg72OEYwBo5MmUNLTtB5JQtlp+7MYcBaaxEuUYqNwzp7LoO
 sMAg==
X-Gm-Message-State: AOAM5324UZXuDeU4aJXpm3+XLSG1iNlnYlGfwUaZufL9Jp7scZjNHwVX
 1d2+XfmqoQKqEd5v6Be5pE6gYB820mdhhRed5c3Okg==
X-Google-Smtp-Source: ABdhPJxMyd3Tk1Xx/NF7xEe5fMcy5kijO93b1+l3PZokJMJcO3QtbyKRnkHALcZ09F8O8ghXXy5DYz1B5d7nrPlJFoI=
X-Received: by 2002:a17:906:3a89:: with SMTP id
 y9mr20451821ejd.4.1613482617671; 
 Tue, 16 Feb 2021 05:36:57 -0800 (PST)
MIME-Version: 1.0
References: <20210123143128.1167797-1-pbonzini@redhat.com>
 <20210123143128.1167797-32-pbonzini@redhat.com>
 <CAFEAcA8R84_-BPG-suKDvkpE1BxG8o1edGv=zfU_CCw27pK4eg@mail.gmail.com>
 <CABgObfZNy_j3DYt3NKKvC1Ou8TW2zACZ2LffnrR7LU8PeS5hww@mail.gmail.com>
 <CAFEAcA_6RiR+ud5U0Y9K3jNmEoQ-Ex8fZN3-o0MkLxpK8PROgw@mail.gmail.com>
 <378df6af-8383-8a51-4286-54739dba99e4@redhat.com>
 <CAFEAcA9-bOggKPjJiZNc3WXD9Uu-TxzDc7NMvUDGgoM7ERg3hg@mail.gmail.com>
 <1a8f0b62-0adf-9360-2365-e9881a6aef94@redhat.com>
 <CAFEAcA8VCGmqbdLFLQ0R9Uun4MzxLTnOZExmYJZ65qZ_fjDUvg@mail.gmail.com>
 <f61447bf-f556-b626-4a6c-f86e724b0f7f@redhat.com>
In-Reply-To: <f61447bf-f556-b626-4a6c-f86e724b0f7f@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 13:36:46 +0000
Message-ID: <CAFEAcA9G7CQDPb1QNaajwG5wSdND-E5nkTox1yEocdsBDsfc3g@mail.gmail.com>
Subject: Re: [PULL 31/31] qemu-option: warn for short-form boolean options
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 16 Feb 2021 at 13:30, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 16/02/21 12:58, Peter Maydell wrote:
> > On Tue, 16 Feb 2021 at 11:23, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >> I agree, and that's why I have no plans to move -chardev off QemuOpts;
> >> warning is a different step than excising and sometimes years pass from
> >> one to the other.  However, that doesn't prevent introducing a warning
> >> so that users slowly move away from the problematic functionality.
> >
> > If we want to continue to support the functionality then complaining
> > about it doesn't serve much purpose IMHO.
>
> It depends.  I don't want to support it forever for all options;
> -machine, -accel and -object are those for which I do intend to remove
> support for short-form options after the two release deprecation period.
>
> My first submission of this patch even special cased "-chardev" to hide
> the warning, but this was dropped in response to reviews.
> (https://patchew.org/QEMU/20201103151452.416784-1-pbonzini@redhat.com/20201103151452.416784-5-pbonzini@redhat.com/).
>   I can add that back if you prefer, since it's very simple.

I agree with Daniel that it would be better to be consistent about
whether we like these short options or not, but disagree that
the answer is to deprecate everywhere :-)

Broadly, I think that being able to say 'foo' when foo is a
boolean option being set to true is obvious and nice-to-use
syntax, and I don't really want it to go away. 'nofoo' for
'foo=false' is much less obvious and I'm happy if we only
support it as a special-case for 'nowait'.

-- PMM

