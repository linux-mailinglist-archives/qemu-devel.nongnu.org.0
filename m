Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB423529EB
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Apr 2021 12:51:12 +0200 (CEST)
Received: from localhost ([::1]:60602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lSHOR-0002ba-Bi
	for lists+qemu-devel@lfdr.de; Fri, 02 Apr 2021 06:51:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lSHMu-00027N-Sc
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 06:49:36 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:33456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lSHMt-0008HN-4S
 for qemu-devel@nongnu.org; Fri, 02 Apr 2021 06:49:36 -0400
Received: by mail-ej1-x634.google.com with SMTP id ap14so6968962ejc.0
 for <qemu-devel@nongnu.org>; Fri, 02 Apr 2021 03:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gT2MI5+wgFinhdimgdAUtMIKJJ0ROijOJTSacpdM+XE=;
 b=zFt2txhTG7r4zx9hwqW47PORw+RXs0NQrOVVeplT6rDtduG8zQV5JTEkL8VUSnBsO9
 zrtsTHmv4/83MgCXyNSdObbtgf7FN15hNEa6o1fKcL+M+BOJquJwfBTeBvAzZzjg4bem
 2+NEqEqFBUJPHRp5QjXiS7UE/KRuIYs5C63u/YsFaARQSwsivvUi047MTtO0Fof+c5xU
 yTMU2OYrUrGYZX3ogUZJzPnwHtk1mUEwlp83qWyQrZXkqImMvpsBMoHjdbogIcj+Q705
 x2V9yon/uztL49/T2sXglRyunYHm8ApExbN/7U3+fEorOM/6GwEJdkz2iKbJNGoJkBDL
 29TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gT2MI5+wgFinhdimgdAUtMIKJJ0ROijOJTSacpdM+XE=;
 b=lY5Vk+4iymwX9q1Hx15A0+Xll6iLSFlGi8jkQD9LV6hRHbHA3YcicTHrz4pl0RTPfE
 yE9Ga95h/tRF5cr9OUhSgC3yVpCyxNqfxfMiXrafGRhSTAKzKW+pJr3d4MQVwu40+ph5
 3IQcatTczZ8wkN3GuwF0i8EJqL02HpareMGUUYCIbYWmn+QRA6nDdINvldFp3ou6C6hS
 Pa7A+wpiOJ9F9+Eq963yC244PpKvcHl/0IrhNHaMd105W3UnaEb+ti8ybOIhMdXdMY2b
 UXHx5EBLVtBS5z7eEnM0fuPzSn1cAQxf6117SdV9ARL32EsnfIwy902g5anBkXvsW2sh
 bfig==
X-Gm-Message-State: AOAM530QDyuSpQcxcTLvv0OKmPkaHSIkK7hIkxj0roij5h5nGSqz6hI1
 g9TvnmSqamHEoL7ZdfDp6lv7M2ulj4uj+TODr4jXTA==
X-Google-Smtp-Source: ABdhPJyqE5c91hNViRBoDP2/I+J7A3Z7120mRWhonp4EIjA2AUHXcGPZGnn68J+lZLRVz03wSBkFGIPFQ+wel38EppA=
X-Received: by 2002:a17:906:16ca:: with SMTP id
 t10mr13748023ejd.85.1617360573417; 
 Fri, 02 Apr 2021 03:49:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAM0BWNCTD_oe3BgKQUqG41fgFqGCXVh1gaiMqJpvXbR4Fh5vHg@mail.gmail.com>
 <7c63e938-2482-3150-7cfb-1459c132fda6@redhat.com>
In-Reply-To: <7c63e938-2482-3150-7cfb-1459c132fda6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Apr 2021 10:48:59 +0000
Message-ID: <CAFEAcA95MnVMqt+BWN=TbNfkZDiHPqN2hNRNerAxM3TptfzP9g@mail.gmail.com>
Subject: Re: Bug: fstenv is wrongly implemented
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Richard Henderson <rth@twiddle.net>, Ziqiao Kong <ziqiaokong@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 2 Apr 2021 at 09:47, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 02/04/21 10:29, Ziqiao Kong wrote:
> >
> > According to git blame, this bug is introduced about 13 years ago:
> > https://github.com/qemu/qemu/blame/633decd71119a4293e5e53e6059026c517a8bef0/target-i386/fpu_helper.c#L997.
> >
> > We also had a patch for this bug:
> > https://github.com/unicorn-engine/unicorn/commit/59b09a71bfc6fd8b95357944f6be9aa54f424421
> > which you may refer to. I can also help draft a patch if necessary.
>
> Hi!
>
> Unfortunately the patch is incorrect, because fpu_update_ip is called
> only at translation time and not at run-time.  If more than one x87
> instruction is present in the same translation block, or if a
> translation block has been compiled after the one that is executing,
> env->fpip will be incorrect.

I think this is https://bugs.launchpad.net/qemu/+bug/661696 ?
That had a patch attached which got some on-list discussion
back in 2010:
https://lists.gnu.org/archive/html/qemu-devel/2010-11/msg02497.html
The review comments may be of help in coming up with an updated patch.

thanks
-- PMM

