Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D974AABFF8
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 20:57:46 +0200 (CEST)
Received: from localhost ([::1]:59362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6JQX-0001d3-V7
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 14:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38720)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <extsmtp@sr.ht>) id 1i6JP2-0000cr-OL
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 14:56:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <extsmtp@sr.ht>) id 1i6JP1-0000OP-Pf
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 14:56:12 -0400
Received: from mail.sr.ht ([173.195.146.137]:52890)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <extsmtp@sr.ht>) id 1i6JP1-0000OC-M4
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 14:56:11 -0400
Received: from lists.my.domain (unknown [173.195.146.144])
 by mail.sr.ht (Postfix) with ESMTPSA id 26FF2400B2
 for <qemu-devel@nongnu.org>; Fri,  6 Sep 2019 18:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lists.sr.ht; s=srht;
 t=1567796171; bh=mxEbhZU1+qSGknyPGIoh5POTHchOtvpCHYUZlJlhwdU=;
 h=To:From:In-Reply-To:Subject:Reply-To:Date;
 b=JznFEmT3ox+q0gXBk0Pc4d2MytPXFwfMz6A/B/0FPzqdY1WaRn0WyIEDdcP5Rtwhn
 5Bdo2QGITa41LTgpSJQIz3qKYlULBi5sq8vnffPH0XEmlHexlPMVzQlJt59iu/ofVn
 evc0clHT0PMk5CpKiQzP4vOwCNArm0v6Ljw9HfM677ewWlgjV8p9JN6JjvCxVWxARa
 58tIpJ0yWcEkt9NNINzOO3scl0XcwM7XrIBPREbDqGcheU6SPAdGbnBN0SGoOJ3z4A
 j9Lorh8OXKmRffgddUKB3LEx+y2j0D2qKMlZK2gsiatohpJSx1NnUYx2U0cYPOsn9h
 d6CICDq1IUmFg==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
To: Shu-Chun Weng via Qemu-devel <qemu-devel@nongnu.org>
From: mailer@lists.sr.ht
In-Reply-To: <CAF3nBxgqTKYGJDpPZ50bzJwk+sjCed2dudsGtLLPA_Eh4P=sFA@mail.gmail.com>
Auto-Submitted: auto-replied
Date: Fri, 06 Sep 2019 18:56:11 -0000
Message-ID: <156779617102.17741.4657362127599662572@lists.my.domain>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 173.195.146.137
Subject: Re: [Qemu-devel] [PATCH 0/2] Adding some setsockopt() options
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
Reply-To: Drew DeVault <sir@cmpwn.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Shu-Chun Weng via Qemu-devel!

We received your email, but were unable to deliver it because it
contains content which has been blacklisted by the list admin. Please
remove your application/pkcs7-signature attachments and send again.

You are also advised to configure your email client to send emails in
plain text to avoid additional errors in the future:

https://useplaintext.email

If you have any questions, please reply to this email to reach the mail
admin. We apologise for the inconvenience.

