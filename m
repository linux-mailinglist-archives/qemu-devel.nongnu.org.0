Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137C62E8876
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 21:22:21 +0100 (CET)
Received: from localhost ([::1]:60118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvnPo-0004J9-4R
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 15:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnNa-0002bn-JW
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:20:02 -0500
Received: from mail-il1-f173.google.com ([209.85.166.173]:41781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1kvnNZ-0004K4-9y
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 15:20:02 -0500
Received: by mail-il1-f173.google.com with SMTP id w17so21725674ilj.8
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:20:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sp9hUnOv79YhhzhYX+d0g/EQSMBngAljHnPdL0noqyE=;
 b=Id2rqKT2/SNBZLmZFuP4Qw7ZVke2ED4AU/Yo/7cjUFpphcJn+1fGpChrThJsYXP5LQ
 tO/BMtfAmV2kkl1xgkdUHNrTK6AypxJjqCvwDe2wloTmHK28QZ2j+qd+R5GuSN1YOd9D
 O2B32VmZ162yMhHsxW02CeTc0PboTKy+2qnILhvxLhmadHV2uudlW7U3I0Yw3uGKMmbr
 GrQi9aGl3tQUCwDweYwVmYCweIS+tB07UsMOhbgPA70+RkqrYJP0iSu005FvWLlQUCNq
 z34COlVXzCaaTQwWNWj1mVBa5PJSRGKCkgqHIub96uNXQPb86xv+ZA06F24H3OVYi4aR
 kosQ==
X-Gm-Message-State: AOAM532lo5TVjolfzx/EN5If8fbPWJ5FGvR03wDPr6+7cL8aDHBc+Cw+
 kAYSxhBhhnrLDIVVML/qnhT0eIdzBbo=
X-Google-Smtp-Source: ABdhPJyJt8eTfEl6xRu8PD16/fofd3xGwei/3IqN18Of9ZkFVYrCELD4bE5BD1sLWMCtd7mCyhSiGA==
X-Received: by 2002:a92:9eda:: with SMTP id s87mr65976031ilk.85.1609618800335; 
 Sat, 02 Jan 2021 12:20:00 -0800 (PST)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com.
 [209.85.166.169])
 by smtp.gmail.com with ESMTPSA id h17sm4521492ioz.12.2021.01.02.12.20.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 12:20:00 -0800 (PST)
Received: by mail-il1-f169.google.com with SMTP id v3so21759543ilo.5
 for <qemu-devel@nongnu.org>; Sat, 02 Jan 2021 12:20:00 -0800 (PST)
X-Received: by 2002:a92:84c1:: with SMTP id y62mr63538386ilk.191.1609618800097; 
 Sat, 02 Jan 2021 12:20:00 -0800 (PST)
MIME-Version: 1.0
References: <20201214140314.18544-1-richard.henderson@linaro.org>
 <20201214140314.18544-27-richard.henderson@linaro.org>
In-Reply-To: <20201214140314.18544-27-richard.henderson@linaro.org>
From: Joelle van Dyne <j@getutm.app>
Date: Sat, 2 Jan 2021 12:19:49 -0800
X-Gmail-Original-Message-ID: <CA+E+eSBphiU1-xHobjqB-uf=_GE0mOk5jv_Xa_+qtLWy7H1Qkg@mail.gmail.com>
Message-ID: <CA+E+eSBphiU1-xHobjqB-uf=_GE0mOk5jv_Xa_+qtLWy7H1Qkg@mail.gmail.com>
Subject: Re: [PATCH v4 26/43] tcg: Introduce tcg_tbrel_diff
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=209.85.166.173; envelope-from=osy86dev@gmail.com;
 helo=mail-il1-f173.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Mon, Dec 14, 2020 at 6:02 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  include/tcg/tcg.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

Reviewed-by: Joelle van Dyne <j@getutm.app>

