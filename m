Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1FD6FC91B
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 16:35:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOPr-0007gy-GD; Tue, 09 May 2023 10:34:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwOPo-0007g1-2b
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:34:09 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pwOPk-00076w-0l
 for qemu-devel@nongnu.org; Tue, 09 May 2023 10:34:07 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-50b37f3e664so10805807a12.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 07:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683642842; x=1686234842;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yitkHOatw+41xMWb2v58gR45bgh1aVCxP3+JcDGrWe4=;
 b=MnNBtGc1IyZ8dmNyzJgev0mvjZq/P8QhS1375O0BJxNDCBUIPjb0gChZOStI2gCE4r
 +7zTWrWV2y+KSTHRYvNgK1jtzP0VmTm6ijzeRQloVstXuiDWn25s12Yp+3gAHqYMOnk2
 IVY6ieJvyvI7Q1tlkxPGMOX66LhkFyXLJyhN+HHzbR9FGTTBV97ZKhL26oQqkIOfEqzC
 ojr4tae5nuNWQk6bRA084fAfdVbxifDy+EdQQkgVK93XAQUi+M5e0lMj+IfafNl7Qxms
 tuYVzEz6pld29nRqU+MXjErsmGOkIqsjmKpzvclLjUGqedcH2tNfx2wej1gWMsd7Kca8
 Vh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683642842; x=1686234842;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yitkHOatw+41xMWb2v58gR45bgh1aVCxP3+JcDGrWe4=;
 b=PqRvX6ZAd74lF/l9DU4SHBphOVub5/Snu72jXgZTCY3figEmXODudhEo6AhqxQ5sGY
 JD3N+usURIECYaklEHIdzeeUjST24fT+ADDbWhtUcoxuBIQ2iYVoICpnJOItaV9sMMqZ
 oJyEMBh/xC841vFfBpfrR4swlALORKbiSM6Zf6E6z2xHPEdOqJj2z6nddOSH8MEuJM5o
 ewOMfu77w/byH60UkkUy0Y3DtMQIVE5EJo3PQ1TckGvHd8G2B6+AMp64ee/ePNwWCx9M
 7+3sotbUGBHwvVewpbnh7QD37lOLGyDYfeAs20gYNYgT8//TRYvVvupxjtZinIgbsB+6
 YleA==
X-Gm-Message-State: AC+VfDyyPWdYEpuT9Eyxt6CYRHuK5YXw7VIppWvYcKsM704rpksglS5s
 00w56eiqD+EBWeIo7KFpxdNW1n3d+HZ0Aij9OYqlVw==
X-Google-Smtp-Source: ACHHUZ5gD5BJH4YVtu+jFcFneKbKmXftdOcOs3lBAEDCP44UNh+UXADB4yovPKbuR/9Anutb0u7Jz/5bveQVBBMIzUA=
X-Received: by 2002:a05:6402:194:b0:50d:9b59:4330 with SMTP id
 r20-20020a056402019400b0050d9b594330mr7632788edv.4.1683642842430; Tue, 09 May
 2023 07:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-7-richard.henderson@linaro.org>
 <CAFEAcA8muJ84GMqSBuU0P2YhfERM-kftfq07N8BVO2yG9p6jBw@mail.gmail.com>
 <8988fc6b-8f07-1ab7-663d-3392ca19f7f8@linaro.org>
 <CAFEAcA-79iL8=+143w1jxTG1WM-8NODqqgF4droY=avopm4a7g@mail.gmail.com>
 <434236ad-8348-1e42-23e6-3ed7d6c21366@linaro.org>
In-Reply-To: <434236ad-8348-1e42-23e6-3ed7d6c21366@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 15:33:51 +0100
Message-ID: <CAFEAcA8hXYK=o98FSG+X9Q4PyamPePaYvoSYdN3jHt4V0qikmw@mail.gmail.com>
Subject: Re: [PATCH v4 06/57] accel/tcg: Honor atomicity of loads
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, 9 May 2023 at 15:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/9/23 13:04, Peter Maydell wrote:
> >> If the LDP is aligned mod 8, but not aligned mod 16, then both 8-byte operations must be
> >> (separately) atomic, and we return MO_64.
> >
> > So there's an implicit "at most 2 atomic sub-operations
> > inside a WITHIN16 load" restriction? i.e. you can't
> > use WITHIN16 to say "do this 8 byte load atomically but
> > if it's not in a 16-byte region do it with 4 2-byte loads",
> > even though in theory MO_ATOM_WITHIN16 | MO_ATMAX_2 | MO_8
> > would describe that ?
>
> Correct on both counts.  While you're right that this is a valid generalization, it's not
> something for which I've found a use case.

Yeah, that's fine -- but we should note the restrictions/
requirements in the doc comment for WITHIN16. (And maybe
an assert somewhere if there's somewhere convenient to
put it?)

thanks
-- PMM

