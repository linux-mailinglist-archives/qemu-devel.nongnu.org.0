Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651F13B9090
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 12:37:48 +0200 (CEST)
Received: from localhost ([::1]:57066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyu4p-00043g-DK
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 06:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyu3r-0003Kh-FH
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 06:36:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lyu3p-0003TN-Py
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 06:36:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625135805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k/h/QVFfkC/0j38i6Ii3+PKtk6esMlP7wUAwYkshvyw=;
 b=Dq/wG+cNttM/MkVojzw/3dyK3XjK6Ton1R4O1WQu2qFmYEKU2er3NMA9wn909izJt0sgic
 I94O12DYSRMFIwzPum/AXtAKD8EbJWDyOJJcFmZomiA/ARydgv2ZWAHsr85Rq2FUJk3dJj
 DuQhuX+AQVL59np5QBrg3kEVRyH/lI0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-TF17VYrpPxqgx5ZEcoVP9w-1; Thu, 01 Jul 2021 06:36:44 -0400
X-MC-Unique: TF17VYrpPxqgx5ZEcoVP9w-1
Received: by mail-wr1-f71.google.com with SMTP id
 j1-20020adfb3010000b02901232ed22e14so2384781wrd.5
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 03:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=k/h/QVFfkC/0j38i6Ii3+PKtk6esMlP7wUAwYkshvyw=;
 b=n1+NklTFJdlZHIFfj6vfa2P+07rQGaOfuBhcuJkLvErj9H7Xcd/8LVVFjOh8I/rGNf
 evRDmJXj0pgdygbtgzOOExg3LnbzeGe9Kj+LHSbo5YEfotA3eSa++OgxxJZbBMcuSLcv
 Ge5oOJ6cfLmL3L5r5u7ewh6Y1gGDyE74wqlNbnt7VD1JGyhHcRpwMaOalhYtka1ZiTb3
 /sS0FwSf/4mr0Afa+gqEHslhpcThm3reXlCqnfGmf0izmP7aqR8sjnY527dUDOSCZOfQ
 fCgYxIpxSyUF9rtp5C9yvHdUz090wdKxUpzWDeuRtvZ69XR93BcsQ8kfIdcvhruBkQL2
 a4VQ==
X-Gm-Message-State: AOAM530GweMHaC18BlsTksSU/wdejAxeMaNm4H2974T5vcb6d6wNpxuw
 J5TwE6ND7oMovP5E1WoEpocmMEN1tlDYTFTGsnxu7Spsf74begoFag5vQk9mMrDKD+EnNoCEzB7
 TYG8xNU9k0JZs+Rg=
X-Received: by 2002:a05:600c:358e:: with SMTP id
 p14mr29607911wmq.136.1625135803169; 
 Thu, 01 Jul 2021 03:36:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAVje8btfpMdI8kPLuS3sOcEFpRLtZ40w7QdvNY/l9TMvrkKkQL3PNBZBGA5St5jLfl5FQog==
X-Received: by 2002:a05:600c:358e:: with SMTP id
 p14mr29607885wmq.136.1625135802952; 
 Thu, 01 Jul 2021 03:36:42 -0700 (PDT)
Received: from thuth.remote.csb (pd9575bc6.dip0.t-ipconnect.de.
 [217.87.91.198])
 by smtp.gmail.com with ESMTPSA id e8sm24313520wrq.10.2021.07.01.03.36.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 03:36:42 -0700 (PDT)
Subject: Re: [RFC v6 03/13] hw/s390x: only build tod-tcg from the CONFIG_TCG
 build
To: "Cho, Yu-Chen" <acho@suse.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org
References: <20210629141931.4489-1-acho@suse.com>
 <20210629141931.4489-4-acho@suse.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e7d2de6d-5a4e-e6ef-85f9-a2e2f6fbe6fa@redhat.com>
Date: Thu, 1 Jul 2021 12:36:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210629141931.4489-4-acho@suse.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Cornelia Huck <cohuck@redhat.com>, cfontana@suse.com,
 David Hildenbrand <david@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 jose.ziviani@suse.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29/06/2021 16.19, Cho, Yu-Chen wrote:
> this will allow in later patches to remove unneeded stubs
> in target/s390x.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: David Hildenbrand <david@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
> ---
>   hw/s390x/meson.build | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
> index 02e81a9467..28484256ec 100644
> --- a/hw/s390x/meson.build
> +++ b/hw/s390x/meson.build
> @@ -16,7 +16,6 @@ s390x_ss.add(files(
>     'sclp.c',
>     'sclpcpu.c',
>     'sclpquiesce.c',
> -  'tod-tcg.c',
>     'tod.c',
>   ))
>   s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
> @@ -25,6 +24,9 @@ s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
>     's390-stattrib-kvm.c',
>     'pv.c',
>   ))
> +s390x_ss.add(when: 'CONFIG_TCG', if_true: files(
> +  'tod-tcg.c',
> +))
>   s390x_ss.add(when: 'CONFIG_S390_CCW_VIRTIO', if_true: files('s390-virtio-ccw.c'))
>   s390x_ss.add(when: 'CONFIG_TERMINAL3270', if_true: files('3270-ccw.c'))
>   s390x_ss.add(when: 'CONFIG_VFIO', if_true: files('s390-pci-vfio.c'))
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


