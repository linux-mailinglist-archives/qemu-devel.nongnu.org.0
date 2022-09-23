Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DA75E7DEA
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 17:06:33 +0200 (CEST)
Received: from localhost ([::1]:42574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obkG8-00018E-5i
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 11:06:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1obk9c-0005M3-AR
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 10:59:48 -0400
Received: from rev.ng ([5.9.113.41]:49669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1obk9a-0000wk-CX
 for qemu-devel@nongnu.org; Fri, 23 Sep 2022 10:59:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+5LL7h2u/HyZAHEWAcmlYpbvawVdpdNpUXvP1/F0/v4=; b=jyrjBw1KEAG5f+4Ax598olK49L
 A7+1nXYCsGxh3R0m1GxRhudC/EBCqZa3/0fKlG8ReG/kvRlj+LXWSqpPfu+VgZwS9yUWKshHcHE8W
 iTGcYwXfvE2+SMRi4NC3baeCaaegsqNlCX68VAbcEq/Lj2mDX6sgWrcmYSguolzjDIUs=;
Message-ID: <90e1bb24-2099-0f51-f624-beecd042f3ce@rev.ng>
Date: Fri, 23 Sep 2022 16:59:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v11 10/15] target/hexagon: manually add flex/bison/glib2
 to remaining containers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, ale@rev.ng, babush@rev.ng, nizzo@rev.ng,
 tsimpson@quicinc.com, bcain@quicinc.com, mlambert@quicinc.com,
 richard.henderson@linaro.org
References: <20220804115548.13024-1-anjo@rev.ng>
 <20220804115548.13024-11-anjo@rev.ng> <87bkr6w6hu.fsf@linaro.org>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <87bkr6w6hu.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 9/23/22 15:42, Alex Bennée wrote:
> tricore doesn't build QEMU and debian10 went away in the last PR. To
> avoid confusion as the rest of the patch set makes its way through I've
> pulled 8, 9, and 10 into testing/next for my next PR.

Thanks for taking a look, we'll submit a new version of the patchset
without 8, 9, 10, and make sure to PR once testing/next has been
merged.

-- 
Anton Johansson,
rev.ng Labs Srl.


