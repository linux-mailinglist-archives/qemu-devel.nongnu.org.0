Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA85441F2C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 18:23:46 +0100 (CET)
Received: from localhost ([::1]:58298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhb29-0002m7-E1
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 13:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhauh-0005fD-NH
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:16:03 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:43748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mhaue-0006ob-Nj
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:16:03 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t30so4280046wra.10
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nFa1gXjSxM9Z1kTYtlHHNqkwm2zp5HC7+2V+Wud23qU=;
 b=MQne79CyTjrNtV8iZk5w4JoylwxeBnwdJMqhTeLZA2q/McYOrL1ue+INOhXDLhD0zw
 1ZMyWtvKzGIDz2kUcqsb1V4MNsn7nssl/Xof47WT+pok4Aq2gZ6kUxzrv3ppH5pGYw/u
 dRWc64+RYeiaZY/nimrfF0elz4/bCHkKm90BxU9F5l83rSqxvr01+cmFU30xHnpQk6sx
 DntT4ZhNcknANQycPai5sY6QH0nqK19x13qPCOuGucvl1V+yD5bCoLyOeDsmE5KOyyWW
 sXCs86L2sjD+HLq/wIqceKMVXf9P5aw1oudixnyI3oSQlps3cbQJA845Gv/QZsE+w5aZ
 r54g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nFa1gXjSxM9Z1kTYtlHHNqkwm2zp5HC7+2V+Wud23qU=;
 b=rMQ6hZvOHK3aBHBDBTDw0vJhzhLKhQsUygQH/PuNOaa9afxSIPSUqNGZpF7xYXfFuk
 7gG9oT6AK+a64Fyw142j3wFVnA2we/yFwxgbxGMMU4dBEdK+kqnvb6quXhbZfEhsJ3Bm
 1mn2u7G2sflcyPKYgR41xQmc3jdXN2tq4cyBujAoIbdnhjTfRTOvKD+pKD8ReDs+o/eN
 PUjBjFoMOML36C4c/gW9Rp3ZWKPmWPNjXv5l6oLHZX92dIWg9qr4pTJn8aC7AtHbWcdT
 ftzpqyYpWrws4TKIon8zDYHCXgufiV4PF1msYjtdGv8AkUHP1UqIgFfAMfGfF5Tn/WVH
 T/wg==
X-Gm-Message-State: AOAM533sXjHeaDHiAbmjHeMz7u93mcO3WIBiamGm1LVUqjQ14+z0Hj90
 OaWv2cR/smFM5BCmuWtmd4SjObivRL4sM6v7CvwU8w==
X-Google-Smtp-Source: ABdhPJyICRAy3Be7eXC1tBTh4gA1fLMdUTgetcAFhxiJrEjVESRn6pZtmOUrEETXcYLAt9tjSdRwcshmf02/ek4yx5U=
X-Received: by 2002:adf:c40f:: with SMTP id v15mr29968881wrf.302.1635786958861; 
 Mon, 01 Nov 2021 10:15:58 -0700 (PDT)
MIME-Version: 1.0
References: <20211008002628.1958285-1-wuhaotsh@google.com>
 <20211008002628.1958285-3-wuhaotsh@google.com>
In-Reply-To: <20211008002628.1958285-3-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Nov 2021 17:15:47 +0000
Message-ID: <CAFEAcA8NRJQDcfXf8DTOL=XXQWUrn1Ud1mY_WVNRCBhsLHWXnA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] hw/arm: Add Nuvoton SD module to board
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, venture@google.com, Shengtan Mao <stmao@google.com>,
 bin.meng@windriver.com, hskinnemoen@google.com, qemu-devel@nongnu.org,
 kfting@nuvoton.com, qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com,
 maoshengtan2011@gmail.com, Chris Rauer <crauer@google.com>, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Oct 2021 at 01:26, Hao Wu <wuhaotsh@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Chris Rauer <crauer@google.com>
> Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

