Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FF1A3A9F2F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:34:22 +0200 (CEST)
Received: from localhost ([::1]:39508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltXYb-0007RE-1Z
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltXXF-0004h3-GU
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:32:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1ltXXD-000454-U7
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:32:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623857575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GSfA3LIEYO9BRCcMabtBjOyLOXb6hhrJLbP1tPEzWs8=;
 b=SLeVgF+1eBnvJpScpBKwlOzsDIkI3OP9yLDtHUMpeMrVJmoE3xhG+DTXpA0PwGRX0daMxz
 UPGivx+8rm1A0bGcsz2iZpzuuHEvirNALmgiJ13QR2THE3Hzr03U65NI9uXXyJUqbRxlEO
 HagaNLdId4WLVPrki+wYRKPsiSZJxHo=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-161-4mizqzQ8PZ6K8jLwyINC2g-1; Wed, 16 Jun 2021 11:32:49 -0400
X-MC-Unique: 4mizqzQ8PZ6K8jLwyINC2g-1
Received: by mail-qt1-f200.google.com with SMTP id
 62-20020aed30440000b029024cabef375cso1892367qte.17
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 08:32:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GSfA3LIEYO9BRCcMabtBjOyLOXb6hhrJLbP1tPEzWs8=;
 b=YOClLrk7G0mKLuFug40B3S8ubNAHV9Y+rV2H5444yAqTRPOTCT/us6o6HxeQlmqEo6
 +YKJvNAlZ61g5eUy43jIl3Wd4/ptvykDamOxdIgu3/Li70Yf1jZWWbZdE6WLctc5/H1d
 HhBL1L35i+m+VHKJPfaHHqX3WvP1vvjOj5SXknd9lLJvoIAG0rTJ7GytViNywtKaIXx0
 bXRPCGKaBDkauDq569r7pY1KlTLJBH57Qi9cCCkcuEjVXYXurD+TDVSAGhjhAf92VjBJ
 lG/+X+HCVOuHklSo12SPElzqG4O/5sSIipAJkhZ0HML1ktc1cYjK+X3Ov3yeikyKcN/k
 Diwg==
X-Gm-Message-State: AOAM5302mQDhs1wzfS8SHTX0qbJkbwQPxnyIJdOR8sSOS3hoiwXACpVF
 bl3wA55j1XAI+Di8WYuOTAHxLu41Go8I3s/dm7YRpAFdCVWHs8iBPFXGcw6DKUt3gwcoiejzSPJ
 IAIL4xlBY9xFj73I=
X-Received: by 2002:ac8:5657:: with SMTP id 23mr464931qtt.98.1623857568779;
 Wed, 16 Jun 2021 08:32:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwBKeH6DpdUPvvjE2bq/mbR7cIDcemSNRcSGYFRJuYJdpQuV7eUznFTz6yJ3sKb0Mfzj1NBg==
X-Received: by 2002:ac8:5657:: with SMTP id 23mr464913qtt.98.1623857568607;
 Wed, 16 Jun 2021 08:32:48 -0700 (PDT)
Received: from t490s
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id t139sm1717341qka.85.2021.06.16.08.32.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 08:32:48 -0700 (PDT)
Date: Wed, 16 Jun 2021 11:32:47 -0400
From: Peter Xu <peterx@redhat.com>
To: huangy81@chinatelecom.cn
Subject: Re: [PATCH v4 4/6] migration/dirtyrate: adjust order of registering
 thread
Message-ID: <YMoZn360HXTAUUk3@t490s>
References: <cover.1623804189.git.huangy81@chinatelecom.cn>
 <5df3137cdd9661186e1df0ca0e2bb049e3c30308.1623804189.git.huangy81@chinatelecom.cn>
MIME-Version: 1.0
In-Reply-To: <5df3137cdd9661186e1df0ca0e2bb049e3c30308.1623804189.git.huangy81@chinatelecom.cn>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Wed, Jun 16, 2021 at 09:12:30AM +0800, huangy81@chinatelecom.cn wrote:
> From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
> 
> registering get_dirtyrate thread in advance so that both
> page-sampling and dirty-ring mode can be covered.
> 
> Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


