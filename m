Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79FC35D7E1
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 08:20:41 +0200 (CEST)
Received: from localhost ([::1]:36312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWCPg-0001Ey-Vz
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 02:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lWCOR-0000om-1D
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 02:19:23 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:39864
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lWCON-0006Lr-9X
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 02:19:22 -0400
Received: from edv-macbook-pro.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id A8EE1DA0446;
 Tue, 13 Apr 2021 08:19:15 +0200 (CEST)
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA8=qEFgvUqGFdWLJ+1ePPv2Ybisomrs2o77PyiAZA2sXg@mail.gmail.com>
 <CAEUhbmWsBfhub-+hMvucshCRH412fuvz5_=fAU_y7UmYJ4_=dQ@mail.gmail.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: any remaining for-6.0 issues?
Message-ID: <5445e140-94f1-dfcf-4652-0e47494e8c23@weilnetz.de>
Date: Tue, 13 Apr 2021 08:19:11 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmWsBfhub-+hMvucshCRH412fuvz5_=fAU_y7UmYJ4_=dQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 13.04.21 um 07:56 schrieb Bin Meng:

> On Mon, Apr 12, 2021 at 11:33 PM Peter Maydell <peter.maydell@linaro.or=
g> wrote:
>> Last call to note anything we need to fix for 6.0 on
>> https://wiki.qemu.org/Planning/6.0#Known_issues please.
>> The schedule is to tag rc3 tomorrow, which I would ideally like
>> to be the last rc before release. After rc3 I will only be taking
>> fixes for bugs which are absolutely critical...
> This patch (affects Windows install)
> http://patchwork.ozlabs.org/project/qemu-devel/patch/20210326062140.367=
861-1-bmeng.cn@gmail.com/
>
> is still not applied.
>
> Regards,
> Bin


That patch is based on an older version of my personal QEMU sources and=20
not required for 6.0.

The official QEMU sources install the whole share directory, so all=20
required firmware files are included. My latest installer=20
(https://qemu.weilnetz.de/w64/qemu-w64-setup-20210409.exe) installs=20
those files, too.

Regards,

Stefan



