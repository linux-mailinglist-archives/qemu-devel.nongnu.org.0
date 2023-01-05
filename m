Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC4965EA48
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 13:01:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDOvh-00005I-GR; Thu, 05 Jan 2023 07:01:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOvf-0008UW-3p
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:01:03 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDOvd-0000Jp-No
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 07:01:02 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 j8-20020a17090a3e0800b00225fdd5007fso1810172pjc.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 04:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=k4aXZB5CAe2RGX7pZm+qkVZRnJqL1F+GkHrZt9dnEAY=;
 b=t/7j3o9cEX6R7UaEUFMStx/tqoNWqrwwGqflKOzZ/xKZhn8E/oD/sg3yJH+HtiSFh0
 hhFVIXH20EfqOya1x7Mc4DBca2TRAPweWGzGqRWEgG4firiRQTaCs5NwkIiZpmmewTS7
 vchcM+jeVIbAY9FRPv/3cO0K+FvC9ykNp2mf1z79MHGb1os0zZjsps25DeUHWvk7boBk
 X8vqmsZP5ZCfNoo5Gx+Nyxl9vvMLy1kuqWRFWuIUfugR/omV1wmS568sslCjv4cCGJ2P
 deqAQOkRgIt79E9SWz0hhxUjAHrqPYfUPZ6DITd3mdJ0/N+H5UdscH29D86+SatIJYiO
 WDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k4aXZB5CAe2RGX7pZm+qkVZRnJqL1F+GkHrZt9dnEAY=;
 b=p4R0iK/NC/+tpmTxBj00HgNUEWbto7gHjn0b3VRdLCBusZDLAQj7CsHwWs3XnK6ECA
 +IeHyeSkZTuGg1n/CjkjN34R++DwKAUpOWPNo9cqMOSEsVh4OEl1yxp2ewHxkn4ssadY
 fqt1ZkzKTvG/mBKi6T9j5FWDurwHXgOZ+RXlipZ6Sf4p7Yi0CtLSTZQb/+rhNwqQ+5ma
 Egsoe3aEnrAwtmx82ZmOjoKo3h824dtZFxk0tNNYdsSNU+3nsUi2fXKbkH7tlehwW+55
 PwsLtFv15FEOKlROi6kpOCZBvpuUKDDP/klGYo6ymfCpVTXkURO6rRPnwg4M7OyfLTcW
 nfDw==
X-Gm-Message-State: AFqh2koQLa9yHhE5MPFRh8yB2uZy8/FjcCKV0hM5Vh9YMb4qWyWwlakr
 U16DvwZFK/zpMljHKMx9mn0eOy3IsGgBeLKQnF6AGhdlzeJIbg==
X-Google-Smtp-Source: AMrXdXuMIynCqUVsxhA4S8P7yn5w+ecDJljcJpFUezaD74BjYX0BLk2sZkQ9ty4TYJa+CsUGBzwhtOW24Yuqxpw5WFE=
X-Received: by 2002:a17:90a:b010:b0:226:b783:67f with SMTP id
 x16-20020a17090ab01000b00226b783067fmr388115pjq.215.1672920060192; Thu, 05
 Jan 2023 04:01:00 -0800 (PST)
MIME-Version: 1.0
References: <166990932074.29941.8709118178538288040-0@git.sr.ht>
 <166990932074.29941.8709118178538288040-2@git.sr.ht>
In-Reply-To: <166990932074.29941.8709118178538288040-2@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Jan 2023 12:00:49 +0000
Message-ID: <CAFEAcA8SmtaZmQEFUuwD94p5CGB1iSGjur6+=KyWbTeXdoQCvA@mail.gmail.com>
Subject: Re: [PATCH qemu.git v3 2/8] hw/timer/imx_epit: cleanup CR defines
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, 1 Dec 2022 at 15:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> remove unused defines, add needed defines
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

