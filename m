Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E034359C2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:13:04 +0200 (CEST)
Received: from localhost ([::1]:52592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdPRv-0003Yd-K7
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>)
 id 1mdPPi-0001rG-OS; Thu, 21 Oct 2021 00:10:49 -0400
Received: from mail.xen0n.name ([115.28.160.31]:41318
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>)
 id 1mdPPe-000343-KV; Thu, 21 Oct 2021 00:10:46 -0400
Received: from [192.168.9.172] (unknown [101.88.135.223])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 36FE1600B5;
 Thu, 21 Oct 2021 12:10:36 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1634789436; bh=X2wQd5Wt89WN/JfZ9I/2SoZGdFwLNv9dFoddkRYoTjk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=I4MEvyHAuNavD2mEEZrBzrURNf17xAFbETxvY/MDyUZPAN4EvP6zcYT/IZ4SyWHs0
 9+CgbmG9rhFXG16w69InWxGzaA905XEODNPze+D4YcBSVL4NdUwXMb0EIEUeaLy0O9
 KQK/XyqcevV7HFjuHvBIk/fI1zU0tnQCGlM9UkN0=
Message-ID: <143c6683-a84e-c3b3-ab67-33db648c6c0f@xen0n.name>
Date: Thu, 21 Oct 2021 12:10:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:95.0) Gecko/20100101
 Thunderbird/95.0a1
Subject: Re: [PATCH v7 02/21] target/loongarch: Add core definition
Content-Language: en-US
To: Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, karl@freefriends.org
References: <1634561247-25499-1-git-send-email-gaosong@loongson.cn>
 <1634561247-25499-3-git-send-email-gaosong@loongson.cn>
 <5d8d1719-c6f3-1de5-b086-298e8379d8b6@xen0n.name>
 <274b9066-66c1-b246-72c6-35d6791cba0e@amsat.org>
 <aa983155-85ed-f3e3-47b2-b7138125e8d0@loongson.cn>
 <74bbac65-2cd4-dac7-86d1-e18cfa3f3f1f@xen0n.name>
 <da597248-8e06-2f14-b39e-67c457aa5a71@linaro.org>
 <49d356da-30dd-6460-73fa-8a9e165a9091@loongson.cn>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <49d356da-30dd-6460-73fa-8a9e165a9091@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.267,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, qemu-devel-owner@nongnu.org,
 yangxiaojuan@loongson.cn, peterx@redhat.com, laurent@vivier.eu,
 alistair.francis@wdc.com, maobibo@loongson.cn, pbonzini@redhat.com,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/21/21 11:21, Song Gao wrote:

> BTW,
> Account yangxiaojuan@loongson.cn It seems that she has been blacklisted. Xiaojuan sent 31 e-mails, which were not displayed since the 21st one, people who don't have a CC can't read all the emails,  and xiaojuan reply can't be in qemu-level@nongnu.org.
>    
> <snip>
>
>
> Xuerui said:
>
> "You may address the several review comments then just send v2. This way
> the threading is less likely to be damaged (you need to exactly specify
> In-Reply-To headers and such for the re-sent patches to correctly link
> to this thread, I think it's not worth the effort). "
>
> I think this will have the same problem.
>
> Richard and Karl,  How can we solve this problem？

You and Xiaojuan seem to be in some kind of close cooperation; for 
example every patch from you has double Signed-off-by lines. So I 
suppose you could just switch to the intended branch and `git 
send-email` for her; proper "From:" lines will be prepended to every 
mail where Git author differs from git-send-email identity. Just 
remember not to commit/send blobs next time though.

As for the supposed "ban" on Xiaojuan's account, we cannot diagnose this 
without mailing list owners' help; maybe it was just some kind of 
automatic temporary ban, or even connectivity problem on Loongson's side.


