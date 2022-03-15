Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A1E24D955D
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 08:34:54 +0100 (CET)
Received: from localhost ([::1]:44948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU1hl-0003OX-C9
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 03:34:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1nU1bV-0000iV-RC
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 03:28:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1nU1bT-000751-Qb
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 03:28:25 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 0F2F640127;
 Tue, 15 Mar 2022 10:28:13 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id CF87330C;
 Tue, 15 Mar 2022 10:26:12 +0300 (MSK)
Message-ID: <eee1fff2-57d0-7cab-bbf2-8b10e8a9491e@msgid.tls.msk.ru>
Date: Tue, 15 Mar 2022 10:28:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [ANNOUNCE] SeaBIOS 1.16.0
Content-Language: en-US
To: Kevin O'Connor <kevin@koconnor.net>, seabios@seabios.org,
 qemu-devel@nongnu.org, coreboot@coreboot.org
References: <Yh7UGn7Km6CJM2MG@morn>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <Yh7UGn7Km6CJM2MG@morn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

02.03.2022 05:19, Kevin O'Connor rote:
> The 1.16.0 version of SeaBIOS has now been released.  For more
> information on the release, please see:

Hi Kevin!
This release seems to be missing at https://www.seabios.org/downloads/ -
there are binaries in there, but not the source. Is it intentional?

Thanks,

/mjt

