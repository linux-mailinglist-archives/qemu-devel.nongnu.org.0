Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 460AF43448D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 07:13:14 +0200 (CEST)
Received: from localhost ([::1]:35230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md3ub-0000Ir-Cq
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 01:13:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1md3tZ-00083z-9Q
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 01:12:09 -0400
Received: from mail.xen0n.name ([115.28.160.31]:56936
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1md3tT-0003zF-Da
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 01:12:08 -0400
Received: from [100.100.57.93] (unknown [220.248.53.61])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id B9D37600B5;
 Wed, 20 Oct 2021 13:11:52 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1634706713; bh=fQRodIJCm5wPJvIFjuGazsJV9BZzouLpJemOh+K4UrU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=W7deoZfevtkQ+X4Hv2mVaHScQsHusQ/qpcIKRLShz5kiTZ34lAAgAuY/cWTi5Otp4
 9jW0SX28MPK2g2UItQk8E2x5yC5U6UWaXDdCLNumapDuAmWtaK8orXKckti/rlmt5H
 Kvx8OLkMn0U01ta2j1VO9BQUTEZDV9d8+eqen+B0=
Message-ID: <c9ba6283-27b1-20fb-c5e2-e663aa6e242f@xen0n.name>
Date: Wed, 20 Oct 2021 13:11:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:95.0)
 Gecko/20100101 Thunderbird/95.0a1
Subject: Re: [PATCH 00/31] Add Loongarch softmmu support.
Content-Language: en-US
To: =?UTF-8?B?5p2o5bCP5aif?= <yangxiaojuan@loongson.cn>
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
 <871839b9-c0eb-c6f0-47b6-bd045884e622@xen0n.name>
 <7d933f8d.228e.17c9b556e98.Coremail.yangxiaojuan@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <7d933f8d.228e.17c9b556e98.Coremail.yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_20=-0.001, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.074,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, f4bug@amsat.org, mst@redhat.com,
 david@gibson.dropbear.id.au, mark.cave-ayland@ilande.co.uk,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, peterx@redhat.com,
 laurent@vivier.eu, alex.bennee@linaro.org, alistair.francis@wdc.com,
 maobibo@loongson.cn, gaosong@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, philmd@redhat.com, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Xiaojuan,


On 2021/10/20 09:33, 杨小娟 wrote:
> Hi， Xuerui
>     Thank you for your advice， I‘ll modify the README and put the binary in the github.
>     The remaining patches are send backed， I’ll find the cause and send them again.

Okay, understood; thanks for the quick response.

You may address the several review comments then just send v2. This way
the threading is less likely to be damaged (you need to exactly specify
In-Reply-To headers and such for the re-sent patches to correctly link
to this thread, I think it's not worth the effort).

> </yangxiaojuan@loongson.cn></i.qemu@xen0n.name>
>
> 本邮件及其附件含有龙芯中科的商业秘密信息，仅限于发送给上面地址中列出的个人或群组。禁止任何其他人以任何形式使用（包括但不限于全部或部分地泄露、复制或散发）本邮件及其附件中的信息。如果您错收本邮件，请您立即电话或邮件通知发件人并删除本邮件。 
> This email and its attachments contain confidential information from Loongson Technology , which is intended only for the person or entity whose address is listed above. Any use of the information contained herein in any way (including, but not limited to, total or partial disclosure, reproduction or dissemination) by persons other than the intended recipient(s) is prohibited. If you receive this email in error, please notify the sender by phone or email immediately and delete it. 
BTW really, ask your IT department to fix this nonsense. Multiple
upstreams using mailing lists as primary means of communication
(binutils etc) find problems with the mangling of contents, added
nonsense HTML-like tags and this footer not applicable to public
communication.

