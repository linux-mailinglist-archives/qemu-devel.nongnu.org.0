Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 859F14BD95B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 12:16:58 +0100 (CET)
Received: from localhost ([::1]:38432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM6gb-00013g-Gj
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 06:16:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nM6cG-000845-GN
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 06:12:29 -0500
Received: from [2a00:1450:4864:20::533] (port=37862
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nM6cE-0000nb-F0
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 06:12:28 -0500
Received: by mail-ed1-x533.google.com with SMTP id q17so28707379edd.4
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 03:12:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iuhse7gp8YNVI0s9AqaKXP5H+TxbOskH4jU5oEzHi7I=;
 b=yvyJbON0iQhsk64B4h0C+leXHceJDXLOqDiFhmsJ67aFvSao6QpT/TvU5oLTTJp4Y4
 u89aoHYsp3bueq+H7wXZ+K0j5w6BHF90LPm4qY15bwdkgh0MWek4q68MW1LHK64xQ38a
 7C9KHeICOAsxLmUa+JuZKcjtL0TxR6vW3M0DY4X0zW7eOvgJdPaDgP09bk353HfYGEBj
 8Nnxl7o9vcgLGfL8zj1Azmbu4Y78TbqZHb4DHOQxnCeWIf3ov3m0KNHRXHvOws+nfnU+
 y463we+E8XILJKdAf0b+WgDjEUPQl+K/n1xONt9doOG4QYLhig5aBX+Txm+sW2+4lxh+
 0aaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iuhse7gp8YNVI0s9AqaKXP5H+TxbOskH4jU5oEzHi7I=;
 b=Iq8tBEIj0PRuYPwwY5JQ7mhFoP3CuK0gcCafZ6xFxNbkRPrDFsrrIatV0UMtoKd7KN
 OhiPLmmfWihEPLs9ztTRe/I5uhipD+yj4TcjNBerR2YS8DV8jiNiiPBCK1BVx8zKzDt7
 YrlMjmpv7KD5YDI+J78nxGbo9KkSOK/jpKVbynAI7F5YmQOADKiuXo6Y4SJFeghcs3Jz
 wJsP24o+HtQlLJaxj+ZWq9T8aXF+vodIGxDIiQEYs8YP0OTi28nB1mWb7DV3ulRdDVfO
 7PJpt6v4jKLRecM2q5AqIfba/rDpeiy/oFBvWNu6vpnElNU73UbbJsx0qm91DlRB4px4
 XE5g==
X-Gm-Message-State: AOAM5316NvTXscsU//b/ns9QAwejxJgtcINQfYdXMKue7qAUfpAFwFBf
 8szuzIH5WCSgJnww0XXr8q4oJPNlQf6NnxJRz+vR8g==
X-Google-Smtp-Source: ABdhPJx/sc2pfX/EyCGrggDHFGIk2sclF3WaOJ9k6GglD4IJNxOcOAFpObfLgGC2tXOri5p0l5/bEI8P2wasUiOrLG0=
X-Received: by 2002:aa7:c3c5:0:b0:404:c44f:8f94 with SMTP id
 l5-20020aa7c3c5000000b00404c44f8f94mr20513898edr.277.1645441943344; Mon, 21
 Feb 2022 03:12:23 -0800 (PST)
MIME-Version: 1.0
References: <20220220192549.591703-1-liavalb@gmail.com>
 <20220220192549.591703-2-liavalb@gmail.com>
In-Reply-To: <20220220192549.591703-2-liavalb@gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Mon, 21 Feb 2022 16:42:12 +0530
Message-ID: <CAARzgwwG6djT_-4HdUvJ0VL-o423T0SMJo1tX-KO3XLyJBnPvA@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/isa: add function to check for existence of device
 by its type
To: Liav Albani <liavalb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: none client-ip=2a00:1450:4864:20::533;
 envelope-from=ani@anisinha.ca; helo=mail-ed1-x533.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: imammedo@redhat.com, qemu-devel@nongnu.org, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 21, 2022 at 12:57 AM Liav Albani <liavalb@gmail.com> wrote:

This patch has no description. Please provide a description.

>
> Signed-off-by: Liav Albani <liavalb@gmail.com>
> ---
>  hw/isa/isa-bus.c     | 17 +++++++++++++++++
>  include/hw/isa/isa.h |  1 +
>  2 files changed, 18 insertions(+)
>
> diff --git a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> index 6c31398dda..39d1768797 100644
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -222,6 +222,23 @@ void isa_build_aml(ISABus *bus, Aml *scope)
>      }
>  }
>
> +bool isa_check_device_existence(const char *typename)
> +{
> +    assert(isabus != NULL);
> +
> +    BusChild *kid;
> +    ISADevice *dev;
> +
> +    QTAILQ_FOREACH(kid, &isabus->parent_obj.children, sibling) {
> +        dev = ISA_DEVICE(kid->child);
> +        const char *object_type = object_get_typename(OBJECT(dev));
> +        if (object_type && strcmp(object_type, typename) == 0) {
> +            return true;
> +        }
> +    }
> +    return false;
> +}
> +
>  static void isabus_dev_print(Monitor *mon, DeviceState *dev, int indent)
>  {
>      ISADevice *d = ISA_DEVICE(dev);
> diff --git a/include/hw/isa/isa.h b/include/hw/isa/isa.h
> index d4417b34b6..65f0c7e28c 100644
> --- a/include/hw/isa/isa.h
> +++ b/include/hw/isa/isa.h
> @@ -99,6 +99,7 @@ IsaDma *isa_get_dma(ISABus *bus, int nchan);
>  MemoryRegion *isa_address_space(ISADevice *dev);
>  MemoryRegion *isa_address_space_io(ISADevice *dev);
>  ISADevice *isa_new(const char *name);
> +bool isa_check_device_existence(const char *typename);
>  ISADevice *isa_try_new(const char *name);
>  bool isa_realize_and_unref(ISADevice *dev, ISABus *bus, Error **errp);
>  ISADevice *isa_create_simple(ISABus *bus, const char *name);
> --
> 2.35.1
>

