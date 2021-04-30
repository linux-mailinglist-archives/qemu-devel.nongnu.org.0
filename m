Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EFE4370077
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 20:27:43 +0200 (CEST)
Received: from localhost ([::1]:57904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcXra-0007aI-5o
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 14:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcXJp-0006yu-UJ
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:52:49 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:40913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcXJo-0005ug-1a
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 13:52:49 -0400
Received: by mail-ed1-x535.google.com with SMTP id c22so19950575edn.7
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 10:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lZKFqFBQ9IqlXn92AlxRIrkum5+uRd/oKBZGOREQRUc=;
 b=IdrcVdm/MyksK0sE15Bj+ZJb2kf7pRkdVeFfEF4B/KvMXsCS+2BdWykiUpPITon1Ph
 kv34NxUi67zLqdgAvhmZIzuN7dl894f5SBublo10/+HXj6/SeNcf2IHR/RSHMDgPpI2G
 XL41X5BAVLcAY0kJuuPYSkVnBDfY41d4gwowWEo2JZkPQuJ2883cHf8A1E4Y4u2FFjqE
 gQO8j/AnxycVpOI9KLFqsa3VEb+z5Lft10+pfB7q3UCpV0Mcj4UARERhtca/MES4AtKD
 f8hM9TlyF5+pLfxzacaEOg8oAn18XrRB7ZVaGgWu1HF0NkxjK8ClkUy1FFsFC2N6Os8c
 xaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lZKFqFBQ9IqlXn92AlxRIrkum5+uRd/oKBZGOREQRUc=;
 b=mFW1COJDbXsST2OVDoUMNbnw/vkdwINlyaZIZUS+aKOoiAnkGYSU3vnBlHcrKt55g4
 Mn31pKNCAtLM2qYYx6hbqTMz9n29jFUisfW0Td3aaHsVETvt0pS7aysuGDM8NNEeick8
 RXdu/gNwChkLfz3ezlXJhWx/jylxaZaIz50szVUrvzaaWyY5m23d4xN6gv3GGdQD3bQw
 kAUZJK05qz+gbkLXNvLXTWdqCeWdVmo/UwvVkbBLUnvyASRaE9vWH4cVoa4aUE+rIR1T
 H5ujmfZbxaA7MJqUN4yOwmsyVRn6ebOJcWE1Z2JbDr3ccAuRPnY3OCldGsaQ/HnCSlP9
 eOYw==
X-Gm-Message-State: AOAM532cjaL360toAUWrE3NP1flff6sGtxb0DDT/pp45VPylpEF/N/mm
 MUpSCaeto5tcR7Y85s7b2oTydEp/gWcDRtKVtpaymw==
X-Google-Smtp-Source: ABdhPJzDV2dmXkel3vf+FHWYnfsNcrZcJ+rvYaSQ4fT8l3a8pgZJUWRlROddav/YUIi1bo2iXdvaXQsmlzF1uHJ8K9E=
X-Received: by 2002:a05:6402:3079:: with SMTP id
 bs25mr7586181edb.146.1619805166458; 
 Fri, 30 Apr 2021 10:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210430114838.2912740-1-armbru@redhat.com>
In-Reply-To: <20210430114838.2912740-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Apr 2021 18:51:44 +0100
Message-ID: <CAFEAcA_5TZGeAHzXeq+1pKCV=pTj_jfXRackVneYYehOJG2xDg@mail.gmail.com>
Subject: Re: [PULL 00/25] QAPI patches patches for 2021-04-30
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 30 Apr 2021 at 12:48, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit ccdf06c1db192152ac70a1dd974c624f566cb7d4:
>
>   Open 6.1 development tree (2021-04-30 11:15:40 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-04-30
>
> for you to fetch changes up to b54626e0b8f423e91b2e31fa7741e4954cebd2d6:
>
>   qapi/error.py: enable mypy checks (2021-04-30 12:59:54 +0200)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2021-04-30
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

