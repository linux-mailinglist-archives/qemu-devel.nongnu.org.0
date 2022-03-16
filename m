Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F194DB12F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 14:19:52 +0100 (CET)
Received: from localhost ([::1]:60674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUTZ9-0003M8-3L
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 09:19:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTNH-0003ql-9r
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:07:36 -0400
Received: from [2a00:1450:4864:20::42a] (port=43914
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nUTNF-0001QR-OX
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:07:34 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a1so1511413wrh.10
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rB1yTvkgdJar5/EO9slEyfCq/RIoCagNVHAHiBcijBo=;
 b=aVM7VTdi3xTyJ1guzNWsNDevZr5ueS1A9802WKgxRko80rNBtaR9pWwHTQZYu2q/zD
 FJL9YXDk7jvwEtNgidDxY4GokxGK3+LtGmFs/rFfsn+ImXQDxAsgFy9Pj+FhkxLsE8ua
 rjlFq+NmYoB4DcvaBy48sKbd2t6+s6FqhdGt8xQV8nYYcocgMtiE8dSJ5DSEOnxecFyk
 TnJCxpKE9YGSXFqShZN7kT6mvKwDzdKNrioIySQCK1OYnGi59F8umHyFI3ZIzW8EvGYf
 HKuGo7LvqxkmvIALPVfdLoA3DMuHWPIFwkbVWeZGXWMKWY0RSpaPnd14Dq6U1d8hMdIL
 QeLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rB1yTvkgdJar5/EO9slEyfCq/RIoCagNVHAHiBcijBo=;
 b=hzqILtO4MRnHZ818CNjlsKCtPNB9TQwDa8430Vdb1IhBSkNjeakPhXYq9L7ghRqgTL
 pJcPmy2G18HPdWW0kVGscIDHhGYYR3sgHPkxxzPDtDYbncsEbO+0yrkwoZ6G2p0hUp8m
 rYCfeq9AH78y8pecZWd1R/flc2wbxJUXK/XEh4IdvpRBnhXcx8Mul8KyKVsW+uYuya31
 WhazOAN2Oae3QmYiJHln5l+bh/ZzGXIni0LW0IPU+O1mz557UcZfzMGli7wf+C2ro4rs
 P3fDsyhg4W0T9ndadDZlhtu6zkbAbNd25D49sk1ORqSoPdwgjt/0x8DWqsO0zRcX4r39
 qN3A==
X-Gm-Message-State: AOAM532qp19HKb7OgdiRl+RDXnjgkrcyeVASKkr2b/s+GMtNsQc4rfST
 SxnruweEPmsB+oP5I5oagJOqKyYhFKo=
X-Google-Smtp-Source: ABdhPJzrZi2z7EFwvudk7o2X6YAs6NdzDu2OBrv/IN61UFaBtpDxGVNR2/UbduPsYEJNXMvFHLznaA==
X-Received: by 2002:a5d:64a3:0:b0:203:d7e5:67ff with SMTP id
 m3-20020a5d64a3000000b00203d7e567ffmr5588069wrp.617.1647436052213; 
 Wed, 16 Mar 2022 06:07:32 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a05600c3b9700b0038b7c4c0803sm4580769wms.30.2022.03.16.06.07.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 06:07:31 -0700 (PDT)
Message-ID: <1f30dce4-fb06-ebe7-7aa4-07a8ccb50408@gmail.com>
Date: Wed, 16 Mar 2022 14:07:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH] audio/mixeng: Do not declare unused variables
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@gmail.com>
References: <20220316061053.60587-1-akihiko.odaki@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220316061053.60587-1-akihiko.odaki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/3/22 07:10, Akihiko Odaki wrote:
> The unused variables when FLOAT_MIXENG is defined caused warnings on
> Apple clang version 13.1.6 (clang-1316.0.21.2).
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@gmail.com>
> ---
>   audio/mixeng.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

