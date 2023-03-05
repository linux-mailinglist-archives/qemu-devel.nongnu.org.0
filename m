Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D7876AAF07
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Mar 2023 11:28:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYlaz-0007z6-NP; Sun, 05 Mar 2023 05:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pYlax-0007yy-OJ
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 05:27:59 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pYlaw-0002xv-0B
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 05:27:59 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 80C9840020;
 Sun,  5 Mar 2023 13:27:54 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id C256440;
 Sun,  5 Mar 2023 13:27:53 +0300 (MSK)
Message-ID: <69963eba-d001-150c-71d4-b2b23bfed4d1@msgid.tls.msk.ru>
Date: Sun, 5 Mar 2023 13:27:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
From: Michael Tokarev <mjt@tls.msk.ru>
Subject: stable releases
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi!

For a few qemu major releases already, we did not have any stable minor releases.
I'd love to change that, in order to consolidate efforts and to make better
software in the end.  But I need some (hopefully minor) help here.

I collected changes from qemu/master which apparently should go to -stable.
Published at git://isrv.corpit.ru/qemu.git , branch stable-7.2-staging
(probably should publish it on github or gitlab).
This contains stuff which I use on Debian in qemu package, which is based
on 7.2 version now.  The last 18 patches are not in Debian package yet,
going to push it today or tomorrow.

If nothing, this can be used as a base for actual 7.2.1 stable release,
maybe with more changes added (or some changes removed).

The help which I need is to be able to run some wider testing. Debian is
a relatively good testbed, and it is used by qemu already in terms of
bullseye-backports to run other tests, so it should be good, but I'd
love to have wider coverage still. Maybe some CI stuff which qemu has
for master, if not only just before actual release.

And as usual, this needs help in picking up changes which should go to
stable. But this is something which is always needed anyway.

Let's resurrect qemu-stable :)

Thanks,

/mjt

