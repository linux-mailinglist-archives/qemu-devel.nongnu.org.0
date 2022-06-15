Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E37054C743
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 13:20:46 +0200 (CEST)
Received: from localhost ([::1]:50506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1R4m-0005D8-SO
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 07:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xiaoguangrong.eric@gmail.com>)
 id 1o1R1x-0004N0-02
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 07:17:52 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:37567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xiaoguangrong.eric@gmail.com>)
 id 1o1R1t-0003us-MC
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 07:17:48 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id h27so19955226ybj.4
 for <qemu-devel@nongnu.org>; Wed, 15 Jun 2022 04:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0MPSVey5c36dYBw9hObPHfTXyqBwCa9A0e81VpRD4TE=;
 b=DJiD6uXT0Xhm4/yMc7HfRHGsAZa8rE9eJuXTMwkh6P3BDjU9cjZHoQh9sywAoSCCJ+
 /z19bcfvWzG3djyLRvF0gboaHh3UZu7XM85gcSngQDvj94KomGvVG5sX3B+OnRhf3Fsw
 Eup2r0Azg8TjnjJ5e9LV3rTwTN91QHR3K/YgLuDzzVBnlBB4w+zEWSX/sQPUau3TUgUa
 PXk0yx5owBqN3rLVKMuVtrMiDOfHE2TS16F+JaOPcrn2FXWaQHb03FagHjlDL3kAYE4D
 5s9bKiNW6mnMPr/gnQwYWSRm6mtbud0q9L2G9ALb4Cx/f/rUhw+ympBwSgCOfvE7rRPl
 xZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0MPSVey5c36dYBw9hObPHfTXyqBwCa9A0e81VpRD4TE=;
 b=sZgqBq88GW57poDVXFMHdoesn6wRNA3k9mPbLq2F6eCbGVwb0Pe5Tto6hxggPM0aig
 OAovhjXGvlvUKofW9iuiQy5FDMVjPBfLR7yE7NUzxkuNdGKdE9SXfVYIuthKfrmVXX0y
 zVB8k6IR3i3au69JgwtBUE485O8a8qoZv3Bpw7CQrUITz9gDuO4Di7IAtoOuxk8NZW5E
 Jg5k8j4RFOyPlfmdWwXx2y0Q9g8IMyimRoYDpbXIPFdVFXzpcQaqT50Tc8QcEbeCy7rG
 MVMOFW5hcnoSB21/2M/kx1vh/FsUCLs+PLf8IAiGtHB+h5/Z+JYAWmsKUHtu5vQhgNE7
 SSTg==
X-Gm-Message-State: AJIora8kn2N8kFANxdMejCnyD2rR48+bjG9h5RPLygE4QGWBpSqiONRp
 lkY87TXebr5eA9cgw24vk5U/rXlgowiB3oeAAQ+3OIrOgrpoCg==
X-Google-Smtp-Source: AGRyM1sejX0F40BBaY0Er5T7Kp/TYRIgvMphVjdljWO8xz059Azc6ZmowMNuTWxDeGrfN0bOk03WCEo0aTcmQ9PuXhU=
X-Received: by 2002:a25:820a:0:b0:664:7ad6:3fd6 with SMTP id
 q10-20020a25820a000000b006647ad63fd6mr9897982ybk.559.1655291864101; Wed, 15
 Jun 2022 04:17:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220531145147.61112-1-jusual@redhat.com>
 <YpY0/Pc3uoA9QQD/@stefanha-x1.localdomain>
 <CAMDeoFUxG7B67BCm4nb303VEwBdiD=JNi_OWSaxirThWnTd6LA@mail.gmail.com>
 <YqdTQYUhO/3dzJvZ@stefanha-x1.localdomain>
 <20220614105408.235f0f41@redhat.com>
 <ac7c0d9c-4fb2-c67b-db25-00e4bbc0eb42@redhat.com>
 <CAMDeoFV3SEWv5gAUd-ZJ=pGw3=JkHR9pOztkytGr1tRhM_uBNw@mail.gmail.com>
 <0fe9723a-620a-f388-68a8-c6a11f8aa3ca@redhat.com>
In-Reply-To: <0fe9723a-620a-f388-68a8-c6a11f8aa3ca@redhat.com>
From: Xiao Guangrong <xiaoguangrong.eric@gmail.com>
Date: Wed, 15 Jun 2022 19:17:33 +0800
Message-ID: <CALg51MOVVm2P5WUjnFF_xvsAk9+QYtWXjOqdU9wdCQJnv6oagg@mail.gmail.com>
Subject: Re: [PATCH] hw/mem/nvdimm: fix error message for 'unarmed' flag
To: David Hildenbrand <david@redhat.com>
Cc: Julia Suvorova <jusual@redhat.com>, Igor Mammedov <imammedo@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=xiaoguangrong.eric@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 15, 2022 at 4:24 PM David Hildenbrand <david@redhat.com> wrote:

> >> Is that a temporary or a permanent thing? Do we know?
> >
> > No idea. But his last signed-off was three years ago.
>
> I sent a patch to Xiao, asking if he's still active in QEMU. If I don't
> get a reply this week, I'll move forward with proposing an update to
> MAINTAINERS as described.
>

Okay, please do it.

Sorry, I am just roughly reading the mailing list of qemu & kvm usually,
and do not get enough time to actively review or contribute on these
fields. :-(

