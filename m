Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC0F4622DC
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 22:03:26 +0100 (CET)
Received: from localhost ([::1]:35314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrno6-0004yP-07
	for lists+qemu-devel@lfdr.de; Mon, 29 Nov 2021 16:03:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrnZa-0007sg-Mb
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 15:48:26 -0500
Received: from [2a00:1450:4864:20::433] (port=35345
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrnZV-0005vY-OB
 for qemu-devel@nongnu.org; Mon, 29 Nov 2021 15:48:26 -0500
Received: by mail-wr1-x433.google.com with SMTP id i5so39598203wrb.2
 for <qemu-devel@nongnu.org>; Mon, 29 Nov 2021 12:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nOMHFaD9kmkt+xIs4AZJH2PN3VPbDuw5b9wWDjTOyPY=;
 b=hr4eoPPC69qUVOrkOI7xlZG66LBIsnuqAEmIFmRI51QxGIO4ApkGHGm+WeFhM+04vR
 TtYtxb/0Wz1aMMA5MWByR1DIiKNR1dax2wdNL06QTDQvBc1wtgkVpgH6C6GIR1NMPu2m
 EercVq54A8bbWZnZDv85gOn6aaff1lRmYWq0lNQKo8u2GNH0YtclXgmrh7SyWNq4qfay
 I41EPBFO6JELpqjqpSpVwEM+Ta6zmOo5AdGSnLRyGEG2csDFLrKHW/jwinLtwA0N4WxG
 N3Vo78BU6oX5+J8otKveq7t1pncgHWIw5jBh3vDCIguHWmvhq75ZFxsqJTaHB70GJSr+
 ZZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nOMHFaD9kmkt+xIs4AZJH2PN3VPbDuw5b9wWDjTOyPY=;
 b=6+IIMoad/P8UcYHHfWp19B0RB5n3DTMrcJt/G0GhcLYtmQVjhzrm0IXHn8OMCOSEG6
 YI2jd9nrI4cZQSJZWQBF4i6EGZInKVVxz8MVTamM9w/nGmQ/Rvewdn5Mphm0qGQqLuW3
 +dH6l5n9CMiqAIRIS21v3MnYQmhwVgcRpIIdHtB9aAvA+p81wkbc4k9Cez1unI2hdGS6
 gPwthuOe1aE7NGbpsQGzyxzJ1+PGESAEU9q0CErFam/qJPPSavM9pMsZ/wpZbUyxfuis
 6SUk7Af7YyHZF8XqY3YwOoVFRXzBKlm3ExJpFdHo67PFewXA8+krd8yhygTm2/2nciAS
 urFA==
X-Gm-Message-State: AOAM532WJi/oGYDBMTPFrqL+IUC4ire6YJJO4l+laAQFV5qvU4/RVRj6
 uxyO9BTVVZwWkeCfS002K3//ZPoxRJ0+70/CkwQTSA==
X-Google-Smtp-Source: ABdhPJwh/253xEA8+K5Yz4fsa6ZolV2fBt6YyMCfAwFlswd/SFrr2n4uhVKIpFKjDD6dKtCDuitICnbkuUTRz2IWiGI=
X-Received: by 2002:adf:ef42:: with SMTP id c2mr35378849wrp.528.1638218899836; 
 Mon, 29 Nov 2021 12:48:19 -0800 (PST)
MIME-Version: 1.0
References: <20211129200510.1233037-1-peter.maydell@linaro.org>
In-Reply-To: <20211129200510.1233037-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 20:48:08 +0000
Message-ID: <CAFEAcA_ognVQ=7-pE+MDwkJCtcD0FfzPL0Vnb7vTgzbVSpnrLA@mail.gmail.com>
Subject: Re: [PATCH for-7.0 0/4] qemu-common.h include cleanup
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Sergio Lopez <slp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Nov 2021 at 20:05, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> qemu-common.h has a comment at the top:
>
>  * This file is supposed to be included only by .c files. No header file should
>  * depend on qemu-common.h, as this would easily lead to circular header
>  * dependencies.

As a side note, that comment was added back in 2012 when qemu-common.h
was bigger, included other headers, and did some of the work we currently
use osdep.h for. As it stands today qemu-common.h includes no other
files so it isn't a source of possible circular dependencies -- it's
just a grab-bag of miscellaneous prototypes that in an ideal world
would be in more focused individual headers[*]. So there's an argument
for deleting this comment...

[*] A cleanup that would be nice, and I'm about to send out a patchset
that splits out the rtc related functions; but the grab-bag at the
bottom of osdep.h is probably higher priority because that header
gets pulled in by an order of magnitude more C files.

-- PMM

