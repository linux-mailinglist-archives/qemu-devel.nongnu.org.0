Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F5E3AA43B
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 21:22:49 +0200 (CEST)
Received: from localhost ([::1]:34940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltb7g-00065V-RM
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 15:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltb6p-0005PN-Qz
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:21:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltb6m-0004r4-EA
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 15:21:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623871310;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rjRhFapMJM1SIz0u2vwNeOTvz+w0rxO8emPONaC7MwY=;
 b=EMOzKIOQqcA9aCMDSlOF7on7cqIZzSv4FuI05yGlWwA/IiDqKlovAuswEA3dXU0i7hfTH8
 t10pwtdxampLpxWoj4jYqyM/gtkSpn/3LDEj+sdIv7k0S7SvqQJUOfvTZ41yBcs9i1MYVR
 o0FJGqLdA74g1cskSLOyCLrg34PedV0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-YVMwLaU-Oi2wHro7ZSjc3w-1; Wed, 16 Jun 2021 15:21:48 -0400
X-MC-Unique: YVMwLaU-Oi2wHro7ZSjc3w-1
Received: by mail-wr1-f70.google.com with SMTP id
 x9-20020a5d49090000b0290118d8746e06so1746369wrq.10
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 12:21:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rjRhFapMJM1SIz0u2vwNeOTvz+w0rxO8emPONaC7MwY=;
 b=tDwLa0cCx1ErV67xqufto9JsGSJP9zKuwFH6mnspSiRqlMTA7mKhD5THMjfWPF25mW
 27XeznyMqgTTEnFqP3JShlco7jyd1nIZ3uw3yGU4k7+BTrQF1USzTY4ROJiig98bpiYB
 p+uwwnsf/ICi8cQvQbm9cgWa08j7x//T5IkdFK6oT2Sfoh1yT+4f1nNC25r7V9gEd50K
 /Di9bbqX/JeAflgZ7+86NJSySPIiIag+GxvEXbQXyPdu7nJI/wyDNmrOGw6UECEOCeop
 8mDFA7m2ri0fbCbVn1aj+OR9veWT5SyMrSCjKdzOeSt4Rkp9iqRoX2nlHzAmZ205kn6E
 GU/g==
X-Gm-Message-State: AOAM530t7mtAMAdyNjJN6AJXOpwmRts2QXvKcXilZshZn5wLkl/QQeUP
 l6GmVggi2KdIhQCNrVr0tryvFn4wV1TVGeg5/1fEsA0bLsqjew1Jwh0Bnc+LngQp8JloieR+ZH1
 UkQx2Ti0DQEYgLZA=
X-Received: by 2002:a05:600c:19cd:: with SMTP id
 u13mr646544wmq.28.1623871307143; 
 Wed, 16 Jun 2021 12:21:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCtXl4FRBX1+GaPQyE3MontXJLhfNowgAkV90b4eLTVy4tzfJY731d/wXJq1UKwei5l5UzFw==
X-Received: by 2002:a05:600c:19cd:: with SMTP id
 u13mr646533wmq.28.1623871306940; 
 Wed, 16 Jun 2021 12:21:46 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id f19sm2357821wre.48.2021.06.16.12.21.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 12:21:46 -0700 (PDT)
Subject: Re: [PATCH v4 5/7] crypto/tlssession: Introduce
 qcrypto_tls_creds_check_endpoint() helper
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210616162225.2517463-1-philmd@redhat.com>
 <20210616162225.2517463-6-philmd@redhat.com>
 <55c03d12-3359-858e-8e71-7ba7a6fddad4@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <bda6ced3-3299-f1ed-f5c4-b53ed61bde28@redhat.com>
Date: Wed, 16 Jun 2021 21:21:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <55c03d12-3359-858e-8e71-7ba7a6fddad4@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.17, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/16/21 9:12 PM, Richard Henderson wrote:
> On 6/16/21 9:22 AM, Philippe Mathieu-Daudé wrote:
>> Introduce the qcrypto_tls_creds_check_endpoint() helper
>> to avoid accessing QCryptoTLSCreds internal 'endpoint' field
>> directly.
> 
> I don't understand this one.  Comment ...
> 
>> +bool qcrypto_tls_session_check_role(QCryptoTLSCreds *creds,
>> +                                    QCryptoTLSCredsEndpoint endpoint,
>> +                                    Error **errp)
>> +{
>> +    return qcrypto_tls_creds_check_endpoint(creds, endpoint, errp);
>> +}
> 
> ... doesn't match the function.
> 
> The new function is a pure forwarder, and begs the question of why the
> caller isn't using qcrypto_tls_creds_check_endpoint directly.

I tried to follow the maintainer/subsystem style (I was also tempted to
use qcrypto_tls_creds_check_endpoint directly). ui/vnc uses the TLS
"session" API and not the "creds" one. Daniel, what is your preference?


