Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBAD402A6D
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 16:10:30 +0200 (CEST)
Received: from localhost ([::1]:36922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbnx-0003cQ-VK
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 10:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNblR-0007TX-LK
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:07:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40243)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNblP-0003Du-1Y
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 10:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631023669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LcBoqnBK48C3l2C+RcDFdvuP8QxAPrz4IZknt/2gozg=;
 b=DjPOa+sHyWA0Zrh9LrJQmcrBcUX2UiqJud8DlhJTuIKRYAd/lK4We9LquQTkm8Ko8lUBse
 3e5LMa9dYN+NecNCVfaWasBh+wjfFHEgFZUW325uLHEY5CPP0MRUvjiAveyT4N7AxgOMbe
 5AbAnuag1kpmAPbb/I8/Ip5Qzs8tuTA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-295-pZPX1H8rP-uZMbIbFTmLjA-1; Tue, 07 Sep 2021 10:07:47 -0400
X-MC-Unique: pZPX1H8rP-uZMbIbFTmLjA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j33-20020a05600c48a100b002e879427915so3443683wmp.5
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 07:07:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LcBoqnBK48C3l2C+RcDFdvuP8QxAPrz4IZknt/2gozg=;
 b=dtEIDFlAlSppHL5dGL2Mha7fiMnxIb2HMDFOm+E8d9UaEMrEuukb07pNaNKs/tPxp9
 PtmZKEXj+0Um+i01PSuKyHxaDBAGJvXjQbfamrsCd89W85t4QOQxwy+9vtzHdEuMpVIZ
 B7tcEeFqOZJdxRlMMNI4O8KF7WTCwQe74MvDnW2voapg2gPVX4huuaCY68p1ZczljAMB
 zVEYUlafakjABB+ZDvtJ+FH0QNjsdezFqPkV9utpyxkAnH7aRRXsvAlwFsouvq1PIUdK
 r9f2Cdebsf7fCpcR+2OksnQQ6TmQQmM0JPR5cl/lUnRd74mccsvgK+wTSWdafGd2WK+V
 iJRQ==
X-Gm-Message-State: AOAM532kMndiZZ39VsjmYmwFDy2rnOQEz0nghwr6mmBq16dswhrT56s9
 ZzUuFRdZBSyTLBUzzFRNrKF3L71ISZLqbHNoSncIershMaud5553E0JnlaKctNLdMi+LY6PPf2C
 keszAhYcQtnsQ6Zc=
X-Received: by 2002:a1c:8096:: with SMTP id b144mr3052679wmd.189.1631023666627; 
 Tue, 07 Sep 2021 07:07:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6dh/DH17ofocpn7p9s3QC7LJ0n2hv0gaHtyyUqhfHF7DysnQlWKvcf0mNxvE6VMTHT7rcZQ==
X-Received: by 2002:a1c:8096:: with SMTP id b144mr3052661wmd.189.1631023666443; 
 Tue, 07 Sep 2021 07:07:46 -0700 (PDT)
Received: from thuth.remote.csb (pd9e8396c.dip0.t-ipconnect.de.
 [217.232.57.108])
 by smtp.gmail.com with ESMTPSA id a77sm2595058wmd.31.2021.09.07.07.07.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 07:07:45 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Update FUSE block export blog post
To: Hanna Reitz <hreitz@redhat.com>, qemu-devel@nongnu.org
References: <20210906162916.21714-1-hreitz@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8abf1571-cef6-e3ee-b2ce-1528801b4b17@redhat.com>
Date: Tue, 7 Sep 2021 16:07:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210906162916.21714-1-hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Klaus Kiwi <kkiwi@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/09/2021 18.29, Hanna Reitz wrote:
> Because I forgot to CC Thomas on the discussion adding this post, it was
> merged prematurely.  This patch updates the post to incorporate the
> feedback I received on it:
> 
> - Title change: This article mostly deals with presenting a guest image
>    in one image format as a raw image, so the title should reflect that;
>    there is much less focus on exporting block devices from a live VM
> 
> - Mention libguestfs, and contrast against it; make a note that
>    libguestfs provides security that FUSE exports cannot provide
> 
> - Have a full example in the intro, to show where we are going with this
>    post
> 
> - Some heading depths changed (nesting did not really make sense)
> 
> - Be more explicit that by "file mounts" I do not mean a filesystem with
>    a root directory and a single file in it
> 
> - Explicitly mention that "/" is a directory without a name, to
>    illustrate the fact that root nodes do not have names
> 
> - Short intro for "QEMU block exports", explaining its place in this
>    post
> 
> - Make all exports writable
> 
> - Use "exp0" as export ID to get shorter lines that fit better into 80
>    characters
> 
> - Reference the intro example in the intro of "Mounting an image on
>    itself"
> 
> - Show "qemu-fuse-disk-export.py" in *italic* instead of as `code`
>    (because I had all other command names in *italic*)
> 
> Signed-off-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   _posts/2021-08-22-fuse-blkexport.md | 145 ++++++++++++++++++++++------
>   1 file changed, 117 insertions(+), 28 deletions(-)

Thanks, changes looked fine to me, so I've pushed it now.

  Thomas


