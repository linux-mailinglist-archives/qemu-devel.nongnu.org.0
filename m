Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DDA64D269
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 23:37:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5aMC-000794-TY; Wed, 14 Dec 2022 17:36:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5aMB-00078Y-An
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 17:36:07 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5aM4-0003vq-PW
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 17:36:05 -0500
Received: by mail-pj1-x1036.google.com with SMTP id
 w4-20020a17090ac98400b002186f5d7a4cso856501pjt.0
 for <qemu-devel@nongnu.org>; Wed, 14 Dec 2022 14:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8Y9uiMT3DgVU1mt964G7aUiTm+NRVwJ2lA49X8D/pBM=;
 b=LN3p7RyTk5Wtc9gHCrDmAFI1QtMh7HwTmJGd61mL50ervDwNgm/qs4zoEiQ4HQtxk6
 sCNxihYspNLfSxlyurorP7K3bG28XOdsJqxcooRC6WRbkKdX5WhCotX5rm/hSrlDNyqz
 DbMsFuUrTTtHe2ot16l6mSUnBAlo5U/f/Im5lzFmR1hKzOMtJze9Oh8QTX8s/jaE4DFi
 EknFJ9tBavcE1cUrQvTx8PzYUv8FDrJ2tIWpHJSHzNmpMMxwnfZLtGHAVw5oTOuCGmIq
 IsCmz+ZsTrglOCMeweT1LlN2i6x3vvLSh5EBNY5ExZzl07ecC2NbzN+vhMWX4XM4Eoi5
 7mVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8Y9uiMT3DgVU1mt964G7aUiTm+NRVwJ2lA49X8D/pBM=;
 b=scRswP+O/d1v++SxM4AgDW9FW7E4jfXqDzdeidR+Y7kGcUEfdD7CGp33K75yud8OdN
 xNeHfwMHQSvyYFY/FvRJcJfy1q7zm2Abxa1bJWZ5NZLANYxLC8/VNn8SguSgxGQGxXZ1
 orzmVVTnFO4Wk7+hLHmO2PumGfAoY5ykgXUtvFU0mz9elyo4xbtB4Jy+PJaHex6sIMTy
 xOhWELIo8+slzfdClmOKztAESM/Z2BstCHhUJPFiC3a2LstC2sk/NAsa68oBu9NDYFd1
 OkPwvVx9VqBZyTttIErQ3YqCuql8o356nFqqmydjQlo4dQZWISA9QjdnQn1AU3JbdBv7
 gI/Q==
X-Gm-Message-State: ANoB5pmHQD5vIJFU6iPhFeBHVe3w7CfpPlh2XSMW725CnIdCDxqmD0S1
 MPOr3TTS3j1A2t8JHkeTAaMmgljay1TiKONceLpVFA==
X-Google-Smtp-Source: AA0mqf4PoG9/GBVXV2y7BtYmQhV8rA8qcWqZ2zMmyvlpUUPfqDkHXLeX+04EC2pFTfC4yBrfBFSFX/46jKd44WOUI5c=
X-Received: by 2002:a17:903:2053:b0:189:cdc8:7261 with SMTP id
 q19-20020a170903205300b00189cdc87261mr23249451pla.168.1671057358557; Wed, 14
 Dec 2022 14:35:58 -0800 (PST)
MIME-Version: 1.0
References: <20221214134453.31665-1-kwolf@redhat.com>
In-Reply-To: <20221214134453.31665-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 14 Dec 2022 22:35:47 +0000
Message-ID: <CAFEAcA8Tob4eV_cGAT050b0oGHjRVEmWVnuJ7ugURVi4o_X7pg@mail.gmail.com>
Subject: Re: [PULL 00/51] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-block@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1036.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, 14 Dec 2022 at 13:45, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 5204b499a6cae4dfd9fe762d5e6e82224892383b:
>
>   mailmap: Fix Stefan Weil author email (2022-12-13 15:56:57 -0500)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 2ad19e5dc950d4b340894846b9e71c0b20f9a1cc:
>
>   block: GRAPH_RDLOCK for functions only called by co_wrappers (2022-12-14 13:13:07 +0100)
>
> ----------------------------------------------------------------
> Block layer patches
>
> - Code cleanups around block graph modification
> - Simplify drain
> - coroutine_fn correctness fixes, including splitting generated
>   coroutine wrappers into co_wrapper (to be called only from
>   non-coroutine context) and co_wrapper_mixed (both coroutine and
>   non-coroutine context)
> - Introduce a block graph rwlock
>
> ----------------------------------------------------------------

Fails to build on the tsan-build job:
https://gitlab.com/qemu-project/qemu/-/jobs/3476176683

In file included from ../hw/nvram/fw_cfg-interface.c:10:
In file included from /builds/qemu-project/qemu/include/hw/nvram/fw_cfg.h:7:
In file included from /builds/qemu-project/qemu/include/sysemu/dma.h:15:
In file included from /builds/qemu-project/qemu/include/block/block.h:27:
In file included from
/builds/qemu-project/qemu/include/block/block-global-state.h:27:
In file included from /builds/qemu-project/qemu/include/block/block-common.h:27:
In file included from /builds/qemu-project/qemu/include/block/aio.h:25:
/builds/qemu-project/qemu/include/block/graph-lock.h:62:31: error:
invalid capability name 'graph-lock'; capability name must be 'mutex'
or 'role' [-Werror,-Wthread-safety-attributes]
typedef struct TSA_CAPABILITY("graph-lock") BdrvGraphLock {
                               ^

(I see the same error on my x86 macos system.)

thanks
-- PMM

