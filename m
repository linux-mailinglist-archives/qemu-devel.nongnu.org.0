Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C54641E45
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 18:41:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1sz9-0001oW-4J; Sun, 04 Dec 2022 12:41:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p1sz4-0001oK-TR
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 12:40:59 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p1sz2-0000eK-Hh
 for qemu-devel@nongnu.org; Sun, 04 Dec 2022 12:40:57 -0500
Received: by mail-pj1-x1035.google.com with SMTP id t17so9203670pjo.3
 for <qemu-devel@nongnu.org>; Sun, 04 Dec 2022 09:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XJYM4vAi/RSK8elIocWIwEZCKlq4jV0Gh+sBxGZRGsA=;
 b=TFhZo5mIdVgzu+YF6GtDCY38yOmV/T8szj/CxiqwW5/jTGaIhQo8N+DbYc1fVYI+s0
 VLReFkwqgoiM7K7gVDxL331ZiXlvGSG3cnhbgpLioLzxvgKVDbefMqWBwi7bhAsfHBRH
 9v6Gn+iu4Hoi30SD1zMyPs94aixOZ+8pj5s6A2gpPqA5V9q53WZsYyQxRPMm7xTA4TJi
 6CLUPITFeHggObS0htrF/7QVoRCPFtPO5jFLQFFaKViiCRBag8MXWZC/KoLmAyn7hyH8
 Kbf1N6yFbxLDwegNvrGFHJtbR2rENWsI31Jponb5N6VMgbRRYXbSMWEx+6rPwZYBLPhj
 ndkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XJYM4vAi/RSK8elIocWIwEZCKlq4jV0Gh+sBxGZRGsA=;
 b=Q4Jg24fVGwltctiYH/sd6fuUY3073nC0GYkQZ/poTa+IeFtIAc++UsAIiolte3tFdA
 pm2idI53CWJllCsNzjMKZiUZr6a7rPOaI7ZrDbYQ61L/YBlgnrc8g8Jl3nHMDb81j/aX
 Pg/Mp9RP6axP4ewvZIWDZRBxFBa6+pIEZhCNndpJyIdyDwGs+uL7VwnSFPAsNVYgEIui
 /6/DmJI7m0EskTPU+0OV0p5tBYEir6gJ4YJpXGlMHlnhoBC58TvpSwfg+ywXKfLM8Zoz
 OE6SGDHd/bJKdXS0AQ/l3Heedz9Nl4/7jCyz5TEDrTYZHl9X3RGTMQKooTT0YY1kFm9v
 kGag==
X-Gm-Message-State: ANoB5pn73UNEp703BB+knskYf4E7ByJLofSV+7YA3SQKY0C1+kOjC2z/
 yY9oD1zLr3kp48mTBJxZWWcSvUoHl+99WLJqG7NvLw==
X-Google-Smtp-Source: AA0mqf4cv4XpG0VQohV6A9y/E8AZBw/jIliRZXpvqh54jZ29H3nPtUwt/kIAsY96weGaATN9BU1rv1APtD9c/AboM/8=
X-Received: by 2002:a17:903:2053:b0:189:cdc8:7261 with SMTP id
 q19-20020a170903205300b00189cdc87261mr5014245pla.168.1670175650766; Sun, 04
 Dec 2022 09:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20221204000340.282718-1-richard.henderson@linaro.org>
In-Reply-To: <20221204000340.282718-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 4 Dec 2022 17:40:39 +0000
Message-ID: <CAFEAcA87iyOWfAH-xKX7qt_y61A8ET-QHdz6x20rkKc3MeZMEA@mail.gmail.com>
Subject: Re: [PATCH] configure: Add --enable-lto
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
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

On Sun, 4 Dec 2022 at 00:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Separately control b_lto without --enable-cfi.
> Also add --disable-lto for completeness.

Before this patch, CFI defaults to false and therefore LTO
also defaults to false. After this patch, LTO defaults to
true even if CFI is false. Intentional change ?

Do we have figures for whether LTO produces an interesting
performance improvement ?

We should probably complain if the user tries '--enable-cfi --disable-lto'
rather than silently doing something that presumably doesn't work.

thanks
-- PMM

