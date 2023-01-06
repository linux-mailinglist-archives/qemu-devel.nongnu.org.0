Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 415F765FC91
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Jan 2023 09:17:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDhtk-0006n1-TB; Fri, 06 Jan 2023 03:16:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pDhtY-0006ln-Uk
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:16:08 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pDhtS-000610-NX
 for qemu-devel@nongnu.org; Fri, 06 Jan 2023 03:16:07 -0500
Received: from [192.168.178.59] (p5b151831.dip0.t-ipconnect.de [91.21.24.49])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 21331DA100A;
 Fri,  6 Jan 2023 09:15:58 +0100 (CET)
Message-ID: <373666f9-7999-9628-b3ae-a749fcc2e1c3@weilnetz.de>
Date: Fri, 6 Jan 2023 09:15:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Bin Meng <bin.meng@windriver.com>
References: <20230105204819.26992-1-thuth@redhat.com>
 <4ff2d01a-e6bb-5a99-356b-6b2ade61b667@linaro.org>
 <5a2d8ef1-a478-0b6d-3c65-d792f162feaf@redhat.com>
Subject: Re: [PATCH] .gitlab-ci.d/windows: Do not run the qtests in the
 msys2-32bit job
In-Reply-To: <5a2d8ef1-a478-0b6d-3c65-d792f162feaf@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.939,
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 06.01.23 um 08:49 schrieb Thomas Huth:

> On 05/01/2023 22.42, Philippe Mathieu-Daudé wrote:
>
> > That said, maybe it is time to deprecate the 32-bit
> > hosts?
>
> Certainly fine for me, but that's up to the Windows folks to decide. 
> Maybe you could just suggest a patch to start the discussion?
>
>  Thomas


Download numbers from yesterday for my latest Windows installers:

qemu-w32-setup-20221230.exe - 243

qemu-w64-setup-20221230.exe - 6540

On Wednesday the ratio was 288 : 3516.

As expected the 64-bit variant is used much more often, but it looks 
like there is still a certain desire for the 32-bit variant.

Stefan



