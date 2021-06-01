Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF97E397BF0
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 23:55:05 +0200 (CEST)
Received: from localhost ([::1]:33480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loCLp-0005nq-2S
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 17:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1loCKy-00055L-Hf
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:54:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1loCKv-0000UU-FE
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 17:54:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622584448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TLmTFs79Kk/HdqD2U3Jsivs3GJU2uRn31j0/SZFo+5Y=;
 b=KO7rqGLQZNNAvA/v+Ug3OdaUuWZqLU1+3XCHSoxejWz6A+NamUL0cgvJZ+qOFWSEceAwTX
 SG/RUAi/f4JE8FsRWuG9djvc0iUbSjPKYSubpmf7tA87T4UMgqbzxH+IiINDn5EmUfEJ3P
 Rj2ewYA47VasnOrTIewUJ/O9uczCNqE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-ibhYnZ3XPs6bh91Izr6nIA-1; Tue, 01 Jun 2021 17:54:06 -0400
X-MC-Unique: ibhYnZ3XPs6bh91Izr6nIA-1
Received: by mail-qt1-f198.google.com with SMTP id
 q3-20020a05622a0303b02902390ac8c906so234007qtw.11
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 14:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TLmTFs79Kk/HdqD2U3Jsivs3GJU2uRn31j0/SZFo+5Y=;
 b=HDIM5cb4YChnVCe8jjofF6rTOnR/QNnQ+gJHNKKb1AQSHpamSgzHK3ntVKPThJnLiY
 0EGaN2UxlnOfG4Rt76ERG5zNoS4X8t7U0owTkZf9pPhzvcqNJfqvCqD9+AIl8chENCet
 4ug1EI5us0LLDzbZ8qFeVqTdvCg3xsntdXHbbJsuxVP/axMlUO/2O/FIHUn5otjPCwmo
 TPHb0RRfOgVpMsQAAxTykstbzU13EbfZJrAg2Emi4YRdJBq/PKStGFhp4lzn3XKIAUls
 S1EJh4M2E0DQhlpCIUFb+/naOHBAN6LN+FH+pL6EvLbG5JZNExVCFcwctjGjJlv1UjeG
 Yn0Q==
X-Gm-Message-State: AOAM533FZT2r9OR0R8iSlV2bdRijpxepTdSNjI2v6mO5v6+9GWy+4O0A
 wGpS5mcLSFrP551PTkTUdDPjnicHOTq3mnN2F+OQg/QMVz0uAPmIyVeo2gLb32qoD0GtfL50dxs
 xxCoP0cajyEP7V0c=
X-Received: by 2002:ac8:698b:: with SMTP id o11mr12834847qtq.148.1622584445795; 
 Tue, 01 Jun 2021 14:54:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzw3PnREwzRNFGSUnTvVgUPY8IkQ4jACsTTBjVGul0hqJfwLurKsrUBHidzwlCZJ8f3TECqFA==
X-Received: by 2002:ac8:698b:: with SMTP id o11mr12834820qtq.148.1622584445481; 
 Tue, 01 Jun 2021 14:54:05 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-61-184-147-118-108.dsl.bell.ca. [184.147.118.108])
 by smtp.gmail.com with ESMTPSA id i1sm11121297qtg.81.2021.06.01.14.54.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 14:54:04 -0700 (PDT)
Date: Tue, 1 Jun 2021 17:54:03 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v1 0/6] support dirtyrate at the granualrity of vcpu
Message-ID: <YLase9l34N7i1C6S@t490s>
References: <cover.1622479161.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <cover.1622479161.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: kvm@vger.kernel.org, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Chuan Zheng <zhengchuan@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 01, 2021 at 01:02:45AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> Since the Dirty Ring on QEMU part has been merged recently, how to use
> this feature is under consideration.
> 
> In the scene of migration, it is valuable to provide a more accurante
> interface to track dirty memory than existing one, so that the upper
> layer application can make a wise decision, or whatever. More importantly,
> dirtyrate info at the granualrity of vcpu could provide a possibility to
> make migration convergent by imposing restriction on vcpu. With Dirty
> Ring, we can calculate dirtyrate efficiently and cheaply.
> 
> The old interface implemented by sampling pages, it consumes cpu 
> resource, and the larger guest memory size become, the more cpu resource
> it consumes, namely, hard to scale. New interface has no such drawback.

Yong,

Thanks for working on this!

Some high-level comments:

- The layout of the patch looks a bit odd.  E.g., you introduced the new "vcpu"
  qmp parameter in patch 3, however it's not yet implemented, meanwhile I feel
  like you squashed mostly all the rest into patch 6.  It's okay to use a
  single big patch, but IMHO better to not declare that flag in QMP before it's
  working, so ideally that should be the last patch to do that.

  From that POV: patch 1/2/4 look ok to be separated; perhaps squash patch
  3/5/6 into one single patch to enable the new method as the last one?

- You used "vcpu" across the patchset to show the per-vcpu new method.  Shall
  we rename it globally to "per_vcpu" or "vcpu_based"?  A raw "vcpu" looks more
  like a struct pointer not a boolean.

- Using memory_global_dirty_log_start|stop() may not be wise too IMHO, at least
  we need to make sure it's not during migration, otherwise we could call the
  stop() before migration ends then that'll be a problem..

  Maybe we can start to make global_dirty_log a bitmask? Then we define:

    GLOBAL_DIRTY_MIGRATION
    GLOBAL_DIRTY_DIRTY_RATE

  All references to global_dirty_log should mostly be untouched because any bit
  set there should justify that global dirty logging is enabled (either for
  migration or for dirty rate measurement).

  Migration starting half-way of dirty rate measurement seems okay too even
  taking things like init-all-set into account, afaict.. as long as dirty rate
  code never touches the qemu dirty bitmap, but only do the accounting when
  collecting the pages...

  Feel free to think more about it on any other potential conflict with
  migration, but in general seems working to me.

- Would you consider picking up my HMP patch and let HMP work from the 1st day?

- Please Cc the author of dirty rate too (Chuan Zheng <zhengchuan@huawei.com>),
  while I already started to do so in this email.

Thanks,

-- 
Peter Xu


