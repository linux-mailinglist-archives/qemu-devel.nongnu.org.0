Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 154C63B0174
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 12:35:14 +0200 (CEST)
Received: from localhost ([::1]:60008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvdkP-0004ao-2W
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 06:35:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lvdVq-0006oT-B6
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:20:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lvdVo-0007X6-JH
 for qemu-devel@nongnu.org; Tue, 22 Jun 2021 06:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624357207;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6sbp9VSfEgPZNzJHnziitEonSU+wQ/7+k4AN2q5viQM=;
 b=gBk1qvrU8E0goYLQt0p9wB+1YUNdA+BAIAwd6HOaHIP0OM9yN+2ZHVBMejDfyRG0K03+ur
 IXLa4paP4aIANDAKTXPxQvqQFZ6byPKd0xCMYnUJ6hGRCzk0sODSNWMWj+rJpR7CdMZ76q
 dWffbhWB2Y3NumCBWy/UT3H3TIL9DPE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-dddOtxPnO8if1nFt993KyA-1; Tue, 22 Jun 2021 06:20:06 -0400
X-MC-Unique: dddOtxPnO8if1nFt993KyA-1
Received: by mail-wr1-f70.google.com with SMTP id
 p2-20020a5d63820000b029011a9ecaf55dso381514wru.19
 for <qemu-devel@nongnu.org>; Tue, 22 Jun 2021 03:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6sbp9VSfEgPZNzJHnziitEonSU+wQ/7+k4AN2q5viQM=;
 b=M3S1kTeZG5p/5hR+pLcRyKpm0kPAfjVTKIxWel1mMdfOsYAqO9HKn71Xo2HOCP2hCT
 C3rArLS+gWugYzcNzF6cclHRS1/UQp3TGcIAzAMZCcbHIi2EVIOCJ4pFA9mJA5LBZu+O
 6gGcbvtpLKNlf9+MXtxJTj+gIJxCtyg9TxjMt5MUY8grlkr6mgxOrf+RAhCtBJUYT5EU
 Bf3mAZr+D9ofpAwMuW7hvl2wIla12cb+LrSsYy/K9xF/xh9AnIawYMPRksdpx41qqJvK
 y5jb6xwANXCa9SYTJhJ7XJYxfgtUdqLwdMHKxuY4UycwPdnTdteDYROwzjMOt8axnIhU
 Bx2Q==
X-Gm-Message-State: AOAM533dpVWnG+2BlicTJiftCMYoSJ7xm/dpLmIVAVzk7MKd/v+Y5RfZ
 QirLSQqYG9kYmvgvtiKNfD2q2G9uFw7KwvUX+xJyotz/p5UVkad6bKD2HL9XeAj6SNj3rm5q/bK
 u61DzvxeG//SiA9CgoLn/g3wZ1Lvluapl5NtWPLewZeFBIVwnyHG2Fxomuj8M9MRQdZc=
X-Received: by 2002:a05:6000:144d:: with SMTP id
 v13mr3790078wrx.412.1624357205341; 
 Tue, 22 Jun 2021 03:20:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyA4xZGJkTZ9+w4gURbFpkFJ/mWK2De4xh89SsiN1tKeKuhBR8x3U0d8CbZV6ZzL8NmSehQVA==
X-Received: by 2002:a05:6000:144d:: with SMTP id
 v13mr3790039wrx.412.1624357205026; 
 Tue, 22 Jun 2021 03:20:05 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p11sm11126130wre.57.2021.06.22.03.20.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 03:20:04 -0700 (PDT)
Subject: Re: [PATCH v4 6/6] block-copy: atomic .cancelled and .finished fields
 in BlockCopyCallState
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20210614073350.17048-1-eesposit@redhat.com>
 <20210614073350.17048-7-eesposit@redhat.com>
 <fcb8849c-bedf-aacc-3831-0239d89af2d6@virtuozzo.com>
 <c06306f6-e154-ec58-44cc-33d48d8ccdff@redhat.com>
 <28d4cd1c-2495-b30d-3c9f-2d8d0d3e897b@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c8b4e9b9-15a6-3ae4-cb8f-5289a221dcbe@redhat.com>
Date: Tue, 22 Jun 2021 12:20:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <28d4cd1c-2495-b30d-3c9f-2d8d0d3e897b@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
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

On 22/06/21 11:36, Vladimir Sementsov-Ogievskiy wrote:
>> It does.  If it returns true, you still want the load of finished to 
>> happen before the reads that follow.
> 
> Hmm.. The worst case if we use just qatomic_read is that assertion will 
> not crash when it actually should. That doesn't break the logic. But 
> that's not good anyway.
> 
> OK, I agree, let's keep it.

You can also have a finished job, but get a stale value for 
error_is_read or ret.  The issue is not in getting the stale value per 
se, but in block_copy_call_status's caller not expecting it.

(I understand you agree, but I guess it can be interesting to learn 
about this too).

Paolo


