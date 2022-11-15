Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 545B26297E1
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 13:00:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouubM-0005gE-Fp; Tue, 15 Nov 2022 06:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouubK-0005g5-4y
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:59:38 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ouubH-0001OM-IQ
 for qemu-devel@nongnu.org; Tue, 15 Nov 2022 06:59:37 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 d59-20020a17090a6f4100b00213202d77e1so16700812pjk.2
 for <qemu-devel@nongnu.org>; Tue, 15 Nov 2022 03:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lDxjoTM+IKi/jtEMS5ce/FPBkDe3kYTDXyiuyv4cfvM=;
 b=nOAJ2nUJ9abmBcnk9WguUIDp5ROTMcrb2E1FLqTRmtmxwlSIo3hWzFdg+3hFRT6u8H
 OHowMvYjlscrPAp46y8q0Iwz4uRR6rME5oXdXE9qwpnPNz+hti3VZ7i0Ki6QEh2FQ6+Q
 7ERHcX7hJs0OgXwIYHCK43kkCdOpIEw27rqdPPNZWKyDB62uv0DCM3jhPJoSeZG1y0f2
 YT4Q1U5vCtW4C7yobziDzaalq5OjfBXwZdbv5aCPPS40VeG/Byc9v1FWcCPuzexBbA+V
 fAyEoGqOzdFs0xWsAVz+Ex/KoNu537bauw5Izuq3KlxlgtoQEEkSvZ42tTPkJiQddG6Q
 Z3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lDxjoTM+IKi/jtEMS5ce/FPBkDe3kYTDXyiuyv4cfvM=;
 b=z5uHDvdJQ8n9LJU8Hveh7n+6fb7z9yLs67iR6mmxCk+adxiX5RZ8aRNWGNXYWBJNPb
 gRQ7PLFvSqP8JMgoX/HTwsLlsjxKCs2pfS+wcxHJFI8zqeX5So/wA/+Ccm7YFw4a0fpP
 hNyuk5DJn/yF6mNSrLDrxAwzIsXgxWqlLsaSGQY20AeuE+lhPsT9PyBTJOf//k9xwgN7
 cKeI665BnA1HwmJrYs9lnptgtF1ovsWT1NynO+4lw55fHWA7cit3HIO0NfXl9g/DIZII
 1EMTWiPKH5Kq0r71CqZDzHIzEXHcArwCtKddeA+kEjAgeyVAPMAg1ObtQLh8Dh+t8bob
 PXtQ==
X-Gm-Message-State: ANoB5pk9lb/4kCM8bs8cMQ1TOZ1OUOmG3k1OEh+PBCcps9fIIJmeOhzC
 dxPi7yV6HUt9uDVMZU+EjhvpIQXsuyAQe6N5YR72vQ==
X-Google-Smtp-Source: AA0mqf704r0+TG3znv5nQZ1DjtZqutIt2LTl9X0RYqXU1uuWBrAqLyri5VossLUljY6qY4eJleYrA8XAdwnuXnS/QVg=
X-Received: by 2002:a17:902:cf03:b0:186:9295:2012 with SMTP id
 i3-20020a170902cf0300b0018692952012mr3701830plg.19.1668513573662; Tue, 15 Nov
 2022 03:59:33 -0800 (PST)
MIME-Version: 1.0
References: <20221115115552.77242-1-mjt@msgid.tls.msk.ru>
In-Reply-To: <20221115115552.77242-1-mjt@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Nov 2022 11:59:21 +0000
Message-ID: <CAFEAcA9nLr67TJMLHXYmofdNUrq9_oufvxoDwFmzUMZ-2LxZQQ@mail.gmail.com>
Subject: Re: [PATCH v2] disas: recognize either <capstone.h> or
 <capstone/capstone.h>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
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

On Tue, 15 Nov 2022 at 11:55, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> Historically, capstone varies in requiring either <capstone.h>
> or <capstone/capstone.h> include depending on version and the
> way how it has been installed.  This has already been an issue
> before, and will likely become an issue again with capstone
> 5.0 which seem to have changed this aspect once again.
>
> Recognize both ways in the meson check, but prefer <capstone.h>
> so it's easy to override which capstone to use by
> pkgconfig's --cflags (or --extra-cflags).
>
> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> ---
> v2: use cc.has_header, not cc.compile (pm215)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

