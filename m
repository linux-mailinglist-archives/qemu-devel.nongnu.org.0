Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDB425C0EC
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 14:26:06 +0200 (CEST)
Received: from localhost ([::1]:38200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDoJZ-0004Hs-Pe
	for lists+qemu-devel@lfdr.de; Thu, 03 Sep 2020 08:26:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1kDoI8-0002kb-MW; Thu, 03 Sep 2020 08:24:36 -0400
Received: from iserv.reactos.org ([2a01:4f8:1c17:5ae1::1]:47094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hpoussin@reactos.org>)
 id 1kDoI7-0007Bj-5h; Thu, 03 Sep 2020 08:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org
 ; s=25047;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
 Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a4E04r5P7czh0efldHRzUjNahSUKd7UloILlqfbsWB4=; b=jsQE1kAcy0EetuOTlkOFlD4Xcb
 LlTmf1S0hzefmz1qzzcTjHQFQACJc8OXST78sWShF7QIT3nUNNKxeZIQ1BEkD5dgyDuFgSI/BFIOT
 LK9Y0EBM4BQgGF0pkdD9lTv7erKjFl7d7adcgtLtZ3TiQUbYI87aMZYPZOiKBMU3gwlU=;
Received: from [2a01:e35:2e3e:3c40:11ba:4ea9:f771:23c2]
 by iserv.reactos.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <hpoussin@reactos.org>)
 id 1kDoI4-0003o0-Q8; Thu, 03 Sep 2020 12:24:33 +0000
Subject: Re: [PATCH 47/63] rs6000_mc: Rename RS6000MC_DEVICE to RS6000MC
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20200902224311.1321159-1-ehabkost@redhat.com>
 <20200902224311.1321159-48-ehabkost@redhat.com>
From: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Message-ID: <38dc3ebe-1ba3-3fba-a242-e3ebee3f182b@reactos.org>
Date: Thu, 3 Sep 2020 14:24:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200902224311.1321159-48-ehabkost@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a01:4f8:1c17:5ae1::1;
 envelope-from=hpoussin@reactos.org; helo=iserv.reactos.org
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.403,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, berrange@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 03/09/2020 à 00:42, Eduardo Habkost a écrit :
> Make the type checking macro name consistent with the TYPE_*
> constant.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: "Hervé Poussineau" <hpoussin@reactos.org>
> Cc: David Gibson <david@gibson.dropbear.id.au>
> Cc: qemu-ppc@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>   hw/ppc/rs6000_mc.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>


