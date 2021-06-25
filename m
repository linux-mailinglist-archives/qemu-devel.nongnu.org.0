Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B64453B3F71
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:39:34 +0200 (CEST)
Received: from localhost ([::1]:53952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhN7-00053V-Po
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:39:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwhL9-0002Yh-J0
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:37:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwhL5-0007Qa-Le
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:37:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624610245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZdLSOYy+wDBAlNBopQ08lt1M2uWcLISEoPlOmnFTnzM=;
 b=EcL6iDnMMI9RQzQRZMFXkkmJXegTpo6Ckq4I6IFthiu9gBckohD27+AWa2hzkzUmCM3Du1
 1eHsxiIyUR85JmkRL5A3RAYxRrSeZM6J3nxTGzs1mqsWGjDMWrkfJIV8pGPrDhv29/EBnB
 OMqcXIMxqsxbr9oJyIQLX4UGXhCosb8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-H0VVvWzxMiSE7s9I_BwrJw-1; Fri, 25 Jun 2021 04:37:22 -0400
X-MC-Unique: H0VVvWzxMiSE7s9I_BwrJw-1
Received: by mail-ej1-f70.google.com with SMTP id
 f8-20020a1709064dc8b02904996ccd94c0so2852075ejw.9
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 01:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ZdLSOYy+wDBAlNBopQ08lt1M2uWcLISEoPlOmnFTnzM=;
 b=HIcvws5jn6u9DOKrgi3Q9TUfktRrNpdRVsm9540O4NQ1qgfEwc1JaQYmkC1xVOQZBh
 m4d+P0rJeo6A/vJfbYTtTlEx8bc7ckLuHP2cZNm8PmXs4qq9sBOcwhTJtYIDF51kdHw+
 tvtw7ae76Am0+Vq1KjaMkdfmFdDhN6731BlFs3VIAUHH9CYd0j9XJS4gcdTqSjpo5U4Z
 ActAQaxG8A2IyCRw7wKqHRBR3RkWC4udpPzAgLfd+oFFxVRpdq8N3IPNUtz2VYb/XE5l
 bNWDP0v7mZEPY2eJvc+M1oPsB3atAdPnQv9Bz+R/EgofjphzrZe0Wb9o/mB31rUIrZs5
 lWIg==
X-Gm-Message-State: AOAM5306b0WuERLJ+Dx6YfP5FcKoRROTlu07PMgMWk2tVltrLsvUEVYL
 38fO1GnMOmQjtEd6CvojePa7Q4V45K+zsU2ECqPKw5Bs2zdx+blZlB2FK1MTWIj7Qfo+Z53gS5v
 FcZ5RzWQ5mm/7eWU=
X-Received: by 2002:a17:906:3b13:: with SMTP id
 g19mr9460309ejf.360.1624610241282; 
 Fri, 25 Jun 2021 01:37:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwxeLdUMU1nWCpYeA28ixVASbbPACAd5hAQR3PKGoPvQfdTV39lj/LgkIIrxTj9ZZmOEqYXw==
X-Received: by 2002:a17:906:3b13:: with SMTP id
 g19mr9460288ejf.360.1624610241081; 
 Fri, 25 Jun 2021 01:37:21 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 da28sm3432260edb.0.2021.06.25.01.37.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Jun 2021 01:37:20 -0700 (PDT)
Subject: Re: [PATCH v5 00/11] block: file-posix queue
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>
References: <20210624180423.1322165-1-pbonzini@redhat.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <176597b0-f42c-601d-a401-e47fd0b60a3c@redhat.com>
Date: Fri, 25 Jun 2021 10:37:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210624180423.1322165-1-pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-block@nongnu.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.06.21 20:04, Paolo Bonzini wrote:
> New patches:
> - 3/4 (for review comments),
> - 9 (split for ease of review),
> - 11 (new bugfix)
>
> v1->v2: add missing patch
>
> v2->v3: add max_hw_transfer to BlockLimits
>
> v3->v4: fix compilation after patch 1, tweak commit messages according
>          to Vladimir's review
>
> v4->v5: round down max_transfer and max_hw_transfer to request alignment
>          checkpatch fixes
>          return -ENOTSUP, -not -EIO if block limits ioctls fail
>          handle host_cdrom like host_device in QAPI
>          split "block: try BSD disk size ioctls one after another"
>          new bugfix patch "file-posix: handle EINTR during ioctl"

Thanks, looks good to me, though I’m afraid I’ll be on PTO the next two 
weeks so I can’t take this series through my tree... (I don’t really 
want to send a pull request today when I probably wouldn’t be able to 
deal with potential problems)

Max


