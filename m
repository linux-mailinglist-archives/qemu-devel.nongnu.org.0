Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CA24BF929
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 14:22:57 +0100 (CET)
Received: from localhost ([::1]:56790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMV83-0000jg-Sl
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 08:22:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMUs8-0001RW-Tw
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 08:06:28 -0500
Received: from [2607:f8b0:4864:20::112b] (port=45502
 helo=mail-yw1-x112b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMUs3-0002uK-CT
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 08:06:28 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2d641c31776so172777307b3.12
 for <qemu-devel@nongnu.org>; Tue, 22 Feb 2022 05:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Xr1h3zvISWjGsocXLvU64IU/Uu4YnNdWwlFS8pdh7b0=;
 b=dNvc6aKtVI6VAcDt2xpvwcYEmPTLXOSovhkNFyt6aaPK9U3/ENT+/dOue0+j75FpZg
 367Bna9kICOOCXhPo0m3xQOoqrxaZWt6RoSrAoe+4vSlemLbjJvrz9mOyhc+XVjTli8v
 d8A1S0bZEb3eNWegqfdaCp75MhHvD1u3mPbuS6P6QekzBNeVek6UjDo0A76ZrTYgfRz8
 Ec1Hrt0u/YmvLxEGICJpJ8eQ3HKJFHTy2kOLzaqj7snO/X7HGDLYHyiFvIDwAYuwbmrg
 gUzGwIW17UPU8TkAACi5x33SO/0EG518DFcPA0+54BDDyIYLgeP5kKy1Ien9YLKmmZJV
 PVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Xr1h3zvISWjGsocXLvU64IU/Uu4YnNdWwlFS8pdh7b0=;
 b=NFZoLWC8XGWLMhSNxzJgChCmWxjdYsLi5WAaOeVa7fsEUr7qkCwk2oMQHXyvKmZNaw
 1iGg5sPB/q2CEUBNy7lzfY3B7OutFsnA+EZwnp7Hmhr0VuZGNYVgEzSGkNdh4J/nqXaN
 3yeAzO+2VRtl6tafpBiM2bYemTBOUqD4hI/V7BXkTv7R/O0CLmo+Q7f1sMlPvQ85CLRT
 3aAWe2otAbhe1IyjXAZp3NkQkFdGYeWbpgwyMnA7/3O9E/foYItoITzKArTPCspRdcc3
 G0Y1il/ORSFJUCOz47rHUapUBooNoZCjGTEmxmPJp8MN5ERc+6hs1EkhAgcGIyni+/IV
 9LAw==
X-Gm-Message-State: AOAM530BuYAjeBgiuxzPwb5zB6BtPwIwNCwk7lWv85A8enOiWn9JTbbz
 DybDQ671Ko8h/s9cI9whcu3lkIJe4XmdE3ucf21qOA==
X-Google-Smtp-Source: ABdhPJw8hLBcUWADEFpk9ZDOVACD2Y3q794wD0BoG5AZzod8ZdwBy0YNwWgiF8qDbTX96KqSHzJRyGihxVLeyu668kQ=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr24103994ywh.329.1645535180769; Tue, 22
 Feb 2022 05:06:20 -0800 (PST)
MIME-Version: 1.0
References: <20220221192123.749970-1-peter.maydell@linaro.org>
 <87a6ejnm80.fsf@pond.sub.org> <043096b3-aadf-4f2a-b5e2-c219d2344821@gmail.com>
In-Reply-To: <043096b3-aadf-4f2a-b5e2-c219d2344821@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Feb 2022 13:06:09 +0000
Message-ID: <CAFEAcA8OMB_+rxrS1pk4YJ0avj-ZSdyEROJyppOT1+0s6447MQ@mail.gmail.com>
Subject: Re: [PATCH RFC 4/4] rtc: Have event RTC_CHANGE identify the RTC by
 QOM path
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 22 Feb 2022 at 12:56, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
> On 22/2/22 13:02, Markus Armbruster wrote:
> > Event RTC_CHANGE is "emitted when the guest changes the RTC time" (and
> > the RTC supports the event).  What if there's more than one RTC?
>
> w.r.t. RTC, a machine having multiple RTC devices is silly...

I don't think we have any examples in the tree currently, but
I bet real hardware like that does exist: the most plausible
thing would be a board where there's an RTC built into the SoC
but the board designers put an external RTC on the board (perhaps
because it was better/more accurate/easier to make battery-backed).

In fact, here's an old bug report from a user trying to get
their Debian system to use the battery-backed RTC as the
"real" one rather than the non-battery-backed RTC device
that's also part of the arm board they're using:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D785445

-- PMM

