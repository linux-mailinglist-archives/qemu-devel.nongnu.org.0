Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5C0530EC3
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 15:01:41 +0200 (CEST)
Received: from localhost ([::1]:36882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt7gq-0000B3-7g
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 09:01:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt7Z7-0001KU-58
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:53:41 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:38091)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt7Z4-00017b-OB
 for qemu-devel@nongnu.org; Mon, 23 May 2022 08:53:40 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2ff7b90e635so80870847b3.5
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 05:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HBdzIM5bKFTimdjlgtfAuDatMHcPXX/q8mtXkhOh92k=;
 b=mvGyC64igVpehMNHaiWrJmtUmRC6aHpAG9nzSX5pE7JYdSnE5m36vXwUuR+P2EnQ3L
 I99nzuMursfgRs7OyFrHQmd6j8mkn+VX52D+9nhbXRzFwHpPm2zjq9mQNLLjqAX89uFM
 NrktjT7uZAbNSH64qsgHE30WYC2n611slirL+QJfVw6iPXcLPYJaQeKddNBsVYzDw3KJ
 b2okqkhEk5g8hFIFn0ersFvOM6B/MhIAbPA8c3eOY/oX32BcQuiKpZbKwUK3JX5R5ALJ
 rDTFMYXo1GfyABt8Scr4sJtGVBtLKNl6YTVrPh6HCh/5ajQqDltA2GEmyHdNBEv2W927
 z2bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HBdzIM5bKFTimdjlgtfAuDatMHcPXX/q8mtXkhOh92k=;
 b=iHLMASKcKS06ETkgfSvcoDA8ujyWa4tIyD+TknFSPf/39HIoqMMTsgYNQIC98XWVZJ
 gl2C3GqVFDjLhDw37nJmuVgFGwfDoexUa2ikmldp/hAZalZkbmWD1TcVNK4mToNRHrCg
 vTYrkfRQcGXgdJbdEukiaeBU3pMLojntuIbDh6LsOe4yL2dn1tv2uLA+t66mUj5pQ937
 4VRTQZALMyiQ1aPCiEfmkhd/k9BFig/RG3BBnrLW8C4T6q0aVdOvpk5bb+LqZyusTHR0
 YyOM6pL5hBn1Xj3adaHKRdnPiKvpIXt4bB/M0ApFcGpEsuoUuYVI6ySWWYAuHiuNR3d4
 vW3w==
X-Gm-Message-State: AOAM533QGG+P9siz89XrBW58C1uGURuvYrvYX8RYrwqzwjqX7U1gDa2i
 I70ITnYA+9HuIhyDQMDepaeUiwYg0ZQPgvL7ephZsg==
X-Google-Smtp-Source: ABdhPJzYWZeWx/jH43Y0M3sYdiAodARcfwN9duqt8XF73j9EnbLriTAvnqqzIyOdali+VqshlsECVJTeRqMA4m+d0wk=
X-Received: by 2002:a0d:d4d0:0:b0:2fe:b86b:472d with SMTP id
 w199-20020a0dd4d0000000b002feb86b472dmr24288452ywd.469.1653310417756; Mon, 23
 May 2022 05:53:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220521000400.454525-1-richard.henderson@linaro.org>
 <20220521000400.454525-23-richard.henderson@linaro.org>
In-Reply-To: <20220521000400.454525-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 13:53:26 +0100
Message-ID: <CAFEAcA-jb45mD7m70qLr_QhdMa2_9jBEFkHCMon1cDT0w2KX5w@mail.gmail.com>
Subject: Re: [PATCH v3 22/49] semihosting: Move GET_ARG/SET_ARG earlier in the
 file
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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

On Sat, 21 May 2022 at 01:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Moving this to be useful for another function
> besides do_common_semihosting.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

