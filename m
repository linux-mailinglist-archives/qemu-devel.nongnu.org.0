Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF60A63D911
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 16:18:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Opw-0007v2-V0; Wed, 30 Nov 2022 10:17:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1p0Opu-0007tq-VU
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 10:17:22 -0500
Received: from smtp-out2.suse.de ([195.135.220.29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <farosas@suse.de>) id 1p0Opt-0002pj-BL
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 10:17:22 -0500
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 385E91FD63;
 Wed, 30 Nov 2022 15:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669821439; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QcTTRPKkTIUwvH88+W6fyghGQ8GzkqXlHaKkuYYM5T0=;
 b=isS7ugm+ybRZnnBkoENhCWoKd96aOHt0qHkPUj+stAhu4QY88LczVA4wkbljxIly0Zov8i
 go0KWpVD9tK5o/C/lvV2+aOtmhOwX4vKhYx0Vb50/5hQrB2F4y71+fGE+8bdsuJSJlAOvl
 rd9P4CmsKorVLDlFZhU+GolTf5E2Qeg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669821439;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QcTTRPKkTIUwvH88+W6fyghGQ8GzkqXlHaKkuYYM5T0=;
 b=ZjqsuATY70JqH1t17AfYgL8ncUhb43yvpkJfmkezIAqIDvJ//VwzfYG7ow15DReHXzx9Nr
 WQ4GN25cZ2IEHvDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B8B691331F;
 Wed, 30 Nov 2022 15:17:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kqD6H/5zh2NsGwAAMHmgww
 (envelope-from <farosas@suse.de>); Wed, 30 Nov 2022 15:17:18 +0000
From: Fabiano Rosas <farosas@suse.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Richard Henderson
 <richard.henderson@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Thomas Huth <thuth@redhat.com>, Yanan Wang
 <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, Marcel
 Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH-for-8.0 2/2] hw: Reduce "qemu/accel.h" inclusion
In-Reply-To: <20221130135641.85328-3-philmd@linaro.org>
References: <20221130135641.85328-1-philmd@linaro.org>
 <20221130135641.85328-3-philmd@linaro.org>
Date: Wed, 30 Nov 2022 12:17:16 -0300
Message-ID: <878rjs4glf.fsf@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=195.135.220.29; envelope-from=farosas@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Move "qemu/accel.h" include from the heavily included
> "hw/boards.h" to hw/core/machine.c, the single file using
> the AccelState definition.

Do you mean accel_init_interfaces() and ACCEL_GET_CLASS? I don't see
AccelState explicitly.

Anyway,

Reviewed-by: Fabiano Rosas <farosas@suse.de>

> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/core/machine.c   | 1 +
>  include/hw/boards.h | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 8d34caa31d..42fc6f1e84 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -12,6 +12,7 @@
>=20=20
>  #include "qemu/osdep.h"
>  #include "qemu/option.h"
> +#include "qemu/accel.h"
>  #include "qapi/qmp/qerror.h"
>  #include "sysemu/replay.h"
>  #include "qemu/units.h"
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 90f1dd3aeb..f00f74c5f4 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -6,7 +6,6 @@
>  #include "exec/memory.h"
>  #include "sysemu/hostmem.h"
>  #include "sysemu/blockdev.h"
> -#include "qemu/accel.h"
>  #include "qapi/qapi-types-machine.h"
>  #include "qemu/module.h"
>  #include "qom/object.h"

