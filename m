Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE276EFB68
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 21:59:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prlGW-0000q0-De; Wed, 26 Apr 2023 15:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prlGU-0000pY-LW
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:57:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prlGS-0002Xl-Vh
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 15:57:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682539040;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=IDAIukCfMo2y0C+BluSJmtJe4ntzk5tJI+tvIWV10tI=;
 b=MiV7ml7BwAFbhcceoMYj/XOLt9uHAxG7B6WPwEoPRrR3H4enQYx7M30pGIlFMiNuUafjEC
 uNDan0TNkCRwOhzlfE0BdnKe+MSy8zumQ8Wnpx9jTLi88tig+JRN8koOZ1Isyyd0/vsXKZ
 vX0RbtmMl+gkGS53MVwd5xtFOXZ7VqM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-Ohq1rnaCPtqmwDgeVY8PcQ-1; Wed, 26 Apr 2023 15:57:18 -0400
X-MC-Unique: Ohq1rnaCPtqmwDgeVY8PcQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3f1757ebb1eso26877805e9.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 12:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682539037; x=1685131037;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IDAIukCfMo2y0C+BluSJmtJe4ntzk5tJI+tvIWV10tI=;
 b=k0S2YtnziiNsf914GHNFs4lcR/fK5Q6qHkkoI04udeuPg21uZIRgIvFcEKRo9TCU/G
 wSzjdMZZfcG2JZQq3WnmtYwwH6NFxPxHLFOY8NsOYzNbhd95nLpb1/ZmAUXtQXGFRBt/
 /h4Ko785/IOavHZCxFCGAQzwuvF2L94YBr2oQ4VCeENdNA1a9tQ8ExDZO8tAq28uqjRC
 gdcDhOlDVJ7fQ/gH5qUWeK+T+3iu5D5qI58yIEYd2x2iE5PrF11qoIEdvQBtcLXTK/iU
 gPIl1wLgDFbiaGtcAeyjrEKh8Wst7mTbD9LXIa5f1+TAqIRnX0Az27o3H3q2PJKlAxV1
 kMlg==
X-Gm-Message-State: AAQBX9dKuyldJV8Q3wEz5QfflA5iU3SVWPL7Y1crW2cNaDd6LDZl16AC
 VDTVA2knRZBTj5Hqp7AdF2auFu0Qep1/luWdwZR7KPRI4xhlN6qx+YaGruFErQelug4Tb9VcfI0
 9p70YHhXf7dRM9x8R/BDgXqJ+JSd4ndld23TwrF+iWe9z9bOmK6/cwdPnojdW/BOXNMfmdZr7tK
 iqX+YH
X-Received: by 2002:a1c:4b1a:0:b0:3f1:7bb5:9d71 with SMTP id
 y26-20020a1c4b1a000000b003f17bb59d71mr13487224wma.33.1682539036994; 
 Wed, 26 Apr 2023 12:57:16 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yz7lu6qeHcxNpUAV0BC0flTXwZbOezkcZd3KJUYaJy5YkiRq/Jv8Gjs7QLAfKtsqFare8UGw==
X-Received: by 2002:a1c:4b1a:0:b0:3f1:7bb5:9d71 with SMTP id
 y26-20020a1c4b1a000000b003f17bb59d71mr13487214wma.33.1682539036663; 
 Wed, 26 Apr 2023 12:57:16 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 ay37-20020a05600c1e2500b003f18b52c73asm18737196wmb.24.2023.04.26.12.57.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 12:57:16 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,  Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v4 0/2] Migration: Make more ram_counters atomic
In-Reply-To: <20230424135509.71605-1-quintela@redhat.com> (Juan Quintela's
 message of "Mon, 24 Apr 2023 15:55:07 +0200")
References: <20230424135509.71605-1-quintela@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 26 Apr 2023 21:57:15 +0200
Message-ID: <871qk6e7s4.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
> Hi
>
> In this v4:
> - Change aligned_uint64_t to size_t to make (some) 32bit hosts happy.
>
> Please review.

self-NACK

Still missing the removal of the __nocheck() functions.

>
> [v3]
> - Addressed reviews
> - All counters are now atomic, either Stat64 or atomic.
> - Rename duplicated to zero_pages
> - Rename normal to zero_pages.
>
> Please review.
>
> [v2]
> - fix typos found by David Edmondson
> - Add review-by tags.
>
> Please review.
>
> [v1]
> On previous series we cerate ram_atomic_counters.  But we basically
> need that all counters are atomic.  So move back to only have
> ram_counters, just with a new type that allows the atomic counters.
>
> Once there, move update of stats out of RAM mutex.
> And make multifd_bytes atomic.
>
> Later, Juan.
>
> Juan Quintela (2):
>   migration: Make dirty_pages_rate atomic
>   migration: Make dirty_bytes_last_sync atomic
>
>  migration/migration.c | 10 +++++++---
>  migration/ram.c       |  8 +++++---
>  migration/ram.h       |  4 ++--
>  3 files changed, 14 insertions(+), 8 deletions(-)


