Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9E33C9C4D
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 12:01:16 +0200 (CEST)
Received: from localhost ([::1]:53330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3yB9-0007Q3-0F
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 06:01:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m3y9O-00067b-KN
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 05:59:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m3y9L-0000Kt-Ew
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 05:59:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626343160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GoP7TJWd7rcEFC7d4j69MM97b1JGnR/Q8LTdpP2oQfw=;
 b=eZvfZAva4po7+7pm/vNsN73FSnZz/a7h7248G1wqsQiJnIKkQTNCoWMrkqhsqOpQ0yb0Hn
 IAOTzGOhzLNByxlZaUW2XVTvBM7sU7G9lrjst8Eho9WdPVZhuufX7J9tfQqKuDrffJl95T
 I/QM16iZKmXU2BLiUfZXxSQnv9GQ/ZI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-cvBiTx0DObeoc5am9uDhlQ-1; Thu, 15 Jul 2021 05:59:19 -0400
X-MC-Unique: cvBiTx0DObeoc5am9uDhlQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 y15-20020a5d614f0000b029013cd60e9baaso3069152wrt.7
 for <qemu-devel@nongnu.org>; Thu, 15 Jul 2021 02:59:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=GoP7TJWd7rcEFC7d4j69MM97b1JGnR/Q8LTdpP2oQfw=;
 b=mHlmdQt6j6Yl9NUGdV/vPTxci0FYTmEuAT19VWvi9c+39DjvzyLEMRzjN2TAkd8lbk
 InYB4zmE4Hf5eAqGZOBQUSAEiuAsBc5S1XZkm9NYgWIw88ociF3E44pH5kiWvFMKArQh
 i/LKidVxQ8MNSfn1VTBaN5aYoojEDzDc2ehNwkuiVbTz2W/62tDGS/6CjICyQkf4TaIi
 u06N4Kx+pDfxnX2XGtfEhr7W0OvPDOMfyLCgYOlO1j2v32CJYDHD8ZFuhKCtf8rFjPs+
 V1DNs3H93SnGW6Ddt37f0/CYWq+N017Zqu2UX6kjzmWW1Mbm4RtoW9Otpc7qdMVGbxza
 QTXw==
X-Gm-Message-State: AOAM532l8Wn2q8tTGVTKuAP4vID8RLPHDzh+ov3GdFXiCXuErIkbyfEF
 8/yIT5GP4bc+/rDJK0su40T0DfZvG6gVJFysh0dKv43MtmXhePpgFenPhtS1qOyJouto08M53y2
 F0kNgb2V9ms7/OqRiMHh4HuylYxHyFKQe1n0Zh71LBPJ44XB/mSUgWu7bxBjnJDZ8
X-Received: by 2002:a1c:9d46:: with SMTP id g67mr9698427wme.188.1626343158060; 
 Thu, 15 Jul 2021 02:59:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz2LiRoiz2JIzbGnDQf0AqzwvW0w+Bt3elU0/TI37N3eZ/nq13WAjb9O1QjaAZgpkrrCJpQKA==
X-Received: by 2002:a1c:9d46:: with SMTP id g67mr9698405wme.188.1626343157812; 
 Thu, 15 Jul 2021 02:59:17 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 f7sm5805677wru.11.2021.07.15.02.59.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Jul 2021 02:59:17 -0700 (PDT)
From: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH v5 2/6] blkdebug: move post-resume handling to
 resume_req_by_tag
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210614082931.24925-1-eesposit@redhat.com>
 <20210614082931.24925-3-eesposit@redhat.com>
Message-ID: <8e8af35c-cae4-65f4-f8eb-0b4b938cc2d2@redhat.com>
Date: Thu, 15 Jul 2021 11:59:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210614082931.24925-3-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.06.21 10:29, Emanuele Giuseppe Esposito wrote:
> We want to move qemu_coroutine_yield() after the loop on rules,
> because QLIST_FOREACH_SAFE is wrong if the rule list is modified
> while the coroutine has yielded.  Therefore move the suspended
> request to the heap and clean it up from the remove side.
> All that is left is for blkdebug_debug_event to handle the
> yielding.
>
> Co-developed-by: Paolo Bonzini<pbonzini@redhat.com>
> Signed-off-by: Emanuele Giuseppe Esposito<eesposit@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> ---
>   block/blkdebug.c | 31 ++++++++++++++++++-------------
>   1 file changed, 18 insertions(+), 13 deletions(-)
>
> diff --git a/block/blkdebug.c b/block/blkdebug.c
> index 5ccbfcab42..e8fdf7b056 100644
> --- a/block/blkdebug.c
> +++ b/block/blkdebug.c
> @@ -775,25 +775,20 @@ static void blkdebug_close(BlockDriverState *bs)
>   static void suspend_request(BlockDriverState *bs, BlkdebugRule *rule)
>   {
>       BDRVBlkdebugState *s = bs->opaque;
> -    BlkdebugSuspendedReq r;
> +    BlkdebugSuspendedReq *r;
>   
> -    r = (BlkdebugSuspendedReq) {
> -        .co         = qemu_coroutine_self(),
> -        .tag        = g_strdup(rule->options.suspend.tag),
> -    };
> +    r = g_new(BlkdebugSuspendedReq, 1);
> +
> +    r->co         = qemu_coroutine_self();
> +    r->tag        = g_strdup(rule->options.suspend.tag);

Not wrong, but just as a note: I personally would have done the 
initialization like

*r = (BlkdebugSuspendedReq) {
     .co = ...,
     .tag = ...,
};

The advantage is that this sets all fields that aren’t mentioned to zero 
(kind of important, because you don’t use g_new0(), and so now I have to 
manually verify that there are no other fields that would need to be 
initialized (which there aren’t)), and in this special case the diff 
stat also would have been smaller. (But that’s a rare coincidence.)

There are no other fields besides the list entry object (which is fully 
overwritten by QLIST_INSERT_HEAD()), though, so this patch is correct 
and I’m happy with it as-is.

Max


