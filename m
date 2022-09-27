Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 672B05EC6B4
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:41:57 +0200 (CEST)
Received: from localhost ([::1]:36824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBmV-0003eU-TJ
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1odAaz-0001q7-Rd
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:26:01 -0400
Received: from mout.gmx.net ([212.227.17.22]:45607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1odAax-00067M-W7
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664285151;
 bh=iSvzGbQNLh8TagAYIUjCPeRdKmZLzWjH17AXYeGzR4E=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=YH0zodkd1MnonuXJgVDRQr1OikE+yH/nrmT7oG8ji0jztwXJpamIW5vkPm7zQjYfG
 Zt+839cvAmngGMhUnEQ5J0styaFtzRotcL0zwhRa3u3beBj2ohZWiKRsiSvUbhgZcu
 AGnHo07j9mA0pOcvFo0Cy+oay88LYgzcIyMl1bFQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [192.168.20.60] ([92.116.138.255]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0Fxf-1pQAm0113X-00xOMr; Tue, 27
 Sep 2022 15:25:51 +0200
Message-ID: <5a390538-388d-79ac-13f0-c9702e56f86f@gmx.de>
Date: Tue, 27 Sep 2022 15:25:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: ddd
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <YzLctFYiBG/JkNuH@p100>
 <CAEUhbmUZ=aCUUyQBAP3vVAjypao4m2bbaCiCtrq8qqsriKm_Xg@mail.gmail.com>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <CAEUhbmUZ=aCUUyQBAP3vVAjypao4m2bbaCiCtrq8qqsriKm_Xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IQGwsW53kj/FOnJ1GcG81pF3ERJXgV3oRt+F3cFc/MWTB3Xm+pu
 catzwdFynCH1qYp3WrPYdcpuWU1hxWUT4Cbwc4gQCsSUovLMXGMrJE/i6Y6K1Yx9xyophME
 YKF9YayxCoPWrK1HpnmolsN+DYHNZ9ysNkGAr/lcWPxpTY9KJ96NuKi0uvcmc4lHYt9QKg9
 +xigNjpcPuNT/EDB4Bhxg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7DmmmPuMyY0=:d5HV0qrJZvwzRT1ZQZDE9a
 zDp4ekyYGg1JBOVcqsSY85+/PcDsJ1yEixEW/J2taMAh7iJO8+0vz9da3sG6EYxPOXnbHfqb8
 MwPHq+ovlqsKyab7UBLtwmB4On6EjxpZBovgyfGFm8ng9amWL5g2esZ0L72ZboTiYouvpflqN
 e7B9IrykPfH2mVbx8qC8AGBdCksZxL84J/0yAUcwRXBDhGqBM4M3kAUbzNhD6tmXpZW2cQeEa
 amv0wmkeBkDGsJpHeV2x/1lDi7IK3hTUwB3AzwtYXYyj2qoCZ4wGK3D+roXeVtdUvfY4krX5q
 S7ZBjs8CvX14yMRdLzCtA9mX+QoaMGz1Q2vjyEk3baAIcP3Duu5a9i4JKkhXVkDwV61dez8Yz
 t5MYkhUPggZPqzx+R+IoyfXU3nhdxRAtXLhmzkeQdqdsKf/TZn/yqoBJlfHJjwFuTiu5UrA6+
 KwL20L9DIPX0GTjoHpTz6PLrkMlBcnK3Lx+VUp7P5to/0DxDR9eAFBjYoA+0yO/WAcqVk8ikw
 QLr93XECj4Qp39BSWfskuwvPN42i7tPAd2JDC9ZhOaDTXCF53oR3nFGKbbjPjXKOoX4Gr7kk1
 EgY7RFB87nPqSSqKJobEz58VhILFj17rGTqY32RWgr5Ukm25FkpMYlBJdLiuuWh4FaySkzyIQ
 IxzUBd9PXJDM4ZqdlXBZtny1jNcv9ytieW3j28WSdJZWDV42HRHSVmHS6hVBF5+F8Qo8E3vDm
 86FhcMbYP0tfLJnWihJ0+9MG8sY/NpQlt12jg/FbO4x9URuvIObXDDCMD7b+PKXhusO7Lcimx
 GUw9slPmUhQ0Wje3MzoP3/PTJ1Ckg+LV/NyTncPL5AUV74JQ/W5MWuxmk1EQMz8UjrpwlKRxG
 R2pRi20FMP8gzPprFwl6y8xu+MhbhGNRdZui8tDb1Edi9hOYHDJUD7qJwrksuzBOkDZJS+b00
 +p/ISF2LDOPJurQwWX76USmggycvsk1InnFKQT/DRXhs2io+wDtCslPBMY2K8ZFrQqBGR1WGm
 TbzdUu1VKLZHhtlDVlXtMuRtt/+P3Oa6q7zg7LcJ4k4I0BYag2X8vIrcFKzqPuA4D42VUvQ9a
 SVgHBmHiKdSeiO3VCfHKPv5vw1SnoM6HtLsWjhl1thSEtG3TDHWhuu5VmWhXEtiIlOciJL8+b
 zxFjyJT4ymblSKS+/syNRX+fpX
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_ZBI=0.001,
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

On 9/27/22 15:11, Bin Meng wrote:
> On Tue, Sep 27, 2022 at 9:09 PM Helge Deller <deller@gmx.de> wrote:
>>
>> Add faccessat2() with strace output.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>>
>> ---
>> v2: Resending with minor commit message changes.
>>
>
> The commit summary makes no sense. Would you please resend?

Yes, sorry. "vi" tricked on me.
I did resend a few minutes later:
https://lists.nongnu.org/archive/html/qemu-devel/2022-09/msg04489.html

Helge

