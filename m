Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413326F5827
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 14:48:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puBtU-0004cl-GH; Wed, 03 May 2023 08:47:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puBtS-0004WT-Px
 for qemu-devel@nongnu.org; Wed, 03 May 2023 08:47:38 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puBtR-0007ag-1I
 for qemu-devel@nongnu.org; Wed, 03 May 2023 08:47:38 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50be0d835aaso2029741a12.3
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 05:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683118055; x=1685710055;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sgYCU8N40t4ncqCWtyM8xykWC1uWfh647FxVwDJKDFg=;
 b=d6ymqQQPmN+jutGbkFXDZzbLE06BcQL8hMWmNqmJIiTwX1+ROHmAkvCcZk4Lwn7C+k
 WhAgB4NO0wwfgWp/ulQPwMCzSKTdWpg/c6sNYWfUS6Od63+tLSXHbG0qjasVMnZsPnrx
 6rPBeACWvbqWJ99YMQMTCSUvRJ4DLI+pXaNmemK0rpqHchcULaG7/Os3NS8TnY7gQbyk
 yHIudDox75BzXY28gXSSWiaisWJlJlmwhOFwEpKZy0GSuMPbd8UDAZdSG//NH8gkk0AL
 E7aci5rLc1xWhnDUNHH/mYil5E6RvLH+FJJdks5o9Ys2f+IFsYXlUCHPZv7h9uhCcJbG
 fbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683118055; x=1685710055;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sgYCU8N40t4ncqCWtyM8xykWC1uWfh647FxVwDJKDFg=;
 b=DXdpo+5V2xaF7bfEq140wvG0mc653m0jd0x6fhD0iAtvC8R1pmsRzEv6o6HpA3r5FF
 cJS5opNj8CAir56YfspPbqi+Ou0bb/IDqBsYqJ+y2AmgxY/+3gzdbzSd0E09N3c0fLAB
 Kg+8oDIRrt7W1rMAeQLydfsMMcZIVk/M9WPOz6z719sswj9743mVqwzxam0vUqFfMQij
 /m6iRxS1g39aWoFh2cU4dHR7KWu6YTZgwFSuUA11JOD74AmAi+k6X/t7+DAY1oD8BN6h
 uJ/BLbp90L7E4OqbyAnlskIsjn7iuJlcVbhgIYKoysuyG0q77TB++Ox8vQLDs9s5GdLS
 j/nQ==
X-Gm-Message-State: AC+VfDycphIwQw2YqMi18CAw9Z5EIep5mVd2i5p1Sq7aEr5bqU4Iem40
 ImwQn869wH4n1llkWPPvEh6leD13E4C69fQHiFe1Ew==
X-Google-Smtp-Source: ACHHUZ4tV6A+lt6vq8LJVRO4hXD57v4RofIaDVtmZgKDmW/pcQe3tFBh2N38VYJ0eFiW5DpCe+Z+7ixsXhy9H4m7r6Q=
X-Received: by 2002:aa7:cd18:0:b0:50b:d5d1:7409 with SMTP id
 b24-20020aa7cd18000000b0050bd5d17409mr3640362edw.23.1683118054722; Wed, 03
 May 2023 05:47:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230502135548.2451309-1-peter.maydell@linaro.org>
 <d85ba066-2d0d-fcb2-d5ca-3be6d884d7b7@eik.bme.hu>
In-Reply-To: <d85ba066-2d0d-fcb2-d5ca-3be6d884d7b7@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 3 May 2023 13:47:20 +0100
Message-ID: <CAFEAcA8i2cJQt0CTxHu=+og0bxaNhtRS7Y4vgLyVRpBc=5G5Fg@mail.gmail.com>
Subject: Re: [PATCH] ui: Fix pixel colour channel order for PNG screenshots
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Kshitij Suri <kshitij.suri@nutanix.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, 2 May 2023 at 21:36, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Tue, 2 May 2023, Peter Maydell wrote:
> > When we take a PNG screenshot the ordering of the colour channels in
> > the data is not correct, resulting in the image having weird
> > colouring compared to the actual display.  (Specifically, on a
> > little-endian host the blue and red channels are swapped; on
> > big-endian everything is wrong.)
> >
> > This happens because the pixman idea of the pixel data and the libpng
> > idea differ.  PIXMAN_a9r8g8b8 defines that pixels are 32-bit values,
>
> Typo: should be PIXMAN_a8r8g8b8 not a9

Thanks -- I super-carefully proof-read that to make sure I'd got
the a r g and b in the right order and completely missed the 8 vs 9 :-)

-- PMM

