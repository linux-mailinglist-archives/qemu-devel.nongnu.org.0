Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDC852902
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jun 2019 12:06:55 +0200 (CEST)
Received: from localhost ([::1]:58254 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfiLm-0007SO-Eu
	for lists+qemu-devel@lfdr.de; Tue, 25 Jun 2019 06:06:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58407)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kbastian@mail.uni-paderborn.de>) id 1hfiGK-0004PF-Sm
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 06:01:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kbastian@mail.uni-paderborn.de>) id 1hfiGG-0000bs-QS
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 06:01:14 -0400
Received: from telepax.uni-paderborn.de ([131.234.189.14]:56576)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1hfiGC-0000NB-Se
 for qemu-devel@nongnu.org; Tue, 25 Jun 2019 06:01:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KmyxiAjadGekmOj3zZzbypkz7ZXT/QrWyxcd1C5JsWk=; b=M52xewo1f+te7XmqhxVaL2GPCO
 Lko3Mh5K9ulMjouHy1e17RQXTCYSbLbB4On24SI0zHkz9kHsjokmRn5kRCvDmH6SddMm+tIhUebIs
 uB0zxanZU/xnMWlMLYz9olVaNyfZah/qEkt/jFRPGZRDSSmU3/kHcgIf4UWuSi1HXejQ=;
To: David Brenken <david.brenken@efs-auto.org>, qemu-devel@nongnu.org
References: <20190624070339.4408-1-david.brenken@efs-auto.org>
 <20190624070339.4408-5-david.brenken@efs-auto.org>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <5ab305b9-a527-f91c-38b0-12167d63a0da@mail.uni-paderborn.de>
Date: Tue, 25 Jun 2019 12:00:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190624070339.4408-5-david.brenken@efs-auto.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2019.6.25.95716, AntiVirus-Engine: 5.63.0,
 AntiVirus-Data: 2019.6.18.5630002
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 131.234.189.14
Subject: Re: [Qemu-devel] [PATCH v3 4/5] tricore: sync ctx.hflags with
 tb->flags
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
Cc: Andreas Konopik <andreas.konopik@efs-auto.de>,
 David Brenken <david.brenken@efs-auto.de>,
 Robert Rasche <robert.rasche@efs-auto.de>,
 Georg Hofstetter <georg.hofstetter@efs-auto.de>,
 Lars Biermanski <lars.biermanski@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/24/19 9:03 AM, David Brenken wrote:
> From: Georg Hofstetter <georg.hofstetter@efs-auto.de>
>
> Signed-off-by: Andreas Konopik <andreas.konopik@efs-auto.de>
> Signed-off-by: David Brenken <david.brenken@efs-auto.de>
> Signed-off-by: Georg Hofstetter <georg.hofstetter@efs-auto.de>
> Signed-off-by: Robert Rasche <robert.rasche@efs-auto.de>
> Signed-off-by: Lars Biermanski <lars.biermanski@efs-auto.de>
> ---
>   target/tricore/translate.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,

Bastian



