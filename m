Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 903866C6460
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 11:03:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfHmu-0004lf-V5; Thu, 23 Mar 2023 06:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <huangy81@chinatelecom.cn>)
 id 1pfHmr-0004lU-HE
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 06:03:13 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.220] helo=chinatelecom.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <huangy81@chinatelecom.cn>) id 1pfHmp-000889-Be
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 06:03:13 -0400
HMM_SOURCE_IP: 172.18.0.188:39088.849080593
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.188])
 by chinatelecom.cn (HERMES) with SMTP id 59BF028009A;
 Thu, 23 Mar 2023 18:02:51 +0800 (CST)
X-189-SAVE-TO-SEND: huangy81@chinatelecom.cn
Received: from  ([36.111.64.85])
 by app0023 with ESMTP id a86731a7f31e45468e36860e6917335f for
 armbru@redhat.com; Thu, 23 Mar 2023 18:02:56 CST
X-Transaction-ID: a86731a7f31e45468e36860e6917335f
X-Real-From: huangy81@chinatelecom.cn
X-Receive-IP: 36.111.64.85
X-MEDUSA-Status: 0
Message-ID: <94f4538d-a6e1-1f6d-5371-09942ba39539@chinatelecom.cn>
Date: Thu, 23 Mar 2023 18:02:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: QMP command set-vcpu-dirty-limit hangs
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 David Alan Gilbert <dgilbert@redhat.com>
References: <87fs9w2c0x.fsf@pond.sub.org>
From: Hyman Huang <huangy81@chinatelecom.cn>
In-Reply-To: <87fs9w2c0x.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.220;
 envelope-from=huangy81@chinatelecom.cn; helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



在 2023/3/23 14:54, Markus Armbruster 写道:
> Watch this:
> 
>      $ qemu-system-x86_64 -S -display none -qmp stdio -accel kvm,dirty-ring-size=1024
>      {"QMP": {"version": {"qemu": {"micro": 90, "minor": 2, "major": 7}, "package": "v8.0.0-rc0-15-g918ee397b6-dirty"}, "capabilities": ["oob"]}}
>      {"execute": "qmp_capabilities"}
>      {"return": {}}
>      {"execute": "set-vcpu-dirty-limit","arguments": {"dirty-rate": 200}
> 
> Hangs.
> 
> If I'm using it incorrectly (I have no idea), it should fail, not hang.
Indeed, it seems that the command syntax is right.
Would you please get the Qemu backtrace when it hang?

I'll reproduce it and update the process in the coming days.

Thanks for posting this issue.
> 

-- 
Best regard

Hyman Huang(黄勇)

