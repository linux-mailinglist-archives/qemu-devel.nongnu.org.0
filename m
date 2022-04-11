Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBA64FB918
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 12:08:55 +0200 (CEST)
Received: from localhost ([::1]:48886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndqyc-0002WA-Mq
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 06:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndqvn-00016C-HH
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 06:05:59 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:41529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ndqvk-0003Yf-9S
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 06:05:59 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ebf4b91212so60511927b3.8
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 03:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MQHV92TYlvvoXQVcqqsrVIVfrq5V/AryidSPM1RzZTg=;
 b=G0yq1sVCVC6jd1yP4KvBbj7uBNqFV6De26Jwicy3JYwHT1KUUBcjNCNoe9z0RLA8sU
 z2CmXQyevRIJhNMgP4CScZryHtTJTy45XMjdFVkfTVuXt9ooTvS4cNa2dQHRj3whKcqe
 1n6oKO8TSSPIo8xbWFg/2exjAL7GK+SMaxHaVHx9Xz9g6eGh3bZo0IwRFoC8/rK787hX
 XHfl9BUGUbniim+ekYqLDLKXoFcz+dlVRGiDE2CAvYp3Vb2aAnY+BhpEVNftEJQvCECL
 bAeMEXlxeyxP6MpFdUf09XquLx7HRHCOj2sEENUmq1+w0b44HBvyt2RWIRLOa0GQ/CjW
 py0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MQHV92TYlvvoXQVcqqsrVIVfrq5V/AryidSPM1RzZTg=;
 b=p0uCwB+QHku/QyzIW8rFF8920tJQZsY3cOOU8mLA3tB7RQRYfJCIOjy4zrQLNqT/zx
 BbkyydG7MbosfzDYEarfsRX1eLLy5whsg0zjCy2f0tEva+ZnKk0BmcSA2YxfQbDTKqaZ
 KbpbNCgIKOaxxV6HUa+jwENZENpz2Q0JJjYyeCF3Dt68KdAig7xeagS2VrzC16nbKHAb
 SERkg8peCL4q60dDmI2cPzJb4fFBGEfgh/JUOrbd5ktU0IRPxa4NiufbycIriDLBHy05
 WhX1xhrrGQiQ49zx0Z92emeIuRhkTtK8En8F0XT0UMDod8/Y9dzzehjAqJm+qS7gCZlC
 /7tQ==
X-Gm-Message-State: AOAM533Zg6xRLIybHmWf+Uy6DnYragqvIV/cMjtaz3Z1aj5XhZlodqct
 bl2Bx2S6VMdXwsW40fujhqZun2nKshVLkLsc1WwB/Q==
X-Google-Smtp-Source: ABdhPJy8NNcMHRj3StQ6iLm6lELVsMYXuB8HgOlUz0uuAMjpY36o0f6QyeshkE1X5yDFfHubS0dS4L7L7vgWQAnlRl8=
X-Received: by 2002:a81:db05:0:b0:2ea:2b92:c317 with SMTP id
 u5-20020a81db05000000b002ea2b92c317mr25563805ywm.329.1649671555119; Mon, 11
 Apr 2022 03:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220411065842.63880-1-gshan@redhat.com>
 <CAFEAcA-Tig6PAE4suFnERMN0f_Wco=0UVE7SrWy-Rb7gDheP_Q@mail.gmail.com>
 <a84ed377-2428-11ca-ee17-0dc8debebcf1@redhat.com>
In-Reply-To: <a84ed377-2428-11ca-ee17-0dc8debebcf1@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Apr 2022 11:05:44 +0100
Message-ID: <CAFEAcA9=eSt+R5OmJUn0KwUrWpnZT6C=O1mq4xUefZJXqyXrUA@mail.gmail.com>
Subject: Re: [PATCH 0/5] target/arm: Support variable sized coprocessor
 registers
To: Gavin Shan <gshan@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: drjones@redhat.com, agraf@csgraf.de, Oliver Upton <oupton@google.com>,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Apr 2022 at 10:50, Gavin Shan <gshan@redhat.com> wrote:
> On 4/11/22 5:22 PM, Peter Maydell wrote:
> > So, can you give an example of coprocessor registers which are
> > not 8 bytes in size? How are they accessed by the guest?
> > If we need to support them then we need to support them, but this
> > cover letter/series doesn't seem to me to provide enough detail
> > to make the case that they really are necessary.
> >
> > Also, we support SVE today, and we don't have variable size
> > coprocessor registers. Is there a bug here that we would be
> > fixing ?
> >
>
> [Cc Oliver Upon]
>
> Apart from SVE registers, I don't think we have any more large registers
> whose sizes exceed 8 bytes for now, until SDEI virtualization needs more
> large registers for migration.
>
> I'm working the KVM series to support SDEI virtualization and last revision
> is v6. One of the requirement is to migrate the SDEI events and states.
> In v5, the migration is done by the dedicated ioctl commands and it was
> suggested by Oliver to use {GET, SET}_ONE_REG. Note that the series isn't
> merged yet. So I had the prototype to support SDEI's migration through
> {GET, SET}_ONE_REG. Note that those newly added registers are inaccessible
> from guest.
>
> https://github.com/gwshan/linux/commit/c2e5de5e210de6b003d1e1330eeb0958cf7007f5
> (branch: kvm/arm64_sdei)
>
> https://lore.kernel.org/lkml/20220403153911.12332-13-gshan@redhat.com/T/   (last revision: v6)
> https://lore.kernel.org/kvmarm/YjtYuk+Jx1dFPQQ9@google.com/                (v5)

Could you please describe what you're trying to do here rather
than asking me to wade through a big kernel patchset that's
adding support for a firmware interface I don't know?

> There are large coprocessor register sizes, like U2048, exposed by KVM.
> However, it seems we never support those large coprocessor registers.
> I'm not sure if we have any challenges to support those large registers,
> or we don't have the needs yet?

The general idea of the coprocessor register accessors for aarch64 KVM
is that we're giving the VMM access to the same registers that the guest
accesses via the msr/mrs instructions. Those instructions by definition
access 64 bit quantities. In a few places we've borrowed this mechanism
to define KVM-specific pseudo-registers, but that wasn't the primary
design intent. So maybe it makes sense to extend it to do what you're
trying to, or maybe that would be the tail wagging the dog. It's hard
to tell without more detail on what exactly you're trying to expose
to the VMM here.

(The ONE_REG API is used by more than just aarch64 and more than just
for coprocessor registers, which is why it supports lots of different
sizes.)

thanks
-- PMM

