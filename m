Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9741F999D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Jun 2020 16:07:29 +0200 (CEST)
Received: from localhost ([::1]:56606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jkplo-0002ZR-3N
	for lists+qemu-devel@lfdr.de; Mon, 15 Jun 2020 10:07:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkpku-00024r-4R
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 10:06:32 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jkpkr-0002IZ-ED
 for qemu-devel@nongnu.org; Mon, 15 Jun 2020 10:06:31 -0400
Received: by mail-ot1-x344.google.com with SMTP id u23so13191895otq.10
 for <qemu-devel@nongnu.org>; Mon, 15 Jun 2020 07:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p1rQlclb2e1rQgql4GxIpe/vNWLSDdqvPBIX9WuMdQw=;
 b=EWch8RldSII/4xU+fzXomNdQB9Gw2u+s6h+SlhAVXhwNGiv2sNgDt9hXlgvy7PasuU
 tA8Nk02br/vlQR/G0ZHjGII/Eh7mngigS+lpNuZsUfg/i4VSfV6/yEvkPPDTxmzjyN/i
 bNMDNLbUlzQYcCPNyy8ph0Q3AG+g2hGQd7qHhgc8yQG5xfUbcv7kUb2OBlZ7qn26oSDH
 82rq8OR2nu4iDJYLcM7uUplN90C646OJ/eUFck3I43aXy6CfwskPvFzymB/toUTAOzX6
 KebkdEVZrxvcBNcGdo9i0EtXt11fD0zyH/L7gl+rHYFT/NkKa2sBOcJZgOO5WAoPcKoN
 kIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p1rQlclb2e1rQgql4GxIpe/vNWLSDdqvPBIX9WuMdQw=;
 b=FDvbyU7B73fNJgdGeWyxlr8Zjnov+53QtyKb3MOBLXYlft3Z9+B9t9vUXxLuId0wUw
 ICGfMHzPdAktFMIYIgsGJP6ncDPMdI3tEOxKckTCP1xi5rlbLnscEIhYI+rRpoFTrkCJ
 U0sLWOojfL1TCC+gjeDTXX527gTawusAdtWXgZ5o5FgbC2FpALytvGXn95+eSZbckJPk
 i1FvX2drjWg4PS3jBehErbvz9FC09asAZS3FIrmKRgvA4DNUAh2juuUM5zqMpq0rlTY3
 Qx8i+yiu3i9tRMx5af82bLLWBv/c7fhjN4YOBHkByc/5tM6kFe8MrgmkFJdSyuou8I3g
 t0+w==
X-Gm-Message-State: AOAM533lxuK4szkBIy/E/0V+XdBhDKwpqR+CpUUhFpxqEVWskA1VBv2d
 z0PnoCKPvg+DkIuxo0B44/Sjo/qE/tDz8Yc8+JL3VA==
X-Google-Smtp-Source: ABdhPJzG3W10lzMLbzt+sxmE90xFlmGFbUEFSN6Jbp9K0yYyxoL4bITf4Dg4bv+8NZA0x8rSCZPVi+oOZlUjmEcuI1M=
X-Received: by 2002:a9d:67d6:: with SMTP id c22mr20621424otn.221.1592229988115; 
 Mon, 15 Jun 2020 07:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200605102230.21493-1-philmd@redhat.com>
 <20200605102230.21493-4-philmd@redhat.com>
In-Reply-To: <20200605102230.21493-4-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2020 15:06:17 +0100
Message-ID: <CAFEAcA-6Vv5Q31Z0bsXPpWanEj8Z0gBeZFWTCrQF3W8RuaQiMQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] hw/sd/sdcard: Do not switch to ReceivingData if
 address is invalid
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Alexander Bulekov <alxndr@bu.edu>, Prasad J Pandit <pjp@fedoraproject.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 5 Jun 2020 at 11:25, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> Only move the state machine to ReceivingData if there is no
> pending error.  This avoids later OOB access while processing
> commands queued.
>
>   "SD Specifications Part 1 Physical Layer Simplified Spec. v3.01"
>
>   4.3.3 Data Read
>
>   Read command is rejected if BLOCK_LEN_ERROR or ADDRESS_ERROR
>   occurred and no data transfer is performed.
>
>   4.3.4 Data Write
>
>   Write command is rejected if BLOCK_LEN_ERROR or ADDRESS_ERROR
>   occurred and no data transfer is performed.

It's not clear from the spec that this should also
apply to WP_VIOLATION errors. The text about WP_VIOLATION
suggests that it is handled by aborting the data transfer
(ie set the error bit, stay in receive-data state, wait for
a stop command, but ignore all further data transfer),
which is I think distinct from "rejecting" the command.

If that theory is right then moving the check for the
ADDRESS_ERROR in this patch is correct but the WP_VIOLATION
tests should stay as they are, I think.

NB: is the buffer overrun we're trying to protect against
caused by passing sd_wp_addr() a bad address? Maybe we
should assert in sd_addr_to_wpnum() that the address is
in range, as a defence.

thanks
-- PMM

