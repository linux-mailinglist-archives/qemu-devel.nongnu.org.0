Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C362ECE8B
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 12:20:20 +0100 (CET)
Received: from localhost ([::1]:33980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxTL1-0002uN-OL
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 06:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxTIc-0000rc-Fh
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:17:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kxTIY-000771-Fq
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 06:17:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610018265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NZHuny9nSDZwZlKxtEgMzBnC3aaSOUIsKvmMryLOAMM=;
 b=a9kkw0p0bpSVE5Yir3DB/LxjTEzqqqhzg1aLJoF/8Xs3NIVqPe7NPBSV+XTvUhA0iG8GaP
 Lrr49Y6mTpkK23ZPSIFQDndYprOYIwVdUSRDq5mGT7r3TKmztQ9JKCuycE3uJeaArGz1dz
 9TkuUV8W6Q8rj4EuTwDDweBem8sXvvA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-7PRmx1wjODyW4X6Vkdv3Lw-1; Thu, 07 Jan 2021 06:17:43 -0500
X-MC-Unique: 7PRmx1wjODyW4X6Vkdv3Lw-1
Received: by mail-wr1-f70.google.com with SMTP id o17so2525706wra.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 03:17:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NZHuny9nSDZwZlKxtEgMzBnC3aaSOUIsKvmMryLOAMM=;
 b=axeqANWrEhsMaok6k+FF9cSBff5z0M3hESa56eIDZ0yHUuQc6cn68aArhIbzV9ISVu
 HuZUma7v7z/jQgGq+ypo3K/SRLWKm81v6WrMubDKNym7dbZbFkFrKbEr6LUYlLUW9ftY
 qKjuE+4/7LfZ+se+t/TEK6ewBmX7S0V+hW23/TXYNyW/We9Sw2+jnK8s2ezduh1QdgPH
 n+dOm3vilfKqCGCDwnRxMbOEgX+imoXOqpwJSvgZisdpJrlESlLx5aeDziS0jPHlaQ6U
 JoQcf47lJWYquPK7Q1351DbNItcGR8Me7In68x7P+7YKq8zyGPpTuGDS3WpJaps5jUPq
 VJ6g==
X-Gm-Message-State: AOAM533ePP7WG2fwyPjGH0cK64dI/r285AN0k5XiYIWIsJUCAo073CcG
 nNt77Xgqxac0gpYpfZ4zqLvqbFv3RLxeBi1zGbTmW7oWaP+NWJK6XBgKEUnqFJV5SD03Wh67tzm
 uNLQmI2aYGnrvYtQ=
X-Received: by 2002:a05:600c:210e:: with SMTP id
 u14mr7727262wml.48.1610018262385; 
 Thu, 07 Jan 2021 03:17:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVXlxnYLqZRulMIe2/24MDnzsQ8klPRIv3zfbhKNiKlOJa18zTfWWZr/kYZQOAhLhbO+pYBg==
X-Received: by 2002:a05:600c:210e:: with SMTP id
 u14mr7727252wml.48.1610018262272; 
 Thu, 07 Jan 2021 03:17:42 -0800 (PST)
Received: from [192.168.1.36] (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id t1sm8341782wro.27.2021.01.07.03.17.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 03:17:41 -0800 (PST)
Subject: Re: [PATCH v4 4/5] whpx: Fixes include of whp-dispatch.h in whpx.h
To: Yonggang Luo <luoyonggang@gmail.com>, qemu-devel@nongnu.org
References: <20210107101919.80-1-luoyonggang@gmail.com>
 <20210107101919.80-5-luoyonggang@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <a9e0b647-9630-01bc-796b-e5961cb0967e@redhat.com>
Date: Thu, 7 Jan 2021 12:17:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210107101919.80-5-luoyonggang@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.249, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/7/21 11:19 AM, Yonggang Luo wrote:
> Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> ---
>  include/sysemu/whpx.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


