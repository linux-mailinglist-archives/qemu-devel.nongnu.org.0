Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A232FDC29
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 22:59:50 +0100 (CET)
Received: from localhost ([::1]:54446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2LVz-000385-7t
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 16:59:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2LUg-0002NF-54; Wed, 20 Jan 2021 16:58:26 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:38825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2LUe-0002QH-Ik; Wed, 20 Jan 2021 16:58:25 -0500
Received: by mail-pj1-x1031.google.com with SMTP id x20so3099899pjh.3;
 Wed, 20 Jan 2021 13:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ps8HiBAJbeC1GeIUgBGxKpFp1KaYGS1cXPX18CV7yzg=;
 b=i9PBIije7ViAIgV4Vlw/iswXXQ//nrtC+0rhTX51j/fUHOWKBK+DV7pzfQkZrfBLBo
 Hnr6sG08upRYwtyQXLY4IY74dqNdN7AhwPv1C5DZZUZ/rYW4dnnPZnIPn6Y3PycY7FZs
 cx3QSYBBkVc1fsA5mnmDi8s142qlYGSGg0c2uqAjzS2gKbtBdwJq2IPJmADow9Wwx0DQ
 viVd36eBo6Xyi0+eK4v+0Ox6U/HQ55ZFZPdDxL50iUAdhmfxrIkTsE6dYWFVRQxkwcWR
 Opmr0mZzGB1X5ZXW4wr55f1RmXSarEnRdkOEUrtM6Kj048YW00ObGZi2Fxq9HA7KaY/Q
 XVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ps8HiBAJbeC1GeIUgBGxKpFp1KaYGS1cXPX18CV7yzg=;
 b=PnglwkIa5IObxIhWX3KckXWfuIwjfFKYtjOARoiFp96ff2muZystLHgzxDFLQG6GYY
 ygA7AqBfMH6XSSb37E/52YkIVMzwBKA5ccfBsJB3VhyaCYR2vptdavQUuZfslk82ZJmg
 IHtOvmBKlhMwuWOWGTV5xpREQXDbwwZQtIN+cBHUO0bC3DSlWFtXXCrdw1neQZwp/Y/h
 1/5mfORh+Cohx+ji6UJnTDO3rJZB45UB75vo/rN1QYV+XzyLHbgXYb71YQPTGx1JDBhH
 9cF9lTVLuxDMIq3Mn8SYv4s84GNZhTJuDtG/iatnYO4TyteBttWiuwzxQuCilT5kUprS
 QH0g==
X-Gm-Message-State: AOAM532dxen3YVDZgMHUvLvYREVHTVajyDJjzSHd0L1vksXnxex8idQn
 1PxnSUL2PkM3sgBjGmHl9mg=
X-Google-Smtp-Source: ABdhPJyVZ+3qSPgugRzrKjJY0RN45+d6GgHihDuvhN9BmjJsOMUhEn29g0h7KJ+hYc9DkL4NOpf2Lw==
X-Received: by 2002:a17:90b:4c8c:: with SMTP id
 my12mr7755089pjb.29.1611179902353; 
 Wed, 20 Jan 2021 13:58:22 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id o14sm3556232pgr.44.2021.01.20.13.58.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 20 Jan 2021 13:58:21 -0800 (PST)
Date: Thu, 21 Jan 2021 06:58:19 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Niklas Cassel <Niklas.Cassel@wdc.com>
Subject: Re: [RFC PATCH V3 8/8] hw/block/nvme: Add Identify Active Namespace
 ID List
Message-ID: <20210120215819.GA2645@localhost.localdomain>
References: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
 <20210119170147.19657-9-minwoo.im.dev@gmail.com>
 <20210120140718.GA130091@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210120140718.GA130091@localhost.localdomain>
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Klaus Jensen <its@irrelevant.dk>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Hello Minwoo,
> 
> By introducing a detached parameter,
> you are also implicitly making the following
> NVMe commands no longer be spec compliant:
> 
> NVME_ID_CNS_NS, NVME_ID_CNS_CS_NS,
> NVME_ID_CNS_NS_ACTIVE_LIST, NVME_ID_CNS_CS_NS_ACTIVE_LIST
> 
> When these commands are called on a detached namespace,
> they should usually return a zero filled data struct.

Agreed.

> Dmitry and I had a patch on V8 on the ZNS series
> that tried to fix some the existing NVMe commands
> to be spec compliant, by handling detached namespaces
> properly. In the end, in order to make it easier to
> get the ZNS series accepted, we decided to drop the
> detached related stuff from the series.
> 
> Feel free to look at that patch for inspiration:
> https://github.com/dmitry-fomichev/qemu/commit/251c0ffee5149c739b1347811fa7e32a1c36bf7c

I've seen this patch and as Klaus said, only thing patches need go with
is to put some of nvme_ns_is_attached() helper among the Identify
handlers.

> I'm not sure if you want to modify all the functions that
> our patch modifies, but I think that you should at least
> modify the following nvme functions:
> 
> nvme_identify_ns()
> nvme_identify_ns_csi()
> nvme_identify_nslist()
> nvme_identify_nslist_csi()

Yes, pretty makes sense to update them.  But now it seems like
'attach/detach' scheme should have been separated out of this series
which just introduced the multi-path for controllers and namespace
sharing.  I will drop this 'detach' scheme out of this series and make
another series to support all of the Identify you mentioned above
cleanly.

> So they handle detached namespaces correctly for both:
> NVME_ID_CNS_NS, NVME_ID_CNS_CS_NS,
> NVME_ID_CNS_NS_ACTIVE_LIST, NVME_ID_CNS_CS_NS_ACTIVE_LIST
> as well as for:
> NVME_ID_CNS_NS_PRESENT, NVME_ID_CNS_CS_NS_PRESENT,
> NVME_ID_CNS_NS_PRESENT_LIST, NVME_ID_CNS_CS_NS_PRESENT_LIST
> 
> 
> Kind regards,
> Niklas

