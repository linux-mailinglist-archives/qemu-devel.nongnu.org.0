Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F031A86045
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Aug 2019 12:42:46 +0200 (CEST)
Received: from localhost ([::1]:48234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hvfsc-00070t-7r
	for lists+qemu-devel@lfdr.de; Thu, 08 Aug 2019 06:42:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36146)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hvfs9-0006b4-86
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 06:42:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hvfs8-0001NT-Bq
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 06:42:17 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36397)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hvfs8-0001N4-5l
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 06:42:16 -0400
Received: by mail-wm1-f66.google.com with SMTP id g67so1917730wme.1
 for <qemu-devel@nongnu.org>; Thu, 08 Aug 2019 03:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NmJ3eps5Ts1N2alhuQJtr/+FRRwMkXlVVq5DbYD7hSY=;
 b=Ilge5fYn1bwRmVRmwTOOl4D/DiEL7+DZ5yuMujGzB6HFhX39JpnZw4YiAA4Utkd2ap
 0E5dav3Rface4MdVPYuTrU3EmVq+hKOYLvZkccWhgcYCq1NyOHZBGyR3ie+cHp2iNHkb
 GQML4QjTgHBvXrHwF3mZXe+NhQeuGJteC7UNIllTQsnY0OYt2vjU6cqmRVrziFzQ9rmR
 OCkiBa0xyVh+eOVs+dzLSDT0NdFxtePfSkpKB6dtYN2gl9JoOBQv+ce7p8jVKi1UoKiG
 EYdSAfniestmJx8H8nPVAhfsVwV/Hg1bWrxvNgo8nkzBkiUQh3bbpCy4TP73b5zhs2tC
 2PWA==
X-Gm-Message-State: APjAAAVLqGgiM1+qMEMTRKKVrf/HZm3qw5ht3wGXxVPXjKK5jgUDRy3M
 nA2rzfn54OaR2aYsZkCaVrM7ZQ==
X-Google-Smtp-Source: APXvYqxcFy09JTRYMuL0X1K5KZS5LK5wAyPoKw1CC4HvHClMXXMfo8PiNCTuobe/sjrA2gKFqf/z8Q==
X-Received: by 2002:a7b:c928:: with SMTP id h8mr3738781wml.93.1565260934931;
 Thu, 08 Aug 2019 03:42:14 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:b42d:b492:69df:ed61?
 ([2001:b07:6468:f312:b42d:b492:69df:ed61])
 by smtp.gmail.com with ESMTPSA id v12sm80338516wrr.87.2019.08.08.03.42.13
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 03:42:14 -0700 (PDT)
To: P J P <ppandit@redhat.com>
References: <20190808063340.23833-1-ppandit@redhat.com>
 <aa654255-8124-8a76-56c8-47c8bdf19a08@redhat.com>
 <nycvar.YSQ.7.76.1908081510580.30966@xnncv>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <f9fa36c5-0ee0-d2d2-c8e4-95c887b9b647@redhat.com>
Date: Thu, 8 Aug 2019 12:42:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <nycvar.YSQ.7.76.1908081510580.30966@xnncv>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.66
Subject: Re: [Qemu-devel] [PATCH] scsi: lsi: exit infinite loop while
 executing script (CVE-2019-12068)
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
Cc: Fam Zheng <fam@euphon.net>, Bugs SysSec <bugs-syssec@rub.de>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/08/19 11:48, P J P wrote:
> +-- On Thu, 8 Aug 2019, Paolo Bonzini wrote --+
> | I am not sure this is worth a CVE. 
> 
> True, it is a low one, as QEMU consumes cycles on the host.

A guest that runs an infinite loop would be an easier way to do that.  I
suppose this one also blocks the monitor, but then "kill -9" is always
your friend. :)

Paolo

> | The kernel can cause QEMU to break, but is there a practical case in which 
> | an unprivileged user can do that?
> 
> QEMU does not break, it keeps running in interruptible sleep 'S' state. 
> They've a reproducer wherein guest does mmio calls to trigger the issue.


