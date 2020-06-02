Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 254D21EB6A5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jun 2020 09:41:19 +0200 (CEST)
Received: from localhost ([::1]:49628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jg1Xx-0003ED-Uq
	for lists+qemu-devel@lfdr.de; Tue, 02 Jun 2020 03:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jg1XE-0002m5-Km
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 03:40:32 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:46834
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jg1XD-0000DU-Br
 for qemu-devel@nongnu.org; Tue, 02 Jun 2020 03:40:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591083629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=t1sHc5N4kkjVCvuYrc1rVo7PMl8TCHpQz64jsWBuGTE=;
 b=YZpNjn5cLCzbukwQSS3PC6whgNupz/YrZaBLFLzSBVoR+SWMPq1ayf5lAtj/qHGIkfkt+F
 kwClsjbUZCh51KYQ+CzZN4OS5Ft1z86wl3BXAOzan5ASGJMY1JrHicgw9l+aiJtGLnPRfp
 cnTVgw/zuioHX4Kf/sZ6lolEUQ5Slmc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-oAGyvCNzO_aijUuA7iJgnQ-1; Tue, 02 Jun 2020 03:40:27 -0400
X-MC-Unique: oAGyvCNzO_aijUuA7iJgnQ-1
Received: by mail-wm1-f70.google.com with SMTP id k185so494078wme.8
 for <qemu-devel@nongnu.org>; Tue, 02 Jun 2020 00:40:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=t1sHc5N4kkjVCvuYrc1rVo7PMl8TCHpQz64jsWBuGTE=;
 b=k7zF3qyO2j1envBu7G07Koibi6VaFz7RXxzI2oRhd0h48xMRoWARm7eE1QfOpRs7pU
 jWjci779l7JlpCHoBvV5WzFSYJb5jZZtNOwd226i3RlCALJ1+DJ/djmPte590pymEPZo
 ZQ1Oz5T43wpRW7DatMzsve9SdP1uak9u2pS0KZAYWtUVwLZpwvi6F636O4N+KAadXTmh
 qyJ0NoIhDg3AWdg5HUz/c0BIvur/aUzkZnnePj4ha1DZArRM/v6W+5LjvjFls9kv64//
 qoXyRs8N+HGksGTZKIxkNnP2x18+PIT1Y+wwKxZ1hhAp45fjiF6eionTE7bhSipxscNF
 2LtA==
X-Gm-Message-State: AOAM532U7Y2UjEofMZGT4qf3ibAOSBgvISyQPh7b4HRqcPhk4nEnZRYd
 +WdkFR1iO2G+ToHEJuJnMQF06DYxh879L7V+XEmkqtyDXtR2fjLRgu9NNQS/1vvx2bv7wyRUqk4
 z9fRoUpJuujlOUjU=
X-Received: by 2002:a1c:59c7:: with SMTP id n190mr2736304wmb.61.1591083626070; 
 Tue, 02 Jun 2020 00:40:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylNlCZsbnz7XQfJemitGuRYK+oSae+agcywcuTK27avKFviQvkRhkGfdwn5Ea6QRCaGN/yBw==
X-Received: by 2002:a1c:59c7:: with SMTP id n190mr2736288wmb.61.1591083625749; 
 Tue, 02 Jun 2020 00:40:25 -0700 (PDT)
Received: from [192.168.1.43] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id h74sm2612959wrh.76.2020.06.02.00.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Jun 2020 00:40:25 -0700 (PDT)
Subject: Re: [PATCH] checkpatch: reversed logic with acpi test checks
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20200602053614.54745-1-mst@redhat.com>
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
Message-ID: <af5a3a6c-b0fd-46cc-eb8b-89c7d7e58952@redhat.com>
Date: Tue, 2 Jun 2020 09:40:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200602053614.54745-1-mst@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/02 03:23:32
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/2/20 7:36 AM, Michael S. Tsirkin wrote:
> Logic reversed: allowed list should just be ignored. Instead we
> only take that into account :(
> 
> Fixes: e11b06a880ca ("checkpatch: ignore allowed diff list")
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
>  scripts/checkpatch.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 0ba213e9f2..55aa45dc16 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1267,7 +1267,7 @@ sub checkfilename {
>          # files and when changing tests.
>  	if ($name =~ m#^tests/data/acpi/# and not $name =~ m#^\.sh$#) {
>  		$$acpi_testexpected = $name;
> -	} elsif ($name =~ m#^tests/qtest/bios-tables-test-allowed-diff.h$#) {
> +	} elsif (not $name =~ m#^tests/qtest/bios-tables-test-allowed-diff.h$#) {
>  		$$acpi_nontestexpected = $name;
>  	}
>  	if (defined $$acpi_testexpected and defined $$acpi_nontestexpected) {
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


