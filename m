Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5F4AE061
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Sep 2019 23:46:39 +0200 (CEST)
Received: from localhost ([::1]:60916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7RUb-00088S-R4
	for lists+qemu-devel@lfdr.de; Mon, 09 Sep 2019 17:46:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43742)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <hpoussin@reactos.org>) id 1i7RQO-0005mR-A4
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 17:42:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <hpoussin@reactos.org>) id 1i7RQN-0006vp-Ej
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 17:42:16 -0400
Received: from iserv.reactos.org ([2a01:4f8:1c17:5ae1::1]:37910)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <hpoussin@reactos.org>)
 id 1i7RQN-0006vQ-8U
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 17:42:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=reactos.org
 ; s=25047;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
 Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=60cEp3RzBseAuzqZywDGq86keWFicZQAhXpZOsUFdVk=; b=ZDA8N1Ifh9Ygvib7FKklD+Xsnt
 g7iRTZcxadyPKfNb9qnWaDmHJBwhvOKmqzE3zpqHd+ZuPQaTa5xmDknwjW2oSBWz5xxjnG5IEgJ/e
 RCe3U6EnCKrDWtINZjsvqrnMcBYFQRbP+h8xjxHWDmboeFS4JZqx/+IB37spNRorxoPU=;
Received: from [2a01:e35:2e3e:3c40:45c0:4a4a:dd24:5f79]
 by iserv.reactos.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <hpoussin@reactos.org>)
 id 1i7RQI-0001Yi-Eb; Mon, 09 Sep 2019 21:42:12 +0000
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20190802160458.25681-1-peter.maydell@linaro.org>
 <20190802160458.25681-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
Message-ID: <cd9cabb4-3760-9798-1320-f0a8c371eb0b@reactos.org>
Date: Mon, 9 Sep 2019 23:42:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802160458.25681-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:1c17:5ae1::1
Subject: Re: [Qemu-devel] [PATCH 3/3] hw/mips/mips_jazz: Remove
 no-longer-necessary override of do_unassigned_access
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
Cc: Aleksandar Rikalo <arikalo@wavecomp.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 02/08/2019 à 18:04, Peter Maydell a écrit :
> Now that the MIPS CPU implementation uses the new
> do_transaction_failed hook, we can remove the old code that handled
> the do_unassigned_access hook.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/mips/mips_jazz.c | 27 ++++-----------------------
>   1 file changed, 4 insertions(+), 23 deletions(-)

Tested-by: Hervé Poussineau <hpoussin@reactos.org>


