Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A45C6DF6E1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Apr 2023 15:21:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmaP3-0001uD-8O; Wed, 12 Apr 2023 09:20:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pmaOr-0001mM-BY
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:20:38 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pmaOo-0000uX-B4
 for qemu-devel@nongnu.org; Wed, 12 Apr 2023 09:20:36 -0400
Received: from [134.155.144.166] (mobile-144-166.wlan.uni-mannheim.de
 [134.155.144.166])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id AB633DA0BC0;
 Wed, 12 Apr 2023 15:20:31 +0200 (CEST)
Message-ID: <b3719755-4a28-b493-0a56-0b8d14835586@weilnetz.de>
Date: Wed, 12 Apr 2023 15:20:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: source fails to compile on msys2
To: Howard Spoelstra <hsp.cat7@gmail.com>,
 qemu-devel qemu-devel <qemu-devel@nongnu.org>
References: <CABLmASGEEMLWTwsZN1Yft_B5tV6Cw_2MXv-as_A3CQYhrn-nWA@mail.gmail.com>
In-Reply-To: <CABLmASGEEMLWTwsZN1Yft_B5tV6Cw_2MXv-as_A3CQYhrn-nWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.083,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 12.04.23 um 15:13 schrieb Howard Spoelstra:
> Hello Peter,
> 
> My source was cloned today. I just cloned again and I still see the 
> tokens reversed:
> git clone https://www.gitlab.com/qemu/qemu 
> <https://www.gitlab.com/qemu/qemu> qemu-master-clean

The official URL is https://gitlab.com/qemu-project/qemu/.

Regards,
Stefan

