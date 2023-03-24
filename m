Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3906F6C7F0A
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 14:44:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfhES-0007an-CT; Fri, 24 Mar 2023 09:13:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfhEK-0007aT-6B; Fri, 24 Mar 2023 09:13:16 -0400
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <faithilikerun@gmail.com>)
 id 1pfhEE-0007Np-FC; Fri, 24 Mar 2023 09:13:14 -0400
Received: by mail-lj1-x231.google.com with SMTP id z42so1660323ljq.13;
 Fri, 24 Mar 2023 06:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679663580;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vhiOmcNOw3CqusqBpuPxs3KEt9fJxbep8mlqY3W5XWg=;
 b=UOFoJ7554wfLJUVVWQAqdbp9F0yZleAvxbcZCtNmWsMoQ0ftRrArdiYvQxFCi9/H6X
 VeY1ujCzY2u8Sfckvw5RgkGDi/mwN5xwhxCMEzsF1457gnUsoK62rcDWmR7kaVQZogKb
 tm66oFFxYbbawfBBsr90tGNtlhFHoTIUGeG2hvhIUHBzP6uhgdecD8Pzl8oHxbcPk9ct
 Ilvzl/BHz/7ZZwZoTmFldw0Bo1oy/SSopya9ZTceDrauIpBFuQGgUU+AXLMIVIdkK3TL
 8ofY8A5m0cRem85dG/vs0bdNURJTtN29E118ujpiq4pO581/GzWt6WR79WQJoO5BQbcJ
 Gitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679663580;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vhiOmcNOw3CqusqBpuPxs3KEt9fJxbep8mlqY3W5XWg=;
 b=B/MTwE03GygfSIZD0lD1SCtB9DrKwsRoP/450KkEQZouhQjcU/OB43Pge/VTjfJHOX
 UMQy8OOyM6AIfX9QKiQUDypLaw5fVQEf5HjUw1ck0gJIZ8kjw2iiJmsNwOTX3UYVV/X5
 epGrYBZgPohV83uZCZDm86lvWXUGipnbR4GBI293wMUSvThxtYQYiEiVrqV7FqJgOH4/
 Bjv861po/axkH0C2KKh0MkWCBYHnO7NCqgITeC1Wk/yyGxbe7tycmQEnIYhQEw4UU1HV
 D58EaZM6An937qejFjg7EeT/2KpOvs+kLYwdGRj1PPszL3dlyoUcn+dLWh6klgaxYAk4
 6oPA==
X-Gm-Message-State: AAQBX9eErTPgAa4Hcn7mbNfIWJJSwh8KAAgwYO54hsmYfzhl4F0bPb9E
 8GfVMEJRfM0OaLPsrILk0byrXRoHL6i+OdNhnUbY27gqOYSLvYypAZI=
X-Google-Smtp-Source: AKy350b2VfVSgA+jj27WSv5Ya732xc0DHsKHhjDJYBeLneJWkOT6+FOh1pYGxLvp0PhQCNTl1KISMf3WZ4czCrUcF6E=
X-Received: by 2002:a17:906:868b:b0:934:b24e:26ba with SMTP id
 g11-20020a170906868b00b00934b24e26bamr1218699ejx.7.1679659586008; Fri, 24 Mar
 2023 05:06:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230324105418.3752-1-faithilikerun@gmail.com>
 <20230324105418.3752-2-faithilikerun@gmail.com>
In-Reply-To: <20230324105418.3752-2-faithilikerun@gmail.com>
From: Sam Li <faithilikerun@gmail.com>
Date: Fri, 24 Mar 2023 20:05:59 +0800
Message-ID: <CAAAx-8JaBSYPckTLnq5OqHqW4mjWJex-7DskbvBEL3R8Te1Y0Q@mail.gmail.com>
Subject: Re: [PATCH v9 5/5] docs/zoned-storage:add zoned emulation use case
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, stefanha@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, 
 qemu-block@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 damien.lemoal@opensource.wdc.com, 
 hare@suse.de, kvm@vger.kernel.org, Markus Armbruster <armbru@redhat.com>, 
 dmitry.fomichev@wdc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::231;
 envelope-from=faithilikerun@gmail.com; helo=mail-lj1-x231.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Sam Li <faithilikerun@gmail.com> =E4=BA=8E2023=E5=B9=B43=E6=9C=8824=E6=97=
=A5=E5=91=A8=E4=BA=94 18:54=E5=86=99=E9=81=93=EF=BC=9A
>
> Add the documentation about the example of using virtio-blk driver
> to pass the zoned block devices through to the guest.
>
> Signed-off-by: Sam Li <faithilikerun@gmail.com>
> ---
>  docs/devel/zoned-storage.rst | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/docs/devel/zoned-storage.rst b/docs/devel/zoned-storage.rst
> index 6a36133e51..05ecf3729c 100644
> --- a/docs/devel/zoned-storage.rst
> +++ b/docs/devel/zoned-storage.rst
> @@ -41,3 +41,20 @@ APIs for zoned storage emulation or testing.
>  For example, to test zone_report on a null_blk device using qemu-io is:
>  $ path/to/qemu-io --image-opts -n driver=3Dhost_device,filename=3D/dev/n=
ullb0
>  -c "zrp offset nr_zones"
> +
> +To expose the host's zoned block device through virtio-blk, the command =
line
> +can be (includes the -device parameter):
> +    -blockdev node-name=3Ddrive0,driver=3Dhost_device,filename=3D/dev/nu=
llb0,
> +    cache.direct=3Don \
> +    -device virtio-blk-pci,drive=3Ddrive0
> +Or only use the -drive parameter:
> +    -driver driver=3Dhost_device,file=3D/dev/nullb0,if=3Dvirtio,cache.di=
rect=3Don
> +
> +Additionally, QEMU has several ways of supporting zoned storage, includi=
ng:
> +(1) Using virtio-scsi: --device scsi-block allows for the passing throug=
h of
> +SCSI ZBC devices, enabling the attachment of ZBC or ZAC HDDs to QEMU.
> +(2) PCI device pass-through: While NVMe ZNS emulation is available for t=
esting
> +purposes, it cannot yet pass through a zoned device from the host. To pa=
ss on
> +the NVMe ZNS device to the guest, use VFIO PCI pass the entire NVMe PCI =
adapter
> +through to the guest. Likewise, an HDD HBA can be passed on to QEMU all =
HDDs
> +attached to the HBA.
> --
> 2.39.2
>

