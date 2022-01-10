Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1726F489FFE
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Jan 2022 20:16:33 +0100 (CET)
Received: from localhost ([::1]:40996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n709f-0003eO-Lm
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 14:16:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n701d-0006RR-0X
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:08:14 -0500
Received: from [2a00:1450:4864:20::42b] (port=46624
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n701b-0003DF-6h
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 14:08:12 -0500
Received: by mail-wr1-x42b.google.com with SMTP id l25so17779782wrb.13
 for <qemu-devel@nongnu.org>; Mon, 10 Jan 2022 11:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HPgT7Ie4u3MRffZ7cqR7k6l/1WEZksCiuG/enZ3sf7k=;
 b=kx9QmUS11+XxXpYLcFoCc+mbv+8m02pEYUCG3TJHydwBSG6hmGFoyrDzZik1U8nbJQ
 xzPf/aZV4XIgSYLirPKbdDwptF0RcXxsIn9O3iThhYOIH+7/flpjHN1AXQx1pBdODPM6
 LvTucbgYxgpdRGID19NSC7c36++Xinz1bdZ34z1pb1hp3rsBIWTLDLlsNpa79uhLFtqw
 Ri89uK5/ZVr0tr4USTRhSOPmK+QdQY31ZDW3wAYeZXJX72V0IXRqPB2QjgqsjAWpZ01C
 m27hsqOl2W1X8euqj+wwRhKxxfFkAxbSeL1smJQV0LKEj3pFO38p9PDds6flvCwvZHfX
 t8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HPgT7Ie4u3MRffZ7cqR7k6l/1WEZksCiuG/enZ3sf7k=;
 b=1o3iYQzXznmUwxZspIXk6/9PDUUZqCpZs5IB7qHF0Nl9rLqntQH3r8Rcg2rVOK9mok
 KAeCYXM8+QiPlCfGONMqUKmtGQFHNnrHyFWwXFg9ss9eMFkMsgjG8oPaFA2g0WKsw3j2
 2qNWvkN3YS87vg1fag325VcZzvXfAdaLl7SsxIr0iTGa3FuN0xBaEOSqY9xOsmT/aVS0
 sN/p/tHCSDrC+0+Hm7K4CFXJfORW06sVrONgjWz7p4w3hTaCFKGYDfwWmhuQs/uF+N6d
 8FUaaQZNbc/NHQ/IO0fCN3h8kf45f1jQ7svA9Z2t5bxwPbzdxLh96SX5cRxFTjgnbDQA
 IW3w==
X-Gm-Message-State: AOAM531QYYBMpMjN8soHeeFcSWPqvi11G3HgvCkNpWy21MRzWIhq6AvG
 lRP/ii57vxRoCQt2DJVY7XzL6wyb5fJRSWe+elqNfw==
X-Google-Smtp-Source: ABdhPJzL7Jcci1fTIDgaoETX7wdokLTqCpptzLrsEMVeYu7RD26n6S2TRDxQB2JPd667/sDJj24tDihPDQ0vEZM02O0=
X-Received: by 2002:a5d:6986:: with SMTP id g6mr862628wru.172.1641841689205;
 Mon, 10 Jan 2022 11:08:09 -0800 (PST)
MIME-Version: 1.0
References: <20220109170612.574104-1-f4bug@amsat.org>
 <CAFEAcA94iQ_-dkNaQD62qSb_5emY5mq=OvR8jAbDkcW0YwUoeA@mail.gmail.com>
 <9c016476-6679-5d23-296a-6546930087cd@gmail.com> <2798332.tR5H1UBy9i@silver>
 <524515d6-2fb5-15c1-0aaf-bcda3684cd00@gmail.com>
In-Reply-To: <524515d6-2fb5-15c1-0aaf-bcda3684cd00@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jan 2022 19:07:57 +0000
Message-ID: <CAFEAcA8cz=Vsjeme9rzo6GTwwNL=ZcY+pwVcV-22kRLWYobV7A@mail.gmail.com>
Subject: Re: [RFC PATCH v2 2/6] audio/coreaudio: Remove a deprecation warning
 on macOS 12
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 qemu-devel@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Jan 2022 at 19:01, Akihiko Odaki <akihiko.odaki@gmail.com> wrote:
> Assuming the correctness of the use MAC_OS_X_VERSION_MAX_ALLOWED is
> irrelevant with the nature of the identifier (constant or not), the same
> problem is in ui/cocoa.m:
> #ifndef MAC_OS_X_VERSION_10_13
> #define MAC_OS_X_VERSION_10_13 101300
> #endif
>
> /* 10.14 deprecates NSOnState and NSOffState in favor of
>   * NSControlStateValueOn/Off, which were introduced in 10.13.
>   * Define for older versions
>   */
> #if MAC_OS_X_VERSION_MAX_ALLOWED < MAC_OS_X_VERSION_10_13
> #define NSControlStateValueOn NSOnState
> #define NSControlStateValueOff NSOffState
> #endif

It's tempting to fix that one by just deleting the ifdeffery,
since cocoa.m already doesn't compile on 10.13 (it uses
NSPasteboardTypeOwner, which was only introduced in 10.14)...

-- PMM

