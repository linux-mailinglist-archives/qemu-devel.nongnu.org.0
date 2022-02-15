Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C854B7A74
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 23:29:31 +0100 (CET)
Received: from localhost ([::1]:60108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK6KA-0004aK-FM
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 17:29:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5tc-0002gQ-Mw
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:02:04 -0500
Received: from [2a00:1450:4864:20::432] (port=43751
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nK5ta-0005Sn-RT
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 17:02:04 -0500
Received: by mail-wr1-x432.google.com with SMTP id i14so290564wrc.10
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 14:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=slGKjp1EyADeI48N6b5u/oGvMYcf3V24i9a3DsUgpqE=;
 b=puIfEeRT8zmm5OgztSn0CBKiZrFbuViT446Uh/A2xTKBRFVrO9o+jEgDr9Lqvp3ctV
 4ZY+lN4CagNHq4tBreXGWL54SsiQlIwnSwequZOK9eR2Qdt7QNd2zcxr90GRGmZ3OaoL
 JZUW/sHY2N5yPzW2Filmz6MJ2iGIijm56k3xg8uvv7x8px/t7ig6AoSd/fFOgRh3kigk
 PBTV/k0PBVwq+bF07vWAFtSphp45JUaWWz+0UFClYKB0n279mMK1wXhr2USgYeFABWMk
 n2k0zdAct+n/ButgpgUtLNPZI4j/LU4jRb6vFeDwhmkdFcp4OueFhrI6VsZFuykR8xUL
 82rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=slGKjp1EyADeI48N6b5u/oGvMYcf3V24i9a3DsUgpqE=;
 b=IS6EU/6JqnRvF2ht+gbkW2owjTh8N3MRA1/5bRmVc2cpKAp0FsXuuEjcyhlQilIxlV
 cSAN0/ZTDPKREJDhuvK9XNXaxPI6hDoSWgISG9cEY2CAuUwOBF5M8yMLxePBC5pumZJk
 O42YTtbasyPeMhT9drSTgIjXBpZwtY2z2Yt/fXLwUPn81NetzFIs27+SRVDb9cgwFwg4
 ULGmxbLNXtwwHS4K5GkJD8O6rTEJ9waW58EmQDMFcpYRzFb6YoLROBAB249a0lhyLOJe
 V3u8SxkKjAnwS5fW5OICGasGM6eg8Daq7+Mup/Tw11eEWyPJAEECQ3v8WirEwpivxueF
 1PHA==
X-Gm-Message-State: AOAM531ODNWBNmFgmHl6H60Z3Ss7ddU54Db4vsEQECaJAtwwIOpH42Jp
 lU+0W5Sso/Ic0rsAZV2usreLvZuI11HQKI5+ytd7Tw==
X-Google-Smtp-Source: ABdhPJwchBUoW046nLy6RdTfl8ek/G6rBzECrdzUaz/QdOfjuNoGIGjZn0jyaQXnvqwd63Hd/32pPbq6RulWCb+v/8k=
X-Received: by 2002:a5d:59ac:0:b0:1e4:9b6e:eac7 with SMTP id
 p12-20020a5d59ac000000b001e49b6eeac7mr63651wrr.172.1644962518571; Tue, 15 Feb
 2022 14:01:58 -0800 (PST)
MIME-Version: 1.0
References: <20220210040423.95120-1-richard.henderson@linaro.org>
 <20220210040423.95120-8-richard.henderson@linaro.org>
In-Reply-To: <20220210040423.95120-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Feb 2022 22:01:47 +0000
Message-ID: <CAFEAcA_F8P9BVxdnv+hq+RYsXnyOgFX7PFqNPqPS9+OhxYD8HA@mail.gmail.com>
Subject: Re: [PATCH v2 07/15] target/arm: Honor TCR_ELx.{I}PS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: qemu-arm@nongnu.org, alex.bennee@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Feb 2022 at 04:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This field controls the output (intermediate) physical address size
> of the translation process.  V8 requires to raise an AddressSize
> fault if the page tables are programmed incorrectly, such that any
> intermediate descriptor address, or the final translated address,
> is out of range.
>
> Add a PS field to ARMVAParameters, and properly compute outputsize
> in get_phys_addr_lpae.  Test the descaddr as extracted from TTBR
> and from page table entries.
>
> Restrict descaddrmask so that we won't raise the fault for v7.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

