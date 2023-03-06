Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 621E16AC083
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 14:14:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZAdy-0004h1-4M; Mon, 06 Mar 2023 08:12:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZAdd-0004fi-Mg
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:12:26 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZAdb-0003Wq-TT
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 08:12:25 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 cp7-20020a17090afb8700b0023756229427so13128725pjb.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 05:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678108342;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NoCulbv3/zQd/zQ49zBPDT83aCiejMTqtbQuLfe1gZ4=;
 b=YtGxQsZfX/u1k63kFZHZAXHJUFoKi9a+N8HSE/QIu9/bLWBOyHbIKFv3r7f1GZ1Fh3
 GqGVliHZyuLdCRlZGGEBjgFjjNMgNSNoviEtS9SQZZQA63tMotXjwsQPE1zIyEJMngRX
 zrC+Mutt9Gkt7K1W+9DrQRyDtKmkq34TdUQE0EncuI8Q/SDPI8FF+c7/9WQVh0/O0yQZ
 /c2rw9f0Kw9a8q26n0C8QJxXH7O0V9Ba0Ar/5Q5zgdh0VOKfILv0vIPTeQ789Uyk0HsV
 tUCJYNF9cxyTUfaz0wXuGrhSOC5lKFW3VWXpp8Ti3aVR+Z7tUCNp3x0Z+GL9hOm/aPwN
 tKhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678108342;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NoCulbv3/zQd/zQ49zBPDT83aCiejMTqtbQuLfe1gZ4=;
 b=di6yEh8NLUYT1KtLnlgHCpJ8Jam+az5HiJD2pWqkcI+dmPGbij86sbcsdO+Cqo1Ugd
 0OHvwC5e9UcIvlkEOIOeR+dt63/L2IlRkiBKBxmerKNyy683HKCDBVPHYp89gvIBhKwC
 xwQNEDJcxeZ3adnrQ3C0dlgW2ip8WWsZiX+mVGAywaZTBqjXZj1eGNxmCzB+Bi23OWrA
 hvckMCMq5sBk+xxWvsbjBekA4BA5LGuFyJ1hLAPTIa2x+hKihLC84/7xApa+UZnDXPP7
 OwlHlejYVkO6n7huid4+RbgWUnbeZEUZlFlV+wGmPudRfFWOGZoBTGpFA/eYVZIgDlnv
 GBFA==
X-Gm-Message-State: AO0yUKVIxQQBr7Y+1pGhTINMSXMK+Cg78A4rSlqnuGtH2sxI5M1fHyju
 MfzLvhoYQ486ZnWOW60Gy/kp4ZKfDYKD+NgEbUoFwQ==
X-Google-Smtp-Source: AK7set9n1pZc0/XJrXVzcQZOYjqodWoQUfci/lK3gNQ6gCYeJVfz3RhpRiljiyffmbaLJnYckil26UMn0W1cRNhw1iQ=
X-Received: by 2002:a17:902:efce:b0:19b:5233:51d8 with SMTP id
 ja14-20020a170902efce00b0019b523351d8mr4420766plb.13.1678108342469; Mon, 06
 Mar 2023 05:12:22 -0800 (PST)
MIME-Version: 1.0
References: <20230302114102.32236-1-qianfanguijin@163.com>
In-Reply-To: <20230302114102.32236-1-qianfanguijin@163.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Mar 2023 13:12:11 +0000
Message-ID: <CAFEAcA-B1Odo=gthNKw23w4Q62BXxOqtK7_dLeRT-heOHc1SJA@mail.gmail.com>
Subject: Re: [RFC PATCH v1 00/12] *** Add allwinner R40 device support ***
To: qianfanguijin@163.com
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102e.google.com
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

On Thu, 2 Mar 2023 at 11:41, <qianfanguijin@163.com> wrote:
>
> From: qianfan Zhao <qianfanguijin@163.com>
>
> v1: 2023-03-02
>
> The first three patches try fix allwinner i2c driver and I already send them
> as a standalone PR and can read it from:
>
> https://patchwork.kernel.org/project/qemu-devel/patch/20230220081252.25348-3-qianfanguijin@163.com/
>
> Hope that patch can merged first before this.

Ah, I missed that patch, probably because you sent it without
a cover letter (all multi-patch series should have a cover letter).
I'll go and look at it now.

thanks
-- PMM

