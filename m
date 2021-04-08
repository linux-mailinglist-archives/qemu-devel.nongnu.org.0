Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEB03589F1
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 18:42:51 +0200 (CEST)
Received: from localhost ([::1]:52696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUXk2-0003K1-Px
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 12:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lUXiS-0001cp-Rt
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:41:13 -0400
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:46053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hsp.cat7@gmail.com>)
 id 1lUXiR-0006ap-5g
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 12:41:12 -0400
Received: by mail-oi1-x231.google.com with SMTP id d12so2775651oiw.12
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 09:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oorlvMH2ipqKkpkC4AVpSh4uJmQmYsEIDxsPy8I3OfI=;
 b=HsZTuYGJnQgCaTs3YO0fvzcpFK6wL1dLcwogdgliSwMLKj67Fc5iHeQFEvPOpZAzuC
 TgdI+kmcdW2avKOuNjJ1d+PDyTNhB20IuZwLrPYgAby7Of+iUxIc6U6xHZn2MwLQoXHE
 y/DDU0CXMqEDn+jl+U42Irtka4I7Fz6bRlNiv3TnPwg5su+poVM58cSJV8BCKkJwkq4Q
 S1QkbgqHhG+OBZNw60vHNSbeVmvohMduyUxqMDnh2Mx1zImukkIZ5/+BtIhB66TgYDNG
 qrerUcKFiMEWqzDSkB2hd0qngA9iC+yG2uonSk7u0lYQsxgmmhpqSMfV3ry87ysvWIlN
 gY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oorlvMH2ipqKkpkC4AVpSh4uJmQmYsEIDxsPy8I3OfI=;
 b=MydcGf6xGuqVF8JJxw0hgxNvBUvhJ/JrFxjmnXJ7qPWwOZ68YJBRKw9krKtolW9c7u
 lDO4JTR5cmn8yH6OrpmKApV+HRSxz875BtepacWeoffNZ4z206Pu5DtbSf6vaVpX8ynB
 IF3gDCELPWdq9mzeC+MRLUufUGvq1gQe6zwShnqlm1OJVtPIqWFztuRT4vMnxEXGl/rL
 oej2mwPIsXj22lk0gUdMA8rFOSK6BcKoqXQb1pnhpsVd54V7PQJiZDCU2NyhETzN8/2Y
 lOdwA0wXSvkElFwo76XcWLavS3t0xPSCRN+7+XUkzCkXJoF2RYMbjFwhtg0gI0M5DP/i
 BRXw==
X-Gm-Message-State: AOAM531CtVRH4wuevXJZnFYwwhuwcFwaYLbEJX0X0LCCRf6DJFV77rRn
 GeL3eH6+iBfw/52+/9L7W2rGK/ZNO5bDc14M5IM=
X-Google-Smtp-Source: ABdhPJxYYcXzSwsAkSuooEl8oBpBaj8eD67kskaFKXuJr4FaWH6MK5N9Cwz4hlqkII9qpfmcs76ysdTFfk+KK/mbmi0=
X-Received: by 2002:aca:5d82:: with SMTP id r124mr6812877oib.59.1617900069059; 
 Thu, 08 Apr 2021 09:41:09 -0700 (PDT)
MIME-Version: 1.0
References: <E1BE68CE-DC60-4FC1-B42D-B38B923FB19E@gmail.com>
 <CABLmASGQHzmYnefJ4uDrbNQ-zRwzyWDTXPVRL_qtpM1GOsM0eQ@mail.gmail.com>
 <967C172F-B708-40A2-862E-9948F0844133@gmail.com>
 <ace05be8-a256-788f-b896-45398d752d3@eik.bme.hu>
 <BABF7369-A0AB-4CD4-A46D-19BF1BD04AF8@gmail.com>
 <725920c9-c990-d35a-4958-4df0c45c62@eik.bme.hu>
 <0429B873-DD42-4769-BCDF-25A7720D9C44@gmail.com>
 <20210408110523.eh3i7djynv54cqi2@sirius.home.kraxel.org>
In-Reply-To: <20210408110523.eh3i7djynv54cqi2@sirius.home.kraxel.org>
From: Howard Spoelstra <hsp.cat7@gmail.com>
Date: Thu, 8 Apr 2021 18:40:58 +0200
Message-ID: <CABLmASFLSZBapgZCNQuvDd4hvpVe4SSdY7ar+VH0w_ZjquoUKQ@mail.gmail.com>
Subject: Re: Mac OS real USB device support issue
To: Gerd Hoffmann <gerd@kraxel.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=hsp.cat7@gmail.com; helo=mail-oi1-x231.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Programmingkid <programmingkidx@gmail.com>,
 QEMU devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 8, 2021 at 1:05 PM Gerd Hoffmann <gerd@kraxel.org> wrote:
>
>   Hi,
>
> > > Those might be a good place to start. IOKit provides the drivers and
> > > also the io registry which is probably where you can get if a driver
> > > is bound to a device and which one is it. How to dissociate the
> > > driver from the device though I don't know.
>
> > https://developer.apple.com/library/archive/documentation/DeviceDrivers/Conceptual/IOKitFundamentals/DeviceRemoval/DeviceRemoval.html
>
> > According to this article a driver has a stop() and detach() method
> > that is called by the IOKit to remove a device. I'm thinking QEMU can
> > be the one that calls these methods for a certain device.
>
> libusb should do that.  Interfaces exist already (see
> libusb_detach_kernel_driver & friends) because we have the very same
> problem on linux.
>
> take care,
>   Gerd
>

As far as I understand the patches here
https://github.com/libusb/libusb/issues/906 they are internal to
libusb, so we would need to build a libusb for use with e.g., brew to
build a macOS executable. Or wait for them to be finalised to get
included in libusb and then included in brew and then ....

Best,
Howard

