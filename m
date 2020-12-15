Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456AE2DB03E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 16:41:50 +0100 (CET)
Received: from localhost ([::1]:41164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpCST-0002yx-B7
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 10:41:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpCMc-0004jf-AW
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:35:46 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:43520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpCMa-0004DL-C6
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 10:35:45 -0500
Received: by mail-ed1-x52a.google.com with SMTP id q16so21451023edv.10
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 07:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=45OWWMg2WZp0Irl5YH964e5P3xl3ZBz1hnzL2kkfXnY=;
 b=R++76gxlG78EXVqot0+cqlH7IwuPj3f0W5W15sEjVKvNIOH7DHmNkqJtxSVIY18Kcr
 zmiLfcIOaN02vQ8DiH9DP7x2N75NDpE5Wa6wJ7s/pFuGxUImMTFPlkVeq5/M1Pmy5wUk
 TiThFATGR3ywDmlXCkkQydhU8k+1RerR1WbLl0TzlxqqckLNJT2LitcIaEwPAVrDfn2o
 B5JLbmuFamBarnOqzxHeRqoe0AqAemARqldugPwXHx0q1otKIpHB3FA1uW7bRGXR1taB
 ktrL3BW8kCqjvtJrdhx2RFDhYnL9TGexjonB3bsJf61fRbQCaHBxRC/PnXZZQ3s0rZf+
 pClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=45OWWMg2WZp0Irl5YH964e5P3xl3ZBz1hnzL2kkfXnY=;
 b=CcuyukjKylUOm0CnW4OK4zT12zxspBqb7lvU943NEYPEfNfXrucNF26W1RulHfFyNM
 rS1Sdi7ZF5w52rMaCrb1DOW3oOwI1KSZrllVjGH0UqRfp06NdEdm3thXim+nI+7kTFho
 gAvNT16iowufqmix50/w2c9RH+lWGBn2PGEZH5nslprTiqZ+2+8DVrr7aSyajZXIWt85
 q6YR5aGpCEJcqp4Ye+bXAzrr6tJY3WXNuE0RFFV6ZNjo4sGZDCHQ8WD2/9/mAzCp81/B
 32fHqixPlwGuRwfwtpQ8yg+C5VZgn7wVPWANkH3JsHJNWBs17JeI+eP+zXxSqFVl+oWs
 1SDQ==
X-Gm-Message-State: AOAM532ENX5YrxHi9XR638TrM+cLGxbmb+MQIUY0sk2oofVFiepbuQdg
 ypYW0nNyotYM6jPCuWbHt9YJ+Ah0nISoEAHHDkuUqQ==
X-Google-Smtp-Source: ABdhPJxcYGSsC9x/9WZjkhX+3cFR+HHnyvC0IC+bFG4L0xKDQnLhN03NYi7thacywlEsUV1xXoIWmuLYJpcGzXO8GXI=
X-Received: by 2002:aa7:c388:: with SMTP id k8mr2965366edq.36.1608046542365;
 Tue, 15 Dec 2020 07:35:42 -0800 (PST)
MIME-Version: 1.0
References: <20201215134826.5504-1-kraxel@redhat.com>
In-Reply-To: <20201215134826.5504-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2020 15:35:31 +0000
Message-ID: <CAFEAcA9M-ch5cQUKnRahO6uA_hTBdy1CC0jEZc5MYLqB7JXu0g@mail.gmail.com>
Subject: Re: [PULL 0/7] Audio 20201215 patches
To: Gerd Hoffmann <kraxel@redhat.com>
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

On Tue, 15 Dec 2020 at 13:50, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit aa14de086675280206dbc1849da6f85b75f62f1b:
>
>   Merge remote-tracking branch 'remotes/philmd-gitlab/tags/mips-20201213' int=
> o staging (2020-12-14 18:53:30 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/audio-20201215-pull-request
>
> for you to fetch changes up to 06c8c375389a54d8e4457d967f4f0896caecefb2:
>
>   audio: add sanity check (2020-12-15 09:28:52 +0100)
>
> ----------------------------------------------------------------
> audio: coreaudio playback state fixes.
> audio: misc cleanups.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

