Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE4739325B
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 17:23:06 +0200 (CEST)
Received: from localhost ([::1]:37136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmHqj-0005Rr-7U
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 11:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamespharvey20@gmail.com>)
 id 1lmHp1-0003q6-Vh
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:21:20 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:45698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamespharvey20@gmail.com>)
 id 1lmHoy-0004nd-Sw
 for qemu-devel@nongnu.org; Thu, 27 May 2021 11:21:19 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 ne24-20020a17090b3758b029015f2dafecb0so615177pjb.4
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 08:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=axS9WZcZsObHqyZIOsmcU3hcT36EEULmz8xFS1enpGs=;
 b=rLTav09jhmz3lnFzbW/9re6CKmpHX+1+3Gxi5ATIZvVrCOvTHwR8hzdqcJBb0BLZ9w
 VaLTTFfJyXi3XTExY2SWuc6Gv+uvXLhh3tFb5Qtn7ZCnvK29nV+GHxTEDjJz7YXWnfJJ
 f9DYkVbeC71Kj5ysqs9IR0fSyqZeKnrmSSHKiTj6UDKMY5zj06AqqltJAiz7yNofX/RI
 IcEIyTKN7Ri2YX+v0uAyWZNhx3pjL6Ho9a3AhW8BmKqho+3ObrO6gGXNN/KhCVBNjPh9
 n/S/U5A2OapR6tSJ/lwWm5l35aeIEOCRTq1TF+l6sWlGpUMbJ4p10neRB9sTadCIaNrO
 RYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=axS9WZcZsObHqyZIOsmcU3hcT36EEULmz8xFS1enpGs=;
 b=nkMRgrsNgP5zHrAL2o9E/PBbPcCpQY4FVyBt95VQebZLKDl+kbZjUb3PRccXkN0bzu
 HICVqXf6V0vs7lNyofFnp8iBUcUc+e//F5GD2g9QQj/qFgNe2M0dLbWcekgp3lbGXoQu
 qyFBe5u96GLROp3XfThSqUDSrXYhNmiuNF/mU67ehFPQUKsPrmHEhafNznM5XLSQPLgO
 WDCsw4aRSDN3wCWsdMU1Gp5neATgmrHruoFsCRREt1nvMJB7HC+wcmvuU4BHFWw1MMIy
 RLMxZuosBO9qWwAWH+LfJQGFYC7fTjy5qQkQ3QZiy06MWKvsWFVC/6AlsOxFysLBsePd
 X05g==
X-Gm-Message-State: AOAM530rov+YoFye6DI59b0Z3JqlvY1V67GLxjXBCBF+8Mj2v4aqROXJ
 aDgJf5bWPu/QUv1mHhLuaReSdlWlyI8z37bJTGo=
X-Google-Smtp-Source: ABdhPJzllu1Vl/kRx47Wn9dKugs3435EcdEracrW0Be+j156GWGOIPanOufm7H3VPjG23kOc7RpCOX6+S35Toh3JlIA=
X-Received: by 2002:a17:90a:e511:: with SMTP id
 t17mr4269938pjy.93.1622128873988; 
 Thu, 27 May 2021 08:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAH1_c8og7hQXSEaaxg5tUoom+OuT+ZmE_12kVmk5ARW8ozfwQA@mail.gmail.com>
In-Reply-To: <CAH1_c8og7hQXSEaaxg5tUoom+OuT+ZmE_12kVmk5ARW8ozfwQA@mail.gmail.com>
From: James Harvey <jamespharvey20@gmail.com>
Date: Thu, 27 May 2021 11:21:02 -0400
Message-ID: <CA+X5Wn484KcKh3La7qODU7wn2wZqbsg1fozArhNNF2UggZsNgQ@mail.gmail.com>
Subject: Re: P2P problem on QEMU
To: Gabriele Borello <borello.gabriele8@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=jamespharvey20@gmail.com; helo=mail-pj1-x102b.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 26, 2021 at 1:44 PM Gabriele Borello
<borello.gabriele8@gmail.com> wrote:
> The following kernel version was used: Linux 5.9.0-rc8 x86_64,
> ...
>  The kernel was compiled by configuring peer-to-peer as described in the p2pmem-test guide. Trying to run the command suggested in the p2pmem-test guide ( ./p2pmem-test /dev/nvme0n1 /dev/nvme1n1 /dev/p2pmem0 -c 1 -s 4k),  we get a kernel panic.

I've never looked at PCI Peer-to-Peer DMA.  Briefly, I see the
p2pmem-test developer sbates130272 has github repos for linux-p2pmen
which has been maintained through 5.13-rc1.  It could be worth trying
the more recent kernel.

> We don't know where we went wrong. If you could give us feedback we would be very grateful.

The stacktrace from the panic would be needed for others to give much
feedback.  If I'm understanding correctly that you aren't trying to
really do P2P between the host and guest OS's, but between a virtual
NVMe in the guest to a p2pmem device in the guest, my next step would
be to get an NVMe and install exactly what you installed in QEMU to it
(identical versions and configuration) and see if you could replicate
the stacktrace on bare metal.  If so, it would be a kernel issue
rather than QEMU.  If you couldn't, that could suggest the QEMU NVMe
device support may be incomplete or bugged in a way preventing this.
If you're running an older version of QEMU, it would also be worth
trying 6.0.0 to see if the issue has been resolved.

