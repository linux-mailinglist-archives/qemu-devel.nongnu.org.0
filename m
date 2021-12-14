Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D9F473E2E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 09:22:25 +0100 (CET)
Received: from localhost ([::1]:47924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx34q-0000DU-Uy
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 03:22:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mx2oU-0000PN-Fd
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 03:05:34 -0500
Received: from mail.xen0n.name ([115.28.160.31]:48802
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mx2oK-0000fZ-4M
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 03:05:21 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 96232600B0;
 Tue, 14 Dec 2021 16:05:14 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1639469114; bh=CdogWPpvpAEs2X1B/GUBgEeQCDQdaZJfCcWeK4KRuyo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=h34cfMNxrdveKPsert6BESFxUxRKj07U/00vR9n2I7TzF9ljRQKvTXFrHCBwaxXN1
 iPMqn0sE9aV7p1gjwDxe9sFOGhH18CWdCTJWxjG0sQKmV3rin+1XJXYl7iU3NdoyYq
 eoGMZXOARrioVpkZCF854syt0jS6sUjAxceemM7s=
Message-ID: <509821bc-7148-7690-e326-37f9f3c1c13f@xen0n.name>
Date: Tue, 14 Dec 2021 16:05:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:97.0) Gecko/20100101
 Thunderbird/97.0a1
Subject: Re: [PATCH v7 00/15] linux-user: simplify safe signal handling
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20211214002604.161983-1-richard.henderson@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20211214002604.161983-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.962,
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 12/14/21 08:25, Richard Henderson wrote:
> For convenience the tree is at
>
>    https://gitlab.com/rth7680/qemu/-/tree/lu-safesignal
>
> Xuerui, if you could rebase your tcg/loongarch work on
> top of this, I'd like to get both series in early in the
> next development cycle.
>
Thanks for the heads-up! I've just done this and sent v9.

