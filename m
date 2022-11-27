Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E8B6399DF
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Nov 2022 11:19:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ozEj0-0007Gl-RY; Sun, 27 Nov 2022 05:17:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ozEiz-0007Gc-1B
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 05:17:25 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1ozEiw-00082f-BA
 for qemu-devel@nongnu.org; Sun, 27 Nov 2022 05:17:23 -0500
Received: by mail-wr1-x42c.google.com with SMTP id z4so12611624wrr.3
 for <qemu-devel@nongnu.org>; Sun, 27 Nov 2022 02:17:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W+IJRhWa7WAV3z296vIY9X/yNfQdVceZK8DvAJtm6+s=;
 b=BPiXqijwl+ulIPyNoF1YFbK7F16cSkhBgX2CMNgmb5vlh5b+reVogKFQtZmERONz33
 PWknJVZwLkLdYu0efNU8o/BJv/BUXK/dmYfEnkxJTlQZbaNy2RB0Ur1kAewU4DFj0Cx7
 tpcI8mMdnr4f4V0iwcqMp69xnm7w4pgIktkobD5CzGemyoz2yVlFVXBWfsuw1FOFFt8F
 MI9hv/cEAToRg538nSmBQExLCR3lUwkN9ulAxV5NBtr6Ttu7PhfeKh7WTGTJRlF7LIS0
 chXljdIrXKHx7WMZAHYb3FtOPl9YvTkUN3WueM+60h/QpSsn+JbzEmPCMelqF4RQPJxv
 5q0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+IJRhWa7WAV3z296vIY9X/yNfQdVceZK8DvAJtm6+s=;
 b=AwxQU65sH5IkUaN4NUDDS8tYZl6+IljYcgq/qvRDVQeNqYeCXydwbXZ+lugvk+t/t3
 1OnmzMKAGOHULI6n5SPfnHpvGcx1jtFywA4K3pKejHJRdBGcoelTy4gqOW7DryCVu05k
 sUiL7RTucUL1hDyu1hAjF1nk5AL2vd8CZdpOTxfrxP7d4XDil4F/qbfS56cXr50/aCAd
 ekVswB2RqelDq6jUc6CL9PHDnGPKlMPg8qvgUoQvW7aN42tG27ghprr2vKawxZiJoEXu
 d5xOsDucAMwSf/JVFzGTyqFt4usO8GMJQxvc5e+E/T6LJZWqUFkVpsgXqMVF28LGnfVw
 AeHQ==
X-Gm-Message-State: ANoB5pkcTHXowcuaAnP6whATvPJqt6VF/AKL6sygn8Pqa7G5tMegu9Kn
 lqEzV76OqEC/xjjVjjxAvl7Cq8Df1/0=
X-Google-Smtp-Source: AA0mqf6743zGF/LBGXgdwCOXTqz+8b0kDzgmMtHRrwNwuy2UgzMOcXvH9J4Ur2QWTC+dlsUr6VxELg==
X-Received: by 2002:adf:f681:0:b0:242:6af:8a2d with SMTP id
 v1-20020adff681000000b0024206af8a2dmr6376047wrp.188.1669544240302; 
 Sun, 27 Nov 2022 02:17:20 -0800 (PST)
Received: from [127.0.0.1] (dynamic-078-054-100-240.78.54.pool.telefonica.de.
 [78.54.100.240]) by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003b4ff30e566sm23633956wms.3.2022.11.27.02.17.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Nov 2022 02:17:19 -0800 (PST)
Date: Sun, 27 Nov 2022 10:17:13 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
CC: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 sgarzare@redhat.com, Christian Borntraeger <borntraeger@linux.ibm.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_2/5=5D_include/hw=3A_VM_state_tak?=
 =?US-ASCII?Q?es_precedence_in_virtio=5Fdevice=5Fshould=5Fstart?=
In-Reply-To: <20221125173043.1998075-3-alex.bennee@linaro.org>
References: <20221125173043.1998075-1-alex.bennee@linaro.org>
 <20221125173043.1998075-3-alex.bennee@linaro.org>
Message-ID: <E28CE5C3-8965-45C5-9076-7D7B8CDECAB8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42c.google.com
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



Am 25=2E November 2022 17:30:40 UTC schrieb "Alex Benn=C3=A9e" <alex=2Eben=
nee@linaro=2Eorg>:
>The VM status should always preempt the device status for these
>checks=2E This ensures the device is in the correct state when we
>suspend the VM prior to migrations=2E This restores the checks to the
>order they where in before the refactoring moved things around=2E
>
>While we are at it lets improve our documentation of the various
>fields involved and document the two functions=2E
>
>Fixes: 9f6bcfd99f (hw/virtio: move vm_running check to virtio_device_star=
ted)
>Fixes: 259d69c00b (hw/virtio: introduce virtio_device_should_start)
>Signed-off-by: Alex Benn=C3=A9e <alex=2Ebennee@linaro=2Eorg>
>Tested-by: Christian Borntraeger <borntraeger@linux=2Eibm=2Ecom>
>---
> include/hw/virtio/virtio=2Eh | 24 +++++++++++++++++++-----
> 1 file changed, 19 insertions(+), 5 deletions(-)
>
>diff --git a/include/hw/virtio/virtio=2Eh b/include/hw/virtio/virtio=2Eh
>index 0f612067f7=2E=2E48f539d0fe 100644
>--- a/include/hw/virtio/virtio=2Eh
>+++ b/include/hw/virtio/virtio=2Eh
>@@ -133,6 +133,13 @@ struct VirtIODevice
>     bool broken; /* device in invalid state, needs reset */
>     bool use_disabled_flag; /* allow use of 'disable' flag when needed *=
/
>     bool disabled; /* device in temporarily disabled state */
>+    /**
>+     * @use_started: true if the @started flag should be used to check t=
he
>+     * current state of the VirtIO device=2E Otherwise status bits
>+     * should be checked for a current status of the device=2E
>+     * @use_started is only set via QMP and defaults to true for all
>+     * modern machines (since 4=2E1)=2E
>+     */
>     bool use_started;
>     bool started;
>     bool start_on_kick; /* when virtio 1=2E0 feature has not been negoti=
ated */
>@@ -408,6 +415,17 @@ static inline bool virtio_is_big_endian(VirtIODevice=
 *vdev)
>     return false;
> }
>=20
>+

This adds an extra empty line=2E

>+/**
>+ * virtio_device_should_start() - check if device started

s/virtio_device_should_start/virtio_device_started/

Best regards,
Bernhard

>+ * @vdev - the VirtIO device
>+ * @status - the devices status bits
>+ *
>+ * Check if the device is started=2E For most modern machines this is
>+ * tracked via the @vdev->started field (to support migration),
>+ * otherwise we check for the final negotiated status bit that
>+ * indicates everything is ready=2E
>+ */
> static inline bool virtio_device_started(VirtIODevice *vdev, uint8_t sta=
tus)
> {
>     if (vdev->use_started) {
>@@ -428,15 +446,11 @@ static inline bool virtio_device_started(VirtIODevi=
ce *vdev, uint8_t status)
>  */
> static inline bool virtio_device_should_start(VirtIODevice *vdev, uint8_=
t status)
> {
>-    if (vdev->use_started) {
>-        return vdev->started;
>-    }
>-
>     if (!vdev->vm_running) {
>         return false;
>     }
>=20
>-    return status & VIRTIO_CONFIG_S_DRIVER_OK;
>+    return virtio_device_started(vdev, status);
> }
>=20
> static inline void virtio_set_started(VirtIODevice *vdev, bool started)

