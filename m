Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A74605E71
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 13:06:08 +0200 (CEST)
Received: from localhost ([::1]:47684 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTNG-0004f6-8G
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:06:06 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTME-0001WE-Od
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:05:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1olSxo-0002wf-HT
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:39:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30411)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1olSxm-0002s4-HQ
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:39:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666262385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x+2RAo2ZdYh22RfAzT8P8/S/YxjpKxuv6Sy44nzBu7Q=;
 b=Q4+VghYDZcMrX5ewTzJDg1AsGWx2+s2Gh8GnXmZEP31vv4e5IUo3zGOyMD8/EJGgywxvqQ
 nSzxvGw1PRQubv3BOqsLVTChrDXXgHCM3b0J7wGehmQNnn14u07ggHKhWHyIol2jbAyIW5
 vOdbVmiQZ3vSi3EMs8OgUKiS1EkKb/U=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-672-Y-mHWEOZO8WqO6-2mqx9GQ-1; Thu, 20 Oct 2022 06:39:44 -0400
X-MC-Unique: Y-mHWEOZO8WqO6-2mqx9GQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 v13-20020a056402348d00b0045d36615696so12673022edc.14
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 03:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x+2RAo2ZdYh22RfAzT8P8/S/YxjpKxuv6Sy44nzBu7Q=;
 b=Yc393mdCcB63KSlh5zXoHCz4fUFgJRiqOGUeG3Yp/wCbrN7z+Nkx7zXZtOTClZJTvQ
 5QclCSlmJwFrv0f4oiNn0or9SZR0Kp1DvDs5eaPkxW7ntZyPn5oiaaa9HnnqaA+VhcMY
 3v+wsnFefEVAyBqoziyUS/1JD2xOcYMnMTCOiOq1W10nxRJiydMf+/851e7UEciOh7bK
 t+mCpptgqSDwWoxfMQgHg9pntPdwUcKMQKkpi7hHyQyN7QYtq/Y4dXlSJGOLq+WulGcr
 FUlGtIGerNx3wi8oynGWPly+Yv0IYbfjogprDtFa8nPmeJsppt4239DQoqa4ZTbobwVp
 WV4w==
X-Gm-Message-State: ACrzQf25w1PHZT2kR0vFeOTVGyD4eKlX5VV6Qazb48gt62ookUijtUje
 pMOmRuCqQzSFS9k8STGVmqxqvcP3QA9GHwaeRqcrQvQo5rCgHwGuImD4v4gKgAKYouY5eWJETyp
 rCzwWxvYYerqmCOU=
X-Received: by 2002:a17:907:728e:b0:78d:f5c2:70d3 with SMTP id
 dt14-20020a170907728e00b0078df5c270d3mr10309342ejc.506.1666262383511; 
 Thu, 20 Oct 2022 03:39:43 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4nhQhRpKjWCPzPza8wnCYtniOGX50YYrJheDIpj/TNK+HgRqusSx4Lfs+5QBFTeDOYM/LAWw==
X-Received: by 2002:a17:907:728e:b0:78d:f5c2:70d3 with SMTP id
 dt14-20020a170907728e00b0078df5c270d3mr10309331ejc.506.1666262383318; 
 Thu, 20 Oct 2022 03:39:43 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 23-20020a170906311700b0073d8ad7feeasm10124586ejx.213.2022.10.20.03.39.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 03:39:42 -0700 (PDT)
Message-ID: <e5d785bb-3865-75a3-f1aa-c99acf127c5f@redhat.com>
Date: Thu, 20 Oct 2022 12:39:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 1/2] util/log: Derive thread id from getpid() on hosts
 w/o gettid() syscall
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Richard Henderson <richard.henderson@linaro.org>
References: <20221019151651.334334-1-groug@kaod.org>
 <20221019151651.334334-2-groug@kaod.org> <Y1AeglCfb6SHaf4N@redhat.com>
Content-Language: en-US
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y1AeglCfb6SHaf4N@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 10/19/22 17:57, Daniel P. Berrangé wrote:
>> +    if (my_id == -1) {
>> +        my_id = getpid() + qatomic_fetch_inc(&counter);
>> +    }
>> +    return my_id;
> This doesn't look safe for linux-user when we fork, but don't exec.

Linux-user won't ever get here, however bsd-user might.  We should have 
get_thread_id() somewhere in util/, for example

https://github.com/wine-mirror/wine/blob/master/dlls/ntdll/unix/server.c

> The getpid() will change after the fork, but counter won't be
> reset, so a thread in the parent could clash with a thread
> in the forked child.

It might clash even if the counter is reset for that matter.

Paolo


