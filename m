Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2AD49E93C
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:43:09 +0100 (CET)
Received: from localhost ([::1]:48128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD8nb-0004ve-Tj
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:43:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD7k1-0000LR-P2
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 11:35:25 -0500
Received: from [2a00:1450:4864:20::435] (port=42629
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nD7jq-0007Gr-TC
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 11:35:21 -0500
Received: by mail-wr1-x435.google.com with SMTP id a13so5792450wrh.9
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 08:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=b43VU1433ed+Pp/Gup7wKiAjnoW7YhMhm7mBuQZGR/M=;
 b=eF9G678B7o3HhYW5X2Gd1bkQiieC5eMbj74g1HP+ykmBIKMkMEuKHIsh3RbOxAcX8e
 c+M+PHAkCR8NTEyNJHsoEAtBstOZG6HO9nQXRQ1bB7MHfHZkWuUVK4HxO05CoDFgDR4+
 cKhyLyjH39u7J4W2JWd0cM8k4chRUNt5IIfm8r/XQw+Zry4jpTxiK27r262rtUkLGz0I
 4+7LzaLU0YTfZU+19FJkilmRd9Pdzsxa9dAy7cB4JbXn0DPekdfGN4VhLa/inT58qyNH
 x8VTLk6WBULPzYqqaDc34jI1G205ZSKuBAceYjs9sTXpX22l1qXdSzkIR4PGRgg5Ut16
 0xZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=b43VU1433ed+Pp/Gup7wKiAjnoW7YhMhm7mBuQZGR/M=;
 b=XzaapN/nYCPJjSAJaU9KRVmk5/8V6zjujgt9Cg5clIAQBaAUTtJcUbuxmIz8foNUnV
 0UNjMtqZlka7QwST8D57ELoOl2QQwaNhobZCHnFJ4clAhoP8HnKDE4FA8kln2KTUo7zF
 oHBT9LT3gQbOX8l7ZiJzKHilotrUTW7qCys0BrPxjaJym936JSaRx1+dTlJtEwNTYuJK
 vlVY9kvZLYjaMMJ2nA/e2da8omKNuFBS+VJ3gYAKEFBmW8PqNmCj4UDdS8vvWJyPi9BW
 61ZoNUGR+J/2UUr5NiLgKBoDTnfd2OSqkz+qocziy24oMKucN7ledbE77urxdLkXErOt
 fTqg==
X-Gm-Message-State: AOAM531WRUXCRuNIBRDXQjHEWX/zOgjVIbT1pGpb/O2Xz2mISGM5iaOM
 E2fTtn0T63hpMc29YwMSRrirqP8/XMaVbjNHWcJWzz22w50=
X-Google-Smtp-Source: ABdhPJxXErsmFtnW9PspEEEA6eFrkng5uQWgw7K6odcnSph+dndtiquqry01faDxscAJidoMX/3PjzD4pdFCx4jgGG8=
X-Received: by 2002:a05:6000:1acb:: with SMTP id
 i11mr3801849wry.172.1643301307328; 
 Thu, 27 Jan 2022 08:35:07 -0800 (PST)
MIME-Version: 1.0
References: <20211129205505.1235070-1-peter.maydell@linaro.org>
In-Reply-To: <20211129205505.1235070-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jan 2022 16:34:56 +0000
Message-ID: <CAFEAcA_SjALXf813F6f1uuh5td4FQdBMaP1m90vu00hS1VmjbA@mail.gmail.com>
Subject: Re: [PATCH for-7.0] rtc: Move RTC function prototypes to their own
 header
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 29 Nov 2021 at 20:55, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> softmmu/rtc.c defines two public functions: qemu_get_timedate() and
> qemu_timedate_diff().  Currently we keep the prototypes for these in
> qemu-common.h, but most files don't need them.  Move them to their
> own header, a new include/sysemu/rtc.h.
>
> Since the C files using these two functions did not need to include
> qemu-common.h for any other reason, we can remove those include lines
> when we add the include of the new rtc.h.
>
> The license for the .h file follows that of the softmmu/rtc.c
> where both the functions are defined.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I have added documentation comments for the two functions, but
> since my understanding of them and their purpose is little shaky
> review would be welcome.

I forgot about this patch from November; since Philippe has reviewed
it I'll take it via target-arm.next.

thanks
-- PMM

