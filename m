Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C4D3FE3F1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 22:24:50 +0200 (CEST)
Received: from localhost ([::1]:56390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLWmv-0001PV-3U
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 16:24:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <johannes.stoelp@googlemail.com>)
 id 1mLWlY-0000iF-LJ; Wed, 01 Sep 2021 16:23:24 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:40490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <johannes.stoelp@googlemail.com>)
 id 1mLWlX-0005eP-2p; Wed, 01 Sep 2021 16:23:24 -0400
Received: by mail-pf1-x436.google.com with SMTP id r13so732755pff.7;
 Wed, 01 Sep 2021 13:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cc2dkFv4m3GWrhTqipor05lmSqPLVdF0dLohOouhlro=;
 b=kKHQ9wOhJP5qpRDBe6MqgTq3J5jXCikXvTGpBsknVVLqtBprU9nGViJtrmtqLQbjvo
 dS04sgoWMHHIBt3qJk+H+vQexpp52q4BeTRf2PT8o8eZRSCffw4wXBzBgPFxAeTxPbic
 lkmgg2jgUQGQ2XpBHVy9vgblS4mX/KfJaarj587kpdoZ0MFMnibW70w+LJZ03yXmuR8n
 94GffF1bnujMGWF8S9K+e8o/2PHnp0PYyWqFIY6g4NlkhiWJTYLR8xcrFNw5Gf4KIS1Z
 nK88TAhzO48Ig6qle0B2bTR+MrR1Rs3MocKE9lIbtTl4yEQo/J9w6ZN0ou0qndW4Q+6D
 Mqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cc2dkFv4m3GWrhTqipor05lmSqPLVdF0dLohOouhlro=;
 b=dy4cve5ayxzA3OhhhWEvl7S/WCA16EU/J3Byip1gEkEaaAVzxiIdvy1larPoDq0hsS
 HR/tUUuOdQCBisY0S4QD9Joo7rSmcyowFWZnES5CPZOzzXcpm1G6jBL5Zmt5coB/WFI6
 ea20mlOXXcWYaRJo1txQlgygYh4kw/n1uwgqQefwDBreZglAfxzhki+dCmKbzFUgVTM9
 vhp7tK0abT1nixtiTknnJNaAaXWtRmCzWa1sd/nOLgQVxQwa2nn7BHfT4WNTxpy580WB
 fmLsZqRHWbil2v99KPddnrRtIqhu1GDbbfRbjv73Q2MOdyV0Y4gfbQKfVy9KxzkPGLvT
 yL1g==
X-Gm-Message-State: AOAM532XOa8nJOXHclTYV780CfuhaYgg4J4hUy9l8aAM85U3wakiFdvH
 H1ekTqgfMbY+/zalfHmtqdEdNwahiLPq39YPyr4=
X-Google-Smtp-Source: ABdhPJx/mV0yloWRVzCFbam8XzPyr8sPAsfkQIQ0RnErr/4KehQQx2XaKnyJc+qi112LnDIB7N2ba/XFb3bRPv56eBQ=
X-Received: by 2002:aa7:82cf:0:b029:3c4:4daa:fd68 with SMTP id
 f15-20020aa782cf0000b02903c44daafd68mr1128606pfn.66.1630527800463; Wed, 01
 Sep 2021 13:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210805193950.514357-1-johannes.stoelp@gmail.com>
 <CAFEAcA8TRQdj33Ycm=XzmuUUNApaXVgeDexfS+3Ycg6kLnpmyg@mail.gmail.com>
 <20210830154708.ah27fh34q5dgg3le@redhat.com>
 <CAFEAcA-QW1_sLEArKY1jBJkmGdKQukgwe=O36p7gDpH2mFceqw@mail.gmail.com>
 <CAMnW+q_6Vd0os7AEVVyM30m1kzev_3j8MWusXV1kp6jmUmRqcg@mail.gmail.com>
 <CAFEAcA-PSg6puCy95bskoFzq1a0F60O43cAkz=k73SXLZxO0nQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-PSg6puCy95bskoFzq1a0F60O43cAkz=k73SXLZxO0nQ@mail.gmail.com>
From: Johannes S <johannes.stoelp@googlemail.com>
Date: Wed, 1 Sep 2021 22:23:09 +0200
Message-ID: <CAMnW+q_7MD0yd-fD1g1TSbYSo5HiV1jBeyzNJHaHOzHPrqTUgA@mail.gmail.com>
Subject: Re: [PATCH v0] kvm: unsigned datatype in ioctl wrapper
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Eric Blake <eblake@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=johannes.stoelp@googlemail.com; helo=mail-pf1-x436.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Aug 30, 2021 at 10:15 PM Peter Maydell <peter.maydell@linaro.org> wrote:
> I think I would vote for following the type used by the ioctl()
> function as declared in the headers for both Linux and the BSDs,
> and using 'unsigned long'.
> (We should change KVMState::irq_set_ioctl too, to match.)

I would agree to 'unsigned long', in that case I can generate a new patch.

And in theory if all libc implementations specify the ioctl request as
'int' we could go back to 'int'.

Johannes

