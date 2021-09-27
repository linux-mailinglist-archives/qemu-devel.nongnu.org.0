Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E16419EAB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 20:53:16 +0200 (CEST)
Received: from localhost ([::1]:42852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUvkY-00044w-MB
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 14:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUvim-00035p-PX
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 14:51:24 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:33605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mUvik-0001NG-GX
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 14:51:24 -0400
Received: by mail-wr1-x431.google.com with SMTP id t18so53694293wrb.0
 for <qemu-devel@nongnu.org>; Mon, 27 Sep 2021 11:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+DJfSpfE9Eik9XuI5yGawPjkBHRCHJHFBW5lrVg6/qA=;
 b=LJCLqPCJsxEu9Nja6FOq6uu4Hftyt2ld2WzzXBThTGgcSSb5W00kB//XWgYfFsLha/
 L3vjSFyvOojF3wQcFg7mQsAVD+gae+alRxotnJQ+wj2YNNCrV7NppaUJiisK5/D+b8nU
 AL0lXovbFmsUvFCF6zEhA/xtEZiuyQ97kAtJousvd0hKeSPO0iLzKuilBlAABVufJd8l
 SJiOuZ3lgNJmiuVlngOYMQJALyt+JKGJdXVN6GJQya5W81S5CvXu2zHgKGbqyqv4mGQW
 o512QmvTgfidwnqLPgc2P4t63JUBOKCGU7OOgnOZN1pJVJPZhulYKkfbxtV9ij7qkoN9
 Amrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+DJfSpfE9Eik9XuI5yGawPjkBHRCHJHFBW5lrVg6/qA=;
 b=tNziMv8EUmwNzChIDuPzUl13R/+NY6tPaoJamK5SmZDoENyfLeP4uErO3vmZUIyWay
 liJG2tnU7ARb78Fk8Q26zg+vbQhX9yZbog8K+Je9DuzmYlh+nWOnHdvQDE234MnZ4K6Q
 D9PhHCmZol40d0QaEj//JFraW+VgFD0Nh+uQpOnD+30XAIaGN3n6Gc2Y+SRVsFbav3GZ
 ZPW8yOW66GSLtaJhjsGgJzL/pNOGSPAPUlSihRRPTLOYGc3MlOnpTSYMq3wmGSKhmYX5
 hscZyXQQohmPv5Vn66PESdsVUrsTb/oZOjz40FDbEdPDv8j1BGMGiaHn32YoAZNvCr3V
 K7jA==
X-Gm-Message-State: AOAM531RFh/VPPgQd4dnmdtLeunEHmuOUFASv3Wq69XqMiOaP0iMWTHr
 dsdeiuheg3uktZ6WJt6wjf7MNAXrg6jyvElZYjeCGQ==
X-Google-Smtp-Source: ABdhPJzlqeLHEvcv3CIAaa14np6H8/AfaesZ8QxzV8FsvNA0y6iDK/PMutrSBGZ3J4mbUw8++XjJTDS8o0xsKX4lya8=
X-Received: by 2002:adf:eac5:: with SMTP id o5mr1655011wrn.275.1632768679570; 
 Mon, 27 Sep 2021 11:51:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210921093227.18592-1-kevin.townsend@linaro.org>
 <CAFEAcA8gY5q=qtaR8brf+JfHNh=Xt2EzMvGv8g94AFRNm+Q=RA@mail.gmail.com>
 <CAFPHj6OXYgerTxDhXyxxWnb4CS33N-+2RVntKauD+rBPqUMvqg@mail.gmail.com>
In-Reply-To: <CAFPHj6OXYgerTxDhXyxxWnb4CS33N-+2RVntKauD+rBPqUMvqg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Sep 2021 19:50:26 +0100
Message-ID: <CAFEAcA_wHS4hw_B=oh1GN9dJdTSb6gWeadCssYiCb5vyogP7+Q@mail.gmail.com>
Subject: Re: [PATCH v3] hw/sensor: Add lsm303dlhc magnetometer device
To: Kevin Townsend <kevin.townsend@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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

On Mon, 27 Sept 2021 at 18:47, Kevin Townsend <kevin.townsend@linaro.org> wrote:
>
> Hi Peter,
>
> Thanks for the updated review.
>
> On Mon, 27 Sept 2021 at 18:39, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> I thought we'd agreed to implement the whole of the auto-increment
>> logic, not just for specific registers ?
>
>
> The problem I have here is ... how many bytes are we willing to buffer? There's no
> reason I can't request 512 registers, for example. Should we limit the buffer length
> to a single 'full' set of register values?

I think the underlying reason this seems awkward is the way this
i2c device has been implemented as "at START_RECV create the whole
buffer that we're going to read, and then for every call to
the recv callback, read out one byte from that buffer". That's how
the other hw/sensor/ i2c devices seem to have been written,
and it's kinda OK if the device doesn't support reading more
than one register at once, but it's a bit awkward if they can
handle multiple-register big reads. (Also, I suspect a lot of
those other sensors just copied the code structure from the
original tmp105 implementation -- which is now 13 years old --
and maybe even for those devices it's not the best approach.)

Anyway you don't have to write it that way: you can have the action
at START_RECV be "capture the sensor readings" (AIUI this is what
the h/w does, and it sets the LOCK bit here), and then the
action on the recv callback is "return the right byte for the
current address-pointer value, which might be a register value
or might be the captured sensor data, and auto-increment the
address-pointer".

(It's not entirely clear to me from the datasheet when exactly
the device captures and locks mag and temperature readings, and
when it then lets go of that locked data and lets you read
a fresh set, but https://electronics.stackexchange.com/a/265561
is a random person with some info suggesting that the values
read are locked for the duration of the read transaction and
not re-captured. If that's so then "capture once at START_RECV"
would DTRT. The event for "end of transaction" is I2C_FINISH,
if we need/want to do something at that point.)

-- PMM

