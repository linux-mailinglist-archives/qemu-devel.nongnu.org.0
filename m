Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51168337943
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 17:26:07 +0100 (CET)
Received: from localhost ([::1]:55204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKO8U-00051X-CQ
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 11:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKNll-0001Fs-Hg
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:02:37 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:32834)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKNlj-00043R-IL
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 11:02:37 -0500
Received: by mail-ej1-x634.google.com with SMTP id jt13so47326361ejb.0
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 08:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xpuvIhnTyLj3u0gKnS/722TUFWYedGu3c43M4i1wwOA=;
 b=TrTqTT1FZ3Zz0RRbqkYxOdOhBdMbEGKOBatTjr+fNgvH3YF4fi8RJAShhghuA4+tTv
 8apiDMgQHo/7TlVBrTJ+EfVBkNDYK7MCWfehuUSQebd/vnLvPMBUB/zKrSxZGwUl38g4
 xFEyuWh8cM6z+f26a4oqgc0qWSkMBri4V01qJRxFjI0CCmxbjlxzoEviAoZtA0O69hlI
 lCBk+MbuLBQHTLci884rKkw6TaUevE6zVfOT9hT/7aOq6/+46K0w+wtzAxHJ8dKyo9Pe
 Ogz3tao/1bcLq/qrHOfegEnKutcg52oV6+miEpi9Rmh5zu/USTgO6vwuivsLBeWohUq0
 NpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xpuvIhnTyLj3u0gKnS/722TUFWYedGu3c43M4i1wwOA=;
 b=aFxMqnTeSJ72LJRkZADnVoj8tySiVsiVFDyq3xcR9KwpTI6I7Ko+RcxczqfWAgcVII
 TYL5u8ZhqlOHNj1SMMflM+PeRaCrsNjwi/bvGjJhseXIOdLVXpIDFsr+ARLxGtS5ab2+
 sn1ZK4g9xcl4Mi3TqdFA1Vi11jdIsIDFHddcN9r1eMMczF1ym+QZQdvNn5aRySR+3MT0
 dJ3Y4HooHBM/kAEHQIyWgJNUYeRbbCA9g9iZidTPjWJCFc9xoCL+gtbJEcjN8xN9xfUP
 GK1mHFNrg/4FnzFMSZExWfSWc8EUmaGJdvSy1pUr7OUNUnXXUSEAgaP2W3NAWhDzMtEY
 zKWQ==
X-Gm-Message-State: AOAM530zRcFUmsgPXmpQuby7NJzrykKCokw+OSDYUAjnEVN5CU80LC5P
 MKYPodTzpAMNKDNwmECf9sfEsgukhUOF/HOLY0/iiQ==
X-Google-Smtp-Source: ABdhPJyWyz4ujZ2wCNJLKdE3luILvBiCxy0NTY9OJYGCEFkQJjNGJQYI5Bd0a70wS5Mr0eTEBuV0ejN1ksMMOWnPZd4=
X-Received: by 2002:a17:906:bd2:: with SMTP id
 y18mr3777745ejg.482.1615478553617; 
 Thu, 11 Mar 2021 08:02:33 -0800 (PST)
MIME-Version: 1.0
References: <11e9d3bb-c94c-4ad7-35b0-b698376c5e00@suse.de>
 <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
 <e7520c77-16a8-0fda-c138-b411c20f0389@suse.de>
In-Reply-To: <e7520c77-16a8-0fda-c138-b411c20f0389@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 16:02:14 +0000
Message-ID: <CAFEAcA9RiWvYdh_xAu4iF+Gq2PBGSMk7YkT0UKmeDmrDRxvSww@mail.gmail.com>
Subject: Re: arm: "max" CPU class hierarchy changes possible?
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 at 15:21, Claudio Fontana <cfontana@suse.de> wrote:
> If there is no blocker on _any_ change to the hierarchy I will put it in the RFC series,
> so we can discuss the merits there and investigate alternatives,
> if there is no immediate blocker to any change in the object hierarchy.

Well, the blocker is lack of justification. The right place for
"common code between kvm and tcg" is in the base class TYPE_ARM_CPU.

thanks
-- PMM

