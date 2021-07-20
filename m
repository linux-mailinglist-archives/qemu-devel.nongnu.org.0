Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796D03D0426
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 23:59:31 +0200 (CEST)
Received: from localhost ([::1]:59372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5xly-0007q1-I3
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 17:59:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m5xjm-00069v-5r
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:57:14 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:45830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m5xjk-0004YF-OO
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 17:57:13 -0400
Received: by mail-il1-x12e.google.com with SMTP id b6so581866iln.12
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 14:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9LRt9lSt47VOt6c917DnRltJ9KLUBTQCD4igyUDELtQ=;
 b=qdg4XPpWiYXn2Bwkc6+Oxxs66qegpPaEiWS0P/vX/GGa+Gf6AeCGZNZwsZz20D0AnM
 YYSpVyOjDB2kCh2jZL2Z4iBsYppEuRFr1LheJr0UJK1hPpXZpu98+oy5vGyS6J5rtjiD
 pz0k4ZHtQ/PrOM9n5ccCUx6nQI/+IU/oNbE/8Fl/hmygDvp3d2R6vtfsks7O1072RVwo
 8w20THIOd+lgtDT/PrEqcGYdtFN/hncZdRir4BGzmSIjBtxK3bjPdgrtS4UWrE+QoNYn
 Jsihha5RViRQDgSPLzC+b3HFi4haC0BW+I1FSoOT5vwvSGR9AUuHMoZ249dpFEKpi/OD
 0rkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9LRt9lSt47VOt6c917DnRltJ9KLUBTQCD4igyUDELtQ=;
 b=NVy58dCc4KmJd6gr4Ub29a5lscgGs+14aprwWQTzIUgDqms0SUGNQHSCfVwyJ95a7B
 9leP8pYvJxGiGByMLpIMifbl1zRp0/z0akMaSqXluQBZ6Dlrf0DZoKVEvZiNfJ3Z0eV4
 mfBoQ41ZlIlvVDwqFEuABMMJgP+1x9bscnjhy1I6/E19Go7B2B11E3FllMzy9iardpn2
 bj8cF8/wlmeumk9GOMS207nxzZvTt7nvb5nC1uOHFxCVhcRmhyilCQ3c9SG9p1MrIL8f
 YF+RoV+yGUrcqcmR6lTiTVyEcmZ+KALVDCohmwAPSZkfbQzn6u56C+tlRGqGR4wKRM/E
 R2Ag==
X-Gm-Message-State: AOAM531J8ACFlagGX9ZTNqBmupKshGTnE8gzShI7bpTjITSx1mgunkPE
 hRxgt4VgciA2ze7m1nqniCL3Aakf6RmuzeNWBKl/jE9rmo4=
X-Google-Smtp-Source: ABdhPJxCqXZVdnXg6xAN1f0yNAxbgxBdMlB72Zlk2kiGWy/uqleVpSitY6FUM1zn5+6nxfFumUdslrnfLyk2NPqpscU=
X-Received: by 2002:a92:a005:: with SMTP id e5mr21679153ili.22.1626818231635; 
 Tue, 20 Jul 2021 14:57:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210720125408.387910-1-armbru@redhat.com>
 <20210720125408.387910-17-armbru@redhat.com>
In-Reply-To: <20210720125408.387910-17-armbru@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Tue, 20 Jul 2021 23:57:00 +0200
Message-ID: <CAM9Jb+jvYAtU-guegoFwEiTiyVWkqtFT5OP0_WQf3KAcQtyCSg@mail.gmail.com>
Subject: Re: [PATCH 16/16] vl: Don't continue after -smp help.
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::12e;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-il1-x12e.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> We continue after -smp help:
>
>     $ qemu-system-x86_64 -smp help -display none -monitor stdio
>     smp-opts options:
>       cores=<num>
>       cpus=<num>
>       dies=<num>
>       maxcpus=<num>
>       sockets=<num>
>       threads=<num>
>     QEMU 6.0.50 monitor - type 'help' for more information
>     (qemu)
>
> Other options, such as -object help and -device help, don't.
>
> Adjust -smp not to continue either.
>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  softmmu/vl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index ce0ecc736b..8f9d97635a 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -1543,7 +1543,7 @@ machine_parse_property_opt(QemuOptsList *opts_list, const char *propname,
>      prop = keyval_parse(arg, opts_list->implied_opt_name, &help, &error_fatal);
>      if (help) {
>          qemu_opts_print_help(opts_list, true);
> -        return;
> +        exit(0);
>      }
>      opts = qdict_new();
>      qdict_put(opts, propname, prop);
> --

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

