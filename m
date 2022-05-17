Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8A2529B49
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 09:44:24 +0200 (CEST)
Received: from localhost ([::1]:35126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqrsV-0004Bb-5N
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 03:44:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqrop-0002o5-5w
 for qemu-devel@nongnu.org; Tue, 17 May 2022 03:40:35 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131]:36970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqrom-0001ji-U5
 for qemu-devel@nongnu.org; Tue, 17 May 2022 03:40:34 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2f16645872fso177916407b3.4
 for <qemu-devel@nongnu.org>; Tue, 17 May 2022 00:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xWpKs3RI4xZPoDO3MosmocHeaRimrnR28IOdULXHwFI=;
 b=FIOuC8GariMpapJErmOVmzYP4/q1aOQXwRID12p0j00wrLLsdeEeE8ERnBpa6f1QnD
 GQQX7Eqwa+mqN1snG5xVOMumKdfECrzT9psJxSKvDpdRzQlbzroaIm40q5Hq25v7aTt8
 WDHwWA5N+fv1Vd+OKwKi+cj8bKcuinQkMsbuD+ykUMdjNlsml8TDtYLUQxWxRpueAuKL
 8L+jdtMqYd0UPn4GQLXo4L0hcVDwa25DlGr14Wk1S1buHEFcrbqy+BDc8Z+EeZ0euB1y
 ErVeb4z9i6Ex26527mTvqVZTWOhbBGLi857Rzp9HBg/VhwScaMbcr8lsECPerXMcLiZ7
 8efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xWpKs3RI4xZPoDO3MosmocHeaRimrnR28IOdULXHwFI=;
 b=hJbkgWaRWi0E5s7PKnkAsPvFkr/oDicAPmJ6MwV4weOXKD/lFbz/PTSqw3+z6mr9WF
 CJQazbrIKrbbIp6XdCt9u+6Tyb3oj2b12G0Po7IqzDwFFuGhISjXb2IrCQJ4PrQ5wGEi
 HBwIRwJmFgd9e3H6wQ/qXpUjVBQ0HMTAkQwDtBZi68SA6UmpebIsMTVg3AegJeTqCExL
 qC/U33defbEkOxEVFJvlZYL2Emw5wwRrO9WO67cc7/2+qa+m/TpdA7JkITqRNT/RkNEb
 PQS5ID7Lw89Uazx35e3xTbX4in7mTFRcRJsWwSqKxu3POLHcf1GeP72xkZlg2Wj3IDcH
 bCHg==
X-Gm-Message-State: AOAM531ktBrG9C6t6bPsoaMNlW0qGVKP3RynECZgRw5OiuUrxhAjXRAt
 5UxTN30/3i37y0H/upIMwzccMjL3w4kJ223rBF2g9wRjhL0=
X-Google-Smtp-Source: ABdhPJzD7iPu8CVQFaZ1bygNfxmeyqJevBGV5fhYaqPPzO0UmLrp/W7+maWQHyWNx1P1CYxGUnq27TGfhN9pj4LwERg=
X-Received: by 2002:a0d:d4d0:0:b0:2fe:b86b:472d with SMTP id
 w199-20020a0dd4d0000000b002feb86b472dmr21944325ywd.469.1652773231873; Tue, 17
 May 2022 00:40:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAFP0Ok9Zjav40T39VFfF6bvR8=vCKOM-O8Z-pJ5t3tnc9281Yg@mail.gmail.com>
 <CAFP0Ok9vNmWLG+2Oxwk8PQ2pjEdL0RVd4mpVKcf2e9xm10gWKQ@mail.gmail.com>
 <CAFP0Ok-8zv1FFcwmP5pc6boWQB513bsTPX7B-VG5m6D48m2WYA@mail.gmail.com>
 <CAFP0Ok_w_gKWze_K0v6M+YCLAdjJKCRj=WEPLbHHXrPZtPbqfg@mail.gmail.com>
In-Reply-To: <CAFP0Ok_w_gKWze_K0v6M+YCLAdjJKCRj=WEPLbHHXrPZtPbqfg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 May 2022 08:40:21 +0100
Message-ID: <CAFEAcA-K-aJrSbEfJnkJ1p5j_9DfxTrwMftQo9Vhg4NRYjy7Ww@mail.gmail.com>
Subject: Re: QEMU 6.2.0: Segfault while calling address_space_init from
 emulated device
To: Karthik Poduval <karthik.poduval@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Tue, 17 May 2022 at 04:39, Karthik Poduval <karthik.poduval@gmail.com> wrote:
> Ok digging deeper, there was a compiler warning about a missing
> prototype of get_system_memory but I never thought it would lead to
> this sort of an issue.

If you're building QEMU from git it should default to
"warnings are errors". If you're not, then pass configure
--enable-werror to do that.

PS: not related to your problem, but you should really do
the address_space_init() in device realize, not init.

thanks
-- PMM

