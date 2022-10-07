Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC345F7644
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 11:30:38 +0200 (CEST)
Received: from localhost ([::1]:44268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogjgj-00034a-Ct
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 05:30:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjY6-0005gk-Ih
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:21:44 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:40791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjY4-0007YU-VI
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 05:21:42 -0400
Received: by mail-pf1-x42b.google.com with SMTP id h13so2975669pfr.7
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 02:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zjTiAxnroHllDuDUYv0y2RcsUtSKHQC++2RgiWaaxJU=;
 b=eK/QYA4c86BJA2WYs3k8QtX4HZ09c1uIB5SQmlgxMZyJVudB1ContygosRiFqOMIun
 JfmQNgREPz7QCxLDgGKbsgCJRwEbAuEhKNGgN4bwMEFocVg4h5xAvEeanrOzrvAYqt3k
 ONjarn4gkGaerQzLPx9tCr+xasNK3/WDoSeo6S2fwkmiIkp98Nl9JC5updhlLWRgGjRc
 XKODuV3yG+CeKNkG3mhTn6YZYiZm8zv0XudkunH+i+EMlIcYjUd7UXneS1pY77SLay/d
 uCiR1x9P9kAje8zjEaFwanYphoAMM30pbJJP8xNXyxQblZ1yfzcYH79q+cj+skeEwYDZ
 85cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zjTiAxnroHllDuDUYv0y2RcsUtSKHQC++2RgiWaaxJU=;
 b=4nRsxTuXyTOy/T7PQFeq+inKiWtqKnJ0Q4WdNg1LszgX+DREPJ3Uf+v1y0WEDFX+6K
 6xLV3Ir1BfpWyNWjMGAPXsfaHG8gM00gPVa0aJxYp/hKCeeeEP2RPwNwfXfnpmoqRWAu
 9p3Kfoyh/5Ke28pERUYlboPgay1bDiJiuquHH6tPn5N0WQpW/SvLImyX+x2GLLni2IFy
 8b50duDAo8Yb6ZyDbH+zhPka0B1c7zTfWmLpg7WexHXGcz7hBzO7DzsOoU6MO9u1EN44
 HX3X5jZuGIGo3Y5YbClRXqXjMREsIqFp+h7C7WwUl3+8vYCiHSrL4lMsRmfXDKKNlqvG
 o2Dg==
X-Gm-Message-State: ACrzQf3r8RdLLnfAzCZkSwFPDBYMk7u0JAzGZ+LRg2d3gT5+B3SjZA97
 iMMc4mPIq2s71cYBp9mfpwQgE5d/rrhKNwubZAYZDw==
X-Google-Smtp-Source: AMsMyM4tuHMww9nuu70mcyOKVMRyF/E6ASyIJtoKuesgZdCJ7OgFlbQ4sXx2YDgGs+rMZoRC9GwLSL0Wl9ZicNnN1CA=
X-Received: by 2002:a05:6a00:1584:b0:561:e48f:9faa with SMTP id
 u4-20020a056a00158400b00561e48f9faamr4281261pfk.51.1665134498061; Fri, 07 Oct
 2022 02:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-32-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 10:21:26 +0100
Message-ID: <CAFEAcA9JZwfFW6b8cTtB0rJW2AmkA3LdL1obrdkwC6TRcF9rqg@mail.gmail.com>
Subject: Re: [PATCH v3 31/42] target/arm: Add isar predicates for FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Sat, 1 Oct 2022 at 17:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The MMFR1 field may indicate support for hardware update of
> access flag alone, or access flag and dirty bit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

