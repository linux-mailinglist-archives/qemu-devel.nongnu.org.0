Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127421327B6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 14:33:01 +0100 (CET)
Received: from localhost ([::1]:48728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iooyg-0001JL-M9
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 08:32:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46626)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <danielhb413@gmail.com>) id 1ionPG-0001na-Me
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:52:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1ionPF-0006gQ-KY
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 06:52:18 -0500
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:35030)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1ionPF-0006gC-FS; Tue, 07 Jan 2020 06:52:17 -0500
Received: by mail-qk1-x744.google.com with SMTP id z76so42709852qka.2;
 Tue, 07 Jan 2020 03:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yzn1zCoB14WPeQ2paa+Cw7nFAH9Sc6jZWCqBHO4evGE=;
 b=qau63yJ365iTsHGe3ZCAmC4WREW4dI8TFrmWonBNTFRMpLEtrdkAZ929FJ8Tu1bNT7
 o308iOuXEfi3RrGFnPRWX4LKOyDb4w3GKnxTn5DxDFlN5NVWakiV2lTH9uu6xiz0wfc1
 abDs3uEKeiYGGNMO5pxMi3V2De/f754qf7kMk1wNeY/Fln9W/m3Hq731eIYeXi54rwH+
 FweLopsahEWeWG3WyLROBofLjdRrHXe8yGsTQoQDkBlJ/T9u84Drb98IAHL4ukBvLppj
 DRzzldUiWz/CZF3CZHYvuTu8Nj0PuH863qqbGetbY7mglma/uUbWvEuT/7LpcSnqXjT3
 HbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yzn1zCoB14WPeQ2paa+Cw7nFAH9Sc6jZWCqBHO4evGE=;
 b=C04Xt3sAoSoitDrY0IJa3b3NKLnYhg0HRBHw/bVhXcG6CqTudZ/EVGyGLXDA7HLsmZ
 T+eKqmodIQqlG8LRZci/3YRQi/i4U8TR9aEi8ivMnTKLqKkEi8MS4EH5UOrbvpGxFMu/
 jDaIzxuVcIB/17DxdG8UvaO/3cWAQHu7zJq30J/uKyf2p31SLKIICZd9vpDCHyiEY4U2
 m8aMiDytqrOD3rN7Z2CqkqoI9zEYu6aDaVx0ifJ/HCXmmJV8tYCWu9LWJiUhOb8Y4B/6
 tYWchw8H0EpbooR6RKW296RbInVn6TWqyn3qCcSPhziwB64Fhpl4jU8v6dg8gI+IZj5E
 3yGw==
X-Gm-Message-State: APjAAAUNhvRuX414c6ImDWhFVq0S6aRK710O1yXTbO0ijrHFv6+nbWsX
 gC2KXWhrxsPNJcNkvkt65nw=
X-Google-Smtp-Source: APXvYqwPkOrdGp9vtMc/cVXcJbbR0o5mGx4bus7kUXqPbwdxYsVZ6STbTc+qmgFyY3A+SMOeVIFaVA==
X-Received: by 2002:a37:b601:: with SMTP id g1mr85298916qkf.114.1578397937025; 
 Tue, 07 Jan 2020 03:52:17 -0800 (PST)
Received: from ?IPv6:2804:431:c7c6:655b:9e1c:e865:3705:e1df?
 ([2804:431:c7c6:655b:9e1c:e865:3705:e1df])
 by smtp.gmail.com with ESMTPSA id h6sm20244570qtr.33.2020.01.07.03.52.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 03:52:16 -0800 (PST)
Subject: Re: [PATCH v1 00/59] trivial unneeded labels cleanup
To: Kevin Wolf <kwolf@redhat.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
 <20200106195457.GE2886@minyard.net>
 <f71eb524-571b-54d1-1a99-95d2896f6586@gmail.com>
 <20200107061613.GB4076@linux.fritz.box>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <ccd70c1c-790a-bdc6-0f85-379777125892@gmail.com>
Date: Tue, 7 Jan 2020 08:52:12 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200107061613.GB4076@linux.fritz.box>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, minyard@acm.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/7/20 3:16 AM, Kevin Wolf wrote:
> Am 06.01.2020 um 21:35 hat Daniel Henrique Barboza geschrieben:
>>

[...]

> 
> So what is your plan for getting the series merged? Should maintainers
> just picks patches from the series, or do you want to collect Acked-by
> tags and then merge it through a single tree? If the latter, which one?

The idea I had in mind was for each maintainer to pick up the patches and push
through their own trees, like David did in patches 1 and 2.

 From qemu-trivial archives I notice that Laurent creates qemu-trivial pull
requests often, thus I believe this might also be an option. If we decide
to go this route I'll ask David to remove patches 1 and 2 from his ppc
tree to avoid unnecessary conflicts.



Thanks,


DHB


> 
> Kevin
> 

