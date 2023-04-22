Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4566EBAFA
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 21:23:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqIoL-0004RY-N1; Sat, 22 Apr 2023 15:22:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqIoJ-0004RM-Ex
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 15:22:15 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pqIoH-0003jS-UY
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 15:22:15 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-504efe702d5so4150415a12.3
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 12:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682191332; x=1684783332;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2EwFtgwSFkODIa5o5Qj6fOUVOB69B8JzF62aESQCrt4=;
 b=ThxabUIF6z58s227PiKv5TH8B2pXUgT5cu9ppUjpTaxI3kw3hT1B4URfmHCI2NLIVT
 BemTfsFQ9W5XNgCOX9NFBWPrwe11Z2iAZo422y5Z3c/rBBZyeTK7eB3t2RxIpjee/Kj/
 FkUHa8KZ2kzNGBw6gG4dQbnqRAIoEw0qMTaV60AHDhWJcPcfnM27hf913vC9oWnD19pa
 2e3p7dK04AqcXdIpRuDdyPt4jiClvGyFscYeN+iTSiPlF0RVL96dIHb/3z6s5zUQFkPv
 Us3zxO+BnvsiB0zKKyVD/gMnROJ626xl6LnliMgPzhKksSXI2Nbymb/2n4x/tXvbCYUx
 92Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682191332; x=1684783332;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2EwFtgwSFkODIa5o5Qj6fOUVOB69B8JzF62aESQCrt4=;
 b=RVV3lerRk5Z0dQI8YCX/jduyPEMM0IWtb4FamymlqgxA3hGuEwwqCeOJs87XG1lihP
 zN0fhDD6vuB7gbmiDBuyZdUGPhKuOMJvcWXfzTumk6RNrhZ0VlTCnkdGp9fAeW51ZE1T
 QcDl27sRBbf5l/MDueTuvb6d0hlsUFKNqCB2C4Ai26JJ+ToVjpzLZqfN+Sc5ZmITt+Jz
 5DzKywpxe3cQsk+RJqjF2CPp1n/Wd4Bowo/aHWVZW9NbdkohID2M3wKPmUoWql9tYLvK
 WllZbK+0znuakRzm/lZXGTfdzW/wUHYr3noZJ/I0Tdu+jcv4NzzZtu/estQhOTx7z9U3
 dc5A==
X-Gm-Message-State: AAQBX9eEeX87HEp0xZj96zl2nfSqqk+PhlD+0ZWiPboCRX9Tfj3sqvwm
 KLnBnhZ/W2ijsYvn/nueRd5MIofQTNy2tUA5ZBvixw==
X-Google-Smtp-Source: AKy350b6GLgyF/aRBIr2RuTj01vQgf0iF9vcKJD4RnuM0kxnt4AnAtyxH1DFBNRZDHvCCYR+rbRZQxaUnSUgFJ8UPx0=
X-Received: by 2002:a05:6402:1a50:b0:506:9f5f:5c9c with SMTP id
 bf16-20020a0564021a5000b005069f5f5c9cmr7517725edb.25.1682191332194; Sat, 22
 Apr 2023 12:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230421011223.718-1-gurchetansingh@chromium.org>
 <20230421011223.718-13-gurchetansingh@chromium.org>
In-Reply-To: <20230421011223.718-13-gurchetansingh@chromium.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 22 Apr 2023 20:22:00 +0100
Message-ID: <CAFEAcA8wzV2s8CL_kHqXbw4hyKxhRc+8FRy2WRK8aa+C19A0Hw@mail.gmail.com>
Subject: Re: [RFC PATCH 12/13] HACK: use memory region API to inject memory to
 guest
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, philmd@linaro.org, 
 david@redhat.com, stefanha@redhat.com, kraxel@redhat.com, 
 marcandre.lureau@redhat.com, akihiko.odaki@gmail.com, 
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Fri, 21 Apr 2023 at 02:13, Gurchetan Singh
<gurchetansingh@chromium.org> wrote:

> Though the api does make an exception:
>
> "There is an exception to the above rule: it is okay to call
> object_unparent at any time for an alias or a container region. It is
> therefore also okay to create or destroy alias and container regions
> dynamically during a device=E2=80=99s lifetime."
>
> I believe we are trying to create a container subregion, but that's
> still failing?


> @@ -671,6 +677,14 @@ rutabaga_cmd_resource_map_blob(VirtIOGPU *g,
>      result =3D rutabaga_resource_map(rutabaga, mblob.resource_id, &mappi=
ng);
>      CHECK_RESULT(result, cmd);
>
> +    memory_region_transaction_begin();
> +    memory_region_init_ram_device_ptr(&res->region, OBJECT(g), NULL,
> +                                      mapping.size, (void *)mapping.ptr)=
;

This isn't a container MemoryRegion -- it is a RAM MR. That is,
accesses to it are backed by a lump of host memory (viz, the
one provided here via the mapping.ptr). A container MR is one
which provides no backing mechanism (neither host RAM, nor
MMIO read/write callbacks), and whose contents are purely
those of any other MemoryRegions that you add to it via
memory_region_add_subregion(). So the exception listed in the
API docs does not apply here.

-- PMM

