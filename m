Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 630F466E300
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 17:04:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHoQm-0002qi-6h; Tue, 17 Jan 2023 11:03:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHoQV-0002lw-91
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:03:07 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pHoQP-0002Bw-8O
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 11:03:02 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 x2-20020a17090a46c200b002295ca9855aso6668496pjg.2
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 08:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=werl2WV4XexszKNFGTltNvTkij81DjKUDbHjec/VS9o=;
 b=RckeIScZN5JJnEHZkuB1wY5xGA+x/lWi9KVoZtySYM2tse/Hbndx/ha2LXRaTPpao2
 TYPNIYyAvvj2lTvDSKfPUfT+JqF+FCBwvRffwUEKV70Sj4UezMUld9COHfkIZCgMvk5f
 QrFGu8nEtK8WsEu4Y9HaTCbYQkpZHe6AP866aqpNWvbDXuUROTSodnLFQHrU2A+g5FwI
 XmpH/VTVUkCNBJQHJZ5rNLQaUORpBP1yYdAh/eHe6reNAOlo02lzj0Pl8QE25gVYFhyI
 PE83T8mgSJeOZKwRQ+9bxzw4AIoCr0fGX8L7mYUMC9ErX3PVBSe9g7z/dGhCUNDN81dz
 F+Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=werl2WV4XexszKNFGTltNvTkij81DjKUDbHjec/VS9o=;
 b=ddBbP1ElOREQRm+G4eY9O1Q43lzdfcu4MLUfdjnd5gmslU8ZRtCChMLEyfFBkkZX6n
 l5r1Cehot1jxWa88uAPXrLnl1wywFWoFuABLKpVCrEKhnRjC2EcGVGgu+A6i8kzp3qpc
 vIX2k9cXVol+wmbFRNHOa6HycmXt2DW7R1FJCMkMekFcPkzhLU9P/S0bNGYcm4z2SKBY
 zDFGVrTKKpUDRwojl1NSqiwyn7vDDRxos2FNpY3KUx6ZynHQ+5RXlnzEQa9K81EiJfzQ
 44iUlUwWfS8kYEHUdOcnN4+ww6fSYCS5GihKPXkeWZltmtYwYwoJ2Cye8wZ9lSh43JL5
 5wcg==
X-Gm-Message-State: AFqh2koWsukYe4WmUcesr8DRCCc96yFBjInwUZvZkei443dHkadT18Bw
 cSlGdrxbp1hLxwQoECrBZmpw/FzchP+Mh/0Bv0HAGA==
X-Google-Smtp-Source: AMrXdXtNC4+QEg61gNVCL9n4JNzlu0qODCjo6wn+GOPNz7zQvJo6bCwq/5RzbFAiCsXrZRt92LXOpNqFiFzH4IUOY5c=
X-Received: by 2002:a17:902:bc46:b0:194:45d0:3b2c with SMTP id
 t6-20020a170902bc4600b0019445d03b2cmr345574plz.52.1673971379707; Tue, 17 Jan
 2023 08:02:59 -0800 (PST)
MIME-Version: 1.0
References: <20230106172851.2430-1-eiakovlev@linux.microsoft.com>
 <20230106172851.2430-2-eiakovlev@linux.microsoft.com>
 <CAFEAcA-VkWjSO84dCmoeKaO0PEFydi7Bj2gXhBYDatGpuCuc_w@mail.gmail.com>
 <f5af2eee-e04e-fadd-8bad-b9ec4a2a1998@linux.microsoft.com>
In-Reply-To: <f5af2eee-e04e-fadd-8bad-b9ec4a2a1998@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jan 2023 16:02:47 +0000
Message-ID: <CAFEAcA-UuXdF5-akaiu0Nsg1c4T6pnQbpBh2pDK0gpc19+RrGw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/char/pl011: better handling of FIFO flags on LCR
 reset
To: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, marcandre.lureau@redhat.com, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1030.google.com
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

On Tue, 17 Jan 2023 at 15:54, Evgeny Iakovlev
<eiakovlev@linux.microsoft.com> wrote:
>
>
> On 1/17/2023 16:24, Peter Maydell wrote:
> > On Fri, 6 Jan 2023 at 17:28, Evgeny Iakovlev
> > <eiakovlev@linux.microsoft.com> wrote:
> >> Current FIFO handling code does not reset RXFE/RXFF flags when guest
> >> resets FIFO by writing to UARTLCR register, although internal FIFO state
> >> is reset to 0 read count. Actual flag update will happen only on next
> >> read or write to UART. As a result of that any guest that expects RXFE
> >> flag to be set (and RXFF to be cleared) after resetting FIFO will just
> >> hang.
> >>
> >> Correctly reset FIFO flags on FIFO reset. Also, clean up some FIFO
> >> depth handling code based on current FIFO mode.
> > This patch is doing multiple things at once ("also" in a
> > commit message is often a sign of that) and I think it
> > would be helpful to split it. There are three things here:
> >   * refactorings which aren't making any real code change
> >     (eg calling pl011_get_fifo_depth() instead of doing the
> >     "if LCR bit set then 16 else 1" inline)
>
>
> Yeah, tbh i also though i should do it..
>
>
> >   * the fix to the actual bug
> >   * changes to the handling of the FIFO which should in theory
> >     not be visible to the guest (I think it now when the FIFO
> >     is disabled always puts the incoming character in read_fifo[0],
> >     whereas previously it would allow read_pos to increment all
> >     the way around the FIFO even though we only keep one character
> >     at a time).
>
>
> That last part i don't understand. If by changes to the FIFO you are
> referring to the flags handling, then it will be visible to the guest by
> design, since that's what I'm fixing. Could you maybe explain that one
> again? :)

I meant the bit where the existing code for the FIFO-disabled
case puts incoming characters in s->read_fifo[s->read_pos] and
reads from UARTDR always increment s->read_pos; whereas the
changed code always puts characters in s->read_fifo[0] and
avoids incrementing read_pos. I think your version is more
sensible (and also matches what the TRM claims the hardware
is doing), although the guest-visible behaviour doesn't change.

thanks
-- PMM

