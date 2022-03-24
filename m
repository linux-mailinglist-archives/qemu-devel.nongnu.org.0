Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E744E5D71
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Mar 2022 04:11:39 +0100 (CET)
Received: from localhost ([::1]:51588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXDsw-0005Ki-Hq
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 23:11:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nXDre-0004YS-TL
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 23:10:18 -0400
Received: from [2607:f8b0:4864:20::112a] (port=35381
 helo=mail-yw1-x112a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1nXDrd-0004Hq-CG
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 23:10:18 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2d07ae0b1c0so38151437b3.2
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 20:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iQZm9K9yJpGKJ0AS8Ixo1ACzQs/GYP8RmUiPpn/2Ffs=;
 b=Do6c3eEosMj2JjNHrPeJQ/NgxUyxExIy6F4YB3PLNfUcCRbunskXvlDsLh1LAzMxuw
 0wUoEDhWE4BUxQhWK/DlOmPC3bJqW9XC2U/UC8XHKqLah9oHrGzlYeodOngC6/xCEmii
 CO2PTYOk7BAny6+OtpsFOBHIuRVnd25Tz7YqR7BRhAMoYUHdDM0w4Mi74cHxTjg9lRz0
 EB/FAUCeQOGQmk55/vsd7HjlnVi2Q+oeS8fpYCJt4gyMfSJQme3KBgp+WNNxQkBjnSKt
 kk+8s3PPQv6O2hYLRXgQiUXsWpzP5ZpWE23WAsEZ24TXg2rU9+DpMxhMA8Yl+obu819x
 fw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iQZm9K9yJpGKJ0AS8Ixo1ACzQs/GYP8RmUiPpn/2Ffs=;
 b=uTsC6a5XXXV2XmOpFln3Rthqc0moX6wJ3KjuchRrGTxDHb5LtatG0a3Ls/LnrxWWIR
 Ii5nnkw2GfgDEosuiYEZ8KaA0cul6pBQLGjR+w3WmOVM9MqvMAo66UgEPPU1M8WIVdF3
 fxbKfIQOwHZLQkhs8/I1e2tfa+3r5W03aDu3N+1Ify+s97CXU9YmaZEg03crDuQNw1z0
 dspIyEOqr2++C1vPWa0f5FhfNQM5DYULMTdYnn7BUI5jTRFMo/lazwuN87KJc7mS++ma
 tEDhZWR7CC1nPRyFUc2CP3pswFX/svd7syZFrlrsxxZNJPCezy7Wr6R/zyKZDsWlUP3o
 MRnQ==
X-Gm-Message-State: AOAM532lw8G7gp6hwoXKSlloTVepAcxLeqzK3aMKD5nBi/8EiV/IDWiA
 Q89A++UYXl/sOwaXsiObgJ90hPjIbFNyKi9ig3c=
X-Google-Smtp-Source: ABdhPJzT1jONuxSOapXcu11kZS6zL8S+PJDyD5UHAyst74cPQjz5OeekE+VXCCLWI3KRSkBPZmQcd22bZNvc2mN+crs=
X-Received: by 2002:a81:8343:0:b0:2e5:b43c:86eb with SMTP id
 t64-20020a818343000000b002e5b43c86ebmr2891032ywf.153.1648091416188; Wed, 23
 Mar 2022 20:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220322154213.86475-1-bmeng.cn@gmail.com>
 <CAFEAcA8RdqQ5fzoZtb5SaYe41FA=oKo21veergqhMgo=eFmB6Q@mail.gmail.com>
In-Reply-To: <CAFEAcA8RdqQ5fzoZtb5SaYe41FA=oKo21veergqhMgo=eFmB6Q@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 24 Mar 2022 11:10:04 +0800
Message-ID: <CAEUhbmVXiB+mbbjhy0sT2PhQHNJgdHmehXfcE18g=E3SPffndQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gdbstub: Set current_cpu for memory read write
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 22, 2022 at 11:56 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 22 Mar 2022 at 15:43, Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > When accessing the per-CPU register bank of some devices (e.g.: GIC)
> > from the GDB stub context, a segfault occurs. This is due to current_cpu
> > is not set, as the contect is not a guest CPU.
> >
> > Let's set current_cpu before doing the acutal memory read write.
> >
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/124
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> > ---
>
> This works, but I worry a bit that it might have unexpected
> side effects, and setting globals (even if thread-local) to
> cause side-effects elsewhere isn't ideal...
>

The functions modified are local to the gdbstub or monitor thread, so
modifying the thread-local variable should have no side-effects.

Regards,
Bin

