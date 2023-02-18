Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD20669B721
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Feb 2023 01:47:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pTBNt-0000CK-M4; Fri, 17 Feb 2023 19:47:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pTBNr-0000Bm-Ey; Fri, 17 Feb 2023 19:47:23 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pTBNp-0004Qu-OF; Fri, 17 Feb 2023 19:47:23 -0500
Received: by mail-ed1-x52a.google.com with SMTP id eg30so10337153edb.7;
 Fri, 17 Feb 2023 16:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NEHK813y4oEUqCf2Y89xf5DDxDT8iVyjNz4gG827eZQ=;
 b=dyC4PhEG2Bpl+s0AkexmfyZOANf2QyZlbK0HkO7ILGRgFneTbutCdBv1b92LD4o1hr
 wHM1ICId1spZwO8uA/+U6ppqIwshXo4fGQe6ou/B1yQYcKIyTOWEbXNqlBSXNhjP70Sk
 vVlfc9LQ0ikuwFaNXKdRk58Gxx41FzPcvmdrPp5wOBsS9g0kKp27cozwdj1n9ftFYjkM
 xhi8YFmU6gDWQrHgje5edFk2QBCg8JvGDa7HFzMWsz65tHG3LT4NQUiVSXRkWhMIAxHq
 2OZP+t/ZRso5rHSV4n2CzGkgdryo7FIL/7oUjDnHgYgXjDj1yMKnlKkpflDKFGQpgyOP
 7NRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NEHK813y4oEUqCf2Y89xf5DDxDT8iVyjNz4gG827eZQ=;
 b=X5ucccVEO38KKfKWATU1uG9h5zVqamjgBzfcepXzj3gYhIPe6kmi19j1k4YbzMTaFk
 bro5JOYHkMNdn+HX3kbvDqHbaWlk2vGDxosJpRYdR0ohVQSBkyPg5s/irewWLyyIWKHI
 7G5pnCyDQZcVFbERezNQce+irM9ijVQ+9PjyBa+zohKZ+unCrcu4feRmBkdwzKc0g6c7
 BzI5dZmG0LLO93scEPVGDbwP8D+/ttGg7A59fvQ2Ijkqja//6Z/dBWgWeOYRWl77MWR0
 48rD0JeDIdQ+pKZwZ6YMdVNqiX1JIsAa2BFv6NSwBYwPL49Qve1uB1iQTNqtohSXQS4D
 2JwA==
X-Gm-Message-State: AO0yUKXd0hHXZyjVVIXxkBHsoMxpSeUwBdBzJyVxn1e21LMBfriL7PtC
 YLs4Vl3lkIETsJz8L6lADuD0xIDofqI=
X-Google-Smtp-Source: AK7set8FdL9nJdqach6Deb24zr04hJZvyPgyAzA5Gj4nV4eQ/4nzdNpEPe8awSnTx3nE0U2n4IVCLQ==
X-Received: by 2002:a17:906:4e90:b0:8a5:8620:575 with SMTP id
 v16-20020a1709064e9000b008a586200575mr3160821eju.3.1676681238484; 
 Fri, 17 Feb 2023 16:47:18 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-011-045-171.77.11.pool.telefonica.de.
 [77.11.45.171]) by smtp.gmail.com with ESMTPSA id
 j11-20020a170906474b00b0088f8a61eb48sm2720015ejs.154.2023.02.17.16.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 16:47:18 -0800 (PST)
Date: Sat, 18 Feb 2023 00:47:09 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
CC: qemu-ppc@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_1/2=5D_qemu/typedefs=3A_Sort_in_ca?=
 =?US-ASCII?Q?se-insensitive_alphabetical_order_=28again=29?=
In-Reply-To: <20230217141832.24777-2-philmd@linaro.org>
References: <20230217141832.24777-1-philmd@linaro.org>
 <20230217141832.24777-2-philmd@linaro.org>
Message-ID: <7120D9B2-2ED1-4D06-A98B-9FB2CB95C6CE@gmail.com>
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



Am 17=2E Februar 2023 14:18:31 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>Following the recommendation added in commit a98c370c46
>("typedefs: (Re-)sort entries alphabetically"), and similarly
>to commit 64baadc272 ("Sort include/qemu/typedefs=2Eh"), sort
>again the type definitions (in case-insensitive alphabetical
>order, using 'sort --ignore-case')=2E

Since it can be done mechanically: Maybe add a checkpach check?

>
>Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro=2Eorg>
>---
> include/qemu/typedefs=2Eh | 10 +++++-----
> 1 file changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/include/qemu/typedefs=2Eh b/include/qemu/typedefs=2Eh
>index c7c8a85315=2E=2Edf4b55ac65 100644
>--- a/include/qemu/typedefs=2Eh
>+++ b/include/qemu/typedefs=2Eh
>@@ -49,6 +49,7 @@ typedef struct DeviceState DeviceState;
> typedef struct DirtyBitmapSnapshot DirtyBitmapSnapshot;
> typedef struct DisplayChangeListener DisplayChangeListener;
> typedef struct DriveInfo DriveInfo;
>+typedef struct DumpState DumpState;
> typedef struct Error Error;
> typedef struct EventNotifier EventNotifier;
> typedef struct FlatView FlatView;
>@@ -56,6 +57,7 @@ typedef struct FWCfgEntry FWCfgEntry;
> typedef struct FWCfgIoState FWCfgIoState;
> typedef struct FWCfgMemState FWCfgMemState;
> typedef struct FWCfgState FWCfgState;
>+typedef struct GraphicHwOps GraphicHwOps;
> typedef struct HostMemoryBackend HostMemoryBackend;
> typedef struct I2CBus I2CBus;
> typedef struct I2SCodec I2SCodec;
>@@ -90,10 +92,10 @@ typedef struct PCIDevice PCIDevice;
> typedef struct PCIEAERErr PCIEAERErr;
> typedef struct PCIEAERLog PCIEAERLog;
> typedef struct PCIEAERMsg PCIEAERMsg;
>-typedef struct PCIESriovPF PCIESriovPF;
>-typedef struct PCIESriovVF PCIESriovVF;
> typedef struct PCIEPort PCIEPort;
> typedef struct PCIESlot PCIESlot;
>+typedef struct PCIESriovPF PCIESriovPF;
>+typedef struct PCIESriovVF PCIESriovVF;
> typedef struct PCIExpressDevice PCIExpressDevice;
> typedef struct PCIExpressHost PCIExpressHost;
> typedef struct PCIHostDeviceAddress PCIHostDeviceAddress;
>@@ -106,6 +108,7 @@ typedef struct QBool QBool;
> typedef struct QDict QDict;
> typedef struct QEMUBH QEMUBH;
> typedef struct QemuConsole QemuConsole;
>+typedef struct QEMUCursor QEMUCursor;
> typedef struct QEMUFile QEMUFile;
> typedef struct QemuLockable QemuLockable;
> typedef struct QemuMutex QemuMutex;
>@@ -132,9 +135,6 @@ typedef struct VirtIODevice VirtIODevice;
> typedef struct Visitor Visitor;
> typedef struct VMChangeStateEntry VMChangeStateEntry;
> typedef struct VMStateDescription VMStateDescription;
>-typedef struct DumpState DumpState;
>-typedef struct GraphicHwOps GraphicHwOps;
>-typedef struct QEMUCursor QEMUCursor;
>=20
> /*
>  * Pointer types

