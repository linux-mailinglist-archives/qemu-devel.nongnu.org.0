Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE023C3C1F
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 14:10:55 +0200 (CEST)
Received: from localhost ([::1]:33120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2YIQ-0001vV-8X
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 08:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2YHO-0001Dz-Vz
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 08:09:51 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:37607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2YHN-00030n-Ed
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 08:09:50 -0400
Received: by mail-ed1-x532.google.com with SMTP id h8so9176221eds.4
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 05:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yqOCIvRQ9oJk7ZmDvt2REqUw9FGKACUBpRVsSABKFUo=;
 b=VpxiSXS0GjOOgdU9KNSawv6SdBWpqpVu+ZxBPx2PIjeLSA8COnVuOOUGnuhkwPaoQ9
 HpZsZ+YWPz3jQ9E8334YXWTxsmwCkU9lndUI7obLCKkY6qmHdrbKOoG13AU4HWgdJ9O3
 PPn24osK9pWpmYBQib59v41l83+NikJVAI+2U8Ffm2AUjO/+ULTAanT9Axa2xDVASz5f
 G8jjHVd27sKdzafzY/J4BOac6T/GRBHH6KW60dOD6Qu1egPyjCTV0ILfkJ9O0nQhC/+g
 Mk45cDCT54pw9EvHTLUGPmOfo7/tJGhj6rC1narmX6I+BiMK+cslLIaE4Pu3/PeEzGHz
 PV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yqOCIvRQ9oJk7ZmDvt2REqUw9FGKACUBpRVsSABKFUo=;
 b=VUJxH2J/y4+W4izs0xPEYaFTWc6h2G9ERpg21nK9bbJTqn/0pKS6QUMFTV1MHd1n84
 cUXDq0dpNOHHkP6T6+qlryhi6dQoTyPtD3EXdWk4NlwuRVOjseYjC39Ny23MUytsDRtd
 G4TDs5N2M7KYMX0HR7IOS8P8FweN1KVfqNMKVxLQZ4RGos/XZWs/cTiW4KbI6vDAsRHi
 +oXV9BVnkURUE7H60BTmd4ko7iXqQFpjq4T2i5ZbqbBLN7rS/jRgjixXs8+rx0P2xJVS
 C/MXKHXTHDlV5XqJ8gSwHNEDAJDkyU3qcaMEAxFwlYcwDrNID2dr0+MT1vVWiajn1id0
 KeGA==
X-Gm-Message-State: AOAM533RWRIL68bVoFMdHV7wu+RS7utcOwj8r3s+SgQ/Si+5RJrDsTDB
 /vq3qJfSEx4SV7iBDDeXS5hYcGfC8jqVpcOLbU7hQg==
X-Google-Smtp-Source: ABdhPJxoGr4I5STqzYcFetd8svgNGu1MivzOJdjbXwDQcm/UnOBpZqSY+TVG+f4YI2JVyASwHb3eF9RwU1gH1jev+Sk=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr34945814eds.204.1626005387613; 
 Sun, 11 Jul 2021 05:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210709140951.2775730-1-eblake@redhat.com>
In-Reply-To: <20210709140951.2775730-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 11 Jul 2021 13:09:08 +0100
Message-ID: <CAFEAcA8Oe0Tk0y-JvrovHBnTMW0Dp4Zx9=uTUnO9QhooKxPEOA@mail.gmail.com>
Subject: Re: [PULL 0/4] NBD patches for soft freeze, 2021-07-09
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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

On Fri, 9 Jul 2021 at 15:13, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit 9db3065c62a983286d06c207f4981408cf42184d:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-07-08 16:30:18 +0100)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-07-09
>
> for you to fetch changes up to 62967c9927ec4d733b923c70f9f5428dd1d2e0d7:
>
>   nbd: register yank function earlier (2021-07-09 08:27:33 -0500)
>
> ----------------------------------------------------------------
> nbd patches for 2021-07-09
>
> - enhance 'qemu-img map --output=json' to make it easier to duplicate
> backing chain allocation patterns
> - fix a race in the 'yank' QMP command in relation to NBD requests
>

This failed iotest 253 in the build-tcg-disabled gitlab CI:
https://gitlab.com/qemu-project/qemu/-/jobs/1415082341

thanks
-- PMM

