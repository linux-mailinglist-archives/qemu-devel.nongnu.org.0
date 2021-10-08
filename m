Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4756542652E
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 09:23:12 +0200 (CEST)
Received: from localhost ([::1]:44806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYkDn-0001kE-Ba
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 03:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYkBW-0007WV-Ii
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 03:20:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mYkBS-0008JD-U1
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 03:20:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633677643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p/KPfQJX0pfmAImPdFOGiX1wUDh5DDMtKjVERHcyUqo=;
 b=e4bHqNWaPC5lQf/f+XOZbXCQ4+BYsblCeYmcGNvzwiujI5R695VZxFB1Jxwgcdal+AJ3eG
 I74fq13p+WPBDnwm7ywiRR7Fowhp2egaQ8dmrANbl7VBeT+Wsr0wVVoHSyJc7lM/cFN6Ic
 j84MVW3TjzJB+g7RhEGtPBQFvMZ0V1o=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-OyE3_6r2ObiIiqsPH41Ipg-1; Fri, 08 Oct 2021 03:20:40 -0400
X-MC-Unique: OyE3_6r2ObiIiqsPH41Ipg-1
Received: by mail-ed1-f72.google.com with SMTP id
 1-20020a508741000000b003da559ba1eeso8340350edv.13
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 00:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p/KPfQJX0pfmAImPdFOGiX1wUDh5DDMtKjVERHcyUqo=;
 b=y5o8zAuL2TeaK1BBPPXBtrtuOuf197G/BxlPtmGgDrtULyIh8kwdWAGvDmGdOoYi8/
 r9qUO7aqiQU8H3VyHevSBM6WueOL1iH0AfggQ28r4CsKliTtB2RJs3D6lty+gLR4im1O
 VQMZuq5IWJbJNVged3En0xUbfkngEOogdcAX+TV13nZ9SaQyLAyOFnY7nANcYImkZkyi
 T0MiZZuVZTi8xfZcztN0AyRj10FFPprpmbpoxcL/JxkG1El8g4Xl09jV3dMzBLURo2vD
 xJNUMaywDzRCPKTPBiKxGWuxkVdC3VS/gaRNrD2S0xTNOefPjzcpPWLCJp0OPHLKXx+6
 1U1g==
X-Gm-Message-State: AOAM530inNKZ0r+w4/Gspwd3xZvFQnzrX5Do5oCzV2PpNHYjo3gT6xBy
 JpJrotHDkHvPaJt/2xewrrHy1Zea+DBD68rqTsjz/jR1+1bWuyQamrCzQcKtJ0Kkc4dyZhjcmKW
 RlOQZcpQc09sZDcjm3s6mcD7L2WA57PQliC59K6uhNhRo4iwv2WqVyTDub660uqSCLDU=
X-Received: by 2002:a17:906:6448:: with SMTP id
 l8mr2187355ejn.301.1633677639124; 
 Fri, 08 Oct 2021 00:20:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrRL+TGBnCNjNhI98ZysZmtGfmrCfyzUqL7PrDMpuMgnn5ZHk/BFGwTe39lGAWrhewF4mHlQ==
X-Received: by 2002:a17:906:6448:: with SMTP id
 l8mr2187320ejn.301.1633677638895; 
 Fri, 08 Oct 2021 00:20:38 -0700 (PDT)
Received: from localhost.localdomain ([213.55.224.75])
 by smtp.gmail.com with ESMTPSA id q10sm600432ejt.121.2021.10.08.00.20.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Oct 2021 00:20:38 -0700 (PDT)
Subject: Re: [RFC PATCH v2 11/25] include/block/blockjob.h: global state API
To: Stefan Hajnoczi <stefanha@redhat.com>
References: <20211005143215.29500-1-eesposit@redhat.com>
 <20211005143215.29500-12-eesposit@redhat.com>
 <YV8C+W7PQkVI4+gR@stefanha-x1.localdomain>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <dc0ca1d9-1dd6-c139-394a-7d5671289d47@redhat.com>
Date: Fri, 8 Oct 2021 09:20:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YV8C+W7PQkVI4+gR@stefanha-x1.localdomain>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>> +/*
>> + * Global state (GS) API. These functions run under the BQL lock.
>> + *
>> + * If a function modifies the graph, it also uses drain and/or
>> + * aio_context_acquire/release to be sure it has unique access.
>> + * aio_context locking is needed together with BQL because of
>> + * the thread-safe I/O API that concurrently runs and accesses
>> + * the graph without the BQL.
>> + *
>> + * It is important to note that not all of these functions are
>> + * necessarily limited to running under the BQL, but they would
>> + * require additional auditing and may small thread-safety changes
>> + * to move them into the I/O API. Often it's not worth doing that
>> + * work since the APIs are only used with the BQL held at the
>> + * moment, so they have been placed in the GS API (for now).
>> + *
>> + * All functions below must use this assertion:
>> + * g_assert(qemu_in_main_thread());
>> + * to catch when they are accidentally called without the BQL.
>> + */
> 
> This is comment is duplicated in many places. I suggest explaining it in
> one place and using references in the other files:
> 
>    /*
>     * Global state (GS) API. These functions run under the BQL lock.
>     *
>     * See include/block/block.h for more information about the GS API.
>     */
> 

Good idea. Should I also do that for I/O, or it's not worth for very few 
lines?

Thank you,
Emanuele


