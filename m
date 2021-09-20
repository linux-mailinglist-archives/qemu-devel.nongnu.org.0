Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D884110B3
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Sep 2021 10:12:16 +0200 (CEST)
Received: from localhost ([::1]:45492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSEPP-0006wZ-8L
	for lists+qemu-devel@lfdr.de; Mon, 20 Sep 2021 04:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSEMc-00047Y-3d
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:09:25 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:41484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSEMZ-0003TP-DG
 for qemu-devel@nongnu.org; Mon, 20 Sep 2021 04:09:21 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso11450962wme.0
 for <qemu-devel@nongnu.org>; Mon, 20 Sep 2021 01:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MwL26vWl3OAaRgZqZOW0R5klQYh5OSn41PozyiW7hrA=;
 b=OAX/+bhac12turgPAwm8i2HVbV+pbuzK/t2lwfW9dAAC9jtCEWxci5XlfqnS//2pHp
 lfgioyMuOy8rPLyGcDpiWDOJKjQ5Zhg+UrZPIOD0dRjPR8K9YBX42UCzSAh09ymRjjkk
 Sd+M96BuyLigRCNOypNMuhJQMp9+0WujYiWElTIXihXMwMRe1KadTbaAt5JrOUj14v7c
 +4TOdRzY1kAZYF26AX7EBBDJE0w4w+kmdvACS8pZrXZM03Fpwl924muZuc0dWeVmv5hj
 QB+wOKeAvJlEwiqvnYTdYfglnj9f0Gcug+TDpuTukwDwWlg121oquXSChnhsgn6CR2rM
 xbZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MwL26vWl3OAaRgZqZOW0R5klQYh5OSn41PozyiW7hrA=;
 b=se+af8BnVF/XAYOkLwoYk9kLkLVmxg11LYLTtzoNPp7OKtl8SFjub311p07t6s51ct
 NLmrAbdL4OD87WVrJsJGxGvCQd5aC8IqrYSoex2iRxHJuAILPJ4nIJGSRRHy6j4pYdrH
 l1maL3eUQOMwddbVmsvBkhATuJTH5N1j+m51zLWFfHSm5BCPbeln4y2Eu0eyBQVZF0yj
 koXhPP/JWoUXjFsu6/CBQh0cQ5SVOO7ONGzajkoOjtfDBLtNfnjY3JtPzZg/qc0qzpZN
 0nsZZSktu5F3RytmcbZO2K8/ejcLUzkgo7db5VVUdVA9IyU2pvwhGW0scxPL1fyRmwHM
 hX8g==
X-Gm-Message-State: AOAM5302Fs2pyJbjvJ4wz0foxzX3fGQg2CZ3QPtCDuGl/HvrKGJSAsnD
 JDS0bqVnZMKLsghqm6xSEm0Kngttmr9ArkO5Ww356Q==
X-Google-Smtp-Source: ABdhPJybjg8Vyyt9lixWur9Du2nmGAGFFe+WYVRgNotNip+0SP9vs9eGWGaleimKQnS/Z3gcUL4NiS25VF67MIH8pKs=
X-Received: by 2002:a05:600c:4848:: with SMTP id
 j8mr28007237wmo.21.1632125357689; 
 Mon, 20 Sep 2021 01:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210821195958.41312-1-richard.henderson@linaro.org>
 <20210821195958.41312-6-richard.henderson@linaro.org>
 <CAFEAcA9Eg1gPuNR1DKPB8Yk1VJ=xADTEDim=jrwFN6mhVdV=Nw@mail.gmail.com>
 <af2e92e3-ef2d-50a8-bec4-6c1191f3ac27@linaro.org>
In-Reply-To: <af2e92e3-ef2d-50a8-bec4-6c1191f3ac27@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Sep 2021 09:08:25 +0100
Message-ID: <CAFEAcA8woYVpeKrUrqHBVu2mg25x7e8oh3kh1-1DukfOrLv_PQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] target/arm: Take an exception if PC is misaligned
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Sept 2021 at 02:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 8/26/21 6:45 AM, Peter Maydell wrote:
> > I don't think you should need to special case AArch64 vs AArch32 like this;
> > you can do
> >     env->exception.vaddress = pc;
> >     env->exception.fsr = the_fsr;
> >     raise_exception(env, EXCP_PREFETCH_ABORT, syn_pcalignment(), target_el);
> >
> > for both. AArch64/AArch32-Hyp exception entry will ignore exception.fsr,
> > and AArch32-not-Hyp entry will ignore exception.syndrome.
>
> Not true.  The latter case still requires syndrome with EC_INSNABORT, etc.

For AArch32-not-Hyp ? Syndrome doesn't matter at all in that case
(only Hyp mode and AArch64 have syndrome registers); it just needs
to take the prefetch abort exception, which you get by using
EXCP_PREFETCH_ABORT.

-- PMM

