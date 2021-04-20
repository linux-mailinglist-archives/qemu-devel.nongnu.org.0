Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8425E365982
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 15:08:00 +0200 (CEST)
Received: from localhost ([::1]:37900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYq6h-0008Ix-IZ
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 09:07:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYq5F-0006q2-CK
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 09:06:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYq5D-0006Ru-PP
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 09:06:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618923987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ha0+Kyu4dXlzDO3bcNK6gMzK5D5f2EYxsDV9AMmBOPU=;
 b=aVsDuZ6M1hi7kBP8sARn7OB8sCQVgoIwDEyZb38gCOgqaAxGER9RrG0CdYXDlTgThiLMS8
 KcQitRQSqQTg6SvhcmqGPuPbLItfC/JxchahUnqTwrhU6mmW+FmHG8cY2qK4wgsvATtdLb
 eU2ectnv16tQPl2Bn/8W4VzEAyUe0MY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-K6GhRiAlNKmShYWoy7jTKg-1; Tue, 20 Apr 2021 09:06:25 -0400
X-MC-Unique: K6GhRiAlNKmShYWoy7jTKg-1
Received: by mail-wr1-f72.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso7414203wrf.11
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 06:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ha0+Kyu4dXlzDO3bcNK6gMzK5D5f2EYxsDV9AMmBOPU=;
 b=lpsWP19eJii6UesAXpuEivPqh7CGZp2u8QqkoNz0T2R0qchRtD+NBHJZw058KCph5v
 MzrQzWTR+eRFXxGU+pGUu/5wC8KJAaCFz87plhNOOUobAHiefsVTlW+Q1LnSuCAQ2wP8
 clT8RrTsd7Tgpl0xaZabgFqFMfUKZ1mz9DbCj2UVcSA57lJh5yjEUSOiAra4j9FkhUSo
 6mh0FMzdAYqNurybS1rfdwPPJrBvm0xFSJ5+wlROgcYtB2xQmgCpWOmZ3rKwMy5qIVv0
 CcYJ6Pcov5etZWlm6GgHylvCeh+Ta+P5PVHMva8xocpI6y5/RNFztHJRYXTHrXsmOiPd
 OboA==
X-Gm-Message-State: AOAM5303H/LyDD8Pc6vtNl0qeSJrBhIuCAKmj6oIEqWhswnlsii5JRFN
 j7cUUdsxylI04cvemTFqrXwnM8lG8d1A/jH29uvDhUk/soszavr33UEKQC2nqr0QuQXO7WaVPtH
 d83lm84cexFnmu/0=
X-Received: by 2002:a5d:6283:: with SMTP id k3mr20783992wru.166.1618923983353; 
 Tue, 20 Apr 2021 06:06:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjcnpyBcoidwV4EqsVO6crmgcHQ06I7z5N721bWTW0nssoqPoTuFmxgC5FukIqJ3NCh5QdmQ==
X-Received: by 2002:a5d:6283:: with SMTP id k3mr20783971wru.166.1618923983187; 
 Tue, 20 Apr 2021 06:06:23 -0700 (PDT)
Received: from [192.168.3.132] (p4ff2390a.dip0.t-ipconnect.de. [79.242.57.10])
 by smtp.gmail.com with ESMTPSA id
 h10sm13333389wrt.40.2021.04.20.06.06.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 06:06:22 -0700 (PDT)
Subject: Re: [RFC v2 04/13] target/s390x: remove tcg-stub.c
To: Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210420103616.32731-1-cfontana@suse.de>
 <20210420103616.32731-5-cfontana@suse.de>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <23a469bb-3f56-bbc4-f5e7-14522598fac1@redhat.com>
Date: Tue, 20 Apr 2021 15:06:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420103616.32731-5-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.04.21 12:36, Claudio Fontana wrote:
> now that we protect all calls to the tcg-specific functions
> with if (tcg_enabled()), we do not need the TCG stub anymore.
> 

As we keep the prototypes, this should indeed work

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


