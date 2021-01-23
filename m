Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6356D3011D2
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 02:04:15 +0100 (CET)
Received: from localhost ([::1]:36760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l37La-0007he-0P
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 20:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l37Jy-0007AB-Hs; Fri, 22 Jan 2021 20:02:34 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:34651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l37Jx-0002uy-0i; Fri, 22 Jan 2021 20:02:34 -0500
Received: by mail-pj1-x1031.google.com with SMTP id my11so7139920pjb.1;
 Fri, 22 Jan 2021 17:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WR5W7WBaCoFj6uvYxPWN6K+8NShNtGgZjTxPFgpEe+w=;
 b=e5MyJIjsXWJHNSdGRQ+uZUVPuReKaHMqe6V2wHvj8tHAcqGoZQRqgBEV+RmzHsebU5
 b9665VQIujxJ4tVkUk0MLtRwyFA9drb3xvuLasIyhZpCmE5GUBMTaxAi7xLLZbreiGzF
 HFOutLq8wZOApgSG2aDPf6cxl8D/cR5Xc/vgRw3v5bZTsS8pokY80o6EsjEabsxEZaq6
 WWsyGAAMPHMgezsialrXUNeYWERTmm0m6pUa70/BhLLhTvZ52xbn+7Am4Y+OErVbwKQL
 yiFDafRaIL3HI8O/nYF9L3ngUkPZiY77Aay/aBN9Drz1ZUkVsBIqt6GgsJWt/eOKcO5A
 IJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WR5W7WBaCoFj6uvYxPWN6K+8NShNtGgZjTxPFgpEe+w=;
 b=FmTsWKwiVASxPordryMzqV112cGJSP9XAopygDTvu7Q6RI+uDujn16EdeZ+HouDQMH
 WPt7WnXeeXo0Xw6AICQAaHv35ZvyoKsA/X3sqWiBweOdLpMyWFMnRwoDH9ESf3eAGvmW
 OpJNUARGf2MeaRN+0+EXaQ3Jv28Yfgodn+LDaufOt8tSNEfbl7SEZTiF9KewcWP7DxPj
 kXeEbtfZFfslQ88oWlx67slKwjSVAF6nP6dAlGBrgLRS4TOXkmXHHzswn4GBM6wFZCS2
 TISPZmgh/hBYYrnXR8RcqG/JlixanoeBKbFE7xEY0zFkZhEdjqiJvi8/YigvdkyE52eh
 VM3A==
X-Gm-Message-State: AOAM5301DcjVggps06qVwdiT20UWQbMWfF75ETE8uJfx54qidpVROSj2
 kS8rBFjPNtUa4h8iLirl0aY=
X-Google-Smtp-Source: ABdhPJya72n45OOYOOrllnLVHWhqqoC8EGP1qkk9JeZj7KJW8BItLk71ZB6pWzpMoJY4rx2GQDIe1Q==
X-Received: by 2002:a17:903:2306:b029:de:18e9:f439 with SMTP id
 d6-20020a1709032306b02900de18e9f439mr7729012plh.38.1611363750555; 
 Fri, 22 Jan 2021 17:02:30 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id v2sm9298278pgs.50.2021.01.22.17.02.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 22 Jan 2021 17:02:29 -0800 (PST)
Date: Sat, 23 Jan 2021 10:02:27 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH V5 4/6] hw/block/nvme: support for multi-controller in
 subsystem
Message-ID: <20210123010227.GA2893@localhost.localdomain>
References: <20210122120736.5242-1-minwoo.im.dev@gmail.com>
 <20210122120736.5242-5-minwoo.im.dev@gmail.com>
 <20210122184236.GA1728586@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210122184236.GA1728586@dhcp-10-100-145-180.wdc.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1031.google.com
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
Cc: Klaus Jensen <its@irrelevant.dk>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-22 10:42:36, Keith Busch wrote:
> On Fri, Jan 22, 2021 at 09:07:34PM +0900, Minwoo Im wrote:
> > index b525fca14103..3dedefb8ebba 100644
> > --- a/hw/block/nvme.c
> > +++ b/hw/block/nvme.c
> > @@ -4435,6 +4435,9 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
> >      strpadcpy((char *)id->mn, sizeof(id->mn), "QEMU NVMe Ctrl", ' ');
> >      strpadcpy((char *)id->fr, sizeof(id->fr), "1.0", ' ');
> >      strpadcpy((char *)id->sn, sizeof(id->sn), n->params.serial, ' ');
> > +
> > +    id->cntlid = n->cntlid;
> 
> cpu_to_le16()? It might be okay to not do that since the only
> requirement is that this is a unique value, but it would be confusing
> for decoding commands that have a controller id field.

Agreed.

Yes, cntlids are allocated in unique values so that functionality has no
problem here.  But, even if so, we should make it have proper value in
Identify data structure with the policy it has to avoid confusing.

Thanks Keith! will fix it :)

