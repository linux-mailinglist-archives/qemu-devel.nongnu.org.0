Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B415955C741
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 14:53:53 +0200 (CEST)
Received: from localhost ([::1]:56680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Aj2-0007es-Pb
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 08:53:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o6Acq-00027K-MK
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:47:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1o6Acp-00037g-6o
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 08:47:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656420446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZX3NEmPuyf/5m9tZFLrmNXyHkvjJb+FVP9nrYloknqc=;
 b=SLuqe801HBla3oQr4UgBc+CcSVMkmK6AOwD0/ErZdl0cVMITlxZ9bWyIbO4jDtQ/5s5r4J
 VxxA5QAL2HGv6tsTrOBfdypjOisksMDR4nejPY8WzOAuX1VAxPtNrtHKDycKEMckdrV4kv
 c0deYPHNs7Cl2ue7moamY1UUmKR6zqU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-219-kKbRV4GpPTy36jjRhXRYrA-1; Tue, 28 Jun 2022 08:47:25 -0400
X-MC-Unique: kKbRV4GpPTy36jjRhXRYrA-1
Received: by mail-qv1-f72.google.com with SMTP id
 f6-20020a0cbec6000000b004728234508bso2698864qvj.8
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 05:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ZX3NEmPuyf/5m9tZFLrmNXyHkvjJb+FVP9nrYloknqc=;
 b=osl86kQ4aN435Eib0oX9oCbRdwExtAdrjnBAIuKuBpbo9tBTriSottUDevyIuGRkuv
 BSQuQv7edf1Xqi02RoLrlnMQ2b1VUSTWaeinZ2Tcle4TUw56ZzDZSiMD6XBNXFh5LkzO
 t6xKF0ezpeowtEhwYcjfhvvFgg3shLCbRdjdp45zFsXrXn9GTrG7Y4NIKCZjtPevIS1r
 aHi6XaR22YLzeJvWQZ/tR7KMmV64mcGHdWrlValUJpwfYrHMXsfsEqHnS++oLQzW84+k
 nQA558z48DFqLWkFoLciT/hpFkp/FqDV+zBE3JghmmMis73mcKWeL5tPtvw3kbD4KqhB
 w3SQ==
X-Gm-Message-State: AJIora86p35Ry0u+takyB4MKgwfrfPmQCNipOdXapc2TkBxJ2XPeh9R7
 BM9anQ14jzYgjHj62LsTfgMA1yu+Q997Xdrc07ZXKfGqDCg2u0nxAlw6H7z3QNa23wRi1lcQHmz
 bceKqjlqSgFkWb4I=
X-Received: by 2002:a05:6214:1bc7:b0:470:3c68:a290 with SMTP id
 m7-20020a0562141bc700b004703c68a290mr3289405qvc.106.1656420444728; 
 Tue, 28 Jun 2022 05:47:24 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vrFSWmpKGKMpSEkm5LGAcUDXsAwMMcOWQJJhVubgC0FQLyLS8Gx3DQswdz4iQs3P3zkia9TQ==
X-Received: by 2002:a05:6214:1bc7:b0:470:3c68:a290 with SMTP id
 m7-20020a0562141bc700b004703c68a290mr3289393qvc.106.1656420444511; 
 Tue, 28 Jun 2022 05:47:24 -0700 (PDT)
Received: from [192.168.100.42] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 h5-20020ac85845000000b0031a4c717413sm4500507qth.61.2022.06.28.05.47.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 05:47:24 -0700 (PDT)
Message-ID: <ba0a3c6e-0e8c-8cde-5fc4-8a13871c2935@redhat.com>
Date: Tue, 28 Jun 2022 14:47:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/5] tests: wait for migration completion before looking
 for STOP event
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-s390x@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220628105434.295905-1-berrange@redhat.com>
 <20220628105434.295905-3-berrange@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20220628105434.295905-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 28/06/2022 12:54, Daniel P. Berrangé wrote:
> When moving into the convergance phase, the precopy tests will first
> look for a STOP event and once found will look for migration completion
> status. If the test VM is not converging, the test suite will be waiting
> for the STOP event forever. If we wait for the migration completion
> status first, then we will trigger the previously added timeout and
> prevent the test hanging forever.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/qtest/migration-test.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/qtest/migration-test.c b/tests/qtest/migration-test.c
> index d33e8060f9..ac9e303b1f 100644
> --- a/tests/qtest/migration-test.c
> +++ b/tests/qtest/migration-test.c
> @@ -1232,6 +1232,10 @@ static void test_precopy_common(MigrateCommon *args)
>   
>           migrate_set_parameter_int(from, "downtime-limit", CONVERGE_DOWNTIME);
>   
> +        /* We do this first, as it has a timeout to stop us
> +         * hanging forever if migration didn't converge */
> +        wait_for_migration_complete(from);
> +
>           if (!got_stop) {
>               qtest_qmp_eventwait(from, "STOP");
>           }
> @@ -1239,7 +1243,6 @@ static void test_precopy_common(MigrateCommon *args)
>           qtest_qmp_eventwait(to, "RESUME");
>   
>           wait_for_serial("dest_serial");
> -        wait_for_migration_complete(from);
>       }
>   
>       if (args->finish_hook) {

Reviewed-by: Laurent Vivier <laurent@vivier.eu>


