Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C3333C2FE
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:59:49 +0100 (CET)
Received: from localhost ([::1]:54426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqZI-0005jO-ML
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:59:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLqXe-0004rw-Fb
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:58:06 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:37669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lLqXc-00080Q-GX
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:58:06 -0400
Received: by mail-ed1-x530.google.com with SMTP id x21so18165759eds.4
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 09:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gvO7phcY592RIOQBgbWofWsVkkRtBvoq+CVCXSOPeMk=;
 b=zRci3zng4/cXsURJaoUFZbQ4oELg/240EEgcekj0mor57hlqNG1z6naokblcsJhsa9
 UNv/y4gChJl7Ws32IfEbzVqo0LzL3P/VzUj1ocQqs7R1gYXhu2jdMCy64DqGeYJHaz61
 yuSCei6dXiov3auPzahZealepzdJLf99GGPb60yhZyiNXWiqmzfwhLg6G8f8Rad8U4B/
 lwK3JpmRnYAGEfE/m5RJDGktdBv00qPB32dm6jy6RDGwl5LveKem2u4tm0WM5EadHTtT
 s2n7zagqj+8LeVkPKk/D8PQfkzav5d1exGGMqWGgr0I4BnRVK1wgKbtTvB46D7ELr9Cg
 agXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gvO7phcY592RIOQBgbWofWsVkkRtBvoq+CVCXSOPeMk=;
 b=YU7ZjjuorzfFmN5zBWlRGFbSwWl5hkuXnd9Rkn1TCQExvHWE7qb8xx9dK9amsm1tv8
 qokabQEdSpDJfH6xeNT0vSBXUdP39lE3TtLOfYI9zD4txo9aML+JVG3Un6EHL8IhKZAC
 6p2+TBcldfSHzKVGAnWRobW25RjFgTkxq3njD9DyWOpmxqkC7sr6c6YCljRvue24knM/
 oOoDCdiD9o9NJT85mwglmK49PngjHhlxfW3ICwtSmc9Jdnrq6nfdoxCgt6DOofuqcjWw
 +fodJCFsjnpyCVB/0w/fwomEkIa6/zc9bbceWNGzqeuZJm41JRCulLVr25/JkON3Hok7
 Xs7w==
X-Gm-Message-State: AOAM5331a2t1o3HlPcVnOLwxq7TLlaxvRTwyc95DSYCmCZwi00i0NiaQ
 l+3ZAZkEIw2VtjL6q3chTdpakb4Icx6dOF9AHTOPWg==
X-Google-Smtp-Source: ABdhPJxHtDVGgxpjy3cTq7rC0RY/vz5RdaUdhW2lvlV4PD3Zfd/r2p3oRJr7W5VtNXJZMnjU0oFc6FmmPPH11D4RBXQ=
X-Received: by 2002:aa7:c3cd:: with SMTP id l13mr30696388edr.52.1615827482779; 
 Mon, 15 Mar 2021 09:58:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210315165312.22453-1-alex.bennee@linaro.org>
In-Reply-To: <20210315165312.22453-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Mar 2021 16:57:40 +0000
Message-ID: <CAFEAcA8gnFdOprY=yj+voN+DJ44zx3+9ABM3yMPdWJSQ3X6QrQ@mail.gmail.com>
Subject: Re: [RFC PATCH] docs/devel: expand style section of memory management
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 15 Mar 2021 at 16:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> -Prefer g_new(T, n) instead of g_malloc(sizeof(T) ``*`` n) for the follow=
ing
> +Care should be taken to avoid introducing places where the guest could
> +trigger an exit. For example using ``g_malloc`` on start-up is fine
> +if the result of a failure is going to be a fatal exit anyway. There
> +may be some start-up cases where failing is unreasonable (for example
> +speculatively loading debug symbols).
> +
> +However if we are doing an allocation because of something the guest
> +has done we should never trigger an exit. The code may deal with this
> +by trying to allocate less memory and continue or re-designed to allocat=
e
> +buffers on start-up.

I think this is overly strong. We want to avoid malloc-or-die for
cases where the guest gets to decide how big the allocation is;
but if we're doing a single small fixed-size allocation that happens
to be triggered by a guest action we should be OK to g_malloc() that
I think.

> +If the lifetime of the allocation is within the function and there are
> +multiple exist paths you can also improve the readability of the code

"exit"

> +by using ``g_autofree`` and related annotations. See :ref:`autofree-ref`
> +for more details.

thanks
-- PMM

