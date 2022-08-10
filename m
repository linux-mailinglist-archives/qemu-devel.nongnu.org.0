Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E203658F36D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 22:07:57 +0200 (CEST)
Received: from localhost ([::1]:58882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLrzh-0006Mu-1S
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 16:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLrvy-0004TR-7e
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 16:04:11 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:39680)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oLrvw-0002no-9G
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 16:04:05 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-328a1cff250so153440387b3.6
 for <qemu-devel@nongnu.org>; Wed, 10 Aug 2022 13:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=XlujtovikzLkyH1452V3nsZbD4BZeJbpnOAcdtiZ4sI=;
 b=uNp+Vncutl0v3CfNqeFIDkTFeyzNvaogGkgZrlx3c08w5HiIDEzmR5UjcKjFVnorV1
 P97riMG7vtPdgFeJRt3IPTYPGtEL2rUUwFe+yscKJba9T3R6LH5RTk7sukYFwz+kqjoW
 MSMbJeC9Uh4eMxXkSBZaqzFhhgHqa8bZQKVixsnTqv7Enc/dkx4ADupT+GzppCy6rOpS
 pMBtFmHihd3IW8DUji2lUykcWlgyqNlF0JTKbsQ2R/r19v0RRY58LLlOqorF7PyYxOUM
 l8fS8h8tDfbFiVy0uYxXxudvrKlof+C9y0L7Pd9FPbm/CMGf7Ad3BylwAxETU/fjkSje
 VneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=XlujtovikzLkyH1452V3nsZbD4BZeJbpnOAcdtiZ4sI=;
 b=D9amweEOIvkKh4xWBhl5YsF+s+X6tRi2HBzq8pkvEEw9PTLicOMTJBfMwIxMMV1PB7
 PTJLJ7Uss2SBUBVMSrJSby6BWjZEhqTNSAv84WVmCqdJIxzyrfsWmYyG3wB2bvjd0zP9
 yWqu0K/e3ZBwBZbQ6g/kdTeFyamLSzwfOsMG5hC7ffkNUsiAxSZNCihOGW5z3kjk2aSY
 iKubWuRM/0ZtkMXqNg2UHsDnxg1OBGPQUsfYPeOOpS8+YidNNa8BrmFrf1x1+pMHy3bN
 FJ8nmgNAckJf6C5GkAMvBbiqBTVrAQrJcHUfLV3NdkYOQIOnqUzw2xCZR+oP2w0Ie0ML
 Kh4Q==
X-Gm-Message-State: ACgBeo1Vw4ZCVsXoRj98R3nNSuYg/UdkmB1G+dTa4Y5UkbhYNWmhNrWA
 9Q0sXMowl2flJiZ8nNYrR10vj6rBurW8uZsOvBXAdQ==
X-Google-Smtp-Source: AA6agR4pOT8lQRNmuAbzZM3ycGw4R8qunwgPkUovBE13pp8G593R5QUNHOqnwmfEPchqslum6Yyu7gS9ZyXWs2DvPtk=
X-Received: by 2002:a0d:fd05:0:b0:329:3836:53ac with SMTP id
 n5-20020a0dfd05000000b00329383653acmr27881865ywf.455.1660161840478; Wed, 10
 Aug 2022 13:04:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
In-Reply-To: <CAPjTjwsb0jAsQq4PHOsFGW7SjpAe=Ug2b_fxhdccEEnzh=cQUA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Aug 2022 21:03:19 +0100
Message-ID: <CAFEAcA-F8rUTH1FimHf+FaV0O6dQ4QGHihaygxdjn9BKYPazBg@mail.gmail.com>
Subject: Re: [PATCH] [PATCH] linux-user/aarch64: Reset target data on
 MADV_DONTNEED
To: Vitaly Buka <vitalybuka@google.com>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Wed, 10 Aug 2022 at 21:00, Vitaly Buka <vitalybuka@google.com> wrote:
>
> How can we land this one?

Pinging it a week ago rather than now would have been a good start :-(
I think it got missed because you didn't cc the linux-user maintainer.

Is this a critical fix for 7.1 or can we let it slip to 7.2 ?

thanks
-- PMM

