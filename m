Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FFE3C29C0
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 21:35:18 +0200 (CEST)
Received: from localhost ([::1]:57372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1wHO-0004DK-0e
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 15:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m1wGF-0003Qo-AB
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 15:34:07 -0400
Received: from mail-io1-xd2b.google.com ([2607:f8b0:4864:20::d2b]:39815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1m1wGC-000701-Rm
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 15:34:07 -0400
Received: by mail-io1-xd2b.google.com with SMTP id h6so13695534iok.6
 for <qemu-devel@nongnu.org>; Fri, 09 Jul 2021 12:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5n5VHqZkXU5BeWOHLUwP3bzVtzI0C8WAPTk1OsfyKYY=;
 b=mD81CR7y8buMjTIQStkY9ZZILmJcScCE+DDHCJRJrWbkXt/rfNkdTd7ULEoLY516ZM
 sw60wrfpBNUzwudT2119IJ0vUyp+0eaOSWkrgq2IPRGfhiV7DshDclbaoKt1evuIva77
 Z0fS+5jbmsBXH3mOWkazGIEFcf1+oDRh0PKEoNH79tuk1UxygEph1VAKXfZ3deftQyL2
 BOsClqMi5epOM5XagbCJIENsGfs82HqXZSkDt1DkxLXVDLLP61MZM+s5Rb9rI4poaEbD
 gDRkeoale+VmFXkoa4Gt7s/7uRmJkfUvkd/TXn0SUClO8MAk4MgQjZJyqyWpi7WuP03o
 wBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5n5VHqZkXU5BeWOHLUwP3bzVtzI0C8WAPTk1OsfyKYY=;
 b=gKlQuMothNfyTqQSjVmp0EBSD1PuP4Ht2M/52GPPxY/KNTFz0y9RuGp06Vsn5HWoGV
 LOtuePNqqSFfF+z4vmFm4wzBB2BstQJIQKGq9J6nCf4rLpB1vw4r0PPmt/l9uzuSZIYP
 jyZYJ4uVO1KcmT7R7wnMftViAVKAiLQsWf37kA9l4D5XiQbDQFR5w9LVzB+iG5/JBQTK
 Mpaw6wl3vWfsj3M9XH+/Ak7gT/WXNahdayYJOeAB3DDHJ7ztZtjr9Is72m9fIOIWQoud
 6KFlTF6vO3zq8p9EgX8mRPCVlu+KJJBNq+PlbNsAtf01nUIUELXCoNS174sKczKJLF3N
 c/Vw==
X-Gm-Message-State: AOAM533wyh7nkwsAxX9jSrCBLTLvm7Oe4j6SyRUWgKchOoGljc3NegSQ
 JAKPGcMD6ilXuYXtbwpvoVRgbCSxjAyj4yKw7dc=
X-Google-Smtp-Source: ABdhPJwCNhTwSuVEkafop66+Gbs4N5iJF6e/mVnjXw1LF6BS1Q4LrSMst2RD7X+xurtMfEdcxsVQLT7qw6DPqvYTENI=
X-Received: by 2002:a5d:9cd9:: with SMTP id w25mr17932900iow.36.1625859242924; 
 Fri, 09 Jul 2021 12:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1625662776.git.mprivozn@redhat.com>
 <ebdf871551ea995bafa7a858899a26aa9bc153d3.1625662776.git.mprivozn@redhat.com>
In-Reply-To: <ebdf871551ea995bafa7a858899a26aa9bc153d3.1625662776.git.mprivozn@redhat.com>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Fri, 9 Jul 2021 21:33:51 +0200
Message-ID: <CAM9Jb+iqnmgpKDed0sxYP6WfUxXGYHundLNLpdeSRk0obQecOA@mail.gmail.com>
Subject: Re: [PATCH 1/2] numa: Report expected initiator
To: Michal Privoznik <mprivozn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2b;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, tao3.xu@intel.com,
 Qemu Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> When setting up NUMA with HMAT enabled there's a check performed
> in machine_set_cpu_numa_node() that reports an error when a NUMA
> node has a CPU but the node's initiator is not itself. The error
> message reported contains only the expected value and not the
> actual value (which is different because an error is being
> reported). Report both values in the error message.
>
> Signed-off-by: Michal Privoznik <mprivozn@redhat.com>
> ---
>  hw/core/machine.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 57c18f909a..6f59fb0b7f 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -728,7 +728,8 @@ void machine_set_cpu_numa_node(MachineState *machine,
>              if ((numa_info[props->node_id].initiator < MAX_NODES) &&
>                  (props->node_id != numa_info[props->node_id].initiator)) {
>                  error_setg(errp, "The initiator of CPU NUMA node %" PRId64
> -                        " should be itself", props->node_id);
> +                           " should be itself (got %" PRIu16 ")",
> +                           props->node_id, numa_info[props->node_id].initiator);
>                  return;
>              }
>              numa_info[props->node_id].has_cpu = true;

Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>

