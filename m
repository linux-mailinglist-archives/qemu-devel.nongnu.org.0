Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3856F2F8BF0
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 07:48:17 +0100 (CET)
Received: from localhost ([::1]:50094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0fNf-0004Zk-P1
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 01:48:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l0fMN-00045d-1f
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 01:46:55 -0500
Received: from mail-ej1-f43.google.com ([209.85.218.43]:42155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <th.huth@gmail.com>) id 1l0fML-0001ih-2X
 for qemu-devel@nongnu.org; Sat, 16 Jan 2021 01:46:54 -0500
Received: by mail-ej1-f43.google.com with SMTP id r12so5083899ejb.9
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 22:46:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fWoUUwFKwBAV+qB9lJbAE8lqcRb3leOg/58upQRJgDg=;
 b=Vh1IaZstxp5UBHl2IkV30BbRyvm87JCUX612EA5zMPLLYPnbKEjdeghsHqfyCfU4DD
 B8DzjkhMaDniSJWfSpM8U9pnPZXpMLegq9zcebZes5fl0nwIvA0/b9gD3d8wvLK5ClWh
 P1W1+idJL6VFwe67Lh48Q6yJzfQpxIHItVmb3HjsUhmobdy8auvqIXonAtP5yWRsRFKf
 Levq4W7c/n8gzih4CQ3YZkQnvVQvL9AHLnF3QBy760G6V0SiCUF8h7phoO2D7H6Bj2nT
 63rLnXH9k8x/nJy7qRJUVANTvOSNZ+B7He+3d8pvKYcB5ucvkM1A/UGIXPTlOCZNG4SF
 zsRw==
X-Gm-Message-State: AOAM533lpfa1RdKehxJV7cU3nzmMGWhMPH639ISRIU2Z5Sw6An5htL1V
 nV0ZyDHTH+RH9+Q42tVfH+k=
X-Google-Smtp-Source: ABdhPJw6bLY1EKAGqHYA5wHlQYmanbZ0uhB5WfIn2fZHckSblbcRvxIe5qys9uuQ+Xvoa/moOWUnqA==
X-Received: by 2002:a17:907:36a:: with SMTP id
 rs10mr11555312ejb.281.1610779610017; 
 Fri, 15 Jan 2021 22:46:50 -0800 (PST)
Received: from localhost (pd9e834f0.dip0.t-ipconnect.de. [217.232.52.240])
 by smtp.gmail.com with ESMTPSA id m24sm5603426ejo.52.2021.01.15.22.46.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 22:46:49 -0800 (PST)
Date: Sat, 16 Jan 2021 07:46:47 +0100
From: Thomas Huth <huth@tuxfamily.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 01/11] hw/m68k/next-cube: Make next_irq() function static
Message-ID: <20210116074647.7bda71cb@tuxfamily.org>
In-Reply-To: <20210115201206.17347-2-peter.maydell@linaro.org>
References: <20210115201206.17347-1-peter.maydell@linaro.org>
 <20210115201206.17347-2-peter.maydell@linaro.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=209.85.218.43; envelope-from=th.huth@gmail.com;
 helo=mail-ej1-f43.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
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
Cc: qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am Fri, 15 Jan 2021 20:11:56 +0000
schrieb Peter Maydell <peter.maydell@linaro.org>:

> The next_irq() function is global, but isn't actually used anywhere
> outside next-cube.c. Make it static.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/m68k/next-cube.h | 2 --
>  hw/m68k/next-cube.c         | 2 +-
>  2 files changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Thomas Huth <huth@tuxfamily.org>

