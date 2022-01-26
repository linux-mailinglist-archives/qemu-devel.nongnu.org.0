Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 276E049C5E9
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 10:12:45 +0100 (CET)
Received: from localhost ([::1]:33522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCeM8-0006gt-6h
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 04:12:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nCeCP-0007pv-8L
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 04:02:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nCeCN-0005w8-BG
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 04:02:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643187758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bAlD8MAyqVDYJ/YegN8dS9ha0aeS7aQ8r7uwmse4Bfc=;
 b=jJPsZM9+dUbWjuPMnCB3PvDfP1fLhKD1yLXn+WkT7cInNkL+nevfYJ8TYunUkUkDkG1f6d
 75Th+K4N51OH0F9ggrDp+D0aYBt9pIpwQKHZhGy6O172KhCvQxccDxuXj5hRbcKz361In0
 72Z0tKEo3zauyPP65BaZtqxhr6A13NE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-361-F7cKu-OMNcK0Dd2bb2YCWQ-1; Wed, 26 Jan 2022 04:02:36 -0500
X-MC-Unique: F7cKu-OMNcK0Dd2bb2YCWQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 c9-20020adfa709000000b001dde29c3202so155077wrd.22
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 01:02:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bAlD8MAyqVDYJ/YegN8dS9ha0aeS7aQ8r7uwmse4Bfc=;
 b=sGNsSBtXPrZHiuIT3ZZ2rcIhnDRh5RNRpnH4S8XiVnQiWexNvUUXU+Eo98dYegqDwb
 vFxEt3W5U98Cz82IR0stJaLgZ7PK2m2qLH8Ph9YdjNdibgO/ewcFM1ThJRtIEcMyq64W
 D0VHHUFLR3LcF8JKI5h3TKTeIQvFXN1Ma23oStNNA3Ju3fyvckb+Q8olK3+AATe1otUN
 dI0SbWaJviqg1LbR/RMWVMW3RBFDqwOU5vW9OmNSNHLqrU/S98/DDPXCsSBGTgRNPGHw
 0xuUJNaj0y2JU2W5U0alsdt6luDCSnA2D6EncvL5gRTPZOlZ7M+iFkRfXX7P2868ZMsd
 8V7A==
X-Gm-Message-State: AOAM530ftA5kvoBJ3WxDrtzvdYxOt7Qyjh6kQcRoMZUt5eEf0h8I5T/l
 8NrDejQ/1yNQH+00tLvWUUkqXoyrZ8Rkmp0GNyoXGTlIt1MoH7251eMafnSQpuW/TQ5NUXId2VG
 B2+mYKWikwvHbzkA=
X-Received: by 2002:a05:6000:15ca:: with SMTP id
 y10mr406321wry.531.1643187755748; 
 Wed, 26 Jan 2022 01:02:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9PA44j0qC8YpDgfXkfmgUN6wFq1u/pxY6cVsWZaewk5ucGXWQa3/YjHwjbLl3lYb9cxUH8A==
X-Received: by 2002:a05:6000:15ca:: with SMTP id
 y10mr406269wry.531.1643187755389; 
 Wed, 26 Jan 2022 01:02:35 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id h18sm4599854wro.9.2022.01.26.01.02.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jan 2022 01:02:35 -0800 (PST)
Message-ID: <361613cb-6c40-c587-1809-8db0e5689fb4@redhat.com>
Date: Wed, 26 Jan 2022 10:02:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v6 06/33] block/block-backend.c: assertions for
 block-backend
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-7-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220121170544.2049944-7-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
> All the global state (GS) API functions will check that
> qemu_in_main_thread() returns true. If not, it means
> that the safety of BQL cannot be guaranteed, and
> they need to be moved to I/O.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   block/block-backend.c  | 79 ++++++++++++++++++++++++++++++++++++++++++
>   softmmu/qdev-monitor.c |  2 ++
>   2 files changed, 81 insertions(+)
>
> diff --git a/block/block-backend.c b/block/block-backend.c
> index 6f91dcc85d..6c80ae54cc 100644
> --- a/block/block-backend.c
> +++ b/block/block-backend.c

[...]

> @@ -1908,6 +1958,7 @@ void blk_lock_medium(BlockBackend *blk, bool locked)
>   void blk_eject(BlockBackend *blk, bool eject_flag)
>   {
>       BlockDriverState *bs = blk_bs(blk);
> +
>       char *id;
>   
>       if (bs) {

Left over hunk from when when there was an assertion added here, should 
be dropped, I believe.

Hanna


