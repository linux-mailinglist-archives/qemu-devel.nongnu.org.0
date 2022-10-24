Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7434D60A91E
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 15:15:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omwkh-0002pM-7q; Mon, 24 Oct 2022 08:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1omwkQ-0002kL-E7
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 08:40:07 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1omwkO-0001fG-NX
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 08:40:06 -0400
Received: by mail-pl1-x630.google.com with SMTP id c24so8314220pls.9
 for <qemu-devel@nongnu.org>; Mon, 24 Oct 2022 05:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1+LWvDiP9vbwUIgIoA64lNkImn7woEzeErNi4yRDfo4=;
 b=q3lyBW35JqIM3EFXLqfLJXlHWqj3u+y24BlVJy42aB2n6j9gpMV0MkjAWquto5/C0M
 RfVPBTL9SoP+loDj8hMNMsAGzDdTOe3HO6qUO02nTp7WvfaOFk0BnX9hBefRTPT5o0G3
 XTsDgf6ahhizKShbDg0bTGw45j3cR2h6KlVD32u611GT7RWPjnVGUcsq15K/nLki9GeG
 GZL1mz2ASoeB2cZFf61dp0egO6cSKQnk+UI3M27qp06doLRA7RGDnGnAvgYfQClbERXA
 HIviavyKcPYyNZyAnnDBPD+OZaUIykmGo8ugzZeY9k4YtP51GELZ8xI8gf7fC2gQc8Jl
 CANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1+LWvDiP9vbwUIgIoA64lNkImn7woEzeErNi4yRDfo4=;
 b=yJXumdxyw3qXXfIU3yV+Zbtdzv/K3SYygIcmBfW6yueba8oJWefZwFNMAep/B8aXm4
 WNfVfvm6cadbJcsEWNh5KrHEXTgH9OUWPRKm2FJSOy6lCq5lJ+kEQ2F4TH9iCj20pDas
 e41Gb2WkZIlMByDQT2KolDLe4/0OtwNmLQILZKlJqdmc96A8KUg6q7qgZvcWmdwCqepx
 bP68RETVSoF/Z/psX3ae2zuN/TVmqZrMGVyqyDIY0M93owHH7hqgf3VEs+TwxSTDljbC
 RMK5E6hULtMkno6GjPY6ebZSMa2G1C0yEuHJ6SXo/5z3wXgkvzSwymbVyZSkTtsY3ARC
 jZPw==
X-Gm-Message-State: ACrzQf1+fFRzGiUqGZSKZ8XR3L7XQKCPAp+c0M08M3ickClnWQmcHTMc
 MdOg0vme95jnZM24SHQ1e41Zh28i0mTrO+s/odqBsQ==
X-Google-Smtp-Source: AMsMyM7Qk2jTU9mp5T25hGXFt1gQjbaelXxxhg5pWLL6ofCyJhGmBFvtzpN/qzTxUivTY1NZfxdX9Z55goXZO2G+z0s=
X-Received: by 2002:a17:90b:f06:b0:212:cb07:fb82 with SMTP id
 br6-20020a17090b0f0600b00212cb07fb82mr20541114pjb.221.1666615200676; Mon, 24
 Oct 2022 05:40:00 -0700 (PDT)
MIME-Version: 1.0
References: <20221014021653.1461512-1-Jason@zx2c4.com>
 <20221014021653.1461512-2-Jason@zx2c4.com>
 <CAFEAcA8jra50q_DvNTGG8Wi+eF+PEKPHnfLNBhUjG9muqiPe0A@mail.gmail.com>
 <87sfjdqubj.fsf@pond.sub.org>
In-Reply-To: <87sfjdqubj.fsf@pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Oct 2022 13:39:49 +0100
Message-ID: <CAFEAcA-TT_zRZQ076k6thP2ANk07EqMg8u7MP_6j24u2CCiEGA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] reset: allow registering handlers that aren't
 called by snapshot loading
To: Markus Armbruster <armbru@redhat.com>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, pbonzini@redhat.com,
 qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x630.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, 24 Oct 2022 at 13:28, Markus Armbruster <armbru@redhat.com> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
> > Markus: if we add a new value to the ShutdownCause enumeration,
> > how annoying is it if we decide we don't want it later? I guess
> > we can just leave it in the enum unused... (In this case we're
> > using it for purely internal purposes and it won't ever actually
> > wind up in any QMP events.)
>
> Deleting enumeration values is a compatibility issue only if the value
> is usable in QMP input.
>
> "Purely internal" means it cannot occur in QMP output, and any attempt
> to use it in input fails.  Aside: feels a bit fragile.

In this case there are as far as I can see no QMP input commands
which use the enum at all -- it's only used in events, which are
always output, I think.

thanks
-- PMM

