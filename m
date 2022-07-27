Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2355825E3
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 13:49:59 +0200 (CEST)
Received: from localhost ([::1]:39770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGfY5-0005kV-VJ
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 07:49:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1oGfU8-0003o5-JP
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 07:45:54 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:43856
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1oGfU6-0001Wi-HV
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 07:45:52 -0400
Received: from [134.155.145.124] (mobile-145-124.wlan.uni-mannheim.de
 [134.155.145.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id DB774DA046C;
 Wed, 27 Jul 2022 13:45:45 +0200 (CEST)
Message-ID: <c596f6c7-d1d2-3387-5368-c79696c353d5@weilnetz.de>
Date: Wed, 27 Jul 2022 13:45:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 0/5] Enable unix socket support on Windows
To: Bin Meng <bmeng.cn@gmail.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220727073542.811420-1-bmeng.cn@gmail.com>
 <YuD/+ehoLlwvzopk@redhat.com>
 <CAEUhbmXR95LDOvPS6bRn5K4qeGLNXVVC0rtVAvGQsN7F8+VYQw@mail.gmail.com>
 <YuESQP8hEzJiDc7D@redhat.com>
 <CAEUhbmUW2nDnwFRfhCxNot3io7m3LRBAjk3xSbo7rok5977JXw@mail.gmail.com>
In-Reply-To: <CAEUhbmUW2nDnwFRfhCxNot3io7m3LRBAjk3xSbo7rok5977JXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>

Am 27.07.22 um 13:37 schrieb Bin Meng:

> On Wed, Jul 27, 2022 at 6:24 PM Daniel P. Berrangé <berrange@redhat.com> wrote:
>> That isn't qtest, that is basic unit tests. I would expect those to
>> be able to work with this series
> Ah, I see. Agreed, will do in v2.
>
> Regards,
> Bin


In v2 you might also call RtlGetVersion directly instead of getting the 
address (that is only needed if we want to support old Windows versions 
which don't provide that function).

Regards, Stefan



