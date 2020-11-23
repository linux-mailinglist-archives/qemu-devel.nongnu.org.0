Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B52112C0170
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 09:35:32 +0100 (CET)
Received: from localhost ([::1]:37706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kh7Jr-0005RW-LQ
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 03:35:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kh7Ig-0004za-3e
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 03:34:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58081)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kh7Id-0007Us-SU
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 03:34:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606120454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GTDcmUvXcX7kySnoUt8WLnRL0krlO3VJ6Wkj934d3qs=;
 b=BjHC1pgg2QE8JyCvMYlfMX106zKAfAvsb1z+E6+OQWZJ4B7W+Vgl9aLZkWDEnFP79K/sC9
 xCb19dwhTzrko1S/YJqI4WInTIS2GR+3nyGVh7YCE0d6a3MnqFw5z0qp6uTJkR2Hw6RQB/
 xy8SxJIahQeleM7hOOH9yJVo+ZX3iUE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-00l_UwC2PO-hjI7BJ0NMVA-1; Mon, 23 Nov 2020 03:34:11 -0500
X-MC-Unique: 00l_UwC2PO-hjI7BJ0NMVA-1
Received: by mail-ed1-f69.google.com with SMTP id n25so6332169edr.20
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 00:34:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GTDcmUvXcX7kySnoUt8WLnRL0krlO3VJ6Wkj934d3qs=;
 b=s+sLlQReFEH8ThDH0DjBAILXQfMWGDnWHNZyH2i32tIqmSEpSqKLquHuyIVsvXzlcN
 Y3lOGFHcetXeCb05wbxDpfj/YhiqsawZsLXCFbjCC5vFEsuAWjB0GgwUvg5j7/Xz2WO+
 HrP79OF1wg3AbHiTqFKL4Ca2/lnFUoXJdcVDo7dgb2yeKyKMsSOHqhPbok455cjYVr64
 ODKkD3IURr0iRDYNs16WZNbfM/NzPf1Dah7MmzxTs+PBtLbK9yh5o5eoYK+wwbYgBwye
 soHd+gBrboQiqPiCDgceKB9d9F0YpxN+/010+N1yKdVvHWu70KxVqWCgkxueynqsrbVJ
 /SWg==
X-Gm-Message-State: AOAM531x9AqjRpUWeNPh7m/CBVvnbwSDi4lnKThTKONywF0znwkhy32q
 FXAIH3LksIufl+f9dN6WUP8Mh6GexHhKMuL6G6zJNsH3dfNqbYc1imRPxEyPz0+xRJJvWBrddP7
 R/77q34bzIuTVg3iQD+zlcPUykx5a6beWYn9eT54yKBMds2KUJfqG/k72bwtuu8s3i9o=
X-Received: by 2002:a17:906:f296:: with SMTP id
 gu22mr42908900ejb.475.1606120450191; 
 Mon, 23 Nov 2020 00:34:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzZwdxxU7iZAzZ+eb8A5zByWqxAXvBpIijWgpjMqHD9AMDuqL/cshKDl00lF7k1N8OvpEreug==
X-Received: by 2002:a17:906:f296:: with SMTP id
 gu22mr42908885ejb.475.1606120449973; 
 Mon, 23 Nov 2020 00:34:09 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id d22sm4558453ejy.15.2020.11.23.00.34.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 00:34:09 -0800 (PST)
To: Igor Mammedov <imammedo@redhat.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-29-pbonzini@redhat.com>
 <20201120172631.4f5f93fb@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 28/29] vl: remove separate preconfig main_loop
Message-ID: <a7de93e9-3670-4025-ad46-27be3b5deece@redhat.com>
Date: Mon, 23 Nov 2020 09:34:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201120172631.4f5f93fb@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/11/20 17:26, Igor Mammedov wrote:
>> +    if (!preconfig_requested) {
>> +        qmp_x_exit_preconfig(&error_fatal);
>> +    }
>> +    qemu_init_displays();
> given that qemu_init_displays() were called in both cases,
> shouldn't it be called unconditionally at [1]?
> 

Yes, correct.

Paolo


