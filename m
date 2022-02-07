Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5FD4AC886
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 19:29:56 +0100 (CET)
Received: from localhost ([::1]:56164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH8lu-0002S3-Uk
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 13:29:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH8Fj-0006VN-Gy
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:56:40 -0500
Received: from [2a00:1450:4864:20::32b] (port=35833
 helo=mail-wm1-x32b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nH8Fg-00038n-3n
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 12:56:39 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so6108149wml.0
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 09:56:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ncOGZfi0AyHsfCE6I9z5rxgLAhu+ZNTqfDu0iBPnsqE=;
 b=OvRGsCFow557GV2nCUtXxw5+uuIkjPssnvClXW7S6LVD3a72WogClUMHU7S8h9ozmo
 QzIreRgSYEcEb/Asw6T2PgVMz/hUyTRcjcSekrOoO96CGOB8jkbQr3zSV0vwl3+3MaiS
 IRw7jKx4vDOKmqdF5pzHE1s3tnYuplHEF8X/YRaRjEmQKMt+Q8aBRJFCprtrJsu1v6sZ
 BYGRG2rsZz/odyWwVYQ3p9xUymdq1OOtmqaqmCQhwysDaqVQeSqd/Ihfuj2UjyEoxmxN
 lhoIqsZUw6ecKHUsqXGHrZnZNnyPMMEHLnlVmV6f0yExAuSGZP9WGZoNf4UZc2ZKbgEa
 jb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ncOGZfi0AyHsfCE6I9z5rxgLAhu+ZNTqfDu0iBPnsqE=;
 b=4h+3RixN3IjuePjyZN+4TmEk0K7FM1GMYt/7+kYPhCAGfXdms/wvWb7pLa6V4naJbL
 C/3TVTKCXu02s0978Za3XiHQvnVlcDjf4+BmsFV7vu2BDgaSNFWXjSfmyDgc4Wd+RLGh
 CdUxdpMxTmQ9mdyGg0owUZIcV5U1JRMpZjWShL0ugfYxwtRkE5jAQ4saFVEqtchwUxmG
 CdDKlu1jmEbWG52FSs454gmZUf+GbAd3g/qMA2l566cnigyYeASBv474Hv1HyNy1FgmT
 /5vr4vbnapmT96XCwzwCQCYdXJNXD8NHXAjZJNCjZL0PYSrUSj7+2QhmKV5/ZEV+bsCp
 3xSw==
X-Gm-Message-State: AOAM531uRHZyMOmg566CzNaukm6FzD2CiqCIxU1vdlrlpIEGCPuYsoSM
 4DLcRc9TNBchx1ckgr7krAb8TOg5jn001ZI43u2x+w==
X-Google-Smtp-Source: ABdhPJyMVaEOizZmRdh2GkuAPYma1DR3Ot9L4SimshY/3jwHopzUUwtH89d6ADqdqKJEsGerm99I5aqscVtgxVAjoKc=
X-Received: by 2002:a1c:544d:: with SMTP id p13mr55243wmi.37.1644256594553;
 Mon, 07 Feb 2022 09:56:34 -0800 (PST)
MIME-Version: 1.0
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Feb 2022 17:56:23 +0000
Message-ID: <CAFEAcA-amg4fT3jUwcvp+Z5Fi0PPN6Vi7TAVm=XARaw82LYEtg@mail.gmail.com>
Subject: Re: [PATCH 00/13] hw/intc/arm_gicv3_its: more cleanups, bugfixes
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Feb 2022 at 19:32, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This is another set of patches to the ITS emulation; mostly
> cleanups, but there are two bug fixes.

Applied to target-arm.next, thanks.

-- PMM

