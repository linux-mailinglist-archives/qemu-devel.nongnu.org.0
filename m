Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23447667AA5
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 17:22:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG0KM-0004Vh-2j; Thu, 12 Jan 2023 11:21:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pG0KJ-0004VH-R1
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:21:15 -0500
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1pG0KH-0005lp-Se
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:21:15 -0500
Received: from [192.168.178.59] (p5b151831.dip0.t-ipconnect.de [91.21.24.49])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 3948EDA0C5C;
 Thu, 12 Jan 2023 17:21:10 +0100 (CET)
Message-ID: <1c3c675d-e831-00ff-5076-424d97d05402@weilnetz.de>
Date: Thu, 12 Jan 2023 17:21:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Neal Elliott <nealelliott@netscape.net>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1742086835.396699.1673536606737.ref@mail.yahoo.com>
 <1742086835.396699.1673536606737@mail.yahoo.com>
Subject: Re: building qemu on windows 11
In-Reply-To: <1742086835.396699.1673536606737@mail.yahoo.com>
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
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 12.01.23 um 16:16 schrieb Neal Elliott:
> Hello,
>               is it possible, or has anyone built qemu from the master 
> branch using visual studio? I attempted to
> build the code using mingw64, but it failed to build. is there a current 
> build document for windows?

Building with Visual Studio is not supported.

Building on Windows with Mingw64 might fail (see 
https://gitlab.com/qemu-project/qemu/-/issues/1386), and the current 
documentation requires an update.

I suggest to run a cross build on Linux which works and is also much 
faster than building on Windows. Here is an example of such a build 
running as a GitHub action:
https://github.com/stweil/qemu/actions/runs/3903880614/jobs/6668872989

The related files are win.yml, build.sh and pacman.sh
from https://github.com/stweil/qemu/tree/master/.github/workflows.
The two shell scripts should also work on a typical Debian / Ubuntu or 
similar Linux host.

Regards
Stefan Weil

