Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E172364095
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 13:32:06 +0200 (CEST)
Received: from localhost ([::1]:38716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYS8J-0002Ce-Dz
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 07:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lYS74-0001iA-CS
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 07:30:46 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:58294
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lYS72-0000Qa-0U
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 07:30:46 -0400
Received: from mobile-149-057.wlan.uni-mannheim.de
 (mobile-149-057.wlan.uni-mannheim.de [134.155.149.57])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id A9751DA0749;
 Mon, 19 Apr 2021 13:30:41 +0200 (CEST)
Subject: Re: [Bug 1924912] VirtIO drivers don't work on Windows: "GLib: Too
 many handles to wait for!" crash
From: Stefan Weil <sw@weilnetz.de>
To: Bug 1924912 <1924912@bugs.launchpad.net>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>
References: <161875180735.23175.14682430598239905387.malonedeb@wampee.canonical.com>
 <161875645795.6320.1996793877758730269.malone@soybean.canonical.com>
 <9bb9996e-d7ac-44c5-2fd3-13f2a4d1c802@weilnetz.de>
Message-ID: <6bbbd9be-487f-ba46-5a96-f58533af4d63@weilnetz.de>
Date: Mon, 19 Apr 2021 13:30:41 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <9bb9996e-d7ac-44c5-2fd3-13f2a4d1c802@weilnetz.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.04.21 um 12:39 schrieb Stefan Weil:

> I can confirm the issue also with latest official QEMU sources.
>
> Related issue URLs:
>
> https://github.com/tesseract-ocr/tesseract/issues/2838


Sorry, that URL was a copy+paste error. The correct one is 
https://github.com/SerenityOS/serenity/issues/6422.


>
> https://bugs.launchpad.net/qemu/+bug/1924912
>
> Instructions and files required to reproduce the issue:
>
> https://qemu.weilnetz.de/test/bugs/1924912/
>
> Michael, Laurent, maybe you have an idea how to narrow down this issue?
>
> Regards
>
> Stefan
>
>
>

