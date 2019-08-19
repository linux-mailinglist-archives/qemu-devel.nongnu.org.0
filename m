Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6799243F
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 15:06:36 +0200 (CEST)
Received: from localhost ([::1]:50050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzhMp-0002Hu-RD
	for lists+qemu-devel@lfdr.de; Mon, 19 Aug 2019 09:06:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42937)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <clement.deschamps@greensocs.com>) id 1hzh1n-0005bn-AS
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:44:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <clement.deschamps@greensocs.com>) id 1hzh1l-0003nX-Vr
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:44:51 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:35570)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <clement.deschamps@greensocs.com>)
 id 1hzh1l-0003mB-Hb
 for qemu-devel@nongnu.org; Mon, 19 Aug 2019 08:44:49 -0400
Received: from [172.16.11.122] (unknown [172.16.11.122])
 by beetle.greensocs.com (Postfix) with ESMTPSA id BF7D596F50;
 Mon, 19 Aug 2019 12:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1566218686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tB7ZV+oS88VEZwlHZcTvLx/rgT8keqR7JTFuF6olx7Y=;
 b=NzRgqqjoJ8iq56VR6acLcKfK5asF9n+ZVt2cwdxHUhy2W8QxK899lygfuq/9KjaVhmkjzO
 D2WcDhJuJCcVBZB32lnn5ZrIAXzXpqS2tm11ov/gRSMlVdj1/P6BnHDaQHQkO2fCJBo/0M
 g9Z8AvGYnU+OuAHcgmHHG9OmebYvs+U=
To: Bug 1772165 <1772165@bugs.launchpad.net>
References: <152673688616.9061.7617411809661975686.malonedeb@chaenomeles.canonical.com>
 <156620618154.26323.6701574989955080460.malone@soybean.canonical.com>
From: Clement Deschamps <clement.deschamps@greensocs.com>
Message-ID: <b7ce8c40-5145-0b58-304d-898900ebf285@greensocs.com>
Date: Mon, 19 Aug 2019 14:44:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156620618154.26323.6701574989955080460.malone@soybean.canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1566218686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tB7ZV+oS88VEZwlHZcTvLx/rgT8keqR7JTFuF6olx7Y=;
 b=BzWT0Cd6eOuJro4zzWwXaIBX+eIRqJdRWAFJiJDUDyXAuaINqX6S3iqOuaRdNhNECCvsh5
 7N+2Wp84MaWmqSt6HPXK8U2E1B8bDNkVEAWKqBjCgHMPz/zjI+IB0CP5XWiY96AD19YwrK
 tCl+0e38L3aGw88OOHZgZePVNQGEI1U=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1566218686; a=rsa-sha256; cv=none;
 b=L7hdu0/ri/LSAcLHDrx4FU9uQS4U2HbzJzzA0W84RGYgBH3hi4RRbeGUkMOCOAV7Z/C6P4
 muVoWwi0lHGAKjPuQDX+CuyvUgbuT9G022p2ObU1m5Xx8Nr/EbdzOpGmALfrnjXatNEf5o
 /5erOnS/aDiiKanwkTc5GbB9W4vzhrU=
ARC-Authentication-Results: i=1; ORIGINATING;
 auth=pass smtp.auth=clement smtp.mailfrom=clement.deschamps@greensocs.com
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: Re: [Qemu-devel] [Bug 1772165] Re: arm raspi2/raspi3 emulation has
 no USB support
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It looks like the same USB controller is part of a TI SoC:

http://www.ti.com/lit/ug/spruhj7a/spruhj7a.pdf


Clement

On 8/19/19 11:16 AM, Peter Maydell wrote:
> Thanks for digging those up. Unfortunately just the driver sources
> aren't really enough information for a good device model, and the other
> docs are just overviews without the level of detail we need.
> 

