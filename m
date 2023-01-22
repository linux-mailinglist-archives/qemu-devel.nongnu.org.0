Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE9F676B9D
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Jan 2023 09:26:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJVfX-0000PR-TX; Sun, 22 Jan 2023 03:25:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1pJVfR-0000Nv-F1
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 03:25:33 -0500
Received: from mail.xen0n.name ([115.28.160.31] helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1pJVfP-0004PS-SM
 for qemu-devel@nongnu.org; Sun, 22 Jan 2023 03:25:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1674375918; bh=SBB4Yv/TLCG0qjT68ZRyzZb49qL8hXdn1/med9Bx7Ak=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nNfnqKffD8ugxbBOKxDQOSQESg85onikIF1d+AnvLdXNi8TPFykFGbjze78DpUNjj
 159S6qVqcSNNVrfpXryLpdyojpugmBrBAVkCBl8jrlvkiWdlTYY93+P02VH7wg2a0U
 If36KNvLZgLaQqiSaP5fv2p3e7xk/zjuiZRIuPew=
Received: from [192.168.9.172] (unknown [101.88.135.165])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id BD4CB601A1;
 Sun, 22 Jan 2023 16:25:18 +0800 (CST)
Message-ID: <b29c7157-6b92-b318-958d-0fb8c14d6e13@xen0n.name>
Date: Sun, 22 Jan 2023 16:24:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101
 Firefox/111.0 Thunderbird/111.0a1
Subject: Re: [PATCH v2 03/10] target/loongarch: Disassemble pcadd* addresses
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: git@xen0n.name
References: <20230118011123.392823-1-richard.henderson@linaro.org>
 <20230118011123.392823-4-richard.henderson@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20230118011123.392823-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/18/23 09:11, Richard Henderson wrote:
> Print both the raw field and the resolved pc-relative
> address, as we do for branches.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/loongarch/disas.c | 37 +++++++++++++++++++++++++++++++++----
>   1 file changed, 33 insertions(+), 4 deletions(-)

Reviewed-by: WANG Xuerui <git@xen0n.name>

Thanks!


