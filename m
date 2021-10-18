Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99AC04323BE
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:23:06 +0200 (CEST)
Received: from localhost ([::1]:53390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVPl-0008HN-L9
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mcVNc-000546-5D; Mon, 18 Oct 2021 12:20:53 -0400
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f]:37866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mcVNW-0005od-Mw; Mon, 18 Oct 2021 12:20:51 -0400
Received: by mail-lj1-x22f.google.com with SMTP id g8so759499ljn.4;
 Mon, 18 Oct 2021 09:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=IjaHQDi+wlz25AYGDk7z1XPYDNNBpuv7GhJJQsAKoSs=;
 b=YSlK8VO7/Y/LrVqd26nlheq+eFzeZhmmg/AXJ+yKTzFsjCCs6WnKgMopTuw+rwKl6D
 cbf8kE2yGd/V9mu2+mThj2kD7bHq6St52QPa03W0CoCW7xKiWe44zgF9T9ZP4sE34haL
 4oYoR4y2Joe4ceg7nIF3quqCrHBARQ88O1c6qsBXhiObUaPV5Hwtkt+6tgwhkcRU+uzm
 0sFcrpu+oWahNKYYad4AL0Kc3A7cG2i3jpb/JCkPoltN+BXnbrnsbuA7HY3tBrt7jX3j
 Yoe31CkVqQEwOM+mnK4IdKCvbQ7eYRiyQN3DheT0KyjJee8YN+AGDpA2XQpivTkAqxNa
 5HoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=IjaHQDi+wlz25AYGDk7z1XPYDNNBpuv7GhJJQsAKoSs=;
 b=nhClMe+aLtWW4piKJ7+jWMkJRIdiAFE9tvIoEyQT1lENflKsS9w/McDVpRtNuE3Ki0
 LoscK0ezcf6zEG+n8D62VRInbYz5GhSICKqdm6tIOTASY1eJIVN+Uodj+oGV4CLFaXIE
 jlmR0kW14eA64ypvmDEjPKYw5s/WMwvyvay7KpTBCedd84xNn4P8qLzyG7O1HHhv4rks
 /qiCr+EHre/SpvMsnFId3v9zFyI30YlI0h5VXEf9rCIPkbtRYxccFHDG7sLJRVVEMaA2
 wrtU+A1K/As0qyUz+Z8+ZRcqZ+Uuqo9fAsMOgFHR6HPHfU+biwszPZaMilYNpCJEfhX5
 qJ0Q==
X-Gm-Message-State: AOAM532iRVcN8DV8PEdQzdHiIjDKWfni8p/qIin40rKs7TbeUcwjgw58
 ZOXFjJNVf59FI1Mgst67hFE=
X-Google-Smtp-Source: ABdhPJy7tQV5Xik7lnsLP45d1D2JlWM8vms/AosVdZIj+vFANl8rnE19Q22xWNuoUVoHuzebiK1ApA==
X-Received: by 2002:a2e:ba16:: with SMTP id p22mr702709lja.143.1634574037718; 
 Mon, 18 Oct 2021 09:20:37 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id v5sm1445766lfo.49.2021.10.18.09.20.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:20:37 -0700 (PDT)
Date: Mon, 18 Oct 2021 18:20:36 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH 0/3] hw/nvram: Fix Memory Leaks in Xilinx eFUSE
Message-ID: <20211018162036.GM3586016@toto>
References: <20211015203532.2463705-1-tong.ho@xilinx.com>
 <9c8f7ca7-522b-522a-8fc9-cd5e8897cf2d@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c8f7ca7-522b-522a-8fc9-cd5e8897cf2d@amsat.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x22f.google.com
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
Cc: peter.maydell@linaro.org, QEMU Trivial <qemu-trivial@nongnu.org>,
 alistair@alistair23.me, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Tong Ho <tong.ho@xilinx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 18, 2021 at 12:31:44PM +0200, Philippe Mathieu-Daudé wrote:
> Cc'ing qemu-trivial@
> 
> On 10/15/21 22:35, Tong Ho wrote:
> > This series fixes memory leaks in Xilinx eFUSE devices for
> > the Versal and ZynqMP product families.
> > 
> > The leaks result from failing to free memory allocated
> > by object_get_canonical_path().
> > 
> > Tong Ho (3):
> >   hw/nvram: Fix Memory Leak in Xilinx eFuse QOM
> >   hw/nvram: Fix Memory Leak in Xilinx Versal eFuse device
> >   hw/nvram: Fix Memory Leak in Xilinx ZynqMP eFuse device
> > 
> >  hw/nvram/xlnx-efuse.c             |  9 ++++++---
> >  hw/nvram/xlnx-versal-efuse-ctrl.c | 20 +++++++++++++++-----
> >  hw/nvram/xlnx-zynqmp-efuse.c      | 18 ++++++++++++------
> >  3 files changed, 33 insertions(+), 14 deletions(-)
> > 
> 
> Series:
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> 

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>



