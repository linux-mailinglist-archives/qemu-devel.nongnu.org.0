Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E911449CA1C
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 13:55:30 +0100 (CET)
Received: from localhost ([::1]:34166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nChph-0007E4-GB
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 07:55:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nChdC-00043o-1e
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 07:42:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27388)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nChd8-0005em-7z
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 07:42:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643200948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=09Hd0jZQR/0vc9lp6warzEkjmHBJGYnfUNiAatrBt+c=;
 b=UK5uHD3aDo1T92eIp2VJFhBqdHa9f/r9c9uBjT4EzHZewrivMb+d4yC1SJXrWClqxCqjk1
 EZ7ZQ3HbDmscGXwbJcoor2iwQLMZ0PFrNdzlFQPbCeSf/BtrH/g8nBV+yRumbRWGCJWA5/
 28awFfM0h4NsFBHH5kCxN/I3gvRUwGo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-upXyW-zkMDaywYUqtsYs9w-1; Wed, 26 Jan 2022 07:42:27 -0500
X-MC-Unique: upXyW-zkMDaywYUqtsYs9w-1
Received: by mail-wr1-f72.google.com with SMTP id
 x4-20020adfbb44000000b001d83e815683so4242834wrg.8
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 04:42:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=09Hd0jZQR/0vc9lp6warzEkjmHBJGYnfUNiAatrBt+c=;
 b=2WQtprLSnZ+mlGUzR2/8CK9+EFphJfYbnVNlHH6RdoNxKV5n6+ZFzg3RSGpMGSgp4H
 ULfPJeJbtxFZjAt1FqVkruAbkNX4PDeGjQdM50hnx46OKz+DrYweuKCzIYsIGag/cEW3
 woV4gZzeILS1+ZynJiG9tG58fLyvs36QxVmMOfxnWgeY3yGnRlY2f+SxCnwQarR+sOoP
 iCx6kWy8LINVPzh0f8RloudFEKap5wUuqtjX/ksDPAt5PwTmV9eoReHzRwqwi8gnzdI7
 qPeDy7CDXqBHZLs5nbtsR/Q+uhdPipMGstg6rhD8jPwrb/a6cJDqWKApRO2DZS8onrGW
 WzWw==
X-Gm-Message-State: AOAM533avYoBQdrIo/sIgb0vKfDV+laOIVaM11HwU62CtlOSYc+ycR8h
 QO3L16dtSroqBTiREqiWS+41opbGO6A9jPW/UsQZtoepjAhDCIeCc1Lo33JfS5rmkPUfSq/1qF4
 la+1KhZGdQ02sq74=
X-Received: by 2002:a05:600c:4ec7:: with SMTP id
 g7mr7240415wmq.171.1643200946059; 
 Wed, 26 Jan 2022 04:42:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw1HQ7sO8mcvJ47KIiKXbUxMtq9IwKRRTv9xxqRXfy3I3AV6MjFJG04bXO40bB29IMAyhhkGQ==
X-Received: by 2002:a05:600c:4ec7:: with SMTP id
 g7mr7240385wmq.171.1643200945789; 
 Wed, 26 Jan 2022 04:42:25 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id d4sm4205868wri.39.2022.01.26.04.42.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 04:42:25 -0800 (PST)
Message-ID: <7d57ef24-25f9-da57-fb90-27783c9436ab@redhat.com>
Date: Wed, 26 Jan 2022 13:42:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v6 25/33] block_int-common.h: split function pointers in
 BdrvChildClass
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-26-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220121170544.2049944-26-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 John Snow <jsnow@redhat.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21.01.22 18:05, Emanuele Giuseppe Esposito wrote:
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   include/block/block_int-common.h | 67 +++++++++++++++++++-------------
>   1 file changed, 40 insertions(+), 27 deletions(-)
>
> diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
> index e007dbf768..cc8c8835ba 100644
> --- a/include/block/block_int-common.h
> +++ b/include/block/block_int-common.h
> @@ -815,12 +815,16 @@ struct BdrvChildClass {
>        */
>       bool parent_is_bds;
>   
> +    /*
> +     * Global state (GS) API. These functions run under the BQL lock.
> +     *
> +     * See include/block/block-global-state.h for more information about
> +     * the GS API.
> +     */
>       void (*inherit_options)(BdrvChildRole role, bool parent_is_format,
>                               int *child_flags, QDict *child_options,
>                               int parent_flags, QDict *parent_options);
> -
>       void (*change_media)(BdrvChild *child, bool load);
> -    void (*resize)(BdrvChild *child);
>   
>       /*
>        * Returns a name that is supposedly more useful for human users than the

The method this comment belongs to is `.get_name()`.  It’s exposed 
through `bdrv_get_parent_name()`, which is called by 
`bdrv_get_device_name()` and `bdrv_get_device_or_node_name()` – so I 
think it should be classified as I/O.

> @@ -837,6 +841,40 @@ struct BdrvChildClass {
>        */
>       char *(*get_parent_desc)(BdrvChild *child);

This function is very similar, so we might also want to reconsider 
classifying it as I/O.  There’s no need, because all of its callers do 
run in the main thread, but at the same time I don’t believe there’s 
anything stopping us (and it starts to sound to me like all functions of 
the “get name” kind perhaps should ideally be I/O, in that they 
shouldn’t require the GS context).

Up to you. O:)

(Rest of this patch looks good!)

Hanna


