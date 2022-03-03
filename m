Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD564CC1EE
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 16:49:26 +0100 (CET)
Received: from localhost ([::1]:33444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPnhl-0003pp-9M
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 10:49:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPnI4-0007mD-St
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:22:53 -0500
Received: from [2607:f8b0:4864:20::b2b] (port=34430
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nPnI3-00024i-4m
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 10:22:52 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id h126so10961065ybc.1
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 07:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=buNb03SnyuBS0lkHrmve5Qxupcq4kBZCss3zbuysBn8=;
 b=q1V/6bTk2MANBL1VTH82ucuDfB7z8gUkgbI/eUO1E/DnBLxypQ8VsMcMI9p+niZ2jM
 0fUyLbRKqheTv1GUFbqjx/YpidN7cI+HvG9eozm1cbjc2TwM1fzV+mFxTEQLcEqNMkVs
 Z8qkri8VTuNr089c6L07/nihYt1aVOveCduNr+dGbQUp3R2FK/PpjJM+uJhssHGsxBUp
 kb8fMb0/2O3Eyj5eW9K9lYx/5Ww9z5H8H63DrXb3OQ/DaS1VNsXUeIBb/IRtuZUqxrq4
 pJeI0em+ekfzSsS1dEcuv4zLlKiAEzH4iFs6//zKyPZrgb2cvGlzXxfohlo/yObqb22X
 SLVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=buNb03SnyuBS0lkHrmve5Qxupcq4kBZCss3zbuysBn8=;
 b=ZKDyQfTJpbrWeie06I+nj7Yx+g3KjeAKRA8UkrGH/yXHUp5YelggfDy0xlZCQYeVcX
 b4ov6d4waA6hT3+GyBan/Dy7QW0lWFyzZX9Qrnb58yPDvwL/XrAPtqfboodDFXA8XcTc
 kgWgonpMgKYIQPAdXpZaijJaSx8Z0Z7GRn9xWvWF1thCPP/yBhs1FJIyC2GnfGCAtS1e
 /qpbjcVQfu7sa2lgEYJDSzytGdWwNju61CcPkEOlnB/g85SAnMchArgtgC4rro+w9GSr
 60R7HKGb+mEgLgGOYJlC4fmmy9WFKVEI9XwxlvX9zBxv7jjg5gppqSukQd5MXX5BkHjJ
 OdZg==
X-Gm-Message-State: AOAM533Hbe1zvqchHH6Hmk+POYkN/8KcDXj0LQUu5ggwVPrXSAO+C67M
 TB/jEjLZ5l9+w1V5hjVQYc2Q8dmO0TDoQzv/oomdGw==
X-Google-Smtp-Source: ABdhPJwKGCOqPPPNp/+z7t25zc1rzVpbKtUBZQRwUIW1HENDs3xczJQJ23Z/g1fjiGYX+EQYS3BP1u8QvT5pAOax4UE=
X-Received: by 2002:a25:6e84:0:b0:628:97de:9430 with SMTP id
 j126-20020a256e84000000b0062897de9430mr9824847ybc.288.1646320969817; Thu, 03
 Mar 2022 07:22:49 -0800 (PST)
MIME-Version: 1.0
References: <20220302212752.6922-1-mark.cave-ayland@ilande.co.uk>
 <20220302212752.6922-2-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220302212752.6922-2-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2022 15:22:38 +0000
Message-ID: <CAFEAcA-AEW1hh1Az2OwuyY2h7APFvasPbN4Gg6aGwG-SKrUphw@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] macfb: add VMStateDescription for
 MacfbNubusState and MacfbSysBusState
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Cc: fam@euphon.net, pbonzini@redhat.com, Laurent@vivier.eu,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Mar 2022 at 21:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Currently when QEMU tries to migrate the macfb framebuffer it crashes randomly
> because the opaque provided by the DeviceClass vmsd property for both devices
> is set to MacfbState rather than MacfbNubusState or MacfbSysBusState as
> appropriate.
>
> Resolve the issue by adding new VMStateDescriptions for MacfbNubusState and
> MacfbSysBusState which embed the existing vmstate_macfb VMStateDescription
> within them using VMSTATE_STRUCT.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

