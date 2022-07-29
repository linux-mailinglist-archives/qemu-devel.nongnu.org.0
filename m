Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8515C58519F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 16:34:18 +0200 (CEST)
Received: from localhost ([::1]:38136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHR4D-0003eB-0A
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 10:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHR2G-0001li-Nl
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 10:32:16 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:34368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHR2F-0007Tx-1y
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 10:32:16 -0400
Received: by mail-yb1-xb31.google.com with SMTP id 204so7304714yba.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 07:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=633bSaHOiD38Qf4WRUV2T+a5qoboZG9HXVJGnU4nFdE=;
 b=bJlYPoPX8JnmaOc0s2DCYGmjI+p3xTEVfYguhWKeVQ34iO1yJl5rSjpAoctokhXn8q
 QWFxd0It8NnkvCLOYJlID46xoEpOPA77TdbAQJdM3ErVpXrt++4SsZC1XKYQcsmR1GFT
 jqYDgBaa/GIrONMOYNIPZe3w4Zwa4vRe7W1tt6IIWSw70tN0vL3rLKjV+AoFtA6kH95+
 Wr/VgZh16iibmDSBsktc1bGZWSHcAzLI4xhcJqEsPE4H0KPV6kdU+DKyzeMmOybUXq/N
 Dyti4F/+m7XHjPFummRFaW/juijRNgQO7VGo/cGDc/WIjqNYtimyrjQFm7hoxrv4QhwH
 CYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=633bSaHOiD38Qf4WRUV2T+a5qoboZG9HXVJGnU4nFdE=;
 b=vKUlHwIltuEKE7csgu2nQTsSm7UID1gFvCkIVHV5nGdPpvJOaOx+YcEWB0hY9S8Yg+
 Zt8qZ5fpjmx503A13sp1gOAxLBY6IV/zVfNgtfl+Ipj3JH9sOAJAnoDXmA3xOLZ4nkxI
 G/XH36Mz3iP8BI0C6r7WP1zih1wGRdkuPfybC+/nr9vUbCCiMuY4/tSOpG5L3j6T2XNa
 nqx88V2WeFDo27L+Ds0krq6n6TkQZ0EO1I8QvLhK/G/qE5ZYmVyK8AfRiAqIy1XELeBl
 Z3WwRt51DWtyoKeHApBvm+zWV0xlGekjx4nLS03cqzcxN5cYcfhoxHbg1uT1LwKaVzv0
 nzfw==
X-Gm-Message-State: ACgBeo1rTMGKEEzujoz1mSt9cFUasK8/f+yjrL8gD4yAh5+hJO/kAAFu
 WSUzWqQd31U7YQvcEq49hktc6FOWGv2k5p8pi8AyCw==
X-Google-Smtp-Source: AA6agR73z5uCMNhkaMgCKADT9oztKl66YM2hzaZZpmYqDJw8PNDCI27fA/yl+VKqLjP9LkeEPVmvvqBLxaT+dG7s3AU=
X-Received: by 2002:a25:d617:0:b0:671:79bd:69bf with SMTP id
 n23-20020a25d617000000b0067179bd69bfmr2837121ybg.85.1659105133855; Fri, 29
 Jul 2022 07:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220628045403.508716-1-richard.henderson@linaro.org>
 <20220628045403.508716-3-richard.henderson@linaro.org>
In-Reply-To: <20220628045403.508716-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2022 15:31:33 +0100
Message-ID: <CAFEAcA8xGYd34RgGqo8z5Y1TvPMxeB=99genoJEtd=+eKEjReg@mail.gmail.com>
Subject: Re: [PULL 02/60] semihosting: Return failure from softmmu-uaccess.h
 functions
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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

On Tue, 28 Jun 2022 at 05:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We were reporting unconditional success for these functions;
> pass on any failure from cpu_memory_rw_debug.
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

So, this commit makes us check the cpu_memory_rw_debug()
return value in the softmmu_lock_user() function; but Coverity
points out (CID 1490294) that we still aren't checking the
return value from when we call it in softmmu_unlock_user()...

What, if anything, should we do about that? In particular,
I think that for semihosting calls that write to guest memory,
if the guest passes us a pointer to read-only memory we're
not going to find out about that until unlock time.

thanks
-- PMM

