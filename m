Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A1F17E5B5
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Mar 2020 18:30:15 +0100 (CET)
Received: from localhost ([::1]:47340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jBMEI-0001VX-EK
	for lists+qemu-devel@lfdr.de; Mon, 09 Mar 2020 13:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59835)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBMDK-0000Sx-Ns
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 13:29:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBMDJ-0003Pe-RO
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 13:29:14 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:46961)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBMDJ-0003PO-M9
 for qemu-devel@nongnu.org; Mon, 09 Mar 2020 13:29:13 -0400
Received: by mail-oi1-x243.google.com with SMTP id a22so10900285oid.13
 for <qemu-devel@nongnu.org>; Mon, 09 Mar 2020 10:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/uqVOgb+lTyAQcvV6Wk8ZxybR1Uio73gyBjTghuQNQw=;
 b=bzM+qNxzEWFhrLBdl4gC+pkx6QA/aKV/P3XZtF7fw04d/PoQWa2SmcNX0k40+i+iaZ
 QDKv74fA/NCrezMjSNp3QIoSZKmxkcNmx4f8+MqkvyO7r9FDXBpEhHZWylQJ5Tu6PZFt
 IkUCaJbg5c6VuSa8BaG9kUKiYUOB2+SlMPErfgZ8IJ052mymvAcNsxjcW4YtlyaniX6v
 Vw7P8x3/A2jvhs5PdXLJisLpnnsUyG8rAXVODVE1bx+wxis5QwSQ1G8e13efDh+8zknA
 Bjd0GRvh7JfkTutfxXX91YX5inzM1nx6apRt2PG+KSbGEdTTFu0JVceqjxpRCm81/YrR
 S8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/uqVOgb+lTyAQcvV6Wk8ZxybR1Uio73gyBjTghuQNQw=;
 b=Gj4aWrmLdY83Fxa8NP4sRFkgw6tirrhQyJII08TkcBOZl8qvFpe1QMVzNlL/QHPTpt
 PBOxdCVEr+lReW8gIapMXK1ogNKAi7oi4VRIa3I7OYpJqOKmJHLytowu9VNPOPYK6jQm
 bQxg4yyimLszAdoDZkIY9uAmcKpGXimK5bPn0I4I8Z2AGSfpWCY8nI6cFr8juaLDmqI1
 /uD00tZWqPigq5hj0INaaeg5BA/WLBSvMUQ4S4YWqhjPRkWkSTm/yh8kgLojnmLwsZWP
 tBOxbMhvH4uN3aEabKBvTqOPsrJPtn43a+A7kuSxRL2I5Z62IAGTeAPMfuIXYfE8kpdg
 V0Rg==
X-Gm-Message-State: ANhLgQ0tI2IvVyKLGHc/eUc3531gALHhKvb/PSIQG7VBtI+JLQeFVyLp
 joyo873e2BfvHMC5VKs8Ibkcu00CO4rDitG/q+dOvA==
X-Google-Smtp-Source: ADFU+vtvwSSHVWvHm/fDJXm9FQNJMJdBg8GdwNHcraosDc0lc8FszU7sB+HmmFOkk1eiYxeDMFAGD6Zz7nUfvBd23Ng=
X-Received: by 2002:aca:c695:: with SMTP id w143mr136793oif.98.1583774952905; 
 Mon, 09 Mar 2020 10:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200301170443.12904-1-linux@roeck-us.net>
 <CAFEAcA_VuY+1egn8B6=Tk8PKGuhAPuP4-=pwuWHQGQsfdXB=dw@mail.gmail.com>
 <20200309172724.GA25106@roeck-us.net>
In-Reply-To: <20200309172724.GA25106@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2020 17:29:01 +0000
Message-ID: <CAFEAcA95xW4vZtVwBySAp9GZKxpcCf9AAkC-GtkJ4OrNVAVXfA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Wire up USB controllers on fsl-imx6 and fsl-imx6ul
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 9 Mar 2020 at 17:27, Guenter Roeck <linux@roeck-us.net> wrote:
> Sure, no problem; I don't really have a preference. What would be
> the best place for such a dummy phy ?

hw/usb, I guess. hw/usb/imx-usb-phy.c ?

thanks
-- PMM

