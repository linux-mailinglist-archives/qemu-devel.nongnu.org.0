Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C17B84D9D70
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 15:26:26 +0100 (CET)
Received: from localhost ([::1]:50562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU881-0008Ci-Mj
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 10:26:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU86E-0007Lx-9G
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:24:34 -0400
Received: from [2607:f8b0:4864:20::b2b] (port=37480
 helo=mail-yb1-xb2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nU86C-00075h-Oh
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 10:24:33 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id m67so4216366ybm.4
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 07:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cTIkTj67LJyBCFQiuUXada0ktISuAKDxRtfnBu4K4TI=;
 b=TNTom1G9VfctFh3CKvTCDZokkvT7s+g3UaXsiN79jrMUz/y8oJym/UUG/7r3zsmO69
 8v71UyBpQ6akS3CozOoCbjFIKtaNg72lu1dWZThsY4NU8whyViMdPcSRx4X2wSvQ1vfJ
 OxqcsuJ9W6sppSK1zogC99P8S4N30yFzF4ivW8BgxhRcev+/0Pd21FGVKYExLihvFjEc
 /vtKX8+gKULaS64AJBRRu4g3LE9dCM1XW16Kx2kt6DpqShThQA6EIreEXQ5g/McwwMSm
 LqeQUtl0sebMShb5bw1W/wVevNFQBwJYLALIIXThh9qe8v24xW9KHcCl/1A8Sil0dlbP
 Hijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cTIkTj67LJyBCFQiuUXada0ktISuAKDxRtfnBu4K4TI=;
 b=AZ3C2GAJBFlV4kb4hbwCFvkmQ/lQ3NGQP0/xC/xGl0UAhNt9Pdyo2sfknqjzUvmlUz
 UnO617bgEpy1Znv0XTGShNggGErMs4rkncPPXbzyGXAF6TlYprMI07u6BNgFK46t7q7d
 4NzXqyoAQ6vQQ8H7uUUx7P/MpGigKaAPgw97i8ynXtnrXQmxFQh/Ra3+JxLwgxfWFkpV
 UNbJI6EPKddp4d3D1aQBx3pik/RvaMS2T/C8K/R3cGtqa5L+zYv8H9Kkep8dD1jkaRyJ
 MehiC5cWndt8hhl5jFGUDyKvSgGZbA0a2Hdzwc8sKG9rbf2IDkJrKLHkUj9HZsXT8ERA
 Ax4w==
X-Gm-Message-State: AOAM530VWixlJ3pQ37xmbroJgIIZn2vxhV6ZSZe4RVsn+Qub5FyVcOA8
 XWyI6hGRgNQN+apxc7OrNE4aDUoTH6m61Rp+1YWBPfRIsvpzmg==
X-Google-Smtp-Source: ABdhPJzB2wuJd5Ypc7UoJXpCTkg/Oa/6xjCT8hZy9Saq87A6212lO0sPUFs8Dd2qA7+WB+9JXZVgn1l0I7zGf91YtYo=
X-Received: by 2002:a05:6902:510:b0:630:b29f:ce2e with SMTP id
 x16-20020a056902051000b00630b29fce2emr18054295ybs.67.1647354271808; Tue, 15
 Mar 2022 07:24:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220314093203.1420404-1-pbonzini@redhat.com>
 <Yi9MBGoc3WtOLx82@stefanha-x1.localdomain>
 <4528e387-8016-0774-9c8b-532a75566d9d@redhat.com>
 <YjCdKfbQsgfsw76N@stefanha-x1.localdomain>
In-Reply-To: <YjCdKfbQsgfsw76N@stefanha-x1.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Mar 2022 14:24:20 +0000
Message-ID: <CAFEAcA8zongmSfDAgorr=RfKK6Qsgyi1xNz5KBzdB0RGeSBSWA@mail.gmail.com>
Subject: Re: [PATCH experiment 00/16] C++20 coroutine backend
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, hreitz@redhat.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Mar 2022 at 14:09, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> Also, once C++ is available people will
> start submitting C++ patches simply because they are more comfortable
> with C++ (especially one-time/infrequent contributors).

This to my mind is the major argument against using C++
for coroutines...

-- PMM

