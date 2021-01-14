Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D13A2F6209
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:33:13 +0100 (CET)
Received: from localhost ([::1]:49470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l02kS-0004MC-5o
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:33:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02VX-0007ub-Mw
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:17:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l02VS-0005tE-0z
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:17:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610630261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HkQCWqVNvKPZXeZPLxyaLaEsB2YPUnr3NudIaB5LXIk=;
 b=gRLA1wQAxCsDQq7RWQZQynBJf0up3pozg6jKnReCUeNP2omQTNTTi8GNHbyYmul/WBNWuM
 RLlWbv/JDuiQUHXGaglRkJHOiFSg7U70GrDtcYWwYMUEuFzff9e/9tB6KLHrWfe8VR5C1a
 wQjOyUdSRk9n5Fm/Smb0/fZzuTJCqow=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-NfB7uop4Oo6jydynO2m-GA-1; Thu, 14 Jan 2021 08:17:39 -0500
X-MC-Unique: NfB7uop4Oo6jydynO2m-GA-1
Received: by mail-wr1-f70.google.com with SMTP id u14so2587543wrr.15
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:17:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HkQCWqVNvKPZXeZPLxyaLaEsB2YPUnr3NudIaB5LXIk=;
 b=D7+5vZaReZk/LBzFk87eFo9ucimK3x0pC6FcrRpFuDEWXUclK7NmhcAW8CzDmc4g66
 NszIIXwQdj9gvJTzY4HWLJlMWMBiMvXofULRkUTZbbP2oLJOXLYSEiKjiZFFhgLaw0sM
 DMoSMC6i+oubNbMhze1nBEyjca7y63qTTPOwcgx/0149GmJgJiAK/E+eb+vCXMVGhzdI
 vLi9uY741CYObFuNz06YsUT22bOajRwB6lu39CnD9NfLqK0ZVbITrDzKgGmGE2hhIWfn
 YQNGwdYP5n/1e0BBx4UjVm81FAg7C7z2H4UYdOMos1WBLIA5YvdMwqonJOotaN1pcETs
 s7Dg==
X-Gm-Message-State: AOAM532ycF0tHUMzqadQm7jDS28Hr+3Aaf4qZKmGKcwBKq3F0puvL5dS
 i4SEoQLkC2EAS/5EXnX+4tnismcH7Ksy9oVIlr1JIPEBxp4EYM0HGHffn4LCpc7/JdVdfFksnNv
 7MiFqmZyPrc1vsoo=
X-Received: by 2002:a05:600c:2188:: with SMTP id
 e8mr4000795wme.182.1610630258591; 
 Thu, 14 Jan 2021 05:17:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz89LtnxL5M3nZbKEN8UBHs0ccWm2nzSZEpsin2VzEXB3+Si8fsOcmXjqSrretXzKtlq3le+A==
X-Received: by 2002:a05:600c:2188:: with SMTP id
 e8mr4000783wme.182.1610630258368; 
 Thu, 14 Jan 2021 05:17:38 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id s6sm9472954wro.79.2021.01.14.05.17.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Jan 2021 05:17:37 -0800 (PST)
Subject: Re: [PATCH 3/5] build-sys: add libvhost-user missing dependencies
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210114125605.1227742-1-marcandre.lureau@redhat.com>
 <20210114125605.1227742-4-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6d0958f7-a500-5826-58c6-f05319f0285d@redhat.com>
Date: Thu, 14 Jan 2021 14:17:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114125605.1227742-4-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: pbonzini@redhat.com, j@getutm.app, samuel.thibault@ens-lyon.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/21 1:56 PM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> This help fixing static compilation issues.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  subprojects/libvhost-user/meson.build | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


