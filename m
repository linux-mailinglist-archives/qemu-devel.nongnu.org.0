Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0773030F9C7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 18:33:35 +0100 (CET)
Received: from localhost ([::1]:54040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7iVa-0003vS-2M
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 12:33:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l7hgy-00025P-KU
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:41:16 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:40276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1l7hgv-00059U-EY
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 11:41:16 -0500
Received: by mail-ed1-x52d.google.com with SMTP id s3so4953747edi.7
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 08:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Lk+dUflb5EKep9u7e6qj+CdzkeRVzuZWQk4laOIidak=;
 b=dneaW8lKBwgTxuufvxckvq8XwGTx0SgF88OFqGbqjRCUS7cMeQeP6wDSx5goOhv0SA
 L8o213uAUyHEA+Rk8N1N24/xoywzzZXla8FHNem5voYZLFCTfkruDukdRPMGvp8WFm4P
 79zAUyVNOSf3uxpMykjGmG8af343MJldpwr5w8iwdBASYTQRhS1AgwUTg29VtzKZV46Q
 8f7Gxf5zTcviX86yBYBY1gywa0CAa9TqRGVusIF2qA79hNmu/Srgedu28JH48TVPlarp
 4tPNBT0y0uSkr8QljWQ7+9aq5OhC5eUt3eAlMPLoaCRa7MTkPSwGcqCOIVx+l3pozFhi
 d3vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Lk+dUflb5EKep9u7e6qj+CdzkeRVzuZWQk4laOIidak=;
 b=AtEpJhEi+0CJzNNztVW7VbRkAD8ypUToeX3F21zsT+2SnRajZPs35xcX69Q7yehGNQ
 TIU0TMxDcRBNgcMMEoLjsKxWLZez5ho1RPhi3+fJSAwEbTSuW0CR3vdT2tcj8JrODTZU
 36t7M+SB4pK4IYKObw7N+qVLOthJo+6mxYllIYJfzqMTR7lWimSDRPIF3icj6dSzywMq
 oSzPxXT/NsDizke+E2EpvBrIeh2A7BcNXVou5as1hGFEsJMgGQxz4jEO2iFwDJuUPEXv
 EIyoYWqNdYhit4cXOUKTZB74R+q3u+i04g/jTH13v7XYrjBqQ1LU+sehFvWpXaiL2NB6
 eCBQ==
X-Gm-Message-State: AOAM5320iWrI3GjHY/Uhi7UJlQbQTosymXsP4b6JraEHKEyzfuYihBNN
 2dwEeqfVaIfGaAj8c34+tKY2ObkNr+akADLt/aQ=
X-Google-Smtp-Source: ABdhPJy4wQywqFKqI3GzC3EccUVUuJjDJnUixObGlump1JLlR2C81uHJ1EHqx9qVbifO3mitc2ffZHMG8jh4DN7G0OA=
X-Received: by 2002:aa7:d399:: with SMTP id x25mr8726212edq.237.1612456870387; 
 Thu, 04 Feb 2021 08:41:10 -0800 (PST)
MIME-Version: 1.0
References: <20210203233539.1990032-1-dje@google.com>
 <20210203233539.1990032-2-dje@google.com>
In-Reply-To: <20210203233539.1990032-2-dje@google.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 4 Feb 2021 20:40:58 +0400
Message-ID: <CAJ+F1CLmvcEOOYh7puPEHwzVWrbVV72fdi+MBw3w2T+GHLu4zQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] slirp: Placeholder for libslirp ipv6 hostfwd
 support
To: Doug Evans <dje@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On Thu, Feb 4, 2021 at 3:38 AM dje--- via <qemu-devel@nongnu.org> wrote:
>
> This commit is intended to only contain the slirp submodule change
> that adds ipv6 hostfwd support.
> ---
>  slirp | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

It's generally recommended to include the shortlog of some sort in the
commit message of what changed between the two commits, ex:
https://patchew.org/QEMU/20210125073427.3970606-1-marcandre.lureau@redhat.c=
om/20210125073427.3970606-2-marcandre.lureau@redhat.com/

thanks

> diff --git a/slirp b/slirp
> index 8f43a99191..358c0827d4 160000
> --- a/slirp
> +++ b/slirp
> @@ -1 +1 @@
> -Subproject commit 8f43a99191afb47ca3f3c6972f6306209f367ece
> +Subproject commit 358c0827d49778f016312bfb4167fe639900681f
> --
> 2.30.0.365.g02bc693789-goog
>
>


--=20
Marc-Andr=C3=A9 Lureau

