Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C3C2FB650
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:22:02 +0100 (CET)
Received: from localhost ([::1]:42618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1qxN-0001O0-HV
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:22:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1qq0-0005WP-EX
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:14:24 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:42192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1qpy-0007lH-Uh
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:14:24 -0500
Received: by mail-ej1-x633.google.com with SMTP id r12so17057005ejb.9
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 05:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dMJJyO6N7x4Oi1jXPB5mGdWiHXz53iX01qh4N/q/Gsg=;
 b=YMKMaWg9LuBmZ8vJaSQBKl6kK7hleVlaR6BHLfbkUlMMINEF1eTGrUbuQtEtPXhaoM
 XHqaMU3b9XmJgM6u/l5gd7sBStVq4jcyvjVg+Yh59CXKUzAGnxBpDTUVlvl4miJQQyQG
 FRSS/ClP6qjloZwZCtz8LFHlkO7wdzu+lIFdxNmdIXZfwslI0gjDHMCEABoRM0c977Wx
 4UqASzlGzKW9Of/LjhWkaIfCjAYHakL4gWmzqQGfJ0v8CGi3CQKfssu43b61Ryq9WOYc
 hwa3xxe6fTQqhMiwQWTCpKBJHGKDuwBC+b5N7XbukKR6tVxvLlKY4L8DUCejd9YaqOh5
 jgig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dMJJyO6N7x4Oi1jXPB5mGdWiHXz53iX01qh4N/q/Gsg=;
 b=TYyzc88+Yvz09g5mrBcTiy4ASytELtMli+TTyUE/Jq5L2etvnEEpo31BKPlI9DUPIr
 rRsQA9yi/VaFZNrPuVd7vFcAwumqht1kr4QCQKMfoNGhTiv77304tD/+Zwopon5mnv5t
 WMvoVA8PRinBrzneeIaAg8AZpTZK7cgCBWfbuAeimzJue8FdwGMiSnM5AH2hnmUCyzkE
 RrHjQ25Xpe6+ZwcG5yPIX9vg2r7wU+HEZJ00bmka9yjPjz4xkJ5G4wzf42/xhzapVTjY
 YChhPeo8q2Qv2zA3bjbzJN28PeVOz0Ji+94xA4XJOsfU98hUM/7jQ16IuwiWjyL8QK5N
 pxTg==
X-Gm-Message-State: AOAM532q2DwIGkJ00l4O17uwUJe3EElY0gHR2R0wACYFH/bAFnMAIVLK
 pxbIqykRCcrGUqb7Xt7pS1cyAt/gNEIV8qSTd1aG635hfhk=
X-Google-Smtp-Source: ABdhPJx/1sUmVdp4uxo4ZBSj7Ncna/1HK6iLOqWeshkdudMfOakn+Z7aSf60pMGKC5dtFWKb6Wd/APG64N6GAdOvo4Y=
X-Received: by 2002:a17:906:b215:: with SMTP id
 p21mr2870594ejz.407.1611062061444; 
 Tue, 19 Jan 2021 05:14:21 -0800 (PST)
MIME-Version: 1.0
References: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
 <1610735646-13313-3-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1610735646-13313-3-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 13:14:10 +0000
Message-ID: <CAFEAcA8NM6q5N5Pxp4wKd0B3qfABi3YFyh939YzpMCEBNuSvgg@mail.gmail.com>
Subject: Re: [PATCH 2/4] hw/misc/pvpanic: add PCI interface support
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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

On Fri, 15 Jan 2021 at 19:23, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> Add PCI interface support for PVPANIC device. Create a new file pvpanic-pci.c
> where the PCI specific routines reside and update the build system with the new
> files and config structure.
>
> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

