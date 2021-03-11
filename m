Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFA933787A
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Mar 2021 16:52:51 +0100 (CET)
Received: from localhost ([::1]:44828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKNcI-0003dv-R4
	for lists+qemu-devel@lfdr.de; Thu, 11 Mar 2021 10:52:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKMpo-0002a1-LL
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:02:45 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:43838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKMpm-0002fB-Qu
 for qemu-devel@nongnu.org; Thu, 11 Mar 2021 10:02:44 -0500
Received: by mail-ed1-x52d.google.com with SMTP id e7so3200804edu.10
 for <qemu-devel@nongnu.org>; Thu, 11 Mar 2021 07:02:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Iw7U+5ZHEnqUoFiE9mkgKaNYgTimkKg8GH1qGsrDMM4=;
 b=v0ShzDIH8wH5K5p/WzNee/xyPPhIdK4mwZrYDwePIj5sB6XUSswVRw2uocz+W4ppJ1
 Ila47LJswtJ0hELg/cfptq1LuUuHuU31lhGb/MFSX+sUNR+saGblJTX2LB7cOmKXxvqZ
 E4MIKWsNF9tsuvIWuofiip5sf4E/MSupAZcVKmgRaLm2bamCbd0GIwEhLXYfzLp7RaAI
 R4q/nC/qY9PLiRwo5ND0UEYKlny7/ObWcaxZoQ4/zOpLYDBva8lpbHPGWSrxoWW9pW2S
 FSUwYg7LsfbO+2dIQ4YR8DA2JPX4avM2czYwGNS7/lygH4sNc9PrxaVaizP81MauZ3RI
 14EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iw7U+5ZHEnqUoFiE9mkgKaNYgTimkKg8GH1qGsrDMM4=;
 b=j2WHSSep/Nt+3cVtWY+5+3Yl+O+/nM1XnG+VF99VmI2MFlXVKjRDo54lF4pWoCGKSW
 tKOqCoUNi1P0c1TGlErC8pk1iJW+xLh9uXiwmixM65AmMICi6fFRUUXovypM/1HP8rF4
 hmfKeLCNz2Q+GfIJJ9XW2foBj4kQvRPRt9xJ0+NAcY7KuktJOyTNwlTIM+ILluTVZotY
 WTf7pvB+pG4U0oWUVgHtMc4AmNmFV9T/fGSkxPy6tO9l5EaTAFb2hmdPxFViqDA/np7y
 go87NGrsViIo5b6uyr/jOrI3j+8v4St3IdDIdixrzciQusBSNzOf77i91fmPTD7hx3GI
 mwcQ==
X-Gm-Message-State: AOAM530cxc58jPLVReS6DrkUeiWHQt/k7Iod61l4SODaThL9QYThhrxl
 /45r2ByLt0DzEmllbIBeF3jiAHNmQfhmJcuw2cXyFw==
X-Google-Smtp-Source: ABdhPJy8fo23gAYUmq9DdL5Djfjq6aFy+JhRPXWUU+wG6rxY2BP019FrsN9P56I0IfNs/a0st2mB+zB3FqNhKCNBIPk=
X-Received: by 2002:a05:6402:c:: with SMTP id
 d12mr8812578edu.100.1615474960816; 
 Thu, 11 Mar 2021 07:02:40 -0800 (PST)
MIME-Version: 1.0
References: <11e9d3bb-c94c-4ad7-35b0-b698376c5e00@suse.de>
In-Reply-To: <11e9d3bb-c94c-4ad7-35b0-b698376c5e00@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Mar 2021 15:02:22 +0000
Message-ID: <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
Subject: Re: arm: "max" CPU class hierarchy changes possible?
To: Claudio Fontana <cfontana@suse.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 11 Mar 2021 at 14:27, Claudio Fontana <cfontana@suse.de> wrote:
> the "max" cpu in x86 and s390 is a class,
>
> and then "host" has "max" as parent.
>
> This would be a convenient setup for ARM too, as it would allow to put common code between kvm and tcg in the "max" class,
> and allow "host" to specialize the behavior for KVM (and in the future HVF probably).
>
> Would changing the class hierarchy this way be acceptable, cause any problems?

It's not clear to me why 'host' would be a subtype of 'max':
that doesn't seem like an obvious relationship.

thanks
-- PMM

