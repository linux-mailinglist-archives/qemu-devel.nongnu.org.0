Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9417D6133B2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 11:35:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opS7Z-0005d8-Dv; Mon, 31 Oct 2022 06:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opS7S-0005cj-1p
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:34:14 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1opS7Q-0002ZR-Eb
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 06:34:13 -0400
Received: by mail-yb1-xb29.google.com with SMTP id i127so13125325ybc.11
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 03:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=S+7IiMNOebDjRLieCZzZyz1Ffo5o6pwdHNxwknwTfmQ=;
 b=Pe0l9+yyYBn45+J7epPUQAKDaNoGJq2Kuk0Y0A1mHSNGKhHnXwuz1Te2quyZlfWHUV
 6u3mPASyngrUFTmiI0qdst3uiNBo4hcXmI9LHYoT185HL4CdcZccOaZetIpN1b/3yIZX
 ZlBwW9yUHUBPpHaTJQ8ApLxsvRAda0wZZ7prV+FkDkL6exIeO4E4xRRUj/fIG5s0ey3L
 jwrRhP6YWC3mD0Dxjnq7igQBtMaMtUSutv3/oetSL6QG1Z0x1eipICYCx/Vv9K0pPBTL
 PSnrjzQZdei7S5UJUP/73f7zrzAKAUj94LEwwjUiV4jC7keGfMKCZ1ia82s/cX4zEuEm
 VvjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S+7IiMNOebDjRLieCZzZyz1Ffo5o6pwdHNxwknwTfmQ=;
 b=aVfvFqWLHEb+1ALJ8Q9/5k22LFkd0AqDP/rXK8Ieq0tF26cq/c1Yn+ci8VADVuCOs7
 4ZHic1+PET6nOCFcN1QqcktdhDhhA11bVwQYpSEZ0rmYGcHcsAfFu6xBsQJUh39bCZZ/
 j0KAZGTZt7pldy+VW7/qRItAyhk7Q01VHIAhUA9vs3O3Pj9vMUB+I4mLOnF8AHJN+egv
 fQuBZWI0Qw1XGjJnDpggHOn2Jnrwg2QIcBUaLugZkPeWx0hULscl95ShEgAuhQ+O6Byr
 8JG13eskydeQFXFeMrmG1BPHSV7WUI4Qe8asuSjANZk/lOrBxiHOMtClDUCrqDpAcpKC
 /B/A==
X-Gm-Message-State: ACrzQf0gyNt+RZdZdyBx04tk4Iueg6LuPDF6Vhts8aMeXzrzQsqLsBIA
 d8E5um3GMcGKJ+RQzOaDo4+6/KG9UPPo3yTITz0=
X-Google-Smtp-Source: AMsMyM5gJx8LoGBzf38DhwxtZvYLTLtwArTTNhh0iRH9vqpf3iRSLoI6C64F/h7DrVQEPQ2vqpfInO7LBN/2T8GnUQU=
X-Received: by 2002:a25:4fc1:0:b0:6bc:c570:f99e with SMTP id
 d184-20020a254fc1000000b006bcc570f99emr11943046ybb.58.1667212451127; Mon, 31
 Oct 2022 03:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221028174546.88683-1-imp@bsdimp.com>
In-Reply-To: <20221028174546.88683-1-imp@bsdimp.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Mon, 31 Oct 2022 06:33:59 -0400
Message-ID: <CAJSP0QUbek3kWrWbWMoqKcQspL94vK9Xy7jFqmihGD86_pV-tw@mail.gmail.com>
Subject: Re: [PULL 0/1] Imp 202210 patches
To: Warner Losh <imp@bsdimp.com>
Cc: qemu-devel@nongnu.org, Kyle Evans <kevans@freebsd.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 John Baldwin <jhb@freebsd.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb29.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Fri, 28 Oct 2022 at 13:46, Warner Losh <imp@bsdimp.com> wrote:
>
> The following changes since commit 344744e148e6e865f5a57e745b02a87e5ea534ad:
>
>   Merge tag 'dump-pull-request' of https://gitlab.com/marcandre.lureau/qemu into staging (2022-10-26 10:53:49 -0400)
>
> are available in the Git repository at:
>
>   ssh://git@github.com/qemu-bsd-user/qemu-bsd-user.git tags/imp-202210-pull-request

Hi Warner,
Please use https://github.com/qemu-bsd-user/qemu-bsd-user.git instead
of an ssh URL. That way anonymous fetching works for people without
GitHub accounts. Thanks!

Stefan

