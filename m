Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B49565FC7A1
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 16:43:23 +0200 (CEST)
Received: from localhost ([::1]:48938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oicx8-000892-Qc
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 10:43:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oicmo-0004kG-3g
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:32:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oicmk-0006gd-Li
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 10:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665585156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hLual1QV2mneKufihcl3RSbFiKICXi5CFbqEPkhL08w=;
 b=W3yrWMvJPXasbxEDd9a+xG61gajYeunfM39aBD2VhN5ZlUQwjor6XOmmMb8u9d5d1+5Pig
 2GpEKt1hIFq7VoJ0x0ZOLghFi7HyceUQE25F8/dCsHZuR+u5K4gozMjOySl2qub+9Op+Vl
 JvJoNygVghN1/Uxkye1BtaV7x/31/sE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-375-KD3bdR0_NvSaKyWDxGduOw-1; Wed, 12 Oct 2022 10:32:35 -0400
X-MC-Unique: KD3bdR0_NvSaKyWDxGduOw-1
Received: by mail-ed1-f70.google.com with SMTP id
 x4-20020a05640226c400b0045c09fc1bd4so7096958edd.7
 for <qemu-devel@nongnu.org>; Wed, 12 Oct 2022 07:32:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hLual1QV2mneKufihcl3RSbFiKICXi5CFbqEPkhL08w=;
 b=gnx8pMRhAYBt6+ps/hKN8kH7TUi437QNqXl/0sUlqGx7mGvu/DccL+O/d4iKJSg+YK
 Sqg6wEiDVTMc4kFCLB3aACxSpwnwv7TqF3/sRGoBjQPCuugQF1EXv8Tezq7TEjrCeJW4
 zEHOnlVBiRJXtJgRQ46Xyynht1sRDaNJ4E+c5f+Y7m9MzbvPJHjB1yxTw8nBPrMYSX72
 FaFrG8KNHamp/7V0s14aMKaCqHYGwaZj4fvUZzgs5kPEjqRV8E8QJ8D2UlkaQH6BKAsZ
 tdMLqRfsRHdMRCJ1KoRWaizV+YUYZeJoonl88IO2i0QfzaJR2IqxMXHhBtPmqdATwjS6
 XnEw==
X-Gm-Message-State: ACrzQf1Oe9QTCldnMyToCNu9RACFVPFrEO0dFsdoUJ9ILu71YY7krt9b
 5eCNujMTjxZ4Mr/e0RjBb19cGCfkv45Xxl9awp5X9B4NDoMKg1CxtalSXB+iOVs01xwUIJmGm/q
 6k9ZS2V85KzyD8VE=
X-Received: by 2002:a17:907:3188:b0:741:4bf7:ec1a with SMTP id
 xe8-20020a170907318800b007414bf7ec1amr23585309ejb.448.1665585154078; 
 Wed, 12 Oct 2022 07:32:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7pUf5vxOeqSr1Cr28krdJmtnJ10H4yX8kSTWYhYHolsy1WXmi++12feJYsd1qGy4fGfPzWlw==
X-Received: by 2002:a17:907:3188:b0:741:4bf7:ec1a with SMTP id
 xe8-20020a170907318800b007414bf7ec1amr23585290ejb.448.1665585153800; 
 Wed, 12 Oct 2022 07:32:33 -0700 (PDT)
Received: from ?IPV6:2001:b07:add:ec09:c399:bc87:7b6c:fb2a?
 ([2001:b07:add:ec09:c399:bc87:7b6c:fb2a])
 by smtp.googlemail.com with ESMTPSA id
 w24-20020a056402071800b00458e73fe1c1sm11397209edx.8.2022.10.12.07.32.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Oct 2022 07:32:33 -0700 (PDT)
Message-ID: <c251c270-3c87-6249-7b73-edeeb74f6d1d@redhat.com>
Date: Wed, 12 Oct 2022 16:32:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PULL 1/1] Revert "configure: build ROMs with container-based
 cross compilers"
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, "Hajnoczi, Stefan"
 <stefanha@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>
References: <20221011192858.956078-1-alex.bennee@linaro.org>
 <20221011192858.956078-2-alex.bennee@linaro.org>
 <CABgObfY42pEWRe67qZJ78LdnEmL+xK+V5c_Ut+cxoqJ7Gw4mzQ@mail.gmail.com>
 <Y0Z3fMpQo+8fz9ul@redhat.com>
 <bd325ff3-831e-ca4d-4ada-e2650a0a908b@redhat.com>
 <Y0aEFUOU0DCWgvcL@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y0aEFUOU0DCWgvcL@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.528, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 10/12/22 11:08, Daniel P. Berrangé wrote:
>>>    - Tailor downloads wrt the target list configured
>> This is already done.
>
> Where's the patch for that, I hadn't noticed it being posted yet ?

Oh, I thought it was done already before the introduction of containers 
but only tests/tcg is filtered.  But it should be as simple as

diff --git a/configure b/configure
index 00acb69cc9..7a26ce39b3 100755
--- a/configure
+++ b/configure
@@ -1269,6 +1269,11 @@ probe_target_compiler() {
    container_cross_ranlib=
    container_cross_strip=

+  case " $target_list " in
+    " $1 ") ;;
+    *) return 1 ;;
+  esac
+
    target_arch=${1%%-*}
    case $target_arch in
      aarch64) container_hosts="x86_64 aarch64" ;;


Paolo


