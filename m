Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015B73DD5BD
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:36:01 +0200 (CEST)
Received: from localhost ([::1]:45570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXAm-0003ZI-2x
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:36:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAX0s-0007U0-Rm
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:25:46 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:35394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAX0r-0004Oc-7b
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:25:46 -0400
Received: by mail-ej1-x629.google.com with SMTP id o5so30630193ejy.2
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mw610wFf/yDDtOni3UVgb9xm7NvSFIdB3p8TLXg2lig=;
 b=JVcveSDenE3yt28nK4FBEIw383kSKn89cLzkNHcvPCSn5hsNWUXe+4w9hlz43spXjp
 O48Panam0fvtEnGLHVM2322s1nor4m2vxZGm9PeBinGnCVuOP8l0VNMEE+8cqjdaX4Nk
 +LtJljPCCsw/HepNlgSaq6K2umAmGaQ7p0RP3JQKTZjAUCdOiOPC5fCEn8A3QwVLe5KX
 kSvbzwMfV54zGbDuTIkbkG545YQNJnukPIeQbpv/qFcjEkFPgXv/26xGmdTEhEMwwCr7
 FxoJ1tFt6VcJCJUaMujUHm446vU+V4cEmko4BOThQJSBeKfU/2Pswwmecz9YVPr77YbC
 /Now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mw610wFf/yDDtOni3UVgb9xm7NvSFIdB3p8TLXg2lig=;
 b=Ly32t7pjpprf8Z70PzFaG6foklX7M8JIZYeLCBR7ajZ5FdEsEwUIiORFgl5CigXub4
 kQYHyxjzjTSYyqILq/Wa2/GVbvGpv5XABuNMkrACUjUTNpIvyU1ysdvVClT7mSrBnoku
 LYNVSNq4chJmS4OGuMuiyxi3nZ2fxTVhaixBIziuMKxc/ww2XkaOV6CjiuZd5XlGrxVP
 XljdUhkvCytSrcGp4G1FkLEsimFNUTOEOW0F0RX1F6OeWsrLj1YYc3z0aVDTy05bQ0lh
 n5ne3eMUzbzy2CSmC++DXxE36SylHZseUEzS09L/u9J7TqSDzvBVxAZORBDcV5At6cy5
 R3Iw==
X-Gm-Message-State: AOAM532uq3EPi4EYcfmyVVLnwjLZhmmB+ledfG+lzNvVSUYncodYeJEZ
 UV4g9m5kNgWIzf8okRIIUO/CiPM4CXgIVE/lZiGHCg==
X-Google-Smtp-Source: ABdhPJxYOvhrnMiQaon5CM3p8jKWUpWM0bxU1Y1tU2XtahXrKctPe1LNQw6xUD0YBC/loDJi19xuOc6RiZAy/wyoobU=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr15026836ejy.407.1627907142997; 
 Mon, 02 Aug 2021 05:25:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210729175554.686474-1-ehabkost@redhat.com>
 <20210729175554.686474-8-ehabkost@redhat.com>
In-Reply-To: <20210729175554.686474-8-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:24:59 +0100
Message-ID: <CAFEAcA9QSYOegAsEA2bXDP13u5i86Din_4nxJ8G+gAeegnaUwA@mail.gmail.com>
Subject: Re: [PATCH for-6.2 07/10] docs: qom: Fix OBJECT_DECLARE_SIMPLE_TYPE
 documentation
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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

On Thu, 29 Jul 2021 at 19:03, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> The OBJECT_DECLARE_SIMPLE_TYPE documentation was inaccurate: it
> doesn't define a class struct or class type checking helpers.
>
> OBJECT_DECLARE_TYPE expansion looks very similar to the existing
> example, though.  Rewrite that section to show both both
> OBJECT_DECLARE_SIMPLE_TYPE and OBJECT_DECLARE_TYPE.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  docs/devel/qom.rst | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
>
> diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
> index dee60a64c0a..aa1f672efbe 100644
> --- a/docs/devel/qom.rst
> +++ b/docs/devel/qom.rst
> @@ -301,6 +301,27 @@ This is equivalent to the following:
>  .. code-block:: c
>     :caption: Expansion from declaring a simple type
>
> +   typedef struct MyDevice MyDevice;
> +   G_DEFINE_AUTOPTR_CLEANUP_FUNC(MyDevice, object_unref)
> +   #define MY_DEVICE(void *obj)
> +           OBJECT_CHECK(MyDevice, obj, TYPE_MY_DEVICE)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

though I note that the macro doesn't actually create a
MY_DEVICE #define any more -- you get a function named MY_DEVICE().
I guess "equivalent to" covers that.

thanks
-- PMM

