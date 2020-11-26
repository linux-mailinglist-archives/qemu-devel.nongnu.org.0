Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1052C53E6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 13:24:29 +0100 (CET)
Received: from localhost ([::1]:40348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiGK4-0004W8-Q6
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 07:24:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiG6m-0003z3-L4
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:10:44 -0500
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:40670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kiG6k-0003H9-Vn
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 07:10:44 -0500
Received: by mail-ed1-x543.google.com with SMTP id d18so2025916edt.7
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 04:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=I6CjRPhpxfvVzzCzvZfqBA46U+k5vDbHVEOxMHCfP9E=;
 b=eBV2USvCieIVfsgDUNS+z5GQA1ETo/KHGS4nv1LFLgRE/42s3gLhReJTVerWlRH8Bm
 1FqVAInqNJAj00sRD1EewAEaCGfnHJKYcKNM3k79vyThFHrejeFegif7BZixgy0nfv/Y
 LAmpG3gEB1NcbbRp/DUK9f1VdXYKHlPsKkFaB59xMQiMHiq1/4ymd84M6cPY8w7Gg7qa
 G5WuXzgTj0Wk81om5y5g+Xry2ZLKew1z11Y4cJrgR8NdkySshlzoTrw8TlucWR/QEN05
 i42ME1JvqtxDOn0pvcjdSz4rKNm/ZBtOzwKexbcQ1HD2FsFsSvofdDgWn2OM0ZfGIP0/
 EDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=I6CjRPhpxfvVzzCzvZfqBA46U+k5vDbHVEOxMHCfP9E=;
 b=AbRsbyntj+OLnAmGNAx4J+bElUyJ+lqaBHeC9KU1jt4EzWGgfpg/HmSE32sO6cjtii
 s15FYaibjH+yZYQFRNKMP2Rq6OmuIjWawDHGwhxbig+TPSFWW3Fe5C9zFiM0J01bOpmd
 27camUd5t2fNjOjZWmXo5WO6zMDKt3d0O+RZrVKlK28pryuh7mjyKGAoQr6+5FSvEwmC
 82TqFtHNOH18vGNHEI2qUUskWoXZXh8d8UCuYxiF9ugiJ2JFdN+uPPhZ6u4gYQmfJDr3
 EGfFy48Fhq6ytNdr0wot4vDFTl9vexFvY82fqcBu2CP9dglPFgHmht4JhiDGP9G7tTbY
 2Ulg==
X-Gm-Message-State: AOAM5310pJrYDVkyWq73k4AcQMGPj2C/2hOYTNYhGvPJuDaVkkvrVPml
 V4H1Tf/oHyFQJa6+UMgZEtLwjKYOPabz8yha6qJIvA==
X-Google-Smtp-Source: ABdhPJyhrD5gbdy+Rt/h4MfFaumC+h/JeOOToVlNV0PYly6DTO37rcu4JGpvuwgBE0viVFpf6QrGc6XSHqSiq6RjMuQ=
X-Received: by 2002:aa7:df82:: with SMTP id b2mr2136058edy.251.1606392640281; 
 Thu, 26 Nov 2020 04:10:40 -0800 (PST)
MIME-Version: 1.0
References: <20201126112915.525285-1-marcandre.lureau@redhat.com>
 <20201126112915.525285-14-marcandre.lureau@redhat.com>
In-Reply-To: <20201126112915.525285-14-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Nov 2020 12:10:29 +0000
Message-ID: <CAFEAcA8zAV-B9t+2hiX5vSe3uGX9YYEDd=A_6_MS-KhfBGhyGQ@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] linux-user: remove GNUC check
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 26 Nov 2020 at 11:31, <marcandre.lureau@redhat.com> wrote:
>
> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> QEMU requires Clang or GCC, that define and support __GNUC__ extensions.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

