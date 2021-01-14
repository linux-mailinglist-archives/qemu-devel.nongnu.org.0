Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F662F5F6B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 12:00:41 +0100 (CET)
Received: from localhost ([::1]:42908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l00Mq-0006Dh-Kl
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 06:00:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1l00IL-00056y-8U
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 05:56:01 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:51604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1l00II-0000MG-FV
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 05:56:00 -0500
Received: from [192.168.61.100] (lfbn-lyo-1-447-149.w2-7.abo.wanadoo.fr
 [2.7.4.149])
 by beetle.greensocs.com (Postfix) with ESMTPSA id A186321DD2;
 Thu, 14 Jan 2021 10:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1610621756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ghPV/S0QZ7dXjvqkn3l33zXzJc7M+6Op182p3pwjf6M=;
 b=si1UlKc/CPTvhOkO9UdRgaWi0a0O45rcKsu3x2NpwOBdeew4sFb9bsBhvbxl6JB6O5gub9
 510eTL1W9gt/IY5xcpvGFwcjacWpyYtFGg4MHwGM1uSy1JLMaw9Os0KQO/VGDoTDHhuWjG
 6NVl76uFlXd5SuboB0mvMvErWKaMJa0=
Subject: Re: About creating machines on the command line
To: Liviu Ionescu <ilg@livius.net>, BALATON Zoltan <balaton@eik.bme.hu>
References: <13ecc030-f42b-5a27-a0b3-b07921426ce9@greensocs.com>
 <eb4ac5c9-b1d0-90eb-ed2a-2710d3149482@eik.bme.hu>
 <D199A9CD-4564-4E52-8D50-14A183DD2ABE@livius.net>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <548bfe76-adee-e6cd-b783-6df3154986f4@greensocs.com>
Date: Thu, 14 Jan 2021 11:56:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <D199A9CD-4564-4E52-8D50-14A183DD2ABE@livius.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, richard.fuhler@sifive.com,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 sam.grove@sifive.com, Mark Burton <mark.burton@greensocs.com>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 edgar.iglesias@gmail.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Liviu,

On 1/11/21 9:28 PM, Liviu Ionescu wrote:
> I know it does not answer your question directly, but you might find useful to take a look at the solution used in the xPack QEMU Arm (formerly GNU ARM Eclipse QEMU).
> 
> In this fork I dynamically create the peripheral registers when QEMU starts, by reading a JSON file, converted from the CMSIS SVD files.
> 
> Unfortunately this is not enough, since the actions associated with each register are not defined in these JSONs, and need to be hardcoded in code.
> 
> 
> But I think that the mechanism to create peripherals and registers might be adapted to your use case too.
Thanks, I'll have a look. But yes the goal here is to rely on QEMU's 
already existing device models to dynamically create a machine.

Luc

> 
> Regards,
> 
> Liviu
> 
> 

