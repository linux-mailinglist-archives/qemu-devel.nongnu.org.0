Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86F45189C6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 18:24:22 +0200 (CEST)
Received: from localhost ([::1]:43006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlvK1-0007hl-Hp
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 12:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlv9V-00024E-NC
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:13:29 -0400
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:35631)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlv9U-000553-6W
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:13:29 -0400
Received: by mail-yb1-xb2f.google.com with SMTP id w187so31926257ybe.2
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 09:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cn94dFDbnLnjwqI9wYaaOEp4EnInBczDj7/nzolq+y4=;
 b=DQJSwS5WWxl3RgwtUqPkYbTfOqAvfjPAUo5ffp1Bjjy4Uq8GHTkUGtBDMAft0iAakR
 7kkE9BIo0MBdCqbQBKiM4aKNW5QQYU5F1X08EMplGNRxs+WNrwE0EeLcdb6OJFIzmjpl
 /b9+uBqgK2vtVtkFtuPcYIacGu6bW3v40bh3dBytGvtRK8RljZUZN3Z3uQby/XwEVEEi
 Noz2LnkK4y3BR2KgbjL3vsHm7AyFIetLS5eNTKDJHHWKaaDk0B6NSmpZkcJd7G8x/lDh
 Mr6NCDQGnSBK/GzcytKVsehLSp0X2I2IIocZZX8JHQ1WJ8ItjnDuyr6QPpFGxo//V7xw
 i46Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cn94dFDbnLnjwqI9wYaaOEp4EnInBczDj7/nzolq+y4=;
 b=q9Q8dlQVo3yEY39IbI7y4e19ql8sd3Op+b1EH9J5EA3tjnpHD+Pgpj5ao9QWLcQIK4
 IE+ntZGZvGBe6M5+vMzb1e75CFywyvyJb5/FbjOrUZ5EQT0cmCxK/1nKO2o2Tbp0rScD
 7JLBUuMSki1/+cSEQx+TYc7Y7i5GZBMVcWxSSKu2NRPgfmqdfkE5c2Gy2B+McUE6TjBc
 9UA0j4peRunlNeUZPUtMyGvk1a3OMTYLeukZumSf2CigJdVfXnyZKoOOeBRZZzMA1PMj
 F2nFO7P2mjer5Mepx8pQV0FdtsXLtvKX7BFYE50aDci6hbn1BqLjILFTsPeOmCzJnXTm
 vh6Q==
X-Gm-Message-State: AOAM532zKaDo7OoR8v+VAppP70fXb47JmMHnbUUiiLySdi7DXv9CxCQ2
 NNN1nseQ1jzPWU+QnObc6uW5oHqzWtu+wevquS8eIw==
X-Google-Smtp-Source: ABdhPJxRWFsqS3BrvbqZ1Yu+GIrlIlW6NAh/cekpQbA/en+Lukj65BWt6y8ptVjSUC/xBhZF95D/DK2oiA4CpDEN6h8=
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr14531463ybq.67.1651594407300; Tue, 03
 May 2022 09:13:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-14-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:13:16 +0100
Message-ID: <CAFEAcA8_rbO+5hH3RsYfBUYm7MqpvD57hdrn+30U=6LmJJS=Bg@mail.gmail.com>
Subject: Re: [PATCH v4 13/45] target/arm: Hoist computation of key in
 add_cpreg_to_hashtable
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
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

On Sun, 1 May 2022 at 07:19, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move the computation of key to the top of the function.
> Hoist the resolution of cp as well, as an input to the
> computation of key.
>
> This will be required by a subsequent patch.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

