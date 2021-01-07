Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 200632EE664
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 20:52:22 +0100 (CET)
Received: from localhost ([::1]:52104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbKX-0005Ik-7T
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 14:52:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxbJN-0004m7-6a
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:51:09 -0500
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:34506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kxbJL-0000SG-QX
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:51:08 -0500
Received: by mail-ej1-x631.google.com with SMTP id g20so11453678ejb.1
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 11:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YOBuPrg8hgIjfOJSUj0MBP9/fQ7Gxv8uF8lMWeFj8YY=;
 b=YviEYRQgEhBahBnaeSWyy3VOEB41LUGRnbJIoAqYfUqFtlV147btDAZeudSsTVdpUS
 MAMpffMhbRZ6bOlONrD5QqxT3UII58u3404BFt7b74m5CTD8/4H25TKCA18mZvp+T93u
 k4CwVoHQEgOtwjG0o6NCVYeRQkxQ6nDs53amZc9ntdXD9wYVu8CsegI+AfMXMbmUSV15
 a34VFsBOKTkcDe8qwazNXWUI3GykkuDj57zNDlQM/AbBWgN8n1JKAtsT8vlZF7sZraWq
 6QPiRBkT9tFh7VXGMEx+o2bLhspQgp6GxsT26IE7SMXL6SYaFbuM3S1ZiRdBmdFiXqEg
 SRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YOBuPrg8hgIjfOJSUj0MBP9/fQ7Gxv8uF8lMWeFj8YY=;
 b=W2BE9j83CUOFuS6JghTQGQp3DJgsAhOIpRj2jcrcWHNv2sByFtpAiBNR2VqsOUBy2e
 QVCw6LB8fpC8C2OAnAJRmPeQxdV60lUHZ2oenKu+/wzpcE5WF1UZTx5HBuTpzBz2d6Id
 ozMVpJACoPZ8KvhsWHSesrpJZgfTRPCNe33i/G6ITZyyLtG7AwnzLQfeef0iRd/T0uPL
 EQiom1r5+XliQpw+w5CAaNTNL0lupmvkmeAdZc7fX/MiJMbxDlZcMxSWm27c6mLXaUxZ
 aTDd5WcZHuOACFdcKSOcoTQifv9zog3TVNGa6tWbOyPxr3tMV1wcSzoZaABUjoiwaqj1
 1Jxg==
X-Gm-Message-State: AOAM532UaXW+peqAqvXdtm2DzStC1AoB6QY1R8Py5g73wjqHtBmVOGS1
 PKbXldmBQWMV6v9W8qVCIwZHehElUBevofAyxjObYRM8NC0=
X-Google-Smtp-Source: ABdhPJxCn4F+fLSvrYIex5Ht/aMDErWWiQ0tIdJkOOSJa6qHVTXXnwMJV9kj642gdbJ9OXRsoMrCKEUM5cNTd+WkCd8=
X-Received: by 2002:a17:906:195a:: with SMTP id b26mr327109eje.4.1610049066291; 
 Thu, 07 Jan 2021 11:51:06 -0800 (PST)
MIME-Version: 1.0
References: <20201223060204.576856-1-richard.henderson@linaro.org>
 <20201223060204.576856-19-richard.henderson@linaro.org>
 <CAFEAcA8UDVsG=5EgwJ3007OXei+BXoJ8pb5y+HNW_+W6ZQk7MA@mail.gmail.com>
 <ded52226-9b0c-bf4b-1dd4-5adaf5fe6901@linaro.org>
In-Reply-To: <ded52226-9b0c-bf4b-1dd4-5adaf5fe6901@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2021 19:50:55 +0000
Message-ID: <CAFEAcA95ZwE7WK94_w-pL_KdNoD1cmCT4P2HvXtzsZNkeNWuYw@mail.gmail.com>
Subject: Re: [PATCH 18/22] tcg/riscv: Convert to tcg-target-conset.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 7 Jan 2021 at 19:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/7/21 8:08 AM, Peter Maydell wrote:
> > (Also "conset.h" looks really like a typo for "const.h" which
> > is kinda confusing :-))
>
> Naming suggestions?  :-)

tcg-target-con-set.h ?

-- PMM

