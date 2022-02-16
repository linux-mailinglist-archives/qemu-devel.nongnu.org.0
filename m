Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7C34B7D9A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 03:44:32 +0100 (CET)
Received: from localhost ([::1]:56296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKAIx-0006HF-Da
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 21:44:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nKAFh-0003VX-CL
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 21:41:09 -0500
Received: from [2607:f8b0:4864:20::d2a] (port=39908
 helo=mail-io1-xd2a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1nKAFf-0000cC-8m
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 21:41:08 -0500
Received: by mail-io1-xd2a.google.com with SMTP id c188so738044iof.6
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 18:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0auRFmvMP7Hz6c8HFjqeH1tJb8jh/KrMxud/wymsHPE=;
 b=MuNWbZ53AtjFwnEUBJoWPjtDpWIEkoKwM25BSX5W5EhJGGB+oKeNvg6yrKfcYOcQ7o
 dYKBFSeBlGEkEv3foWNVqT4TyL1Y32pVZHo3k7lDaqoOhOGYq3+/wKMEYufq9PYF1sO2
 wwsdiERgxtLHBfAKYsyNeilxz6Hii7yyJ7y0xkduaSKhBxDbX1vFD0uQK5k+IduqmuOj
 YDJAPxYJM2Aty1xUPElZBnFW6IFtJUBEgF3VQvfr0TdJFg8cETwFkcHLgKM0gltt/UCr
 UR5xhWEBsq1TLEIuijQEKXJKqsY7oWBMz77qGlD0y7xy3lwBmKKBo6ARzZYR8G4JvIYp
 4nYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0auRFmvMP7Hz6c8HFjqeH1tJb8jh/KrMxud/wymsHPE=;
 b=qt5dxpLP+sdyqWb8eZZgoA6NdYcnr36Z6prD42zzKyawKROt8bIDiE2zBLXrmnv5Fk
 Ks51iT306hWudEsKgu4n30wEOw6wi3iyiXSZQDGk+OT6R6rC92YEneEbE5+zMVwdNkna
 j9jluuW+YvYql0O7iJvSsNG+2oHrWWxpVOKZgI7SLtLt3Pu6Bzuo79mfnRcsNZdbV2Wi
 OTCczIdr3iyDrnsV3VYR4Ga+ijMAdO5bt8YLJNA92JuJXFwnF/zFZN0Z3FgLh8hcp2nr
 ITeBqCw9vmkiGy5l5nvPDJVT+NjmDrkEsDiFfSxURocXao1ZfQHy019HUe/OpzcpefAG
 QobQ==
X-Gm-Message-State: AOAM532XpnwuTXuyrIg/j3DXaHfWrVjUwai2lp1cs0u2daXKQ1y2Tz6W
 OVYodTyPsveHiqeMY1nxjXHCeghYJjwyc/NaZSc=
X-Google-Smtp-Source: ABdhPJw/7KeRdjaDDAjsCEj07vCh6bToX2SD7CRsAMmwbR8UQ5cPB7an35b4tNATDEBKnnhdfQ3SxB+XrPMJ1yg94xU=
X-Received: by 2002:a05:6602:150a:b0:632:c10c:55ff with SMTP id
 g10-20020a056602150a00b00632c10c55ffmr524089iow.16.1644979265488; Tue, 15 Feb
 2022 18:41:05 -0800 (PST)
MIME-Version: 1.0
References: <20220215175705.3846411-1-peter.maydell@linaro.org>
In-Reply-To: <20220215175705.3846411-1-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 16 Feb 2022 12:40:38 +1000
Message-ID: <CAKmqyKPEseE+k2Su-eRVUzas8fC5CP632oPSJGpV4ToPMsop_Q@mail.gmail.com>
Subject: Re: [PATCH] migration: Remove load_state_old and
 minimum_version_id_old
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2a;
 envelope-from=alistair23@gmail.com; helo=mail-io1-xd2a.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.904,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 16, 2022 at 3:57 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> There are no longer any VMStateDescription structs in the tree which
> use the load_state_old support for custom handling of incoming
> migration from very old QEMU.  Remove the mechanism entirely.
>
> This includes removing one stray useless setting of
> minimum_version_id_old in a VMStateDescription with no load_state_old
> function, which crept in after the global weeding-out of them in
> commit 17e313406126.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  docs/devel/migration.rst    | 10 ++--------
>  include/migration/vmstate.h |  2 --
>  hw/ssi/xlnx-versal-ospi.c   |  1 -
>  migration/vmstate.c         |  6 ------
>  4 files changed, 2 insertions(+), 17 deletions(-)
>
> diff --git a/docs/devel/migration.rst b/docs/devel/migration.rst
> index 24012534827..3e9656d8e0b 100644
> --- a/docs/devel/migration.rst
> +++ b/docs/devel/migration.rst
> @@ -389,19 +389,13 @@ Each version is associated with a series of fields saved.  The ``save_state`` al
>  the state as the newer version.  But ``load_state`` sometimes is able to
>  load state from an older version.
>
> -You can see that there are several version fields:
> +You can see that there are two version fields:
>
>  - ``version_id``: the maximum version_id supported by VMState for that device.
>  - ``minimum_version_id``: the minimum version_id that VMState is able to understand
>    for that device.
> -- ``minimum_version_id_old``: For devices that were not able to port to vmstate, we can
> -  assign a function that knows how to read this old state. This field is
> -  ignored if there is no ``load_state_old`` handler.
>
> -VMState is able to read versions from minimum_version_id to
> -version_id.  And the function ``load_state_old()`` (if present) is able to
> -load state from minimum_version_id_old to minimum_version_id.  This
> -function is deprecated and will be removed when no more users are left.
> +VMState is able to read versions from minimum_version_id to version_id.
>
>  There are *_V* forms of many ``VMSTATE_`` macros to load fields for version dependent fields,
>  e.g.
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 017c03675ca..ad24aa19345 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -181,9 +181,7 @@ struct VMStateDescription {
>      int unmigratable;
>      int version_id;
>      int minimum_version_id;
> -    int minimum_version_id_old;
>      MigrationPriority priority;
> -    LoadStateHandler *load_state_old;
>      int (*pre_load)(void *opaque);
>      int (*post_load)(void *opaque, int version_id);
>      int (*pre_save)(void *opaque);
> diff --git a/hw/ssi/xlnx-versal-ospi.c b/hw/ssi/xlnx-versal-ospi.c
> index 7ecd148fdf3..c762e0b3679 100644
> --- a/hw/ssi/xlnx-versal-ospi.c
> +++ b/hw/ssi/xlnx-versal-ospi.c
> @@ -1800,7 +1800,6 @@ static const VMStateDescription vmstate_xlnx_versal_ospi = {
>      .name = TYPE_XILINX_VERSAL_OSPI,
>      .version_id = 1,
>      .minimum_version_id = 1,
> -    .minimum_version_id_old = 1,
>      .fields = (VMStateField[]) {
>          VMSTATE_FIFO8(rx_fifo, XlnxVersalOspi),
>          VMSTATE_FIFO8(tx_fifo, XlnxVersalOspi),
> diff --git a/migration/vmstate.c b/migration/vmstate.c
> index 05f87cdddc5..36ae8b9e191 100644
> --- a/migration/vmstate.c
> +++ b/migration/vmstate.c
> @@ -90,12 +90,6 @@ int vmstate_load_state(QEMUFile *f, const VMStateDescription *vmsd,
>          return -EINVAL;
>      }
>      if  (version_id < vmsd->minimum_version_id) {
> -        if (vmsd->load_state_old &&
> -            version_id >= vmsd->minimum_version_id_old) {
> -            ret = vmsd->load_state_old(f, opaque, version_id);
> -            trace_vmstate_load_state_end(vmsd->name, "old path", ret);
> -            return ret;
> -        }
>          error_report("%s: incoming version_id %d is too old "
>                       "for local minimum version_id  %d",
>                       vmsd->name, version_id, vmsd->minimum_version_id);
> --
> 2.25.1
>
>

