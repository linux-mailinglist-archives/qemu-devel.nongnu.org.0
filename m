Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB55A510A0E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:13:57 +0200 (CEST)
Received: from localhost ([::1]:40096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRZM-0006oZ-I0
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:13:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njRXv-00064h-IM
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:12:27 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:40824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njRXt-0007FO-Nx
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:12:27 -0400
Received: by mail-pl1-x62f.google.com with SMTP id k4so19668176plk.7
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 13:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=A/5AexbB9jSsuvldrBEoVdDMZStqMkrgr6MWLqXstJ8=;
 b=w8FRpz9R3jnY92oY53lEWN8yUbiwmujNvaHySFvjjWw8i0NYUik1xQQQWHMGfytOXh
 KjtgvBw4CgYLOGG0bVkYSEx6k46/vqD24SbXbEZ96R5vQU6PjqLzR09tzS8J7SYJMZct
 T/8wI6Jm+LmPBuf0ZC+yEpUEKKOK1zfePyFzKd5Ki2mR4XgxMIxT8zSZznnbNVC6RRYT
 wi3NXaEV9Rwes0Am/bgp1mbIZq8YJYWP2NLsDcCxEc9VpNZ10dAHRO34TXGArQyjfuI8
 cyKo/Hogqm43cns9NkHAT2FCIh+vh0cHoVhpXKHqw8g0Lo3JVDmEhE0Gog7FaX8ofsa8
 m4xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A/5AexbB9jSsuvldrBEoVdDMZStqMkrgr6MWLqXstJ8=;
 b=mKs0HXAeBIEgvCPv1dt71qxmSRPkGtvjrcvMwz0m/yl39RVWgwbPFdaPiZs85yP1HW
 fA6ip0TrQzWheX68K/6TaosByvxe5lc4geNQ5o6Cukxm0xROHepXFQHRHAOE+vTBl1i+
 SeJJrU1nkfWtH2s96rySu+3aRjrY5aOyHxfm9Q2MRjjXr49E/ekIRtVzwrAT4h4BLSDI
 hnvEFkWDK2SB0y10TH2tFRBlqwWnw3NVp9xo7t0h05ddfw25SP3DcKtPT/eL8tNmrgRj
 1pcSIfVCKthHQ7eizJbLANOWJuc0xUKKJW05ZkeHPDpk0JsTR/T/61CovGZc2o4kN697
 FE/A==
X-Gm-Message-State: AOAM5327sUhcUMGIhjwU9VnBPE+ew9JcvZsPQjiaf2X40Sl5DpAwvehM
 ayBihLIg71eXgaFtOYaTAlynSA==
X-Google-Smtp-Source: ABdhPJyT4NYG7q7CwzsyDV5cbYTFzMhBRrd4udeuJ/ZghzO2I8EHU3gx8fPzFf0rnARsZ2nYFRlXRQ==
X-Received: by 2002:a17:903:41c1:b0:15d:2105:dc1 with SMTP id
 u1-20020a17090341c100b0015d21050dc1mr9314054ple.170.1651003943799; 
 Tue, 26 Apr 2022 13:12:23 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 l4-20020a056a0016c400b004f79504ef9csm17295080pfc.3.2022.04.26.13.12.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 13:12:23 -0700 (PDT)
Message-ID: <677ffe9c-1f02-4270-dc41-5ea41b09bcf1@linaro.org>
Date: Tue, 26 Apr 2022 13:12:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PULL 0/3] Misc next patches
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20220426151323.729982-1-berrange@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220426151323.729982-1-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 libvir-list@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/26/22 08:13, Daniel P. Berrangé wrote:
> The following changes since commit a1755db71e34df016ffc10aa0727360aae2c6036:
> 
>    Merge tag 'pull-block-2022-04-25' of https://gitlab.com/hreitz/qemu into staging (2022-04-25 13:35:41 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/berrange/qemu tags/misc-next-pull-request
> 
> for you to fetch changes up to 5cf434b5af386fadc3418df71d3738676cbb0549:
> 
>    github: fix config mistake preventing repo lockdown commenting (2022-04-26 16:12:26 +0100)
> 
> ----------------------------------------------------------------
> Misc patch queue
> 
> * Removes depecated --enable-fips QEMU system emulator option
> * Fixes array bounds check in keycode conversion for ESCC device

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~



> 
> ----------------------------------------------------------------
> 
> Daniel P. Berrangé (3):
>    softmmu: remove deprecated --enable-fips option
>    hw/char: fix qcode array bounds check in ESCC impl
>    github: fix config mistake preventing repo lockdown commenting
> 
>   .github/workflows/lockdown.yml  |  6 +++---
>   docs/about/deprecated.rst       | 12 ------------
>   docs/about/removed-features.rst | 11 +++++++++++
>   hw/char/escc.c                  |  2 +-
>   include/qemu/osdep.h            |  3 ---
>   os-posix.c                      |  8 --------
>   qemu-options.hx                 | 10 ----------
>   ui/vnc.c                        |  7 -------
>   util/osdep.c                    | 28 ----------------------------
>   9 files changed, 15 insertions(+), 72 deletions(-)
> 


