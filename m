Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8168A6F06D2
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 15:45:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps1un-0002FO-Bp; Thu, 27 Apr 2023 09:44:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ps1uk-0002FA-I2
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:44:02 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ps1ui-0007cG-Px
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 09:44:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6IfIS2fR29AkcR25s9oC/susRkO83/WmAIcY7kiW5po=; b=wnlMmPg0f+v+Dj9Gw+r/IEiSSp
 OAc3LOdW8W9rHfS7jbtFELnaT6XDXc4QSz5N70Zq164Oqo+JZQ/BvlmJwkrazuLlqZJuSmWXVHGPa
 CPn2AlaXjN3CNk/NYwYkKMV/tWZ0fkJUeHU/erfJVB5USlK77SGW4zUidrU3eWpD6cec=;
Message-ID: <95da1f81-0e0a-5f22-6352-e9ad479afcb2@rev.ng>
Date: Thu, 27 Apr 2023 15:43:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 5/9] Hexagon (tests/tcg/hexagon) Add v68 HVX tests
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, ale@rev.ng,
 bcain@quicinc.com, quic_mathbern@quicinc.com
References: <20230426023018.1742266-1-tsimpson@quicinc.com>
 <20230426023018.1742266-6-tsimpson@quicinc.com>
Organization: rev.ng
In-Reply-To: <20230426023018.1742266-6-tsimpson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 4/26/23 04:30, Taylor Simpson wrote:
> ---
>   tests/tcg/hexagon/v6mpy_ref.h     | 161 ++++++++++++++++++++++++++++++
>   tests/tcg/hexagon/v68_hvx.c       |  90 +++++++++++++++++
>   tests/tcg/hexagon/Makefile.target |   3 +
>   3 files changed, 254 insertions(+)
>   create mode 100644 tests/tcg/hexagon/v6mpy_ref.h
>   create mode 100644 tests/tcg/hexagon/v68_hvx.c
>
> diff --git a/tests/tcg/hexagon/v6mpy_ref.h b/tests/tcg/hexagon/v6mpy_ref.h
> new file mode 100644
> index 0000000000..8258cddcb1
> --- /dev/null
> +++ b/tests/tcg/hexagon/v6mpy_ref.h

Use *.h.inc extension to match rest of codebase.

Otherwise,

Reviewed-by: Anton Johansson <anjo@rev.ng>



