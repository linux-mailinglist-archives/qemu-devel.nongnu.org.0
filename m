Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C599B364031
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 13:03:43 +0200 (CEST)
Received: from localhost ([::1]:37764 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYRgs-0005ar-PX
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 07:03:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lYRJr-0007Tl-KX
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:39:55 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:57968
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1lYRJo-00036D-MY
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 06:39:55 -0400
Received: from mobile-149-057.wlan.uni-mannheim.de
 (mobile-149-057.wlan.uni-mannheim.de [134.155.149.57])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 5D4A7DA0730;
 Mon, 19 Apr 2021 12:39:49 +0200 (CEST)
To: Bug 1924912 <1924912@bugs.launchpad.net>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>
References: <161875180735.23175.14682430598239905387.malonedeb@wampee.canonical.com>
 <161875645795.6320.1996793877758730269.malone@soybean.canonical.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [Bug 1924912] VirtIO drivers don't work on Windows: "GLib: Too
 many handles to wait for!" crash
Message-ID: <9bb9996e-d7ac-44c5-2fd3-13f2a4d1c802@weilnetz.de>
Date: Mon, 19 Apr 2021 12:39:48 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <161875645795.6320.1996793877758730269.malone@soybean.canonical.com>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I can confirm the issue also with latest official QEMU sources.

Related issue URLs:

https://github.com/tesseract-ocr/tesseract/issues/2838

https://bugs.launchpad.net/qemu/+bug/1924912

Instructions and files required to reproduce the issue:

https://qemu.weilnetz.de/test/bugs/1924912/

Michael, Laurent, maybe you have an idea how to narrow down this issue?

Regards

Stefan



