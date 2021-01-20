Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991852FC60A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 01:47:02 +0100 (CET)
Received: from localhost ([::1]:51258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l21eH-0001rb-Lj
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 19:47:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l21cc-0000qa-1d; Tue, 19 Jan 2021 19:45:19 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l21ca-0005rz-8u; Tue, 19 Jan 2021 19:45:17 -0500
Received: by mail-pj1-x102d.google.com with SMTP id l23so1053231pjg.1;
 Tue, 19 Jan 2021 16:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vJl38ZIQEirX/mOVhqBvvGsk7I/xMwb+oeKxCBF9AWE=;
 b=B1HXZYoJeFGnjv418uhQB4coAucnCz+PBs8uK3Gv+8t/ZfnZwPNx5L++SQVm9gcUiC
 zq/t7W6mt3Ui0DonI53zVqeDce3ti/ir0kpXJDiVQF+B6/1/YhhZN4Xe12NJREXnnwEI
 R3UbBD52IOl1DZctvRWcXxvVvRG8IJ4gRGlAsFEz8grosvCpOtgkZTmmanmdYfUbP5jR
 2bhSW2eBk8hOgsIcEtqJSi5RzIbGk88Mm6aVYI6KSR8ZDJ+ExANO9pNtCvWsrN9c9A1I
 alOOfBhnmvtUvRantQH3QTV1fvEiQq+0UfCi92pdX8+KJVm79kirg438fdkc5pkMNOgq
 3Q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vJl38ZIQEirX/mOVhqBvvGsk7I/xMwb+oeKxCBF9AWE=;
 b=RELrhROHq4J2uEkTJkh9PrxA210Egr9P+cCVsMpgD9VdYN0UAl/k+Nxx5gLBWCjFLI
 gZFg3eUDRPhZ3rblT5mg9heGUhYoZkQHdTK5gPPjaImgHijO7A3LQySHkRBuveKkosmq
 HIQ4yRlZ/gm6kwisovodHc8K+o2/V/c3fOYNtubkx4FZgePMKxHZHtPlxgkQBvCNkrUe
 McPocLocAbtJH3r6vcjWDTtcI3hWEwKi7hR4A7UamjOQzdcYXRxdemnFM03bUiGKWOnS
 bd08WHiOCscfGrBdpU02jVLnZBWAAUvHZ2Ab4lcQmpTSJRBW7vS8vzgw6M48Z+kCE+O6
 dgmg==
X-Gm-Message-State: AOAM532j5gKZZZLrEYbCozn4gkRpkjO2cnVFsfMrNVQM31QEOnjolQ7E
 KVKFWKvLZbeEn9VjhUVzOYA=
X-Google-Smtp-Source: ABdhPJx6JZyXn20Ugcckqu9a475pbBTCpNbgqq0Sbk2M+M1AmSo5DNM6NvsEfOjtUnSqj9ejqHqRgg==
X-Received: by 2002:a17:90a:9483:: with SMTP id
 s3mr2481919pjo.85.1611103514539; 
 Tue, 19 Jan 2021 16:45:14 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id q4sm240255pgr.39.2021.01.19.16.45.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 19 Jan 2021 16:45:11 -0800 (PST)
Date: Wed, 20 Jan 2021 09:45:08 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [RFC PATCH V3 0/8] hw/block/nvme: support multi-path for ctrl/ns
Message-ID: <20210120004508.GB4205@localhost.localdomain>
References: <20210119170147.19657-1-minwoo.im.dev@gmail.com>
 <YAciaPBu9TuGjifu@apples.localdomain>
 <20210119192653.GA1520753@dhcp-10-100-145-180.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210119192653.GA1520753@dhcp-10-100-145-180.wdc.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x102d.google.com
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

> Minwoo, try pulling the most current nvme-cli. There was a sysfs
> scanning bug for non-mpath drives that should be fixed now.

Thank you, Keith!  I've posted list result based on the latest one :)

