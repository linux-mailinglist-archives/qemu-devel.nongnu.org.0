Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1FAB6ADEFB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:42:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWdY-0004wq-M4; Tue, 07 Mar 2023 07:41:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZWdT-0004vj-Ab
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:41:45 -0500
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZWdO-0002on-Af
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:41:39 -0500
Received: by mail-pg1-x531.google.com with SMTP id s18so7497826pgq.1
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 04:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678192897;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fiE/UJX4/gFrjKyQ7yqUhlubyPi3OJiRE+/zst0C5rg=;
 b=slqXPWDJniPY4FOk3v00jW1WCd+LqidmyvjnjxRT+57C3DKDOntsJQ6UmIIRJeGT3K
 FcfgoVWPTj6KQ5KHOMYYE56ycaFRP4OqKUGRpAmwScAXc9GadCP68pcdVQJCBO3OeFxx
 fD0VQniuQbEMwT//opE3S003QMuTs6PQDdPNU9JCiC2m/A92lGV31f+AvSy4XqXruJVS
 ZLQ8g0zffkuVm3MxPCXWptp7iIQlmdMxEGbw1tPqhtjj4KUoy/PeU2ZWmWCfBcHoTWd5
 Dqf/pqfpN/rUn+hAH88Z78Wl/Dp8ct1dsY6Igf0hd9VufpxlLkTKh1T87JYvwFrfGPMc
 zsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678192897;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fiE/UJX4/gFrjKyQ7yqUhlubyPi3OJiRE+/zst0C5rg=;
 b=IxGM3EAHW9fILfOG0pBq8Hw0k74EJOzr9HBj4W1nNaJEUmnLjyEMSUyx0XWi7so6DQ
 pT6E2x2KZXZbBaFl01cR1a5cxv0JHEqzyW2N3FEIbESFaQEqng1lZmApFN+LPGdHMfVO
 5S+ewkXhIzfNkAujb6z+GFjBkZaf+XsbLHziwVopPcMuBLFbNrU6VD44Rx+KnzNFfZ6E
 EzMNjCH+jvxyBB10Gp7VX7vc7jvM1itgkpNfsEIkBxZKAWBcoIJJ7Rrfkn2DnbrZ1/Gh
 h1FFkr+BsU5qwW3HcE6edXloi1MRf8HZ4x3RZ7YGOnmE9lqQZm+KwqYTN4ELmQSE/ap2
 GSHw==
X-Gm-Message-State: AO0yUKXy7zi+MHIT16wcjG3seaHmusWH14y0UwWVW9ul05Q7LKbYt8Rz
 DXZt+6Tv3QpoGjrs9DnIH5ee00+HIGuL7s7Ehy6AjQ==
X-Google-Smtp-Source: AK7set+CJZShasHIxzIrcsuZKisymz3HlUxMPJ3xXETI/hzO1WqoFnl49ExmBvDTSCHkHn5OnFBfanyuc4crlFrPMak=
X-Received: by 2002:a63:9c0a:0:b0:502:e4df:5f3f with SMTP id
 f10-20020a639c0a000000b00502e4df5f3fmr4743078pge.6.1678192896910; Tue, 07 Mar
 2023 04:41:36 -0800 (PST)
MIME-Version: 1.0
References: <20230306140044.44076-1-anthony.perard@citrix.com>
In-Reply-To: <20230306140044.44076-1-anthony.perard@citrix.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Mar 2023 12:41:25 +0000
Message-ID: <CAFEAcA-VwYJ4dFomBUDJqESv+3czJEzfw=Xy+UVHOwD88kpTWg@mail.gmail.com>
Subject: Re: [PULL 0/2] xen queue
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x531.google.com
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

On Mon, 6 Mar 2023 at 14:03, Anthony PERARD via <qemu-devel@nongnu.org> wrote:
>
> The following changes since commit 2946e1af2704bf6584f57d4e3aec49d1d5f3ecc0:
>
>   configure: Disable thread-safety warnings on macOS (2023-03-04 14:03:46 +0000)
>
> are available in the Git repository at:
>
>   https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20230306
>
> for you to fetch changes up to 3856734d80fbf46683e4080117ed961f5ab1300b:
>
>   hw/xen/xen_pt: fix uninitialized variable (2023-03-06 11:27:37 +0000)
>
> ----------------------------------------------------------------
> Xen queue:
>
> - fix for graphic passthrough with 'xenfv' machine
> - fix uninitialized variable
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

