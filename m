Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5A955BDBD
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 05:02:29 +0200 (CEST)
Received: from localhost ([::1]:42696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o61Ui-0000eo-A9
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 23:02:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o61SK-00082T-0H
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 23:00:00 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:39710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1o61SF-0000FM-9k
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 22:59:56 -0400
Received: by mail-ej1-x636.google.com with SMTP id ay16so22930443ejb.6
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 19:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZoEhg6AIVXBEmq91HU5QvW8UrEctZVLlp1Al0lOl4hY=;
 b=CyBskOLSDaIo6uX6uLzaxUlzfRkNOCQQaucir94O2EWhV8tg0hlKXuRFZCzIZRNkcs
 7qvWGlJHxPW1brNT26AemwDU6ZFYJd+AUzkrtXtybK1A8YDF2TbVYR3x4lUEfgPdP8nc
 lQEABzhPEIzZC/m17Nel69F/UD8pUS+S427fr9rxcbYV2PTMCT4N/u5oqfss3NxZqOqe
 3YyumBL47NMRAxrv+gG3gqCSkGurQsHiyybIxcpUTklxr+TKqTB8GHU4h5yr5MXX4e4M
 MPHuWh6NuChCc+G3Zz4IvsRaomyP21FQhmzftRh8pZY0ea50q24LwZV1HO5crP0BGPYB
 RGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZoEhg6AIVXBEmq91HU5QvW8UrEctZVLlp1Al0lOl4hY=;
 b=BORqn+5Imh+3K+iV9skfpejYg5hd1n85glC9MKJ0hhseZnDegPMuSYM+tDOa4gTm6L
 T4XpzdKN2uQqfffRZZxt6S7+gLGir24FRW5JfvLeUyI1E/BBxONkTCL7OxIQkD1IE2C6
 bJx6WHAe5hi9pGsaNPZST5s+f/AlPhQZ7ftzkCp5pbcwwiRZVSpKFLqPcQYcx8sASzzr
 n6qVQcgayp1NFO+i07d4sPdcOmj8CRoDgcCAmDlLjxmHd9tuOeUYAYsVkpaM17tEPLEy
 W6p+N//YV5kMhI6WiCF6TCUTsCYjFEaJkka2PWxSkLYDiK+PNb2OWr7D5qowzh7zI0T2
 4oEQ==
X-Gm-Message-State: AJIora/KloFb5JmNtyXmuq0qK1ZVNNq7Q5gMqRyYa4M5cNwSoe1fkNX8
 a8s+yLxhVFx1UPc0Shk0dJkK4ik/oX5c0j7/8RiC
X-Google-Smtp-Source: AGRyM1tQLuQHk8VchAVkB+Y1tudgaStWnVyKrzdKIAHcfacbtZcPSL2hhbrPuYmQhB8aQXMVIQpLDd5eYrH1G8Yswhw=
X-Received: by 2002:a17:906:64d0:b0:722:e8c6:9169 with SMTP id
 p16-20020a17090664d000b00722e8c69169mr15976846ejn.206.1656385190533; Mon, 27
 Jun 2022 19:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220627090203.87-1-xieyongji@bytedance.com>
 <20220627090203.87-3-xieyongji@bytedance.com>
 <c3190d64-447f-cf46-5dd8-f5e305c04b1e@linaro.org>
In-Reply-To: <c3190d64-447f-cf46-5dd8-f5e305c04b1e@linaro.org>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 28 Jun 2022 10:59:40 +0800
Message-ID: <CACycT3tBMFaNKx2Crgga9bVP3iriUFyErLbakxgY8oDn7i7W2Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] libvduse: Replace strcpy() with strncpy()
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Jun 28, 2022 at 8:26 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/27/22 14:32, Xie Yongji wrote:
> > -    strcpy(dev_config->name, name);
> > +    strncpy(dev_config->name, name, VDUSE_NAME_MAX);
> > +    dev_config->name[VDUSE_NAME_MAX - 1] = '\0';
>
> g_strlcpy
>

Now we don't have a dependency on glib, so we use strncpy here.

Thanks,
Yongji

