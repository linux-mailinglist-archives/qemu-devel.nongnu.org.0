Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3965D64E34E
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 22:37:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5vuw-0002T7-5T; Thu, 15 Dec 2022 16:37:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1p5vuq-0002Sb-I3
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 16:37:20 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1p5vun-0002nn-Su
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 16:37:20 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id F2CCC401E3;
 Fri, 16 Dec 2022 00:37:17 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 480603B9;
 Fri, 16 Dec 2022 00:37:16 +0300 (MSK)
Message-ID: <bb7cce4f-2d92-20d7-8a01-deb5ed55e0c5@msgid.tls.msk.ru>
Date: Fri, 16 Dec 2022 00:37:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PULL 19/20] tcg/ppc: Optimize 26-bit jumps
Content-Language: en-US
From: Michael Tokarev <mjt@tls.msk.ru>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Leandro Lupori <leandro.lupori@eldorado.org.br>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
 <20221004195241.46491-20-richard.henderson@linaro.org>
 <752b9f2a-0276-2685-8e28-821aaf626437@msgid.tls.msk.ru>
In-Reply-To: <752b9f2a-0276-2685-8e28-821aaf626437@msgid.tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

>> From: Leandro Lupori <leandro.lupori@eldorado.org.br>

And this address bounces for me, FWIW:

  eldorado-org-br.mail.protection.outlook.com[104.47.70.110] said:
    550 5.4.1 Recipient address rejected: Access denied. AS(201806281)

/mjt

