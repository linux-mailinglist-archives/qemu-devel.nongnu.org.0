Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 340DC6F79E0
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 02:01:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puirJ-00025i-CD; Thu, 04 May 2023 19:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puirH-00024k-PO
 for qemu-devel@nongnu.org; Thu, 04 May 2023 19:59:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1puirG-0004KM-B2
 for qemu-devel@nongnu.org; Thu, 04 May 2023 19:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683244772;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=iNPWkotzqSCJl7CCXJB7NdFOIewYr0floAJpDRhAC8I=;
 b=ihxZ1zSqLjw/Ac7Yg7kdgrr0U4Ldp2PSjVMuF8at4EXPy9AvXx2y2L7ZW4/h2L3YYjPSKs
 Xllo3UY6RoUw3vJ2AA5Mr4h4/1BD2xodY/CJZhTX8lfkyDw9pI20EuLiGmnfYnuNZBs9qi
 Z0mQlAKcyro0956ggV9br3JFsfylerE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-sYpw6rlNPHqN_SPdcxRkcA-1; Thu, 04 May 2023 19:59:31 -0400
X-MC-Unique: sYpw6rlNPHqN_SPdcxRkcA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-302cdf5d034so618661f8f.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 16:59:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683244770; x=1685836770;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iNPWkotzqSCJl7CCXJB7NdFOIewYr0floAJpDRhAC8I=;
 b=AtRvVeeTzJ9GReLzkhWIsLi5na/TEYR+HdCCXKXRPVvpJNnIjLXgPC7h+Jtx9hjRar
 prex81ymc/8LtzpxB21NZAw2Y+4Bl0TjzDAVbZVIFmRiROeKCtKtuKRi1MQiofvisKkd
 0DFQLWSsBEHPczq3ulghEVKxxKeA+kueCWE53lWFbZlD1HSP+e0AFi27AoDqyYqrUWKg
 1kHDMVEVdQP300/5xWwQ7NPCXjDH1riQvO5YCOzbj8W1euBbw0DQGQJmR+EBuZXBOnMO
 ZEsmfOKaBunjsHZqdpggr/Dp2KDTpTJhpHujoPu8liXbop3PNHE91BZkuuHDKbxv0X3e
 txXA==
X-Gm-Message-State: AC+VfDyAMlsXV2dFjinOgoW7fWv6kEZ2COtxFAuOFqE0ss8N0ro/uVTT
 EFR/+b6F59QEKz4shRbUmi8er3LIQV4MDWOFgN75zc8ibivrkkAAFhMPaYWxbmHCgjWjcXqQ57n
 JCPBhI4JDNpGJhw2Sbt1kdegejhiSEr6H9QWmXu+w86iQRbYwuCUs2WlBufXuh3oOISkkDWij80
 bYc4C8
X-Received: by 2002:a5d:640f:0:b0:306:2d32:8ec with SMTP id
 z15-20020a5d640f000000b003062d3208ecmr3754932wru.6.1683244770205; 
 Thu, 04 May 2023 16:59:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4xX1yn6LtBCLOw2dID7YMAZUmxHgzpcP6d8hIVs7a/hcmaWN/DAAJYLJztVCUSj7n4n6BB4g==
X-Received: by 2002:a5d:640f:0:b0:306:2d32:8ec with SMTP id
 z15-20020a5d640f000000b003062d3208ecmr3754918wru.6.1683244769896; 
 Thu, 04 May 2023 16:59:29 -0700 (PDT)
Received: from redhat.com ([188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 k9-20020adfe8c9000000b0030642f5da27sm536763wrn.37.2023.05.04.16.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 16:59:29 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,  Stefan Hajnoczi <stefanha@redhat.com>,  Leonardo
 Bras <leobras@redhat.com>,  Fam Zheng <fam@euphon.net>,  Peter Xu
 <peterx@redhat.com>
Subject: Re: [PATCH 3/9] qemu-file: make qemu_file_[sg]et_rate_limit() use
 an uint64_t
In-Reply-To: <20230504113841.23130-4-quintela@redhat.com> (Juan Quintela's
 message of "Thu, 4 May 2023 13:38:35 +0200")
References: <20230504113841.23130-1-quintela@redhat.com>
 <20230504113841.23130-4-quintela@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 05 May 2023 01:59:26 +0200
Message-ID: <87r0rvodgh.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Juan Quintela <quintela@redhat.com> wrote:
> It is really size_t.  Everything else uses uint64_t, so move this to
> uint64_t as well.  A size can't be negative anyways.
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Self-nack.

> -        qemu_file_set_rate_limit(ms->to_dst_file, INT64_MAX);
> +        qemu_file_set_rate_limit(ms->to_dst_file, UINT64_MAX);

1st: this should be zero.

>      } else {
>          qemu_file_set_rate_limit(ms->to_dst_file, bandwidth / XFER_LIMIT_RATIO);
>      }
> @@ -2301,7 +2301,7 @@ static void migration_completion(MigrationState *s)
>              }
>              if (ret >= 0) {
>                  s->block_inactive = !migrate_colo();
> -                qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
> +                qemu_file_set_rate_limit(s->to_dst_file, UINT64_MAX);

Same here

>                  ret = qemu_savevm_state_complete_precopy(s->to_dst_file, false,
>                                                           s->block_inactive);
>              }


> @@ -3049,7 +3049,7 @@ static void *bg_migration_thread(void *opaque)
>      rcu_register_thread();
>      object_ref(OBJECT(s));
>  
> -    qemu_file_set_rate_limit(s->to_dst_file, INT64_MAX);
> +    qemu_file_set_rate_limit(s->to_dst_file, UINT64_MAX);

And here.

> @@ -748,18 +748,18 @@ int qemu_file_rate_limit(QEMUFile *f)
>      if (qemu_file_get_error(f)) {
>          return 1;
>      }
> -    if (f->rate_limit_max > 0 && f->rate_limit_used > f->rate_limit_max) {
> +    if (f->rate_limit_used > f->rate_limit_max) {

And this is wrong.  f->rate_limit_max == 0 means that we don't do  rate_limit.

Will resend this one later.

Sorry, Juan.

PD.  No, I have no clue how I have had this patch applied the whole day
     and no failures and now I get failures in migration-test.  The
     number of times that I run this test on the last two days have been
     in the hundreds.


