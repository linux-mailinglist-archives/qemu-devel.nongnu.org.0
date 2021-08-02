Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FB03DD58F
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:21:32 +0200 (CEST)
Received: from localhost ([::1]:41916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAWwj-0006k5-Vf
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:21:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWsQ-0000qB-SI
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:17:02 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:34771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAWsP-0001CU-84
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:17:02 -0400
Received: by mail-ej1-x62e.google.com with SMTP id cb3so8591663ejb.1
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IhZijOkejXKhCzBzgcARey+v39ayxwtXrrlvz6UYEOo=;
 b=qIWz/gq/v8D3ZMd3THgew6erFE5aoPRHPZMIq8sHiIZqXtu9+zX+ajcY0p7Ee476Dp
 /2FBVmwHTbyS0G/drga3aWQ6gKGLXuF9ogqg6iy25U2rVxbOEc9yooIr3/Lr3TaHmCoo
 JgiUji2GtmCFupciDBkH7KOEoz+hUeyIhHVsmwFw4Kp/q7aKwlvRBOeGS6DOhPZLo8N2
 myBG3JvgFDwjKGz9o2gnA2k5vjdSmxwlzsaTccUiJCt1pKauT0GvIx+KIwefhppeCaiq
 QQhaP50PflKdn+u2zfPTFKUBJYn0Tkw4lviVhtPh8kcUF7rf5UMBcilG7S42BHLfz9rq
 kPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IhZijOkejXKhCzBzgcARey+v39ayxwtXrrlvz6UYEOo=;
 b=CGnywyYgHh3kAv1Aqtk2Z61h4ijeNEtug3t0NBYMUirkJxueACXW/YXwpTq4fMluiS
 JTkPa+FWruPJcm8XScpySDx370T37XzEJFrOHmy+DwoArqzTdRunJqz4hsoSm0oAXhRu
 KKbcip+K2cDTfxu2c6ZN70liAEOgrLhWvxvPIVBV4oz6xJ39U0N46uaeniFiDPSXHqOD
 ZLUbfhz3KMXMgRRdX98WOV7iPZKoxzycBnshMN8zshQ8VqFmbs70L8NDyxwBgCjYp7fM
 tWfINaXmBiH9im9ca63cL+qZ3k+ZgcR/2l1q9Eu0Dgpp2kevNOf243ucTZ7yIkB0qE6G
 Ek0Q==
X-Gm-Message-State: AOAM5316uJ2FZdMeXX2bvN7sW1dxR1TEdtz5uVhRNj5wHgE0rFED52z+
 V9bUvwTx/sWB1wkoVfv4LnSuHla/xkYtiqA11bJh3g==
X-Google-Smtp-Source: ABdhPJxs4ULZlVDn/h9fMnyZka5zWqY+8uKHi/2nbWX4HYrQ3Omb5EE29Rl1Ljo/2MJCWXJeKibehTgsLdhx4Y/nnLk=
X-Received: by 2002:a17:906:948f:: with SMTP id
 t15mr15292489ejx.85.1627906619674; 
 Mon, 02 Aug 2021 05:16:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210729175554.686474-1-ehabkost@redhat.com>
 <20210729175554.686474-4-ehabkost@redhat.com>
In-Reply-To: <20210729175554.686474-4-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:16:16 +0100
Message-ID: <CAFEAcA9+9opQkZWPZi7=X0RGX1uOHzwVZ7Py0DeK0sV9DUoSqg@mail.gmail.com>
Subject: Re: [PATCH for-6.2 03/10] docs: qom: Fix autoptr expansion example
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 29 Jul 2021 at 18:59, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> The wrong type name was being used.  The autoptr cleanup function
> will be declared for the instance type, not the class type.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  docs/devel/qom.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

