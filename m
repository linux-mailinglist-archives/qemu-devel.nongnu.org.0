Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5051EDD84
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Jun 2020 08:49:00 +0200 (CEST)
Received: from localhost ([::1]:51164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jgjgR-0007oP-By
	for lists+qemu-devel@lfdr.de; Thu, 04 Jun 2020 02:48:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jgjax-0006jq-6O
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 02:43:19 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58077
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jgjaw-0000sy-FC
 for qemu-devel@nongnu.org; Thu, 04 Jun 2020 02:43:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591252997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Fu5Z22JNr0arvF0Jnc15EKD2Dcyqv9eLQ+QCmobbp64=;
 b=XFCQrMJVfL7G1K/4QqfzIDDilY3IFdsa9kVIvRgXIkZ724zweP+deuEweVPC/GRnlmk401
 tjMj94j50BY975okrvK4doVoAe6/Cvh/Zk06uCJRWYhn5/WxJaEPG9msH4afrgloPXcj2l
 xNwAOZVBa7NHGXNEByemQlGetNPw8Ng=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-279-zXQ0jx7zPiSIooiHzOK6ng-1; Thu, 04 Jun 2020 02:43:07 -0400
X-MC-Unique: zXQ0jx7zPiSIooiHzOK6ng-1
Received: by mail-wr1-f70.google.com with SMTP id j16so1986239wre.22
 for <qemu-devel@nongnu.org>; Wed, 03 Jun 2020 23:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Fu5Z22JNr0arvF0Jnc15EKD2Dcyqv9eLQ+QCmobbp64=;
 b=plzK8mTf8QZybJ5ag0QJu1w3+jwqopx1EQydW0xiufxxQs35Ve7FPBtzzkMOOsUWbx
 LPJISnnnRfWaso8khjIlU++7Ju2SHO0JfOBrE85Naxx4ymO+sT85cmbSGSPdPHESxGI9
 mfVek8pQIhZWkNWZeEpBiV44OprVQ/6RIy44CDI7/mJr69/TSWQ2/WgNL/3WOX7w1eoc
 R+eToSouTEDkDRNMl/YONPu2X1dCZxyddKIQ3cObYW33K5w26h7pDPXbymnBDOJ9+RGa
 2/vsKfZeU9nV5jolcLt4ijllQmZRZdwQ3oGJDf8l5CIZ4vrEW1RvCv5M/Dy4d2/nTtcm
 EjMw==
X-Gm-Message-State: AOAM532qwwgSfyFtl6bUE1MdfDEDHw+ngilPJLlu3N/dM2EisEKjeiBZ
 QeIJGfAPBgEQmTCqyMHZft6KBiTlLdi3FZYTTAMH+zybNqMjky7mG/3iFwSHzjXwrkyCYiry4RM
 u1Dz97XMbUq4LzyQ=
X-Received: by 2002:adf:f8cc:: with SMTP id f12mr2794321wrq.418.1591252986767; 
 Wed, 03 Jun 2020 23:43:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztETPgqkV0S6uMArCcxfY8sKzCdVL2kTq4EQH+IpLCOgpc33PQRSkOsbNTuoeVeITBPgpffA==
X-Received: by 2002:adf:f8cc:: with SMTP id f12mr2794300wrq.418.1591252986579; 
 Wed, 03 Jun 2020 23:43:06 -0700 (PDT)
Received: from [192.168.1.43] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id h5sm6558688wrw.85.2020.06.03.23.43.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jun 2020 23:43:06 -0700 (PDT)
Subject: Re: [PATCH 11/13] i386: hvf: Move lazy_flags into CPUX86State
To: Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org
References: <20200528193758.51454-1-r.bolshakov@yadro.com>
 <20200528193758.51454-12-r.bolshakov@yadro.com>
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
Message-ID: <c935970a-35af-9921-7d03-c17c373ad238@redhat.com>
Date: Thu, 4 Jun 2020 08:43:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200528193758.51454-12-r.bolshakov@yadro.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/04 01:14:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/28/20 9:37 PM, Roman Bolshakov wrote:
> The lazy flags are still needed for instruction decoder.
> 
> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
> ---
>  include/sysemu/hvf.h        |  7 +++++
>  target/i386/cpu.h           |  2 ++
>  target/i386/hvf/x86.h       |  6 ----
>  target/i386/hvf/x86_flags.c | 57 ++++++++++++++++++-------------------
>  4 files changed, 37 insertions(+), 35 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


