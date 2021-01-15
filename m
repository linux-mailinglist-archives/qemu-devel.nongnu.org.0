Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1848F2F84B2
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 19:47:24 +0100 (CET)
Received: from localhost ([::1]:48314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0U83-0002dg-4B
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 13:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0TzR-0006Vz-W7; Fri, 15 Jan 2021 13:38:31 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:36968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l0TzK-0003Vi-Bh; Fri, 15 Jan 2021 13:38:29 -0500
Received: by mail-pl1-x636.google.com with SMTP id be12so5147475plb.4;
 Fri, 15 Jan 2021 10:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=O1ktJIpvcKoM786sLttFaCz1BNdfgFRNsMyN0P4hiz4=;
 b=A/BFLpVOoWloc/jEN8khF820X6RfjTufzTIFExGN/6AqF35+oihxhaBmtN5HOowied
 TWmH4dX5yUVR6D7uq7Llh4WBP4jDa55AB77mUeaWWoAULZJe22WhlFKjs7onZCR7svE6
 Li2tfSrAGKneP3t6JBGGO8z6gr1CVFX7WXIi7U+1AeOEay/TTlWOmf+4Qd5HuV+4vs30
 5HyrxWJ/DzlAJEBKN2YxJW5y1qyRVPt5Z8nZqWn8dygMz+zkNEW7qv1V3fwCiFChc7ej
 LixamGYtOjRGLj5B1hfdCPwhttX6XRkhYcy6BUhx56c4PLGk2s8moe1VABH2oa3LnlWr
 qHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=O1ktJIpvcKoM786sLttFaCz1BNdfgFRNsMyN0P4hiz4=;
 b=pHYp5ffZde75X2p7XfG661r/3TV7rIzVBfmtr4+scvIfMjTqmCKzb7pDO9EX0f7txi
 O2Bkrw2mKw2qAOw795im3/Bnc/tol/Xrq+LY/yS/9AziSbyd6lz7IAi69oCNif65Nbbb
 WWzM+xj08MEdm+gWG4lJS7Kk6W886UMfsAY/JbnZ5SktxwH+4zvAudrpOUfJhNOnTlIk
 g6dz/H9qevjdcIFiC7+8SgRSy4yjGaDNQipTyRCE9h/XpDHimyVSaR7svDODUf5ZXPn1
 BVrHcioHRWzvPjegfpOJmlKDzekpLBIlU3Bn26W/3nIFEIDYhA11sdAa6WxzcN7znlDu
 ngaQ==
X-Gm-Message-State: AOAM532eiM+6LomqaA5kdV21XSkub1HfFY81YIHHtnHcABrKot6f5JKm
 XrM5s36wISihjc39y7NDuHI=
X-Google-Smtp-Source: ABdhPJxBY7ODHq3Qekl6E1oXDMpiTDAQ+bhGR13jg75q4dyvXCkOewPTq1ssrkYigKW+1h4jYqP/Pg==
X-Received: by 2002:a17:902:8a8d:b029:dc:8ac6:a149 with SMTP id
 p13-20020a1709028a8db02900dc8ac6a149mr14121883plo.18.1610735900586; 
 Fri, 15 Jan 2021 10:38:20 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id s23sm8846900pgj.29.2021.01.15.10.38.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 15 Jan 2021 10:38:19 -0800 (PST)
Date: Sat, 16 Jan 2021 03:38:18 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH 0/5] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <20210115183818.GB2822@localhost.localdomain>
References: <20210115120558.29313-1-minwoo.im.dev@gmail.com>
 <YAGfWe+OMxiBggh3@apples.localdomain>
 <20210115173504.GH1511902@dhcp-10-100-145-180.wdc.com>
 <YAHVKFOYaEO4N6I5@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YAHVKFOYaEO4N6I5@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x636.google.com
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
Cc: Keith Busch <kbusch@kernel.org>, Kevin Wolf <kwolf@redhat.com>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-01-15 18:47:20, Klaus Jensen wrote:
> On Jan 15 09:35, Keith Busch wrote:
> > On Fri, Jan 15, 2021 at 02:57:45PM +0100, Klaus Jensen wrote:
> > > 
> > > As you already mentioned, the problem I see with this approach is that
> > > we have separate namespaces attached to separate controllers. So we are
> > > faking it to the max and if I/O starts going through the other
> > > controller we end up on a namespace that is unrelated (different data).
> > > Havoc ensues.
> > > 
> > > My approach looks a lot like yours, but I hacked around this by adding
> > > extra 'ctrl-0', 'ctrl-1', ..., link-parameters to the namespace device,
> > > replacing the bus. This works well because the namespace then just
> > > registers with multiple controllers. But adding more parameters like
> > > that just isnt nice, so I've been trying to figure out how to allow a
> > > parameter to be specified multiple times, so we could just do more
> > > 'ctrl'-parameters.
> > > 
> > > Alas, since I started thinking about namespace sharing I have been
> > > regretting that I didn't reverse the bus-mechanic for namespace
> > > attachment. It would align better with the theory of operation if it was
> > > the controllers that attached to namespaces, and not the other way
> > > around. So what I would actually really prefer, is that we had multiple
> > > 'ns' link parameters on the controller device.
> > 
> > Would this work better if we introduce a new device in the nvme hierarchy:
> > the nvme-subsystem? You could attach multi-path namespaces and
> > controllers to that, and namespaces you don't want shared can attach
> > directly to controllers like they do today. You could also auto-assign
> > cntlid, and you wouldn't need to duplicate serial numbers in your
> > parameters.
> 
> I kinda POC'ed that, but I think I tried to make it work with a bus and
> walking it and all kinds of fancy stuff.
> 
> I think it can just be a 'link' parameter, so something like:
> 
>   -device nvme-subsys,id=subsys0

Do we have any plan for default subsys hierarchy?  Or is it going to be
a mandatory root node of nvme controllers and namespaces?

>   -device nvme,id=nvme0,subsys=subsys0
>   -device nvme,id=nvme1,subsys=subsys0
>   -device nvme-ns,id=shared-ns1,nsid=1,subsys=subsys0

In this case, what is the default set-up for shared-ns1?  Is this
namespace going to be ready right after the two nvme controllers being
realized?  If so, do we iterate all the namespace devices in the NVM
subsystem and attach them to this controller in the initial time?

If so, I agree with this approach.

>   -device nvme-ns,id=private-ns2,nsid=2,bus=nvme0

This must be the case what Keith mentioned of directly attaching to a
controller.  It looks nice.  But, one concerning point here is that, in
!shared namespace, if we don't specify 'subsys' property here to attach
it to directly to a controller, it means it implicitly will belong to
the subsys0 where the nvme0 belongs to.  It means that user should give
nsid different than 1 which is already shared.

So, how do we make subsys property as a mandatory for namespace device
and provide optional choice for bus.  If bus is given to a controller,
then it can mean a private namespace, otherwise it can be shared among
controllers in a subsystem.

