Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 799545ECBDC
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 20:05:54 +0200 (CEST)
Received: from localhost ([::1]:46916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odExt-0000bz-4u
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 14:05:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1odEtn-00059X-2I
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 14:01:39 -0400
Received: from rev.ng ([5.9.113.41]:38483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1odEtl-0006qQ-40
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 14:01:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uHNdjyr2RuNREa8N0VP/Lr1ntA982vnXuO7RoG6uVkg=; b=TW0DuDUYAMPjKAjWb/YpZdr1cW
 y9e51xXmDMwqnXctsiCXRMDUVBlQODDtXpN/IC2VoEuIQeMxBByyjHQwI0uiZfHjqLCOegdpWe1dA
 hSs8wxH7bBi3Z+01nWoMBzeDpM1UVYfdvbGdwOBVJL5RxlB7EEFIf8yDdUBCBvwUqvsk=;
Message-ID: <7295f254-8190-a523-80fa-8f19647c182e@rev.ng>
Date: Tue, 27 Sep 2022 20:01:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v11 03/15] target/hexagon: make slot number an unsigned
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: ale@rev.ng, babush@rev.ng, nizzo@rev.ng, tsimpson@quicinc.com,
 bcain@quicinc.com, mlambert@quicinc.com, richard.henderson@linaro.org,
 alex.bennee@linaro.org
References: <20220804115548.13024-1-anjo@rev.ng>
 <20220804115548.13024-4-anjo@rev.ng>
 <bd0bf334-f374-6a28-fa57-4b2521bb4a02@amsat.org>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <bd0bf334-f374-6a28-fa57-4b2521bb4a02@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

> Using 'unsigned' would keep consistency with the rest of the codebase.
>
> Otherwise,
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Good catch, I'll make sure to change the various `uint32_t` -> 
`unsigned`! :)

-- 
Anton Johansson,
rev.ng Labs Srl.


