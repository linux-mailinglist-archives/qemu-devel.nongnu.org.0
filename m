Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A38D925D4A0
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Sep 2020 11:21:33 +0200 (CEST)
Received: from localhost ([::1]:46188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kE7uT-0008Sc-JO
	for lists+qemu-devel@lfdr.de; Fri, 04 Sep 2020 05:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kE7tE-0007k3-5T
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 05:20:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51487
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kE7t8-0003fQ-IV
 for qemu-devel@nongnu.org; Fri, 04 Sep 2020 05:20:11 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-iaanW2pgN06c3ibouyixSg-1; Fri, 04 Sep 2020 05:20:03 -0400
X-MC-Unique: iaanW2pgN06c3ibouyixSg-1
Received: by mail-wr1-f71.google.com with SMTP id 33so2103954wrk.12
 for <qemu-devel@nongnu.org>; Fri, 04 Sep 2020 02:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=OQKXr4NRe5CAXe30FkKOb7cYcKuHnHotWjK/lXmh21M=;
 b=uCB9TWEdIsYRAWGUSdwpYwZ69EdenwGphiU9HufvrOXf7q/L2GepBKT7pBwht4lxYP
 VtnTBybgrQM2QEiXSnFroM/B4hH0vpWrprWruecdWPbHdD2Jzrjy8gOeAM/0Twopl5RL
 vsP3hlXTQI5V2Ig2J1YL+Qr4UPeds5lJg3FzQDLS5SdIG6u4tbT2eQRftSDJo7l5WqTy
 bFBTOSYyR5a4PhcZ7c2QuD2A44D3YCJk1ZeDXqIaOq/e5YuKbnltJmoIEl7Wak4PgXWX
 OqqhOn4cMlhlZYGweyJQO0+dV91mOo47qt6qWxV9d1EIbDFoF6YUIoZjbFYaEQbs/TU0
 6e5Q==
X-Gm-Message-State: AOAM531wNCCbkWgF/3sb6XwYbdmockKKGOvEFGwOlOq+ilYyGPTORgDq
 mFb14DhhluRMNGynectuHgrHzjNd8yhdcWjD/Wf61jpqAyTTAqskZXjX9074kQzJmgC3WDnZLiz
 iKGaB9X6w0MBm7XM=
X-Received: by 2002:adf:d845:: with SMTP id k5mr6180691wrl.285.1599211202773; 
 Fri, 04 Sep 2020 02:20:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoXkl5TT6uz86coVyfHU0/tOwHZlR/Y8UJQGtt6i8s42OEWTi5m//xYgjcIk/KRs6SuaBNxQ==
X-Received: by 2002:adf:d845:: with SMTP id k5mr6180669wrl.285.1599211202526; 
 Fri, 04 Sep 2020 02:20:02 -0700 (PDT)
Received: from [192.168.1.36] (50.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.50])
 by smtp.gmail.com with ESMTPSA id u126sm13152880wmu.9.2020.09.04.02.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Sep 2020 02:20:01 -0700 (PDT)
Subject: Re: [PATCH 00/77] Patch Round-up for stable 5.0.1, freeze on
 2020-09-10
To: Michael Roth <mdroth@linux.vnet.ibm.com>, qemu-devel@nongnu.org
References: <20200903205935.27832-1-mdroth@linux.vnet.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <70866614-8053-4a87-b3a6-c7448dcff56f@redhat.com>
Date: Fri, 4 Sep 2020 11:20:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200903205935.27832-1-mdroth@linux.vnet.ibm.com>
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/04 03:58:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.403,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/3/20 10:58 PM, Michael Roth wrote:
> Hi everyone,
> 
> The following new patches are queued for QEMU stable v5.0.1:
> 
>   https://github.com/mdroth/qemu/commits/stable-5.0-staging
> 
> Patch freeze is 2020-09-10, and the release is planned for 2020-09-15:
> 
>   https://wiki.qemu.org/Planning/5.0
> 
> Please respond here or CC qemu-stable@nongnu.org on any additional patches
> you think should be included in the release.

Candidates:

b638627c723 ("hw/sd: Fix incorrect populated function switch status data
structure")
6d2d4069c47 ("hw/sd: Correct the maximum size of a Standard Capacity SD
Memory Card")

And maybe "memory: assert and define MemoryRegionOps callbacks"
https://www.mail-archive.com/qemu-devel@nongnu.org/msg729048.html

> 
> Thanks!


