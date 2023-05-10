Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E8F6FE38D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 19:57:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwo2V-0006ca-F6; Wed, 10 May 2023 13:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pwo2R-0006Zk-CO
 for qemu-devel@nongnu.org; Wed, 10 May 2023 13:55:43 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pwo2P-0006Ga-GK
 for qemu-devel@nongnu.org; Wed, 10 May 2023 13:55:42 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50bceaf07b8so14005282a12.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 10:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683741339; x=1686333339;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NcQONxJjIebKe62o9+wWxYQ6fgF38ifEIFgjnI7lG0U=;
 b=iMk617qQnPP/z5kZaHr12qRc9/g7ZWOqLZUYJ2HfNzUE4kITShdACwxRLu3ruEgDdH
 3OCwrAMlr9cnJ135YpXkO3g5KZVWVWYcVUJuAYDzgUhxXB7GNlIEpAyI8GCFuoiB5bFL
 mDygdFEs/E2WFX8ScS2/UxWvyNcmmQyCB77GzzwlrW/3dRSp936x9B6Qc07lVkZR/ROf
 eTjthJMgvqZnKir5utxDSHINu5IcoN7na0qtL3CPQE9/rAL0odDChAQDicV7+6pYpIfZ
 zaGX4vQBDHIt1j/SX/IzZhhOMnnoGpzwk91u6xAjDOiZDwHzOusu/i73BgA0W1hGyIEg
 NX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683741339; x=1686333339;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NcQONxJjIebKe62o9+wWxYQ6fgF38ifEIFgjnI7lG0U=;
 b=kSzqxm//IxOdr+ZXWthjD8ppD/SgDSCgW5JPC0wzICFpwrlrtHE33RxgMTznwvvOew
 j+bhPxhRQO/yVWBtRrMhyt9CpRqmptcYRBfx2nHQAaSu+zBvNAkClrxt/ZeG1kIoIpZI
 TtiY40iEWNzytbBqVomi01FC039tsGAv87pK3DHxTBhCFASYBjTWTC+3AWajn+HV0s2C
 F1Jel9fyDyvOapEQjhbCZpxlYpz1SN85BFH6jDUCwv2BuOF9/64uTUBT6k974CtqZo0L
 kLaX2ddg3erus1UlYiYmQ5K/IuFoVHeOv7AfaFq5OjHFvgAN2NeVeehAt7qlPiXw/jtR
 l4Gw==
X-Gm-Message-State: AC+VfDzQxUskathsYAthSUYlGAfqtaFXlMaRHES3b84q+DNboseHQ68F
 FbYEMunCWEf6VHNbNqNvyGU=
X-Google-Smtp-Source: ACHHUZ6YjIwAq7EzQm2r7QbZ4JdgqKCG9sTsBubiLwEJYaxLx+kcM4VG/Km5icyq1WXIEmWh1ZrrEg==
X-Received: by 2002:a17:907:2d92:b0:966:612b:c292 with SMTP id
 gt18-20020a1709072d9200b00966612bc292mr13318524ejc.11.1683741339195; 
 Wed, 10 May 2023 10:55:39 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-012-021-051.89.12.pool.telefonica.de.
 [89.12.21.51]) by smtp.gmail.com with ESMTPSA id
 fe18-20020a1709072a5200b00968242f8c37sm2963705ejc.50.2023.05.10.10.55.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 10:55:38 -0700 (PDT)
Date: Wed, 10 May 2023 17:55:34 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Gurchetan Singh <gurchetansingh@chromium.org>
CC: kraxel@redhat.com, marcandre.lureau@redhat.com, akihiko.odaki@gmail.com,
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_3/5=5D_hw/display/virtio-gpu-v?=
 =?US-ASCII?Q?irgl=3A_define_callbacks_in_realize_function?=
In-Reply-To: <cbd2a5b1-49d6-09c3-ee1e-3fbce5ed91b0@linaro.org>
References: <20230428164823.789-1-gurchetansingh@google.com>
 <20230428164823.789-3-gurchetansingh@google.com>
 <0DAAC63B-0C0F-44C4-B7EB-ACD6C9A36BF1@gmail.com>
 <cbd2a5b1-49d6-09c3-ee1e-3fbce5ed91b0@linaro.org>
Message-ID: <D41A9805-C27F-4111-B46F-62316C2A9961@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 10=2E Mai 2023 07:56:15 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <phil=
md@linaro=2Eorg>:
>On 30/4/23 23:48, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 28=2E April 2023 16:48:21 UTC schrieb Gurchetan Singh <gurchetansing=
h@chromium=2Eorg>:
>>> From: Gurchetan Singh <gurchetansingh@chromium=2Eorg>
>>>=20
>>> This reduces the amount of renderer backend specific needed to
>>> be exposed to the GL device=2E  We only need one realize function
>>> per renderer backend=2E
>>>=20
>>> Signed-off-by: Gurchetan Singh <gurchetansingh@chromium=2Eorg>
>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>>> ---
>>> v1: - Remove NULL inits (Philippe)
>>>     - Use VIRTIO_GPU_BASE where possible (Philippe)
>>> v2: - Fix unnecessary line break (Akihiko)
>>>=20
>>> hw/display/virtio-gpu-gl=2Ec     | 15 ++++++---------
>>> hw/display/virtio-gpu-virgl=2Ec  | 35 ++++++++++++++++++++++++--------=
--
>>> include/hw/virtio/virtio-gpu=2Eh |  7 -------
>>> 3 files changed, 31 insertions(+), 26 deletions(-)
>
>
>>> void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp)
>>> {
>>> -    VirtIOGPU *g =3D VIRTIO_GPU(qdev);
>>> +    VirtIODevice *vdev =3D VIRTIO_DEVICE(qdev);
>>> +    VirtioDeviceClass *vdc =3D VIRTIO_DEVICE_GET_CLASS(vdev);
>>> +
>>> +    VirtIOGPUBase *bdev =3D VIRTIO_GPU_BASE(qdev);
>>> +    VirtIOGPUBaseClass *vbc =3D VIRTIO_GPU_BASE_GET_CLASS(bdev);
>>> +
>>> +    VirtIOGPU *gpudev =3D VIRTIO_GPU(qdev);
>>> +    VirtIOGPUClass *vgc =3D VIRTIO_GPU_GET_CLASS(gpudev);
>>> +
>>> +    vbc->gl_flushed =3D virtio_gpu_virgl_flushed;
>>> +    vgc->handle_ctrl =3D virtio_gpu_virgl_handle_ctrl;
>>> +    vgc->process_cmd =3D virtio_gpu_virgl_process_cmd;
>>> +    vgc->update_cursor_data =3D virtio_gpu_virgl_update_cursor;
>>> +
>>> +    vdc->reset =3D virtio_gpu_virgl_reset;
>>=20
>> A realize method is supposed to modify a single instance only while we'=
re modifying the behavior of whole classes here, i=2Ee=2E will affect every=
 instance of these classes=2E This goes against QOM design principles and w=
ill therefore be confusing for people who are familiar with QOM in particul=
ar and OOP in general=2E I think the code should be cleaned up in a differe=
nt way if really needed=2E
>
>Doh I was too quick and totally missed this was an instance,
>thanks for being careful Bernhard!

My obligation ;)

I wonder if *_GET_CLASS() macros could return const pointers in order for =
the compiler to catch such uses? Are there use cases at all in retrieving n=
on-const class pointers from instances?

Best regards,
Bernhard

