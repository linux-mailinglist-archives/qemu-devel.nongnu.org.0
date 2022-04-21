Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFDA509DFE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 12:49:35 +0200 (CEST)
Received: from localhost ([::1]:39668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUNS-0007Uq-OT
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 06:49:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhU4z-0002oj-Qg
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:30:32 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:45685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhU4x-0002IK-86
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 06:30:29 -0400
Received: by mail-yb1-xb34.google.com with SMTP id g14so4597893ybj.12
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 03:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Gz9Lii9GKOKWdgiXgfZKu/yHcP1nd30WO3pM81LGP5A=;
 b=hXk3jpGkeAZsCZAURYdm7F6Z9Az7N9DQZ8SjBGksA3S/ZCaatTo2Av364QwY8/vIbF
 zS9vgxZmfZevxTy2t6jH+ghl+ton7nlsJkFtVAEcEFe3gQFTfHAPbJYhA8AnJZ7mgz/F
 p0j8XstENtIV/b3Y7l5CAlThETX9l7KhdhROHACri5cMxnZPOJFGG/S8q7rsm872hDJz
 fYsgtqSsCq/JQSRewtvPOZ8Ye5Zv/QqXEjU6NpqqxAeMMs6Vxs4msaYxZvYJFAFmjiVQ
 cE4wRQ0Pj/7de76QzClbL4v5hfyxsac3em05TxpjQmmMaqyLAxe+bvBi4egDF47pdIZF
 1qkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Gz9Lii9GKOKWdgiXgfZKu/yHcP1nd30WO3pM81LGP5A=;
 b=uAimy03ps5k+wMjAvRm834qhIt8kjGc5ejnNjauANmErNdkXJdUAscwC/q4Y5hhyWZ
 AZJmoNFG2+Me3jSf0ZyHkgKQAK2XQ2wcysadJK8FQisEkjh+adqS1VgoLcFBdPwHB+Oi
 fBt6tOvBdKLqmDWtonD1ryVD7G9BaptsNpGTZeM3u4s6LNJFGNemNgFGtf9AOwHWGIae
 lPD7e23hyEQuSKc1O+lhYhgBLZApExdqPiJJBoPn8rr/StTQbyYG0m7MUSYp4p4SvZF/
 omN/1R87ABndTEBQb0QRIJyLqyLf4/QfL4TU05dY9i/Rw99E6x0Pv6DzQhjFzWv4b0ER
 7s/g==
X-Gm-Message-State: AOAM533Ukwi3qFEk6oTIjI0kLQ2zfxyu3rYDpRSZUAIm6Mib5LjYV4lO
 9mNyH820qhjUWoW9msn7xB97cDsNmwkOIf1WikIzDg==
X-Google-Smtp-Source: ABdhPJyKuI/AgaysQRWxpyXANm5IJ1s4eyjMCHzgdZyhGJ2tuIfaFtBXcN4665k8AX2xwZohgr9DjxvGxkASZjW079w=
X-Received: by 2002:a25:cf4d:0:b0:645:755c:a5af with SMTP id
 f74-20020a25cf4d000000b00645755ca5afmr1964651ybg.140.1650537026141; Thu, 21
 Apr 2022 03:30:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220411165842.3912945-1-wuhaotsh@google.com>
In-Reply-To: <20220411165842.3912945-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 11:30:15 +0100
Message-ID: <CAFEAcA9JKUh6BEgfEnrA1Wu_fdMUgTyfHWnDwh=s0Te4N6HBqQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Define NPCM7XX PWRON bit fields
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 11 Apr 2022 at 17:58, Hao Wu <wuhaotsh@google.com> wrote:
>
> Currently, the PWRON STRAP values in NPCM7XX boards are magic
> numbers. Similar to the aspeed ones in hw/arm/aspeed.c, we
> define bit fields constants for them and use these fields instead
> of the magic numbers in the current implementation. The code
> should behave exactly the same as the existing one.
>
> -- Changes since v1
> * Fix errors and apply suggestions Peter made on v1.



Applied to target-arm.next, thanks.

-- PMM

