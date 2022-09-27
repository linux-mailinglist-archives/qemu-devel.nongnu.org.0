Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4AC5EC6F5
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:54:36 +0200 (CEST)
Received: from localhost ([::1]:38886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odByl-0000zl-EU
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1odANA-0004SC-IY
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:11:40 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:35673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1odAN9-0003em-4F
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:11:40 -0400
Received: by mail-qt1-x82e.google.com with SMTP id g23so5949964qtu.2
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 06:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=3LvnAKo0f8Jyp/+8N2nE549k8SHrR9Vf/ArF/eVxpAY=;
 b=GWZBE0E5XPdhKBqpUZtBmP59e0YmSHJezUHDZsseQTw9ZGDK5NNfxRL/ysVT7IepgY
 DQ+DiOht98bcRQ06qz990oDWKYU+QLKYMg2bdclxjnwFG4cUQvNaVDvEa0Y7l/fXnfTF
 LpHUokkMouvDQ3s1+VFQWjv7TvqBh29JpiYzjISZYfR90zPGqrVRGPGyrp/8tArPaJpP
 gkj4SkNQ4R2vOwXa7WrLoCm4/P3GuzPdw9SuHWRa7t954q40ML3SAoIy3uBNiLOzhkLH
 SkeCJG5sUD7WrGrgrzWbXXfdJh6mY1zA4v8+HwSw44REDcYVnY5TbCG7t5HAtHVMKj5L
 RIeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=3LvnAKo0f8Jyp/+8N2nE549k8SHrR9Vf/ArF/eVxpAY=;
 b=fiE19btZIGdcVpXnjt9gT7tnH5CJNF+zA0+8Eca9w6HSnqrHY/1s33lqW/0H6cCrWF
 bxqF+E0dxMZC5JaxSjSELH9klPC6kXzSCKkjnVIwjudcW9W4D5l+79/gxYEq0Mock3Rb
 6wF8yHi4S8xfTRlMqkWq0VcB8yoBrtS8f177RmW3cRA1EyVk4pxukWcxq4OXYH2yNS1+
 wU0ssmtrJnQbaSfOLbqvXri9KuacpQ+RNclHyTbjl1vkxmzHU2YzEJlP+GO6YTIxHMrK
 OGBWYHHtj64L2zhpLa0J/shSCkvTbyPXnWTykwDoWwP0wl2tFYWxzq9qagWOFsX0Tkna
 Koww==
X-Gm-Message-State: ACrzQf3DUenrZ/0Ws1VJD9QPFTmSv17Qtje3r1nwNFrwi/GO0o9KvjqL
 USslfBFcFAjykms8UJ9Sitx86KwzscSqb/LITDDWHSyL
X-Google-Smtp-Source: AMsMyM6vHDk1v2e1RrpYSFqfOJNR73Jnll0luoYsNcTjBrB4iSaMLRQ4/zRdSyrTUansdy/iS7WxtC4t8eXh5+bfIms=
X-Received: by 2002:a05:622a:1803:b0:35b:aff1:aba0 with SMTP id
 t3-20020a05622a180300b0035baff1aba0mr22407003qtc.334.1664284296184; Tue, 27
 Sep 2022 06:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <YzLctFYiBG/JkNuH@p100>
In-Reply-To: <YzLctFYiBG/JkNuH@p100>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 27 Sep 2022 21:11:26 +0800
Message-ID: <CAEUhbmUZ=aCUUyQBAP3vVAjypao4m2bbaCiCtrq8qqsriKm_Xg@mail.gmail.com>
Subject: Re: ddd
To: Helge Deller <deller@gmx.de>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 27, 2022 at 9:09 PM Helge Deller <deller@gmx.de> wrote:
>
> Add faccessat2() with strace output.
>
> Signed-off-by: Helge Deller <deller@gmx.de>
>
> ---
> v2: Resending with minor commit message changes.
>

The commit summary makes no sense. Would you please resend?

Regards,
Bin

