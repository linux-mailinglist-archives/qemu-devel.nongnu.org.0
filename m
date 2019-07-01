Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 858F03825D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 03:05:00 +0200 (CEST)
Received: from localhost ([::1]:45384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZ3JT-0006Lo-5A
	for lists+qemu-devel@lfdr.de; Thu, 06 Jun 2019 21:04:59 -0400
Received: from li.iankelling.org ([72.14.176.105]:54600
 helo=mail.iankelling.org)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.86_2) (envelope-from <iank@fsf.org>) id 1hZ3I6-0005w9-L3
 for qemu-devel@nongnu.org; Thu, 06 Jun 2019 21:03:34 -0400
Received: from iank by mail.iankelling.org with local (Exim 4.86_2)
 (envelope-from <iank@fsf.org>) id 1hZ3I5-0002Xf-86
 for qemu-devel@nongnu.org; Thu, 06 Jun 2019 21:03:33 -0400
User-agent: mu4e 1.1.0; emacs 27.0.50
From: Ian Kelling <iank@fsf.org>
To: qemu devel list <qemu-devel@nongnu.org>
Date: Thu, 06 Jun 2019 21:03:33 -0400
Message-ID: <87v9xiuryy.fsf@fsf.org>
MIME-Version: 1.0
Content-Type: text/plain
Subject: [Qemu-devel] lists.nongnu.org was upgraded today,
 one issue is still being worked out
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

I'm Ian Kelling, part of the FSF tech team that maintains the
lists.nongnu.org server.

The server is sending mail using a new ip which is causing a higher than
average number of mail servers telling us to retry and send later as
they hopefully decide we are legitimate. The only big provider doing
this is yahoo, others are small enough that if messages aren't coming as
normal, you should probably be able to get your email server sysadmin to
open the pipe. Yahoo has a long history of being unfriendly to mailing
list messages in various ways, so its not totally unusual. My plan is to
monitor the situation and if it doesn't improve in the next day or so, I
will give the new server its old ip and see if that fixes it.

I specifically wanted to say something on qemu-devel since it is the
most active list.

General information about the upgrade:

There was a ~25 minute downtime while I upgraded the server, but since
email servers naturally just queue and retry, that shouldn't have lost
any messages.

If you want to keep updated on things like that, mainly watch
https://quitter.im/fsfstatus We don't handle all list issues
though. Someone on this list manages the list settings, moderation, list
membership, etc.  Savannah volunteers also help with managing GNU
Mailman. More information is here:
https://savannah.nongnu.org/maintenance/NotSavannahAdmins/

Theres been a lot of small improvements from the upgrade. Some I find
notable are: the web interface is now using tls 1.2. Also, the
configuration and upgrade process is also now well documented and
automated, which helps us to make more improvements and keep the
software up to date. I look forward to eventually integrating new
software, for example a new archive interface while also maintaining and
improving the existing software. When we start looking deeper into new
software, we will definitely seek input here. Of course, input is
welcome anytime.

Thanks.

-- 
Ian Kelling | Senior Systems Administrator, Free Software Foundation
GPG Key: B125 F60B 7B28 7FF6 A2B7  DF8F 170A F0E2 9542 95DF
https://fsf.org | https://gnu.org

