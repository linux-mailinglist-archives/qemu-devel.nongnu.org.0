Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C616541350B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 16:09:02 +0200 (CEST)
Received: from localhost ([::1]:42200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSgSD-0006Xl-Ei
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 10:09:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSgQj-0005gQ-VL
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 10:07:29 -0400
Received: from [115.28.160.31] (port=52366 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSgQf-0002dq-FB
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 10:07:29 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 88746600FF;
 Tue, 21 Sep 2021 22:07:08 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632233228; bh=hNNtRFfAvLnozrYNAs4M2bRQeMKeYQko95ogE8fVS0g=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=E8bYKqCJfhhu1v/fgcHK0XMZvYlNHDS8dLcQqU2CwsGsAm7tsHlhzmx7EnIXeJTA7
 rHUSqPIG2Tpzt40lfRdkQDVDdmg8ZQ32weuqZtuBvb4ojx8edAS0hxj+RdwcFuR8db
 zCXUs/ltirnxEJ09l/IURz3uwjhATYVXFHMNEzHk=
Message-ID: <2d1c4431-1d69-bd71-fc74-6a29cbd10f04@xen0n.name>
Date: Tue, 21 Sep 2021 22:07:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH 28/30] configure, meson.build: Mark support for 64-bit
 LoongArch hosts
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-29-git@xen0n.name>
 <de7efdfe-24ae-015c-015d-50acc245df1c@linaro.org>
 <baa4bcf7-9e4f-1745-5957-6d715a14f711@xen0n.name>
 <b8d75100-3d0a-7864-fb48-419f77a48035@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <b8d75100-3d0a-7864-fb48-419f77a48035@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 9/21/21 21:30, Richard Henderson wrote:
> On 9/20/21 11:02 PM, WANG Xuerui wrote:
>
>> So should I drop the explicit probing for __loongarch64, instead just 
>> probe for __loongarch__ and later #error out the non-__loongarch64 
>> cases individually?
>
> I'm ok with checking the __loongarch64 define, but I thing 
> ARCH=loongarch is sufficient. That name will apply to 
> linux-user/host/$ARCH/ and tcg/$ARCH/.
>
I just dug deeper into this while waiting for compilations; indeed the 
cpu variable must be "loongarch64" but ARCH could be just "loongarch". 
The $cpu is shoved directly into the meson cross file as CPU family 
name, for which only "loongarch64" is valid [1]. I'll keep probing for 
__loongarch64 but just transform the ARCH value.

[1]: https://mesonbuild.com/Reference-tables.html#cpu-families



