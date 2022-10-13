Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BC15FDBC2
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Oct 2022 15:56:42 +0200 (CEST)
Received: from localhost ([::1]:45756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiyhV-0004YK-I7
	for lists+qemu-devel@lfdr.de; Thu, 13 Oct 2022 09:56:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiyE9-0008V4-R1
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:26:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oiyE6-0004fX-Lm
 for qemu-devel@nongnu.org; Thu, 13 Oct 2022 09:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665667577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tUGZ10lTNiwQ6aescPux8I8EIy6Mrrt9FVJrzm2ZbLw=;
 b=IfMc+XamGZ1VD48l5oU7sp+QjkyLWFkriwSNSqegMuHSQZIHl0lNsdhbUN/jq5UeDd7MBB
 zRf2zeDsQH6+iQgD9Hg97qVuT5U1dBfI2JGrLHCaV/f4RzByQzWN4IQIZUxRByspB2DGiK
 UnVvGXV1MmVTIYfi8mKbRlNKPAi+7sY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-568-cUHF2pRlPJqJiDZMRtuqdw-1; Thu, 13 Oct 2022 09:26:16 -0400
X-MC-Unique: cUHF2pRlPJqJiDZMRtuqdw-1
Received: by mail-ed1-f71.google.com with SMTP id
 s8-20020a056402520800b0045cab560d5eso1526649edd.1
 for <qemu-devel@nongnu.org>; Thu, 13 Oct 2022 06:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tUGZ10lTNiwQ6aescPux8I8EIy6Mrrt9FVJrzm2ZbLw=;
 b=th5MrNDfDwqw0ReZAt5tKYZyngtvKg9fMPtTe8+OXwceV6LlsNxImRH6pXi2xJ/Ppb
 N9D8qUbhSLH8NnSvrWIrlu8qXVpb5E615xUJTzCiGxYuQhLqZb8OJuXJsd/SdUSTgj02
 qDNOX0QQ1s56AFce+/AuMkSM8iUcPkLNxuhdoLF+gaYZBUQ6cD53MYP1dy4BU0f2br1y
 3DW7d/6ohMjS3Dac/OkNBbxCIxtFZagZpX7bfAd3BD2lOh3mPini1OB5dxyhkEG1fA/W
 wcoN+78fOfsPkI4ItH3mE8hFebvkmWoqoR257easTK1CgVkTvqxntDtlJAcGR082K6/z
 uIxg==
X-Gm-Message-State: ACrzQf34b20GPnDQpVxiMrxUjfJsL+K5wacVTUf1kC5oqvWkI8x8xlWh
 MMbYmG054q4yp2vK8BxH7jT4YWF0RdbDjd48tp/JbY7efUyIaXonDGBNBiUb5CtxcZ8YGzR8ElP
 wgfU2cusZ+V0IdMk=
X-Received: by 2002:a17:907:9816:b0:787:4350:3a19 with SMTP id
 ji22-20020a170907981600b0078743503a19mr25195213ejc.627.1665667575398; 
 Thu, 13 Oct 2022 06:26:15 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5NsMndaVfUEjOY71X/zhQlmfNY8pTto1dKPidZkBgZcEbaMwpBN8v0JfeyvZwa9iEVQdF9Dg==
X-Received: by 2002:a17:907:9816:b0:787:4350:3a19 with SMTP id
 ji22-20020a170907981600b0078743503a19mr25195172ejc.627.1665667574670; 
 Thu, 13 Oct 2022 06:26:14 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:1c09:f536:3de6:228c?
 ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.googlemail.com with ESMTPSA id
 b17-20020a170906d11100b0077077c62cadsm3030246ejz.31.2022.10.13.06.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Oct 2022 06:26:14 -0700 (PDT)
Message-ID: <f1e5d7d0-6414-3219-83ef-55fc9dd72a21@redhat.com>
Date: Thu, 13 Oct 2022 15:26:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH] configure: Avoid using strings binary
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
References: <83824abdddf124d76f9f265f77808e859dc094a8.1665650275.git.mprivozn@redhat.com>
 <CAFEAcA_U_mXy5haEZjEKbH_qS_oi38LK4RMD-z42QC5h2Z67cA@mail.gmail.com>
 <Y0fxjk5zaeDYCPIo@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y0fxjk5zaeDYCPIo@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.25, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/13/22 13:07, Daniel P. Berrangé wrote:
> The only thing 'configure' seems to be doing with the 'bigendian'
> env var it sets, is to construct a meson cross compiler spec

Yes, this is then available from host_machine.endian() in Meson.  It was 
used via

config_host_data.set('HOST_WORDS_BIGENDIAN',
                      host_machine.endian() == 'big')

until 6.2.  Now there's no explicit use but I think it's better to keep 
it correct just in case, and avoid future hard to debug issues[1].

> so we do need a compile time test in configure, but I'd suggest
> using G_BYTE_ORDER

It is imaginable that configure produces multiple cross-compilation 
environments for meson, e.g. to compile qboot from sources.  In that 
case glib would not be available, so please do not introduce any uses of 
glib in configure.

More in general, configure should not be doing any compile tests / 
package detection specific to building the emulators.  Meson 0.63 will 
*finally* make it possible to get there.

That said, using __BYTE_ORDER__ is a good idea!

Paolo

[1] there is one build_machine.endian() which I think wants host_machine 
instead, in fact, but it only affects the final summary.


