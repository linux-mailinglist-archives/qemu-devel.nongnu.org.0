Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D409F528937
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:54:45 +0200 (CEST)
Received: from localhost ([::1]:46684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqd3U-0003EL-Sb
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqcWD-0007Qf-JG
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:20:21 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:44575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqcWA-00053m-GL
 for qemu-devel@nongnu.org; Mon, 16 May 2022 11:20:21 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2fee010f509so41089107b3.11
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 08:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LjTx5hyT3kM+hK0kM+/mS/G0AYOxgTB0BfTNgUw6QX4=;
 b=hfaCHWZ+QXzahmDIQJTduAmufdQutjwadt6sW1meL8A/wRc3Vh+w3B84234DkpD0EQ
 Bm1y9UHDAPYCcwW1uVF1uIRRAPA+LDlVWyWPvYwk6VgYZbwD1iPJ68a1YhDoF0AkE6iE
 qItjfWJXNlR8Ulbx81+nLpyN73NBoTBQQlnI+yAPz+lnEuQ+XqNSg1W9V2ACCQp+qVlO
 PSgzwiemrFqAmREnkORnzS2ZqwIlFVmOcEVefBohjCKsluFKwItOSIl0AGqeBwK9zCPB
 0YVoWkAp0jiQ+IRGWF4L1de6UPkhRIeVVj5vWZ8c2ttI9TEgqdjvWN4RPkiRyPMDdNcL
 t3GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LjTx5hyT3kM+hK0kM+/mS/G0AYOxgTB0BfTNgUw6QX4=;
 b=SHVruAp6OXDT+zwzyqOxLyD8/jfZLBgVvJv8EfK3NCB+MyNgwQcksIqwMdPNtYhVLC
 yj7CBPdSIvqRd/kluGcYFqg3ns/WpyxtfDWowbJZ6rlDFMtOeLtzaRJ5jME/M0PcC3YU
 ighAtqQYHc/fKEg6AdwLtb/evHONvobw7c3nb2yBJGwz7RASIvbnwmOdFWpzYFA2G8mh
 4u+Ek/KFX71L65QiGtJN3MGIABpQUEc0S95MtalJsURF0L/bS0B5PV/7Aq3WjNSjA0Rb
 MTGnOwdAQQw7624MUn/A4kKNrSxyNYfqEOh1hAqP9g48XrKMUjkuUhu6FNIouTke25rO
 ri5A==
X-Gm-Message-State: AOAM531VoIvAhVaYOn6yWVm/V8vKAW1drFjT2ZNvmApt/VnHOKn4YgVj
 pAriX8goNoiC8g7/eli/ScBKGO0WxeOQvgVdaag8eQ==
X-Google-Smtp-Source: ABdhPJz0iEM20S/MSEpbJCjute2PhTM5HeTkYf5HqO3kpnVQc1V9ORpZJjoRC/uI37jStsNf4PdZCsh7+OEyn2Z3/3s=
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr7869719ywc.329.1652714417434; Mon, 16
 May 2022 08:20:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
 <20220503194843.1379101-9-richard.henderson@linaro.org>
In-Reply-To: <20220503194843.1379101-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 16:20:06 +0100
Message-ID: <CAFEAcA8LJRiqLqK0Cybv5tbR+yzgNKgd0MdwNp-R0v55T2gGeA@mail.gmail.com>
Subject: Re: [PATCH v2 08/74] semihosting: Generalize GuestFDFeatureFile
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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

On Tue, 3 May 2022 at 21:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rather than hard-coding the buffer from which we deliver data,
> pass it in on initialization.  This decouples the feature from
> ARM semihosting.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

