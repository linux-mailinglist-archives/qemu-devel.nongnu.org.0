Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F005A652D79
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 08:52:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7trj-0001L3-86; Wed, 21 Dec 2022 02:50:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1p7trJ-0001Hw-B9
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:49:52 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1p7trH-0005CC-FU
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 02:49:49 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 50BE8401D9;
 Wed, 21 Dec 2022 10:49:38 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id B9C263B3;
 Wed, 21 Dec 2022 10:49:37 +0300 (MSK)
Message-ID: <9a3fdf8b-74db-7e0b-5bf1-43b0390e5be0@msgid.tls.msk.ru>
Date: Wed, 21 Dec 2022 10:49:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] meson: Clean up some dependencies regarding qemu-system
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster
 <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 qemu-devel@nongnu.org
References: <Y5zB+5t5K0AEj6Rn@p100>
 <31003f9a-5392-67ee-9ef2-01794c09510c@redhat.com>
 <75b841f6-1eab-9d5f-2ad7-89440931ac18@gmx.de>
 <CAFEAcA8q8aqWvd7dwuH79yzq6Kyg-EVo9YzsWJ_mav4bLLH7eQ@mail.gmail.com>
 <02766634-1ec0-436d-d641-c0c61997138e@linaro.org>
 <CAFEAcA-_ncQwXjkV7=ZMwQOjOonQhqJhOfQ8B7xAcVM=phhzyg@mail.gmail.com>
 <233346fa-a06f-f0a8-e842-bf386316ccbc@gmx.de>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <233346fa-a06f-f0a8-e842-bf386316ccbc@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -80
X-Spam_score: -8.1
X-Spam_bar: --------
X-Spam_report: (-8.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

20.12.2022 23:56, Helge Deller wrote:
..
> Given that info, would it then make sense to keep as is:
>     --enable-system
>     --enable-user
>     --enable-tools -> qemu-bridge-helper, vhost-user-gpu, virtfs-proxy-helper, virtiofsd
>     --enable-guest-agent -> guest agents  (option is there already, but not used)
> and additonally add:
>     --enable-utils  -> qemu-img, qemu-io, qemu-nbd

tools and utils is confusing, it smells like it's the same thing.

I understand that in theory, eg virtiofsd can be used without qemu, with some
other software, but in practice there's no such software, and I don't think
it will emerge in a (near) future. All the "tools" listed above are system-mode
helpers really, this is why I package them in qemu-SYSTEM-common in Debian.
They're not very useful for now without some of qemu-system-xx.  To my view,
these should be part of --enable-system, at least for now. Maybe with a
separate --enable-system-helpers to turn them off if needed but I don't
think it's necessary.

The new "utils" category above actually *is* useful by its own, especially
qemu-nbd, for example to access .qcow2 images from the host OS. This is what
eg Redhat is shipping in qemu-io package.  And these are good to have without
--enable-system.

/mjt

