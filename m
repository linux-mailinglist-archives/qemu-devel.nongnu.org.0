Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB4A3F2E40
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Aug 2021 16:41:33 +0200 (CEST)
Received: from localhost ([::1]:56476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mH5i7-0006w8-Nc
	for lists+qemu-devel@lfdr.de; Fri, 20 Aug 2021 10:41:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH5gv-0005wX-K8
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:40:18 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:44708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mH5gu-0004kP-0P
 for qemu-devel@nongnu.org; Fri, 20 Aug 2021 10:40:17 -0400
Received: by mail-ed1-x529.google.com with SMTP id s3so2078654edd.11
 for <qemu-devel@nongnu.org>; Fri, 20 Aug 2021 07:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=XL0kGlF8Zu3oZk5twTqrcPSdspZ9dYZrNRJFb3w6C2o=;
 b=dKFkx60CoKma27/XRTjLufJtOtx9tuaKKn/9juOC5NTEKgNSaql6QdFJALz5DBYWVZ
 zQ8bayrK2qmFrdPPZp041PSJRmhsXoV1TKQaBEhwgx7UxOcd1T49rzQzNbGFZgQ/Hn81
 jdPLvQ4NO6FqaTnYLrh8w17V3NxmBrxaHQ7V/LdDuFBVDO1blanURM4hmbodiL3R7A8v
 AuijoDJkNDPxfJEVjnBJYJgSt5cSq+bBkHr5YjtsUnttSeUJWfiK5AR4DQcJrv9LGETX
 LZwrGutvpRBIWkmRvjB0V33sXiXBPr+8TEkWBTGoimN5XHas3TgEgbpXgq+HKyfmPA68
 wBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=XL0kGlF8Zu3oZk5twTqrcPSdspZ9dYZrNRJFb3w6C2o=;
 b=JoXAT5ENyP4/kHmCQEB0L92tohSdyPBqtoqCX6GKSbfadWF+yXWHhKkKh9Gd70D80j
 jcPBnYNCBGILN5aITy6Iz++VrgiZQkDzkVbM3Ay19DRP7w+R8IsDX/O/wR8wUEd5WYj8
 YCZXOQzVspnWGQhmXxDvuSnGd5EM0PYFH4VoNNyBpuP+i5ALkzwNOZbUb0B7cmLqHhWl
 WDzqYLaEP2I49Xdc85E3DHAH6XGgI/KBm2SWkks9wulhGZr4av+k+1QOsFgyzVHti8W6
 6xVdjM9osjqsJ0wEsNmssIf0F2RnGpz6A37tJ4+y0mqWGIs0xOSf9aOpon09gBTcPSo8
 f4CQ==
X-Gm-Message-State: AOAM533MjsibqOzUdKUxCpnqbAoKEtiW5lugooUnmesWLTF9+GGrarie
 7ERMQmndUnRRemvIyJdIYaLrFWrtUhRaSTr5SZD3xw==
X-Google-Smtp-Source: ABdhPJy3B1DsAkn8GsWq7czp6Il7u6h4YOcQy7Jrfjom65Ink7SENVGSusw9NyjGUWfANudYN25bOleoGr5LpLT7yIw=
X-Received: by 2002:a05:6402:220e:: with SMTP id
 cq14mr22682493edb.52.1629470413853; 
 Fri, 20 Aug 2021 07:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
 <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
 <CAEUhbmUE4fb2NewE+Cze3Le5xOeH53NDbwdnKH==dnZeKGPQeQ@mail.gmail.com>
 <e833a774-d3bf-62d5-91d8-b24cbee0bfc4@redhat.com>
In-Reply-To: <e833a774-d3bf-62d5-91d8-b24cbee0bfc4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Aug 2021 15:39:27 +0100
Message-ID: <CAFEAcA8MqYQiTJkKyWGkcKR=J2FD9SDWvHm9vxZq3g2HJ8ch3w@mail.gmail.com>
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 "Richard W.M. Jones" <rjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Igor Mammedov <imammedo@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 20 Aug 2021 at 15:34, David Hildenbrand <david@redhat.com> wrote:
>
> On 20.08.21 16:22, Bin Meng wrote:
> > Hi Philippe,
> >
> > On Fri, Aug 20, 2021 at 10:10 PM Philippe Mathieu-Daud=C3=A9
> > <philmd@redhat.com> wrote:
> >>
> >> Hi Bin,
> >>
> >> On 8/20/21 4:04 PM, Bin Meng wrote:
> >>> Hi,
> >>>
> >>> The following command used to work on QEMU 4.2.0, but is now broken
> >>> with QEMU head.
> >>>
> >>> $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
> >>> -nographic -serial /dev/null -serial mon:stdio -monitor null -device
> >>> loader,file=3Du-boot-dtb.bin,addr=3D0x4000000,cpu-num=3D0
> >>> qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cannot
> >>> allocate memory

> -m 40000000
>
> corresponds to 38 TB if I am not wrong. Is that really what you want?

Probably not, because the zynq board's init function does:

    if (machine->ram_size > 2 * GiB) {
        error_report("RAM size more than 2 GiB is not supported");
        exit(EXIT_FAILURE);
    }

It seems a bit daft that we allocate the memory before we do
the size check. This didn't use to be this way around...

Anyway, I think the cause of this change is commit c9800965c1be6c39
from Igor. We used to silently cap the RAM size to 2GB; now we
complain. Or at least we would complain if we hadn't already
tried to allocate the memory and fallen over...

-- PMM

