Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F83D60C7EB
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 11:23:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onG6o-00076h-Hk; Tue, 25 Oct 2022 05:20:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1onG6d-0006c6-1p
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:20:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1onG6b-0004tk-6K
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 05:20:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666689615;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lq17XnltjAgvXEm56sdochWF+JIJeZVdlDol005QixI=;
 b=U2eFo274xAf7xzhIYyJgKRqLQUZJlf/uekEZd00KpgA+25sfwDbv4MP3+i5o0UKdl7n2VP
 8KvbHlReY5YmxMiXgXw/wVpLX05GpwMxCitP547BTFoaWgqj2KMPFoIlAdQC9Lst6SNez3
 pByPJmDdPzJNVyOP3OyYehVLZCqdgV4=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-269-QsO4YR8JPWeJnkW34JZ02g-1; Tue, 25 Oct 2022 05:20:11 -0400
X-MC-Unique: QsO4YR8JPWeJnkW34JZ02g-1
Received: by mail-qt1-f199.google.com with SMTP id
 cb19-20020a05622a1f9300b0039cc64d84edso8628461qtb.15
 for <qemu-devel@nongnu.org>; Tue, 25 Oct 2022 02:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Lq17XnltjAgvXEm56sdochWF+JIJeZVdlDol005QixI=;
 b=x9CKAxhZZlSa1dntMtaYO7BhQsdDMSszuEwjZ/ggEVsZZtJyDJqLnvWEneZfzcCCAf
 UDm6zBsE4KivplSvUVBXA/rlDFPsE8kweGPoXnhph/V09SWqPhl3Jj8xKqVO1fkmghla
 xL5AZ2oDM6LBur7C0Er6Z0wHuvIaTNw4krjmLcnxGqNSxJiTDNMvTFvJ4aNf82yGAsQu
 PbbGcs99Y4zdnW7jatmGfFkVNz03MJnodNbiiyk8+3zw5iIX43JsafO+jvutTM2eerBF
 B8aiJWVmo5Y662CtjUPfSZdUx12MwbpcKzpTjEjvtfojZGNNMSKipeJnwMgHPl9Vanu0
 ni0w==
X-Gm-Message-State: ACrzQf1W8eBaKd4xYJCGQYbAUSbzFsqSCr98aCSMZCq5TPa2YgXx2CsV
 xr4bWRBA9DztfK7aK3HjRXmPEWRE9BNvr0ZjgjZ6YfvvlDc1TF65r2VX5VOIUwHXC3mLzGUexSH
 /wwnoE8aYLyPqCNA=
X-Received: by 2002:a05:620a:4fb:b0:6eb:194e:4565 with SMTP id
 b27-20020a05620a04fb00b006eb194e4565mr26555459qkh.726.1666689610698; 
 Tue, 25 Oct 2022 02:20:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5qTLAk+OqXRP23AphEwwhdNhaZEV74xjW+njmQ3AmELCdfV1lOibwUpPVilVVIjBTpDeFLBA==
X-Received: by 2002:a05:620a:4fb:b0:6eb:194e:4565 with SMTP id
 b27-20020a05620a04fb00b006eb194e4565mr26555453qkh.726.1666689610456; 
 Tue, 25 Oct 2022 02:20:10 -0700 (PDT)
Received: from [10.201.49.36] (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.googlemail.com with ESMTPSA id
 x10-20020ac84a0a000000b00398ed306034sm1298928qtq.81.2022.10.25.02.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Oct 2022 02:20:09 -0700 (PDT)
Message-ID: <39e06c4f-b476-8ab5-d690-7e4fb3ce5a5f@redhat.com>
Date: Tue, 25 Oct 2022 11:20:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 2/2] util/log: Always send errors to logfile when
 daemonized
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, Richard Henderson
 <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20221019151651.334334-1-groug@kaod.org>
 <20221019151651.334334-3-groug@kaod.org>
 <47ea1c0e-9e32-ce9a-7bef-bd2ac70bdbb9@linaro.org>
 <20221020114937.3558737e@bahia> <Y1Ebv28whPgwdaMW@redhat.com>
 <1b76bdd4-f5ca-cb0a-2593-b025d6575e9b@redhat.com> <87wn8pa72j.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <87wn8pa72j.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/24/22 11:44, Alex Bennée wrote:
> 
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
> <snip>
>>> If we want to connect stdout/err to something when daemonized
>>> then lets either have a dedicated option for that, or simply
>>> tell apps not to use -daemonize and to take care of daemonzing
>>> themselves, thus having full control over stdout/err. The latter
>>> is what libvirt uses, because we actually want stderr/out on a
>>> pipe, not a file, in order to enforce rollover.
>>
>> I would gladly get rid of -daemonize, unfortunately it has many users.
>> Adding further complication to it is not beautiful, but overall I
>> think Greg's patch does make sense.  In particular I would continue
>> the refactoring by moving
>>
>>
>>              /*
>>               * If per-thread, filename contains a single %d that should be
>>               * converted.
>>               */
>>              if (per_thread) {
>>                  fname = g_strdup_printf(filename, getpid());
>>              } else {
>>                  fname = g_strdup(filename);
>>              }
>>
>>              return fopen(fname, log_append ? "a" : "w");
>>
>> to a new function that can be used in both qemu_log_trylock() and
>> qemu_set_log_internal().  (In fact this refactoring is a bugfix
>> because per-thread log files do not currently obey log_append).
> 
> What is the use case for log_append. AFAICT it only ever applied if you
> did a dynamic set_log. Was it ever really used or should it be dropped
> as an excessive complication?

log_append is used if you turn off the logging, which clears log_flags, 
and then turn it on again.  The usecase is that if you remove the file 
QEMU won't keep writing to a deleted file.  ¯\_(ツ)_/¯

However, it's messy.  In particular after changing the file name 
log_append will be 1 and that makes little sense.  The simplest thing to 
do here is just to not close the file, I sent a patch for that.

Paolo

>  From my point of view appending to an existing per-thread log is just
> going to cause confusion.
> 
>>
>> Paolo
> 
> 


