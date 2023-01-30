Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39747680C3F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 12:47:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMSd6-0004rl-6e; Mon, 30 Jan 2023 06:47:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMSd3-0004rU-0T
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:47:18 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMSd1-0003zR-4A
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 06:47:16 -0500
Received: by mail-pg1-x535.google.com with SMTP id s67so7426791pgs.3
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 03:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=puN5eMLuzQhrBSmRg0X27iq37JGPsGDWT3cdxc7Nppk=;
 b=Zuovbyjkzt3MUkFxJk7kOTNrbWUxudRGUGGIDlxPBV2ESgvuauoT3JOM6sMylGlt9l
 GIvKXGBXorTBulRVFzp3DAR60EBVNhZVfa1zjpTw1zPjhZEg1mn8vT8g9TCprTg/FYg3
 BBPJsb5KUn19ROICRflW5wx9Dk0XK/abMwlA4mmIQFd3JLz3gafanyD3AX5DtjcPF/Ue
 moPciT5buWc5LTKaP3khusObcCTVG3augQHAswpLgv/KQq6cDir7sVscFO6RK2uVzbln
 pLCf2S1vEjt5u+0PD9nCZ4eWCCliPTGM+WLdaIwobM+EvfF5PEvgTsjk0A74UQl8XBtU
 T5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=puN5eMLuzQhrBSmRg0X27iq37JGPsGDWT3cdxc7Nppk=;
 b=hREoyk/B+OgrUZ/rQJ1J2S87qkdE3NwUCHgwPNRJuL7ZiEYzdC0Ldr0gXg9gwS2UZX
 rJAtpDiHloSj20yYyfoSQDKM4HYlOyG+LbbjfpaEGJsEV/D6ro4VyChb3zsbbHTSCtES
 PiwpubUCIQ0jIJWVubpujodsYt4hAj0RBZeeSHsbOvqxNKPVYZVPIWTyrhh7Hd21nL9Q
 9wfisSbq5uRXAdBAclTqKkYWudZTuwaADh8oEdDy+9TJ06x4b6W3O8qK9tiGoJ/tlAHS
 eGKFqY5K4vLKOUiwCg2MmccBV/9opNNxKRlyF4Gg/+ROKXD+5OsbRpG582Gx0FId4Fof
 9CmA==
X-Gm-Message-State: AO0yUKUYLF3Den34/WJkWqU4cW8gWRjV6Xxx5mGy6u2oYUCxRAwabjQ8
 Z/n1pe12k2aLW+Fa6ar83xbUeCK13Q9fZAua5ck/FA==
X-Google-Smtp-Source: AK7set8l69h22Vp9PUayRJ0wa5y5qp99ce/8tu69Zq0TwzIAE8eDqVm/WSIg5ev2aOXwDCHgb8v1PPurytrV9HgbSKo=
X-Received: by 2002:a62:144d:0:b0:591:8ac8:7c78 with SMTP id
 74-20020a62144d000000b005918ac87c78mr2195584pfu.54.1675079233586; Mon, 30 Jan
 2023 03:47:13 -0800 (PST)
MIME-Version: 1.0
References: <20230130114428.1297295-1-thuth@redhat.com>
In-Reply-To: <20230130114428.1297295-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jan 2023 11:47:02 +0000
Message-ID: <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, libvir-list@redhat.com, 
 Paolo Bonzini <pbonzini@redhat.com>, Daniel Berrange <berrange@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Reinoud Zandijk <reinoud@netbsd.org>, Ryo ONODERA <ryoon@netbsd.org>,
 Brad Smith <brad@comstyle.com>, Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 30 Jan 2023 at 11:44, Thomas Huth <thuth@redhat.com> wrote:
>
> Testing 32-bit host OS support takes a lot of precious time during the QEMU
> contiguous integration tests, and considering that many OS vendors stopped
> shipping 32-bit variants of their OS distributions and most hardware from
> the past >10 years is capable of 64-bit

True for x86, not necessarily true for other architectures.
Are you proposing to deprecate x86 32-bit, or all 32-bit?
I'm not entirely sure about whether we're yet at a point where
I'd want to deprecate-and-drop 32-bit arm host support.

thanks
-- PMM

