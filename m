Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA5E5E9B88
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 10:04:00 +0200 (CEST)
Received: from localhost ([::1]:48118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocj5r-0003E2-Vd
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 04:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ociyr-0005YV-Gp
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 03:56:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26857)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ociyn-00023O-Ki
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 03:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664179000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nHwsUi+eANhnam4gzb/TjkVvpj3SE/u6axdLiMX85zo=;
 b=RHcDv9wKUv23CCnAStGd26s93WVJDbAn2N3cazd7vgQF7Mwmd2sWi4pyY3ZgoRGXPzcT2N
 V2j4TRVfWnroPpJK0rJoQkuFx+iL9GF9uii1vudqFwH4DUa0x+wepltS1a7p/BjdiqSFIV
 VcFGpnvf9jjM5xcjpGyrIr0ZEqwr8gM=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-6-4n_JAweZNOWrTbHbIA9Vzg-1; Mon, 26 Sep 2022 03:56:36 -0400
X-MC-Unique: 4n_JAweZNOWrTbHbIA9Vzg-1
Received: by mail-ua1-f71.google.com with SMTP id
 a26-20020ab0081a000000b003b752547aadso1321894uaf.22
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 00:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=nHwsUi+eANhnam4gzb/TjkVvpj3SE/u6axdLiMX85zo=;
 b=wG0zTpWKgg3yKK11JN+AviR6rFR92hwzh6MZmCqMCUxBA/rMNQMMqh3tVBAmFDkY08
 BJUkfpNeiU8ioI5WEy14WGNDs+2apHI6F87WOi+m5IGoGmn+YGudCitkdwi25UtqnqLn
 EXo+pWJ2EPfUj4UE3W3I6Mr9TDfPLS1ib/dSFazKdTdZr/4Jy4uCA6umaVeSKVYPL+TT
 IRbalDOtCLJLz3zq69LtL/J//DSjo8dIz+dB4hoRzmN8uzWO0mmhv34zsNV+RY6NJ4iB
 APq0oBICq6cEctM3pbGKGdpG/eApkLXiRMg9eCHYqMcJ9GPvk5QPHDBey08gm+VY3R/H
 OhaA==
X-Gm-Message-State: ACrzQf0r12nZqL9KNlwWI8jSU/g0CXMhDuy9IGPr0MNLEWXUCxB+4AUJ
 L3IsuJ3rZGMe/fF1YiX/7m1j1nizIvdZ02axwrCT2HjZeQTkuVuIPKIJ3+2FsOXCNSFpTQoL6wO
 FrveM+zH+n/4jcI8Zl6rhP9wcwHmNM0o=
X-Received: by 2002:a05:6102:22f8:b0:398:d463:cd0 with SMTP id
 b24-20020a05610222f800b00398d4630cd0mr7699631vsh.54.1664178995057; 
 Mon, 26 Sep 2022 00:56:35 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5dq1vsqzcCQGBH5P3391dxg7TeLyDbssZjRsSTkh3Uhe2aVxxIFbPd2cmuYZ9TLBzaXx/QaFgo1xV9lGRTiSE=
X-Received: by 2002:a05:6102:22f8:b0:398:d463:cd0 with SMTP id
 b24-20020a05610222f800b00398d4630cd0mr7699629vsh.54.1664178994848; Mon, 26
 Sep 2022 00:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220920172507.95568-1-pbonzini@redhat.com>
 <20220920172507.95568-25-pbonzini@redhat.com>
 <447b5045-b437-028f-8813-b229dcff6bf9@linaro.org>
In-Reply-To: <447b5045-b437-028f-8813-b229dcff6bf9@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 26 Sep 2022 09:56:22 +0200
Message-ID: <CABgObfZ-nRhvpd94FUT7wW0Mc75BPLJE+O=o+FL8ND9OaS1nwQ@mail.gmail.com>
Subject: Re: [PATCH v2 24/37] target/i386: reimplement 0x0f 0xd0-0xd7,
 0xe0-0xe7, 0xf0-0xf7, add AVX
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, paul@nowt.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Sep 24, 2022 at 10:56 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/20/22 17:24, Paolo Bonzini wrote:
> > For LDDQU, using gen_load_sse directly might corrupt the register if
> > the second part of the load fails.
>
> Surely LDDQU is not unique in this?  I would think ldo/ldy both need fixing to load to
> temps first.

The only other case with an M operand is MOVNTDQA, which is aligned
and therefore in principle should not fail due to a page fault on the
second half. However, it is still possible to have a race so I'll
change it.

Other loads use a W operand, for which the gen_load_sse() is always
performed by the generic code in gen_load(). In that case the
gen_load_sse() is always directed at xmm_t0.

Paolo


