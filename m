Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B413DD5A1
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:28:47 +0200 (CEST)
Received: from localhost ([::1]:58986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAX3m-0001o5-Kz
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:28:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAX1a-0000Gh-K7
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:26:30 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:41965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAX1Y-0004c7-Dk
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:26:30 -0400
Received: by mail-ej1-x62c.google.com with SMTP id x11so29679180ejj.8
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QeaDPP+A5aOWxGv9hlDEU9ahJrItkD2Ue4Hqv31h9jc=;
 b=JIDhCtxZXqt8KSTz/d47aSSvEBYs9cNdMk768xJoWanodyWjpI6D6WNxkRPZkrOj0T
 aaGEWkAIcNM1i3C9dwQ2WM4ytdrEMRD7uCZIIkoDdBMrhoFsr45l81mh3YigQ5OPYth3
 clwO9v2yq3J4OYWncwcwHN0ccWhSNFBOO7GFHRh+NaJSnXqN8Ww2y/z94y0I5AACVXsK
 QJtFmr6Odoy0wmYt+4n3vUkswRA7CRhE2zqBeQOiy8ePikp2YHS6AEgg+O/NlhVGZAjg
 sGT6p03LrnQSSyHIRAhKd22Lwc3WIw6etAg4ZUmCinN9VceAuhsYOKO87umrSvm9LuSd
 9hbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QeaDPP+A5aOWxGv9hlDEU9ahJrItkD2Ue4Hqv31h9jc=;
 b=BioGLjRu0YR3wMMbG9YFlPHZxnWoJlCGP6ipeElJkTkLHjTEYlyKxnoiRdxLDa/SY+
 SOP9ag6YyDSvYLZNoGwClbKysXnAhYNIrWuLRdc/67UGxhdz4ICxHcl9r5HwiomvuS79
 LgYd0ZpKnFztXsZGk3eMPzzdpv6me20l482kF3yWXy8vShVM3y0H6yj4Vk1VLCsyq8Di
 02M0JQY8y7J0sX+5hr1G5F2Ov6/iFv5P04erHOd0Ld0NOlivrZKJKFoQwmGp9m8EoXfZ
 viMJY5zk0FjRKIFZxz0B91EoDiQKcfY63VS4aXqZQYmfpz2BaY5HPtOrdPTPDJnfGmRg
 2nFg==
X-Gm-Message-State: AOAM531WdN0Dvk6GubrI2WeVIxOfgvtCioslzpFoTJ/MnVv3g6SPx1rc
 Pe9rfCQU7XMQnz0ig895b2CQPbfh4jAldZX+B4wUOg==
X-Google-Smtp-Source: ABdhPJzOzET5jl9UVhxBIZ2h7yhMPZR5YxyXFVnVCMnbb0EAdFFQ/qjmPP4bsIQtj2hUFWQdvOVziXxmRluORHGYix4=
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr15497189ejz.250.1627907186698; 
 Mon, 02 Aug 2021 05:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210729175554.686474-1-ehabkost@redhat.com>
 <20210729175554.686474-9-ehabkost@redhat.com>
In-Reply-To: <20210729175554.686474-9-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:25:43 +0100
Message-ID: <CAFEAcA91NKGOWaydEcBdcxnS_jhYuZdtUHPvcLvnLNkLJDeROg@mail.gmail.com>
Subject: Re: [PATCH for-6.2 08/10] docs: qom: Show actual typecast functions
 in examples
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
> For clarity and to avoid encouraging people to copy the examples,
> show the actual typecast functions being defined by
> OBJECT_DECLARE* macros in the examples.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  docs/devel/qom.rst | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
>
> diff --git a/docs/devel/qom.rst b/docs/devel/qom.rst
> index aa1f672efbe..3ae6f75a1a2 100644
> --- a/docs/devel/qom.rst
> +++ b/docs/devel/qom.rst
> @@ -303,8 +303,10 @@ This is equivalent to the following:
>
>     typedef struct MyDevice MyDevice;
>     G_DEFINE_AUTOPTR_CLEANUP_FUNC(MyDevice, object_unref)
> -   #define MY_DEVICE(void *obj)
> -           OBJECT_CHECK(MyDevice, obj, TYPE_MY_DEVICE)
> +   static inline MyDevice *MY_DEVICE(void *obj)
> +   {
> +       return OBJECT_CHECK(MyDevice, obj, TYPE_MY_DEVICE);
> +   }
>
>  The 'struct MyDevice' needs to be declared separately.
>
> @@ -327,12 +329,18 @@ This is equivalent to the following:
>
>     G_DEFINE_AUTOPTR_CLEANUP_FUNC(MyDevice, object_unref)
>
> -   #define MY_DEVICE_GET_CLASS(void *obj) \
> -           OBJECT_GET_CLASS(MyDeviceClass, obj, TYPE_MY_DEVICE)
> -   #define MY_DEVICE_CLASS(void *klass) \
> -           OBJECT_CLASS_CHECK(MyDeviceClass, klass, TYPE_MY_DEVICE)
> -   #define MY_DEVICE(void *obj)
> -           OBJECT_CHECK(MyDevice, obj, TYPE_MY_DEVICE)
> +   static inline MyDeviceClass *MY_DEVICE_GET_CLASS(void *obj)
> +   {
> +       return OBJECT_GET_CLASS(MyDeviceClass, obj, TYPE_MY_DEVICE);
> +   }
> +   static inline MyDeviceClass *MY_DEVICE_CLASS(void *klass)
> +   {
> +       return OBJECT_CLASS_CHECK(MyDeviceClass, klass, TYPE_MY_DEVICE);
> +   }
> +   static inline MyDevice *MY_DEVICE(void *obj)
> +   {
> +       return OBJECT_CHECK(MyDevice, obj, TYPE_MY_DEVICE);
> +   }

...aha, you can ignore my remark on the previous patch :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

