Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E8732B18F6
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Nov 2020 11:23:45 +0100 (CET)
Received: from localhost ([::1]:38850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdWF6-0006a9-MF
	for lists+qemu-devel@lfdr.de; Fri, 13 Nov 2020 05:23:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdWDo-0005ff-0N
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:22:24 -0500
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:45417)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kdWDl-0005ZN-8a
 for qemu-devel@nongnu.org; Fri, 13 Nov 2020 05:22:23 -0500
Received: by mail-ej1-x644.google.com with SMTP id dk16so12562442ejb.12
 for <qemu-devel@nongnu.org>; Fri, 13 Nov 2020 02:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JvBvlPeyTqBAxdYxBURIqxgEl3CUhrDGjzdJazJSBr8=;
 b=CGhIkYLH5Un06R6EHhduy01xsmwrR0q9+nJce9uQzDXGuJlQ8JqEwDhZYhkOJKcTJk
 7l9XIJoYKaaIlqOKUZCFLjM1AincirciIpLEjz2ENI7zt/ajKcMIUrqp78qLQVus78H4
 p6LwyHlJ3t1ddGL0CSBSnc0n2+maAjUanNVIL4hymEWWdd4Dvz8L4HKVG8PWj+GcV7+c
 XNWWI5Sqtnn+hQt82w+wOAqhEiPR1yvKJL2aW0cW3n6A9lXQstwCSK1WKJQyrWbtsBy3
 bAofZRZezYdhdMCU1fQl2Vp0+WGr/PwCCPhV7D+cZLejiznh6Y7gexSj5k/+Jedt9+Yk
 Sc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JvBvlPeyTqBAxdYxBURIqxgEl3CUhrDGjzdJazJSBr8=;
 b=ZoYbbjNVKF9XzLBVFgzj1ZQQwR+0gYse/UbrB4VcBdvC/EC9lm9lMgdHDI6c+YnOBt
 LoGTUzKHN6ykkScrpo6CGwFSkQwYthwFvEVzzmj7FOUtPQob9GR+BXk6aou2GDfgUsNf
 FFgr0RCIwlII0bPslA/qKVfcECyyZOl5a1L+vqRUMU7W1DkQBSdT0B7oB+9SE4Fdidm0
 zjT4+eUE4rbUzVeYjZiQlDx6Kpxbn/geXk/vY7dCG1fjX4JR1D1KDo4x4VVWSy/05KoP
 2BdEMUpZgFMfCLum5keamxVkABXmqx+ETsJs5hSeaYaeVGZ9COQgT36JKMU/a7T4opbI
 WlDw==
X-Gm-Message-State: AOAM532k5nyGsXviTsa2bOuFK7lVFnpISaVIMbyXCij/aH3jlf2iQw1a
 1jgB/bqZf2W/Z5QUVmzLO5a9d0EYEde9jYnoRB2rFV0nRiI=
X-Google-Smtp-Source: ABdhPJzUztxtJOCf5iy+aa6ShSLq6W2S3XtiROShCfNLI3F1lX4m+1woJP86GSCPnZgBnQsqn/GD0gsCPkaFjkO02rw=
X-Received: by 2002:a17:906:6949:: with SMTP id
 c9mr1209727ejs.482.1605262939702; 
 Fri, 13 Nov 2020 02:22:19 -0800 (PST)
MIME-Version: 1.0
References: <20201113101715.1438460-1-pbonzini@redhat.com>
In-Reply-To: <20201113101715.1438460-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Nov 2020 10:22:08 +0000
Message-ID: <CAFEAcA_rg8hZTH8pb6VJ8Wo7z52pqx0TOsXB-hOfmaHmHBLg0w@mail.gmail.com>
Subject: Re: [PATCH v2] digic: remove bios_name
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 13 Nov 2020 at 10:17, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Pull defaults to digic4_board_init so that a MachineState is available.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  hw/arm/digic_boards.c | 19 +++++++------------
>  1 file changed, 7 insertions(+), 12 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Did you want me to take this via target-arm.next or are you
planning to include it in some other series/pull ?

thanks
-- PMM

