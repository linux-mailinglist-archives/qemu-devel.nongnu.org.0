Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1EA60603D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 14:33:56 +0200 (CEST)
Received: from localhost ([::1]:42456 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olUkE-0004Aa-Sb
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 08:33:55 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTfZ-00051F-Jr
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:25:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1olTA7-0006fQ-9x
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:52:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37244)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1olTA4-0007iI-9K
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:52:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666263145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oG1mGlETDYSFexZ0pxBxq/j1wsrLzlY3oabHvMK8Mxw=;
 b=ixxTqZloEncBe9mvnv0Oucwud+ht4iXVhnlQaC3v4mufNl3fAM7/nvLkFuw4Qs+nqcfruI
 DGck6awb0BK7epEhv/xtnGhI5z2+iQTcv/YLC10l1avjmfexA1tUfKez3Pm3AjM8LjFJKF
 ibJsUk3kijF5pPKww4p5k5bbWkczXwk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-_LZ7fr4WO3yj4hjEmeQSxg-1; Thu, 20 Oct 2022 06:52:24 -0400
X-MC-Unique: _LZ7fr4WO3yj4hjEmeQSxg-1
Received: by mail-ej1-f69.google.com with SMTP id
 ho8-20020a1709070e8800b0078db5e53032so9336909ejc.9
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 03:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oG1mGlETDYSFexZ0pxBxq/j1wsrLzlY3oabHvMK8Mxw=;
 b=ksf+vcGiIcGtHhKfd3E+kM4Z/Kga3QUv1/1bz44tFAzLTR2hg3SS6Zffc3hHIAf2LM
 VlrpbV12BbHYCRot3wKHxv/hmUNBg3mTfrGzYlZh5U9Mjtdl1dnFafWS1XbSKitBIiv+
 QHMt8eNZL6K9jJZ5//B0w6BZ+VAY1I/NfbGTMH40iERny6QLb5itM2/2tQR87iGfUTwT
 JJiFSOtgcBz571CiyBWZx2ikLl9buXBw9fyDKA/dxDfdJEPKE3cuvgyblWEmPufN5pBc
 +Zw+b855ukJiHa9YfEBBu3JXvdDzP8Og5xJ5T3qrTyQJVteXkjRgeANyYFM6Ve18Nerw
 pYvw==
X-Gm-Message-State: ACrzQf2QRrWA9QJqO+4FhK5Fg9xAuYnrWPGURcVz/oZ+75+CdYxTfYWy
 SPrW1Of5GQ5JUAjnE2+7Qf5qXbJcDbl2GF8xUoe0UZjYA9wwjHZurB5fD5ubMnaMJJxVqM4bEdJ
 VmR4iTjKJ3Q+GT80=
X-Received: by 2002:a17:907:7251:b0:791:9a5f:1027 with SMTP id
 ds17-20020a170907725100b007919a5f1027mr10266862ejc.467.1666263143380; 
 Thu, 20 Oct 2022 03:52:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6MGhdiTaDJ3eCLRSO5SA5wHGf/7FaeF7hal4aHP4mF+PlEavpcITZpjsqlYzz5A8YX7fFCYg==
X-Received: by 2002:a17:907:7251:b0:791:9a5f:1027 with SMTP id
 ds17-20020a170907725100b007919a5f1027mr10266846ejc.467.1666263143135; 
 Thu, 20 Oct 2022 03:52:23 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 z20-20020a170906715400b0073ddff7e432sm10341974ejj.14.2022.10.20.03.52.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Oct 2022 03:52:22 -0700 (PDT)
Message-ID: <1b76bdd4-f5ca-cb0a-2593-b025d6575e9b@redhat.com>
Date: Thu, 20 Oct 2022 12:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 2/2] util/log: Always send errors to logfile when
 daemonized
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20221019151651.334334-1-groug@kaod.org>
 <20221019151651.334334-3-groug@kaod.org>
 <47ea1c0e-9e32-ce9a-7bef-bd2ac70bdbb9@linaro.org>
 <20221020114937.3558737e@bahia> <Y1Ebv28whPgwdaMW@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <Y1Ebv28whPgwdaMW@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

On 10/20/22 11:58, Daniel P. Berrangé wrote:
> 
> The '-d' option enables logging in QEMU, primary for things
> related to TCG. By default that logging goes to stderr, but
> it can be sent to 1 or mnay files, using -D. IOW, -D is NOT
> about controlling where stderr/out is connected. It is
> about where TCG logging goes.

(Aside: it's not just TCG logging.  The default tracing backend is also 
printing to -D).

> Separately, IIUC, you found that when using -daemonize any
> error_report() messages end up in the void, because stderr
> is connected to /dev/null.
> 
> This patch is thus attempting to repurpose -D as a way to
> say where error_report() messages end up with daemonized,
> and this creates the complexity  because -D was never
> intended to be a mechanism to control stderr or error_report
> output.

True, but it already does that if "-d" is specified, because "-d" 
*intentionally* reopens stderr when -daemonize is specified.  So I think 
overall the idea of "make -D always open the destination when 
daemonizing" is sound, the only weird thing is the interaction with "-d 
tid" which is fixed if we just replace the fallback case from 
log_thread_id() as in Wine's get_unix_tid() code.  "-d tid" can just be 
forbidden if the platform is not supported by get_unix_tid().

> If we want to connect stdout/err to something when daemonized
> then lets either have a dedicated option for that, or simply
> tell apps not to use -daemonize and to take care of daemonzing
> themselves, thus having full control over stdout/err. The latter
> is what libvirt uses, because we actually want stderr/out on a
> pipe, not a file, in order to enforce rollover.

I would gladly get rid of -daemonize, unfortunately it has many users. 
Adding further complication to it is not beautiful, but overall I think 
Greg's patch does make sense.  In particular I would continue the 
refactoring by moving


             /*
              * If per-thread, filename contains a single %d that should be
              * converted.
              */
             if (per_thread) {
                 fname = g_strdup_printf(filename, getpid());
             } else {
                 fname = g_strdup(filename);
             }

             return fopen(fname, log_append ? "a" : "w");

to a new function that can be used in both qemu_log_trylock() and 
qemu_set_log_internal().  (In fact this refactoring is a bugfix because 
per-thread log files do not currently obey log_append).

Paolo


