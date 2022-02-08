Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E87D04AD75F
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:34:00 +0100 (CET)
Received: from localhost ([::1]:36452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHOkx-000056-QW
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:33:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1nHOJ6-0000kS-5p
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:05:12 -0500
Received: from [2a00:1450:4864:20::235] (port=34698
 helo=mail-lj1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta@ionos.com>)
 id 1nHOJ2-0004TO-9G
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 06:05:11 -0500
Received: by mail-lj1-x235.google.com with SMTP id o17so23913996ljp.1
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 03:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ionos.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=61vlmYU4onikJEtjivu8F6rKK/R9pPIE681vSz0DECs=;
 b=VktY5pUHylKdUxj6Ovx74K7SYyBhFgseJE1l/w0sMXbOpUnbO7YpcCeYMVUAlvj5Rm
 w/r9Omjl0gmMtqmay9CX4W0Tc2e/HDGaoSujJJwBbEUCCO0VjWKrIdCePbRHk4RRT/SK
 RXaewdCh2biKxgFq1VSEB/PkvCCjutATF86ov1mhB3b1EZ3kN/Oc8dFCGwxBHLJ2yBpB
 uT/Ca5k4t+IJ9tOzYy4q5ZPRrzfZM23gllH1jXgiTvcsrOwP3RbbzeUIOY65/HntSyjM
 /aSLaHGz41npK6uuNN6cLmBhvw2CAQEZfbpDAwLC+PcST5fjy/8k751Jy05yk8qQF8Xk
 GPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=61vlmYU4onikJEtjivu8F6rKK/R9pPIE681vSz0DECs=;
 b=JBk1RUk+CIWvHkt+Zgw0mskIlu8Vk6+pKfALH4SuDveHA0f0vQ45sSKiAbMwkOCZ9I
 OgH9cn8W19MvVXiK9XzRInRDZVMLg93/BtBFUe1JBspdWWpyUJ6JleMbHAEsPP3XFyNT
 11Y1mDksXSwUUgNHplJSmd09vnyhEABdtoCkMHdy+Va8OoAADrNT51xv7YiUvjRhAuIX
 F1uD5pc6L+YgFn42G5/m+uJGgYgGFI5OmoYzP14hkpp7ItVL7Sod6GHFnQ2twgSTQyk0
 0MXmzm2zaec42p0wKhlkefcSDm8XtdxIXspkpJKNE7rk3fGZ8pWciSuGwIn+UkdmFJKL
 Hyhg==
X-Gm-Message-State: AOAM533QW2RlcAtGOUx/WrQKo0TPGr82k+oRiL/UAIrgv4nfxPIh+avd
 OKEatvNGbV3xwcQaa2GI3rSWEb8R+5Gow4QGI2IWWQ==
X-Google-Smtp-Source: ABdhPJwXBA3gapoDexaTdBk3j5ZGtFW/LpYJLeAaX0vktg5KQ09Y+K3bjy2q3Pn+P3nQyXex30wGJ18KoYbgK/dFSsg=
X-Received: by 2002:a2e:bc29:: with SMTP id b41mr2592052ljf.42.1644318302360; 
 Tue, 08 Feb 2022 03:05:02 -0800 (PST)
MIME-Version: 1.0
References: <20220208085640.19702-1-jinpu.wang@ionos.com>
In-Reply-To: <20220208085640.19702-1-jinpu.wang@ionos.com>
From: Pankaj Gupta <pankaj.gupta@ionos.com>
Date: Tue, 8 Feb 2022 12:04:51 +0100
Message-ID: <CALzYo30Rd9bd0PbES_4h3wP20zeUn0V-UcQSMiKHW_mB-kuEug@mail.gmail.com>
Subject: Re: [PATCH v2] migration/rdma: set the REUSEADDR option for
 destination
To: Jack Wang <jinpu.wang@ionos.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::235
 (failed)
Received-SPF: permerror client-ip=2a00:1450:4864:20::235;
 envelope-from=pankaj.gupta@ionos.com; helo=mail-lj1-x235.google.com
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

> We hit following error during testing RDMA transport:
> in case of migration error, mgmt daemon pick one migration port,
> incoming rdma:[::]:8089: RDMA ERROR: Error: could not rdma_bind_addr
>
> Then try another -incoming rdma:[::]:8103, sometime it worked,
> sometimes need another try with other ports number.
>
> Set the REUSEADDR option for destination, This allow address could
> be reused to avoid rdma_bind_addr error out.
>
> Signed-off-by: Jack Wang <jinpu.wang@ionos.com>
> ---
> v2: extend commit message as discussed with Pankaj and David
> ---
>  migration/rdma.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/migration/rdma.c b/migration/rdma.c
> index c7c7a384875b..663e1fbb096d 100644
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
> +    if (ret) {
> +        ERROR(errp, "Error: could not set REUSEADDR option");
> +        goto err_dest_init_bind_addr;
> +    }
>      for (e = res; e != NULL; e = e->ai_next) {
>          inet_ntop(e->ai_family,
>              &((struct sockaddr_in *) e->ai_dst_addr)->sin_addr, ip, sizeof ip);

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com

