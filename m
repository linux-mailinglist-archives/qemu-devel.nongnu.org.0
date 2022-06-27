Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A683755BA15
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 15:33:54 +0200 (CEST)
Received: from localhost ([::1]:44852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5osC-0002em-Bz
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 09:33:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ooT-0001gt-VS
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 09:30:01 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:33519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ooS-0001Lv-6c
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 09:30:01 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-317710edb9dso86012047b3.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 06:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LOLUvV9+D318RbDoGNQvuZCYtdCo241c+y5kModjy6Y=;
 b=xwvGAaWQ05FQqjTS2Ax+lCRWPdzFYGkjOiOuB3FKok2eYJ9b8QPlEVUyyh1qbdWQ1j
 glpv2IXDskd7WNfZzmRdNLg/XK/yUgbtWSgorHNBCAkJN2lZkZif1ffcAUt8NdEGQO79
 DAtSW19c/qzC8sNQYl/OpHmIzhdeskQw838pm466YhKhKgmJLIl8E7m/+E+AWgdKDZKa
 mBU9ZkEWEtuuWKLFU/qEbdpor5aDWY/6SRrwCroWEOLnkYRPKKeOHhx/IVu3eog4L4dQ
 OXIl8mfOSWAXJwOv880eRpP5b1u22eBIamYsgHrLw9ex1z11HmmbfqyaAp+JbQA6n0u4
 /9rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LOLUvV9+D318RbDoGNQvuZCYtdCo241c+y5kModjy6Y=;
 b=vUGUSetX0Z6QN/sw91h7POS4Mnlw9rgSYkL4DniAyIj1/YryOdKm7CEKNAzJxzby8U
 u5w0LPLrGGGMFIVz87zK0yjs2i5AD0lrztCmjzvEGucZ/bmqpbPIotcpjSgbQz7DKMN6
 wTlYZtEHxQoL50a6kvLESw0iMjThb97znrs0kuR+Gv9YULOpWZGGlszs2+uDVTlSYGYd
 Mh8v8lvJc+lOUfV5uQoQAiS4ruN5OE2LHgYjXlKnwclVKqsEgKVZS+DLzzMCYkdQq5Il
 TwOUBwz09e2a195j7mqVd7nhIiYFrFJEnLoF/AmOyRgzC/QgwqZhdyhMr0EGe+n0HokA
 Ek/A==
X-Gm-Message-State: AJIora8uLolGsEvWHyFWbRG/+TwBYd3vXw5f3vWD7rpzWalvuELN3PAI
 yqVg/ZJjECaiUb6udR/F0mgPhQsEGWWX+dr/eW3THg==
X-Google-Smtp-Source: AGRyM1uEJbiOe2zGNjS/AOWdCVoX+shDjf7pFGCd6YcbnCklmlq+Kr++aLPUC9ibarSWCeuQq2LkRu9J8U3qRISgpx0=
X-Received: by 2002:a81:8d08:0:b0:317:a4cd:d65d with SMTP id
 d8-20020a818d08000000b00317a4cdd65dmr14196365ywg.329.1656336597573; Mon, 27
 Jun 2022 06:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220516204913.542894-1-mst@redhat.com>
 <20220516204913.542894-29-mst@redhat.com>
In-Reply-To: <20220516204913.542894-29-mst@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jun 2022 14:29:19 +0100
Message-ID: <CAFEAcA-Zoi+7barPqmfuOc1OQoEpSSPmyB6wyiAmuCrM0WrNeA@mail.gmail.com>
Subject: Re: [PULL v2 28/86] hw/cxl/component: Add utils for interleave
 parameter encoding/decoding
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: qemu-devel@nongnu.org, Jonathan Cameron <jonathan.cameron@huawei.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Ben Widawsky <ben.widawsky@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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

On Mon, 16 May 2022 at 21:51, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> From: Jonathan Cameron <jonathan.cameron@huawei.com>
>
> Both registers and the CFMWS entries in CDAT use simple encodings
> for the number of interleave ways and the interleave granularity.
> Introduce simple conversion functions to/from the unencoded
> number / size.  So far the iw decode has not been needed so is
> it not implemented.
>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Message-Id: <20220429144110.25167-27-Jonathan.Cameron@huawei.com>
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  include/hw/cxl/cxl_component.h |  8 ++++++++
>  hw/cxl/cxl-component-utils.c   | 34 ++++++++++++++++++++++++++++++++++
>  2 files changed, 42 insertions(+)
>
> diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_componen=
t.h
> index 7d8f395cbe..4f69688c47 100644
> --- a/include/hw/cxl/cxl_component.h
> +++ b/include/hw/cxl/cxl_component.h
> @@ -210,4 +210,12 @@ static inline int cxl_decoder_count_enc(int count)
>      return 0;
>  }
>
> +uint8_t cxl_interleave_ways_enc(int iw, Error **errp);
> +uint8_t cxl_interleave_granularity_enc(uint64_t gran, Error **errp);
> +
> +static inline hwaddr cxl_decode_ig(int ig)
> +{
> +    return 1 << (ig + 8);
> +}

Hi; Coverity warns about this (CID 1488868) because the shift
is calculated with 32-bit arithmetic but the function returns
a 64-bit result. I assume that 'ig' is supposed to never be
large enough that the result is >4GB, but we can make Coverity
happy by using "1ULL" here.

thanks
-- PMM

