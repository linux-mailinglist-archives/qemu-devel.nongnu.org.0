Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66219613F4D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 21:55:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opbnH-000466-Iu; Mon, 31 Oct 2022 16:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opbnF-00044z-Kr
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:54:01 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opbnE-0007C1-7z
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 16:54:01 -0400
Received: by mail-yb1-xb36.google.com with SMTP id i127so15064141ybc.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 13:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TrWgNmY0GunFJugl1Ox56tyKZaV3tA9KbUYWapfMOxY=;
 b=kM1MAxjqSwu5osQPYJFiXEYTOn56sEjm4hMzDIwWKURA4nzt4bMkXKRyK5qOE9r98P
 3g6Xh7t877Tx3CXptPqYcmKaL010Rnfm6FY2bSbPvI4gLWoPhzhSZTjLAPSap7OuRBQt
 cwrsOM4S9kv2VSNGL+X9azVyw1Hfmu9EPNmDJyBMMSMXQN7Ow55Qw0fxQb2ZTfhRz+DM
 y6sVDURVid53/GX0g9P6WM8PyoXC0m0h2dNZXxtQCiukiULAQz4/o8CgGPOlRQf5og36
 YPKd9tUVTMTRtseuf0Gu9g3QaHEbhS0/kHHN06JDt0pcgkKt3w0SH8RAtmVFBLlOs3KA
 YpjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TrWgNmY0GunFJugl1Ox56tyKZaV3tA9KbUYWapfMOxY=;
 b=FBkj8AHAoeYpHGFv21bbhnyh7luLxaAnGQ7kpDpQAGngGZe+fpjG+aw+qa92lfdwo+
 Meevw/idsc6LLRJU/78YVn6KXj2PoXvwuqGLtR8CodLeE96LrJ23P4BzRK05uhjBRxta
 ZRsI0fb2rph3Ttyv23NY3obiA0whqOnpMskVBXoHLbcwwOUuvyRmEGfLksicZP8KV4IF
 9JjXV8Qv15OGSfMZ9smCYLSHN5yBqbBQ7PWXf3MtYfpla4voFqFHc920z4MJySSccbXV
 xFQVBi6WsVFClWbJsMkLtIu1IL8fH0BVH8MSD2x7Npyf2tNg+a7jGuhS/2xFlTvEktMR
 Fzgw==
X-Gm-Message-State: ACrzQf3cCYPqaeUb7aO2wFgztEK5O2pcTz5nDj9BHbfpURW6IVvZIqpQ
 Zj+tOTtucERUnlFs5lVNgmoZNil1ZkouGLlASww=
X-Google-Smtp-Source: AMsMyM5nh9gwacfKbeGolRFBYBB86n1QCHI94XVNU6cjvexy+ragfRAAdkwjbqiEU+QLLAVwAffScU8iZjp2kic87YE=
X-Received: by 2002:a05:6902:708:b0:6ca:a03f:fc7b with SMTP id
 k8-20020a056902070800b006caa03ffc7bmr15965424ybt.118.1667249639216; Mon, 31
 Oct 2022 13:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221026021116.1988449-1-richard.henderson@linaro.org>
 <20221026021116.1988449-26-richard.henderson@linaro.org>
 <1792277.8fnDRLUPHX@silver>
 <4c5f0a3a-18bb-dfca-61f6-28b48538b42c@linaro.org>
In-Reply-To: <4c5f0a3a-18bb-dfca-61f6-28b48538b42c@linaro.org>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 31 Oct 2022 16:53:47 -0400
Message-ID: <CAJSP0QUB+6Ttoeo6aDoH3WAdCK3AyXH+=4Oe_U7Lr8GrtNHtoQ@mail.gmail.com>
Subject: Re: [PULL 25/47] accel/tcg: Add restore_state_to_opc to TCGCPUOps
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 stefanha@redhat.com, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb36.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 31 Oct 2022 at 16:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
> On 11/1/22 04:56, Christian Schoenebeck wrote:
> > On Wednesday, October 26, 2022 4:10:54 AM CET Richard Henderson wrote:
> > BTW Richard, could you add a message-id tag to your queued TCG patches?
>
> Sometimes I remember, but I don't use the same tooling for my own work as I do for queuing
> other people's.  I haven't found much value in it.
>
>
> > If you
> > are using patchwork client then it suffices to add "msgid=on" to .pwclientrc
>
> I am not.

Tools that boil down to git-am(1) need to add the -m (--message-id) flag.

Stefan

