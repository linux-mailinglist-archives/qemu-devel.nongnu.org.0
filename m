Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF5A50A609
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 18:42:47 +0200 (CEST)
Received: from localhost ([::1]:35000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhZtG-0008Rt-JZ
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 12:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZDW-0004In-0x
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:59:38 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:38415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZDU-0004R3-GG
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:59:37 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2ec0bb4b715so57054957b3.5
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 08:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jOia8zemf6ZmddLEtvFAFJRTZs5cR2bKGSrUiL+pjaQ=;
 b=WrAu8Hq3ckSc0wKV9Wx8znacEmDGWPH53SoedrfYn08OMD1vk/P1Zf6Dvb11FlGbCv
 fiF8u0QEyO/2Wi3nxPxr/GFf45b6/6ZvEIlgHUh2PpgajXVA4bHAfXxV3QI7K6KxdWZM
 uJznJH+Gc1gAOFCCxZDVksMMLp6pMY0igmt7CuSed+O4onGbzFa6nJ4TinsFyaKalo8w
 YuxYSKXf4Pe+zbShesVy9dPd1TTZbXrLe1N8NmqJRm8/SPqjWdPgD7e4SOonVIhamjdx
 Z6tuTK5Wt44kGL2tloqa4qwoFqm/s9L/GSlEha1RdiFIBWbNA3QVNVCblsiFm3yIxiLV
 iSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jOia8zemf6ZmddLEtvFAFJRTZs5cR2bKGSrUiL+pjaQ=;
 b=ESk1o0cGWxUMRpUkRkI0Bx6kkISqST0PIVR6pySCdQN5VK5kgF7Um75JOQRIdajYOY
 KC7VzGGVUnR2zEZQ8Ve5dP+7PYSJin5gCu4mU2VlijemUZMF02cNBMXjF41jEYARh78z
 963zbHwDWiVrM7JRtZ89L4u/NTHqwQGvEU2AyCUPZhHJhsLvAht7/hfj3D9lc95K9UjI
 CKzgfJJJvQ0iYvepp7Iece1a3IlW1BjY8wJfj1OliTPz1jFixFA1nzF8h2o2Rp4cw04O
 roTjBG7XPulZi9FsYKGZUr9jC+ZHmbM0lPj4Iw0w48BPb4zGspgS7t42zg4KBG6PF2li
 uWqQ==
X-Gm-Message-State: AOAM531VAb9KXJui+sMxyp4Id2zfXy5AzPA1P9zZ/PnwdlQ4vXgLL6jO
 QJcZLTbWx175QnH6z0aP/6Tox1eQLyDEo19F6B8aCw==
X-Google-Smtp-Source: ABdhPJwlRduVuJ1u5V/dWrj+hQvMnkQaKBkNjpm670q2W+5468TnRQCuDzXHLZkLXzMl3fZbXl9W00srtkqCL1kZxJI=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr326019ywb.257.1650556775547; Thu, 21 Apr
 2022 08:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220331115312.30018-1-damien.hedde@greensocs.com>
 <20220331115312.30018-2-damien.hedde@greensocs.com>
In-Reply-To: <20220331115312.30018-2-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 16:59:24 +0100
Message-ID: <CAFEAcA9HsoVnKb1iRXMtYphxUt3Zg9G8p4=zrjv-Z=ekpseH_g@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] qdev: add user_creatable_requires_machine_allowance
 class flag
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 31 Mar 2022 at 13:19, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> This flag will be used in device_add to check if
> the device needs special allowance from the machine
> model.
>
> It will replace the current check based only on the
> device being a TYPE_SYB_BUS_DEVICE.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>
> v2:
>  + change the flag name and put it just below user_creatable
> ---
>  include/hw/qdev-core.h | 9 +++++++++
>  hw/core/qdev.c         | 1 +
>  hw/core/sysbus.c       | 1 +
>  3 files changed, 11 insertions(+)
>
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 92c3d65208..6a040fcd3b 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -122,6 +122,15 @@ struct DeviceClass {
>       * TODO remove once we're there
>       */
>      bool user_creatable;
> +    /*
> +     * Some devices can be user created under certain conditions (eg:
> +     * specific machine support for sysbus devices), but it is
> +     * preferable to prevent global allowance for the reasons
> +     * described above.
> +     * This flag is an additional constraint over user_creatable:
> +     * user_creatable still needs to be set to true.
> +     */
> +    bool user_creatable_requires_machine_allowance;

"allowance" doesn't have the meaning you seem to be trying to give it here.
(It means "the amount of something you're allowed to have", like
a baggage allowance, or "an amount of money you're given for something",
like a travel allowance.)

Do you mean "user creatable only if the machine permits it" ?

More generally, the pluggable-sysbus stuff is an awful hack
that I wish we didn't have to have. I'm not sure I want to see
us expanding the use of it to other device types...

thanks
-- PMM

