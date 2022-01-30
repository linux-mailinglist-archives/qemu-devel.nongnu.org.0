Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDEF24A358F
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 11:03:39 +0100 (CET)
Received: from localhost ([::1]:60450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nE73a-00054s-Fq
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 05:03:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nE70Y-0003i2-2A
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 05:00:33 -0500
Received: from [2a00:1450:4864:20::430] (port=43827
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nE70T-00006H-AR
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 05:00:28 -0500
Received: by mail-wr1-x430.google.com with SMTP id v13so19613380wrv.10
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 02:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D/Dq/n3a2cacFsRp7SbZgSYk7wKKH12wz9Xle0XJ+oQ=;
 b=IlAV81bOnH586VIfR5jxQbw9gyw3OoEPSkzhuTeYXIMBOBCocM6tmiUxIkL/oMse+W
 mKjGtQ04LtwASJ77zSiGJjjnx7Dk5jXERook1ZdYBhBhEeapTunaSCrl1gQnPpFNATxW
 GGP/3QNrDvO+RjY69Zo+/HL9wPTpXO0vjnOXp9kafhwC4Ooh3vn7DacKEuqtf6G8awCK
 iOcKMMbjTrM8BL09NXh75Qz9vEBaOjeRGtoD/OCFpy+d9hpLUp8UVt0JlUEzjU9uo7oK
 ac2LRU76JwhXRoZ5+aBCJ7gNrlHRMLaQP+eO5mwhjwYMOqyVHHX0y2y2SrlrpXIuclOY
 jrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D/Dq/n3a2cacFsRp7SbZgSYk7wKKH12wz9Xle0XJ+oQ=;
 b=WfNyFX+Mf4t/5QXJGc51eL7uHmpW0UkTh1XaAclTAeDVkeKwDZ9KpmWH6OQ9MsSyFJ
 2mg3F1tSC/mzdUfVElNizF9Wg7MAM7Q1guems/ygbwl+YGKRSbYnhqKqrEvmgJVh3GHQ
 kmqQioFtY1fduGdmPLJtDpuo8MSyYNfTbfY+d8sKr/KWpghQELTOXcWvMLyh/zeORFqj
 PnreKdYdzY4osNtbJNTc/QZvu9XI7FZ6VxM2HDgYpqnG2rmudw+QHSRIz8rpDJpTGeqB
 i+8j77Xrzx/FAEpApbzVBH9gj60DhUSjcg85hSRqUDvUcgy3rD0ieMe5EkFI/bVx8SNN
 Hzsw==
X-Gm-Message-State: AOAM533F2Am2eMcadosL9JVmjDBzYjraQ8AYK2qONUEZblE1DLGYX9Jn
 9E9bmdTxHw0KOAwMBpAjAuX6nPVPqnZ0PsNQxHBscQ==
X-Google-Smtp-Source: ABdhPJxBtMdeeDGowZwQyNUKvAXsc+RDx1OrjoRm5gt8ME/hPg8niVJemXaYsb1f4VWGIzfOgiKJgR21b9nasgWk1QI=
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr4951191wry.319.1643536820056; 
 Sun, 30 Jan 2022 02:00:20 -0800 (PST)
MIME-Version: 1.0
References: <20220128183033.31998-1-quintela@redhat.com>
In-Reply-To: <20220128183033.31998-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 30 Jan 2022 10:00:08 +0000
Message-ID: <CAFEAcA_0DPM=cwn33jCB3j=ZKKRJtg6_GL6RHWPzY62S-w_RUQ@mail.gmail.com>
Subject: Re: [PULL 00/36] Migration 20220128 patches
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Laurent Vivier <Laurent@vivier.eu>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 28 Jan 2022 at 18:31, Juan Quintela <quintela@redhat.com> wrote:
>
> The following changes since commit b367db48126d4ee14579af6cf5cdbffeb9496627:
>
>   Merge remote-tracking branch 'remotes/aperard/tags/pull-xen-20220127' into staging (2022-01-28 11:05:29 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/juan.quintela/qemu.git tags/migration-20220128-pull-request
>
> for you to fetch changes up to 476ebf77fe8909ded10046edf26685bc28438162:
>
>   migration: Move temp page setup and cleanup into separate functions (2022-01-28 15:38:23 +0100)
>
> ----------------------------------------------------------------
> Migration Pull request (Take 2)
>
> Hi
>
> This time I have disabled vmstate canary patches form Dave Gilbert.
>
> Let's see if it works.
>
> Later, Juan.
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

