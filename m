Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDC955ABCF
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Jun 2022 19:47:16 +0200 (CEST)
Received: from localhost ([::1]:45888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o59sJ-0003HO-Ql
	for lists+qemu-devel@lfdr.de; Sat, 25 Jun 2022 13:47:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon.sapin@exyr.org>)
 id 1o58UU-0000lJ-Ko
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 12:18:34 -0400
Received: from r0-2.smtpout1.paris1.alwaysdata.com
 ([2a00:b6e0:1:40:1:0:10:6]:52905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simon.sapin@exyr.org>)
 id 1o58US-0008WK-6Z
 for qemu-devel@nongnu.org; Sat, 25 Jun 2022 12:18:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=alwaysdata.net; s=default; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wmaZ8xopRDY48MaLmtwz9JgGwxcMUSf42f2COCs5Htk=; b=enbxxyXeGDSihLQUnsQRYuE4dB
 NqKaKhEqiYbFaEJZrLTqQ69lnmvFfLiak1+FFgrsG2C9MPU+m1XQyVsDWtaOt6ycQc9+AbnmKYCKG
 mb+B0lJ019LzZtf3hay5PCRD29eqY8CCYEe6P5MMVD0MTnYa8sKummWmHucbvakeLd1I=;
Received: from [2a01:e34:ecb8:5a0:f192:bd1d:5684:24ee]
 by smtpout1.paris1.alwaysdata.com with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <simon.sapin@exyr.org>)
 id 1o58UM-0007mf-CF; Sat, 25 Jun 2022 18:18:26 +0200
Message-ID: <61c0c46a-16e0-dc4a-f03c-fdee2f7915cd@exyr.org>
Date: Sat, 25 Jun 2022 18:18:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/2] Convert fw_cfg.rst to reStructuredText syntax
Content-Language: en_US
To: qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20220625161455.1232954-1-simon.sapin@exyr.org>
 <20220625161455.1232954-2-simon.sapin@exyr.org>
From: Simon Sapin <simon.sapin@exyr.org>
In-Reply-To: <20220625161455.1232954-2-simon.sapin@exyr.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-alwaysdata-ID: 127135276
Received-SPF: pass client-ip=2a00:b6e0:1:40:1:0:10:6;
 envelope-from=simon.sapin@exyr.org; helo=r0-2.smtpout1.paris1.alwaysdata.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 25 Jun 2022 13:44:35 -0400
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

On 25/06/2022 18:14, Simon Sapin wrote:
> And add it to specs/index.rst

I meant to add to this commit message:

This is part of https://gitlab.com/qemu-project/qemu/-/issues/527

-- 
Simon Sapin

