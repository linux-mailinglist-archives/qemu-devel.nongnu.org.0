Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57594A682E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:47:49 +0100 (CET)
Received: from localhost ([::1]:37824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1wC-0002vW-RJ
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:47:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1nEy4P-0001Mh-SF
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:40:01 -0500
Received: from [2a00:1450:4864:20::134] (port=45873
 helo=mail-lf1-x134.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1nEy3j-0003Pj-6g
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 13:40:00 -0500
Received: by mail-lf1-x134.google.com with SMTP id o12so35677968lfg.12
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 10:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j8ErnqvWLswzqnZZszn5WjwfXMvmiwAdaqFKW2IX8GY=;
 b=Cp9hELAC9pKMZEYQ4EngCJuxGFmdaMTxCLU4Bt0nQymMAQXryJnfpwFS4zUlHDR6fG
 4VqjevBYtcLGAkUOYnT6aWYijBNOT49kA9wZyXQXMpoALHfpKp3zekp33WjqFr5hkzvI
 WloEY+BoHUTQB50DoQBRT+gDZEePVsTdS3rreWProUrhLwaaaMwcz1uKOd1aIbu7IS30
 XQ5lXMiUnzbYU5Wfc5VbONI0xVIVNPs3vGC2kGXpvlSEmqlsezzvT1+zqhxFu7qR/ktv
 r6TDS9MHiErmPFmTJCNivVG/yl2wydICca0ta9aFg82Bt7MoDCnULbWbb5UcqeaVH2a4
 0hfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j8ErnqvWLswzqnZZszn5WjwfXMvmiwAdaqFKW2IX8GY=;
 b=enuXJl7TKhriAO0UC7jeMmB4Fy/FeNo0/71hueAy1MftdioZ/VrkCh5YH0rK+xTp4H
 lJUA5IQExb5kIODTEwsIoRw83jh8NkKy0nDtOQoTwy+tMFXVKHjdtci+gv6jDYYc0nEQ
 6bCzFPeeocEiL9mBzD+eK73CrGOoco1Z1DRahgvq/yDUIZRUa/VMzXICxTUpF0E+kv6C
 bClrc8QT97hdf0R8+fxfjIQvddtLcA176rcpXyhGqg+9J6fIeX3d5ry5APtXrngHHCr/
 r5lLq+tyZEQbSnn3ULJcs2LfPuMeLNXT4Y2DaLgkx1fEcofLicMIxiqGb/1YGXvdcs1i
 zJKg==
X-Gm-Message-State: AOAM5328jsehCzyA7rF2HAl6ZOBkcHofalK9FZOBM5ahfUgR6Jk+gU/1
 Y0Tc6846IqTvdM52ZcOOVYg9GczOPGN7VkNkLN3kzA==
X-Google-Smtp-Source: ABdhPJzGCovtM8kGtRdqCdFygfQTbXO+BLX2ZXjOXhKBpR+9qsW/gc9BmkLLPQdw+RWU/10r+7REIb2qZW9P3TnK0po=
X-Received: by 2002:a05:6512:3487:: with SMTP id
 v7mr19872781lfr.310.1643740755044; 
 Tue, 01 Feb 2022 10:39:15 -0800 (PST)
MIME-Version: 1.0
References: <20220201151136.52157-1-jinpu.wang@ionos.com>
 <20220201151136.52157-2-jinpu.wang@ionos.com>
In-Reply-To: <20220201151136.52157-2-jinpu.wang@ionos.com>
From: Pankaj Gupta <pankaj.gupta@ionos.com>
Date: Tue, 1 Feb 2022 19:39:04 +0100
Message-ID: <CALzYo305jDix2huY4jSX+-gtwumRTtqQyCtYbfHpNs3TdAmwrg@mail.gmail.com>
Subject: Re: [PATCH 2/2] migration/rdma: set the REUSEADDR option for
 destination
To: Jack Wang <jinpu.wang@ionos.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::134
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::134;
 envelope-from=pankaj.gupta@ionos.com; helo=mail-lf1-x134.google.com
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

> This allow address could be reused to avoid rdma_bind_addr error
> out.

Seems we are proposing to allow multiple connections on same source ip
port pair?
>
> Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
> ---
>  migration/rdma.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/migration/rdma.c b/migration/rdma.c
> index 2e223170d06d..b498ef013c77 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -2705,6 +2705,7 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
>      char ip[40] = "unknown";
>      struct rdma_addrinfo *res, *e;
>      char port_str[16];
> +    int reuse = 1;
>
>      for (idx = 0; idx < RDMA_WRID_MAX; idx++) {
>          rdma->wr_data[idx].control_len = 0;
> @@ -2740,6 +2741,12 @@ static int qemu_rdma_dest_init(RDMAContext *rdma, Error **errp)
>          goto err_dest_init_bind_addr;
>      }
>
> +    ret = rdma_set_option(listen_id, RDMA_OPTION_ID, RDMA_OPTION_ID_REUSEADDR,
> +                         &reuse, sizeof reuse);

maybe we can just write '1' directly on the argument list of 'rdma_set_option'.
Assuming reuseaddr does not effect core rdma transport? change seems ok to me.

Thanks,
Pankaj

> +    if (ret) {
> +        ERROR(errp, "Error: could not set REUSEADDR option");
> +        goto err_dest_init_bind_addr;
> +    }
>      for (e = res; e != NULL; e = e->ai_next) {
>          inet_ntop(e->ai_family,
>              &((struct sockaddr_in *) e->ai_dst_addr)->sin_addr, ip, sizeof ip);
> --
> 2.25.1
>

