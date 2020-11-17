Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BECE72B6F6E
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 20:59:05 +0100 (CET)
Received: from localhost ([::1]:39956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf784-0001pK-C1
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 14:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1kf77I-0001PL-EF
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:58:16 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:50858
 helo=v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1kf77G-0006RA-4e
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 14:58:16 -0500
Received: from localhost (localhost [127.0.0.1])
 by v2201612906741603.powersrv.de (Postfix) with ESMTP id 79E0BDB1C16;
 Tue, 17 Nov 2020 20:58:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
 by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id cshsJCBzQkqO; Tue, 17 Nov 2020 20:57:28 +0100 (CET)
Received: from macbook02.fritz.box (pd9ec344e.dip0.t-ipconnect.de
 [217.236.52.78])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id A3A7EDAA1BD;
 Tue, 17 Nov 2020 20:57:27 +0100 (CET)
To: Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
References: <97b04446-ca94-cebd-2d8d-4c2013521208@weilnetz.de>
 <20201117175030.eqz5run2m7qmx5qt@steredhat>
 <a6c8de1a-da41-1a4a-8907-790c2467a0b0@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: Regressions in build process introduced since August
Message-ID: <61c8ac57-2dce-0315-8915-97624f4d0341@weilnetz.de>
Date: Tue, 17 Nov 2020 20:57:23 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <a6c8de1a-da41-1a4a-8907-790c2467a0b0@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=v2201612906741603.powersrv.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 14:07:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 17.11.20 um 19:01 schrieb Paolo Bonzini:

> On 17/11/20 18:50, Stefano Garzarella wrote:
>> Running `configure [...] --extra-cflags=3D"-I /xyz"` results in
>> compiler flags `-I [...] /xyz`, so the `-I` and `/xyz` are separated
>> by other compiler flags which obviously cannot work as expected. I
>> could work around that by removing the space and using a pattern like
>> `-I/xyz`.
>>
>> This regression is not restricted to builds targeting Windows.
>
> I'll take a look at fixing this (in meson).


Thanks. Here is another regression for builds targeting Windows:

Running `../configure --disable-guest-agent-msi [...]` fails with=20
"../qga/meson.build:64:4: ERROR: Key QEMU_GA_VERSION is not in dict".

QEMU_GA_VERSION is only set with enabled guest-agent-msi, but currently=20
used with enabled guest-agent even when guest-agent-msi is disabled.

Regards,

Stefan




