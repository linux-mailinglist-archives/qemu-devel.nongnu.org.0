Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8680D33C547
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:10:14 +0100 (CET)
Received: from localhost ([::1]:43614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLrfR-0006J6-IV
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lLrUU-0007DC-8f
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:58:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:34492)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lLrUR-00077B-UG
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:58:53 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 263C3AE44;
 Mon, 15 Mar 2021 17:58:50 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Subject: test failures for cross-i386-user
Message-ID: <4c8c6826-f32e-7793-9da9-9f3c71f8ab03@suse.de>
Date: Mon, 15 Mar 2021 18:58:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Eric,

I am seeing some test failures after todays' rebase on latest master for the "cross-i386-user", while on Friday it was ok:

https://gitlab.com/hw-claudio/qemu/-/jobs/1098390932

Running test test-cutils
**
ERROR:../tests/unit/test-cutils.c:2290:test_qemu_strtosz_metric: assertion failed (res == 12345000): (12344999 == 12345000)
Running test test-shift128
ERROR test-cutils - Bail out! ERROR:../tests/unit/test-cutils.c:2290:test_qemu_strtosz_metric: assertion failed (res == 12345000): (12344999 == 12345000)


Are you seeing this also?

Ciao,

Claudio

-- 
Claudio Fontana
Engineering Manager Virtualization, SUSE Labs Core

SUSE Software Solutions Italy Srl

