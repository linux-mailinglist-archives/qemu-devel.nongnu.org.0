Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C45F55BA25
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 15:53:14 +0200 (CEST)
Received: from localhost ([::1]:45192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5pAv-00065r-J4
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 09:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5p8S-0003tI-FS
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 09:50:40 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:38826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5p8R-00058I-3I
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 09:50:40 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id d5so16857653yba.5
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 06:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eEYIfavmMYabdYrPLUdHZE9IJv7ZbjUo4C9kkdj/EwI=;
 b=jP8qLHWSVpthkgu2eE+2P8nyd60elXMMMzDCumktJ8BEFb1zYa+vPB1ZKYbbBLkqAx
 NmJQpo/wUPYNh8lEkKymR4w4Bka78nR7wAOTv7x+gtzzrE+f0dLrKDNGVbapa7ZUhu6E
 4l4saXsC4CA+Jgqhh2gToOmbTV7fbmCZ6HzWUNmtod9CyN4lQ0wBBe5XnzmJaxdDmOUs
 WJVuKd4PLwY/pJnF9JtDtYqL7lVCerwDts151mhlConsaMNtjiZawBSu/vFs8O6WtOHy
 JKMJ+B/oSbC6tOno9WyhkWSN/mXdVRu9HP/6eQJYQpfpb+qZxzs/v40Iwsc9OlHe92Cp
 Pa7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eEYIfavmMYabdYrPLUdHZE9IJv7ZbjUo4C9kkdj/EwI=;
 b=NPgNyTsRf7YLNXx3u7jRKVFEAx6JimBOkv09qLyPGLlk/gEhy/S1HHN9m7NEwRJBQz
 Tu4+GMEdFRv5iwXEiGXz5MkHLlg5xlX5l8wVJU45r7/kexWBb9KgCGkGcP7Z2Kaitk3k
 Ti+AlG4gXKWugaUeQXc8vl6aiez2NHKL7Hdl28iHF+ncU+QD4//gAPubQwDGmjCzbYD2
 kub/dGzPZrVC3Jr1k5dSFWRgue4EvDPySJd3I24F/sbdrMJYKhg7kydz20Nh3NFKN3db
 ysqzbY6CmN+03NnsZbW/hCp79mBQp0No9dZa2sgnNjHBE7x3j5+lsiFSR089tou1i3sQ
 42DA==
X-Gm-Message-State: AJIora9qe96NMIe8nDbaDDk6Tfp+qO34rT9IkuSRxnZ4bdqzfc/ZznUV
 Y/mHo8H/FnWX1FidJTw6TjRMDB3937MBRQFEAEH4sQ==
X-Google-Smtp-Source: AGRyM1v4iwOISS9Cn7M6YWU7OSmzMdKW0dx6J6O9V0ez+ep+lVbiMH7sUCaI6xdiY8QglTrG5IuEeS/yFu1WAudlumU=
X-Received: by 2002:a25:810a:0:b0:669:9f30:7f1e with SMTP id
 o10-20020a25810a000000b006699f307f1emr14198286ybk.479.1656337838082; Mon, 27
 Jun 2022 06:50:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220627134500.94842-1-kwolf@redhat.com>
 <20220627134500.94842-2-kwolf@redhat.com>
In-Reply-To: <20220627134500.94842-2-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jun 2022 14:49:59 +0100
Message-ID: <CAFEAcA_Po61bhfvpdfHyb+7c4PJ7-YZxbpuo5Ea=ue1ODqPyxg@mail.gmail.com>
Subject: Re: [PATCH 1/3] docs/vhost-user: Fix mismerge
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, mst@redhat.com, raphael.norwitz@nutanix.com, 
 stefanha@redhat.com, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 27 Jun 2022 at 14:49, Kevin Wolf <kwolf@redhat.com> wrote:
>
> This reverts commit 76b1b64370007234279ea4cc8b09c98cbd2523de.
>
> The commit only duplicated some text that had already been merged in
> commit 31009d13cc5.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---
>  docs/interop/vhost-user.rst | 16 ----------------
>  1 file changed, 16 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

