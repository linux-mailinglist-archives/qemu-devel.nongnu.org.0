Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB352FDC65
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 23:24:33 +0100 (CET)
Received: from localhost ([::1]:46704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Ltw-0004La-7b
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 17:24:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2Lru-0003Sq-OS; Wed, 20 Jan 2021 17:22:26 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:51309)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l2Lrr-0002M5-Lf; Wed, 20 Jan 2021 17:22:26 -0500
Received: by mail-pj1-x1032.google.com with SMTP id y12so3091598pji.1;
 Wed, 20 Jan 2021 14:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yQhpZ5m2TAfpymIa9INYQdstPu0umbaEZF/uTq2krwA=;
 b=n2JBXNNPJe8qjI71hjyP+jERI7cIYAASDdxea3UL4ZYDY2jjLJ7ugdwfDqbXzvcrn2
 PM/yhih0dGjBsQt+RtxPduekf8zp2mXl09Z3Q3INDfhaMrK/U2OVjQKY2QlvwQp112yP
 b6Fokq1U9E6BBrE6k719JW7yoXw2cyBTmiQSjQzzKh2FsWNzIjdlMxIlHY2fr2d2Z6my
 VXHt9rYRt0tx/6kM+EwmQseKjnN9NQUl6/YSjL36dokr95XUopFiivNivbSKUj6JeGQ4
 Gp9hOHT+1bXtdCsMjZxfjnDZ05DPPOV0TgQ2nuIKsN2KWbwSbzbgI24WR9saeOjlPj8H
 aeVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yQhpZ5m2TAfpymIa9INYQdstPu0umbaEZF/uTq2krwA=;
 b=WRYKRuVwBXorp8y65ZNtCX1Ud+NNxDCOLA+o+9cxAloPvaj0VIgk19udWA7k37Kc++
 QNpkOxH3LgVEON5OCIViw+DjEwUFpnw15+m0Mxnv/pfbfUfZFWJsDeP9RrWLbfOYrgip
 zhif0/1+dQj8GMqioli9WBSCI62n0VNvfi1lZ9aRn91Be4oLE2R7TGus4yjEJZTFPQrb
 TvlvP6kTP3UonKYNY4S4VScuYdsj/ZNg843qFkeTBKwUyCzI6kyL5CC7uOCvWdxQZc1U
 ZZejMmsJwZ8lSNR6amoM2cadTj3QmJp+YuuJ+UwfWTN7fAtsP1hzRgDvrwX8smlzyarw
 cFNA==
X-Gm-Message-State: AOAM533+lNaPznV6hFHVDY9xzP8EBaWSTyjpSiIuQoMpRKTQJe4y4AYn
 2F0/YhqbQiEO8nQX1BxnaFI=
X-Google-Smtp-Source: ABdhPJwWueeDpISqkU2/nOInrrb1NiSSxgHkU5rDiaSDA9HUeMySN55c27pN406uPMHDMn5GTflt9w==
X-Received: by 2002:a17:90a:540c:: with SMTP id
 z12mr7999264pjh.58.1611181342059; 
 Wed, 20 Jan 2021 14:22:22 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id p7sm3324032pfn.52.2021.01.20.14.22.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 20 Jan 2021 14:22:21 -0800 (PST)
Date: Thu, 21 Jan 2021 07:22:19 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v3 10/12] hw/block/nvme: move cmb logic to v1.4
Message-ID: <20210120222219.GC2645@localhost.localdomain>
References: <20210119101504.231259-1-its@irrelevant.dk>
 <20210119101504.231259-11-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210119101504.231259-11-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1032.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Padmakar Kalghatgi <p.kalghatgi@samsung.com>,
 Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

