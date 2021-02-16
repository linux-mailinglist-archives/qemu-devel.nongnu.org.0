Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A1D31CB9B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:12:37 +0100 (CET)
Received: from localhost ([::1]:60472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC15d-0003Ut-NS
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:12:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC14v-000343-3R
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:11:49 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC14s-0000QR-TY
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:11:48 -0500
Received: by mail-ej1-x62d.google.com with SMTP id g5so13272915ejt.2
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 06:11:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=57bzBjX21HVfgr9TD0he0mYCvSPczHTOuCqQTyMsEcM=;
 b=ljqVLHvb4CFg+jYk7G3yYnDjBLdeY8227Vdv4KxxadJuXKBpheMZDCvFPRBKSg0KDL
 ukMTRYmXqrj3A91n2t1QB1+IN5hAqanRYIFVQX6/gXUYIq8Me9+5T9GBtfmJexwtfKWa
 68oc3tYwpymyI+AvjTSWtRNC7RxxR+KGVnUATo+NLJlYNwXbhVGMbrFn23r8gBC0b/hN
 SwxFcqGNxgC13fph4leVmRbaN+Ug3HJACMuQ+M2ti48ZX7v0BKxSUdaIKpUYQr+MwTBT
 ghHn5tMcpJWsALIds9y/pK+NNUl83dGwSs8DZEYxB9Ke6Uc4+GMhCUP/MhwPDBuljELe
 5bjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=57bzBjX21HVfgr9TD0he0mYCvSPczHTOuCqQTyMsEcM=;
 b=U6d6GZTyzUwX+nC8dXtCt2A3Cn3ZIKBbfzE/cKE2NsFukhDw4r1X7YJRjdIgjwMEFX
 au5hCzuhrJ6d33MsdbTCHU43uncJc+a12ciVtOTOdM6kztHFTZZdehoMcl/nOenW6zlZ
 0Jub+F9YSP3E1z62kUA2p2KIS7NcK0RXzc0/bV2XFqOZV1VYFf/VErqYPKXNWVJqBUq0
 VD1eoHaRlxvdZsc7fjSOgGFChFqwhqxrLmuRnWyNqpi7SmDne68gSO9AgHzOCttGheqR
 lE3mecFnvSxeQ6WeiWwA06TeOiVdX/ucJMfFIEWg2wP/osoJC/EOQN4YqKbnncRgYYWp
 vJ3Q==
X-Gm-Message-State: AOAM53302za1XaNZnVbtHrHYwgQHD8XKXeHAQCVIS9v3YNMg2/7u/F9a
 5LOtjr8/J1LsUTZe8YW1mz73yF2ZgSU7JKBEnv9M1A==
X-Google-Smtp-Source: ABdhPJw6/Zm+/fpRIegLJprww6fjCfhakRPbg9pAY/ZPidwwgSmN3Ipqbg0fi5rvddgndrKFxiLsyueykaCLZlApHZg=
X-Received: by 2002:a17:906:184e:: with SMTP id
 w14mr20992210eje.56.1613484704862; 
 Tue, 16 Feb 2021 06:11:44 -0800 (PST)
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
 <CAFEAcA9G7CQDPb1QNaajwG5wSdND-E5nkTox1yEocdsBDsfc3g@mail.gmail.com>
 <9f9999eb-66a5-3fe4-64fe-41f64edb49ff@redhat.com>
In-Reply-To: <9f9999eb-66a5-3fe4-64fe-41f64edb49ff@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 14:11:33 +0000
Message-ID: <CAFEAcA9c01xj0bGcKai-wOeR_c67+Uvcse1Xn=tbYRE7tjwhSw@mail.gmail.com>
Subject: Re: [PULL 31/31] qemu-option: warn for short-form boolean options
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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

On Tue, 16 Feb 2021 at 13:44, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 16/02/21 14:36, Peter Maydell wrote:
> > Broadly, I think that being able to say 'foo' when foo is a
> > boolean option being set to true is obvious and nice-to-use
> > syntax, and I don't really want it to go away. 'nofoo' for
> > 'foo=false' is much less obvious and I'm happy if we only
> > support it as a special-case for 'nowait'.
>
> It really depends on what the default  "-M pc,nographics" arguably makes
> sense too (more so than "-M pc,graphics" since true is the default).

Is anybody using 'pc,nographics' ? google didn't find any examples.

> Likewise for "usb", where the default even depends on the machine type.
>
> How do you propose to resolve the issues and ambiguities in the grammar?
>
> 1) due to QemuOpts not understanding types, you can specify "serial" and
> get "serial=on" instead

We should fix this by plumbing through the type information,
so that we only allow 'foo' to mean 'foo=on' if foo is really
a boolean (or other type that specifies that it has similar behaviour).

> 2) with a parser that understands other types than strings, you would
> not be able to specify "-M kernel-irqchip" because it would be converted
> to the boolean "true" and not the enum "'on'"

We should decide whether 'kernel-irqchip' has a type that
allows 'no parameter specified' => 'use this default value'
or not, and if we go for the latter use whatever default value
the backend expects. (And probably "boolean-and-an-extra-value"
types should allow the boolean bit to be specified in all the
same ways that a plain-old-boolean is.)

> 3) one is not be able to specify "-M pc" -M usb" because the second
> kernel-irqchip would be interpreted as a machine type?

I don't understand this one, I'm afraid.

-- PMM

