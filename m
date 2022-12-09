Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C915A648137
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 11:59:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3b5w-0002P1-U1; Fri, 09 Dec 2022 05:59:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3b5u-0002OE-FJ
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 05:59:06 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3b5s-0003Iw-UL
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 05:59:06 -0500
Received: by mail-pg1-x52c.google.com with SMTP id 6so3292117pgm.6
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 02:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eW5FWYNRAGHlbRGDImGhBI2CpPAoEk+OUrnDEdgEO9M=;
 b=dVMB1zo2K7Ws9nSq4GXKv1qUxDKaN4+RnYcNX3WG04foWAjJh0K0fOIMCNcw8pq2Qa
 0EcqUAmD0gFCRkdC/xqfLWVyq9zoMcHxsLE7fR8SE+Yp2XX/AsFhLMplm9EnzwkL2sLL
 HWSLNKQ5Sj6mo9abIwltdl/dd/PWi5VIjh+jU2nxiZJa0lrdq75beI3WiDSmIBUoAD0/
 mQtk5z/jRJJgAIdwLmdsutdseRlkf4KEB+ldDTbBZITeIVnj8AezjnA8UerCQv7zXqkU
 uOTXgCs0OS0u+EVVj+X+PlH8p6kal6XJCb+HRNl/lt2AB65Rf62y3HfQuHm+wWbvi67+
 UCXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eW5FWYNRAGHlbRGDImGhBI2CpPAoEk+OUrnDEdgEO9M=;
 b=XBHi63lICWSOyFQ+7Pa72TkVnmHJbuH8O2kmgVJV0E3LSOAW4otLQ2kbgynH6LVtiX
 slayAUyxM6vAMUj6vnHR+4EMOOu8U9RcR28zy57AuTf28lPqQFXCw4TF/cbdqV7ksX/Z
 2Jtap2+jZ2PLsLv20zSGo3mlaN9tlwTZEKkVxUU/6O0Yoky05agthRUmT9HXlGeFdc6+
 hRDsii243yj14VP1MA4hYK/LKnzr3diZmBBVTthYrFaEJERFCb8+BR7FoG5AxhFuTC2R
 KFPnhzoEr14oOhefaWJz9MLTUX8oDYgMijimyF8IwfgQL7vIHahv7q5VlwUkS8X9/X0U
 Lg7g==
X-Gm-Message-State: ANoB5pnAcGL1ctn5TFHtClF2h0OwweU0dVxuYAVQBnV1PswHjoPFZ4Dn
 YaO0JwGUuusRdOuHDpWdh9LI0V5EUhAmgj0vHvdyiw==
X-Google-Smtp-Source: AA0mqf6LetaBuZoNRjF1vDvaiqawum4PLSWOukDDkeGMAG6hMXSrL9X0Ynns/DTXKJwxVwU5+GWb0VW0VB7ufFQqWAE=
X-Received: by 2002:aa7:8502:0:b0:576:9786:94c2 with SMTP id
 v2-20020aa78502000000b00576978694c2mr24365097pfn.26.1670583542989; Fri, 09
 Dec 2022 02:59:02 -0800 (PST)
MIME-Version: 1.0
References: <166983457648.13115.4940680286975412418-0@git.sr.ht>
 <CAFEAcA8csAbbdvLoq+202CAQ0PLWdHaBTfADtqx33c=DNU-wSQ@mail.gmail.com>
 <c31be243-e380-eabd-f387-0b0923d4f6c1@gmx.de>
 <CAFEAcA88QfXmos_vCMGnDsmH7L22jtMz+-MRrMimObhDaFrwXA@mail.gmail.com>
 <2cbdc0b8-ff8e-f6e3-379a-82d25ad43514@gmx.de>
In-Reply-To: <2cbdc0b8-ff8e-f6e3-379a-82d25ad43514@gmx.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Dec 2022 10:58:51 +0000
Message-ID: <CAFEAcA9h36KgFh9HHzF-YGmL3LLT3L9S74qhfv85d_8GdOOUUw@mail.gmail.com>
Subject: Re: [PATCH qemu.git 0/1] hw/arm/virt: add 2x sp804 timer
To: Axel Heider <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
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

On Thu, 8 Dec 2022 at 17:25, Axel Heider <axelheider@gmx.de> wrote:
> >> For the seL4 specific case, this is currently not possible in
> >> the standard configuration. It's only exposed for a special
> >> debug and benchmarking configuration.
> >>
> > It's not clear to me what you mean here -- the generic
> > timer in the CPU exists in all configurations, so there
> > should be no obstacle to seL4 using it.
>
> Access is not exposed to userland in the standard configuration
> and the standard kernel API has no no timeouts besides zero and
> infinite. It's a design thing in the end. Nothing that could not
> be hacked around or be changed in the design in the long run. But
> my goal is not to hack around, but have a "proper" machine
> simulation instead. Which basically falls down to having a generic
> machine in mainline that has a few more customization options.

So, my take on this is that I'm open to adding things to
the virt board where we don't provide a feature that's
useful to guest code. The second UART falls in this category:
it lets you do things that you otherwise could not do (like
have one UART for firmware and one for a kernel). On the
other hand, this case with the sp804 sounds more like QEMU
is already providing functional timer facilities and the
problem is on the guest software side. To me the "non-hacky"
solution sounds like it is "sel4 should provide a better timer
related API to userland". I don't really want to work around
guest OS deficiencies in QEMU.

thanks
-- PMM

