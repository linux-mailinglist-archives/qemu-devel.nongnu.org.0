Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A69DF3648BF
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 19:08:14 +0200 (CEST)
Received: from localhost ([::1]:47640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXNd-0006cF-Kn
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 13:08:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXLO-0004iN-F2
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:05:54 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:35697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXLL-0004py-3A
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:05:54 -0400
Received: by mail-ej1-x62f.google.com with SMTP id u17so54092831ejk.2
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 10:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iLVje4T3zJgiJ4Ct0hnDjp4CeZhDOX7p+nz3IlOIvBI=;
 b=tdRCk17GYjHU0/hr7Qn0FOjQs/ZfwCizl840SHbyl+P+MTE9M4ODLEi/6B/KMrCzyR
 E1P4QHLGXxkzCU5YIrQ/FnzqnbcNkHoFkLaLXKJo6F+4kU/S5cTUCrDD3hntxzTwYW8l
 RxvLvvxToLYsJ8igAVmVS2IZ5eOmRV2L2lrYR8KsuqYEx49zdMWlxheOLRf5Jfn1ce3h
 e3ivnJdRVCOWXjju1T0m/oURCAAunugpPJEIaBmoThn/xxcYf/V5/FYWE8jzHlkO2Txb
 bA5nsVedKQONiZon4qL2ZdnYBBAo+aTs/LkNU/y9uBTNAhlEwRusSuvx8U4L6hJzoTUA
 8DGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iLVje4T3zJgiJ4Ct0hnDjp4CeZhDOX7p+nz3IlOIvBI=;
 b=tdh0kj+JhKVGfbhRtnNZm1375YLKjRwC4Q6A/BIPlJFPYJKfh8niib32Wvh54eE8T6
 4oITgu2HfKFD0vcvu/YnH+TJcTf92U6a5L/ruX6Z1ckC0HgKVtBVzO0wkC2zLU3AMxM8
 eQiOo3OG4jag7IM8z+ZFBITPeOscbeywSZpkGhfZL+fXJKs4r5ZhI6fb/0XGAamcoMoV
 P6K+UDT9LRWd6lrSWAlcRToAofti1kXzXw3kgF+2izy0rzDNkpMD9nzlNBSOfFDLu+Ye
 U62WD9M/UqyoBq5xPBKK1AZ8G58ENTV0d72hWF3GDGIofC6yU5t5eB1pl7Zpg+KPn4Cr
 UGLA==
X-Gm-Message-State: AOAM530Nt3BFK9pWt+sA29LYSDqA6GTM57xk52e0OaadfThOdeWxWh9f
 HVrWbM91XwQAF1TeikfdHUzED8B+2aRAwm2lQHF09w==
X-Google-Smtp-Source: ABdhPJxvtQM5aSga63XzAuVXLTFwnBC1a42I1wy43WlI5tpcRdFHDAM3B9pQ7Ihr9Izfl1DfFy1Nm/FrOobWklUXq/8=
X-Received: by 2002:a17:906:29ca:: with SMTP id
 y10mr23699078eje.250.1618851948949; 
 Mon, 19 Apr 2021 10:05:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-9-richard.henderson@linaro.org>
In-Reply-To: <20210416185959.1520974-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 18:04:57 +0100
Message-ID: <CAFEAcA8WHe-hhsckBooVACxR+U0FFkYNRALdXCq25hLK8PijqA@mail.gmail.com>
Subject: Re: [PATCH v4 08/30] target/arm: Move TBFLAG_ANY bits to the bottom
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 16 Apr 2021 at 20:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that other bits have been moved out of tb->flags,
> there's no point in filling from the top.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

