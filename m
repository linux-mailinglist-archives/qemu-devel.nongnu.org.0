Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9546BEBF8
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 15:58:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdBWf-00049t-1H; Fri, 17 Mar 2023 10:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdBWc-0003mS-2O
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:57:46 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pdBWa-0008PO-9g
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:57:45 -0400
Received: by mail-pj1-x1032.google.com with SMTP id j13so5405730pjd.1
 for <qemu-devel@nongnu.org>; Fri, 17 Mar 2023 07:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679065062;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4UvHn4dN/o9rLUAqeygnrsSnWf1IH/tzbMZtwq+vZKk=;
 b=MOxP3OKQ6EuNmOcSnMGI8/nYZlWW8z8FjswH0/3qfVjKOS0AXpzMW5P2Ygd1M2KGe5
 2m13jxPTVXds41NIoztjcVto80r++kelMwLVFX7U0krBxSuDZHj3qhhZzypNg6acVxBz
 qKPAMjOsCcbXANAblVLrSa5da5i+aY+6UjGfOltsoP1I+iTukbGQXmft3u2U7QVyglkU
 STCGMRgbBHwTCVGhuUqr738vAWQSGxurL+G34fSDnCvDhb9OTmemM+vnNnS9xjuwf6cX
 Zmai02eBny43gglBBkodevq94XWqrL2cXXzzCll4tvS30+iCSPR/MfjbrRu5M5Var196
 byQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679065062;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4UvHn4dN/o9rLUAqeygnrsSnWf1IH/tzbMZtwq+vZKk=;
 b=0q59YQfPeHaQlZsmmufpZErPAhVTq7x7FQzUjkz74bCiVlCsz5FkjuDn/u6aemqo+a
 /Lc5baao/cFSJwCGdAWrFrWNMAPV5iBCGCDKCMhDTOyBeJZNE8bAfmzbSQfGATOkBrhp
 VdWtpx/Jlb4DWpEJGhl1g6Yl2bJTLgxyAtikMYRgRgwulfyeANFRM7BWD87NaVGY/GmM
 t0O/b1WUYevxYD+S+FyNUrzubrVqVICASGgqr0Nc6IkbJDbMefzVNljUVHAmd4+Cyl5T
 l8Y+fHW+9wD/8rehYYALvRLSx/Xu4JSNe/F7UARguMqriLQJkpuyyo3x6aVLJx2kUA6K
 ZLBA==
X-Gm-Message-State: AO0yUKV3U+RL6k0hqPW6O35KbscNwBJP5sppoa0CRh3jNug0UNG+Kz4a
 3Ig6XubdHhN1ehzNyfcmJkYhGmQUM7ySju9N1VEjzQ==
X-Google-Smtp-Source: AK7set+AXvHMYncTUiNTp6NSv/3zgyhMSQb/mMa+xHpM88FILdoVBMJXazwztzNMITxo7lT9pCYvgihOpsYd17acvzA=
X-Received: by 2002:a17:903:2443:b0:19f:30be:ea09 with SMTP id
 l3-20020a170903244300b0019f30beea09mr3124592pls.9.1679065062474; Fri, 17 Mar
 2023 07:57:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230306021307.1879483-1-richard.henderson@linaro.org>
 <20230306021307.1879483-2-richard.henderson@linaro.org>
 <CAFEAcA81_bQMYK9w0LitTrBkp+ue33gUocUMZco_HG0AxgGeaw@mail.gmail.com>
 <004c0c81-958c-ba34-a743-6f2a4a4d133a@linaro.org>
 <CAFEAcA8M+1jSK4+gzA6rkoQQY579RuBpMDM9eQk=aN5gPhHNbw@mail.gmail.com>
 <CAFEAcA_dYmf-6kF58CvrcvL+NjpXYaau+_=vRJPuOXEuNYmEeA@mail.gmail.com>
 <2c4ad288-d805-c130-f1c7-0a42d1125d12@linaro.org>
In-Reply-To: <2c4ad288-d805-c130-f1c7-0a42d1125d12@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Mar 2023 14:57:31 +0000
Message-ID: <CAFEAcA_B6hWtrQr9WCm0J5iWWg7nQyYCGfhcYX8UM4wKGJ1FLA@mail.gmail.com>
Subject: Re: [PATCH 1/9] linux-user: Diagnose incorrect -R size
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 17 Mar 2023 at 14:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 3/7/23 02:17, Peter Maydell wrote:
> > It looks like we (inadvertently) broke "-R 0 means turn off"
> > in 2019 with commit dc18baaef36d95e5; prior to that the
> > 64-on-32 default was set by the initial value of the global
> > variable and could be overridden on the command line. After
> > that we ended up doing the default-value stuff after the
> > command line was parsed instead.
>
> (Not 64-on-32, but 32-on-64.)
>
> I don't understand how 32-on-64 would ever work without reserved_va.  The host kernel
> would otherwise place mmap blocks anywhere it chooses, which may not be within 4GB of any
> given guest_base.

I think most of the use cases weren't doing mmap of any
kind. The gcc test suite is one example of that.

-- PMM

