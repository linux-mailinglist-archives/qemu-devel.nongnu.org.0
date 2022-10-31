Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56ECD6132B2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 10:28:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opR46-00029c-3A; Mon, 31 Oct 2022 05:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1opR43-00029H-KO
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 05:26:39 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1opR41-00057Z-VW
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 05:26:39 -0400
Received: from [192.168.178.59] (p5b151d14.dip0.t-ipconnect.de [91.21.29.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 95099DA045D;
 Mon, 31 Oct 2022 10:26:35 +0100 (CET)
Message-ID: <c84bcda5-4927-03f9-c95f-900278a84e2b@weilnetz.de>
Date: Mon, 31 Oct 2022 10:26:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
To: Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
 <CAEUhbmVvxoZD7dJbMGud5LLp3fmZTyovgXUvEEdyuneg=K_LUg@mail.gmail.com>
 <1013abdd-1e46-1121-21f5-522cb9bb5cd1@redhat.com>
 <CAEUhbmX=pVTK1VdCz6XcpYdUb8_4Og2T2BXGWEs2znpxp9c6mw@mail.gmail.com>
 <573aea01-ecac-25ef-7dfc-6a4ce5a8f89b@redhat.com>
Subject: Re: [PATCH 0/7] nsis: gitlab-ci: Improve QEMU Windows installer
 packaging
In-Reply-To: <573aea01-ecac-25ef-7dfc-6a4ce5a8f89b@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 31.10.22 um 07:52 schrieb Thomas Huth:

> On 29/10/2022 15.45, Bin Meng wrote:
>> Stefan has reviewed / tested patch 1-3. Not sure who is going to queue
>> these 3 patches?
>
> If Stefan has time for a pull request, I think he would be the best 
> fit. Stefan?
>
> Otherwise, maybe Marc-André could take those patches, since he 
> apparently wrote that nsis.py script?
>
> (By the way, should we have an entry for that script in MAINTAINERS? 
> ... likely in the W32/W64 section?)
>
>  Thomas


Thanks. I have sent a pull request now.

Please excuse that some of you got that pull request e-mails twice.

I used Peter's make-pullreq script for the first time and had to learn 
how it works.

Stefan



