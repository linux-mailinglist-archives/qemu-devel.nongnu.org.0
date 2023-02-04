Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8DB68AAB1
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 15:54:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOJu8-0003i4-NM; Sat, 04 Feb 2023 09:52:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOJu7-0003hf-23
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 09:52:35 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pOJu5-0003vh-Cf
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 09:52:34 -0500
Received: by mail-pl1-x634.google.com with SMTP id b5so8002037plz.5
 for <qemu-devel@nongnu.org>; Sat, 04 Feb 2023 06:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QQcNRIkOiw3G1XU8dGfwdbhDIbgYVWWwYB3nFuovL1k=;
 b=s/ctQgDiKZ7hUDKfH18sdWeqeeV03aBi7vQVAgnddR6tTqnycYNYmESqgRvRDBt2ll
 AOpezCVFlPtHudz4pJ+eW/AOgHPXYyhtrPRzPgT1n/pQtESGNsJ4i8TXs7eo/C4ktLVt
 O3v8NpDVCE9QHLJwX8R4XikdZN98S9JFOWWP45bB0aIdopoMEiWK/lyaEhDHZNkczqzr
 5T4vx2oGdqlnsD5QmrvfA1RzoQBloYHsbYp1sBqtviwEnrUveslMH8eeorgfmcgPDEUf
 UGwZHtzCwyjqwjOwDYx8Bn7g6DDo9HozbvYSLDJuiOUQpoyENequsE6Lqww8oxFftRVY
 kXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QQcNRIkOiw3G1XU8dGfwdbhDIbgYVWWwYB3nFuovL1k=;
 b=tyA1Ck3J31RxSRQxXjy8ab3Wl2Bbat7PopCdoPejGElEAqf7PhOvYB2jziE8WkuGUO
 OU3SZkT3Ej4LVUOtIoyB49Jtjb28BEj92hTjjb5CVLlGJfGYXpkhljgqIo9BajITb89k
 yvXaNRhDRmFDraA5x7Z7VzH8O92apsI53W6W29rPbEHH858+Kj1JPMBrtYlAh5DMxhgL
 9GyS0XcC3dhpTLIWZYl7wVg8I7lmvir9HTLX0cKg5yZFBpj1Z5EVnWSyHR9Igi0tMYDa
 UTWRvh6k99DmpMgrXqyVlmsU1m/QbSInJnTwZrxm1Vv88azXGbN/YiE8HcxM5CDk3Iyo
 KLkA==
X-Gm-Message-State: AO0yUKWEIo4btDyaXvH0yUNAFyRrpASVYjc1YDuOqQHTuEZ/Nk3QO1bp
 ezWzrUqF+C/3veXCXKM108eg+epUqXuN6oEgJifyJQ==
X-Google-Smtp-Source: AK7set813AN1ceKqNu7nG7WB4gacEj3zpzJj/fl8s89JAk0WjGPN7slza9Mr8MIO1nm/7fMaGY4nqjoJcsXqg7RD0EI=
X-Received: by 2002:a17:90a:4eca:b0:230:7d5a:3926 with SMTP id
 v10-20020a17090a4eca00b002307d5a3926mr932273pjl.137.1675522351338; Sat, 04
 Feb 2023 06:52:31 -0800 (PST)
MIME-Version: 1.0
References: <20230204072119.3073872-1-armbru@redhat.com>
In-Reply-To: <20230204072119.3073872-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 4 Feb 2023 14:52:19 +0000
Message-ID: <CAFEAcA8T7V9EHeeH8FQ=s_kbK7nc3_ruw+3AnrZssccHdiPM1w@mail.gmail.com>
Subject: Re: [PULL v2 00/35] Monitor patches for 2023-02-03
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x634.google.com
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

On Sat, 4 Feb 2023 at 07:21, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit deabea6e88f7c4c3c12a36ee30051c6209561165:
>
>   Merge tag 'for_upstream' of https://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging (2023-02-02 10:10:07 +0000)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/armbru.git tags/pull-monitor-2023-02-03-v2
>
> for you to fetch changes up to 864a3fa439276148b6d7abcf2d43ee8dbe4c4062:
>
>   monitor: Rename misc.c to hmp-target.c (2023-02-04 07:56:54 +0100)
>
> ----------------------------------------------------------------
> Monitor patches for 2023-02-03
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

