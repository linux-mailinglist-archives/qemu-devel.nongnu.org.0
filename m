Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDFE539103
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 14:46:24 +0200 (CEST)
Received: from localhost ([::1]:34408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw1GR-0002YS-Eq
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 08:46:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0qa-0001p8-Rf
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:19:40 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:44518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0qZ-0004TC-9d
 for qemu-devel@nongnu.org; Tue, 31 May 2022 08:19:40 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2fee010f509so136910117b3.11
 for <qemu-devel@nongnu.org>; Tue, 31 May 2022 05:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sMRE1LqK6hee/OzjFIAzX/6IJlyx7Uf6WTogUtG9Ips=;
 b=V6Iv8UDVLGSFjIU2+XPE0nPfVQ5lYALsf+Hqq8H7VRYc6ZPz075jU1hSUa4J/uf0oZ
 J38D1NxBmpPUtlQJWKEZbEqLDyBy5ve4bPDT+H8Aj+/WrbfOGYlMdSCNIKq/D7pNCeLW
 NhCDVjU/8UO0sy14Sx0nbm6t5ZkwU5EWAQKcvtbdo/OfAnbPz62UPhpt62YrYyM8Rxqw
 BZHA4V8fF8yvCh9DASqWcTQQQ/VwPVa1NYgv9HHS3FJbeDs0FxGOiOgzbiuLjkDnoA3B
 h2QlserR/6pBY/4+OMoRB3Se+foB+ys50fgoQTmAu/7pgukU6HmUYcIA9i1zl8xx6+Qv
 ObHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sMRE1LqK6hee/OzjFIAzX/6IJlyx7Uf6WTogUtG9Ips=;
 b=t4Fuv4nMnTd1tK/5X6jYU8lu0/uln8Ws/G+YZElQT7FZIWtqsPLWepeQ/ITtveCsl8
 aQWOrpS+bRcBrho285KLOmegsPZ7dEBN/pHuoLw+rPDHzg1EInrkOkUSI4zBrTI4qBQy
 +PW6x0ZzDjO+CeWUb/zo4GJzs9OW/DkRlg7IfHGqSw7FVriVE3wfP5nagMR+nyuJnR7r
 fL6xfexBkdJZ4TqOnCWaACBoonIQJDEGKWlmBDnkFMZ1pmFPyF8y8Muo1ClrkzcGVL7c
 REu7hzuixOT6MsK93s9kC0MpEpYFwt8ggRdnl0I7t6j3LY2Pnx6Ufq/vNDC4TsXbTbz7
 M65g==
X-Gm-Message-State: AOAM5314zQeUNLq8q1lRriTzEnj6oyJ5BoCWd8JAJxBMnzvwpTR9Ab8X
 YYJZW2XJm/eY73flbs1ivjKp2dqKSwzbtT9m7BIbtPIsY+s=
X-Google-Smtp-Source: ABdhPJzKXcyKvLTSD7Y/FOKiMV9/wsMYCBZQHsmReN2p9D+bkCBT73kYxDLY2ZRo/YOAdcwSQUM4cEN613pNwx/uUB4=
X-Received: by 2002:a81:1a4c:0:b0:30c:8363:e170 with SMTP id
 a73-20020a811a4c000000b0030c8363e170mr7113356ywa.455.1653999578303; Tue, 31
 May 2022 05:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220527180623.185261-1-richard.henderson@linaro.org>
 <20220527180623.185261-7-richard.henderson@linaro.org>
In-Reply-To: <20220527180623.185261-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:19:27 +0100
Message-ID: <CAFEAcA-wg8u+P8-LPqpcZuXoZBiWRFvbNg8vhCXKjCgvu+bCRg@mail.gmail.com>
Subject: Re: [PATCH v3 06/15] target/arm: Rename sve_zcr_len_for_el to
 sve_vqm1_for_el
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 27 May 2022 at 19:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This will be used for both Normal and Streaming SVE, and the value
> does not necessarily come from ZCR_ELx.  While we're at it, emphasize
> the units in which the value is returned.
>
> Patch produced by
>     git grep -l sve_zcr_len_for_el | \
>     xargs -n1 sed -i 's/sve_zcr_len_for_el/sve_vqm1_for_el/g'
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Can we have a comment that says what a vqm1 is (and/or pick a less
obscure function name) ? That string
doesn't turn up anywhere in the Arm ARM...

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

