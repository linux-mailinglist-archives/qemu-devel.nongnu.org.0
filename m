Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 836B64D4E2B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 17:07:43 +0100 (CET)
Received: from localhost ([::1]:36236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSLKI-00072B-2E
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 11:07:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSLIJ-0006CL-9o
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 11:05:39 -0500
Received: from [2607:f8b0:4864:20::b2f] (port=42576
 helo=mail-yb1-xb2f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSLIH-0000l8-1J
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 11:05:38 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id u10so11766406ybd.9
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 08:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fgen6GqxRzqmfAnAuAPtEs0exSltyoaQR9dNpgN5BQk=;
 b=i0eKt8Eg/qX1/cUrnwggeMvbl7/XkEUKZzjoMnl0kCf4kBMXxJ5UV5FCE/TCP9Fa3G
 scSnzXItpJ2BeAR6J7Kcwccc+dKiZZAnlJoTut+gn2jzrh+g90IN9rnS46cYXESsT41z
 6gW5fHSqb2uPdPUFZvFjGytoUd/pSauiixlqKhQJFIAGtlSrVztyD2ijDyKxTRL/N95C
 UZ4jScAWe+OPH4Y7aYKxqzgJey8vSda7LL2Zk3VO+oH/Hv9hVH6i15gYJtnyf19wYOhU
 LXPbbnNUBPo/l1JmZW0XcNIOKFRcmFvU8UrFwoCzRpVbAja7eZJYWFkh7u+cCMieQJ7f
 qQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fgen6GqxRzqmfAnAuAPtEs0exSltyoaQR9dNpgN5BQk=;
 b=NnnCnAT4mof014/hcRc6AlL6gB7XQcZUK4yPwH7MSFj8jod9o7STXdB2MSzobShzqc
 hGfcFZqlI+fQ7PpQSbYvZMxCQIjcCvCnobNSMeQgGcQr5jNgpS9PIB3McI9eFMr8O1wE
 JOIhDhvmSHkFjFRRtgyNNYR/O0F9AVTjSVmKe3jDKIGB3ZuLOvzhSze2DA0tYwOzHORV
 SB+CtXWI7JeUrj5HrIMhMHHVPLM0fpPayOMVVmibjt7DutervUwiWkkfDcFjzJ63ClHg
 G0FZGzxdeXkYPIrBU044mI6VpJDErukxH/RgmOmc4M0Li2ns4hzIQ6XZpIzKeRh5coEt
 8cLw==
X-Gm-Message-State: AOAM531NvcKEsdGhLC6p7PucqgbA6MrmcosEzXa3UfGc+k3C5CklVe3j
 KMvl4um20Cn3iphcTN3N4Y6kAp3ynZFk+nweWCmXMMu/iuzAHQ==
X-Google-Smtp-Source: ABdhPJz4ty89H5rPNWPSDIX3o4ZfJ3iPmaZ5oUA9yasq6SkcPMJ9WYqt1mw4YmIlPFve4/82BUQC8HmJuS335dmbLJw=
X-Received: by 2002:a25:d181:0:b0:629:1919:d8e5 with SMTP id
 i123-20020a25d181000000b006291919d8e5mr4402848ybg.85.1646928335981; Thu, 10
 Mar 2022 08:05:35 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA87VaeHzW4qbHn+UKjh9gMQbKNcN5ytXBS1MUPSapdhYw@mail.gmail.com>
 <4eb4bb05-814b-c28c-c2f4-0f5f5582301b@redhat.com>
 <CAFEAcA-Wg5LKVRQ4dKX6Hsyb=1VVxfGBDB_=Q6iCxycJzLPRhg@mail.gmail.com>
 <CAFEAcA8ytELEkGfwCV3WEZYCCtYdyG9_2uANk8UXGV-=iOnfqw@mail.gmail.com>
 <20220310163610.7f782922@redhat.com>
In-Reply-To: <20220310163610.7f782922@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Mar 2022 16:05:24 +0000
Message-ID: <CAFEAcA8Nvr-7QYHv2-K+zN37i=ZXa8_Skb53PaTJzSdhXaBq3g@mail.gmail.com>
Subject: Re: QEMU device refcounting when device creates a container MR
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Mar 2022 at 15:36, Igor Mammedov <imammedo@redhat.com> wrote:
>
> On Wed, 9 Mar 2022 16:56:21 +0000
> Peter Maydell <peter.maydell@linaro.org> wrote:
> > ...also, in the device-introspect-test where I see this problem,
> > unrealize is never going to be called anyway, because the device
> > is only put through "instance_init" and then dereffed (which
> > does not result in instance_finalize being called, because the
> > refcount is still non-zero).
>
> question is why introspected device is deferred instead of being
> destroyed if it's no longer needed?

...because the reference count is not zero.

What is supposed to happen is:
 * device is created (inited), and has refcount of 1
 * introspection code does its thing
 * introspection code derefs the device, and it gets deinited

This bug means that when the device is inited it has a refcount
that is too high, and so despite the code that creates it
correctly dereffing it, it's still lying around.

thanks
-- PMM

