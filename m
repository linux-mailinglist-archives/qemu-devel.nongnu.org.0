Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D704D5320
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 21:34:14 +0100 (CET)
Received: from localhost ([::1]:43886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSPUD-0007mM-T6
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 15:34:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSPSS-000715-SA
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 15:32:25 -0500
Received: from [2607:f8b0:4864:20::b29] (port=35692
 helo=mail-yb1-xb29.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nSPSR-0000Xg-Gg
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 15:32:24 -0500
Received: by mail-yb1-xb29.google.com with SMTP id z30so13243777ybi.2
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 12:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CVju3t6EUdpHy80r3obXSLk1SI0pB4gzL+waeLt05ZM=;
 b=hBep7uUsAAb8zlWv/GKdfRIi1LS8ad0N2o5Wca4LX+dVeLFXeWt8cHBU3Dl8XkLGYX
 pc0d3XyyKBq2YTRWWvOJwCsMKXjGPCgRjjKqtiL4q+T04hLLA7jlfjlLkAGG4Yvn1dQV
 7UCYZnjpjPOZhV7ICZkCUfYjRfQ0Nw3glBbxRpWLta5X4owrQZJyvepHA0QdhdTshBqD
 uKUey0PZGMz2/HBRAArogBpDJipavTdf9oK7pZS+I7qQL/a9A7iHbuPzisAGurDreUdu
 7RZGrrJXMiXEeQQAhCywu79qtOcO+aaRh21r4MSN/p+okpDyBf04x0CXuIPrimQ4LnlU
 DiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CVju3t6EUdpHy80r3obXSLk1SI0pB4gzL+waeLt05ZM=;
 b=QPu8AJ6+ATsQ+2ZHCj7CPl/7LRKDeNs0ZqXP5f3zRJSIKoVuj2qx21hzkPV6cb8bX2
 qV1gRRpCOtvqpDhHKgN7zt9/9tAjjncZB6UxYM0+xgIiXFqykGne9CUBUUJb6+HbduCE
 dpoPecd/91Jlgf7cSohetnJnTO/W+FCVm/92aXCvn2DHgu0SwslXQjQnMfgRkyayKYFM
 nEa8p7QwR0ya/l3GTYjKfBlmMHSIU92m+ao6AZEdBy6ftescFBReucIis/6vaONi3ruq
 pynFUpqKGI7Xa7WHz4gUzdb3nGyODtZixuETFvKvQvfBJOqqKtp4s4kWdJZ/xZLZ34Zf
 9M4g==
X-Gm-Message-State: AOAM532/feYxZheCHKV9cS+iNIMs9Fg1bqr/tL4+Tme9aOIwZju799fu
 El9PfF6gPpHYoEiVurLP9TRvTPVnC3JlpdvAh0tqEA==
X-Google-Smtp-Source: ABdhPJwGEFQjMf90VZf6ODG5Bm0rsgNxGQ1K1A50RMcleRkpMXKTzZlxjhik4hWrs6Bhrfy5op0EM+ty4YWm12Q2Ogo=
X-Received: by 2002:a5b:350:0:b0:628:86b8:6e09 with SMTP id
 q16-20020a5b0350000000b0062886b86e09mr5383429ybp.39.1646944342556; Thu, 10
 Mar 2022 12:32:22 -0800 (PST)
MIME-Version: 1.0
References: <20220310192148.1696486-1-venture@google.com>
In-Reply-To: <20220310192148.1696486-1-venture@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Mar 2022 20:32:11 +0000
Message-ID: <CAFEAcA_4W-Xc-AeL5D8Gsvt+8SmLDaANgww3q7QdcD4xR420zQ@mail.gmail.com>
Subject: Re: [PATCH] linux-user: Fix missing space in error message
To: Patrick Venture <venture@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b29
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Fergus Henderson <fergus@google.com>, Laurent@vivier.eu,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Mar 2022 at 19:29, Patrick Venture <venture@google.com> wrote:
>
> From: Fergus Henderson <fergus@google.com>
>
> Signed-off-by: Fergus Henderson <fergus@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

