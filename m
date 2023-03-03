Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC416A9ECE
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 19:29:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYA9K-0003Pd-KE; Fri, 03 Mar 2023 13:28:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA9E-0003JO-Dk
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:28:53 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYA9B-0003RM-By
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 13:28:51 -0500
Received: by mail-pf1-x42d.google.com with SMTP id c10so2123205pfv.13
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 10:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677868128;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LoZb7kZpDNBxZK1p2F/ZV69oRoy1TbL2psWLYdpfQU0=;
 b=ZUFDIfBFMlADJFwzSYthFG5z/3Gk95G8I+D3BffJrWkpWddOFosbOGUSp1NR2CVyjP
 YeEsLqNCPk0B42bmgI55+gsinA1JmlcJSS1pAw+27Dp/tNdt4H1IzeyCDkLLWRsyoEeg
 C2EUMsSO8hyUWw9vsH6uHKlPBHpiIUDgMC5e4bTlf8wgFUdMvv6EV1tao8GOt9+WfmYM
 fiVCw7uhv5gpU+g2FLpaWX45Tbiawm2u5AR/L3AuaiKb6vVGVjrnJmtquyCGDcSkqj9m
 JrowgIvW8ecYTQVW4OMvowrexPnK7o4MATm5Uq9n6Jjl38feePzoXO3nRQU7y8KaLVDH
 Tk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677868128;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LoZb7kZpDNBxZK1p2F/ZV69oRoy1TbL2psWLYdpfQU0=;
 b=HXgpAw7sopQPnfVxuashLjV9qbBktrTWlsYy6gjoQFumq0cLjmExXRSwwFquizYcv3
 9euBDD1sLrwHEv96EGar+UGNT03MrB9penT0OHOjBFW7zjY/OWgr1zQVeTqCfjG0YRxp
 WtFJz/bNQngAEg1klfTACOj7DCiNYyAly9e8SVzE9nfmIOWMUCJhQs5kpcUM+9kfuqs6
 pO7ziW0sDScl2MF04xFqtL2DVoYC3jH5Y5g/eKXi/qDWkyKyakxmPhtMtjAPlxr8YgLy
 nEJT0nAdp8BrATXdj6Ds+2lokevDKQq3OWLaaGIc4H8xKCn4EHrpNTM/LhFNkQju2QQc
 ekFA==
X-Gm-Message-State: AO0yUKVsPqmQnUin5+k1AL7C32Gu1TClP9qAZ1pnHwddq1ut0CLm6tYK
 XXbk6ZMYKZbn8obGg6qokBxQMkXQ+sBHdvJfJ+2YGQb5UaGbSw==
X-Google-Smtp-Source: AK7set9VcNeW8wA9kN5fQ0PngHZKVz7izpG3IOPPz2EAUfB9H+7G6DoZBTACeVgpMNBaZGBxNnP5mmyw60L2Yc0CYuc=
X-Received: by 2002:a63:a80c:0:b0:503:a7:d244 with SMTP id
 o12-20020a63a80c000000b0050300a7d244mr823491pgf.9.1677868128146; 
 Fri, 03 Mar 2023 10:28:48 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-74-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-74-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 18:28:36 +0000
Message-ID: <CAFEAcA-xToEB=DtqdBGfR6qLV+9UN+n8vQSS9E4RXqo3xOKZNw@mail.gmail.com>
Subject: Re: [PATCH v2 73/76] include/exec/gen-icount: Drop tcg_temp_free in
 gen_tb_start
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
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

On Mon, 27 Feb 2023 at 05:36, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

