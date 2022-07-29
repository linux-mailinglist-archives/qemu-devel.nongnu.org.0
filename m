Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CA7A585107
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 15:42:24 +0200 (CEST)
Received: from localhost ([::1]:51764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHQFz-0004d5-CA
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 09:42:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHQ5l-0002Np-FL
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:31:54 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130]:43527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oHQ5j-0007wK-Hs
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 09:31:48 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-31f56c42ab5so51018997b3.10
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 06:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc;
 bh=TOvBmp6Ql226h9O/80FuUKhhVSWrA817q9EP9jkKrKM=;
 b=b6D2rbrX41xQkVYMKEiZH/XqorP6aaM3uJzWf2HOCClIjvA9Y2ETLgbWg+14DkhX0V
 H1xR+Z03lSVX7j4J4UZzmqUUd4qHt84NreB/ikXO8zK+Yq+dcfA2qAmoYT1OZDsCrbAy
 sSQ2NOHSUnvT7jRcKi5Bwzdyp40Y+xK2uZzCAmIBv9K11VfAeezxnaue2Y3nmAjTqqlI
 R4FDiciYj8rpe6qxq6L6BAickS70EYUDrLXL6VstIdRmTN4vt3iljhii2wAwGWR5+wN+
 hHvHmhC7X+2GzF+JZmF27TCtEoH8OKZNshhzuk/MewCZMVgI35nQhrpMuWIzNrwBqaNT
 J3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=TOvBmp6Ql226h9O/80FuUKhhVSWrA817q9EP9jkKrKM=;
 b=l+/kWw2tWq5v59c8D+dzsuHLmVhGlWf7pYNuikcLqpb/O6bL3YWbihC3b3fjluZrt7
 lUaPkeW242BYbGoBcIIaJZNWkGqxyO1IgUVCnJUZ1y8N1/5fbdCLXpOwuLDcVgoeFq1G
 QYUfB5JMZ+KZ+95N55JsIyI12lVcNVdpP2WZB8N+QXhppFXNUnsI3RXyZ7aNd+JtbaNc
 QjLww5ZZOE9gNPbC0zSZuHC1ZRK57e7An4fVcvlvaBt1VCW9aNEWmHm9L7HGybs5cRTB
 HJDtACXPT68YYq4JlmDBrgqpLBdMQPBZx1iI6aiX1PVdtfFN/mG8SOJxVx2eBlHNenyt
 up5A==
X-Gm-Message-State: ACgBeo3x+SmfIR5zEnlk5XCEqJI4i1AFn9nYzakSzZYhtxbSVxA22QFO
 j6D/hLSwVyC1Mn5vQTgTkI2rDcF7TGNMgN0ijypTDg==
X-Google-Smtp-Source: AA6agR5f3skzKrvPmGvSEvp1+pBw91UqUg6AlSP4MRu5aax11tDov47xa407ijJYi3CJ+XnI+jeCDdswxcnQmMXtfws=
X-Received: by 2002:a0d:e004:0:b0:31f:311d:2351 with SMTP id
 j4-20020a0de004000000b0031f311d2351mr2960690ywe.10.1659101505565; Fri, 29 Jul
 2022 06:31:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220720111926.107055-1-dgilbert@redhat.com>
 <20220720111926.107055-7-dgilbert@redhat.com>
In-Reply-To: <20220720111926.107055-7-dgilbert@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 29 Jul 2022 14:31:05 +0100
Message-ID: <CAFEAcA_mkeE6cKwmauTLV4c7k_=gCaPSfOM92eX6_3rnd8L+Wg@mail.gmail.com>
Subject: Re: [PULL 06/30] softmmu/dirtylimit: Implement virtual CPU throttle
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, leobras@redhat.com, quintela@redhat.com, 
 berrange@redhat.com, peterx@redhat.com, iii@linux.ibm.com, 
 huangy81@chinatelecom.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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

On Wed, 20 Jul 2022 at 12:30, Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
>
> Setup a negative feedback system when vCPU thread
> handling KVM_EXIT_DIRTY_RING_FULL exit by introducing
> throttle_us_per_full field in struct CPUState. Sleep
> throttle_us_per_full microseconds to throttle vCPU
> if dirtylimit is in service.
>
> Signed-off-by: Hyman Huang(=E9=BB=84=E5=8B=87) <huangy81@chinatelecom.cn>
> Reviewed-by: Peter Xu <peterx@redhat.com>
> Message-Id: <977e808e03a1cef5151cae75984658b6821be618.1656177590.git.huan=
gy81@chinatelecom.cn>
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>


Hi; Coverity points out a problem with this code (CID 1490787):

> +static inline int64_t dirtylimit_dirty_ring_full_time(uint64_t dirtyrate=
)
> +{
> +    static uint64_t max_dirtyrate;
> +    uint32_t dirty_ring_size =3D kvm_dirty_ring_size();
> +    uint64_t dirty_ring_size_meory_MB =3D
> +        dirty_ring_size * TARGET_PAGE_SIZE >> 20;

Because dirty_ring_size and TARGET_PAGE_SIZE are both 32 bits,
this multiplication will be done as a 32-bit operation,
which could overflow. You should cast one of the operands
to uint64_t to ensure that the operation is done as a 64 bit
multiplication.

Side note: typo in the variable name: should be 'memory'.


> +    if (max_dirtyrate < dirtyrate) {
> +        max_dirtyrate =3D dirtyrate;
> +    }
> +
> +    return dirty_ring_size_meory_MB * 1000000 / max_dirtyrate;
> +}

thanks
-- PMM

