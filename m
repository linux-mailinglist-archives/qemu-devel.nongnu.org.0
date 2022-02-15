Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E89BD4B6C1D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 13:36:52 +0100 (CET)
Received: from localhost ([::1]:60594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJx4d-0008NG-Kc
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 07:36:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJx30-0006vf-CI
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 07:35:10 -0500
Received: from [2a00:1450:4864:20::429] (port=38574
 helo=mail-wr1-x429.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nJx2x-0005y4-HQ
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 07:35:09 -0500
Received: by mail-wr1-x429.google.com with SMTP id d27so28079982wrb.5
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 04:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=YeEp0jxhwVzIhsP53Qw/5aYZe739ZP2m+4WJJFXTaoQ=;
 b=WtrFCPZaXt8nHe9iw9mV0bswCg/o0anRaTqFJKiUiJikhQaB1XwdCsErv6kyeqHMTw
 VhqkRfw95aD27vT2LyASDGactPlvsCSwJUy4wdJObAQxTnUmBqgVcrDJY7JPuQHiTJ/j
 qTfKA5MH7NGDqNeF8k7im/oZ3kzD/OPc3WNwADtXcw/9FaJR4gCJIuNrBcBAJ6VMsvGM
 9hUog9QSxu3xXHhiZqN9Y5SJ+ZcZpFpVEdfAwVmlj+i75EuyKar9DEm5tK7TdUwMcKpT
 VInzboppkJsi+qE3axsZ3UaEpqM5rWBQBlhWnDK5WhfcsDmPkSI9fa1PqPxOGDHuRorW
 KPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YeEp0jxhwVzIhsP53Qw/5aYZe739ZP2m+4WJJFXTaoQ=;
 b=FqrXGIICWq345zFiDnwedVY+2UYPbAnWbmgcw30+WbLATte7ozVB/uJI6q5vU6BBuz
 WdJYBNb7Fucu87UyHQOFXhiEcptl13ebXo7tuSz17R5zsOWEZw6mTbaV2RJyKyXmvaLI
 m9g8UQd5OAxkFD2GvZLfza68XkMe2M8qq29uDEkxohl7/N4QRQl/d0CKx8I3JSd/7gdr
 q6D99m84kz9RzHky4DraT4dd78a4pFn/srUa+qq9roSxnrPxmkki5e5G9/g7c0a88Y3i
 dCwYtc1pzT5dN/1xXlhM0q3ejtCeKCdA+ODhH/WnQFQ2YE11lpy90KVNNostgyvkfM/A
 yV2g==
X-Gm-Message-State: AOAM532P9jO3gLlxxXKjk+q0XkVlJXl5939i0kBrn0c1vtzjcw7T+EiG
 +U8QwCGgbNPei1eKIUgfOOkyHRPTdy6mNZofQb5rxw==
X-Google-Smtp-Source: ABdhPJzK+Ws2eUbIlqPgkxlopqQTBgE0NhNFcR/AiiBqF0ApW0EVkzdlOERQuWwrw7d8QYDzHLj+v0ITpR/mzY4Sxfc=
X-Received: by 2002:a5d:6d8d:: with SMTP id l13mr3018617wrs.295.1644928505971; 
 Tue, 15 Feb 2022 04:35:05 -0800 (PST)
MIME-Version: 1.0
References: <20220215120625.64711-1-f4bug@amsat.org>
 <20220215120625.64711-5-f4bug@amsat.org>
In-Reply-To: <20220215120625.64711-5-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 12:34:54 +0000
Message-ID: <CAFEAcA_Mp5=iAh=LE+w7Ky+nSHZRA0JSjfwom5JWYxKn0s8HXQ@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] ui/cocoa: Ignore 'initializer overrides' warnings
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::429
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Feb 2022 at 12:13, Philippe Mathieu-Daud=C3=A9 via
<qemu-devel@nongnu.org> wrote:
>
> We globally ignore the 'initializer overrides' warnings in C code
> since commit c1556a812a ("configure: Disable (clang)
> initializer-overrides warnings"). Unfortunately the ${gcc_flags}
> variable is not propagated to Objective-C flags ($OBJCFLAGS).
> Instead of reworking the configure script to test all supported
> C flags in Objective-C and sanitize them, ignore the warning
> locally with the GCC diagnostic #pragma (Clang ignores it).
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

I'm not really a fan of #pragma GCC diagnostic directives in
specific source files, unless there's no alternative or
the issue really is specific to one file.

thanks
-- PMM

