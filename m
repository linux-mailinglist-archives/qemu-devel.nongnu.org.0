Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21135344DB
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 22:31:20 +0200 (CEST)
Received: from localhost ([::1]:53048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntxf5-0008PN-HL
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 16:31:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ntxbn-0006c1-IZ
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:27:55 -0400
Received: from rev.ng ([5.9.113.41]:54235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ntxbl-00041C-Hp
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:27:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4BCxGqoCDUNdotjzpAAHdKzZqG+evoQk3CTZ+Aokw+A=; b=FL4hgSAesJAcY6N9OrzVEO91pg
 GympMKHYD9MQNE/rxZLHcZCyQt8lTcJhb88B0cheq+7Xs5XOt5CdtcwBSfna72q0/nrw3xjJ106/v
 4xAZEfx/mWwCdHoLMugNg+vyOh3IGXIW/FBsIUTc3waRuzTcDe1LzIW0dTd1j2u4k9ZA=;
Message-ID: <2eebbb25-ef43-2f9e-245f-3aaa37c711be@rev.ng>
Date: Wed, 25 May 2022 22:27:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v9 08/12] target/hexagon: import flex/bison to docker files
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com,
 mlambert@quicinc.com, babush@rev.ng, nizzo@rev.ng, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>
References: <a430eb4a-20db-8c04-e9ce-0d3e1d4c3c46@linaro.org>
 <87czg11s8w.fsf@linaro.org> <67c27109-2bb4-7147-ab7d-215b6b03b4cf@rev.ng>
 <dbe09d66-dc14-c37a-af08-2378a4640e53@linaro.org>
Organization: rev.ng
In-Reply-To: <dbe09d66-dc14-c37a-af08-2378a4640e53@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

On 5/25/22 22:16, Richard Henderson wrote:

>
> No:
>
> * one patch to update libvirt-ci and does nothing else.
> * one patch to update yml template.
> * one patch to refresh.
>
> Just like you enumerated before.
>
>
> r~
>
Ah, right! Thanks for clarifying. Should I keep all 3 patches in this 
series?

-- 
Anton Johansson,
rev.ng Labs Srl.


