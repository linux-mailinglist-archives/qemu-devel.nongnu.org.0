Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B800B4B7441
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 19:06:07 +0100 (CET)
Received: from localhost ([::1]:50404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK2DG-0002er-Cg
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 13:06:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK27I-0007Op-HS
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:59:58 -0500
Received: from [2a00:1450:4864:20::433] (port=33562
 helo=mail-wr1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK27F-0000Jm-VX
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 12:59:56 -0500
Received: by mail-wr1-x433.google.com with SMTP id e3so33557783wra.0
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 09:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QdTYeDZ6DuyxcJzqQqQeAlebg7soHWD2SDdKzIc3ngc=;
 b=EmQJ4LLsVe+xo8TqlRzqYn/4foZm9EGERCwhen0aay6C13kQ2IicCZHyxMjfzxnYho
 Mwusi3z6wYmefO9y254H1ZRqY+VqZfiJ2VpdYCYne1l4xNihmgE73d+IeE0GMiDtwrOn
 CQuyhM4V/bEa9G8QI/LQ2hGTQJVVTksFuHVXpSZkNiDQhgqXJ913FNEZUfqh9ZWfOpuu
 evcUni9NzaV1lqcZuFkK97ltWYycbUK74yfsSmj5lSLU0zAnlTFYJmcxVUowxvXJrABV
 mJgdcQyvxwPzxlPns7p0hda0csQNnSDJVZ8/vnrRfjctCY8yrpDKLUVvxYmXwPhyEjjx
 sAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QdTYeDZ6DuyxcJzqQqQeAlebg7soHWD2SDdKzIc3ngc=;
 b=leizLeafB4kz8c7WD1lkTB+QX4dGzpSbr9nmwMUCGQWDvAhq7yPm1NMVfKKhMlWUEy
 7pGVYubaM9VxZ4cEY2JEH9qAKtYO3MfuN0t3qqWYheL8GYvy34kCkuswc6Ao1BODNkqv
 8czQzqESKEWT6sNASE09KBZGWEHoI5hxAAbybReNgooEjxTdIwCeDb2fnvsqIBlLKWYc
 3IQO7X8oKjZjMRk7Wog9+F3yfisbF88WmO25EGAMiHB6lyKUYU2J+WE6TCDqjzeU4AmM
 d12LhkO21mQOz3iaYpAioHWnryqv5NaVUgrl1odvluii/NFZc1VPJBGboKQAJpr9kDrr
 cJ6w==
X-Gm-Message-State: AOAM530FSb+TvSDD40IcJ6d4WHxYDXcuDUHg/nMQoZh6xU3w3SyXyASQ
 gb6OvxyHxQZQAuIzWDwRylWsNqxZnsLo83Q5MuIpSw==
X-Google-Smtp-Source: ABdhPJxlYw9Mgc+D+M0ZUWInu6UsfNMm7aFz1gw4rzNllfn0iVJZZbPqAksmoz7AYmAQukc8nWcFACDMiypAUzifO0c=
X-Received: by 2002:a5d:498d:: with SMTP id r13mr146141wrq.172.1644947988424; 
 Tue, 15 Feb 2022 09:59:48 -0800 (PST)
MIME-Version: 1.0
References: <20220127150548.20595-1-quintela@redhat.com>
 <20220127150548.20595-19-quintela@redhat.com>
 <CAFEAcA8+ri-ndQv0b10yfUjSJZwH5Ec08S10_-2k5C8_OMYYDg@mail.gmail.com>
 <7e091698-d5db-689c-4c19-b5a7eede51f3@kaod.org>
In-Reply-To: <7e091698-d5db-689c-4c19-b5a7eede51f3@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 17:59:37 +0000
Message-ID: <CAFEAcA8ENTOMS2xzEeMr6hq-j_WE9musmq5mhQmSBAfHUt-M0Q@mail.gmail.com>
Subject: Re: [PULL 18/38] Remove unnecessary minimum_version_id_old fields
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::433
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 15 Feb 2022 at 17:34, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 2/15/22 18:13, Peter Maydell wrote:
> > No, as the commit message notes, it deliberately did not change
> > that one vmstate, because at the time of writing the patch
> > that was the one vmstate that really was still using
> > load_state_old. As it happens commit 8f91aca7ff0044b hit
> > master first, removing that use of load_state_old (but
> > forgetting to remove the minimum_version_id_old field along
> > with it),
>
> If I remember well, at the time of this patch, we were both working
> on the same part and I thought that removing all minimum_version_id_old
> in one go was better.

I would tend to disagree, but we got to the right place anyway,
so it doesn't matter. I've just posted the patch that removes
the load_state_old and minimum_version_id_old fields from
the struct definition entirely; it's nice to be able to
finally drop that little bit of legacy support.

-- PMM

