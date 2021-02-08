Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C228314167
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 22:13:30 +0100 (CET)
Received: from localhost ([::1]:35650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Dqb-0007op-I6
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 16:13:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9890-00033n-7D; Mon, 08 Feb 2021 10:08:06 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:35759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l988w-00052E-KG; Mon, 08 Feb 2021 10:08:05 -0500
Received: by mail-pg1-x532.google.com with SMTP id t25so10407338pga.2;
 Mon, 08 Feb 2021 07:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/DKSkb7Ve2u6ffGykzfFHGnzRFZ2VIx+3IIl5BU45RU=;
 b=izT9FihH1pM86ttY49LfaAY83VVCValr91SIZZN6hcOiBCWziyCVx5qXx6A03D/iE8
 8PL9gPRu5Q5E6JhD+Vx+1mYO04C0pGiF/EU07KOP55glICnBaLsTVX4675pNctFTx8Ec
 jhpA+bKo+s1itlqq2WDTQfqlfJ+BOpJR7rreYmmx/TJ10Z9iaH3dhz27ciHrnoeDI6IF
 ZH5OO7kIDgQYLBKeNntq7RRKomlRIrqn0iugSLdvv1SOGaD/UCz/ZFgUr9QKvmwKZuRz
 KaBSQ6s/h3QL8WX4nF20I/DEuPIbo6SPUtuc+BTvT9sUADiCoMl7P/T2fVPpq8qbEve/
 e2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=/DKSkb7Ve2u6ffGykzfFHGnzRFZ2VIx+3IIl5BU45RU=;
 b=D5V1pp1MVub/ZMUSo27Korbc95AUq6X3fjrXGctEw7SuyefDzIftg/NfWn0yABlUic
 UW1QGmKeTOL8smdW4cy3XR1mGmzOqQzF9eK6U4Cw7wzSywT9YafFZmk07cH986ibPYBE
 VLt3nuwiCPHOMpPpj0e7xNRYr9qkvOf8EXlGmoLAngDCnroNO5Kc/Z0lkrQMlrtHQVqR
 mJl5M/iFVFrOvyWLGBXEbd9JbGvowcrK7QnzlN3AVB2Fq7iHzBZd7NcKFfAoB+F594Ym
 5NLS2GDk1HhvS9SuwCKtJLCC6t6b5ZLh1Wnrlwk45oRx2tlc7CCFE1uz7XtnJScoAoI7
 UbWA==
X-Gm-Message-State: AOAM532fS1DKOPQhljlkBleBzJn/gM23sRPzeBnDmCp51qdc8sV8skNO
 Ie+SMpy5CeGu2ztyh9ofgAs=
X-Google-Smtp-Source: ABdhPJyq/e6Z9AGE4LRpEe/FzcbcPZZ+sFAmWLfsanmiFEpk59oMVwvgimaKh5hcqGMpuLhV2jHH2Q==
X-Received: by 2002:a63:e10b:: with SMTP id z11mr17313231pgh.40.1612796880939; 
 Mon, 08 Feb 2021 07:08:00 -0800 (PST)
Received: from localhost ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id q196sm7143034pfc.162.2021.02.08.07.08.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 08 Feb 2021 07:08:00 -0800 (PST)
Date: Tue, 9 Feb 2021 00:07:58 +0900
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH RFC v2 2/8] hw/block/nvme: remove block accounting for
 write zeroes
Message-ID: <20210208150758.GC8941@localhost.localdomain>
References: <20210207214940.281889-1-its@irrelevant.dk>
 <20210207214940.281889-3-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210207214940.281889-3-its@irrelevant.dk>
User-Agent: Mutt/1.11.4 (2019-03-13)
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x532.google.com
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

On 21-02-07 22:49:34, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> A Write Zeroes commands should not be counted in either the 'Data Units
> Written' or in 'Host Write Commands' SMART/Health Information Log page.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>

Reviewed-by: Minwoo Im <minwoo.im.dev@gmail.com>

