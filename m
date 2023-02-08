Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BF668EF56
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 13:52:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPjvI-0001xM-0g; Wed, 08 Feb 2023 07:51:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pPjvF-0001xD-Ll
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:51:37 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pPjvE-00025B-9Y
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 07:51:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3XzbDVC4Mt6LOtde3qA6OJnkjJXI9WAqa7wfpuXLPLY=; b=beOTtDyl1S9blXp1YkxbJbU8su
 EtX6ge6cQyjWfFr664w1OESrugxcsxYZh/5NTI3i6eBqLzhpAAD8BTw8IEcz+Xh49wD77LpjFNyb0
 AfnygZiwE2b8h06FFq02n7yYTkFEA9cu01+03hBg3yc17xVrA0sahO5jSSNNQnliS+gc=;
Message-ID: <a808e8b5-10e0-37a3-0848-0e5e5300ffa1@rev.ng>
Date: Wed, 8 Feb 2023 13:51:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 3/3] target: Set `CF_PCREL` for arm and i386 frontends
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org
References: <20230207104352.11055-1-anjo@rev.ng>
 <20230207104352.11055-4-anjo@rev.ng>
 <56ef8dc0-d860-bf55-050d-3cf60ae18ee5@linaro.org>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <56ef8dc0-d860-bf55-050d-3cf60ae18ee5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.146,
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


On 2/7/23 12:27, Philippe Mathieu-Daudé wrote:
> Better to split in 2 distinct patches since two different
> subsystems are modified.

Will do, thanks! What do think you of the previous patch in terms of 
splitting
on subsystems? I was a bit torn between keeping it as giga-patch and
splitting it up.

-- 
Anton Johansson,
rev.ng Labs Srl.


