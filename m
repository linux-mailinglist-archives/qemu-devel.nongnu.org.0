Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8E64EEE8E
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 15:53:47 +0200 (CEST)
Received: from localhost ([::1]:50954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naHik-0008Bd-Js
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 09:53:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naHfl-0005q7-8h
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:50:41 -0400
Received: from [2607:f8b0:4864:20::b2a] (port=36454
 helo=mail-yb1-xb2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naHfj-00038q-QE
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 09:50:40 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id f38so5146092ybi.3
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 06:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ej7V6dylC7de1Ib1y7u/6sdKykMvqCzdkfbnZlqFKsk=;
 b=OIQi1Z+CjTO9XE9OEEyMGT+shj+++pPFt1MFHwhmGkuARhd89mM6eVmvtARjdcrc1U
 BxFee7ISYK+yzSF7NUNVPfL6aTimuwH4+3W4iYAbqbY5hfeZu47VbHWux7K8mI8Nq/wR
 +BxlGjuOahThCx/MSWbUiVu3JClDoMByY7e20Fv9+ldTNoUqHB1t/927Bi3aWeLt2+rZ
 rXCsKjp0CMHJZHdMSaS+DKnYdtz6YQ1Du0Dt/e6a4D1ZHQv384XSuQsBx0ytocS6yNAH
 fJ5bC7Aej33SfA7C0VMksno3KLigVoukrtS5kKFuKOhyda2iv2y1g6+6hPcO9qc6k1Yy
 mHYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ej7V6dylC7de1Ib1y7u/6sdKykMvqCzdkfbnZlqFKsk=;
 b=M6o3k/SzXDnr7KWhflAgvgTO4vVKQEbGb6XyPqe/hKJlea5T2vtOQDUPSJrUJoX5gJ
 hDwAynYL/3zUV5tsw4oRCtP3J+hhryzBScbJ8TJ8ZM9Hgzv8vSmN4Bh+uhKD8PbqlfwH
 w4MNjRQ97blScd0xnuRo2/CeFz+wkMau6/JJcoYearjHROAKM3Aa97BlE/SdvEi33QU5
 mt7xwZsSXrfw5NfYtRaelMjwLoiQ1RszwKQTO7y2aRFfAgx6WfCfE3ZqatVnt+0wgCHZ
 MalIPafOFjyn3MEMudh6FV9kDrHC6+DyEAJZjBKenT/6szgbNt8GL3RR9FDjrXBV7gd4
 AGqg==
X-Gm-Message-State: AOAM530bEfn3z8TfA+L2wflHryw7vg7BXhF67QcsIm1fGgLYzm9PYTqo
 wd25Gi8sgVXp6iCXsDQGfvpoWUP4TTNZgv40JTCCFYWZ66EXVQ==
X-Google-Smtp-Source: ABdhPJwmwhfBESo9gOrqbYAMqI7G6uQdcG8RIhIX4bj8jQQ24OhX3hdCpCM+ulN7YC3tfjwJzadAJgbrfDyxpG2O4dM=
X-Received: by 2002:a05:6902:701:b0:638:9404:baff with SMTP id
 k1-20020a056902070100b006389404baffmr8785697ybt.479.1648821038525; Fri, 01
 Apr 2022 06:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220401132240.79730-1-richard.henderson@linaro.org>
 <20220401132240.79730-4-richard.henderson@linaro.org>
In-Reply-To: <20220401132240.79730-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 Apr 2022 14:50:27 +0100
Message-ID: <CAFEAcA_YNg0LAO5-rz2OFJgJnfu-L+Q-eN2FC2iWTyfA7OfhuQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] softfloat: Use FloatRelation for fracN_cmp
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
Cc: alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 1 Apr 2022 at 14:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since the caller, partsN_compare, is now exclusively
> using FloatRelation, it's clearer to use it here too.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

