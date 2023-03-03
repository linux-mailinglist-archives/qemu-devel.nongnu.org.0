Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6AD6A9B01
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 16:47:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7cW-0003cb-QW; Fri, 03 Mar 2023 10:46:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pY7cO-0003Yz-F0
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:46:48 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pY7cM-0006kU-Qp
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:46:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yk94zxzF93gbgjv64JoEklpGl7oc7CNWw3/6RFru3mc=; b=EGsr5HfIwJkAMRuMaxPoGxtTAN
 XtgeQQEm7QPV6qThZk3mbmFx6cDApR8tsKnV948vcZLWekH0QTvt4YuIdb/pYbfu7MetilYPckX3y
 MiG8TiNI8FC4gqE5XqqKPNEj6QovsoIiKUkvAqBjvipn++0M1SQi8j+fjYesE+3NM+VE=;
Message-ID: <10984704-5db2-0c37-9f48-9cca230508bd@rev.ng>
Date: Fri, 3 Mar 2023 16:46:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v5 10/14] Hexagon (tests/tcg/hexagon) Enable HVX tests
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "philmd@linaro.org" <philmd@linaro.org>, "ale@rev.ng" <ale@rev.ng>,
 Brian Cain <bcain@quicinc.com>,
 "Matheus Bernardino (QUIC)" <quic_mathbern@quicinc.com>
References: <20230131225647.25274-1-tsimpson@quicinc.com>
 <20230131225647.25274-11-tsimpson@quicinc.com>
 <591bba23-012c-84d4-b9b7-69f355da9a93@rev.ng>
 <SN4PR0201MB8808D841E660E90F4C1C965FDED89@SN4PR0201MB8808.namprd02.prod.outlook.com>
 <SN4PR0201MB8808A5D08FFD2439C338EFD5DED89@SN4PR0201MB8808.namprd02.prod.outlook.com>
Organization: rev.ng
In-Reply-To: <SN4PR0201MB8808A5D08FFD2439C338EFD5DED89@SN4PR0201MB8808.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


On 2/8/23 21:29, Taylor Simpson wrote:
> I need to add $(LDFLAGS) to the build command.
> -- a/tests/tcg/hexagon/Makefile.target
> +++ b/tests/tcg/hexagon/Makefile.target
> @@ -88,4 +88,4 @@ hvx_misc: CFLAGS += -mhvx
>   hvx_histogram: CFLAGS += -mhvx -Wno-gnu-folding-constant
>   
>   hvx_histogram: hvx_histogram.c hvx_histogram_row.S
> -       $(CC) $(CFLAGS) $(CROSS_CC_GUEST_CFLAGS) $^ -o $@
> +       $(CC) $(CFLAGS) $(CROSS_CC_GUEST_CFLAGS) $^ -o $@ $(LDFLAGS)
>
>
> I'll include this change in the next rev of the patch series.
>
> Thanks,
> Taylor
Reviewed-by: Anton Johansson <anjo@rev.ng>

