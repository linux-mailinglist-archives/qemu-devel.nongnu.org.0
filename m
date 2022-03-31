Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 226F34ED792
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 12:08:39 +0200 (CEST)
Received: from localhost ([::1]:43482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZrjK-0003ZL-6j
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 06:08:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZret-0001vO-0U
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:04:03 -0400
Received: from [2607:f8b0:4864:20::b2d] (port=42749
 helo=mail-yb1-xb2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nZrer-0003DW-Ai
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 06:04:02 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id u103so41399047ybi.9
 for <qemu-devel@nongnu.org>; Thu, 31 Mar 2022 03:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sBzMmLj5HCRf2xznrJjxrAzC/yCC0FZq+c2GpcnCk1Q=;
 b=ADZyEL6S49YGqziyBu2fqg7jbzamZeWF7bg7LSGbmdOtI4J3mUdNXO6a1TjqSqcMEn
 A+KSHHWohRpczMKnD3gb1MLTKDbENnWhZ/9OmN3F8PMRRfF14dJAu84p3GEyquHkrsCy
 YL6GYYQZpvxg2W4BtSy4wd/peiU4xwniGuueDCmxJ40uqR7EcQ2RiqVASGZ2Gq7+3UdL
 svzywLdJ2F7m0Q0PmSNQNKZ1uHEJEiDP2s4aVpc89TfCPPb1pXbJ9l8FYTbKQqm4lFVr
 O/XCqZ1Hk1UUVEkMGR7YdaQXAG3kHw/+lphUFnp+yLKgOXtE5vdWgfa13yRVFM+wIWLw
 A6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sBzMmLj5HCRf2xznrJjxrAzC/yCC0FZq+c2GpcnCk1Q=;
 b=A83DmwGkwWTPY1t/7B/Qhc33tAEaYIDoeH9liY9HL13JpjFRX28nS9oobkYT0gY4G3
 hQKUUSLeOvdGf/pXi8Eyy8Ox+a3bEMDuKdPPjheNz8mHfYErHwolw5d1P2El78RJiKjq
 D2+yfL1wCmMbZZCzo0Ye6MeDvH2U5580S3XPoAlrwTgFwdqGBK3iFHszcKU7CgQsofMC
 q3RX5ScXul/dkkxg7oTv8RXZhrbWtXXkR9aL4RbbRzVCgSlJK63Kj+JokxX8meVYnCoU
 3VqOGR4Qzb3u9hUDM3EFpYyM5KxoB+fTg6OeF/xQOOV+eiDMWGkBajmpTAIyeHZ5No35
 3gow==
X-Gm-Message-State: AOAM531ED225+6r5mZPfZQqnGiPGej1v+JPSLvdL+fy7KMGuXOLmcrC/
 dT15TY+uZ5pDqtF6ETvglk8dunTeU82BeWD+rmANDQ==
X-Google-Smtp-Source: ABdhPJxJZBqOp4ANHm3QXYOs+foFF8VKt6a5P00cWAEaW3SAA6/vGmOgTmk0wDGHSydwBcLfRcXkVwYEdyYEldF7iQU=
X-Received: by 2002:a25:cdc8:0:b0:633:8aa6:6a3 with SMTP id
 d191-20020a25cdc8000000b006338aa606a3mr3484881ybf.288.1648721040359; Thu, 31
 Mar 2022 03:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <20180129102320.21534-1-kraxel@redhat.com>
 <20180129102320.21534-6-kraxel@redhat.com>
In-Reply-To: <20180129102320.21534-6-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 31 Mar 2022 11:03:49 +0100
Message-ID: <CAFEAcA_rDF-6=-S--F-NU_Q-YaZSKw1f6GvKekayuYviQv0ebA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PULL 5/7] hw: convert the escc device to
 keycodemapdb
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2d
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Jan 2018 at 10:24, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> From: "Daniel P. Berrange" <berrange@redhat.com>
>
> Replace the qcode_to_keycode table with automatically
> generated tables.
>
> Missing entries in qcode_to_keycode now fixed:
>
>  - Q_KEY_CODE_KP_COMMA -> 0x2d
>
> Signed-off-by: Daniel P. Berrange <berrange@redhat.com>
> Message-id: 20180117164118.8510-3-berrange@redhat.com
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

> @@ -879,7 +759,11 @@ static void sunkbd_handle_event(DeviceState *dev, QemuConsole *src,
>          }
>      }
>
> -    keycode = qcode_to_keycode[qcode];
> +    if (qcode > qemu_input_map_qcode_to_sun_len) {
> +        return;
> +    }
> +
> +    keycode = qemu_input_map_qcode_to_sun[qcode];
>      if (!key->down) {
>          keycode |= 0x80;
>      }

Hi; I was looking at this code because Coverity is now clever enough
to try to check whether the qemu_input_map_qcode_to_sun[] array
is being overrun (though alas not clever enough to spot that
qemu_input_map_qcode_to_sun_len is the length of that array,
so there are false positive complaints about all the uses of these
autogenerated arrays in all devices that use them).

In this specific case, though, it does look like there's a bug:
shouldn't the condition be "if (qcode >= qemu_input_map_qcode_to_sun_len)" ?

thanks
-- PMM

