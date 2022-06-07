Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDCF54005C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 15:44:44 +0200 (CEST)
Received: from localhost ([::1]:37592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyZVi-0008Qs-Oh
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 09:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyZTf-0007Wu-Ti
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 09:42:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyZTd-0002XA-81
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 09:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654609352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C+g5Dylw/CWDQ4xk1lGH3h2tf6kjN2urgB0bwbNP9rI=;
 b=DmUk2LMwtd+/BTYa+f6SvcsM7PqsCyLXTertG7v21dfymtbiHrVIhwt8cqtC7jekB5hcOh
 FI2N8PH4qgTzdTrwnPijBOVis3W+Mi1uFvBQBj1bR1h8ps1aDaXixgFV2lKT24nsb9iS1+
 IWMbH5rM/mULPCp6YuCNabFm4hwhszE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-dyZ0OPT8MDuEXYwNd1BbHA-1; Tue, 07 Jun 2022 09:42:31 -0400
X-MC-Unique: dyZ0OPT8MDuEXYwNd1BbHA-1
Received: by mail-wr1-f71.google.com with SMTP id
 h2-20020adfe982000000b002102da95c71so3909379wrm.23
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 06:42:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C+g5Dylw/CWDQ4xk1lGH3h2tf6kjN2urgB0bwbNP9rI=;
 b=6qs1wwhQqeUR4arLf1qSr2k8zCtYB3BGKiD9lHbhk+jWkfm5uF3fITSNSbaOpaHHIS
 Jqsg5fPjARbo9RDWk85DIuyMS9yoM58CW8n424sYzc2DLd41s3x9kD73dJmA6cjwk/IB
 xE78u/4nKpLqbmy0pElljgAEDxFNcsYrI74bx6mSptGRyYEtJRzg2+B471q6bXVz3XhA
 sFrKtl+wdHW16Sm4/316I9sqDulrcjOfiEQhfVee0qgCLZRRNfrCuziAFCrx9x2wcl/s
 Tr6hy2phtAAID3ZgbehUe3J/ELCPGrmkEWvNVvbJd8vDeZTHf3pPDkMvKIY2PLTo3FAB
 SewQ==
X-Gm-Message-State: AOAM533SLT9fBQAgLosL3FkTzKbDpcij5NfXdsn/hODcFcl1CALC+jqE
 3JCSYYcJf1CMSAq6oSgIOcodFAFu82cLgm8JumePGY0/3mYBGg3uFxRcQxjqPPSCJ6MNdvhfWYu
 nzoWHdpb8uKXGr3o=
X-Received: by 2002:a7b:c401:0:b0:397:26fb:ebf7 with SMTP id
 k1-20020a7bc401000000b0039726fbebf7mr29280609wmi.90.1654609349885; 
 Tue, 07 Jun 2022 06:42:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/urRKROzGDHq4FbKEdgy8/1ZXVwSpmyMqUvupKcIm/Gj5AiL/Tqa0iVqmRd8ZIAEBdfPyqw==
X-Received: by 2002:a7b:c401:0:b0:397:26fb:ebf7 with SMTP id
 k1-20020a7bc401000000b0039726fbebf7mr29280582wmi.90.1654609349662; 
 Tue, 07 Jun 2022 06:42:29 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002100316b126sm18565910wru.6.2022.06.07.06.42.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 06:42:29 -0700 (PDT)
Message-ID: <92f0e0ec-6e96-ea70-a024-db8e225e0095@redhat.com>
Date: Tue, 7 Jun 2022 15:42:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 08/45] block/snapshot: stress that we fallback to
 primary child
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-9-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-9-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 30.03.22 23:28, Vladimir Sementsov-Ogievskiy wrote:
> Actually what we chose is a primary child. Let's stress it in the code.
>
> We are going to drop indirect pointer logic here in future. Actually
> this commit simplifies the future work: we drop use of indirection in
> the assertion now.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---
>   block/snapshot.c | 30 ++++++++++--------------------
>   1 file changed, 10 insertions(+), 20 deletions(-)
>
> diff --git a/block/snapshot.c b/block/snapshot.c
> index d6f53c3065..f4ec4f9ef3 100644
> --- a/block/snapshot.c
> +++ b/block/snapshot.c
> @@ -161,21 +161,14 @@ bool bdrv_snapshot_find_by_id_and_name(BlockDriverState *bs,
>   static BdrvChild **bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
>   {
>       BdrvChild **fallback;
> -    BdrvChild *child;
> +    BdrvChild *child = bdrv_primary_child(bs);
>   
> -    /*
> -     * The only BdrvChild pointers that are safe to modify (and which
> -     * we can thus return a reference to) are bs->file and
> -     * bs->backing.
> -     */
> -    fallback = &bs->file;
> -    if (!*fallback && bs->drv && bs->drv->is_filter) {
> -        fallback = &bs->backing;
> -    }
> -
> -    if (!*fallback) {
> +    /* We allow fallback only to primary child */
> +    if (!child) {
>           return NULL;
>       }
> +    fallback = (child == bs->file ? &bs->file : &bs->backing);
> +    assert(*fallback == child);
>   
>       /*
>        * Check that there are no other children that would need to be
> @@ -309,15 +302,12 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
>           }
>   
>           /*
> -         * fallback_ptr is &bs->file or &bs->backing.  *fallback_ptr
> -         * was closed above and set to NULL, but the .bdrv_open() call
> -         * has opened it again, because we set the respective option
> -         * (with the qdict_put_str() call above).
> -         * Assert that .bdrv_open() has attached some child on
> -         * *fallback_ptr, and that it has attached the one we wanted
> -         * it to (i.e., fallback_bs).
> +         * fallback was a primary child. It was closed above and set to NULL,
> +         * but the .bdrv_open() call has opened it again, because we set the
> +         * respective option (with the qdict_put_str() call above).
> +         * Assert that .bdrv_open() has attached some BDS as primary child.

s/some/the right/?

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

>            */
> -        assert(*fallback_ptr && fallback_bs == (*fallback_ptr)->bs);
> +        assert(bdrv_primary_bs(bs) == fallback_bs);
>           bdrv_unref(fallback_bs);
>           return ret;
>       }


