Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B30A5EAF06
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 20:04:16 +0200 (CEST)
Received: from localhost ([::1]:33176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocsSk-0008B2-Hu
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 14:04:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1ocrVI-0001im-V0
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:02:48 -0400
Received: from mail.xen0n.name ([115.28.160.31]:49664
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1ocrVF-0004Je-AK
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 13:02:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1664211753; bh=mcO+vXRKIOGsnMcHjhtGQhIMFd9Na0z9cLtiklQLfzA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kzEkzAFuWaS+8csfkpsknlywvhkZZpaJrvgzX8YANbDat2fx1CFHOtLSVi4vcQraf
 SzeUQ+xbphFL3QovgDx8RxtSRaB+4xZfu8EyrkFz8g6mov9PXqyNCx23HLHj9BRZ9Z
 hdMQFLVgJODUJsrxG6TQNsCT7cCxAc5ccrGcVvJI=
Received: from [192.168.71.110] (unknown [116.236.142.206])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E1E106009B;
 Tue, 27 Sep 2022 01:02:32 +0800 (CST)
Message-ID: <a14cbcb3-02f5-9f2f-f295-569a47e2cc18@xen0n.name>
Date: Tue, 27 Sep 2022 01:02:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:107.0)
 Gecko/20100101 Thunderbird/107.0a1
Subject: Re: [PATCH v1 4/7] contrib/gitdm: add WANG Xuerui to individual
 contributers
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: WANG Xuerui <git@xen0n.name>
References: <20220926134609.3301945-1-alex.bennee@linaro.org>
 <20220926134609.3301945-5-alex.bennee@linaro.org>
Content-Language: en-US
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <20220926134609.3301945-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

On 2022/9/26 21:46, Alex Bennée wrote:
> His blog confirms he is not affiliated with Longsoon.
It's spelled "Loongson" ;-)
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: WANG Xuerui <git@xen0n.name>
> ---
>   contrib/gitdm/group-map-individuals | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/contrib/gitdm/group-map-individuals b/contrib/gitdm/group-map-individuals
> index 0ec003048c..6a3b593df0 100644
> --- a/contrib/gitdm/group-map-individuals
> +++ b/contrib/gitdm/group-map-individuals
> @@ -36,3 +36,4 @@ chetan4windows@gmail.com
>   akihiko.odaki@gmail.com
>   simon@simonsafar.com
>   paul@nowt.org
> +git@xen0n.name

And thanks for updating it for me!

So with the typo fix:

Reviewed-by: WANG Xuerui <git@xen0n.name>

