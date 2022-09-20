Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 472C05BED7A
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 21:19:05 +0200 (CEST)
Received: from localhost ([::1]:38316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oailr-0004w8-RJ
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 15:19:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeDS-0005f9-Ok
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:27:18 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:37657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaeDR-0005oa-BW
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 10:27:14 -0400
Received: by mail-ej1-x631.google.com with SMTP id a26so6628502ejc.4
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 07:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=ISB7uH9y69aaUzbJW2F0v+3N0cC/KP9DACeWVIh4/n0=;
 b=nZFEq0kRQbqqULA+dg2YjZbsCZ3KLxwgJBkzkeTvkk8F5J0r9Q/uSdpJh8Lr/UM9cZ
 rfpi8A6TCDV0u8MnWN9/hw7MDxEzkSnuu/32OW8wmPmd4169WKdU7/bPIGUE1r0g7bBK
 /IlctyWxRcRp2r+daTIP7BT6C3xT9TGbxwiKgrQ4h+RMT738arZRMt3CQxzQ2J0QOKPJ
 osrFnyFFvUET1UdxaNDFnHfiNM+5zFBbhuxbU9vxMlgS3RzQGCjS5iO+jeJY0qocM3Im
 FrmrHUQHt3t/Uw6LWTqt6/PkxggQWnXoine480qixS4gv7g9P3Vc7oQ8bF7GZPNhtQHd
 O5fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ISB7uH9y69aaUzbJW2F0v+3N0cC/KP9DACeWVIh4/n0=;
 b=s404EzaMdF3fsMVIpS+DCrRhb93EZgtK7C80xnLmhhQd0yjzLdfwom4Szq7TCmv1i4
 DTc26/TLtdFese73vdmuXaNmswlgjgXkMI35jsUnCzpJl77w4/7pvDUPKc+j+sparGT3
 nfdAfTmb/Cq6ZHRJJRLU5KrRgsOE7ehe6jgj+e1ZdvyyVX6pmhqTTa+K547C3i3o3wcr
 EY6mnFH9f2q5lADbzLRu5ZNIuAudidv/QfZFB8QOaXh7AnaZRgkwt/i/c5Aj2BBuekhu
 xfCI0+nEZYF+K405B2yd/wAU0tYxTMQ6ez9UaRhsqg7JS8/z24pL6kWiN0v/IEv8UzHU
 dVGg==
X-Gm-Message-State: ACrzQf0j5U2V8EnHLHsaXEMgG4m6a1+tfQz4wLgtQlLtj7bHH3jy3uCv
 sw3F+WE2hE9XIvQi+VDwCXi9782CQp4+ovLtXmrB1Q==
X-Google-Smtp-Source: AMsMyM6fXcfdpYstIVOgn57kai6FiXcXx/Gwoo2yziQNlhN+kBd2X+lFyakvE70+E//63qruVOVau08+VVwyku4gTpI=
X-Received: by 2002:a17:907:86a5:b0:780:156d:e842 with SMTP id
 qa37-20020a17090786a500b00780156de842mr16953915ejc.555.1663684031498; Tue, 20
 Sep 2022 07:27:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-8-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:26:59 +0100
Message-ID: <CAFEAcA8VrNFDOE7Y==fQ0tP7m=f3KOAb0TD4RCOntN_nmKebZg@mail.gmail.com>
Subject: Re: [PATCH v2 07/66] target/arm: Use GetPhysAddrResult in
 get_phys_addr_pmsav7
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, 22 Aug 2022 at 16:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 36 +++++++++++++++++-------------------

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

