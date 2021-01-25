Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 945D1302BF0
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 20:49:15 +0100 (CET)
Received: from localhost ([::1]:40274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l47rO-0000SY-50
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 14:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l47ps-0008HW-3Z
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 14:47:41 -0500
Received: from kerio.kamp.de ([195.62.97.192]:56039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1l47pk-000509-QV
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 14:47:37 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 20:47:26 +0100
Received: (qmail 22944 invoked from network); 25 Jan 2021 19:47:28 -0000
Received: from ac50.vpn.kamp-intra.net (HELO ?172.20.250.50?)
 (pl@kamp.de@::ffff:172.20.250.50)
 by submission.kamp.de with ESMTPS (DHE-RSA-AES128-SHA encrypted) ESMTPA;
 25 Jan 2021 19:47:28 -0000
Subject: Re: configure does not detect librados or librbd since the switch to
 meson
To: Paolo Bonzini <pbonzini@redhat.com>, dillaman@redhat.com,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, philmd@redhat.com
References: <23268a39-078d-ed13-6bb4-590ce1292662@kamp.de>
 <b8dff207-21d9-ce8f-63b3-f877d29d90c6@kamp.de>
 <bb07c231-6584-0d4d-959b-46948c9ab9bc@redhat.com>
From: Peter Lieven <pl@kamp.de>
Message-ID: <00855a0d-33e0-d835-e6e0-4d3af963975b@kamp.de>
Date: Mon, 25 Jan 2021 20:47:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <bb07c231-6584-0d4d-959b-46948c9ab9bc@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 25.01.21 um 16:24 schrieb Paolo Bonzini:
> On 25/01/21 15:31, Peter Lieven wrote:
>> on Dedian / Ubuntu configure does no longer detect librbd / librados
>> since the switch to meson.
>>
>> I need to add dirs: ['/usr/lib'] to the cc.find_library for librados
>> and librbd. But I am not familiar with meson
>>
>> and can't say if thats the appropriate fix.
>
> Can you include the meson-logs/meson-log.txt output?


Sure: https://pastebin.com/u3XtbDvQ


>
>> Further issue: if I specify configure --enable-rbd and cc.links fails
>> the configure command succeeds and rbd support is disabled.
>
> That's a separate bug.


For the rbd check I can address this as well in the series. Sadly, librbd has no pkg-config (yet). So, I have to create a C file that checks for the version.


Peter




