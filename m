Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF8B3B2D72
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 13:14:24 +0200 (CEST)
Received: from localhost ([::1]:44954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwNJP-00070A-Io
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 07:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwN3B-0001V7-QB
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:57:37 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:39889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lwN35-0004N0-FH
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 06:57:35 -0400
Received: by mail-ed1-x530.google.com with SMTP id c7so7876416edn.6
 for <qemu-devel@nongnu.org>; Thu, 24 Jun 2021 03:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vbUIubVlmPmvCxmOLHKhhOAtFebQSPuhgWWlEFvnk8M=;
 b=FRkYmfY3gsdCxHxc/rmG6/mqOY2J/mHE+ZagjdtQ7X7w/8HWohKDmeda6TCcd89fVe
 rx57pCyuj6Cx6SSgyPCTlUuqOXsL1AhR8KQCWESeLPCs36RxvMxcY39hSDgczQA+Qo6d
 IwIwmym12jLOdtZTt/gPJnDRYVGdIWf9sEtAcqlaS9p8vRxWMskBfAMzqi/zLWH6tR0R
 vljYJL54mbBnQitJdBPa9oVzQJfo6/1oBkjrgKOxR0aKUD7UzXHJSQ5xfNm6GP2EQrFo
 bjO9AlundQzeVUB3tP7gZ/HCoZxOim5959li/1tur5TO40R9Q9eLw1ah75I16tPIkDoE
 j3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vbUIubVlmPmvCxmOLHKhhOAtFebQSPuhgWWlEFvnk8M=;
 b=XnL54kwhjgEsvl0bqTBcsPpA5cJbecNZi7TKHoKjN/tYh/TvzMAiS6ZeiIcWyEuBAy
 F+gT0acDzrKFzdZQthkBmyn59AZEKEKmL8YsvfhdkknZHTXRWL5RLHi6Jhb1u2ftI4tf
 iOOvt1EjhP3lDkVty1CHbltXwTOAIthF0Ajg4yoTBQesZ87VkGFUVt0ffKaUX1f+XJSa
 phAdm+EkDhytlhcnLZbf36HB8SPhdY1qWf/vSSzmBWrPpCNxD54oTcxwTWziFB5bvMas
 HwSTAWWEpszbA8HdBCr5/l5g7ZPt6a3LPN5p+Ew0o+WBWTFnCd695Od9ntjE2u3qbuSS
 wjTQ==
X-Gm-Message-State: AOAM532kxcdQ5wYTp0EwZldWmo6Wn/o1voMrrCw6uc0R1yjkkMccgE0q
 haeY8VwW9rWsMywzAa6U9uZn+W+4sBqnrAdxYu4YgA==
X-Google-Smtp-Source: ABdhPJxf/HaWhE0hFezGA25FABYXjnLvpp37EuubS3szimhRX4Qg14/JpX2y/x2NypzJ60goXbm6WJbEh8GZ/a4oCbU=
X-Received: by 2002:a05:6402:5204:: with SMTP id
 s4mr6247340edd.52.1624532248030; 
 Thu, 24 Jun 2021 03:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210623180021.898286-1-f4bug@amsat.org>
 <20210623180021.898286-10-f4bug@amsat.org>
 <CAGnHSE=CoXHKXeM+-PTv-EADcxisuqU3f91W1mCC0GTZO3UOuw@mail.gmail.com>
In-Reply-To: <CAGnHSE=CoXHKXeM+-PTv-EADcxisuqU3f91W1mCC0GTZO3UOuw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Jun 2021 11:56:51 +0100
Message-ID: <CAFEAcA-x-ZWKM0wEHm0-iqLydtyuFCm2ba+j6RGNwLyB0UEtTw@mail.gmail.com>
Subject: Re: [RFC PATCH 9/9] hw/sd: Allow card size not power of 2 again
To: Tom Yan <tom.ty89@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 24 Jun 2021 at 11:27, Tom Yan <tom.ty89@gmail.com> wrote:
> I really think we should get (/ have gotten) things clear first. What
> exactly is the bug we have been talking about here? I mean like, where
> does it occur and what's the nature of it.
>
> 1. Is it specific to a certain type / model of backend / physical
> storage device that will be made use of by qemu for the emulated
> storage? (I presume not since you mention about image, unless you
> irrationally related/bound the emulated storage type and the physical
> storage type together.)
>
> 2. Does it have anything to do with a certain flaw in qemu itself?
> Like the code that does read/write operation is flawed that it cannot
> be handled by a certain *proper* backend device?
>
> 3. Or is it actually a bug in a certain driver / firmware blob that
> will be used by an *emulated* device in the guest? In that case, can
> we emulate another model so that it won't be using the problematic
> driver / firmware?

Definitely agreed -- before we start changing QEMU code we need
to identify clearly (a) what the real hardware does and (b) what
the situation was we were originally trying to fix.

thanks
-- PMM

