Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAE46FEE7D
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 11:16:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px2Oh-0006D3-Fv; Thu, 11 May 2023 05:15:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1px2ON-00067v-JX
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:15:20 -0400
Received: from esa7.hc2706-39.iphmx.com ([216.71.137.80])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1px2OL-00077l-Sm
 for qemu-devel@nongnu.org; Thu, 11 May 2023 05:15:19 -0400
X-IronPort-RemoteIP: 209.85.219.71
X-IronPort-MID: 279494809
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:k9KNn6yF9Tk1RYAmDbF6t+eKxCrEfRIJ4+MujC+fZmUNrF6WrkVWz
 TcYXmqCa6vYZjH2KNEkPo609hkF78LXzdRqQQZoqC00HyNBpPSeOdnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9j8kk/nTHNIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzN8B56r8ks156yv4WpA5zTSWNgQ1LPgvyhNZH4gDfzpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZGBiuFIPM0SRqkEqShgJ70oOHKF0hXG7Ktm+t4sZJ
 N1l7fRcQOqyV0HGsL11vxJwSkmSMUDakVNuzLfWXcG7liX7n3XQL/pGVHAdZ4EZ9+lLCkZp7
 sIBNQEWUB2AmLfjqF67YrEEasULKcDqOMYGpCglw26AS/khRp/HTuPB4towMDUY3JgfW6aDI
 ZBAOHwwNXwsYDUWUrsTIJs6jOGknFH1bntVpE/9Sa8fuTeCkF0tgOC8WDbTUsOTbJQF3U/Hn
 HOcwWLrGkFZOPeBzzXQpxpAgceKx0sXQrk6DbC967tmjUOewkQVDxsZU0b9puO24nNSQPpaI
 k0QvzMw9O08qxXtQd76UBm15nWDu3bwRuZtLgHz0ynVooK83upTLjJsouJpADD+iPILeA==
IronPort-HdrOrdr: A9a23:ZahXYqDs8d1RWkblHelg55DYdb4zR+YMi2TDGXoBLiC9Vvbo6v
 xG+85rqSMc6QxhIk3I/OrrBEDuewK/yXcY2/h1AV7mZniYhILKFvAY0WKB+UyYJ8SWzIc0vt
 YCT0E9MqyJMbETt6bHCWKDYrAdKbe8gcSVrNab5VtWCS9RV4FcwzFQNju7e3cGOjWuxqBUKH
 Nf3Kd6TvabF0j/p/7VZ0U4Yw==
X-Talos-CUID: =?us-ascii?q?9a23=3AnnXKsGr832vSMldMS25QWwXmUZgUWSfRzXrfH0S?=
 =?us-ascii?q?fLn1XUaCkUmGd+7wxxg=3D=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3AtZs7dA68Qc7qb93nrrQT5xcixox3+o3/WAMEzq8?=
 =?us-ascii?q?X4feCJzQgeDu2kjK4F9o=3D?=
Received: from mail-qv1-f71.google.com ([209.85.219.71])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 May 2023 05:15:14 -0400
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-621247fde5cso25693536d6.0
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 02:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bu.edu; s=s1gsbu; t=1683796513; x=1686388513;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=tZWcGmmpaunphoIYX25Fz6+V1kk4+EibTHDdV0r0orY=;
 b=h4kGJvRNHlcmDBe+OejCKIj1ctZCmaWzPLoM7qgJCJA7mWDhixfSVclJ7B9cK2gE8L
 Lqx4BXcwVe2Q5WyuCstbyy+8chI79BAmw0PPtG2OGPduRwfuDJ9NGpVr7ikk5uAZ/S2r
 n6n/giC1MnVoTiFOrgFjh1sZkxw7/tVcW/PPhADdwvyngWRXzoGT9Nkt6AUsqNfEb8tj
 vQ8XIuChuSFUNu1qKKyXVY9fD9m4doQP7knkF2fWDDK7Q+C049OiAEk80OGHcKbPAcz+
 Rujja0eznyBs19KJNeu56jRQO6KmzOBQ3XKZYkwW6KoTKyDp0tJOK6ZabPO3LYi2jxu2
 SMng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683796513; x=1686388513;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tZWcGmmpaunphoIYX25Fz6+V1kk4+EibTHDdV0r0orY=;
 b=l8W980mGX7NjnXrBTyBTMsi55eWX9H8jd2YMmRQUZT+cSOgiSSZs+iQ1C4vwwghAL+
 CuOYtggQmzPuQjxQqEomMSkKmoGVB+cAMoyYpeCL+d29cL5qAAyvB99KXEKPfL/KzTk1
 A5zmLPInGTX0R02eK2UoRcl1IIUMUJzmKYdn49S3VrxfYfSk35KC3bAR5m3N3aohwQwu
 2GClGqiKM0sM+DKxfITQ7/RRfTBZF3YRA40rtyn39o451U7161ox3uTWMQWFC5NXx6m1
 WG3jml5em988zmYrpWWh0C24jZlB8VDebiNlsbBomCHHLRC4rrqOfpcfPGFjAal0WJnf
 dgbg==
