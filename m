Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F57600B3C
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 11:45:39 +0200 (CEST)
Received: from localhost ([::1]:41950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okMgk-0001Rq-1M
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 05:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okMQz-0003gy-RH
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:29:22 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:44674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1okMQp-0003DB-6Y
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 05:29:21 -0400
Received: by mail-pl1-x634.google.com with SMTP id k9so9808488pll.11
 for <qemu-devel@nongnu.org>; Mon, 17 Oct 2022 02:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GxEGpiSzBHt9BqiFkOcZ5zlKXWHEoNLLevXAafowxWo=;
 b=Kpc5sZNJnO9CwwdgqFNc7oKQBcYHT9ae/Bjl1u46ikkM4MH4bF6j+GshmNjQCXZlPy
 IHaucVX/62ciBC9Ja6LunhhQduPYLU2u38vKKC5TaTKM2DnSNsQexWuDAykvzQIrKqqh
 olSpA8JEHTEhhrusl/LGt97MVy7cLSRhupU5rqK5i64xr2W8QYg2r4hn0qEQ9wR1ERwk
 2rXsUIqMaLkTNET7BYATlpSg4j5BfIsmAh8b051UGrc6hjdmKejnru59MS1gmLLAKMyi
 rZu9xIIu0uAEKwlZHkNMH67W6AZ0584s6w2X/waNFfXRF9i4pgg642PQJklBtfmp3k18
 oklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GxEGpiSzBHt9BqiFkOcZ5zlKXWHEoNLLevXAafowxWo=;
 b=lXQZ2r0p/m3Tvvit8Co0sUaNVJChRMqRVejvmFV/4/ItxoY+P57WKH5IgIqR0RQMPD
 D2265vYroPEJZ5OsLPMnu82MQ1v12vjMbgWUrnYxGJyX8Crf0lKtUWlLxhlOEIZGeM1v
 NgFaEuC4gTuMCamVv/LR3GMUiz5AqkLj+wIZFxsYbCHceJU/2AFDi1UVB/+aBscUXZ51
 4utPv6lu+7coa0kQR+IQuekQ/eQtqLKRZegM+6jz/uYZs7S2MOv7gStikJsJ9wN8MN45
 OFXoW1wQv10aahT5ZOUP8OrhYFj11wn7D8owiLnHUvOYu274cmLby8Q/3KT3NSartkBI
 wmvA==
X-Gm-Message-State: ACrzQf0cPD36pgp6S3jt77uDW89cvQX7wbJE3kcDELswNKZD1s4yEdA1
 WybzcAOgRmBztAZhhYGYbUNh3fua7dX+rYFBncOpoA==
X-Google-Smtp-Source: AMsMyM51AOB0WrRXL+jvrgmy+L/8DCtcmAXW0tHJVZjJrm/ib0nHzR9TOPXF/xVX0dvyivuGdBaWmZ91P+MwGAXuG9s=
X-Received: by 2002:a17:90a:fe92:b0:20a:daaf:75ea with SMTP id
 co18-20020a17090afe9200b0020adaaf75eamr31450109pjb.221.1665998948362; Mon, 17
 Oct 2022 02:29:08 -0700 (PDT)
MIME-Version: 1.0
References: <CALUcmU=x3Vok0oaR-ic3djkgnVG9rxWa3KjWC1xq1KwMXpBBGw@mail.gmail.com>
 <1b3d21a2-9029-6f3a-0579-e08682814222@suse.com>
In-Reply-To: <1b3d21a2-9029-6f3a-0579-e08682814222@suse.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Oct 2022 10:28:56 +0100
Message-ID: <CAFEAcA-PqE4p9vJo3TWmfBdYkGiYfCnxNDJhCAWCM2Y0txGTLA@mail.gmail.com>
Subject: Re: [BUG] Xen build error - undefined reference to
 bpf_program__set_socket_filter
To: Jan Beulich <jbeulich@suse.com>
Cc: Arthur Borsboom <arthurborsboom@gmail.com>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 17 Oct 2022 at 10:02, Jan Beulich <jbeulich@suse.com> wrote:
>
> On 17.10.2022 10:12, Arthur Borsboom wrote:
> > Xen 4.16.1, 4.16.2 and 4.17.0-rc1 don't build anymore in Arch Linux.
> > I believe it is caused by the missing function
> > bpf_program__set_socket_filter provided by libbpf.
>
> That is, qemu doesn't build. That's something to be taken care of there,
> not in Xen, I think.

This should be fixed in QEMU by commit a495eba03c31c96 (May 2022).
Are you using an older QEMU version? If so, then either move forward
or else cherry-pick the fix.

thanks
-- PMM

