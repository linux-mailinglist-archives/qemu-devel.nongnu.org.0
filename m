Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4E2DFE92
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 09:46:18 +0200 (CEST)
Received: from localhost ([::1]:51174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMorx-0008Ho-Ky
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 03:46:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41355)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iMor4-0007l6-P4
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:45:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iMor2-00077x-Fv
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:45:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46336)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iMor2-00077P-AP
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:45:20 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C58CF368B1
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 07:45:18 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id o10so8668486wrm.22
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 00:45:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3DkJU6qVIwd1CHHmHQXJNsVx04oduLw/xo3uOgt1ReA=;
 b=bPjeAAI9cq41ZeTITvmmwmSSA6eLzA1zpmyGfDE8TidZcsaPdApaoQ+BmupPGNmNkt
 a9COpg3IHXAV3qn7fknH+ZVmaI1UVivMvMQn0gOPIK3GwMeqSKTYOmvg60FlPhbc6k+H
 v2apCzFun/7nlm3U42vIWmp9A5eUTWmcrHVMvZkRbcBuybOfRb1XzsrwR38tT7KcGB2t
 XpObv/4WAEOct1NKT/B6Z0kPL9VFA3ZQjcR3IfR8iopxyGZOWYkgLeRFiVL2jEfOhWW/
 lWX0HiwttN7R1lzIyQxjFB30uiOTH22Gc4+blIv7GmB2JZyXkgvWT6i1bjIiq1JB5+Kk
 Qx6Q==
X-Gm-Message-State: APjAAAW7jT/yb7HSk4EvVCxErnqqG2e3B861fZj2klpDaGI4MQbbhH/f
 7T8JlduS3DCVTO9SGwJGI2mVQOc7cCCuaGgtjVfauijff2y6NiHl5hBufYkRnwrPZ1OTi/PZR/9
 P7bsKie+SCWxZYXk=
X-Received: by 2002:a1c:f018:: with SMTP id a24mr1590268wmb.77.1571730317499; 
 Tue, 22 Oct 2019 00:45:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyY1Gwd1ZKN0g6tgokY/JEmQV3ZcC2ofjvV/plzRPmTCcaz0DEaXlGEU/RUvGOROTzgFI7BdA==
X-Received: by 2002:a1c:f018:: with SMTP id a24mr1590248wmb.77.1571730317250; 
 Tue, 22 Oct 2019 00:45:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:566:fc24:94f2:2f13?
 ([2001:b07:6468:f312:566:fc24:94f2:2f13])
 by smtp.gmail.com with ESMTPSA id f17sm5761230wrs.66.2019.10.22.00.45.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Oct 2019 00:45:16 -0700 (PDT)
Subject: Re: [Patch v2] checkpatch: sugguest to use qemu_real_host_page_size
 instead of getpagesize() or sysconf(_SC_PAGESIZE)
To: Wei Yang <richardw.yang@linux.intel.com>, philmd@redhat.com,
 eblake@redhat.com, thuth@redhat.com, berrange@redhat.com
References: <20191017004633.13229-1-richardw.yang@linux.intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <0c72a7a3-7d0d-4052-33b4-7a7522fe8a02@redhat.com>
Date: Tue, 22 Oct 2019 09:45:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191017004633.13229-1-richardw.yang@linux.intel.com>
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
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/10/19 02:46, Wei Yang wrote:
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
> CC: Richard Henderson <richard.henderson@linaro.org>
> CC: Stefan Hajnoczi <stefanha@redhat.com>
> 
> ---
> v2: add "\b" for better match, suggested by Richard Henderson <richard.henderson@linaro.org>
> ---
>  scripts/checkpatch.pl | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index aa9a354a0e..ab68a16fd2 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -2915,6 +2915,12 @@ sub process {
>  		if ($line =~ /\bbzero\(/) {
>  			ERROR("use memset() instead of bzero()\n" . $herecurr);
>  		}
> +		if ($line =~ /\bgetpagesize\(\)/) {
> +			ERROR("use qemu_real_host_page_size instead of getpagesize()\n" . $herecurr);
> +		}
> +		if ($line =~ /\bsysconf\(_SC_PAGESIZE\)/) {
> +			ERROR("use qemu_real_host_page_size instead of sysconf(_SC_PAGESIZE)\n" . $herecurr);
> +		}
>  		my $non_exit_glib_asserts = qr{g_assert_cmpstr|
>  						g_assert_cmpint|
>  						g_assert_cmpuint|
> 

Queued, thanks.

Paolo

