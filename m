Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3100315BF4D
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Feb 2020 14:27:30 +0100 (CET)
Received: from localhost ([::1]:52302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2EWf-0004zZ-A9
	for lists+qemu-devel@lfdr.de; Thu, 13 Feb 2020 08:27:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47497)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <johannes@sipsolutions.net>) id 1j2EVZ-00049D-MQ
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 08:26:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <johannes@sipsolutions.net>) id 1j2EVV-0002Lg-Mt
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 08:26:21 -0500
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]:52526
 helo=sipsolutions.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <johannes@sipsolutions.net>)
 id 1j2EVV-0002Hh-Gf
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 08:26:17 -0500
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.93) (envelope-from <johannes@sipsolutions.net>)
 id 1j2EVR-008mSP-8U; Thu, 13 Feb 2020 14:26:13 +0100
Message-ID: <16ac7144ac33d52a740e227e9290a1eb41596e09.camel@sipsolutions.net>
Subject: Re: [PATCH v5 0/6] small vhost changes and in-band notifications
From: Johannes Berg <johannes@sipsolutions.net>
To: qemu-devel@nongnu.org
Date: Thu, 13 Feb 2020 14:26:10 +0100
In-Reply-To: <20200123081708.7817-1-johannes@sipsolutions.net>
References: <20200123081708.7817-1-johannes@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.2 (3.34.2-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:191:4433::2
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
Cc: mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2020-01-23 at 09:17 +0100, Johannes Berg wrote:
> Hi,
> 
> Here's a repost of all the patches I sent back in August, with the
> in-band notifications rebased over the reset patch, so IDs have now
> changed a bit.

Ping?

The patches still apply on top of latest qemu.

I wanted to send some corresponding kernel patches, but without the
protocol nailed down ...

johannes


