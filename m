Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A21A2F2E24
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 12:39:30 +0100 (CET)
Received: from localhost ([::1]:53810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzI1J-0006Lo-3x
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 06:39:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzHFs-0000gd-Mz
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:50:30 -0500
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:34546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kzHFq-00050l-F2
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 05:50:28 -0500
Received: by mail-ed1-x52c.google.com with SMTP id dk8so1797312edb.1
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 02:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OhnyM6r6vVKqbf+6ywevRKsfF4KOGwRO/Ik0nXyEVcM=;
 b=j/gntiBTgNy5v1jdoWxFKRtfHzJiH8oKU03+XwHt3OHZ7borfqZwsa4ksqqHpQGwRo
 f1CL887IFeM8O70ZLNXxeoWivymcFV9djDUQNCky6L2Kno5plgGMuIRmg0vO68JfvWMV
 /zO57MXyRUS8DQiZ0/1XVOSpybuY1FgQFE8SFnuQufcVob97QJa3XC4XEptqQ/uptwSR
 WvSkuTVJRppIrh2e/gqpq0XUbgh4rv4dOZZJe/8lWeQNlwIWtCuDD7niwYWXmJZlLJnJ
 hy4XlZmFqyLG4H/6qp21ZMRXAFKv1j8iE9lJSBcIiMaY4LjKusNwBBbv+2OuP/W1xCsr
 WbXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OhnyM6r6vVKqbf+6ywevRKsfF4KOGwRO/Ik0nXyEVcM=;
 b=tMg2w6lkKm0s4jVIeO17b+ZWyz/LN3JgJzgrCaMcTw20zWsarI6J9gPcFU4rYR4zI3
 TUopwB70I6IY4rTug6xEbRMh6qxT6Pmz8BDafF/RbBZsfefi2+L0aSFNgEiukadFiHMZ
 KdLAWPlmTvK77WPJlsr7VAcDC075rbsCg/Fev6lInWi2kTav+i6qPAEG6Wu7kVmopEiA
 lX0hTaRzDM2PjBszer31j4MAtOlXk63ypcWqm3WdDWVgtCwYua8ZkZ3We0LBVimV0E0h
 8i3ZLTJzQuEx8ibipVKnMjuUsH0YG5j8/89tGM8M0xtdwzk9cfLy4BScah8od3ZVLmxf
 QnKw==
X-Gm-Message-State: AOAM532KlODd2UB++oryLOAz4kKiXnrUQsgdMuQdMgVLaUhu0PX8Rhpr
 OLPCdLHHMyggu263cneX8IwLWHL4vSnF1nUFxY8Hh0wPG+s=
X-Google-Smtp-Source: ABdhPJwv46wLYl2fGd6ODzTVSO9q5TaK9/BHyxwgTT+bSRpuoahNKpzcUpIeMdpEZf5DH0OQKeFcrMXcEkIlnQjlnDk=
X-Received: by 2002:a05:6402:366:: with SMTP id
 s6mr2835817edw.44.1610448624973; 
 Tue, 12 Jan 2021 02:50:24 -0800 (PST)
MIME-Version: 1.0
References: <20210108213815.64678-1-r.bolshakov@yadro.com>
In-Reply-To: <20210108213815.64678-1-r.bolshakov@yadro.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jan 2021 10:50:13 +0000
Message-ID: <CAFEAcA_DS08LJxZ=EQ-7WoDL=z9dPVSrRq=i=QhadBSBxJP0jQ@mail.gmail.com>
Subject: Re: [PATCH] ui/cocoa: Update path to docs in build tree
To: Roman Bolshakov <r.bolshakov@yadro.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 8 Jan 2021 at 21:38, Roman Bolshakov <r.bolshakov@yadro.com> wrote:
>
> QEMU documentation can't be opened if QEMU is run from build tree
> because executables are placed in the top of build tree after conversion
> to meson.
>
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>  ui/cocoa.m | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM

