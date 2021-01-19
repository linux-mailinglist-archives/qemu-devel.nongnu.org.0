Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3992B2FB657
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 14:26:07 +0100 (CET)
Received: from localhost ([::1]:46984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1r1K-0003Hl-Az
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 08:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1qtP-0007KV-GC
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:17:58 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:43713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1qtM-0000Au-DF
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 08:17:54 -0500
Received: by mail-ed1-x52e.google.com with SMTP id n6so6378325edt.10
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 05:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1kn0wzKfFe8SrkPodV1F4n4IIclpoKf345ASNUGaPWM=;
 b=pSVxjjxgSa0ng66ZRpnVgzaG1Ml9Zm+9ZUwXNr/4ic7oLzDLbNrcpFv5YCfnUM8MD+
 RFX68RlZexeIFGKNLsWmIZMeglJIC7ysRhZ6UnvUEQawSppkgYIfUq0lYVuSQJ5uev+G
 BXsWxWEVLZ6+lxJNypAzEBp/PSSy1iIDWloA1D4D3N7XnnTm9nU6JhmmN0NnfX4iV1CT
 0aatc1ZYA09c0fNBHb7P79tMvrlDAOY7P+ALFAF0WDaMJ2iGczSCjF3wjUtZEvaq36IF
 AxrlQNAPEcrtAA9aYLcStqX5E9Pz6h7Xk90RsxZMcEtFTS+YSoy2CvPrQzXMsceNJg29
 iTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1kn0wzKfFe8SrkPodV1F4n4IIclpoKf345ASNUGaPWM=;
 b=n1ih4K16f/UMVT7gPJ2GtduUPiYmpIS+az/1uwwYfNOhgUN/psmHaDsFEUe025qQYM
 lKXWjWPcLah382EvLGbeAJNGhPpO8PNkxf/zB/gTdQicI8bpTQEpsKud5SB30RY41laG
 yfu8Or8WclXwF/aHgndVUk8ajdLC1/W+h4nMo52kcsATcDnuaDI3nzEwj+1h0IBKvBuK
 Os4++4ueYBQ3XMwpMjS3He6tdTT6TAIziKltp0nyoigU6yT0dqGhowqwRj5TbX9FNJk4
 ekdNn8wzc8X04CTqM05UBlr5hn7Wsoqlpy1umqxeo0k7Slz37RzhCtEkMAVU4k6E615u
 wN9w==
X-Gm-Message-State: AOAM533cqmxzOYfK93v2m1ORK01w7iAfN0MaC6op3ujhIVqLiUdO43m1
 LZbAnoYsWw9s1Yb6CJwiFUsJ/7bbAa8WNENJMqhyRA==
X-Google-Smtp-Source: ABdhPJx+YDin1ZarB6C3VK14+avzdsCfjKnFbqXGzs2eOocRcJ9mXkxgP7hcXhkl5HUFHIv1OnwvhB/ygHqaNfzIgus=
X-Received: by 2002:a50:9ee3:: with SMTP id a90mr3372270edf.44.1611062269265; 
 Tue, 19 Jan 2021 05:17:49 -0800 (PST)
MIME-Version: 1.0
References: <1610735646-13313-1-git-send-email-mihai.carabas@oracle.com>
 <1610735646-13313-4-git-send-email-mihai.carabas@oracle.com>
In-Reply-To: <1610735646-13313-4-git-send-email-mihai.carabas@oracle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 13:17:38 +0000
Message-ID: <CAFEAcA_WSzAZOx0mTbv5=6ozX5EXLbNNnwvNz4SoS_RV+b87yQ@mail.gmail.com>
Subject: Re: [PATCH 3/4] pvpanic : update pvpanic spec document
To: Mihai Carabas <mihai.carabas@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 15 Jan 2021 at 19:23, Mihai Carabas <mihai.carabas@oracle.com> wrote:
>
> Add pvpanic PCI device support details in docs/specs/pvpanic.txt.
>
> Signed-off-by: Mihai Carabas <mihai.carabas@oracle.com>
> ---
>  docs/specs/pvpanic.txt | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/docs/specs/pvpanic.txt b/docs/specs/pvpanic.txt
> index a90fbca..974aafd 100644
> --- a/docs/specs/pvpanic.txt
> +++ b/docs/specs/pvpanic.txt
> @@ -1,7 +1,7 @@
>  PVPANIC DEVICE
>  ==============
>
> -pvpanic device is a simulated ISA device, through which a guest panic
> +pvpanic device is a simulated device, through which a guest panic
>  event is sent to qemu, and a QMP event is generated. This allows
>  management apps (e.g. libvirt) to be notified and respond to the event.
>
> @@ -9,6 +9,9 @@ The management app has the option of waiting for GUEST_PANICKED events,
>  and/or polling for guest-panicked RunState, to learn when the pvpanic
>  device has fired a panic event.
>
> +The pvpanic device can be implemented as an ISA device (using IOPORT) or as a
> +PCI device.
> +
>  ISA Interface
>  -------------
>
> @@ -24,6 +27,14 @@ bit 1: a guest panic has happened and will be handled by the guest;
>         the host should record it or report it, but should not affect
>         the execution of the guest.
>
> +PCI Interface
> +-------------
> +
> +The PCI interface is similar to the ISA interface except that it uses an MMIO
> +address space provided by its BAR0, 1 byte long. Any machine with a PCI device
> +can enable a pvpanic device by adding '-device pvpanic-pci' to the command
> +line.
> +

Other than the s/device/bus/ that Philippe pointed out,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

