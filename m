Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FC93A1C9D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 20:18:58 +0200 (CEST)
Received: from localhost ([::1]:44778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr2n3-00084n-Mz
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 14:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lr2lY-00075x-Nr
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:17:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1lr2lV-00078u-Cx
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:17:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623262639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=T2CaiRi0BYyZXuQy4fcUfXaMQTKwAcvQWoThNLiHEHQ=;
 b=GwttLXlMt1b0pARQ2m2XXQksvX4itKUDDNdQSSKhTe+kPRIW4kYvMmvWHn9VFlfEuLkSRZ
 ce9E9voZrqTCROKlvRAQCMD9bP2oero5Dt771ZTvrmeBAI96rOg3iYsgIEjIfh26GkmQh7
 wTOZuKST40q3Muy6LU5+QR0FUmZi4mE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-hoL9CuTWPtKCMu3U7LfZbA-1; Wed, 09 Jun 2021 14:17:16 -0400
X-MC-Unique: hoL9CuTWPtKCMu3U7LfZbA-1
Received: by mail-qk1-f200.google.com with SMTP id
 a193-20020a3766ca0000b02903a9be00d619so17685824qkc.12
 for <qemu-devel@nongnu.org>; Wed, 09 Jun 2021 11:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=T2CaiRi0BYyZXuQy4fcUfXaMQTKwAcvQWoThNLiHEHQ=;
 b=iQyg2ok7HmAajPwiamIv8McQ0wOdPnaOuagaSmFfrrRBa4xQUK1beXjwP/C7Fjm1Hn
 /V2WnZdcxKWD3TwLJTu2kCsnzRp8FST4ARRQNbrQmlSq6CuvR1AZZkthNH0G7ae7BzqV
 LJrGXnRjsuCo1hyDm0+ktkIiVy7FyTQdhxJrNvgkLRqIvhjBPcJxYhqKAxpb2d+z9Kp9
 mXX/r5lW7QOpUsd2+NNga/Fa0mfehtlyS984Tj8CJWwravqHXD6jjJh4/6CGVo2UxJPH
 j1R1QzIHza+y9OL0MueIDGmhQEwiESgd5jIKRKjziT+4VdvCxGAy8vnonwE+P64YdtZI
 97mg==
X-Gm-Message-State: AOAM533FeqKcV8YfyxJ3omFp3S2gliOd9EWwDj9CaLuIEVswfyRQx8mS
 NN1ESAnY/yyoYU8svpMD8+cD1iT3aqOqFvpbHMdamHdX/fpDxDHXgk2wevSBmirMbipELZHeJr0
 7gV6olEzenjaDrg8=
X-Received: by 2002:ac8:7384:: with SMTP id t4mr1240902qtp.96.1623262635621;
 Wed, 09 Jun 2021 11:17:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVZBe15AZYyFUZRbMP1dFSDSjU3Ijr1bDCTxW84k0Do48I1C2Gw6Eegg4iUymzf1VotQ9BUw==
X-Received: by 2002:ac8:7384:: with SMTP id t4mr1240882qtp.96.1623262635366;
 Wed, 09 Jun 2021 11:17:15 -0700 (PDT)
Received: from t490s (bras-base-toroon474qw-grc-88-174-93-75-200.dsl.bell.ca.
 [174.93.75.200])
 by smtp.gmail.com with ESMTPSA id u13sm568703qke.41.2021.06.09.11.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 11:17:14 -0700 (PDT)
Date: Wed, 9 Jun 2021 14:17:13 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v3 7/7] migration/dirtyrate: implement dirty-ring
 dirtyrate calculation
Message-ID: <YMEFqfYZVhsinNN+@t490s>
References: <cover.1623027729.git.huangy81@chinatelecom.cn>
 <a930f410178862fda49ae2c613a0757c7e07e006.1623027729.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <a930f410178862fda49ae2c613a0757c7e07e006.1623027729.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 07, 2021 at 09:15:20AM +0800, huangy81@chinatelecom.cn wrote:
> +static void calculate_dirtyrate_vcpu(struct DirtyRateConfig config)
> +{
> +    CPUState *cpu;
> +    int64_t msec = 0;
> +    int64_t start_time;
> +    uint64_t dirtyrate = 0;
> +    uint64_t dirtyrate_sum = 0;
> +    int nvcpu = 0;
> +    int i = 0;
> +
> +    CPU_FOREACH(cpu) {
> +        nvcpu++;
> +    }
> +
> +    dirty_pages = g_malloc0(sizeof(*dirty_pages) * nvcpu);
> +
> +    dirtyrate_global_dirty_log_start();
> +
> +    CPU_FOREACH(cpu) {
> +        record_dirtypages(cpu, true);
> +    }
> +
> +    DirtyStat.method.vcpu.nvcpu = nvcpu;
> +    if (last_method != CALC_DIRTY_RING) {
> +        DirtyStat.method.vcpu.rates =
> +            g_malloc0(sizeof(DirtyRateVcpu) * nvcpu);
> +    }
> +
> +    start_time = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
> +    DirtyStat.start_time = start_time / 1000;
> +
> +    msec = config.sample_period_seconds * 1000;
> +    msec = set_sample_page_period(msec, start_time);
> +    DirtyStat.calc_time = msec / 1000;
> +
> +    CPU_FOREACH(cpu) {
> +        record_dirtypages(cpu, false);
> +    }
> +
> +    dirtyrate_global_dirty_log_stop();
> +
> +    for (i = 0; i < DirtyStat.method.vcpu.nvcpu; i++) {
> +        dirtyrate = do_calculate_dirtyrate_vcpu(i);
> +        DirtyStat.method.vcpu.rates[i].id = i;
> +        DirtyStat.method.vcpu.rates[i].dirty_rate = dirtyrate;
> +        dirtyrate_sum += dirtyrate;
> +    }
> +
> +    DirtyStat.dirty_rate = dirtyrate_sum / DirtyStat.method.vcpu.nvcpu;

Why you'd like to divide with nvcpu?  Isn't dirtyrate_sum exactly what we want?
As I don't think we care about average per-vcpu dirty rate, but total here.

> +    g_free(dirty_pages);
> +}

I did a run with 4G mem VM, alloc 1G and dirty it with 500MB/s, then

  - With old way: I got 95MB/s
  - With new way: I got 128MB/s

The new way has the output with:

Dirty rate: 128 (MB/s)
vcpu[0], Dirty rate: 0
vcpu[1], Dirty rate: 1
vcpu[2], Dirty rate: 0
vcpu[3], Dirty rate: 511

I think if without the division, it'll be 512MB/s, which is matching the dirty
workload I initiated.

-- 
Peter Xu


