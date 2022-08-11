Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC7F5906DF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Aug 2022 21:12:15 +0200 (CEST)
Received: from localhost ([::1]:43708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMDbK-0006dw-LT
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 15:12:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMDYv-00038B-1x
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 15:09:45 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e]:34501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oMDYt-00013p-Lp
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 15:09:44 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-31f443e276fso182587917b3.1
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 12:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=H+6KarpXTJi2BQ7Om1X+mS0kZETovXqKWh4rqtsJMtk=;
 b=akxTDVKm4JWwAFoG8mWcidQpWYNKmDTmEZjBm9emjsRajSk0TR8MuHhKGyDlyg/LaH
 Zzv2aVPD7qxPVKIwPcrg+6jP5ZqORCNsm5w6eQA1BthcMDg7m9EE3oD17c62cj467RT8
 H0slacsNtEYZymzlbW71PM8FoZqkliKkflBMTGHc8p6L34CVcizKHkR84co3RPWjXhUh
 MZy0Dncuqu/qE2ArUXV44YYfPDvbQSYpm4XpBOIPd4ZIM+aMCqMdQBd/UNG2qwpqXWO8
 mWYuXUMHfI8Qk14jBcCqchsclciVqtmQKwgnyGcbFEOFLTWQdMWU/kXkfoeeH+16P9VG
 jzvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=H+6KarpXTJi2BQ7Om1X+mS0kZETovXqKWh4rqtsJMtk=;
 b=q6BQP6OWNR9qyB3llC26MRczi3kPSjgSv4O5p8FpVPlT5DeEb7smcV41hOEeXOAbWE
 b6dIbKLom3fddhoI5vnEPG4gd0+eyfgUT+v2aLUGSTElTHtBNNN422kz71CJb1L6pVO2
 3kCAlyID3kf6NVawxQtr0Gs7YlxH3WsbpiugYMp7x2xsaAzAzBMW9SkHCE2GjfRBF/FO
 lLbq3J8jj5d1/42pNCjOzLk9dRE/vsby1Sp9jV+joEYoxobI1jZ9V+I1tvMGApHGWYLi
 PVzWAFS5MfO7AD9ZJuPoaMZxSHEpMSI5obfnfRMn1xv3vMXXLyQifjORimUJEsK1r3VD
 W7Dw==
X-Gm-Message-State: ACgBeo339mw9no34xPadbaEj8YmaXJraeOM8ieIDFuyE+cow9FGKzJhB
 7Xltv/PBV+boSlcWiAOi1v80LNypQKR28AEn194IbQ==
X-Google-Smtp-Source: AA6agR4gAmFX7WDSB2+3xe8VncWa+P+MX3jn+fPHE/ZhZBr9ARJ9Utwi5tBSS3am+HyP0JNC7Im0+yts7Ynsi6LhnOg=
X-Received: by 2002:a81:9942:0:b0:326:5dab:8915 with SMTP id
 q63-20020a819942000000b003265dab8915mr678625ywg.10.1660244982378; Thu, 11 Aug
 2022 12:09:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-6-peter.maydell@linaro.org>
 <34861211-e1f0-31d0-9619-9b99953ff031@linaro.org>
In-Reply-To: <34861211-e1f0-31d0-9619-9b99953ff031@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Aug 2022 20:09:01 +0100
Message-ID: <CAFEAcA8mD=VXyEwAoSjNVYGc-bEib6N13GEoLMDtuSZ2VYuMVA@mail.gmail.com>
Subject: Re: [PATCH 05/10] target/arm: Honour MDCR_EL2.HPMD in Secure EL2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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

On Thu, 11 Aug 2022 at 18:48, Richard Henderson
<richard.henderson@linaro.org> wrote:
> You can use |= for bool as well.  You don't need the short-circuting of || here.

That seems like the kind of thing that -Wbool-operation is likely to
warn about either now or in future, though...

-- PMM

