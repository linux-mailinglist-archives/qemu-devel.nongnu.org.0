Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D8A4395AF
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 14:09:55 +0200 (CEST)
Received: from localhost ([::1]:47794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meynZ-0002HT-Kg
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 08:09:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1meyiP-0007Ji-19
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:04:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1meyiI-0001Jp-TH
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 08:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635163462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=me/0FqZAkCAls28xVT+1aWeTAOWlThUTDl9itDqXvCc=;
 b=itZx7CHILqT8pyiR4ettddEZBTJYvJZ/4FT4GqKkYAdMQaOlZ/D1UG2IV943mRj1kBlOwj
 K2CoAIGqiKH8jOSGS1CtOcRwa1W7LbX9xMctkMRwHThH5OYM2cP4/hh24lXcK+853PunEV
 BwWxYA7S6+uCGmhFCJ1fQLole1DcYNc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-kArHk3hgOny3qiALdLKd1Q-1; Mon, 25 Oct 2021 08:04:21 -0400
X-MC-Unique: kArHk3hgOny3qiALdLKd1Q-1
Received: by mail-wm1-f72.google.com with SMTP id
 c128-20020a1c9a86000000b0032cbafd99a2so371029wme.1
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 05:04:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=me/0FqZAkCAls28xVT+1aWeTAOWlThUTDl9itDqXvCc=;
 b=b/GLeYcIq1P8IIztyQh58SHaEQgVvMNnuAprOa/H3kdWF3Z0p1jCh9b/znhJHnsc1N
 KMbmvmW413Lh7duLzqlBXBCruoU6QfS4PbUELitu0eH+4g9x1YMYrsD1Cyk74Hw8Zada
 A2UQZk69Mreh2SXXI6M/jCgonW5RCcafdfAavh23UFiXvlOBXTRHyB7fMtvyOM4Nth6t
 Es/Lukzt0pfTIK2W+6lSMarjC/O32a0KHXLZOh7cOHIYdndsdMJNV0DkwEq+EYinZxbj
 ecONv3goGFWLCp1g1FUUBjBIjxFSGTUw+N3R1icw/Mm04Zn1W+tayC1lsALJJGD3Gzp+
 StAA==
X-Gm-Message-State: AOAM5320RSn4UBaxqJcJJgDFWb08QAs5KkMaCmpa9kBTQ6SRvKZ6pbBy
 FAkn1N39Q5uoxHW77S16GVHwVFarlrx9WA266jIY+g6EWEQ50m5nddzOQy1lhesapvS8Kz+GajO
 V5wzedN7jc99P1b4=
X-Received: by 2002:a05:600c:2481:: with SMTP id
 1mr4300522wms.96.1635163459645; 
 Mon, 25 Oct 2021 05:04:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRWydD6sSc1lXRtQ44GqXBlIqub35gU252y4SdN8VoRXXWFs6/VHewLivI1PT7usMVCAs2XA==
X-Received: by 2002:a05:600c:2481:: with SMTP id
 1mr4300486wms.96.1635163459385; 
 Mon, 25 Oct 2021 05:04:19 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id l5sm16416419wru.24.2021.10.25.05.04.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 05:04:18 -0700 (PDT)
Message-ID: <b7f81a39-ffa5-a8f0-1629-7893a1ce5c2f@redhat.com>
Date: Mon, 25 Oct 2021 14:04:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 6/9] qapi: Generalize command policy checking
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
References: <20211025052532.3859634-1-armbru@redhat.com>
 <20211025052532.3859634-7-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211025052532.3859634-7-armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, berrange@redhat.com,
 ehabkost@redhat.com, qemu-block@nongnu.org, quintela@redhat.com,
 libvir-list@redhat.com, jsnow@redhat.com, mdroth@linux.vnet.ibm.com,
 dgilbert@redhat.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 07:25, Markus Armbruster wrote:
> The code to check command policy can see special feature flag
> 'deprecated' as command flag QCO_DEPRECATED.  I want to make feature
> flag 'unstable' visible there as well, so I can add policy for it.
> 
> To let me make it visible, add member @special_features (a bitset of
> QapiSpecialFeature) to QmpCommand, and adjust the generator to pass it
> through qmp_register_command().  Then replace "QCO_DEPRECATED in
> @flags" by QAPI_DEPRECATED in @special_features", and drop
> QCO_DEPRECATED.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  include/qapi/qmp/dispatch.h          | 5 +++--
>  monitor/misc.c                       | 6 ++++--
>  qapi/qmp-dispatch.c                  | 2 +-
>  qapi/qmp-registry.c                  | 4 +++-
>  storage-daemon/qemu-storage-daemon.c | 3 ++-
>  scripts/qapi/commands.py             | 9 ++++-----
>  6 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/include/qapi/qmp/dispatch.h b/include/qapi/qmp/dispatch.h
> index 0ce88200b9..1e4240fd0d 100644
> --- a/include/qapi/qmp/dispatch.h
> +++ b/include/qapi/qmp/dispatch.h
> @@ -25,7 +25,6 @@ typedef enum QmpCommandOptions
>      QCO_ALLOW_OOB             =  (1U << 1),
>      QCO_ALLOW_PRECONFIG       =  (1U << 2),
>      QCO_COROUTINE             =  (1U << 3),
> -    QCO_DEPRECATED            =  (1U << 4),
>  } QmpCommandOptions;
>  
>  typedef struct QmpCommand
> @@ -34,6 +33,7 @@ typedef struct QmpCommand
>      /* Runs in coroutine context if QCO_COROUTINE is set */
>      QmpCommandFunc *fn;
>      QmpCommandOptions options;
> +    unsigned special_features;
>      QTAILQ_ENTRY(QmpCommand) node;
>      bool enabled;
>      const char *disable_reason;
> @@ -42,7 +42,8 @@ typedef struct QmpCommand
>  typedef QTAILQ_HEAD(QmpCommandList, QmpCommand) QmpCommandList;
>  
>  void qmp_register_command(QmpCommandList *cmds, const char *name,
> -                          QmpCommandFunc *fn, QmpCommandOptions options);
> +                          QmpCommandFunc *fn, QmpCommandOptions options,
> +                          unsigned special_features);

What about:

  typedef unsigned QapiFeatureMask;

?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


