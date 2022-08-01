Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D12205867C7
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 12:44:53 +0200 (CEST)
Received: from localhost ([::1]:58260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oISuq-0003BJ-Co
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 06:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oISpI-0006UB-7u
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 06:39:08 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:42920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oISpF-0005N5-BW
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 06:39:07 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2ef5380669cso104371707b3.9
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 03:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=qbK51McfNCm6CTtzTj39jaQft04LxzuQtXE7zsAIz+g=;
 b=p+VteKfq+MAW40DhJ9jY26O1A7NlZQ4jTwawR670cVs8e1yzjRIuuw5CnvWTzedlBI
 h4QQ6xR4sfTo1Ji3ljlOqO3CjkDk9MyK24Q/BwF1FAl0u+nKFcFITWlrTA0rNfrC0hMm
 m/b5T0TkmjQDd7AWDHIGXhEnNKesZ/2K5C8us+xjxQ+1Dnfx7r2dr6aM9P7slUNE+Ygi
 GNH7fghwbLJwN3BcmB8rn4a+qiazyIqyt2JgblPOfwEQ9R8HKZPpWfHXvUkZ/SnQF1ms
 2WzBZVIZ6GKYNL6bpReSPWivTwkuPE/CAf/NtCLifHs2LfAkj8escg0de3rf1sDqhQx/
 9dhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=qbK51McfNCm6CTtzTj39jaQft04LxzuQtXE7zsAIz+g=;
 b=w2OSripmZff1JROxczY0W7hKZxflwtMPoCSU3SPJsKrPDQ1MonLgS4NMSIBhJtHnLs
 GmPVEpIz+JBA4QJNeqMXICdoHB6jg61hkIiRvihBa1gKtO6rYtFe0XdSR7JbnimOUMAS
 Hq1OBR3BvHM2NX5KvBrrmtGvic1Ju0EdeHE12dkv+j276H7xhfoT/Wqa+Usfj1JH6IPo
 ddcz1F6DN7O0/RbZvAPsluOct3RQn3w/j4aFi9ilnjSnRk+oPgwnPI6ApWfFSVpGi4Xn
 bVzfmx5hSwcd1tPJKeL4e0CL5m5Dh3dhQSH671iCDoMN2n71ZUU55OVW4crK8mCkO/Py
 GyzQ==
X-Gm-Message-State: ACgBeo2+Y+9x2Mp1fzzwoS6+lr0BpQITCW0UQ13wfUlhMZoP3Oh8fb91
 k4FH63w4o1UVaOBPotoOPVO1EiWiXS6BFvjnAFLr8wzx6Jw=
X-Google-Smtp-Source: AA6agR6FxbkGugIDeS7qw2+E2vb/OWM90FSjIvxcALB/zaLuQuhXsvnyLUyHpUVQ/Dz5nu2l7FJs5+QUCF9TkBIRrbA=
X-Received: by 2002:a81:106:0:b0:2d0:e682:8a7a with SMTP id
 6-20020a810106000000b002d0e6828a7amr12525962ywb.257.1659350344055; Mon, 01
 Aug 2022 03:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220721115207.729615-1-peter.maydell@linaro.org>
In-Reply-To: <20220721115207.729615-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Aug 2022 11:38:53 +0100
Message-ID: <CAFEAcA9EjyoZAx5DfjdnwCvW4z=TxFS3940H9nBErH0_cYUanA@mail.gmail.com>
Subject: Re: [PATCH 0/2] migration: fix coverity nits
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Fam Zheng <fam@euphon.net>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Thu, 21 Jul 2022 at 12:52, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset fixes four Coverity nits in the migration code.
> The first patch is just adding an assert() to clue coverity in
> that an array index must be in-bounds. The second adds an ULL
> suffix to force a multiplication to be done at 64 bits.
>
> thanks
> -- PMM
>
> Peter Maydell (2):
>   migration: Assert that migrate_multifd_compression() returns an
>     in-range value
>   migration: Define BLK_MIG_BLOCK_SIZE as unsigned long long

Ping? This series got reviewed but doesn't seem to have
made it into a migration pullreq yet.

thanks
-- PMM