X-Gm-Message-State: AC+VfDxGF+4j40IOyH7FkPHZMrvzDZUkZdjsAtY+/VseKTOZdSeLB/aG
 3cfnyHyxBQlNzj4XsC6NwvE4yoC6OczC5z9vFpRalKdt/eplixInujpyMan1jhQNNICSVxl3l1E
 wtvnf9eSsP/eZe2PPRhd8E4sxiQd3UAWGxyeak8wv
X-Received: by 2002:a05:6214:76a:b0:616:54c7:316a with SMTP id
 f10-20020a056214076a00b0061654c7316amr26821801qvz.8.1683796513477; 
 Thu, 11 May 2023 02:15:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6pAdvLb7kzuAgreu4HaGof+20PKgk6YEM5eUG70kQiRrgyJIvkvcsx8ue8YJX7H1zziKrS+g==
X-Received: by 2002:a05:6214:76a:b0:616:54c7:316a with SMTP id
 f10-20020a056214076a00b0061654c7316amr26821785qvz.8.1683796513144; 
 Thu, 11 May 2023 02:15:13 -0700 (PDT)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a0ce512000000b006215c5bb2e9sm699558qvm.70.2023.05.11.02.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 May 2023 02:15:12 -0700 (PDT)
Date: Thu, 11 May 2023 05:15:09 -0400
From: Alexander Bulekov <alxndr@bu.edu>
To: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "open list:PowerNV Non-Virtu..." <qemu-ppc@nongnu.org>
Subject: Re: [PATCH] pnv_lpc: disable reentrancy detection for lpc-hc
Message-ID: <20230511091509.nypeyd5fhzxlvo47@mozz.bu.edu>
References: <20230511085337.3688527-1-alxndr@bu.edu>
 <3102db7a-bbaa-f394-b739-23950fe81be0@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3102db7a-bbaa-f394-b739-23950fe81be0@kaod.org>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.137.80; envelope-from=alxndr@bu.edu;
 helo=esa7.hc2706-39.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 230511 1104, Cédric Le Goater wrote:
> Hello Alexander
> 
> On 5/11/23 10:53, Alexander Bulekov wrote:
> > As lpc-hc is designed for re-entrant calls from xscom, mark it
> > re-entrancy safe.
> > 
> > Reported-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> >   hw/ppc/pnv_lpc.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/hw/ppc/pnv_lpc.c b/hw/ppc/pnv_lpc.c
> > index 01f44c19eb..67fd049a7f 100644
> > --- a/hw/ppc/pnv_lpc.c
> > +++ b/hw/ppc/pnv_lpc.c
> > @@ -738,6 +738,8 @@ static void pnv_lpc_realize(DeviceState *dev, Error **errp)
> >                                   &lpc->opb_master_regs);
> >       memory_region_init_io(&lpc->lpc_hc_regs, OBJECT(dev), &lpc_hc_ops, lpc,
> >                             "lpc-hc", LPC_HC_REGS_OPB_SIZE);
> > +    /* xscom writes to lpc-hc. As such mark lpc-hc re-entrancy safe */
> > +    lpc->lpc_hc_regs.disable_reentrancy_guard = true;
> >       memory_region_add_subregion(&lpc->opb_mr, LPC_HC_REGS_OPB_ADDR,
> >                                   &lpc->lpc_hc_regs);
> 
> The warning changed :
> 
>   qemu-system-ppc64: warning: Blocked re-entrant IO on MemoryRegion: lpc-opb-master at addr: 0x8
> 
> I will take a look unless you know exactly what to do.
>

That does not show up for me with "./qemu-system-ppc64 -M powernv8" 
Do I need to boot a kernel to see the message?

I was worried that there might be other re-entrant IO in this device.
Maybe there should be a way to just mark the whole device re-entrancy
safe.

