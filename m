Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B60253FE6C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 14:10:56 +0200 (CEST)
Received: from localhost ([::1]:53818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyY2w-0003wM-AF
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 08:10:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyWpm-00008r-HA
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:53:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nyWpk-0003Gc-N1
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 06:53:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654599191;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lnEZ0k72FBMOZ55k51pIraCdSv8R5V+53M0efGL2VOg=;
 b=TQfemKdq8Ibs7ciI+KZ7v/XNX4EdixDV7AY6hdNP9FnRgdVqdaguTGq4RiMTtR3aK4aOWt
 YDEGXpMUkCq84TL+ZxaLWURZfk7YZcvh6nMZgBGReQGbW5xiy2/4LdqgTlU3ihm0MPnRyM
 lDLia53ZwUt0RoQAdao72jgk5VOh9Fk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-GGKKUEiLMSmFb0IhgNmmcQ-1; Tue, 07 Jun 2022 06:53:11 -0400
X-MC-Unique: GGKKUEiLMSmFb0IhgNmmcQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 p10-20020adfaa0a000000b0020c4829af5fso3754676wrd.16
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 03:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lnEZ0k72FBMOZ55k51pIraCdSv8R5V+53M0efGL2VOg=;
 b=n+SyiBu4j+S1YJ+rHSZ0YNKaK9p0Q8Kh4uIP9Jsr9nlTaIlAxruGr0Y0VNE/S7uCtb
 FznRcuDczK5k1c8jHQT/oKfPSKC/IEyqH2EVlP+fNehxuZO6rbtoiX40ysaZk4z/qgxI
 mfabq7rHFYG93t0hJpw67i/pTDJu2wi2nFPcNiGyH2A+4pbTTpIkL1hqhwvNz65qCN8o
 80FJBTdAHpRPXKpHjV7Vrxo3q1FJy3OVc6Ql4X3lwYn7twhqmv8vn6mBc9cI7SggcO3Z
 2Kv0fbEC0GIfUMWapAJhkGbO7WvpbCjzDCXI9t5RGb87Lxz2VrIwber256E4STkyqyhV
 iIIQ==
X-Gm-Message-State: AOAM531FYrSLp9NgT6B3fPI/P8RAYAwcVYCLUypoAx8szBZnZ3OeS2rW
 GjCMvqOZB+kCIDvH9nTP1Aj3aovU6N8h8utOu5agr4ue95rChO7QygaA9XBkLmmCtVzOtzn+Shd
 WURp+bEBkYL3eOMU=
X-Received: by 2002:a5d:6283:0:b0:213:b939:826d with SMTP id
 k3-20020a5d6283000000b00213b939826dmr22578916wru.543.1654599189110; 
 Tue, 07 Jun 2022 03:53:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhR8zht2/ze409EVf9ejjiCHPWxpDiOwtl/tpPqKA7YawD0y0ZljMB0sqWLTBRKAOSf+V1ow==
X-Received: by 2002:a5d:6283:0:b0:213:b939:826d with SMTP id
 k3-20020a5d6283000000b00213b939826dmr22578893wru.543.1654599188847; 
 Tue, 07 Jun 2022 03:53:08 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 63-20020a1c1942000000b003974cb37a94sm23786657wmz.22.2022.06.07.03.53.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 03:53:08 -0700 (PDT)
Message-ID: <bbe8b25e-d72a-fb01-2b8a-7edfb4e587cf@redhat.com>
Date: Tue, 7 Jun 2022 12:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v5 04/45] test-bdrv-graph-mod: update
 test_parallel_perm_update test case
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru
References: <20220330212902.590099-1-vsementsov@openvz.org>
 <20220330212902.590099-5-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220330212902.590099-5-vsementsov@openvz.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
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
> test_parallel_perm_update() does two things that we are going to
> restrict in the near future:
>
> 1. It updates bs->file field by hand. bs->file will be managed
>     automatically by generic code (together with bs->children list).
>
>     Let's better refactor our "tricky" bds to have own state where one
>     of children is linked as "selected".
>     This also looks less "tricky", so avoid using this word.
>
> 2. It create FILTERED children that are not PRIMARY. Except for tests
>     all FILTERED children in the Qemu block layer are always PRIMARY as
>     well.  We are going to formalize this rule, so let's better use DATA
>     children here.

Another thing is that any node may have at most one FILTERED child at a 
time, which was already formalized in BDRV_CHILD_FILTERED’s description.

> While being here, update the picture to better correspond to the test
> code.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
> ---

The change looks good, I’m just a bit confused when it comes to the 
comment describing what’s going on.

>   tests/unit/test-bdrv-graph-mod.c | 70 ++++++++++++++++++++------------
>   1 file changed, 44 insertions(+), 26 deletions(-)
>
> diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
> index a6e3bb79be..40795d3c04 100644
> --- a/tests/unit/test-bdrv-graph-mod.c
> +++ b/tests/unit/test-bdrv-graph-mod.c

[...]

> @@ -266,15 +280,18 @@ static BlockDriver bdrv_write_to_file = {
>    * The following test shows that topological-sort order is required for
>    * permission update, simple DFS is not enough.
>    *
> - * Consider the block driver which has two filter children: one active
> - * with exclusive write access and one inactive with no specific
> - * permissions.
> + * Consider the block driver (write-to-selected) which has two children: one is
> + * selected so we have exclusive write access to it and for the other one we
> + * don't need any specific permissions.
>    *
>    * And, these two children has a common base child, like this:
> + *   (additional "top" on top is used in test just because the only public
> + *    function to update permission should get a specific child to update.
> + *    Making bdrv_refresh_perms() public just for this test doesn't worth it)

s/doesn't/isn't/

>    *
> - * ┌─────┐     ┌──────┐
> - * │ fl2 │ ◀── │ top  │
> - * └─────┘     └──────┘
> + * ┌─────┐     ┌───────────────────┐     ┌─────┐
> + * │ fl2 │ ◀── │ write-to-selected │ ◀── │ top │
> + * └─────┘     └───────────────────┘     └─────┘
>    *   │           │
>    *   │           │ w
>    *   │           ▼
> @@ -290,7 +307,7 @@ static BlockDriver bdrv_write_to_file = {
>    *
>    * So, exclusive write is propagated.
>    *
> - * Assume, we want to make fl2 active instead of fl1.
> + * Assume, we want to select fl2  instead of fl1.

There’s a double space after “fl2”.

>    * So, we set some option for top driver and do permission update.

Here and in the rest of the comment, it’s now unclear what node “top” 
refers to.  I think it’s still the now-renamed “write-to-selected” node, 
right?  But “top” is now a different node, so I’m not 100% sure.

(On the other hand, even before this patch, there was a “top” node that 
was distinct from the former “tricky” node...  So it seems like this 
comment was already not quite right before?)

>    *
>    * With simple DFS, if permission update goes first through


