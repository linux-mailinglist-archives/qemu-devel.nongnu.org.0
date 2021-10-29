Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE28440155
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 19:34:56 +0200 (CEST)
Received: from localhost ([::1]:57486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgVmJ-00026L-Di
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 13:34:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgV3h-0004Er-Qu
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:48:51 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgV3d-0005LU-S3
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:48:48 -0400
Received: by mail-wr1-x42c.google.com with SMTP id v17so17095800wrv.9
 for <qemu-devel@nongnu.org>; Fri, 29 Oct 2021 09:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IKzEP1kM++HVVhRkvc5yOE91baU3/U9q8+PzCkskZwc=;
 b=VyEeja8hKCirOySs1yiNnrCT3J7AXGms6yK7x2KxocFNvdhaaZ3o80u4BZOTx/JX8O
 Ln4Oy5zoyFlTbQDpIVx0qy4pgC0TwkY5HMSG2bi/zz08LsW8xflgNQI6kpHLHwgJ4/gf
 EBCGQdazGOIwowbOW2pOxxypR8qSIhv8jOWUDvj9uMxFZG4iKuEDS6SyQh5TnJEmtdgS
 1YJyCEwo+66uH61CWpk98pL6FC3SyRGd97tfKKOZpiNJZ17IKFoTMHVobJVXK4yoQnF4
 mf+/7BmqJPGY9g2oByrMaWbAanhhrhCgm8jVTR72efrFQTeCQP6XMsN4QC7pJJg5CE5K
 WzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IKzEP1kM++HVVhRkvc5yOE91baU3/U9q8+PzCkskZwc=;
 b=LeRUJT+l7bGBTdtQZXRq2MJr4G6SeYFPyChHor/1KRtSXXa6/+f3LTbEgQ+M2EECve
 HC1xkSyLRDzzlb5dbq55tygwqlLSgCDvAxH5idx61WCekrfGXoOOLgfaCf/ygDc3q2El
 e65f2+24Se8Ffd5EcA+T647RMmgeFQMI8vNLvb4SM6cJSLeUMcEYVY/xDIUlOePV7s8+
 Yx+NPicxoTdia+qxvbb9zfaLUTiCEwzZynxUfyseXw92/47CTa7Yh1nBdwDBjhYGpEDk
 uilzoor+9WmhOjcgxgOMOR0NoBsgthynyX0xtEPEswTsAF8Wh1Qc8tUk8MYZMW9e5yq/
 7ddw==
X-Gm-Message-State: AOAM530aqaNEkRmCQgYZkd3kJawbeRNObLqQbgxn4MNAfxDjE7E+78tq
 P/y4EvQXApmnFaffMNPgEP8=
X-Google-Smtp-Source: ABdhPJwSy0T3iYxZOmvT2uRhnNbzh5Qcj7upnYCKvlv3X9YRky0AQqHxt+ZWv6oMmKOLvhdNFMMZkA==
X-Received: by 2002:a5d:500b:: with SMTP id e11mr15346007wrt.205.1635526124149; 
 Fri, 29 Oct 2021 09:48:44 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id o1sm6245467wru.91.2021.10.29.09.48.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 09:48:43 -0700 (PDT)
Message-ID: <cca95b38-d36f-686b-5a5e-d5d8275dc4da@amsat.org>
Date: Fri, 29 Oct 2021 18:48:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 13/30] Hexagon HVX (target/hexagon) helper overrides
 infrastructure
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
References: <1634033468-23566-1-git-send-email-tsimpson@quicinc.com>
 <1634033468-23566-14-git-send-email-tsimpson@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1634033468-23566-14-git-send-email-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.512,
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
Cc: ale@rev.ng, bcain@quicinc.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/12/21 12:10, Taylor Simpson wrote:
> Build the infrastructure to create overrides for HVX instructions.
> We create a new empty file (gen_tcg_hvx.h) that will be populated
> in subsequent patches.
> 
> Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
> ---
>  target/hexagon/gen_tcg_hvx.h        | 21 +++++++++++++++++++++
>  target/hexagon/genptr.c             |  1 +
>  target/hexagon/gen_helper_funcs.py  |  3 ++-
>  target/hexagon/gen_helper_protos.py |  3 ++-
>  target/hexagon/gen_tcg_funcs.py     |  3 ++-
>  target/hexagon/meson.build          | 13 +++++++------
>  6 files changed, 35 insertions(+), 9 deletions(-)
>  create mode 100644 target/hexagon/gen_tcg_hvx.h

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

