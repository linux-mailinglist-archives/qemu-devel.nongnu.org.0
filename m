Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA5654520A
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:33:39 +0200 (CEST)
Received: from localhost ([::1]:55940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzL6I-0003HO-EA
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK83-0005Bb-EH
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:31:23 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:35448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK81-0001rW-VI
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:31:23 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id x187so14814021ybe.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zmPUYdTWnNMVRWu4HERPhSv6OjQlfkMOhzOq5BVuPtI=;
 b=GjbkcKhWcYGvy4Tau65/PXJ5s74cYamEz94WKJLYcTZRMEPxyrXdY9Le6En0IcOLPo
 ltQtYtfa+OgWHWbafk9EeW+OZj6ZA3Tk4afLF/A0dqFRvVRXucTupgGuhvZqDsQMBd8+
 34bHhUA/E6rGrDLx0DN5y9WXwi2s1HZaFqEJne/9SBpVc/zSb3JbPes6oClMRzzQMGG3
 1RQ0a2NlGxGOzfNRrNircFEhWQZB96nBfijpLN76mOnHm1YkoIOmQYtw7GixlseTn/P+
 3Ogslya3IdAmF/KTU8m17dT+VgEdE9DQ5/rgYkmf0f/bzzPx4VRTYZ/dftPDZcXsmmwB
 t+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zmPUYdTWnNMVRWu4HERPhSv6OjQlfkMOhzOq5BVuPtI=;
 b=DNak1nrjdNvayIxKz9Pmr5nMNRhum1Rwoe/qve9t5B4LMBuoCLV11WuXWx6cUHuqxC
 82Ul9fLcyjmBhvthXN4XaOm/mCynE8utRVJvh3jhdTPyKPSlDOPHpZxYgDzc4GC42Hyz
 8IekVEKXs1a85nVmwNhnd6wMlJHj1qUT7+guHdcyV5VDGp/8zB3AjEmd/4RsHs1gBGwm
 5tBMbYFs/BM7E1y5MuwTBMNKYg3Lw/3LSJNGD+K0gyr8OSzrcnsfF9ysSupyr5ejXO9w
 cQk2XGIBybBd7bL+eHKfizzAH7AcsjffU7Mr4HJM0NOSgwZhxuCxNQpGzM3toaMnA9+E
 DJkA==
X-Gm-Message-State: AOAM5312RB9sNsSQJiKSCnR1LIufyMu8vSPz0sBf1b0X44ivJBBz2GqT
 hGmkDWFqMkwLBGGmxIna1fbAVG7UvuAYWMhwlUAmED8k9Fw=
X-Google-Smtp-Source: ABdhPJwnPaRrbxuP963GmGbo+24fkWTVO4lh5VDX12kHxcCklA4A5j6Uyy7+BL2cLFAYgVZ+Fg/XVcDm/VzuMbh9dD0=
X-Received: by 2002:a5b:d42:0:b0:65c:a0d7:4c6 with SMTP id
 f2-20020a5b0d42000000b0065ca0d704c6mr40037305ybr.193.1654788681004; 
 Thu, 09 Jun 2022 08:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-35-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-35-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:31:10 +0100
Message-ID: <CAFEAcA94UFe2rb-esZmVA3i5p4MJ2xM5Q-TXHV=Z9MM5=nKrqQ@mail.gmail.com>
Subject: Re: [PATCH v2 34/71] target/arm: Generalize cpu_arm_{get,
 set}_default_vec_len
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Jun 2022 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename from cpu_arm_{get,set}_sve_default_vec_len,
> and take the pointer to default_vq from opaque.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

