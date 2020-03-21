Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3612F18E35A
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Mar 2020 18:30:40 +0100 (CET)
Received: from localhost ([::1]:39304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFhxG-0006CB-UX
	for lists+qemu-devel@lfdr.de; Sat, 21 Mar 2020 13:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55788)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <balaton@eik.bme.hu>) id 1jFhwM-0005ho-Id
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 13:29:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <balaton@eik.bme.hu>) id 1jFhwL-0002Qa-04
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 13:29:41 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:41260)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1jFhwJ-0002Pp-U0
 for qemu-devel@nongnu.org; Sat, 21 Mar 2020 13:29:40 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id E167D747DF7;
 Sat, 21 Mar 2020 18:29:37 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 70E267476D5; Sat, 21 Mar 2020 18:29:37 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 6F60A7475F6;
 Sat, 21 Mar 2020 18:29:37 +0100 (CET)
Date: Sat, 21 Mar 2020 18:29:37 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: qemu-devel@nongnu.org
Subject: In tree configure errors since 6116aea9
Message-ID: <alpine.BSF.2.22.395.2003211825370.55214@zero.eik.bme.hu>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Since 6116aea99, or actually 4d6a835d (linux-user: introduce parameters to 
generate syscall_nr.h) but only next commit starts to enable it I get 
these errors when running configure in source tree:

grep: ./.gitlab-ci.d: Is a directory
grep: ./scripts/qemu-guest-agent/fsfreeze-hook.d: Is a directory

for each entry in that loop over arches. Could this be silenced?

Regards,
BALATON Zoltan

