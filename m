Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 131BD4451EF
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 12:04:16 +0100 (CET)
Received: from localhost ([::1]:58318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miaXX-00058D-80
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 07:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1miaWZ-0004DI-BJ
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:03:15 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:41825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1miaWX-0005Gh-3s
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 07:03:15 -0400
Received: by mail-wr1-x436.google.com with SMTP id d3so7930550wrh.8
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 04:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dWEHeUTSXKX1B3NXhSnOUlID1VS4JEnYRyDdFa0dRjg=;
 b=aAURbAGyN+1inXcg2IdR6zshf5ofAxztEuPmoZlkZTkGtEViZFNb/8OEJvIOj25gN8
 raDwwjRAQEOnM0mMT6BhEXFEIBEDIgDavud1p7xUDoFjYVaNcKkKBLJpZwCROmK/4IWX
 mAV6QT448C7Rs76ocYtQqQJvO74nFaKl3KxQExIOyatYpbEuMDYk/elHKDarCn8LIDGm
 91py0Gi0dBRuQGRDeJfXq/YTmExTUmjWpiFmjH0U9FcdNK2JLrrPXYBlF33+8Xe0qoZ8
 in8UEo3PN7nIveMtHcuZN+kZde9KzIoWdstXRy8cqw/AZGcRD+pJ8jIsXHedvFqpzyKW
 vTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dWEHeUTSXKX1B3NXhSnOUlID1VS4JEnYRyDdFa0dRjg=;
 b=TP4/xDo72ioi3tSIdNDWbn6setnc9mH5t+KFADgqiV5VQoqR2WSB9EHNZvH80FWLPl
 UdYSb9C6iau3dLC9AonwYwavjq2dZFyWKZdptrhyzbFGbSWtu+ODvwMs9O94xn49SByM
 h3vXS05Hu2zfiSJiqrjqT8BFw3ateXw82X9dL87JrgtCcg1kdtDx7ee1h8wkfBxfT8XN
 cmpDbv0W2g0wxV/l2pUBU1EmG6kdTadTWgzGb+VhOeCq9V5kocc6d+huCW3+EJ8QL/zE
 axHnu7P+31Jai4xSYUMv9PlysWykl/z69Mk4WOaxQ7aPLfSthuaP4U1i1dWyxMWbJpuO
 yBaQ==
X-Gm-Message-State: AOAM53363ynY8rcg9s+ILh2SwWzXsJYIsnV0PmYbx2p5V7Px3Zf2alhi
 ppn8uyk6zb7QHtmG5vk2KJg+kBumtoxNRA/fZg4RpQ==
X-Google-Smtp-Source: ABdhPJyV+ve2i0BJCYi6wJayAIz3E/6SL4sCaLtupFbyH4ZNRlRX3xzlVDWfVkequu/802Lfb9Cx0owKgte3ioT+lDQ=
X-Received: by 2002:a05:6000:186e:: with SMTP id
 d14mr11618226wri.376.1636023791065; 
 Thu, 04 Nov 2021 04:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA9ha4G=AC3p9LKJRC87DkgHVqbrX3X8RPg7vVR_F1Kt1Q@mail.gmail.com>
 <CABgObfaXJZ1E5593HHMEyhXHVKNu85=KSOhg7VXbt93cKA8fvg@mail.gmail.com>
 <CAFEAcA9KF1437LXv+icrizZYcDiNZPn4KRMd0r7rEZWtDKxjpA@mail.gmail.com>
 <e5eee498-85a4-2f22-2580-9bcd6621f746@redhat.com>
In-Reply-To: <e5eee498-85a4-2f22-2580-9bcd6621f746@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Nov 2021 11:02:59 +0000
Message-ID: <CAFEAcA-F-f7TcmbtZTJ8O0q9Ebxf-7aLHbawQCz-jQ5q8xgFRg@mail.gmail.com>
Subject: Re: more bogus meson warnings
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Nov 2021 at 13:38, Paolo Bonzini <pbonzini@redhat.com> wrote:
> On 11/3/21 13:19, Peter Maydell wrote:
> > They're two tests under the hood, but they both need to pass
> > for us to be able to use the feature. If they don't both pass,
> > then meson should just quietly say "OK, we don't have this thing"
> > (ie it could print a "Something or other: NO" line, but it should
> > not be printing a "WARNING" line).
>
> Of course it's possible to downgrade the warning line, but I'd rather
> first be sure that the warning is bogus.  If you _do_ have a header and
> static library, but somehow it cannot be used to link the test program,
> it would be correct to warn.

I don't really agree. There are lots and lots of things that
might put the user's system somewhere between "there is no
evidence of libfoo here at all" and "there is a working libfoo
we can use". We don't in general try to diagnose any of those,
we just say "no libfoo, move on".

> Unlike the configure script, Meson does
> have code to distinguish static vs shared libraries, so the compile test
> should be unnecessary; I would like to understand what causes it to
> fail, so that your system says "Library snappy found: YES" (and warns),
> whereas mine says "no".  I can check that using config-host.mak and
> meson-logs/meson-log.txt.

https://people.linaro.org/~peter.maydell/meson-log.txt
https://people.linaro.org/~peter.maydell/config-host.mak

The link of the test program against libsnappy.a fails because
it is being linked with cc and nothing is putting the C++ stdlib
that libsnappy needs on the link line, so you get errors like:

 /usr/lib/gcc/x86_64-linux-gnu/7/../../../x86_64-linux-gnu/libsnappy.a(snappy.cc.o):
In function `snappy::internal::WorkingMemory::GetHashTable(unsigned
long, int*)':
(.text+0x15b): undefined reference to `operator new[](unsigned long)'

This is (I suspect) another example of "distro does ship a
static .a file, but the shipped pkg-config file is only good for
dynamic linking, doesn't work for static linking". There's generally
nothing much the user can do about this, beyond file a bug report with
the distro if they're feeling enthusiastic.
("pkg-config --static --libs snappy" just outputs "-lsnappy".)

Note that Debian/Ubuntu pretty much always ships the .a
file in the libfoo-dev package, so "there's a .a file on the
disk but the pkg-config might or might not work" is pretty
common.

-- PMM

