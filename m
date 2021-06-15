Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1BF3A7382
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 03:54:46 +0200 (CEST)
Received: from localhost ([::1]:49520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsyHt-0006Fj-H3
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 21:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lsyGV-0004kK-LU
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 21:53:19 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:20500
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1lsyGS-0006c7-JB
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 21:53:19 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4G3rtq3dmYz8PbN;
 Mon, 14 Jun 2021 21:53:07 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; s=default; bh=4hVwBjuo6
 ImYY928IzYmQu8Ckg4=; b=V91GTYC0tqdW/qfQ8hbSlVRfw7Hp93uYzknT17fF6
 ktnqbCfy7fplJHGp61bXOU/ZCBlEfw6Rjmt7/+XwsHN5W3jgVX0aq9W6MynOyQi3
 rI7eHZJSd7uYkrlFG6jiShFIv1TTEsXbpjy+KWotNtlx160WVxsMiMSADvmMcNoz
 lo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=message-id
 :date:mime-version:subject:to:cc:references:from:in-reply-to
 :content-type:content-transfer-encoding; q=dns; s=default; b=oGl
 NO1apsTa3S62S0uDiTNfWPAiOpjo5uxQZG7eihFEGgY0tdRiur+PbqFfTxvHxDjE
 7AQz3LpaKd0/vSz/TlZTznyXhBCNze1xt/SBw7zGWHDBnTiL4KzjC9Ih0Zs3DEVQ
 bPjoIiC0DmhGCW0581yQ94JgZhd+hKcXUSpAVGDU=
Received: from [192.168.6.30]
 (bras-base-toroon2719w-grc-50-142-114-10-211.dsl.bell.ca [142.114.10.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4G3rtq2hP4z8PbK;
 Mon, 14 Jun 2021 21:53:07 -0400 (EDT)
Message-ID: <fa1b9eb9-e707-4dd1-78be-dce4c55c5004@comstyle.com>
Date: Mon, 14 Jun 2021 21:53:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101
 Thunderbird/90.0
Subject: Re: [PATCH] meson.build: Support ncurses on MacOS
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210612080358.61176-1-sw@weilnetz.de>
 <202eedd1-eb24-5463-c17a-64e146b95421@comstyle.com>
 <c3f3e9af-c81e-078c-5200-e2532a468cf7@weilnetz.de>
 <ff5fc830-8df8-7bd6-32df-3e8627edd74b@amsat.org>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <ff5fc830-8df8-7bd6-32df-3e8627edd74b@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.489,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/14/2021 1:45 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 6/13/21 8:33 AM, Stefan Weil wrote:
>> Am 13.06.21 um 03:40 schrieb Brad Smith:
>>
>>> This same problem also applies to OpenBSD as we have the same
>>> version of ncurses with support for wide characters. I have a similar
>>> patch in our QEMU port.
>>
>> Then we should either extend the conditional statement to handle OpenB=
SD
>> as well, or simply define both macros unconditionally:
>>
>>  =C2=A0=C2=A0=C2=A0 # Newer versions of curses use NCURSES_WIDECHAR.
>>  =C2=A0=C2=A0=C2=A0 # Older versions (e. g. on MacOS, OpenBSD) still r=
equire
>> _XOPEN_SOURCE_EXTENDED.
>>  =C2=A0=C2=A0=C2=A0 curses_compile_args =3D ['-DNCURSES_WIDECHAR=3D1',
>> '-D_XOPEN_SOURCE_EXTENDED=3D1']
>>
>> Defining only _XOPEN_SOURCE_EXTENDED would also work with old and new
>> versions, so that's another option.
> It is simpler to ask Brad to upstream the OpenBSD patch :)

That doesn't answer his question and that's the part that actually matter=
s.

