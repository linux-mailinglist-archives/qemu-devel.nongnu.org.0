Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 087B331C876
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 10:59:42 +0100 (CET)
Received: from localhost ([::1]:53604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBx8u-00058X-TM
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 04:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBx7e-0004eU-By
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:58:22 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:46312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBx7c-0000n8-SE
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 04:58:22 -0500
Received: by mail-ed1-x52a.google.com with SMTP id y18so11281013edw.13
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 01:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GYQqK7Aon3YeSuHvmpcvmc+GFN2Pf27U8Z4kx4l1Le8=;
 b=Svh5ZcPXPu3+scMnppF1FpsjLKewQpHEAbff9DrcVXBfo8pY2ZrUn0VB6Mzqrdw0Js
 FQn4gJzXNLyAzEj+LB23PSqlvcTSF545FDzJxw2BtlWIaEoAhzeAyYILmS4kiWK6wyHG
 blbVuUhtMMDIXmeV57NJDeKmuVsyY/aXhjNXeTKjfT/ny37szY50XNL0y65/j+fjYBB2
 qJS1tXBsCab0FnBlj/PmpzfgfPNV5/ihaRuDQwh4vPwPGZ+zQOeYz9bUMvBanlD4SRqa
 yMYFAOlYypo6/m2bbfGkRb+WBm5jSwyBSTOpS5KCGTJe6pZU3R8SCfGdshOLByRhWLSt
 friQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GYQqK7Aon3YeSuHvmpcvmc+GFN2Pf27U8Z4kx4l1Le8=;
 b=ieTFgcYpJZ+MecxBPnPoOk88K7m7iuvghABBsD1YSeCE+mj7B/u8ljU/KpCPVWjdqW
 RJHEGSKLiObVnUMuhrUjW6IpuKhHjvdTLINDzF6dE0kHok0rT90hgIZiHdt5csw8SgHx
 YVc6hxaWT3QmSDN1Nays+IF7DcNKAxCk10HPruBXlX2DTdbR6q9swz6rYU4Tuk/XjhVx
 GRwVSAt7LbGOUxRXjlMgR78eOdcX3Kky01BRWgoEgmjvckNkbohapX6hV4pBtqaCszop
 8jwfcwuhfyZABI54t1FuGo7SsbKEnRsrb+hpmwU6JYd3IlhfWEtreQr+f5j3OWKoMHJ6
 XESg==
X-Gm-Message-State: AOAM530wLigYfP+DAZZD/tY9KHPaFbgXWhQq7PH1S26WeUQV0TAeY0sy
 uHeRen0kvIRNTm1WTWStMcGyLPeFK6rAOjQN1Thlyg==
X-Google-Smtp-Source: ABdhPJwU84llrcUBhkEcAxAg5F34bmFtI1DqRItQyiUZ4hvk/KVPC6DWxmdATG+eouT7wL+gPlDtsd5QhNW7FELgT8s=
X-Received: by 2002:a50:9e01:: with SMTP id z1mr19886194ede.44.1613469497284; 
 Tue, 16 Feb 2021 01:58:17 -0800 (PST)
MIME-Version: 1.0
References: <20210123143128.1167797-1-pbonzini@redhat.com>
 <20210123143128.1167797-32-pbonzini@redhat.com>
 <CAFEAcA8R84_-BPG-suKDvkpE1BxG8o1edGv=zfU_CCw27pK4eg@mail.gmail.com>
 <CABgObfZNy_j3DYt3NKKvC1Ou8TW2zACZ2LffnrR7LU8PeS5hww@mail.gmail.com>
In-Reply-To: <CABgObfZNy_j3DYt3NKKvC1Ou8TW2zACZ2LffnrR7LU8PeS5hww@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Feb 2021 09:58:05 +0000
Message-ID: <CAFEAcA_6RiR+ud5U0Y9K3jNmEoQ-Ex8fZN3-o0MkLxpK8PROgw@mail.gmail.com>
Subject: Re: [PULL 31/31] qemu-option: warn for short-form boolean options
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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

On Mon, 15 Feb 2021 at 23:15, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Il lun 15 feb 2021, 20:56 Peter Maydell <peter.maydell@linaro.org> ha scritto:
>>
>> Alternatively, maybe we could not deprecate this really common syntax
>> pattern that's going to be in lots of peoples' examples, tutorials,
>> shell scripts and command lines ?
>
>
> Unfortunately there is no way to change the code to distinguish okay
> uses from broken ones. The fundamental issue is that QemuOpts is
> sometimes typed and sometimes not, so it lacks the information to say
> that "-chardev socket,server" is fine but "-device virtio-blk-pci,noserial"
> ("set serial number to the string 'no'") is not.

That is definitely a nonsensical example. But it's not clear to me
that it's an improvement to start forbidding previously sensible and
working command lines in order to be able to diagnose nonsensical
command lines which it seems unlikely that anybody was ever actually
using.

-- PMM

