Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 798A346CEB8
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Dec 2021 09:14:13 +0100 (CET)
Received: from localhost ([::1]:32820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mus5c-0000mY-37
	for lists+qemu-devel@lfdr.de; Wed, 08 Dec 2021 03:14:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mus3g-0008P6-N0
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 03:12:12 -0500
Received: from [2607:f8b0:4864:20::d33] (port=36671
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mus3e-0001My-OG
 for qemu-devel@nongnu.org; Wed, 08 Dec 2021 03:12:12 -0500
Received: by mail-io1-xd33.google.com with SMTP id p65so1927409iof.3
 for <qemu-devel@nongnu.org>; Wed, 08 Dec 2021 00:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FwAjKjlTe3fYTRQgHcZRWqhil+BobBNqI5pIbVO5sfU=;
 b=Uma9N7r6EWpOp3+4lvm0CewFBEDycf9xmVgmeoldVHZveoj4qxz/QvJYg2lPtkoQND
 b26RjFUNICrVf7bGkaYKPJXJFuYOn3xV0VvcPTfRA2jARVdiEMzXWrpLtXh1iQ/40j0U
 WzlR72oUfplD9mIJrfAMzoHEVDtin414AtmknuAtsBNGHWPz7C19SrkkPBwSuHWNGoUi
 tHnzlWmWtTQwzA8Yb6n8eHT7I9BiIEkEQlo7IdzSnahIffZ+EqArylpiLO057qXQMLyf
 K6jBDFemSobjevk4jhEN2lysEGRUldfEpbUyAEXzTGJF3PUPqZCLUVSoVfydfhnz2Z0w
 huUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FwAjKjlTe3fYTRQgHcZRWqhil+BobBNqI5pIbVO5sfU=;
 b=IrRBJmbFbUSaH1oH4HE+VZJhFW+RbVRlI1MIZwh+dZbXc3TnA1gwbR7xbs0VYf7qxB
 Nj0OpTVN5PeyPZLmXxl7ojQ9Qp4uff6OFZxSyr7F82cmmOF6vdYZPgCRlv+73HBXYmKv
 g3aH4bDf8AsIrnrVevw7ELp2DbmCBOuUl5g8cBiqdxsvzjyerK2BTKLlxs1rvrJZ4EkF
 e4uhG2bhoTLRHKXUOidauEE0/vaVz4Hi2fqTyyBbq/2jteSzxpEKI9thkU20U07wPZit
 Bh7XQOk6iOKdFy3hqSPAaX661mA7mTaFo0xHamzPdqaVPQPKPyOLjw4ix0W5KHy7LJhy
 Aonw==
X-Gm-Message-State: AOAM530NV34069SVNe3DWUremPi32KkmKbDPx5WO1p6cJSkBY8aRM2FE
 WgNkUJv57CMh1MfEUWzsQkEM4KW33E+ROBcM2RU=
X-Google-Smtp-Source: ABdhPJx56JM2K/0O/Ztqpoly/C1QHX0dTIF4bDNBpcliPs2kP2ep3qFdaW7yhstBNVm98GvG04zTu2E4TLhYmiPYxgY=
X-Received: by 2002:a05:6638:2257:: with SMTP id
 m23mr55853261jas.17.1638951129169; 
 Wed, 08 Dec 2021 00:12:09 -0800 (PST)
MIME-Version: 1.0
References: <20211130092838.24224-1-david@redhat.com>
 <20211130092838.24224-4-david@redhat.com>
In-Reply-To: <20211130092838.24224-4-david@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Wed, 8 Dec 2021 09:11:58 +0100
Message-ID: <CAM9Jb+gAJ-TZaJ59+Hty2bnWWnH70w720t3QoJYY5DTonQ2pVg@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] virtio-mem: Set "unplugged-inaccessible=auto" for
 the 6.2 machine on x86
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::d33;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Gavin Shan <gshan@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Qemu Developers <qemu-devel@nongnu.org>,
 Sebastien Boeuf <sebastien.boeuf@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Hui Zhu <teawater@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> Set the new default to "auto", keeping it set to "on" for compat
> machines. This property is only available for x86 targets.
>
> TODO: once 6.2 was released and we have compat machines, target the next
>       QEMU release.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/i386/pc.c           | 1 +
>  hw/virtio/virtio-mem.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index a2ef40ecbc..045ba05431 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -99,6 +99,7 @@ GlobalProperty pc_compat_6_1[] = {
>      { TYPE_X86_CPU, "hv-version-id-major", "0x0006" },
>      { TYPE_X86_CPU, "hv-version-id-minor", "0x0001" },
>      { "ICH9-LPC", "x-keep-pci-slot-hpc", "false" },
> +    { "virtio-mem", "unplugged-inaccessible", "off" },
>  };
>  const size_t pc_compat_6_1_len = G_N_ELEMENTS(pc_compat_6_1);
>
> diff --git a/hw/virtio/virtio-mem.c b/hw/virtio/virtio-mem.c
> index 1e57156e81..a5d26d414f 100644
> --- a/hw/virtio/virtio-mem.c
> +++ b/hw/virtio/virtio-mem.c
> @@ -1169,7 +1169,7 @@ static Property virtio_mem_properties[] = {
>                       TYPE_MEMORY_BACKEND, HostMemoryBackend *),
>  #if defined(VIRTIO_MEM_HAS_LEGACY_GUESTS)
>      DEFINE_PROP_ON_OFF_AUTO(VIRTIO_MEM_UNPLUGGED_INACCESSIBLE_PROP, VirtIOMEM,
> -                            unplugged_inaccessible, ON_OFF_AUTO_OFF),
> +                            unplugged_inaccessible, ON_OFF_AUTO_AUTO),
>  #endif
>      DEFINE_PROP_END_OF_LIST(),
>  };

With correction in commit message pointed by Michal.
 Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

