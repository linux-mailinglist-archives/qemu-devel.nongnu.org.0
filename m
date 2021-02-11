Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB9B2318409
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 04:40:24 +0100 (CET)
Received: from localhost ([::1]:56770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA2q7-0005El-S3
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 22:40:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lA2og-0004Ta-5n; Wed, 10 Feb 2021 22:38:54 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:45232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lA2oe-0002aB-9X; Wed, 10 Feb 2021 22:38:53 -0500
Received: by mail-pf1-x435.google.com with SMTP id j12so2815980pfj.12;
 Wed, 10 Feb 2021 19:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HTJ43XPuJUuDO2MAd+DwN+kXJ2KunylrYdartJE7BTE=;
 b=JKcq47jnU5d3lZqmHQmzr3pFoTmaIrrR+q5cpHDfUlCq7jd19D3q2iFNqWscBrn+bo
 FfRIuPcB22YmueKunqaEOY1bQ1Bdup/oY7YkN7QFgKPxEDvxFJkm9QVEifJGfNYKC0xl
 277sI3W5ywlYNRe6BFWk2ymvwMg1ANDPgckchtTLEukLSqY3B3UDX9RTVRawG49L7arP
 KjAHAAqK3y7bQo/3D0ziazYgmp/VEQX4BtoSDKHupJHpt9ZUYUJMMRq9OMROcXADU8gM
 pjJlDpGO+aZHv0f6IoXnmu8s5f+VOn6IntXGyxx169CyiDIKgv7XtPv+Ut27e8vExexT
 MqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HTJ43XPuJUuDO2MAd+DwN+kXJ2KunylrYdartJE7BTE=;
 b=eOTfszrfoIex6H6xt9u3NWSkXG3fYn2UeK8zfYYyPKaxyxxibza8K72hNbUimeH8A1
 cL1chjuEl7lZWCxg1poaAs1otQOkKUhW+7fYoRvq+PSAETf8UfsRDQT8ln753jv3I7sQ
 h7Zydx1OXDAWorB1vR2xd0hSFL2uc+Tf1sJvFqm1ubrvsvbxextwATwXTDn31d5sPU7N
 hV58qtLgIeoby3jGdyH8XSAB7iSrTrcP/f/n+AH3AgkhWcpoQOrzqXw6TzZ3/+H8wK5H
 DTagJoCNqXLucL8JmhYvB04yHZ8ysc50Vq6qroDo1jt8qQKIx02uaKfc9+r84ipANlQq
 G8UA==
X-Gm-Message-State: AOAM530xY+U7/sgfK7KSM1AHTQdt3wcWI6C6prAqTs6BYcHumcmxUv+9
 pp+VSKgn/dRIX5RoCDW3cUY=
X-Google-Smtp-Source: ABdhPJwR4E3HBOJndHEHCL8i40SNws9cgaM6QrCFjdQNmLYPePxIr04SQSdAy1V1+B5pwK7wmwxrAw==
X-Received: by 2002:a63:884a:: with SMTP id l71mr6023823pgd.75.1613014730319; 
 Wed, 10 Feb 2021 19:38:50 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id e15sm4098883pgr.81.2021.02.10.19.38.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Feb 2021 19:38:49 -0800 (PST)
Date: Thu, 11 Feb 2021 12:38:48 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [RFC PATCH 3/3] hw/block/nvme: add nvme_inject_state HMP command
Message-ID: <20210211033848.GE24885@localhost.localdomain>
References: <20210210195252.19339-1-minwoo.im.dev@gmail.com>
 <20210210195252.19339-4-minwoo.im.dev@gmail.com>
 <20210211030011.GD23363@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210211030011.GD23363@redsun51.ssa.fujisawa.hgst.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x435.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Klaus Jensen <its@irrelevant.dk>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-11 12:00:11, Keith Busch wrote:
> On Thu, Feb 11, 2021 at 04:52:52AM +0900, Minwoo Im wrote:
> > nvme_inject_state command is to give a controller state to be.
> > Human Monitor Interface(HMP) supports users to make controller to a
> > specified state of:
> > 
> > 	normal:			Normal state (no injection)
> > 	cmd-interrupted:	Commands will be interrupted internally
> > 
> > This patch is just a start to give dynamic command from the HMP to the
> > QEMU NVMe device model.  If "cmd-interrupted" state is given, then the
> > controller will return all the CQ entries with Command Interrupts status
> > code.
> > 
> > Usage:
> > 	-device nvme,id=nvme0,....
> > 
> > 	(qemu) nvme_inject_state nvme0 cmd-interrupted
> > 
> > 	<All the commands will be interrupted internally>
> > 
> > 	(qemu) nvme_inject_state nvme0 normal
> > 
> > This feature is required to test Linux kernel NVMe driver for the
> > command retry feature.
> 
> Once the user sets the injected state, all commands return that status
> until the user injects the normal state, so the CRD time is meaningless
> here. If we're really going this route, the state needs to return to
> normal on it's own.

That would also be fine to me.

> But I would prefer to see advanced retry tied to real errors that can be
> retried, like if we got an EBUSY or EAGAIN errno or something like that.

I have seen a thread [1] about ACRE.  Forgive me If I misunderstood this
thread or missed something after this thread.  It looks like CRD field in
the CQE can be set for any NVMe error state which means it *may* depend on
the device status.  And this patch just introduced a internal temporarily
error state of the controller by returning Command Intrrupted status.

I think, in this stage, we can go with some errors in the middle of the
AIO (nvme_aio_err()) for advanced retry.  Shouldn't AIO errors are
retry-able and supposed to be retried ?

> The interface you found to implement this is very interesting though.

Thanks, I just wanted to suggest a scheme to inject something to a
running NVMe device model for various testing.

[1] https://www.spinics.net/lists/dm-devel/msg42165.html

