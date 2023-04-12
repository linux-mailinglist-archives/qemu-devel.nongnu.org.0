Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 843D16DFE2E
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 20:58:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmffF-0006jO-2c; Wed, 12 Apr 2023 14:57:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmffD-0006j9-H3
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 14:57:51 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmffB-0004ho-Hi
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 14:57:51 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-504ea515d6fso1062381a12.1
 for <qemu-devel@nongnu.org>; Wed, 12 Apr 2023 11:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681325868; x=1683917868;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mwuMRWTckpmHAxe9wcRRZwJ9PRGYotK6uPdDjaX47Hw=;
 b=UFvkjSNf07xqd6h81iyqZZVbdIKwVidmZpnv982GZosyT3wl3xhCoALO9/LDw45xnq
 0vzZ7KxG3EtKzQgOX3qdBV0FRh+Qoxi+WvK2hFMxIdDaAszhRqaKgcSYYnL50ZjlSM4n
 gQQkYf0xVtuA+P5lWQTrymgcX2CxMzrqm75TY/dEFCchTk8RsyB5djPO2M0olMCkXTtu
 NRu5ImExgJ6ZVZi0c5PAOCgjTSJxejwJHKI4ekw4imu8ReQYQfpmqNjfAGEzQNxewuyQ
 meemcXyNP1InerS5KRghmuEGZE0+/ABLAQA1gcBDnrDwER+q2cZ1eO0IlLQwb1yRLqHC
 PFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681325868; x=1683917868;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mwuMRWTckpmHAxe9wcRRZwJ9PRGYotK6uPdDjaX47Hw=;
 b=EWEkZKcohnjyTrVvsJfCi1qUuMJGqggW/pBKv17GZQdaxYkM6K6hV5smccIUfHXqmf
 DiGAhcQL4lmPxUxK6yaLdBRZwXml26PULisJDo4X1YFDLdHaBve8A00jEr3eX+GT9eNq
 gsURaJB0d1PhMRNErZKbWevZnk3A+sy/6KNobtqIadoL+n8YA7VyCeZqP/rrTzmyvKhg
 QaM8oUGIKboXEnOy7NeN1eFAmD4iceQIVqzPlMMbhvrgKPe47782bWClwRJ29k9pyDJx
 KRJfSgcO/L4OmgVc/wYLeswnHtZR4lQvxF0Mw8Exc9T55Kcb8TZnpY6cshqszsmfLS+A
 Bl7A==
X-Gm-Message-State: AAQBX9f0vUX9anAZaAxzRhAOam9ZkoqqmM3FVvwGMGg3TSl5Z8PIAVHK
 kY0L8dWZ0MnmurWzq4lVRZEDj/8hYw9aD1Mlmen5SQ==
X-Google-Smtp-Source: AKy350b4Tq5Y77eGxUkuJXiU9YL7lKJFcM6uLvpeqBXHaxWzpKfedPmHYoMDes2bLhYp48y7W4tZfu4nqa5bO2ofXBQ=
X-Received: by 2002:a50:d71e:0:b0:504:9c1f:1c65 with SMTP id
 t30-20020a50d71e000000b005049c1f1c65mr6052761edi.6.1681325867781; Wed, 12 Apr
 2023 11:57:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230412185102.441523-1-dwmw2@infradead.org>
 <20230412185102.441523-6-dwmw2@infradead.org>
In-Reply-To: <20230412185102.441523-6-dwmw2@infradead.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2023 19:57:37 +0100
Message-ID: <CAFEAcA9staAPX2buXO0MWj2yzVU1n22xLx-PEvOa5Aa2xC4YWw@mail.gmail.com>
Subject: Re: [PATCH 5/5] hw/xen: Fix broken check for invalid state in
 xs_be_open()
To: David Woodhouse <dwmw2@infradead.org>
Cc: qemu-devel@nongnu.org, no Stabellini <sstabellini@kernel.org>, 
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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

On Wed, 12 Apr 2023 at 19:52, David Woodhouse <dwmw2@infradead.org> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> Coverity points out that if (!s && !s->impl) isn't really what we intended
> to do here. CID 1508131.
>
> Fixes: 032475127225 ("hw/xen: Add emulated implementation of XenStore operations")
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

