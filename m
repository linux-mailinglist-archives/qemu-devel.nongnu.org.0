Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0080340313
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:23:49 +0100 (CET)
Received: from localhost ([::1]:37752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMpoj-0002kw-2Y
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:23:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMpnL-0001ck-SC
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:22:23 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:33450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMpnJ-0000Qa-Sw
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:22:23 -0400
Received: by mail-ej1-x634.google.com with SMTP id k10so3052373ejg.0
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 03:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XHc/Lz4NJiHcXrDCrbR932NvjxXRDnf0TbeolB53HcQ=;
 b=adiBQ2DZVJExIb6oSNyyuLITDHALAZSIfuSO4MBamOSCSgUMFyHS39+R+C1POmTutH
 UoKZMmbvpv3NyvJSQ/gRU9PP6xCHlE3ms9Ko/za47Yon5epXamE0fEu7tbkRCADYzZmB
 61i5Vi5xqj4V3s5hs7PzZQIZ+eWfEQ77H2fVuIOW8J3B+Sjgnxb1BcJ99D5UcVql0Ukl
 y8GPlVKu+Iml2CsVacJpOuVhcBzJ978rkr2+66/s+bykDk6kjpWezszD8hI8zGIcJtvX
 LAPuHpAxJgbImKXLm0C8ml7wVUZGOzOAbuUYF2sBS+kzTPDIYXTVlY2kihgsr3e2mXhv
 wQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XHc/Lz4NJiHcXrDCrbR932NvjxXRDnf0TbeolB53HcQ=;
 b=J6ZfZ1xuVyqwmjXJowQlFpN39IykCSgqVVKfVDr9abfcwsD76SYUy1Un2was2dWUIp
 AIftCD8dJ6hFLn8ul0bOXesgBKCJEW+kbNtKbrHpKv2vY1MWbEIS3RB+es3LTLA8hkju
 g6eh4cXUPu8PgYsn+ek1bN/ptnPJ3Nm/ZsQtIhK0D1OVsG+wrfBGDWXZghPGUHrgow9l
 mnRFSkl+kdbYGBopD+XAf8ozQP1lWU+YT+uqOaBwVmehxz1lZRu+y4ESxnPmd+T/zUgN
 EPFtcPh86NEwDYXvLCNHHR9cEEHLESqRTPM6HcMEzvwJAMS/xLAz8PQoJIa/5PNGyo4V
 WwNg==
X-Gm-Message-State: AOAM530lhpdFW7JcnTbHspGHjD6wk6EZSWh2lAVFKcQCOU7qMZcAegAc
 4PMfqUQOjMeid83YmIRQL9gAmg+aTdGhJMC9GsaQVA==
X-Google-Smtp-Source: ABdhPJxZa9uXj+bMJgfANx7Rr7DxngVHhsHyhf1OevDdNMBN7ZCsI5uFwDTMzpAeUCXprWnDSKm7DmCVrw/Km0WkJSo=
X-Received: by 2002:a17:906:c301:: with SMTP id
 s1mr39406752ejz.382.1616062938425; 
 Thu, 18 Mar 2021 03:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <YFJjIq45ggSZz0CX@work-vm>
 <CAFEAcA8aifakYwKn0umNbuCVtAsa_1svEGEq-coj9iVo3b1WPA@mail.gmail.com>
 <YFMpCPtMJzXUeeIk@work-vm>
In-Reply-To: <YFMpCPtMJzXUeeIk@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 10:21:54 +0000
Message-ID: <CAFEAcA_+Yvn5S8P3zwPcsO9HF=0rXCJrfUZKs6RAQWhdyG_-fQ@mail.gmail.com>
Subject: Re: of AVR target page size
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Michael Rolnik <mrolnik@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 at 10:18, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
> diff --git a/migration/ram.c b/migration/ram.c
> index 1ee7ff9c6d..f053d45f3c 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -81,6 +81,8 @@
>  /* 0x80 is reserved in migration.h start with 0x100 next */
>  #define RAM_SAVE_FLAG_COMPRESS_PAGE    0x100
>
> +#define RAM_SAVE_FLAG__MAX RAM_SAVE_FLAG_COMPRESS_PAGE
> +
>  static inline bool is_zero_range(uint8_t *p, uint64_t size)
>  {
>      return buffer_is_zero(p, size);
> @@ -4101,5 +4103,10 @@ static SaveVMHandlers savevm_ram_handlers = {
>  void ram_mig_init(void)
>  {
>      qemu_mutex_init(&XBZRLE.lock);
> +#ifndef TARGET_PAGE_BITS_VARY
> +    QEMU_BUILD_BUG_ON(RAM_SAVE_FLAG__MAX >= TARGET_PAGE_SIZE);
> +#else
> +    QEMU_BUILD_BUG_ON(RAM_SAVE_FLAG__MAX >= (1 << TARGET_PAGE_BITS_MIN));
> +#endif

You should just be able to check against TARGET_PAGE_BITS_MIN;
we set that for both the TARGET_PAGE_BITS_VARY and the don't-vary
case.

thanks
-- PMM

