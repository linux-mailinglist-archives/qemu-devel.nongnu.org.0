Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658F02FF901
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 00:41:58 +0100 (CET)
Received: from localhost ([::1]:41480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2jaP-0003IE-1x
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 18:41:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2jZ4-0002XG-UK; Thu, 21 Jan 2021 18:40:35 -0500
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:40584)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2jZ0-0006M3-PZ; Thu, 21 Jan 2021 18:40:34 -0500
Received: by mail-pg1-x530.google.com with SMTP id 15so2417504pgx.7;
 Thu, 21 Jan 2021 15:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=G90IL6oNoWqsY+m0qtRdx+B4dDYOQwNEG0Sh4L65Qyk=;
 b=on8cbQsMqBLLNhX7wTsSvhq02MESyfnuoftCbyX8MVWxYR87Iy6PDMKdBxaFyKgZ4B
 fKvQ1yIFU74ahOKSlrzpNnDMdgJ9ZrUPCM1tV6ga1v8gcQIHc0yjugnm8uOgKwae/p7s
 3xetIczLEWLquZcxxtVTlgP05Pwxfhuaglfh17qIPdl6vkhukyuRuHOpNhQOpbTdJFSM
 fIpRtuis/K1sXG+RQ5cqvqn7mibfq3o+QL/EIEVzvJPspHmoIfhTpW3Tk5LzpA9A1NNk
 aVd9J/fSjWB2LAAtk9uyoY41UFaTommLVb4IFUJHEEl7GFupczVnfUtTmuLmiyWwoukp
 QgxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=G90IL6oNoWqsY+m0qtRdx+B4dDYOQwNEG0Sh4L65Qyk=;
 b=ijd3wMBIh4w1dx83eJaAWIcAXrdgwF/xK95d0CagqvUrgdpidQgXwrsgNrKl5A53g7
 TckiPNd1jPQiYOMX/bZJLFllJZj1HdyhOkGvpmy1lO/B1jhHWYVNX6asIqkSyJfiDF9C
 XCxwi38I/GD9wqMFW6BNxyioq1YlJ6zWn/FdeVqS1YBx/kWOTk96nu6e28s2RcWOiW64
 1A5djWO1x7JzzDxIWuFC6ONA6VUhS2BVb5GCaATBbLOF/cdHKe15uwPa0GV3Q9ZDdNlv
 dkxNcvxSYZbAQrar6u8RIArZq8pZFFnhjl1QDbO+guWU5qkqPYpVbWZ0u1T/UVG3tI03
 YgHQ==
X-Gm-Message-State: AOAM531T6N/Zz9sSh9i0i4aCYxfFyN5ts/MKr/PAaiz8FbkxePAi6hLI
 4GfmUMJDWmMootv5GVOI9cI=
X-Google-Smtp-Source: ABdhPJzSVv1kSdJoFuU3UjTti7ZHCcMmWhthSmFRM+zK79rnIHRAzxM+p9e7ZyqGndfQhXG9hx8DHA==
X-Received: by 2002:a63:4301:: with SMTP id q1mr1769680pga.430.1611272429025; 
 Thu, 21 Jan 2021 15:40:29 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id t2sm7271884pju.19.2021.01.21.15.40.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 21 Jan 2021 15:40:28 -0800 (PST)
Date: Fri, 22 Jan 2021 08:40:26 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH V4 1/6] hw/block/nvme: introduce nvme-subsys device
Message-ID: <20210121234026.GA2746@localhost.localdomain>
References: <20210121220908.14247-1-minwoo.im.dev@gmail.com>
 <20210121220908.14247-2-minwoo.im.dev@gmail.com>
 <20210121225202.GB1727271@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210121225202.GB1727271@dhcp-10-100-145-180.wdc.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x530.google.com
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

On 21-01-21 14:52:02, Keith Busch wrote:
> On Fri, Jan 22, 2021 at 07:09:03AM +0900, Minwoo Im wrote:
> > +static void nvme_subsys_setup(NvmeSubsystem *subsys)
> > +{
> > +    char *subnqn;
> > +
> > +    subnqn = g_strdup_printf("nqn.2019-08.org.qemu:%s", subsys->parent_obj.id);
> > +    strpadcpy((char *)subsys->subnqn, sizeof(subsys->subnqn), subnqn, '\0');
> > +    g_free(subnqn);
> 
> Instead of the duplication and copy, you could format the string
> directly into the destination:
> 
>     snprintf(subsys->subnqn, sizeof(subsys->subnqn), "nqn.2019-08.org.qemu:%s",
>              subsys->parent_obj.id);

Oh, Thanks. Will fix it!

