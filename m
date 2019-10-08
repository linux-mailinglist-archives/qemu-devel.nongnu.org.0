Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3DFCFA19
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Oct 2019 14:39:40 +0200 (CEST)
Received: from localhost ([::1]:55146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iHom9-0005Mz-Gl
	for lists+qemu-devel@lfdr.de; Tue, 08 Oct 2019 08:39:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59669)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iHoka-0004Qv-Oy
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 08:38:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iHokZ-0001cK-Mz
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 08:38:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44832)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iHokZ-0001ZH-GM
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 08:37:59 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CE8AF69084
 for <qemu-devel@nongnu.org>; Tue,  8 Oct 2019 12:37:57 +0000 (UTC)
Received: by mail-wm1-f70.google.com with SMTP id z205so1320231wmb.7
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 05:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tjbTVogCbl+ygzXugjXuak3cazxNxJU/R/xsya7Dk9Y=;
 b=LQqqYqwSHE/9VLzXalDAgzuPssUQIGkoCG0v8hq+OsnQKLbO0DU21lvHybc/pRzm5j
 +k/RVz2wnrkfjTHIlV0Z2+JJyJ/Ifo0PzU4DKXhZcDcqAuhqlncS22HZhMIaa3Y+EaJg
 xoPdJKVM0gFMueCdZKTYEcISf4zaseNCoj0rRK3DB2zWDRqqxfb+bzokXRD9SHWNpFUB
 UZfbpvmbhR5MDssl9tD0TCpP0tudnE8PGiQ+jNlkpmPg9loJGahHh7ZAqnao8f+vDmzJ
 KeX3SMILyyWmY/GlvU8zilnvOYtRcwakKKV37b1EN9l8WNPXTqsQXe2fGLCyUQuLOa+B
 VTuQ==
X-Gm-Message-State: APjAAAV5uLqQ6raZ+5Zv6CnZwUDUesmM1o17ZUEtEmjzLfoRFFapGeoD
 8BxA74OFeu1IZ8c0T556x3xX4XvtJyqCiYXCpYw9yrJNNsa/nkNyunpcUiKbzQOCd/WT8T8L+eF
 oZqdL9g92n4jaS3g=
X-Received: by 2002:a1c:2d54:: with SMTP id t81mr3792526wmt.167.1570538276460; 
 Tue, 08 Oct 2019 05:37:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxsXCqHaRo0wFM/RSgQ0o8v/w6LVcNXW+vbugIkiQy4+nTIbwqawzSDR9M/ssghANXD84+vbw==
X-Received: by 2002:a1c:2d54:: with SMTP id t81mr3792500wmt.167.1570538276211; 
 Tue, 08 Oct 2019 05:37:56 -0700 (PDT)
Received: from [192.168.10.150] ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id s9sm3861497wme.36.2019.10.08.05.37.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Oct 2019 05:37:55 -0700 (PDT)
Subject: Re: [PATCH v6 00/10] Introduce the microvm machine type
To: qemu-devel@nongnu.org, slp@redhat.com
References: <157020969258.31166.12339648498600507707@8230166b0665>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <c273fcaf-4e43-b964-b537-d57bfac2738b@redhat.com>
Date: Tue, 8 Oct 2019 14:37:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <157020969258.31166.12339648498600507707@8230166b0665>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: ehabkost@redhat.com, mst@redhat.com, philmd@redhat.com, kraxel@redhat.com,
 imammedo@redhat.com, rth@twiddle.net, lersek@redhat.com, sgarzare@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/10/19 19:21, no-reply@patchew.org wrote:
> qemu-system-x86_64: missing kernel image file name, required by microvm
> Broken pipe
> /tmp/qemu-test/src/tests/libqtest.c:140: kill_qemu() tried to terminate QEMU process but encountered exit status 1 (expected 0)
> ERROR - too few tests run (expected 7, got 4)
> make: *** [check-qtest-x86_64] Error 1
> make: *** Waiting for unfinished jobs....
>   TEST    iotest-qcow2: 159
>   TEST    iotest-qcow2: 161
> ---
>     raise CalledProcessError(retcode, cmd)

I think this needs some kind of blacklisting?

Paolo

