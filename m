Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1D41BA4E4
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Apr 2020 15:41:01 +0200 (CEST)
Received: from localhost ([::1]:45954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jT40J-0000G2-Q7
	for lists+qemu-devel@lfdr.de; Mon, 27 Apr 2020 09:40:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47046)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jT3zD-0007xQ-0C
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 09:39:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jT3zB-0007bG-U6
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 09:39:50 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46927
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jT3zB-0007VG-Gq
 for qemu-devel@nongnu.org; Mon, 27 Apr 2020 09:39:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587994787;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JO+J5uEjf57UaQTqFMGLyeM6q+KhJyhCRRYpsGhbCGw=;
 b=iOT5jPmDbHTmCJFsf8dd8oL7dpKz4cAwZjPDjlwJoepNuKbbQ53o5gGfLQ2kHJLzwQXoa1
 4ABfOPYrcxYB0L0SpMpocXPMpxvq4Ea/QZImID1xPgSLX1H1Dx0yHfHZ9BKU3RwcmBzLbo
 PjERmr7GTpAbkaIRRsRPSfvvCUeDJP0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-XHDPR_ZBN2KGyfIk7A-Fhw-1; Mon, 27 Apr 2020 09:39:44 -0400
X-MC-Unique: XHDPR_ZBN2KGyfIk7A-Fhw-1
Received: by mail-wr1-f72.google.com with SMTP id 11so10535764wrc.3
 for <qemu-devel@nongnu.org>; Mon, 27 Apr 2020 06:39:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JO+J5uEjf57UaQTqFMGLyeM6q+KhJyhCRRYpsGhbCGw=;
 b=q4NZ4hKFn6cnFfap5qJQHtH0qxOgYPCbmFlZx/a0+3svq5G3ASQjxHkVY0Hy20s1VP
 6V905U1j0Hz3L3N2CUpw14ihX63I6KQ7FPqpHgtNSUzcd7Lg/USmr6E3VXLtMrN5m8lt
 /Ps4gHPnp1qi//9OZs6rSUwX2+/sSe9bHTbe/W4aCbYhvSSU+kUs0u8r0EbLBwUl7uxh
 NVi6Pf5V6IEULcT07tdfe1iqwTBBlxjssiHLbO9/uzZ7pJ7NEE2nSeEjzHfkB6mKiozK
 FkEAM3BPrvOBGgj+p6r5Emc0RFucGatJLQPS/tfxGIppxc5fNPAhFFRza61qaPmkECYE
 3tog==
X-Gm-Message-State: AGi0Pualr0kLDrAKc7iULONIvNym++A7OzXM/zOTOusnRJO0mDx0n2VE
 lI6oRpWzPSiTykGfeeD9dseDo3JL63qpARmfT+nQGmKZsuwP1OJ+6VwEFd3JZzcMlinqgZVHf8f
 KSzyocTqOXgTDcQ0=
X-Received: by 2002:a5d:6acc:: with SMTP id u12mr29646365wrw.198.1587994782992; 
 Mon, 27 Apr 2020 06:39:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypJNu4Ci21z8a5gkYOmlC8nFbHT0Q/TvIM9jnnvhSiAJ5NS6DwngcD5chW+Tjk/M4wDks0DpWw==
X-Received: by 2002:a5d:6acc:: with SMTP id u12mr29646346wrw.198.1587994782782; 
 Mon, 27 Apr 2020 06:39:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:ac19:d1fb:3f5f:d54f?
 ([2001:b07:6468:f312:ac19:d1fb:3f5f:d54f])
 by smtp.gmail.com with ESMTPSA id p6sm21028274wrt.3.2020.04.27.06.39.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Apr 2020 06:39:42 -0700 (PDT)
Subject: Re: [PATCH 4/8] run-coverity-scan: use docker.py
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200422172351.26583-1-pbonzini@redhat.com>
 <20200422172351.26583-5-pbonzini@redhat.com>
 <CAFEAcA_xMOJtDMJYbv+MzQYVeN0T5+q9WRcpjshkTGBrdH1Sfg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <eae1e876-39cc-4b5d-eb93-1e24321a1fa5@redhat.com>
Date: Mon, 27 Apr 2020 15:38:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_xMOJtDMJYbv+MzQYVeN0T5+q9WRcpjshkTGBrdH1Sfg@mail.gmail.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/26 23:33:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 27/04/20 14:42, Peter Maydell wrote:
> The comment at the top of the file documenting the command line
> options needs updating.
> 
> We don't accept --foo=bar for anything else: options either take
> no argument, or take an argument as a following (ie space separated)
> parameter. It would be more consistent with that to have
> "--docker-engine foo" as a separate option from "--docker".

Sure.

Paolo


