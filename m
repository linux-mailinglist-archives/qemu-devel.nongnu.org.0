Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B0B3C3FD4
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 00:56:41 +0200 (CEST)
Received: from localhost ([::1]:36922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2iNM-0006FC-9N
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 18:56:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1m2iMH-0005TR-0A
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 18:55:33 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:34317)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <coiby.xu@gmail.com>)
 id 1m2iMF-0006Rg-47
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 18:55:32 -0400
Received: by mail-pf1-x435.google.com with SMTP id o201so9519524pfd.1
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 15:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=0gKNHr+FU/7Il/jUWC8RbFUBUFEGfTS6veAeWRUe1t8=;
 b=pC+QTC8PtvapgV7OGvPjaIK8nRXYsTeyQDWw5zhjXnZsGkeoAIpFxqffJDW43w197a
 N2nvZELFLu6RAUU6EeGCnTQ+u8F1L60XCEPxyEV+IMQtr0Vu0e5FH/TNqxZbKmsHtswf
 pTpA3C0DzZ3v3/9tCf0mrTVLsMfzl+/HOB4cUnsH4b8hbTtr0a/CSxe1tcZSeCASlnmq
 i3z4oY4SHPum4dOqLMP7Hxo5C4i120bKyzQqsIT7TdTnDNhM0GSmPNF9XLsUloTQd4cB
 dIh2s3MK3Sk+kMLKHFXwI0vmYC9TI7265KUl2a7D1FcO83xHPvmQbgJ1gRX9gQxjXEQt
 1Nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0gKNHr+FU/7Il/jUWC8RbFUBUFEGfTS6veAeWRUe1t8=;
 b=np/BTzlDLYTMx9RnMsxBOvI5mLIrHZmGoCDBQqXa1MSeGCHYobD7Vx9j7FOYIbqHwn
 g2dNBpJfntDycWM7HO1VwgoNMBUG3BUwtB7cWOIrDSeea8kjElftOMjvzIXq+7sAIYKj
 nCxx/L7o9zMHTSNYAia5haEfCi/cKfOx4v3T1qY4PyUlTL3FmIwgC/NqOnF9O7TF8318
 LkOUz/kpyatLNmTCs9BU0BfT08QpCFvSxE+cX039zghGyklJBf594StJxNsHgb7tIQu4
 PTdFiHYcjUV2qm7UfYxOWvVAS2oRZXEv7cdvcm8RvnK9zf6QsrgaVRQ99z4nHdE4nM9L
 eJBw==
X-Gm-Message-State: AOAM532UFH6xZBTWnljPewFQt89YR7IDzwp7RvmWe3GdyY7wXg7bua84
 PHWmGCqKlCmi4kdFlXIyYLY=
X-Google-Smtp-Source: ABdhPJyPIUnuW9gpy7jbw/sP1RqTZMIh10S4Ro9vvzcN/7OYC2IxaJmUKH6x911ONk2eIwjnyv/GQQ==
X-Received: by 2002:a62:154e:0:b029:32b:743f:dccb with SMTP id
 75-20020a62154e0000b029032b743fdccbmr3807122pfv.57.1626044129647; 
 Sun, 11 Jul 2021 15:55:29 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id 72sm210994pgd.10.2021.07.11.15.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 15:55:29 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Mon, 12 Jul 2021 06:50:32 +0800
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: intermittent hang in qos-test for qemu-system-i386 on 32-bit arm
 host
Message-ID: <20210711225032.smu6kxhqvt3xniwk@Rk>
References: <CAFEAcA-L5kztvCiS-Y+_LDiaFgWzuCpPYN1-cHNY9Q8qpi538Q@mail.gmail.com>
 <CAFEAcA9PSZaHkV-qL9jvXX_MFKwYJJTSQ4FjQJfwyRi7GvJvWg@mail.gmail.com>
 <20210711222033.tb3paw53ayxrkagb@Rk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210711222033.tb3paw53ayxrkagb@Rk>
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=coiby.xu@gmail.com; helo=mail-pf1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 12, 2021 at 06:20:33AM +0800, Coiby Xu wrote:
>On Sun, Jul 11, 2021 at 04:53:51PM +0100, Peter Maydell wrote:
>>On Sat, 10 Jul 2021 at 14:30, Peter Maydell <peter.maydell@linaro.org> wrote:
>>>
>>>I've noticed recently that intermittently 'make check' will hang on
>>>my aarch32 test system (really an aarch64 box with an aarch32 chroot).
>>>
>>>I think from grep that this must be the vhost-user-blk test.
>>
>>I've also now seen this on qemu-system-i386 guest x86-64 Linux host:
>
>Good to to know that! This makes it much easier for me to debug this
>issue.

Which i386 image do you use for the guest? Could you share the download
link? I can't find a suitable i386 qcow2 image. For example, [1] is
outdated.

[1] http://people.debian.org/~aurel32/qemu

-- 
Best regards,
Coiby

