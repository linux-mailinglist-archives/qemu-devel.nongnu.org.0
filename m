Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE585F9F35
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 15:13:14 +0200 (CEST)
Received: from localhost ([::1]:57954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohsan-0008DT-Jl
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 09:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohsXw-0005ja-5G
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:10:16 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:43653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ohsXu-0001IX-Fy
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 09:10:15 -0400
Received: by mail-pl1-x635.google.com with SMTP id z20so10323460plb.10
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 06:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DlGgqI62L7OgfrviOXt1HgTQ4eB9ERsnrnYaUsjCytw=;
 b=Rt4+iWvLOotDa8JuIKnFGdEJFttHZdDoquR5FLvmvLuAezAE5SG8IO7Fe8zvD17iwa
 6Tap6mTE1IOwvZig1BlqNpid4B2LM6Zu8J6muTnsN79tfOBWrYkJtYJqEb6PJ9DDeVaI
 1Ql35ySn3a0Rot4H1YkKJU7fMI1xnBHHL+CYk/HPKe8VnkSKmh9kEw7sxXj8C7dOsmt2
 IyGaQcv05WYa88LLIj4ordZFbkQ1LkJsHaZLYZj/IsTv1awwR/mfitueGPNQxNmdJ/2K
 KMYYmleD14f/iwIbetjQAo35BGZK9hrkUyh84KKzIeR6teNjuD5PExkcPu+AzdaCQ/iC
 ePMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DlGgqI62L7OgfrviOXt1HgTQ4eB9ERsnrnYaUsjCytw=;
 b=h7Vi9L4S5t2XHuV9YPwrQB3maYc7yNIYY06+j7hEIOgHjNxUPTy3abyCqExDyowq+c
 csl2wzS9Kl44je//mQcldUcxmswEoFiryvuXjqaixV4v7PCxD2XL65mYBI3bb2WsLdq2
 UG12uHoQiUm2zSIsxXnmDVVerJ/cLaxjcYX2zlJsjPYknxL78XYmD3gaRhPWuwkU1XUp
 NNGd1s/7CScQUHl0bEKA8WfW2EBvU1Xjt+dlFLtZq5+oyEgmGv7bu5sAJAMSbVETgHxO
 JtreO26fmN1G1ELQUjcn/k/wC2LdeRyzUHdKCBCQmBwptKCgx7ZuWb6XiG/9ht/XwJRB
 ShNg==
X-Gm-Message-State: ACrzQf1xYGUkwpESpQWS9/hk8cuui3vBCXbMec5qBNcjm6E0iOcxrzaT
 T7KX46KMdgKaaZqxC1wtfVYVQRI96FRXGm30MsYzzw==
X-Google-Smtp-Source: AMsMyM5l3fu1laOOcvyrlR1RTc7ojzgQMZSLaCBHnJ56AMrWLqfQGsaP8VhuWnYKdN7iJD5uv7ITIFbSMdNu5ozASeQ=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr18857176plb.60.1665407413061; Mon, 10
 Oct 2022 06:10:13 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Oct 2022 14:10:01 +0100
Message-ID: <CAFEAcA__RTAL=DjbZ7pHR9O2x=MytMhEO-b8WtEue2JsPcordw@mail.gmail.com>
Subject: Re: [PATCH v3 00/42] target/arm: Implement FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 1 Oct 2022 at 17:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is a major reorg to arm page table walking.  While the result
> here is "merely" Hardware-assited Access Flag and Dirty Bit Setting
> (HAFDBS), the ultimate goal is the Realm Management Extension (RME).
> RME "recommends" that HAFDBS be implemented (I_CSLWZ).
>

I've taken patches 1-20 plus the extra patch 1.5 into
target-arm.next (last patch taken "Use tlb_set_page_full").

thanks
-- PMM

