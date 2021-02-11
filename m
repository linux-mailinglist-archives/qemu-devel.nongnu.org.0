Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CADBA3183EE
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 04:26:02 +0100 (CET)
Received: from localhost ([::1]:50862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lA2cD-0001eT-F6
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 22:26:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lA2aD-0000b1-Nx; Wed, 10 Feb 2021 22:23:57 -0500
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:33947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lA2aC-0004pr-70; Wed, 10 Feb 2021 22:23:57 -0500
Received: by mail-pl1-x632.google.com with SMTP id u15so2543708plf.1;
 Wed, 10 Feb 2021 19:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=knXuiJey+6l/92Y7K6EzVuc+mkI6La6zzEeKxwq+yFc=;
 b=JNB8DToLLLS+zdlJ5SgFFK4JGW/XngCnexU8D+/sVkN+qjXVsayjOufuaGcbt0Ef4z
 9ICfnDUVI2ADCDc+4jI0qRHufHdiCVgYipkeHeQpnOAJOsv/PV0jhbugV5B3jK7FeEyz
 eFwE1o2oNoxT5dx3Bll4Ecc34xkPoOW74Yj/0DheOxfCFCkhmUNF6C5/itJS8kWt41D1
 8mzY3oYSe08KBXircWZv9KgLy9iG745N7PBJq5Zoea0L/ztWJKTCQBXd1oVtAKZMxhKC
 jwGeT2Qbga1eIi/nw6B0PweJqYmY2CejAjBQzihn4ksxmMmRE8exl9rB48/fZKYf+i4C
 1Eqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=knXuiJey+6l/92Y7K6EzVuc+mkI6La6zzEeKxwq+yFc=;
 b=IKuW4Dib+xje6GtkXSmhWLqb0WvLNvnkRO7Rp5/ORgwfJce1H/hFti3JYXC0150gU6
 shDSSE7kIeDAf8XXSHfWeaD18tpAxub2QDt1CJt3qF0u6uRvrNGku24qoi/wfb1axC4q
 UXp0qOT4jb5q7ZoC27TwExqf/PA8Q7WerXmCQ8P2Sq7mlgDRydepqY+klD1m9QgzfY6n
 QjUa47n3y4voVjWKoHqLND8A9lCmNjXVbow9X8lmQ7FHMeYjyixgfzLreedzjeSBjexv
 ApeSOl7Xumq8+YuNyeYxOl3xaEX9oa6dohL3gdhE3KmPVKBAd9n2IPKNi9ia1/xKXcN8
 8a5A==
X-Gm-Message-State: AOAM533rwo/PNPN1RuujPXLMwTU/H3UYJdfnAyT/egYmGld4FrkbvMYg
 okLSmP+I7e5KGH8ucmYn37U=
X-Google-Smtp-Source: ABdhPJxYRKM2QH6xKUYpym9CiIsYxjFKF/7GmfvFH09AMnr8QLTTrpOopla4XuOSpQC0bFsSlsz2dA==
X-Received: by 2002:a17:903:2306:b029:de:18e9:f439 with SMTP id
 d6-20020a1709032306b02900de18e9f439mr5929781plh.38.1613013834418; 
 Wed, 10 Feb 2021 19:23:54 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id g7sm3588327pgg.50.2021.02.10.19.23.53
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Feb 2021 19:23:53 -0800 (PST)
Date: Thu, 11 Feb 2021 12:23:51 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [RFC PATCH 3/3] hw/block/nvme: add nvme_inject_state HMP command
Message-ID: <20210211032351.GD24885@localhost.localdomain>
References: <20210210195252.19339-1-minwoo.im.dev@gmail.com>
 <20210210195252.19339-4-minwoo.im.dev@gmail.com>
 <YCRDLk8e1A4mxbYd@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YCRDLk8e1A4mxbYd@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x632.google.com
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
 Keith Busch <kbusch@kernel.org>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-10 21:33:50, Klaus Jensen wrote:
> On Feb 11 04:52, Minwoo Im wrote:
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
> > 
> 
> This is super cool and commands like this feel much nicer than the
> qom-set approach that the SMART critical warning feature took.

This interface is super easy to inject some errors to the running
device with a function call-back.

> But... looking at the existing commands I don't think we can "bloat" it
> up with a device specific command like this, but I don't know the policy
> around this.

Me neither, but I've seen the PCI AER error injection feature from
the existing commands, so I suggested this command to control the
NVMe device itself like error injection.

> If an HMP command is out, then we should be able to make do with the
> qom-set approach just fine though.

Hope so.

