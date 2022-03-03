Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7BD4CBC1F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 12:06:58 +0100 (CET)
Received: from localhost ([::1]:42708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPjIP-0008Bk-6f
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 06:06:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPjGr-0007E1-CY
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:05:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nPjGn-0007hD-Bp
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 06:05:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646305515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n2G0cIyikJH5VMmhdsXqqOhcbakbt9JY6SBVKaSHMho=;
 b=YaDtKBXBkAAVDdnL4Vh2EY/p6LoGLMhNH7LpO/FEWXRNtuN0Fj6rEgpQXK43Vx4DQrzd+D
 NFDmeIcATlcHfpzU8hoCAKpm4FEVv+2WWO7WGeheY+j2pH7pMMQW8X3Tf2x4DyvehfUuoR
 BWlbVHowp58OJvgblAdVneYBZEqFB+w=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-VQzNK9UZPy6xH6Z4FfluXA-1; Thu, 03 Mar 2022 06:05:14 -0500
X-MC-Unique: VQzNK9UZPy6xH6Z4FfluXA-1
Received: by mail-ej1-f70.google.com with SMTP id
 go11-20020a1709070d8b00b006cf0d933739so2547101ejc.5
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 03:05:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=n2G0cIyikJH5VMmhdsXqqOhcbakbt9JY6SBVKaSHMho=;
 b=wJQxHNri9ziWVB00lsJBuPkYU6hhJpuKvyXb2/9niTcKhdc4Gsg9Mqui5TUXzsrEzI
 QCPi5MU8l7tp6s7wJM2G4mF6Rj/OS3At1rBdWX1Yz6NowKnindVd3qM+iVUPBHOV67mo
 j/46izGsN3BIR0F+szVc/ZFDc01Wlaw8hK+ZUCd9wP56e1CV284h0nBgSO97QHdtu10q
 phAmIT464p+Qk7gg7Mtlu9kqTM1+KI3hoM/V6HG4RJt0VPzRFzwk6iZtT9MoQj8mYgzS
 1cBgDFSe4HI5Nj2B6zH5cUrnV8Y74E7SIkg8BgxAb3CUZ+Tt/LFzPVhMWEqFJPX09y/k
 P3gw==
X-Gm-Message-State: AOAM533P/O70z4xZrEnHjDlihrzAb2wWOKLh+3Kn3Bt6Da3BEGWi0LwD
 fBQGcFSSN/Bpw8EZqvh1ieL+HhT4JFIqM2d0sT0m7vu3CofbGBPqF+RslWvl0ezhdCLiUoB2IaB
 5d0dvTIeAjApxQ/Y=
X-Received: by 2002:a05:6402:1941:b0:413:2b5f:9074 with SMTP id
 f1-20020a056402194100b004132b5f9074mr34064135edz.414.1646305513497; 
 Thu, 03 Mar 2022 03:05:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxj+s7n+UVrQTytldgLylEBN8oWwspWVLwZpoOXaaieFs1Mf5U60px6ARmDRDSYnx+kYjz9AA==
X-Received: by 2002:a05:6402:1941:b0:413:2b5f:9074 with SMTP id
 f1-20020a056402194100b004132b5f9074mr34064108edz.414.1646305513251; 
 Thu, 03 Mar 2022 03:05:13 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 gs39-20020a1709072d2700b006d3ed4f51c6sm608078ejc.0.2022.03.03.03.05.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 03:05:12 -0800 (PST)
Message-ID: <6ac72250-00c9-d998-fbe7-4c8d958476d7@redhat.com>
Date: Thu, 3 Mar 2022 12:05:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 11/16] block: introduce snapshot-access block driver
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220228113927.1852146-1-vsementsov@virtuozzo.com>
 <20220228113927.1852146-12-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220228113927.1852146-12-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 armbru@redhat.com, nikita.lapshin@virtuozzo.com, stefanha@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.02.22 12:39, Vladimir Sementsov-Ogievskiy wrote:
> The new block driver simply utilizes snapshot-access API of underlying
> block node.
>
> In further patches we want to use it like this:
>
> [guest]                   [NBD export]
>     |                            |
>     | root                       | root
>     v                 file       v
> [copy-before-write]<------[snapshot-access]
>     |           |
>     | file      | target
>     v           v
> [active-disk] [temp.img]
>
> This way, NBD client will be able to read snapshotted state of active
> disk, when active disk is continued to be written by guest. This is
> known as "fleecing", and currently uses another scheme based on qcow2
> temporary image which backing file is active-disk. New scheme comes
> with benefits - see next commit.
>
> The other possible application is exporting internal snapshots of
> qcow2, like this:
>
> [guest]          [NBD export]
>     |                  |
>     | root             | root
>     v       file       v
> [qcow2]<---------[snapshot-access]
>
> For this, we'll need to implement snapshot-access API handlers in
> qcow2 driver, and improve snapshot-access block driver (and API) to
> make it possible to select snapshot by name. Another thing to improve
> is size of snapshot. Now for simplicity we just use size of bs->file,
> which is OK for backup, but for qcow2 snapshots export we'll need to
> imporve snapshot-access API to get size of snapshot.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   qapi/block-core.json    |   4 +-
>   block/snapshot-access.c | 132 ++++++++++++++++++++++++++++++++++++++++
>   MAINTAINERS             |   1 +
>   block/meson.build       |   1 +
>   4 files changed, 137 insertions(+), 1 deletion(-)
>   create mode 100644 block/snapshot-access.c

[...]

> diff --git a/block/snapshot-access.c b/block/snapshot-access.c
> new file mode 100644
> index 0000000000..77b87c1946
> --- /dev/null
> +++ b/block/snapshot-access.c

[...]

> +static int snapshot_access_open(BlockDriverState *bs, QDict *options, int flags,
> +                                Error **errp)
> +{
> +    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
> +                               BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY,
> +                               false, errp);
> +    if (!bs->file) {
> +        return -EINVAL;
> +    }
> +
> +    bs->total_sectors = bs->file->bs->total_sectors;

(If I hadn’t commented on patch 16, I wouldn’t’ve here, but now I might 
as well...)

Instead of just a comment in the commit message (which noone will really 
read later on), I prefer a TODO or FIXME comment directly here in the 
code, or even better in the API added in the previous patch (i.e. as 
part of the comment in the BlockDriver struct), that this will not work 
for qcow2, i.e. that we will need to inquire the snapshot size from the 
snapshot-providing node.

It’s OK not to implement that now, but I don’t think having a note just 
in the commit message will help us remember.

> +
> +    return 0;
> +}


