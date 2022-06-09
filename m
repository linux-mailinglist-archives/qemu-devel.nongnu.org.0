Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EB05451CB
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 18:24:03 +0200 (CEST)
Received: from localhost ([::1]:35314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzKx0-0004Es-CZ
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 12:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzJzv-0000DD-0l
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:22:59 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:40409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzJzt-00087L-Hm
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:22:58 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-30c2f288f13so244582297b3.7
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1UOHa/wejQ3FaWEV/vBxY71o1eiL4/rWgzKToTCZM1w=;
 b=ndbGFbydwc034AtwqzfArXpgMg9/EXK0ru3GzR3xgfeB9bz7oHybOc+pmxe0CPgcsF
 GDhoel5YBiU2LOFWQVIwbC53PyXqSgQZ68ViUuoFzNEPeDLof23B3YEdAFZ0I+SCZMP+
 FrM/Dj46PL/atmwNkXHPzRjxLJnMEh33SFODiwcIrfyrEVrMKr1x2JFcLvd7bpVUozkB
 GgRzeUgCMhSHk481wodTh0yw1Fl8DrWIY7Ce1wFmqxi3hJsSflktR+7F+UgIW1xEcjzI
 6pUm0TGFOqrqC/yS1vGMJ0Iq7r3C5nqkzrMTTy44r8yd8WmvrjIFOA1MkRD6Qk9RPRwH
 BXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1UOHa/wejQ3FaWEV/vBxY71o1eiL4/rWgzKToTCZM1w=;
 b=5ZlkFxcqLCVnUpFl79n7jasjT1CkR2P3Q6tgpOBFKM2m6tdwZ5GsU1CsQq5Al0ndRi
 HqK7wQPGQR8auBZSoY2XOCN7PnkDXLQsLFHTlMEFvtj3P5YQ8v7OyZiVPl9W7SQ3jTbj
 wiaIuHKUUrYnDHR/brYj6Olqktrh/e+/ZQWkBo9tGnAJtZZFGQguB2qX2zcuZZ5XjLc/
 yKIUO5gFf9bVkzF4mzrry//UW/W0SWbvVgtORBZuRsJt2cZv4wIfD4bZRtYuNv1IUn3l
 n6kLWw1kzPKDV3rAJPO0l5vThdTGNCW0dOMXXyiwbjMQ6rds3Ur8SWHYB4Ybd86+q9k5
 dhZg==
X-Gm-Message-State: AOAM530ExkGx+I5T3I3ZJm8mzwEjPv5iE3BmvhEIdlr0qG8vUoulca8C
 If5Zu8Mwtobvc0VxWEv+DPETs7TK+XxH4poLO3xEcA==
X-Google-Smtp-Source: ABdhPJzQcStn8wVRj3Fok9BxbDprW239B87bwkDg+nPFgOibHpXxXbzHbU4oBy0LUgOR0tICAstFKOPjjNfA4i4YPag=
X-Received: by 2002:a05:690c:808:b0:30c:4f5c:b319 with SMTP id
 bx8-20020a05690c080800b0030c4f5cb319mr42008261ywb.64.1654788176224; Thu, 09
 Jun 2022 08:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:22:45 +0100
Message-ID: <CAFEAcA8FUb=uAbRDnWHR2i21RrCgGfBwbPOCJXqb9o2qCHjFsg@mail.gmail.com>
Subject: Re: [PATCH v2 00/71] target/arm: Scalable Matrix Extension
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

I took the first 20 patches of this into target-arm.next to cut it down
to size a bit, but will continue to review the other two-thirds.

-- PMM

