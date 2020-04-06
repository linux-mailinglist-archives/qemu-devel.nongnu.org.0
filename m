Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF03819F98F
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Apr 2020 18:03:22 +0200 (CEST)
Received: from localhost ([::1]:34634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLUDZ-0000Sy-Hd
	for lists+qemu-devel@lfdr.de; Mon, 06 Apr 2020 12:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47493)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jLUBB-0005tz-Kl
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 12:00:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jLUBA-0000XD-2z
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 12:00:52 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41957
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jLUB9-0000Vc-TE
 for qemu-devel@nongnu.org; Mon, 06 Apr 2020 12:00:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586188849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XERd4gAYtuNAd8oPDvMzmpDVIvD/cRSoIstRZ7VReeg=;
 b=iLVDrVK51NiQn+QYI/lWl+EN7lkzBuhVCswO/c8+Nu098Fxx+71Ej6uRKRtdtyMZ1gcKxS
 rPGz3ZJQVfWPpfDUU6I2lYp+6vsOA//nbk4qx4NctvX7yjUA5NLo/ON2eAzPvipmFDIq6n
 Z/IQXjNYzqBAZSDQtWqIWAqnV966ZSY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-rTZ1fCfiPFu6-0Geryr4Zg-1; Mon, 06 Apr 2020 12:00:48 -0400
X-MC-Unique: rTZ1fCfiPFu6-0Geryr4Zg-1
Received: by mail-wm1-f70.google.com with SMTP id s15so19696wmc.0
 for <qemu-devel@nongnu.org>; Mon, 06 Apr 2020 09:00:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XERd4gAYtuNAd8oPDvMzmpDVIvD/cRSoIstRZ7VReeg=;
 b=e8lR/v0LIf7VumKFfGELd4NpdnA3bnfM4TQXMpT5beR1Mhce/O/u5arv1yxMbg+edw
 s7hQgp9PgG/Rg0/43SUXxJ02TTAmv4GqzkoOvLH56XSEFZ2HgJTwzakDUEscu4KHHYPo
 iea5KVhQds/D2dG+NVejHaDSgEyjdq4r3X7jWJ4D77VCKheaXiHtnWnBcG3ZgZdda342
 i8PQDYy4jy0M8bq1jRovJzChRc0nCnZsVGdyCIjI7iSys3sWCLao3j7AHzvGn3hpqQ6a
 nzcZ4E/ons+cxUc4upOI9M3X7DH2+cT58VzyW0DHYz5ALO7uRlJEmsJI7b2AeIlj6uiD
 1L+g==
X-Gm-Message-State: AGi0Pubm6bUxSgQEo4KG+c9f4T9ZqjwzW2YNVXHaKxV/faexMNw/zgpd
 Far/lV50yeVDbpP9doGWJ3SZv8aZ3/j7Q1V5By6X4PPLgeXhotaN97y56yFwEoreJFrLeIi7owX
 q+VO1ycffwL8U6Fo=
X-Received: by 2002:a1c:e904:: with SMTP id q4mr85238wmc.84.1586188847151;
 Mon, 06 Apr 2020 09:00:47 -0700 (PDT)
X-Google-Smtp-Source: APiQypJsJrqEiI/tFb1HLdIASSIEgLoYDB0HpW+e2puuWcvOdLQ48/O7AjvXyu1zBkL1XnPrpZVWiw==
X-Received: by 2002:a1c:e904:: with SMTP id q4mr85214wmc.84.1586188846891;
 Mon, 06 Apr 2020 09:00:46 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:98c9:e86f:5fe7:54a5?
 ([2001:b07:6468:f312:98c9:e86f:5fe7:54a5])
 by smtp.gmail.com with ESMTPSA id q14sm25299892wrx.57.2020.04.06.09.00.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Apr 2020 09:00:46 -0700 (PDT)
Subject: Re: [PATCH v4] piix: fix xenfv regression, add compat machine
 xenfv-qemu4
To: Olaf Hering <olaf@aepfle.de>
References: <20200113174521.3336-1-olaf@aepfle.de>
 <20200327151841.13877-1-olaf@aepfle.de>
 <90544ada-060e-169b-c0cb-94d869070d97@redhat.com>
 <20200328070906.GA7942@aepfle.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5da3f7f5-02f7-d338-06f4-1a14caab4254@redhat.com>
Date: Mon, 6 Apr 2020 18:00:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200328070906.GA7942@aepfle.de>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Richard Henderson <rth@twiddle.net>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/03/20 08:09, Olaf Hering wrote:
> On Fri, Mar 27, Paolo Bonzini wrote:
> 
>> Looks good, I would just do the following adjustments to have more
>> consistency between pc and xenfv machine types
> 
> Do you want me to resend with this change?

Had you tested this patch?  It fails qom-test, test-qmp and test-hmp
because xenfv-qemu4 is not blacklisted.  Anyway I fixed it up and will
include it in my next pull request.

Paolo


