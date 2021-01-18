Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 380E42F9FA5
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 13:31:21 +0100 (CET)
Received: from localhost ([::1]:56672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Tgm-0007wg-8Y
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 07:31:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1Tes-00073c-WF; Mon, 18 Jan 2021 07:29:23 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:35053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l1Tef-0001BA-J7; Mon, 18 Jan 2021 07:29:18 -0500
Received: by mail-pl1-x635.google.com with SMTP id g3so8586592plp.2;
 Mon, 18 Jan 2021 04:29:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=yQhpZ5m2TAfpymIa9INYQdstPu0umbaEZF/uTq2krwA=;
 b=qIW5xlpBGx8wmoGfC1wsHBIT7xrPENIlIKfMbk9X5Pp7/P3gGhaHVpfnMo5XTWvCjG
 wGTi13H6vptrUiLS5ciY4vwwPxx9eYndwbAMHXEy5SGT+BHIhlw8yF6YF7lnHH074Lmj
 ElQdE7DO65RclRJ/ZM0MFFkQ8jnZsRAbSRV0Vk2i+/Zy2IYy9lYBh3NUSAI4lRe51ae3
 FN49IHjTwEc8C79em3r2n16R4DWryKrQh7nEr1280MUVvf/UCTPVeKYXtLHtpMPu9dsw
 mm7ebSorZ3CIOGX14PeUI2l4XiM/ln4MyhvuA7GpxtGKjoqNzO5g6eXs6KGqgEt1iaEM
 hlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=yQhpZ5m2TAfpymIa9INYQdstPu0umbaEZF/uTq2krwA=;
 b=bQZ86ez0GX7wQ2Rwn2Ba+HjP75Va6zuZynAbsaDjUnZGA8OAPYvAxJ8/7uwZ7MPb4a
 dl8nUCXBlAY1HhuP0IIvbVv9uRJRygL25AOKnRrQdvOIDGvZ03vfAMVm4jhCd9e6Xh3D
 EeFr8Bifh/HQIpewHs/zwCIv8qN6fPznWhWuYmxRlXeQFhBojeZofVJ+V7svzIFzGnAE
 /ZXza6ZZXRPdGV1cWvSSGkGRrjGsjajtpmoof2ymtEVatthLdDqfk36tiwOMGytOiD2A
 byMIKO9di+A1E+XpJu/70DSYevZE6xsTmYSbOfo2sN5WF2FKXqe0zZHZz8eisBkdyYyy
 H+Wg==
X-Gm-Message-State: AOAM531lx9ant05d4ELPDMTLenHAe5fIqdzzGTRllz1LBZZWvy+nnApH
 bUeT+u9f/jITDsTm05LaeFY=
X-Google-Smtp-Source: ABdhPJxA19jKbJPnnwiIXM7ingTLrXbbnQn6ALA8de4LisIsBumWqun18CgnoeJH4l9/BiVDL5eNNQ==
X-Received: by 2002:a17:90a:7142:: with SMTP id
 g2mr26686536pjs.92.1610972947859; 
 Mon, 18 Jan 2021 04:29:07 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id a12sm15967227pgq.5.2021.01.18.04.29.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 18 Jan 2021 04:29:07 -0800 (PST)
Date: Mon, 18 Jan 2021 21:29:04 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 01/12] hw/block/nvme: add size to mmio read/write
 trace events
Message-ID: <20210118122904.GA18718@localhost.localdomain>
References: <20210118094705.56772-1-its@irrelevant.dk>
 <20210118094705.56772-2-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210118094705.56772-2-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x635.google.com
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
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

