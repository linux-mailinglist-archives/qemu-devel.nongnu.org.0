Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C3949122C
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 00:09:39 +0100 (CET)
Received: from localhost ([::1]:32874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9b87-0007KJ-3z
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 18:09:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9ayR-0003Ul-T1; Mon, 17 Jan 2022 17:59:40 -0500
Received: from [2607:f8b0:4864:20::132] (port=35633
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1n9ayP-0001i6-9M; Mon, 17 Jan 2022 17:59:38 -0500
Received: by mail-il1-x132.google.com with SMTP id b1so16063827ilj.2;
 Mon, 17 Jan 2022 14:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OGZ2zvR718/Y4sugLGycIV5onIEvZRhGDo5VoFiSSuI=;
 b=LKOxtwF0JXwe71K3WFTl3dEPI5HgubbnP5zGQIU5XA66zMT2QtXnBDDgYbgP9E4bsN
 ZzwXrTTDW+XFAKavIWj7Nd2jQYiqd+DpkDwOOrSJqs9ouThLmFdLrapX9HF/BnNwURTS
 Zvc1x0fM54LiNH0AZI7UcrnvOESwu+AZIWSMPTV9M7TN/HSQicRuDUa83peyky2zYsne
 3zEDy/vw7QpndVRa1k6vSc7ROWcoqkI8YA9nHxygg8UTDKdYUnMVlKrCe2W3wIwCE7EZ
 gr0n9uKWg4gDijj/hXX2Q0W+MQnKqETaGw5MdwYvMcOjYwXHs0B2FCPi76DqkIXlhztI
 1nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OGZ2zvR718/Y4sugLGycIV5onIEvZRhGDo5VoFiSSuI=;
 b=XAqpyFlyaFxsQHTmdqTBrz8T/WgH4S7Au9NVE0ywDXB+44cY4BbDaNAOmndwxaoZ44
 mz3F979LE+4pvt2m+C74fEpl0D+3iPD1wUoInbY+oSn7BM/6cPEmq3Ev4/KJJC7fzBA0
 9ZsgJcVoQrySiZzxWdMd4sDTfjkr5Cf9Z6Vg8JAOUMQCehpNWzQ8neTb703UkT7fQ2P7
 gTNldrCWfqLiFt7q+hPSSYZMci9Li6AoCRcshCpYA9HyssufaQ0oDKIS2HnCY8r2WI9U
 VgLPXN4wRMbQyDBwxhOHezKZ0hmX+ucD3mapR7iNX9YdnII/Q95q+p0dwVXA6sQAvQZx
 0CiQ==
X-Gm-Message-State: AOAM530sdVodwrNoayzPwbzCSyL0aR9G2vmHG9vJ5yFLRRMePq94OxWT
 lzF4DBRr/VaJO0rmXNh3qaXiuX5v/n9YC4/bEEQXmGTdE6BbU63R
X-Google-Smtp-Source: ABdhPJzEueAq6PKGnzjDxlp5CtdA3Jq/vVc69d6Pm6MnRcLYuHZZxEuOA8eIIuHwRtSHDsIqN2sNn12iAglEikANIaM=
X-Received: by 2002:a05:6e02:1567:: with SMTP id
 k7mr12783612ilu.46.1642460347360; 
 Mon, 17 Jan 2022 14:59:07 -0800 (PST)
MIME-Version: 1.0
References: <20220116114649.40859-1-shentey@gmail.com>
In-Reply-To: <20220116114649.40859-1-shentey@gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 18 Jan 2022 08:58:41 +1000
Message-ID: <CAKmqyKNN1Nb1g-j=UndSyjDPboci87y5Qs8BMj0jEbnRxxpztw@mail.gmail.com>
Subject: Re: [PATCH] softmmu: Provide a clue as to why device tree loading
 failed
To: Bernhard Beschow <shentey@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x132.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jan 16, 2022 at 9:49 PM Bernhard Beschow <shentey@gmail.com> wrote:
>
> fdt_open_into() obligingly returns an error code in case the operation
> failed. So be obliging as well and use it in the error message.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  softmmu/device_tree.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/softmmu/device_tree.c b/softmmu/device_tree.c
> index 3965c834ca..31d1066940 100644
> --- a/softmmu/device_tree.c
> +++ b/softmmu/device_tree.c
> @@ -60,7 +60,8 @@ void *create_device_tree(int *sizep)
>      }
>      ret = fdt_open_into(fdt, fdt, *sizep);
>      if (ret) {
> -        error_report("Unable to copy device tree in memory");
> +        error_report("%s: Unable to copy device tree into memory: %s",
> +                     __func__, fdt_strerror(ret));
>          exit(1);
>      }
>
> @@ -104,7 +105,8 @@ void *load_device_tree(const char *filename_path, int *sizep)
>
>      ret = fdt_open_into(fdt, fdt, dt_size);
>      if (ret) {
> -        error_report("Unable to copy device tree in memory");
> +        error_report("%s: Unable to copy device tree into memory: %s",
> +                     __func__, fdt_strerror(ret));
>          goto fail;
>      }
>
> --
> 2.34.1
>
>

