Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B60B62CA24A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 13:12:58 +0100 (CET)
Received: from localhost ([::1]:55512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk4Wf-0005T4-Oc
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 07:12:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk4SY-0002eh-DP
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:08:42 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:39807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kk4SW-0003Mv-Pl
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 07:08:42 -0500
Received: by mail-ej1-x644.google.com with SMTP id pg6so3614219ejb.6
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 04:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/M6qTRcb7ooypOLbSQABaMQfCmtDYaK+udx98ET3zE0=;
 b=jgCyEL4GxykEGe6r0UMTPCaWikmwu2ELKKt7Sx6CWSLhNPAhlZocJgF+mBXShMebh4
 FxA9ofaFQSCqEjipdvKk1dTg02CnPU5hHUXSTwH/tG6s+atndbczLMtsbWzaXEiq7UsI
 RRmI+i+AEU6WBhrLTh4pc+CrTRxt0ykBj7qbcQ8sODFGWsSl6ptB1lr8KJXlXlQFJmae
 lD22gINGZEfCq8dtKw6LSq8Hdw+twQqVftEBoItujquzL6+8tZGzMcAqn2bdmey+Hq/A
 93zL9ZCvfUBfrlud7VyCsY4wFpftxqyk9CSx4EwAa21jwoStddERz3Nz/Hsojtq5kj7J
 Q6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/M6qTRcb7ooypOLbSQABaMQfCmtDYaK+udx98ET3zE0=;
 b=ZMWGbwuVtGiAXcQVxwHf9DTN7CY0kUw2LO1wJovQg2OjHRQgz/HxUntpIabWbe2Duj
 s80MIXUb8iMhMKsd6YAGCOtudl+usKBdP7emUivsq/qEvaeRktrh/Ug+9c8a0Kjo8Q24
 TB7NanBf/qpWEt123u9l/4P5n49dUouYobnFcm+KTRtkoG8SDCHag53sG2lhJbi1Ev0w
 eor/vFcpCSI2zkWxf6ciRETlTt78mxIZ64jLkZh9Pdnb/YpYM+J4oxeIOh5ewcsLDu7p
 lRKZnZhf5U0Rgo96wgDZAeUwM8QtLfqhUAPbLvJ9gLiI0c1i9+0Dqj6YqTM3T/jbc9Xz
 IHOg==
X-Gm-Message-State: AOAM533tI0NVqJCwRq+/Rxli/3sW/tDFJur5SwBXDYcTyBdo8SpdHCDf
 h0no6ZCD2lhOK/GgH/hHrZ9sigreN/2dZodplZliBw==
X-Google-Smtp-Source: ABdhPJxEiWo1Tv+TW4J5r8DZAK6hUJecW72gylq3kLnK4od8ArvYvpKXzxlfh0l7i+n56+FxpQF+Zyhy51wNrSwiYaI=
X-Received: by 2002:a17:906:1542:: with SMTP id
 c2mr2528306ejd.382.1606824519416; 
 Tue, 01 Dec 2020 04:08:39 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605316268.git.ashish.kalra@amd.com>
 <eeb1393a933c5443941ae795478a7bc33f843cf1.1605316268.git.ashish.kalra@amd.com>
In-Reply-To: <eeb1393a933c5443941ae795478a7bc33f843cf1.1605316268.git.ashish.kalra@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Dec 2020 12:08:28 +0000
Message-ID: <CAFEAcA8AW-jQXHeDuNHq1AHe=u8z_JtgP5gvLnz3vHvXR0uBzQ@mail.gmail.com>
Subject: Re: [PATCH 03/11] exec: add ram_debug_ops support
To: Ashish Kalra <Ashish.Kalra@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
Cc: Thomas Lendacky <Thomas.Lendacky@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm-devel <kvm@vger.kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, ssg.sos.patches@amd.com,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 16 Nov 2020 at 19:19, Ashish Kalra <Ashish.Kalra@amd.com> wrote:
>
> From: Brijesh Singh <brijesh.singh@amd.com>
>
> From: Brijesh Singh <brijesh.singh@amd.com>
>
> Currently, guest memory access for debugging purposes is performed using
> memcpy(). Extend the 'struct MemoryRegion' to include new callbacks that
> can be used to override the use of memcpy() with something else.
>
> The new callbacks can be used to display the guest memory of an SEV guest
> by registering callbacks to the SEV memory encryption/decryption APIs.
>
> Typical usage:
>
> mem_read(uint8_t *dst, uint8_t *src, uint32_t len, MemTxAttrs *attrs);
> mem_write(uint8_t *dst, uint8_t *src, uint32_t len, MemTxAttrs *attrs);

We already have a function prototype for "I need to call a function
to do this read or write":
    MemTxResult (*read_with_attrs)(void *opaque,
                                   hwaddr addr,
                                   uint64_t *data,
                                   unsigned size,
                                   MemTxAttrs attrs);
    MemTxResult (*write_with_attrs)(void *opaque,
                                    hwaddr addr,
                                    uint64_t data,
                                    unsigned size,
                                    MemTxAttrs attrs);

Do the prototypes for accessing guest RAM that needs decryption
really need to be different from that?

thanks
-- PMM

