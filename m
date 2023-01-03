Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9BE65C209
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Jan 2023 15:39:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pCiQc-0002i8-HE; Tue, 03 Jan 2023 09:38:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pCiQY-0002he-0d
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 09:38:06 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pCiQW-0001Xf-Ic
 for qemu-devel@nongnu.org; Tue, 03 Jan 2023 09:38:05 -0500
Received: by mail-yb1-xb32.google.com with SMTP id b16so33337264yba.0
 for <qemu-devel@nongnu.org>; Tue, 03 Jan 2023 06:38:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SiJ+ikJukBPkrKsdFPdO/lz8VOVkQ+XH9oobHdZTWXA=;
 b=Wfk5N+jlOZhQ7M+04vwzAiVJA0U3XCOmW5HdFYg/LTUbUr48js+rJVfcQp6qDXhEZg
 GX0iaPMmXeHXBrEJr+cfLjNmwoEBK4zxdmH+JyeSt+pXwaodZuK7jgBs3sWtUEfXHsf0
 iLToFyZbNdXTlgmrcNFQTMHzZ+ctpLSABG/KLoDMZeoZWhmiqJbMMwMSKjAu1Pm4plFW
 mb5VHrEjuh0Y+0SIDqPBOdl6CmXnU5RvgPiXZXuZ6I4WjxHb4i1OZrVO7lv3Pc5rbopv
 Uml2K+ry2nqTRPKvqp2buuGrpDSYMW7dbOlW5ATe5LsNi5x+ESr3l5dgUN4GsgCzbFEW
 bieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SiJ+ikJukBPkrKsdFPdO/lz8VOVkQ+XH9oobHdZTWXA=;
 b=4qWtnMxo/RQNFSJwIVO52JHuhcpjXIB83AuWUmaGGAzTmHX4dXhd+DDoDZEx6naA2c
 HLtN3H29A9IhJHgjE6U6RjyO01MZ1wtGVbdkH/2m+DO8LB8bJ5pe4ADmKjFjNFG07bye
 DABDkrW3nBgclO+3UGUw7THbHHEIiopHGy+456BUwuogPbLcsMdCP69PtRxP7hpvu3TV
 U85RBDiTcSBCo+hWztU4T3U73qcK2ilA7jviBfrRZjZqv+6e4nr20DlnEW3X7cgOARrk
 /Gs050elBTQ9RDNRGO22Yd5Pri8BtE76hq/2+S82kEgZe0C+RqQ2ICzFgpBIRnBFnTPg
 X5og==
X-Gm-Message-State: AFqh2kpPEo/hMr2fGHpgowa5JsOLNUDnY8Pw3864AZ6uGtN7577UoTvT
 mJYI547p4PZkod7qlhjKZw9O46CdCcCTKQObywc=
X-Google-Smtp-Source: AMrXdXtVhCe9OKE/sk7R8tfOOIwv7Ghz6aVuDG6AwFYy5emCk6giAJ5AfL39UvKcODThwh2HTE0IkUzo0x+yDtDkQU8=
X-Received: by 2002:a25:bec3:0:b0:6ee:f3dc:b8d0 with SMTP id
 k3-20020a25bec3000000b006eef3dcb8d0mr5039085ybm.642.1672756683097; Tue, 03
 Jan 2023 06:38:03 -0800 (PST)
MIME-Version: 1.0
References: <20230102104113.3438895-1-ale@rev.ng>
In-Reply-To: <20230102104113.3438895-1-ale@rev.ng>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 3 Jan 2023 09:37:51 -0500
Message-ID: <CAJSP0QVbvgr6wHY9e6f7UgZ-vum5vGUNH+h0Lf93BpdEcFJf0A@mail.gmail.com>
Subject: Re: [PATCH] Update scripts/meson-buildoptions.sh
To: Alessandro Di Federico <ale@rev.ng>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Taylor Simpson <tsimpson@quicinc.com>, Anton Johansson <anjo@rev.ng>,
 philmd@linaro.org, 
 peter.maydell@linaro.org, bcain@quicinc.com, quic_mathbern@quicinc.com, 
 stefanha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 2 Jan 2023 at 05:42, Alessandro Di Federico via
<qemu-devel@nongnu.org> wrote:
>
> Note: `Makefile` relies on modification dates in the source tree to
> detect changes to `meson_options.txt`. However, git does not track
> those. Therefore, the following was necessary to regenerate
> `meson-buildoptions.sh`:
>
>     touch meson_options.txt
>     cd "$BUILD_DIR"
>     make update-buildoptions

I don't understand the issue. Can you describe the steps that cause
meson-buildoptions.sh to become out-of-sync with meson_options.txt?

This will continue to be a problem in the future. Is there a way to
fix it permanently?

Stefan

