Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 139B71A6BFE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Apr 2020 20:19:25 +0200 (CEST)
Received: from localhost ([::1]:47460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jO3g4-0002kY-2W
	for lists+qemu-devel@lfdr.de; Mon, 13 Apr 2020 14:19:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48540)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vr_qemu@t-online.de>) id 1jO3eQ-0002KM-TE
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 14:17:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vr_qemu@t-online.de>) id 1jO3eO-0002Q2-QH
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 14:17:42 -0400
Received: from mailout09.t-online.de ([194.25.134.84]:55008)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vr_qemu@t-online.de>) id 1jO3eO-0002NO-K6
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 14:17:40 -0400
Received: from fwd23.aul.t-online.de (fwd23.aul.t-online.de [172.20.26.128])
 by mailout09.t-online.de (Postfix) with SMTP id 06E3742266E8;
 Mon, 13 Apr 2020 20:17:37 +0200 (CEST)
Received: from [192.168.211.200]
 (XVKyicZfZh8UpCyJFvmohnb8M7IZ-SCq8e3k2p2p-JNXHpMKi6z2EErwcnqXtblwGJ@[46.86.48.198])
 by fwd23.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1jO3eK-4ZYztQ0; Mon, 13 Apr 2020 20:17:36 +0200
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH] hax: Windows doesn't like posix device names
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20200322210211.29603-1-vr_qemu@t-online.de>
 <e38bcea7-4fce-724f-d154-d3ffc3d3d33f@redhat.com>
Message-ID: <8ca00eb9-bf68-12c5-ab78-d048cc86f562@t-online.de>
Date: Mon, 13 Apr 2020 20:17:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e38bcea7-4fce-724f-d154-d3ffc3d3d33f@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-ID: XVKyicZfZh8UpCyJFvmohnb8M7IZ-SCq8e3k2p2p-JNXHpMKi6z2EErwcnqXtblwGJ
X-TOI-MSGID: 7e7b61e6-82a9-46e2-838c-e3db0de24c8f
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 194.25.134.84
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> On 22/03/20 22:02, Volker R=C3=BCmelin wrote:
>> Patch acb9f95a7c "i386: Fix GCC warning with snprintf when HAX
>> is enabled" replaced Windows device names with posix device
>> names. Revert this.
>>
>> Fixes: acb9f95a7c "i386: Fix GCC warning with snprintf when HAX is ena=
bled"

>> Queued, thanks.
>>
>> Paolo
>>

Hi Paolo,

I would like to remind you that without this patch qemu 5.0 on Windows wi=
ll not work with HAX. There is already a bug report at

https://bugs.launchpad.net/bugs/1871250

With best regards,
Volker

