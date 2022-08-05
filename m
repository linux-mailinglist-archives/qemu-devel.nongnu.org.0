Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F6758A85E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 10:57:58 +0200 (CEST)
Received: from localhost ([::1]:59096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJt9Z-0001l7-U3
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 04:57:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJt5B-0004Ah-Di
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:53:26 -0400
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d]:43756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oJt58-0002Ui-Fr
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 04:53:24 -0400
Received: by mail-yb1-xb2d.google.com with SMTP id o15so2809303yba.10
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=PifjoE0qzd+7B0DfCHD1AeSrooxwSqkKnVvCY1z593o=;
 b=cmZ3tA8xMRMsSTRI2Y3KMs9gREi7udcgehR8TFLAWPoYNsW+KwRbj24Wwz2MfC0F6Y
 8TAL+XW/KNm76xs+sq1Z/wrqVzHGh0r78bOjkN/7RpE6T5DfGQ3YOGB9R8mp2hOAUzu6
 Tj1BhfxjxnMq/LL6t+yZ028etWoovU4WU+9yLtjx6EyTEghvAVmWjEPcS5xX42bX/CZ/
 AVPgq5LKXlUo+J7SKMEZAkEF/CLv8JexjFSRv/mjl1HeeauLlzJgMVVcgxy3mMAk3hUI
 2PvMwIo8CdlKsixld1CrTIu3HQhmu0gUsVtv9iAB1AanqDFNvMrhvu6/u4anhSoqxdPC
 5q2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=PifjoE0qzd+7B0DfCHD1AeSrooxwSqkKnVvCY1z593o=;
 b=bHlgYcpxfq+j/eVni7zWAXkgVDq6rYPR8wsSH04nuvHisoWFqYS8vsqh2vqnos2ORQ
 kCrSYDI8agGZ77y/bMVupd1bhNoga1yT/tRWhxN0zmDvTJtgK4naF2Ye9OldP1YwU7P4
 Cj/dyPq5Q4vmBrS6m1elE/R7tRlg4ovQq+0GRVQgkgc0W/EdM7PePTxQKL547DErLaO9
 K4WZBsAx7V5LTqu/ynwuC0KdfS9qxqDJCNbu7PdFtqnhra67qlUYVa6O432DM4rL1iiB
 kCiB6V+qn3oCIQ/UNwPPYnTImBBtYjvgG17k65Z+rXe9vBWoT7rv1E93yRZC+leWgiFP
 2Xcw==
X-Gm-Message-State: ACgBeo3MySiE7vjV4HijyvbJ7aO7c4v/+0fsQF0aQlQ4NuSejCtoE0AV
 mCgCduWXEy7lDe/1n/tY3JRX4u32UMFOLhLXdWqTYw==
X-Google-Smtp-Source: AA6agR6yn+W0DGc3Hx3x5Ly3TOtKjAJ8UH1VF1CfXGVnWKGX0cN100mHJfAzC/VdXiVc4NEIUREgbv3oBtfoxBp1s60=
X-Received: by 2002:a25:d617:0:b0:671:79bd:69bf with SMTP id
 n23-20020a25d617000000b0067179bd69bfmr4565492ybg.85.1659689601249; Fri, 05
 Aug 2022 01:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220802080948.37426-1-chen.zhang@intel.com>
 <CACGkMEs4Ypb+WcKTX-YqxrRUJW65fWokuBaMAkBp9eznXNDGTw@mail.gmail.com>
 <MWHPR11MB00313220A2758E74C1098E539B9E9@MWHPR11MB0031.namprd11.prod.outlook.com>
In-Reply-To: <MWHPR11MB00313220A2758E74C1098E539B9E9@MWHPR11MB0031.namprd11.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 Aug 2022 09:52:40 +0100
Message-ID: <CAFEAcA-91NQT1ETPqygSF45irYf5Wf6uFWocUp0qZ0Yu0JsGgg@mail.gmail.com>
Subject: Re: [PATCH] net/colo.c: Fix the pointer issuse reported by Coverity.
To: "Zhang, Chen" <chen.zhang@intel.com>
Cc: Jason Wang <jasowang@redhat.com>, Li Zhijian <lizhijian@fujitsu.com>, 
 qemu-dev <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 5 Aug 2022 at 06:56, Zhang, Chen <chen.zhang@intel.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Jason Wang <jasowang@redhat.com>
> > I wonder under which case we can see data == NULL?
> >
> > AFAIK, data is either dup via packet_new() or assigned to a pointer to the buf
> > in packet_new_nocopy().
>
> Yes, you are right. I just checked it for hint of bugs.
> Do you think no need to do it?

If you think it is a "should never happen unless QEMU is buggy" case, then
 assert(data).

thanks
-- PMM

