Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E74313D4B
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 19:24:32 +0100 (CET)
Received: from localhost ([::1]:43704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9BD5-0002jU-QG
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 13:24:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96zI-0004zR-6e
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:54:09 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:43192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l96yw-0000UU-2Q
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 08:53:53 -0500
Received: by mail-ed1-x534.google.com with SMTP id s26so12384077edt.10
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 05:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EYOWA8dQvqkeRrTYpwF33uSv/dUMb31Yav+spbXIWpc=;
 b=rdSPQvQI6WNspc4y+hQx/g7QDc2SRyhGfFfjnhRAh0oPxe15SzopFEpP+8PtmuD9nX
 Fz3GlM3DkGIqKPaCDv6uFfrfp/ThVteD9oB+xy/d5gLqPYYlFOu7X5agNhCM7F/VDWgm
 a0Oqjy+mglXqIF+n70mI0BU/8JOrfVywBxLzcPVZsQh8uTkrN8qZsctA5CZfDdled0zc
 qXeIr4YJqJKg2sp5NWg0YMnoH+CKBzPvcDU3dISegeOsqu/kg+YvTtNX6Brald5m79lT
 41Bq/PK5sm00TpCoOzJQEq8nyOSKLOXC6qNC+lmsFAbergSVLFjK5bCdzUzbVS5gqxfy
 IVFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EYOWA8dQvqkeRrTYpwF33uSv/dUMb31Yav+spbXIWpc=;
 b=msPKMhxTpvEV2YQVFl7POZR6XsR5CWmXHoKDBM1JfIad3hFmOtCf+F1HLcg1Ons4By
 GIdN0rABAP++jijkDYs2Ij1Z9fllKR+CBJq0Exz5k9vlrMQI0qAHyKthrKQqelCDFIeh
 qMJ/VpE05EnDN/GftuFDXX/9uBpG1cBqG3blBKsgDC/ArZ4pTlRvSUKeCL+seLXO8nUF
 hAg3nDqTlUAwifc00AkTP7r6+asGbuxBPC3v/tDk07q2T9DUpyvw1senL5Lzd9JivPHV
 yzBNnxuDI16YQ4cl0wJL+PFMBNsKOFFMkJ5ZCFv3vm3IfY6G1/pQ9TVBmcRhTIezT1YZ
 QfDQ==
X-Gm-Message-State: AOAM5328o5XjNgNBCiI0CkWHsY4EraEmx7CvQCemzUSXXTtwc5cBPRHG
 Rjdeu38i5AcoutZGToBz2JUBhc7MMsfEzxAgLgDnCA==
X-Google-Smtp-Source: ABdhPJztrcUylWImqz+3hPqZOuNyAvB31KPIQOKgM69/go865rIkSqjjytgZk+hpaIQVH53ANv1yz6s9FbA5HN08u98=
X-Received: by 2002:a50:e80d:: with SMTP id e13mr16918912edn.251.1612792412331; 
 Mon, 08 Feb 2021 05:53:32 -0800 (PST)
MIME-Version: 1.0
References: <20210203190010.759771-1-richard.henderson@linaro.org>
 <20210203190010.759771-19-richard.henderson@linaro.org>
In-Reply-To: <20210203190010.759771-19-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2021 13:53:21 +0000
Message-ID: <CAFEAcA_kG91qoz4GNo38+Fsn6SseJh12cyOfAFh50mZkY=ezzg@mail.gmail.com>
Subject: Re: [PATCH v5 18/31] linux-user: Fix types in uaccess.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 3 Feb 2021 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For copy_*_user, only 0 and -TARGET_EFAULT are returned; no need
> to involve abi_long.  Use size_t for lengths.  Use bool for the
> lock_user copy argument.  Use ssize_t for target_strlen, because
> we can't overflow the host memory space.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

