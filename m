Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2AF3DD5B5
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 14:35:28 +0200 (CEST)
Received: from localhost ([::1]:43120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAXAF-0001sp-An
	for lists+qemu-devel@lfdr.de; Mon, 02 Aug 2021 08:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAX86-0008EU-CW
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:33:14 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:37524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mAX81-00076k-R3
 for qemu-devel@nongnu.org; Mon, 02 Aug 2021 08:33:12 -0400
Received: by mail-ed1-x52f.google.com with SMTP id g21so4969024edb.4
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 05:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a+qvyvOqDGfGG5qmtYOz9jsZw6pdy6W6KHtQS90ftX0=;
 b=A4XGFQvJ+DBMgmsmUyyooNsaNSnUfnxd0tfNwpzR7N1IKFndBRG3A+paRMD0ELn8sl
 Ly5h8OFLjIEimk0hOkhq+Ci0GmyadWi9gEAdsxQYpRX0Ky+gli6uiKtq+g7fdhOWf2RR
 JOvo0luDJHa4bsFqbg8+wN3L4RvsiqBfEqsVqj+DrHCpTC/iHfPzecGBVvhUMCkI5/7e
 0KBGLa09SmiIFMEDpFhRhDLOxZ16j9ddsSrawPC6Ei/XsgLz4DktA72tDTDBPXUVCdCk
 xoNtYy+kuuyiQoYwukTBlz8kWRoPl67Ty73zVojd3ymQm5tYPzkthyKFpFLlcZNmp2Zz
 06SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a+qvyvOqDGfGG5qmtYOz9jsZw6pdy6W6KHtQS90ftX0=;
 b=UHtDbsHce1nKQQFdjM8ExYllm1TdpfyURr+OkAmO9EEDpMBf5dchBOJk4wqBDoMX1Q
 PTgKNQy9b+lWydQlSOwt7WHUErWso7K+Abvga7HSxfcIpKLDC96r8VLrTAVPBtuLPakj
 +IsCLt0E/CRn9aGFlFQyc6O2FJ5UKI56xClaqEvuu5uQFlKssVOsP7IfofBvtf+rnvLg
 48d9q9OQ2ql5qpv4Som+70qnfT4b6iymiBrllzzAVOUEKndqA3l9KL7SwzwYL6rt2xV4
 F0TXmJUwkt54aWjFkrRvxkdWwtMEoW+6QaGj7pTsTySpATpfgPHeJODVSNfMvpCWezxh
 XeUw==
X-Gm-Message-State: AOAM5300hcg/dnR9ZSP7qZK4loSyo7jW9cWukchJwhMrjFW8/dQcFE4v
 g239IO/Nnr6VvsqmsCJbhLWKOjopu95WyVBDlNe6ri1GOGI=
X-Google-Smtp-Source: ABdhPJyy3CePWNn8lE0wurVSk19TRYfO1knsHN9QrwgOVdM/1Y9ryv/e7Z58sxUCPl2wnmrzW/5ZAyRVS4N0i6gswn8=
X-Received: by 2002:aa7:c857:: with SMTP id g23mr18666069edt.100.1627907587929; 
 Mon, 02 Aug 2021 05:33:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210731062741.301102-1-pbonzini@redhat.com>
 <20210731062741.301102-3-pbonzini@redhat.com>
In-Reply-To: <20210731062741.301102-3-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Aug 2021 13:32:24 +0100
Message-ID: <CAFEAcA8k7Xxmtf_xVfjyjni0qe2BpAV-rOcU5m0eASDtHTr-Ww@mail.gmail.com>
Subject: Re: [PATCH 2/6] coverity-model: make g_free a synonym of free
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 31 Jul 2021 at 07:29, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Recently, Coverity has started complaining about using g_free() to free
> memory areas allocated by GLib functions not included in model.c,
> such as g_strfreev.  This unfortunately goes against the GLib
> documentation, which suggests that g_malloc() should be matched
> with g_free() and plain malloc() with free(); since GLib 2.46 however
> g_malloc() is hardcoded to always use the system malloc implementation,
> and g_free is just "free" plus a tracepoint.  Therefore, this
> should not cause any problem in practice.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---

A bit sad to lose the distinction, but as you say the mismatch is now
guaranteed by glib to not be a bug, and in any case we already managed
to get most of the errors out of our codebase.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

