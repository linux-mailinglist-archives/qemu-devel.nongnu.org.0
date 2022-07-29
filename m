Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5732F58513F
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 16:04:16 +0200 (CEST)
Received: from localhost ([::1]:43470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHQb9-0002e0-0A
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 10:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHQVo-0007Jv-NF
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:58:44 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:40738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHQVn-0007nA-5G
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:58:44 -0400
Received: by mail-yb1-xb36.google.com with SMTP id 123so8309574ybv.7
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 06:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=CkfFqFoaC3gLYhGVAxfeRS2eTM6XhGrVcOqiL5TCTyc=;
 b=IJ0ReGg7cSFlKsyXvocMiLXMVBAhMGZOInap2bVE4v+lMu5oULh3VKK+1yYXZmkqdz
 DqxPEBLemZFF2O/6Cfz2Q45KwrXTuAZ3+2TFpgOK2n0ewUXVdDlu49TF72bYS7Lang//
 dygMk3iGfacVKvBlF1oswUDpBhOAoKdXyQUZvy2FMQBv9xdAEvkBnf7MhAiTDsMS6A6F
 poJlblwgETYELTB52c1uSmYESpmYR8pxlq/tcbaq9N68ualAvehXAH6x7h7Umak/gfuN
 WowUZJAvqoCD/oJg1I+YI7Q/w7FBQQt+N3GaersWWevOkijS8EUppfPZ4x0ciDBnrqES
 k10Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=CkfFqFoaC3gLYhGVAxfeRS2eTM6XhGrVcOqiL5TCTyc=;
 b=YUPwWVlbr9hcldnrbaGOAtpKiYK1jjt0K0cZVF5Aj8Ye+k6GOFuhZjCjWjF7UI9/kj
 NeiLA6Lh/jJCIcEjh8d9GM9xoSMI2yh5PjHAMEpKhJxiAQM6qnmovP405JR7zDMV1qVF
 BAFIqNYiC6qUotGWlQ4O42D3IGt7SEEqEIJaW/CcXTa8Ep9dPl3iFq8zJ0z4oNaONvQB
 wM7heqXHEecaUEcXS6WAID3zWtzRtpVe9bI8/xxw20TuKgjxXnvlBBqEdZSGiQUc4Wy6
 ox+1uAuw5rLkd/l52cXRYK61s2j2TVG00Pk+QlNrM6eicEyEzrj8DrDTi3DegwfxCI7J
 GkKw==
X-Gm-Message-State: ACgBeo3m5SLCMZae7Nkw7xkRn2VrV3IaOivKAZwi0TgYtQ/7hZtgc/ti
 Q07AymEDjxIZbvkczrvc4eSIsoK8eKP/7FFcIY9iAw==
X-Google-Smtp-Source: AA6agR79K5Gecakx5y3u5wuFVgcyALRYJ3JzFzFUVJzEls+yrJ4UlaRBp8TXcskQEykeOgovBC0adBdhPePuYETM/AE=
X-Received: by 2002:a25:928b:0:b0:671:548f:fabd with SMTP id
 y11-20020a25928b000000b00671548ffabdmr2658429ybl.39.1659103121687; Fri, 29
 Jul 2022 06:58:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220720090313.55169-1-jasowang@redhat.com>
 <20220720090313.55169-26-jasowang@redhat.com>
In-Reply-To: <20220720090313.55169-26-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2022 14:58:01 +0100
Message-ID: <CAFEAcA-LPM4LmfcM3kiHk9LWCrYRpB1izfxPijHvBrmLOfFJgQ@mail.gmail.com>
Subject: Re: [PULL V2 25/25] net/colo.c: fix segmentation fault when packet is
 not parsed correctly
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Zhang Chen <chen.zhang@intel.com>,
 Tao Xu <tao3.xu@intel.com>, Li Zhijian <lizhijian@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 20 Jul 2022 at 10:04, Jason Wang <jasowang@redhat.com> wrote:
>
> From: Zhang Chen <chen.zhang@intel.com>
>
> When COLO use only one vnet_hdr_support parameter between
> filter-redirector and filter-mirror(or colo-compare), COLO will crash
> with segmentation fault. Back track as follow:
>
> Thread 1 "qemu-system-x86" received signal SIGSEGV, Segmentation fault.
> 0x0000555555cb200b in eth_get_l2_hdr_length (p=0x0)
>     at /home/tao/project/COLO/colo-qemu/include/net/eth.h:296
> 296         uint16_t proto = be16_to_cpu(PKT_GET_ETH_HDR(p)->h_proto);
> (gdb) bt
> 0  0x0000555555cb200b in eth_get_l2_hdr_length (p=0x0)
>     at /home/tao/project/COLO/colo-qemu/include/net/eth.h:296
> 1  0x0000555555cb22b4 in parse_packet_early (pkt=0x555556a44840) at
> net/colo.c:49
> 2  0x0000555555cb2b91 in is_tcp_packet (pkt=0x555556a44840) at
> net/filter-rewriter.c:63
>
> So wrong vnet_hdr_len will cause pkt->data become NULL. Add check to
> raise error and add trace-events to track vnet_hdr_len.
>
> Signed-off-by: Tao Xu <tao3.xu@intel.com>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>
> Reviewed-by: Li Zhijian <lizhijian@fujitsu.com>
> Signed-off-by: Jason Wang <jasowang@redhat.com>

Hi -- Coverity points out that there's a problem with this fix
(CID 1490786):

> @@ -46,7 +46,14 @@ int parse_packet_early(Packet *pkt)
>      static const uint8_t vlan[] = {0x81, 0x00};
>      uint8_t *data = pkt->data + pkt->vnet_hdr_len;

data here is set to pkt->data + pkt->vnet_hdr_len.
If pkt->data is NULL then this addition is C undefined behaviour,
and if pkt->data is not NULL but the integer added is such
that the pointer ends up not pointing within data, then that
is also C undefined behaviour...

>      uint16_t l3_proto;
> -    ssize_t l2hdr_len = eth_get_l2_hdr_length(data);
> +    ssize_t l2hdr_len;
> +
> +    if (data == NULL) {

...so the compiler is allowed to assume that data cannot be NULL
here, and this entire error checking clause is logically dead code.

If you're trying to check whether vnet_hdr_len is valid, you
need to do that as an integer arithmetic check before you start
using it for pointer arithmetic. And you probably want to be
checking against some kind of bound, not just for whether the
result is going to be NULL.

Overall this looks kinda sketchy and could probably use more
detailed code review. Where does the bogus vnet_hdr_len come from in
the first place? Is this data from the guest, or from the network
(ie uncontrolled)?

> +        trace_colo_proxy_main_vnet_info("This packet is not parsed correctly, "
> +                                        "pkt->vnet_hdr_len", pkt->vnet_hdr_len);
> +        return 1;
> +    }

thanks
-- PMM

