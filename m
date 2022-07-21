Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA1057C650
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 10:34:27 +0200 (CEST)
Received: from localhost ([::1]:58720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oERdZ-0006EJ-6L
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 04:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oERYu-0004Gd-RA
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 04:29:36 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:46634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oERYt-0006Oh-89
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 04:29:36 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-31e7c4b593fso9296747b3.13
 for <qemu-devel@nongnu.org>; Thu, 21 Jul 2022 01:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0FwG8Nh4GpOzX2it1MWzawcigh+6khIDL+WLyvUfk1Q=;
 b=aXSe+vDSFp53PZSZ51Y8jSr54DvpOwpEE4RLK2G3u07UBPd30QPNqabk3/dvNC43Bv
 eF426zUU9Kl1nXUovWZo3Y4MAUJISplOoqK3GREdlGJ3H5GshwqctAfRtFn0Zt4TMg53
 kOIRoklAA9VCExD59QLQ3L379BAfK8MPks67nEmJrpICDg3jm6+xLQna3OX6n1uvDHBw
 MUAhubLiYKNUt/VZ+s6EdFmXX56zvYqo1osWcDPOXZcjK85stjwt5PUPIcUhLbs4Ycxc
 WuLoaQSycYcFqp5frx5vtF2aQNQfI3umKySe+96a0ioMn01QFQPqTTkMW8WyAUFTpzrs
 61Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0FwG8Nh4GpOzX2it1MWzawcigh+6khIDL+WLyvUfk1Q=;
 b=Ee+6GB9JCxpdygk5zBz44ynM5nsr8nYvVpMREjJbuLOzVJSPPLUlmfHgij+PE5DsxB
 jpS/1jNlsgG0khAYRyjBKwXlSchoWuz4zjU/zI3SS0FiFShrGlG0YE4cT4Vz1FZqgJ81
 7WjRGDjlhsh/Ii+IiS0vt1fwaAVoZlQ5l5ezalMxbivKyPsQwSi48XNXvKs1YyITPkqb
 ziRMCAE406jV62ofTlS7Bgo3p7EVx1bXuv+INBP87pJgJl5iibrFsGquT1PDAYLNgkuM
 RHxx5uspPTSBRp4J0rhSw7ulCaAN45eeJhc6xXZUxpkXx1f4z0HHJcg6Ew/QhMPeR33e
 Q8OA==
X-Gm-Message-State: AJIora/iOpYs2pVnSqCbBpsR4x1maxF1j/XHnJvuwZeN5H3yrWSvoNHO
 A8cWALOqCBlr4s7YvLYYIbK1XoS5yCA898EaI/CFdg==
X-Google-Smtp-Source: AGRyM1vYnHVtLgCdid3Tai86b7fLOsYepZxXYiBIPyIE8EPZuQ7SPuzBmvVhjcBcdAi8Shlp0EVdIdshGQw0Am4n9uI=
X-Received: by 2002:a81:770a:0:b0:31e:7cd3:f2d0 with SMTP id
 s10-20020a81770a000000b0031e7cd3f2d0mr1565311ywc.347.1658392173537; Thu, 21
 Jul 2022 01:29:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220720152631.450903-1-peter.maydell@linaro.org>
 <20220720152631.450903-3-peter.maydell@linaro.org>
 <87a693kmok.fsf@pond.sub.org>
In-Reply-To: <87a693kmok.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Jul 2022 09:28:54 +0100
Message-ID: <CAFEAcA-2WVJ02f0OtQsUVAz8NFsb6Pg7LbpEp5LzY+For1Zp_w@mail.gmail.com>
Subject: Re: [PATCH 2/5] configure: Add braces to clarify intent of
 $emu[[:space:]]
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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

On Thu, 21 Jul 2022 at 07:24, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > In shell script syntax, $var[something] is not special for variable
> > expansion: $emu is expanded.  However, as it can look as if it were
>
> Do you mean "$var is expanded"?

Yes. I changed my mind half way through writing the commit message
about whether to use as my example the specific variable name we
have in configure or a generic $var...

-- PMM

