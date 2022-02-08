Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AA04AD606
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 12:14:04 +0100 (CET)
Received: from localhost ([::1]:39828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHORf-0006tz-Pk
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 06:14:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHO5Q-0002f8-Do
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:51:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nHO5K-00022s-Ou
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 05:51:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644317450;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n3fJomUeJsFV4YSM2fQLXSQFkISQr7Z9N4zPxnwIELs=;
 b=BvZLrz0/z1DbT60xl383vmaAjM5LBpUo6cWpaAt3+gOhHLCxfBM9UAV4s/FwRbZOtFdL4B
 C+NcfUfT2VImPVyYnej6sDWr/c+ZMrzluWaPhcvLhO2w9HTUg7gOJDi3E3iRUG81l4qrxB
 nJbK0JFOVP1OBqSdqD4nDfH+dDozxyM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-528-G-y_jeAtPyi8WQJueGD_Bw-1; Tue, 08 Feb 2022 05:50:49 -0500
X-MC-Unique: G-y_jeAtPyi8WQJueGD_Bw-1
Received: by mail-qt1-f198.google.com with SMTP id
 br10-20020a05622a1e0a00b002d37e07e79aso13257481qtb.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 02:50:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n3fJomUeJsFV4YSM2fQLXSQFkISQr7Z9N4zPxnwIELs=;
 b=WyCvqTOz5mYlRR+SkItbinOFhlhMOKWRsOo0l8L0TrTVb12ivWM3mJGX93h5G4eBnq
 nwlcEN9NXh4A9O5FrOR8yJizSN+4NQ05UpV2Ao6tIp6hijlC3QSd2ssLWB+/pNaK4+5u
 nobTihOfDRB8IiXLSyRijUNnfkj32BvwS916ZGQyF6+lMHanvhS50nEgsOJcJ5yyRYUt
 ed5Gg6cG6dcxRbo2ig931bqmseZOqKdhXb5O+Nq6t61AxxtX5CAiRq/nRR/JOkylYEsP
 O2qtBotJvbIBDNXrNZzsJHOi04Bb9HZ1lASEmqTx22ww+QP7IIbLc5syGxT1PHZk5GIQ
 6NbQ==
X-Gm-Message-State: AOAM531tyTjNEM2w9L32mNORAPC/Ka+gNLepNiO4BY5bDG5qt6poQAJK
 5IQq4z41/Lzt7o+XLeEDkvGs3YdjnRzxTTTPKPwudPW01xzrRChgc7IEYNQApZyCV00kJooXPOT
 YFcYBUH+gcksa9jk=
X-Received: by 2002:ac8:7c53:: with SMTP id o19mr2478317qtv.363.1644317448891; 
 Tue, 08 Feb 2022 02:50:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwt0PHQrC8xDDt88s74FTs6zmi5kP9DLTYXUCgm1jCB8SoyvLnVvkZ1/OcPcLDEwhbRetXkNg==
X-Received: by 2002:ac8:7c53:: with SMTP id o19mr2478296qtv.363.1644317448674; 
 Tue, 08 Feb 2022 02:50:48 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id y20sm5936322qtw.28.2022.02.08.02.50.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 02:50:48 -0800 (PST)
Message-ID: <24fd8d3d-3c2b-2b83-239f-2c83e368159d@redhat.com>
Date: Tue, 8 Feb 2022 11:50:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 13/33] include/block/blockjob.h: global state API
To: Kevin Wolf <kwolf@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-14-eesposit@redhat.com> <YgFWXiQgWbZeyr6v@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YgFWXiQgWbZeyr6v@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 07/02/2022 18:26, Kevin Wolf wrote:
> Am 21.01.2022 um 18:05 hat Emanuele Giuseppe Esposito geschrieben:
>> blockjob functions run always under the BQL lock.
>>
>> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
>> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
>> ---
>>  include/block/blockjob.h | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>>
>> diff --git a/include/block/blockjob.h b/include/block/blockjob.h
>> index 87fbb3985f..2373dfeb07 100644
>> --- a/include/block/blockjob.h
>> +++ b/include/block/blockjob.h
>> @@ -74,6 +74,13 @@ typedef struct BlockJob {
>>      GSList *nodes;
>>  } BlockJob;
>>  
>> +/*
>> + * Global state (GS) API. These functions run under the BQL lock.
>> + *
>> + * See include/block/block-global-state.h for more information about
>> + * the GS API.
>> + */
>> +
>>  /**
>>   * block_job_next:
>>   * @job: A block job, or %NULL.
>> @@ -155,6 +162,8 @@ BlockJobInfo *block_job_query(BlockJob *job, Error **errp);
>>   */
>>  void block_job_iostatus_reset(BlockJob *job);
>>  
>> +/* Common functions that are neither I/O nor Global State */
>> +
>>  /**
>>   * block_job_is_internal:
>>   * @job: The job to determine if it is user-visible or not.
> 
> It's a bit random to comment on it for this patch specifically, but I
> feel that the comments that separate different categories of interfaces
> in a single file are not very easy to visually register.
> 
> I don't think we're doing this anywhere yet, but I wonder if it wouldn't
> be helpful to use a comment style like this which gives more visibility
> to the start and end of sections:
> 
> /***********************************************************************
>  * Common functions that are neither I/O nor Global State
>  */
> 
> Not sure what checkpatch thinks about it either... ;-)

Checkpatch does not like that:

WARNING: Block comments use a leading /* on a separate line

+/**************************************************************

But adding it like that would be ok
+/*
+ **************************************************************

I honestly don't find it very beautiful, but let me know if I should add it.

Emanuele

> 
> Kevin
> 


