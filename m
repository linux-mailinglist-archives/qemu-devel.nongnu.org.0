Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F6238C9BA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 17:03:58 +0200 (CEST)
Received: from localhost ([::1]:56098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk6gv-0000Fu-WC
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 11:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk6fb-0007G7-4U
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:02:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lk6fZ-00020t-Ge
 for qemu-devel@nongnu.org; Fri, 21 May 2021 11:02:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621609353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zpzlIa+QTDKMRhu5fpfJox3g1nfBZEU1InPmnGCeEB4=;
 b=b+I8ofNWBCm1eQo9Vg5XX04JsCQNEdCGiEJPx00Gaq39Pg4HfYCQwxYKfYP2x5HYUwoYFd
 u3OXpK5ncReH/US6NHOXdWkEul5k+dE82N4pT/IhEqmgYdx0g93ZvfFgsI8mDkqQ5T1LQT
 G0eULvt71MYZSJdsC1ppEakvzD6PXdw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-z4onn5yoM5C_FuGk0xh3yw-1; Fri, 21 May 2021 11:02:29 -0400
X-MC-Unique: z4onn5yoM5C_FuGk0xh3yw-1
Received: by mail-ej1-f69.google.com with SMTP id
 x20-20020a1709061354b02903cff4894505so6294437ejb.14
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 08:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zpzlIa+QTDKMRhu5fpfJox3g1nfBZEU1InPmnGCeEB4=;
 b=NRnkFFYEXdIrA0wubQQl6FO+p+z8FmGxcyKyLFIS241rh2kS03krZ67dj0PBi+YXBI
 5C3KVRkqCjPDzd+IQKtfmqVhqo/L1hssubcKH6ffhVHzouNdy85FSclouuNBnyy50O8g
 1GLB9bkAiDC2awaqVn7iAlNGlfLDe5jerJrPJ3bu/FiX2mdy7b5I9x38MkNsY6CRkhAD
 D+ci+2eJymenY2c2J+3RzWzcUovLXoQZQb1Cr8OcsKGBsDkJzgmwLrcrz+z1hG0bnrY5
 +dp7YX07ZwX2AZMzmx87Bt/1W9BwktOBg60LkrXj5rJYOJqjRYVQ+r5XUDy0pgxLCOqs
 2bhQ==
X-Gm-Message-State: AOAM530VmkDPsdl3klJmwXBAQ+1pH7fkxD/avOE3Urp3suXH4c88jxf9
 Z//GYXMJ06zBoqTbec6lSWuyRDVdWtNlYPM98eCxIWsMNi/65wG27uAMUWhKWOGX2WSFyWJjQ2f
 bZyLwBq72YT+D2FWJAzk4wR9OYqt/TpKfHIDamGRZdILvw2+9E/hk6jx8Lp9YZeMnfIE=
X-Received: by 2002:a17:906:2dca:: with SMTP id
 h10mr10559636eji.507.1621609348101; 
 Fri, 21 May 2021 08:02:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7VV0qKtpOQukWskbouDmUD2RKbg5k6zARao9nQ9zH2a2GkPNjkJT7SYzj2Piq/siGcuSRGQ==
X-Received: by 2002:a17:906:2dca:: with SMTP id
 h10mr10559611eji.507.1621609347879; 
 Fri, 21 May 2021 08:02:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id yr15sm3748560ejb.16.2021.05.21.08.02.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 May 2021 08:02:27 -0700 (PDT)
Subject: Re: [PATCH v2 6/7] block-copy: atomic .cancelled and .finished fields
 in BlockCopyCallState
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210518100757.31243-1-eesposit@redhat.com>
 <20210518100757.31243-7-eesposit@redhat.com>
 <068832dd-c577-0234-4a1d-dfdae6a5b4dd@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <05e94bee-8ee8-e23f-19c1-a7fcb540e080@redhat.com>
Date: Fri, 21 May 2021 17:02:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <068832dd-c577-0234-4a1d-dfdae6a5b4dd@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/05/21 17:34, Vladimir Sementsov-Ogievskiy wrote:
> 
>> By adding acquire/release pairs, we ensure that .ret and .error_is_read
>> fields are written by block_copy_dirty_clusters before .finished is true.
> 
> As I already said, please, can we live with one mutex for now? finished, 
> ret, error_is_read, all these variables are changing rarely. I doubt 
> that performance is improved by these atomic operations. But complexity 
> of the architecture increases exponentially.

The problem is that these are used outside coroutines. 
load-acquire/store-release is the simplest way to handle a "finished" 
flag really.

Paolo


