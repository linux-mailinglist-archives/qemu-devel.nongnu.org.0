Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E73F316A32
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 16:30:31 +0100 (CET)
Received: from localhost ([::1]:51938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9rRm-0004a1-Do
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 10:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9rPp-0003IE-H9; Wed, 10 Feb 2021 10:28:29 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:41522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9rPd-00088d-LQ; Wed, 10 Feb 2021 10:28:29 -0500
Received: by mail-pg1-x52a.google.com with SMTP id t11so1439719pgu.8;
 Wed, 10 Feb 2021 07:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XVO+gZPYWCUPdud1eL8byZpduAMHl5L0/nfE5Pp63d0=;
 b=JMFpVF8nlJTk4J4RiKq7bBnJFnvEOc3iDE3wL2dblkcXb2PZvJ6ucwP0il6J5HoINr
 xP6yZmSRT/lGbl/RXlk5SnWSjAg5LyLsjlC9iYeCRr+jO4IfahMp3lbcYFueG94JXAkF
 F+j46dqw/tEh/O9KvjmdpwD39GAC42jCj3qWHlUkh1oH2I5Gpp37nOT9hkV5sHvNpDqP
 eQimof2OZT9OSge/wY5iE9/SgG6iYobCLJQJkLh4QYxtFJxjCwNiSixxJA0cpftXFttr
 pFcpQpHNuuXLrcVDkwI+WRYBmlSkApSIaHfjJugHf1u+cpwpkklN5VZnONqVw4WKikQP
 7TuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XVO+gZPYWCUPdud1eL8byZpduAMHl5L0/nfE5Pp63d0=;
 b=In+pevgmgx0bBdX4o+UziHzQk3J3BQNyrDgLFA44D8TjjLB76VmvbXbGk4JRWCNV1G
 CZnW5sAJXDNhUOtUb5cHlBh9A/rWmCA5M+3VYsL+joV+bljo2XcN18jZiSrQC18q8d0w
 l2uUnWJ0jUGQCFVr2c90k1LpHJsZSFBP5j+rJBaJbByzXqHLtv7dpfXJXOlj03C0T4N+
 Oi2Rw56IfS683rU/1Cx7CYn/XZft0p5a2OjEqWCWMhyrETM0PpN+x6bq2nEWg/inekVt
 BYmQ6rgezrKF+iCfeA9kYLQEpmDuRGW0g1T3QDtfNrkermn3SeTuqD2IshtVqmZzYR70
 Sc+Q==
X-Gm-Message-State: AOAM5300om9diTqDcJj0tO6nOVopJHdoXhbpjFC5HOl2OwhG5KV1jiU+
 aPnhWJ05XIi+evDYDwS5mw4=
X-Google-Smtp-Source: ABdhPJxMEo/x31b0sCYe/ZYHBfZloczaXzSqBhru+ho5uRLedILW6uRqQz9F0VonN95QWp2lNoJJQQ==
X-Received: by 2002:a63:df11:: with SMTP id u17mr3543254pgg.345.1612970895844; 
 Wed, 10 Feb 2021 07:28:15 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id z4sm2679130pgv.73.2021.02.10.07.28.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Feb 2021 07:28:15 -0800 (PST)
Date: Thu, 11 Feb 2021 00:28:13 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 2/2] hw/block/nvme: add write uncorrectable command
Message-ID: <20210210152813.GC2325@localhost.localdomain>
References: <20210210070646.730110-1-its@irrelevant.dk>
 <20210210070646.730110-3-its@irrelevant.dk>
 <20210210111432.GC9664@localhost.localdomain>
 <YCPGki8xxU/chdJP@apples.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YCPGki8xxU/chdJP@apples.localdomain>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x52a.google.com
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
 Klaus Jensen <k.jensen@samsung.com>,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > It might be nitpick, 'nlb' would easily represent the value which is
> > defined itself in the spec which is zero-based.  Can we have this like:
> > 
> > 	uint32_t nlb = le16_to_cpu(rw->nlb);
> > 
> > 	bitmap_clear(ns->uncorrectable, slba, nlb + 1);
> > 
> 
> 
> I do not disagree, but the `uint32_t nlb = le16_to_cpu(rw->nlb) + 1;`
> pattern is already used in several places.

Oh yes, Now I just saw some places.  Then, please take my review tag for
this patch.

Thanks!

