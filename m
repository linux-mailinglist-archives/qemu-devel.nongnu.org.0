Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C9730AD28
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 17:55:16 +0100 (CET)
Received: from localhost ([::1]:43944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6cTr-000280-Ee
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 11:55:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6cS2-0001O1-JC
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:53:22 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:43414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6cRw-00048B-6O
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 11:53:22 -0500
Received: by mail-ed1-x536.google.com with SMTP id n6so19631669edt.10
 for <qemu-devel@nongnu.org>; Mon, 01 Feb 2021 08:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5dK3IppDYUTeCqJ7X4E4/tzn+Z/UWWDk86PosBNrxqY=;
 b=oJP5EUmKy0cy/z7MAvgpUIG0+SrogH/ZoFtZ1NnL/nWJIIXUQWXvVD5+8XI5HXfnRc
 kK+leCzaO3rvyeSC9k6JNp4BJUrhzPKNUUUFPSOiZimclik/GtVedry1F7eu/d6glT9J
 kYiwdtEySWKQlO6VVR5J+X6LTURLe2T1N8bPAJSAZnr6y9uznAKxT9GPZA3dviw0Im5Z
 +uCg2FCjAwpjsQ1+rjwQ12O/8bZ5n+b1rgIC0vSjwa5s51+I67rne+TQJ7IIPwjOpJUw
 8lPaZD8iixJGVoYO3puk5/67aToAL3cOQ8TXO0WUZWe7osohowBR19nMrSjg7Udq0Ech
 5KFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5dK3IppDYUTeCqJ7X4E4/tzn+Z/UWWDk86PosBNrxqY=;
 b=JwVb1WvW1ezRMe0yti37T7Mq68lN15jnZarBBQEYtzChtfeByBzNKS/jOtqJxzfCOM
 yHYvrUMd3rPh0ud49HIIhSuLVoIYeL/3HRYOQxENDWCKpyz9NK95B5DonXAQly2dBe0F
 Pc1a5EIbSF5BXifw9J5jSoieYI2RA6/xxHm4zIT1+3r7JYPeyrYA2by+/RzFFBNYCUDo
 fXdjfxgI7ShHnDCKPU8cpcDH8WKDq1rREiGZhudYCVywdliaKnknmAyOw71yMJRZAB3G
 UAbs6nK9/CWFRvngDR+thZHCmZTiZ5QZ7Ifr3qgeODwyJxleXcYH/F187cm4elmo1Ma2
 xhTA==
X-Gm-Message-State: AOAM531Zbvu3fhOZqygDRepSgb2te+qKha22he1Cyeiqff+cr+YxdHQQ
 0vwOVNe5HcnwGsBcJWuFhkBgg0uHt4IlZSPF9Mslgw==
X-Google-Smtp-Source: ABdhPJwvaGTzat7KdyocRnDonas4UwoG/KXpSl69s0EiqiNXIpn3l4qj6oeIOyKjqZwkYw4MQFJiImyekHCG/O9ozsM=
X-Received: by 2002:a05:6402:31ac:: with SMTP id
 dj12mr19443054edb.44.1612198394462; 
 Mon, 01 Feb 2021 08:53:14 -0800 (PST)
MIME-Version: 1.0
References: <20210201153606.4158076-1-berrange@redhat.com>
 <20210201153606.4158076-2-berrange@redhat.com>
In-Reply-To: <20210201153606.4158076-2-berrange@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Feb 2021 16:53:03 +0000
Message-ID: <CAFEAcA-yzX1ZSPayvy9u8GUbXpgLgQNA7=52qSnDMjakSU0B-Q@mail.gmail.com>
Subject: Re: [PATCH RFC 1/4] docs: add a table showing x86-64 ABI
 compatibility levels
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Cc: Florian Weimer <fweimer@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Feb 2021 at 15:39, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:
>
> It is useful to know which CPUs satisfy each x86-64 ABI
> compatibility level, when dealing with guest OS that require
> something newer than the baseline ABI.
>
> These ABI levels are defined in:
>
>   https://gitlab.com/x86-psABIs/x86-64-ABI/
>
> and supported by GCC, CLang, GLibC and more.
>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> +ABI compatibility levels for CPU models
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +The x86_64 architecture has a number of `ABI compatibility levels`_
> +defined. Traditionally most operating systems and toolchains would
> +only target the original baseline ABI. It is expected that in
> +future OS and toolchains are likely to target newer ABIs. The
> +following table illustrates which ABI compatibility levels can be
> +satisfied by the QEMU CPU models
> +
> +.. _ABI compatibility levels: https://gitlab.com/x86-psABIs/x86-64-ABI/
> +
> +.. csv-table:: x86-64 ABI compatibility levels
> +   :file: cpu-models-x86-abi.csv
> +   :widths: 40,15,15,15,15
> +   :header-rows: 1

Apart from the QEMU/KVM specific CPU models, why is this something
we should be documenting rather than, say, the people specifying
what the ABI compatiblity levels are ?

thanks
-- PMM

