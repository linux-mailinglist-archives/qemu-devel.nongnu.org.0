Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D65C756585C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 16:11:57 +0200 (CEST)
Received: from localhost ([::1]:44642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Mns-0003YK-Mw
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 10:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M9J-00029W-IG
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:30:01 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:36674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8M9H-00041u-MN
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 09:30:01 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id c143so8367682ybf.3
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 06:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vtb9VkPWYR6r6f+UBOMNZXxvdH7+9eWEt2nmrPprnB0=;
 b=bFH+qUKKKVhwKQ5KXHLVUGuXqWw8iJSYrmxnycPxvkeBvijC4nTAbpZ8+TBRWQ4/tT
 Hapv9wvZz7cxUudTzFLRSR0SmQDz4/gp3BqSgV5RlduUH41M94d3/kHJJzwrCaReY9Vz
 7KBX9wMir9ID8gtZr8cwI3XdglRlKAielIpevZiyCs5GV/sgeOOHXpowIQUsgEf6mut0
 f/2KA/1NPQHmITWgiv8FKAh9k0cjXKkLxywNV3ui94IZ+EvoHmpTmZwCnUUfXc0KFngB
 pAyGli4D0qGmSsCBW7/bJoDwzhESJav5VgvvHumhx5viEf7ozs6MNDaOiy2WdyC0wEJ0
 D2CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vtb9VkPWYR6r6f+UBOMNZXxvdH7+9eWEt2nmrPprnB0=;
 b=w6g883IQbOOLtmTQ/ag2QVyyefXgVzqRo32Ujy5HYU5uX91sI+eRvjyNp1IWMF1Ct6
 B52raxk1amZ8iWVdlnz7FFmO7dgDGKtIEHVRBDlSYLz3jyuGAE4FJM05Nhir2o069yYr
 xk1DYiwW/VOaF8isLMOsIuQ0cFrZ70IGKj5v1S1qj2eENdmVhdIFEf6ufClc86LZme0c
 jSbkxRUHPRJTQo0vtHnWNAuc62yYF26lSWRXpdiPZQErtBASMFMeXkCEFg8BmIz0R1W9
 dwIHelfoEYYkDQkvySyYRKH1FQ9KAD3yyfwvTEKO8qDUEUlLyp1PAAz+pQBdh39pr2wE
 pgMA==
X-Gm-Message-State: AJIora/sWHlrCJpfuqhE64ZSXAUk+IeBAFCGqFvUrgMI+JQllkbPU0If
 Sz8FbYaA55RPYaghskVuJEb1Inb0HCy//aCcxumVBQ==
X-Google-Smtp-Source: AGRyM1sDOVVKf3Gff8E2N3d37XeIAk27Ha4RY7sDSOvdhdqQpxzcsfDCN3QGbgYQ6DmFb7olMKxS5xgBI68yJ1Yr8Xs=
X-Received: by 2002:a05:6902:1183:b0:66e:4860:575d with SMTP id
 m3-20020a056902118300b0066e4860575dmr6207633ybu.479.1656941398620; Mon, 04
 Jul 2022 06:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-33-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-33-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:29:47 +0100
Message-ID: <CAFEAcA8=7LwPKw_PPJVMVn=JQK_sJWf2qOfOL6bV1Ju=ywMNnQ@mail.gmail.com>
Subject: Re: [PATCH 32/40] lasips2: don't use legacy ps2_kbd_init() function
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Instantiate the PS2 keyboard device within LASIPS2KbdPort using
> object_initialize_child() in lasips2_kbd_port_init() and realize it in
> lasips2_kbd_port_realize() accordingly.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

