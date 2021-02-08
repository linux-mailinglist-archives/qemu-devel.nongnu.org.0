Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C076314119
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:59:28 +0100 (CET)
Received: from localhost ([::1]:59692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Dd1-0001Fz-IS
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:59:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l988r-0002tq-0c; Mon, 08 Feb 2021 10:07:57 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:35751)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l988j-0004wA-LT; Mon, 08 Feb 2021 10:07:56 -0500
Received: by mail-pg1-x52b.google.com with SMTP id t25so10406612pga.2;
 Mon, 08 Feb 2021 07:07:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gs0QBd+kP/lqMhbfgZIIrJZ7OkKGPVIb5Qdhb1YhrW4=;
 b=nDoTYtEeE0NRR5ZtGfaLia4BHY0T3kHrsRYKckuJb3NpQnIKR9YzXVMQQmagbaK+3N
 VxMAqCZgY0gmnLkvi+3INxoc3oUtdWPFtEqZo82zBOwqEZe3xcsc/euo1ytUiSGctFC6
 q8VYvPNPzYhkMvH4itUgpT9YYLRJaPBBBhT1i5xtdUtfZtRue2pU+hp8xIWzhgK7F1dv
 Q2F5ElFHS0rSPjiEK8y45A7V3LRH4GcznpG1815jW7y2XcGwDvqn9mDVZ1X00nG5Tcs5
 DxvIi6jHVWB+O0xus5iPqhCMemMG/qw4OBvHuFJDU4iZ7vyClwymoqEhT+tbpGyMS8Hd
 l3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gs0QBd+kP/lqMhbfgZIIrJZ7OkKGPVIb5Qdhb1YhrW4=;
 b=bpzLPJiNKARKZBZOZJMsPbnz+APmmIHAfY9qE/8r2ETwHus/AkAsfC23RIuC8DmgsQ
 C1PHCxRegrbHXqGhjxUTUGeuEJERi4+k1DZrhtjOm770kHyYF7MwqGr3VYEwXjOdv9Ls
 uSNbu98aUzCx7sD5G7cpjbnr6PmzJV2PR/XV5vsSDNKGQp312RKCC/lSpSF7HD0BZaNu
 vx8+F6iedr2RJ8Qp6oZmtjwoohaxcy8IqeMMmnvHBO/JwRCyXZOvSBmEMEkLwnUZfATk
 KuHF1FYsnvMYVprxZqRM2NLhM9cliDlv0CcBMoojFiw2kBxj5QW9sMsfehrkgqD4rCjT
 M/rQ==
X-Gm-Message-State: AOAM532SxYEHfiZEeR0d1/h6jxTVT5l4owkYhpT0e5k2eMA7P+J4ff2F
 qnOcCdzNQH8e9+i7W2lEhZ8=
X-Google-Smtp-Source: ABdhPJy0uzSvKR72U1LGQc9nFzXamOzq1Y/GaY9O2woMf5wIwm4ZCuDKE9N6+turLlmBGVCFv2Q4Ow==
X-Received: by 2002:a63:4561:: with SMTP id u33mr15037565pgk.277.1612796861017; 
 Mon, 08 Feb 2021 07:07:41 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id bk12sm9994307pjb.1.2021.02.08.07.07.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Feb 2021 07:07:40 -0800 (PST)
Date: Tue, 9 Feb 2021 00:07:38 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC v2 1/8] hw/block/nvme: remove redundant len member in
 compare context
Message-ID: <20210208150738.GB8941@localhost.localdomain>
References: <20210207214940.281889-1-its@irrelevant.dk>
 <20210207214940.281889-2-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210207214940.281889-2-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x52b.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-07 22:49:33, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> The 'len' member of the nvme_compare_ctx struct is redundant since the
> same information is available in the 'iov' member.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

