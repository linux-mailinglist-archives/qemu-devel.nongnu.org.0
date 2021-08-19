Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A453F1665
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 11:38:51 +0200 (CEST)
Received: from localhost ([::1]:36852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGeVd-0005a2-MC
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 05:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGeUq-0004s5-0t
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:38:00 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:46784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGeUn-0004Iu-Vx
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 05:37:59 -0400
Received: by mail-ej1-x636.google.com with SMTP id gt38so11460053ejc.13
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 02:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QGPGursGDQe6IBt9u+dfbWxjE7jKP24ZUMRW1FppMgA=;
 b=FKD4VAi2b2jJ16tCdjZ7fJ2Q/PmnjwHfIcc5fHcZgv5aHb0AEgzBBRj4YUY2sbZYVK
 BwGEzW86Og8uMi4LEsewaC8UuGRxqIxy8RanP1S4S9JyQUJcBVAtwtJqwoK4IDxtiRiM
 fq4zvCodlM3Z5ByPIICjnvUBnYYzP5t/jYZtFxNHGXDBWQ3F+kiUNVPYpFsGu4jRf5LH
 ROEmPHqz9QR/J8ETvUvCOpoDfurwiPLU+MPlmTRe+BBo8QKDSXF/DFzjW4ORSBS9X0lP
 So6FajgF3nAA+Eeq9PxfCLZqcHi0yPUtx/WhygDTe+aLGQEL/7ie2NjRYdtPfaLOxqeT
 mmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QGPGursGDQe6IBt9u+dfbWxjE7jKP24ZUMRW1FppMgA=;
 b=qta7aH+tCQ3KtdD5+XjHtGB2Ll79/9hIhwS72sGrXkVZjoX8Xw04hJfOPJb/anFY5j
 1nWpyOzcnbLOVPayJdiXhiaG2sYKkvEEHvZZEc9S2J/s1a9tPPxzxEgygAH10Vv/i8/A
 RWaHhO6V8o9YCseU6K/iKJVVHOGznDvKV2q9RKkcZ+dIXNkkOKwUXzcH53MgMIgaepWS
 Eli6E7rTxAguI4QPcuCEPlWi8k9MDTzOYm+em0Xvl/goPf7hMWj0ncQ6pGXZ9n+NZUjg
 65LmsgdveMdQyPASJSa8Ncv2fG3MuplmZqsGYijoejAeSnnllEMojnKw74cpYszcyDvv
 LwfA==
X-Gm-Message-State: AOAM530jgeKgtpPHfCXFIBpWYqrVcAaW8+qwTLpha2TiuXCL/moOTwCN
 FpjkS40T3AA2FBK2yA5479VGPrwTvoYiOyNmxr6edQ==
X-Google-Smtp-Source: ABdhPJyeWphO1yf/Voe44IeCoN8kSbreOqNeGs3ih2SGGFw85h/K5BSxt20fBuE1y3Q8ywHgztT14GK+c18UYWLtepY=
X-Received: by 2002:a17:906:584:: with SMTP id 4mr15163747ejn.56.1629365876101; 
 Thu, 19 Aug 2021 02:37:56 -0700 (PDT)
MIME-Version: 1.0
References: <7ec1626e-3c4b-c9e8-1a29-f576163712f5@redhat.com>
 <YR4b9J7jlfrd84BK@redhat.com>
In-Reply-To: <YR4b9J7jlfrd84BK@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 10:37:09 +0100
Message-ID: <CAFEAcA-EQj6mxHcFJAnaMpC0yyCMvkrYG8iuTg7vxo-1-x-LEQ@mail.gmail.com>
Subject: Re: Is QEMU's vmxnet3 still being used?
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Jason Wang <jasowang@redhat.com>, Leonid Bloch <leonid@daynix.com>,
 Andrew Melnychenko <andrew@daynix.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 19 Aug 2021 at 09:54, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
> We've especially not had "how many users
> are there" as a criteria for acceptance or removal of a device.

...not least because we have no accurate way to determine
the answer to that question!

-- PMM

