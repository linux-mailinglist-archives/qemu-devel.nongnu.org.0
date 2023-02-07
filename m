Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F09B68DF0D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:36:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRsm-0002AC-VY; Tue, 07 Feb 2023 12:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRsi-00026I-BN
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:35:51 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRsg-0003va-QM
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:35:48 -0500
Received: by mail-pj1-x102c.google.com with SMTP id pj3so15769891pjb.1
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 09:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uDpP8pyZ3B0W/qem07sUoXVhVvCneImrFH8GUQ7flOs=;
 b=PvGyc1/ZpWDXUP7gA9QsujTveX+qxQwOHTEMn4ewBLYyOFmTwCrX90bH0bWoBq8WXd
 I6QVhwSyZ8tkFFjJqKUn0l3R0znzEmVzG7N/3Sq+Zq+tdfC5z4NjRHt6Mwym4ApfC6YT
 yPXfWQDYogEv/Au9N8hsJ4yWtu/U4sesB6bmtM+36vN+j1WxoDM0wLJZA6ueWjCrmXwj
 D/k1xhaQFVNwAV3GnytowRM0Ee35/K67lIQS9SMuHXVd4qu2EQHeTSjoeR/5kC0JnZhB
 6ShtwtC8G/a32JRL+dIslrJC85Fk/ZYPlEKaQqSFLl34NSrKwUf3/TAo4Fq+2mnlWmgz
 4dIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uDpP8pyZ3B0W/qem07sUoXVhVvCneImrFH8GUQ7flOs=;
 b=y90sObDMSFozrlHwoO3tOI3Mrke+wkddvOxp02SgwWriCkj9Uyry8UNwGVl8aXUbtp
 3nznHf5EKVNRxwXo8bRWVkiSA2Jw2PKy1sm4AGP6fa4KQ3LiZ3WUT0sGHTxEDIv0hvgJ
 0vdduY5mYsHgpqU237iful4BGXbknnU63NPh5c2uiwq4QC9Iwkwzia8gFFUceMHQt3Lx
 s9qjAuLVbYzZTEZmyUNXzrM90rPwDp7GnZVSeXfTA9E04yELpeCZdUfpRnq5m+s9F51A
 Qb12LNV7T94wwnVwptLFadOQUTq1MAx2hRZwBH7qYfucOHW4qM7NZT4duZQK1TZU4nGj
 bspg==
X-Gm-Message-State: AO0yUKVUTXkgA/S+omTWjOLgQQlcQ3JOQNZvkErU8v4XKpOKQua5OMRa
 CUI0shY8wtmZB2KMI9s22OUjadHcvnE6olhI8wqp7w==
X-Google-Smtp-Source: AK7set9lM6+3yb57S/hI2pGbD2evP4tWtnSd02ZOZ9tEgqUcif8r1BaAavxtHTZCUGUnJ3kwhUsVQ7RMFnXkiqx7p4s=
X-Received: by 2002:a17:90b:3906:b0:230:eadf:4a2e with SMTP id
 ob6-20020a17090b390600b00230eadf4a2emr839099pjb.137.1675791345431; Tue, 07
 Feb 2023 09:35:45 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675193329.git.balaton@eik.bme.hu>
 <6c788d629e8caef69041f8fbb18bfe169285b58e.1675193329.git.balaton@eik.bme.hu>
In-Reply-To: <6c788d629e8caef69041f8fbb18bfe169285b58e.1675193329.git.balaton@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 17:35:34 +0000
Message-ID: <CAFEAcA_MZO15HGZiNWSXxO8L7V9oD8CjU_Z0-7GXvVKs9NiB0A@mail.gmail.com>
Subject: Re: [PATCH 5/6] usb/ohci: Add trace points for register access
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Howard Spoelstra <hsp.cat7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Tue, 31 Jan 2023 at 19:39, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> To help debugging add trace points that print values read from or
> written to the device's registers.
>
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/usb/hcd-ohci.c   | 19 +++++++++++++++++++
>  hw/usb/trace-events |  4 ++++
>  2 files changed, 23 insertions(+)
>
> diff --git a/hw/usb/hcd-ohci.c b/hw/usb/hcd-ohci.c
> index c5306378cc..c5bec4e4d7 100644
> --- a/hw/usb/hcd-ohci.c
> +++ b/hw/usb/hcd-ohci.c
> @@ -235,6 +235,15 @@ struct ohci_iso_td {
>
>  #define OHCI_HRESET_FSBIR       (1 << 0)
>
> +static const char *ohci_reg_names[] = {
> +    "HcRevision", "HcControl", "HcCommandStatus", "HcInterruptStatus",
> +    "HcInterruptEnable", "HcInterruptDisable", "HcHCCA", "HcPeriodCurrentED",
> +    "HcControlHeadED", "HcControlCurrentED", "HcBulkHeadED", "HcBulkCurrentED",
> +    "HcDoneHead", "HcFmInterval", "HcFmRemaining", "HcFmNumber",
> +    "HcPeriodicStart", "HcLSThreshold", "HcRhDescriptorA", "HcRhDescriptorB",
> +    "HcRhStatus"
> +};

> @@ -1582,6 +1593,10 @@ static uint64_t ohci_mem_read(void *opaque,
>              trace_usb_ohci_mem_read_bad_offset(addr);
>              retval = 0xffffffff;
>          }
> +        if (addr != 0xc || retval) {
> +            trace_usb_ohci_mem_read(size, ohci_reg_names[addr >> 2],
> +                                    addr, addr >> 2, retval);
> +        }

It's a bit tricky to be sure that this doesn't index off the
end of the reg names array. Could you wrap the array access in a
function that has a check that the index is in bounds?

Otherwise looks good.

thanks
-- PMM

