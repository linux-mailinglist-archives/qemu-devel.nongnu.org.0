Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692204A67CB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:22:48 +0100 (CET)
Received: from localhost ([::1]:49918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1Xz-0004uR-6t
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:22:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1nExkv-0007gE-F2
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:19:56 -0500
Received: from [2a00:1450:4864:20::132] (port=44756
 helo=mail-lf1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1nExkt-0000Ek-SV
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:19:53 -0500
Received: by mail-lf1-x132.google.com with SMTP id u14so35583897lfo.11
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qlHRmIrl60vP75tj/K08c2Lmxld5T+lwHGfUNoiXZPA=;
 b=i3Sgqs/8tPiioKDbPA2CwkaikwTwEJUeDOryCx1uXsSuy6dGdPLTRgnaiRoG5bvpnu
 EbG7x7EXkdZQvJzGEV3CEl3cLgeUbfx1o1xVi0/2a/Czf210ZZsA28g3waxDh/5EHoFU
 ClNJsl7ZygiDUZ4jjd6D66leaUy7IA97WjyM9K/vB9TkVQn4TXYptb/R6df0wQzUy44A
 87L/jK0hgjXglKkbupBhQnit42BLY7t5dD6ydGt6tECjVdlNYj8V1VwjpC0cuyYWHL6i
 gRS+uq5E9u935f6TwTvwehqO2E/nkDMGz+nKm/aDgnNC5YfnwTvLOjaVRPHF5jZLynXY
 bnFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qlHRmIrl60vP75tj/K08c2Lmxld5T+lwHGfUNoiXZPA=;
 b=yfGAJPO3Copx2wBkdkMeyaSgDkQpQk5KFZGcuJZ9SdE5InE3kJ18eYIApd0h0iFc7U
 JFZpkw4c8boxsF4Y/JAmIlps0s1FYnTDP4sxS1AFXtcpdjUZMkOpO6EVuI9qlOIwt7d1
 RU6NMBFnpwuHbs2UFyXQ1IdNJRdmsbrGzODBIQM6uM9AiP3ZR/FgDcN+/CqN1yxZyQZC
 GD0CIkdNV1OfkBl3OfzsM8z0DBaSxSiry9M/XxN93AAqHWEA1UET9nB4DGype5DhyPUv
 3kHoueQWVJeCYKNVS3zZKUOx2P1nRZs9Iy5VWnKSTCKy1HubqG1bssx5Ek9SfE4yIkhE
 HE/g==
X-Gm-Message-State: AOAM530q1hS99xYd57oKBpiL2Tw4aVDcckarTnbYlDFTT369JgWWHtq9
 C8ijruZhjfpHlwmT7V0nG0TpUVcy2RhjkkfifNPhCw==
X-Google-Smtp-Source: ABdhPJzrHsQhuPlpfPyvDQ7+2ETyEVIQBL4/NNKe3wr+gkDm4YNn8WYLB3kOeICxv5SMO3T6KiTcuxE9ht3CkA+yRBw=
X-Received: by 2002:ac2:44ac:: with SMTP id c12mr20561966lfm.589.1643739588703; 
 Tue, 01 Feb 2022 10:19:48 -0800 (PST)
MIME-Version: 1.0
References: <20220201151136.52157-1-jinpu.wang@ionos.com>
In-Reply-To: <20220201151136.52157-1-jinpu.wang@ionos.com>
From: Pankaj Gupta <pankaj.gupta@ionos.com>
Date: Tue, 1 Feb 2022 19:19:37 +0100
Message-ID: <CALzYo30ED+8De9SPaTz_Lct=pwvhA8xwwH6dAc=vRjMvRq0dKA@mail.gmail.com>
Subject: Re: [PATCH 1/2] migration/rdma: Increase the backlog from 5 to 128
To: Jack Wang <jinpu.wang@ionos.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::132
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::132;
 envelope-from=pankaj.gupta@ionos.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, dgilbert@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> So it can handle more incoming requests.
>
> Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
> ---
>  migration/rdma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/migration/rdma.c b/migration/rdma.c
> index c7c7a384875b..2e223170d06d 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -4238,7 +4238,7 @@ void rdma_start_incoming_migration(const char *host_port, Error **errp)
>
>      trace_rdma_start_incoming_migration_after_dest_init();
>
> -    ret = rdma_listen(rdma->listen_id, 5);
> +    ret = rdma_listen(rdma->listen_id, 128);

128 backlog seems too much to me. Any reason for choosing this number.
Any rationale to choose this number?

Thanks,
Pankaj

>
>      if (ret) {
>          ERROR(errp, "listening on socket!");
> --
> 2.25.1
>

