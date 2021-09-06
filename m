Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC504015BB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 06:39:26 +0200 (CEST)
Received: from localhost ([::1]:51452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mN6Pl-0006MX-Ar
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 00:39:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1mN6O4-0005cc-Ug
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 00:37:40 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <viresh.kumar@linaro.org>)
 id 1mN6O3-0005Wv-9Y
 for qemu-devel@nongnu.org; Mon, 06 Sep 2021 00:37:40 -0400
Received: by mail-pl1-x629.google.com with SMTP id n4so3159825plh.9
 for <qemu-devel@nongnu.org>; Sun, 05 Sep 2021 21:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=I9G1ObWLnPvlLJDfSeBaDyssTbNMgPjau+U2x7aztD4=;
 b=s/Cs9HF/nzzqdhhtdiDA6HN9+kufcHADiftXSoIEQhAAw2MKxPFAVdWosPC/9g0Fze
 CKsuWcdkr0pP5MOgsV8O9FPdCBX7erPzqJ6oPALww+qDlOl/EP2WhErBGyg5fR7FoZMS
 MEiip+cVClaBXk3M6i2IHBz4H409EQB79ycEeGlRucU3F5xREPKoOY2mDnUNNTtkEoTN
 VfQxv87UWtunUlqn6gRdlqpevjbtbcd6f3HggFeG5mTGHHFcO/WgCOA6bc8PzOil3nGM
 7/Rw2YRv+R66zDbo+mY40g9TqazKC5EfVSA1fxHtzLewmRw8UBCbfKyJFsAgWy+7mVUK
 2gAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=I9G1ObWLnPvlLJDfSeBaDyssTbNMgPjau+U2x7aztD4=;
 b=NgEzTzru+oB+8pGJHnLvjBiwu/E3BO9Am75Ck1X1xmzGUmqr+IhEDC9+jBZFh05BX9
 WSmTL7hJeb17nBSCm274YPJCkt4kZrhAT0t00bYef9iheOi5cT0GDBrZ6M+3tulv+9/6
 KXmNRSS83lFOiQmQRBL/8Wu6MCaGE/nXqkk26yF/5UgwZkiCf/Sz8cmoWzhpdM03VEbk
 v2+jdGS8HOL1cGZhTbzcYqx7w/Z+iATytp/vXl1ZOJ6qdX1C5CFMWbHAJN+5p2MMus7T
 xHSIRiHBVjE/uz0pvG4I6SYWiVO/AiNV6KKwwSsJH60l/dmGHpH2s6ONpebjKRfczJqH
 vniw==
X-Gm-Message-State: AOAM530J3UGeCAVRwlX8H+L3H/rG/yX6qohgJZ99vhYd1wMtFmFu9iJV
 Hl0IL/xHsQUywJm9FRgAoblldQ==
X-Google-Smtp-Source: ABdhPJwRB9n4sAIgn9Vkwv0lYKAqR7bKPctbfly5mYwXfr/3W74gt8PQI7RDfROKQ+SVY4Y+1RPkkw==
X-Received: by 2002:a17:90a:898c:: with SMTP id
 v12mr9530858pjn.160.1630903057169; 
 Sun, 05 Sep 2021 21:37:37 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id p12sm5802585pff.106.2021.09.05.21.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 21:37:36 -0700 (PDT)
Date: Mon, 6 Sep 2021 10:07:34 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH V2 0/3] virtio: Add vhost-user-i2c device's support
Message-ID: <20210906043734.mp77kra57mhdkog6@vireshk-i7>
References: <cover.1625806763.git.viresh.kumar@linaro.org>
 <20210904154310-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210904154310-mutt-send-email-mst@kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=viresh.kumar@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, Jie Deng <jie.deng@intel.com>,
 Bill Mills <bill.mills@linaro.org>, qemu-devel@nongnu.org,
 Arnd Bergmann <arnd.bergmann@linaro.com>, Mike Holmes <mike.holmes@linaro.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04-09-21, 15:44, Michael S. Tsirkin wrote:
> So I'm not sure whether it's appropriate to merge this right now.

This is already merged.

> There are several spec change proposals before the virtio TC
> and I did not investigate whether this code reflects the
> spec before or after these changes.

I believe you are talking about the zero-length stuff, right ?

This patchset doesn't depend on that and won't change with or without
those patches. The backend is implemented separately in Rust.

https://github.com/rust-vmm/vhost-device

> It seems prudent to wait
> until the spec changes are finalized and voted on, in any case.

I will update both the Linux driver and Rust implementation once we
accept the changes for spec.

-- 
viresh

