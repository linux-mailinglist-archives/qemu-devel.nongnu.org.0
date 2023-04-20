Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A50EB6E9420
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:21:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTGd-00015y-2f; Thu, 20 Apr 2023 08:20:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppTGQ-00015Z-CD
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:19:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ppTGO-0006lg-3O
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:19:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681993187;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CGDKsaHcIDf8U8c74UGJv/H1Pgn0D/NIBygW8ZUDVj4=;
 b=SHgmQoddF5HAhlyi+U96OdoO/JqlTHXf3C+qFXialEKIYda1Urh8uT9n6WNxQAtGSoFAz5
 PD5WvEuekQTL3ylGGiveS1/hCs2xiz/NQqTFt+DlbZYog9/xKEzTXnc8dkvcqW5zfHqHI6
 Vu8rNZgY4NzOxhzRl+mS5xLS7pDbRe4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-20-Gv6_0De8PWCJ1_t7LQlLsw-1; Thu, 20 Apr 2023 08:19:38 -0400
X-MC-Unique: Gv6_0De8PWCJ1_t7LQlLsw-1
Received: by mail-wr1-f71.google.com with SMTP id
 j16-20020adfa550000000b002fee71f4a42so70445wrb.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 05:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681993177; x=1684585177;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CGDKsaHcIDf8U8c74UGJv/H1Pgn0D/NIBygW8ZUDVj4=;
 b=VzKg87CNL1I5X0PzK45TELrYYJrpCzp13OW1O4HovT7yoP0q+mTE35nChYyN0WNcxx
 UhYyxXwiwe3vQgEqLVKWipR+MY+9VKgaavqOvrNVQ2QQN9rqwChWx0mp5D398q59skKT
 uJyne0f8tzZlbzsPDKbJQTFx9uBG7cHhbQwE5HJejS1pK1iF+gFg1mmBm27f26n1ZcfW
 nhNyr5KQbogw4+gM0aEoutWwq1GgbcDIbsduvNoAQBysWrxPoYvJjkZcKLPFmrJ1Kizp
 qJcB5Tqag5uvNCNuZSBmvAUWEx6pChch66r/GNf0oMsazNaKDu5chEZNzQN89e0miAPr
 XRJg==
X-Gm-Message-State: AAQBX9dWc2aDR9RhxC3aQ6TvoV6uvaCq9nECcqW2Gylj0mAUSmN8+jZ1
 FzvCgnxNxV118z3UypE2x1eyu1d8fDdkq+sjYFXIas/KMNgOS2IjW7COeRnl4aokmkJOkGRlURk
 RKoB1fQyyZHv62wOAvPdR16ZHLbDnnpI/q7x36P8kshBmPDWPJb7hVfhXB08ezoU6qasIFwWoY9
 9gHjjq
X-Received: by 2002:a05:600c:2191:b0:3f1:73c1:d1ad with SMTP id
 e17-20020a05600c219100b003f173c1d1admr1082171wme.35.1681993176787; 
 Thu, 20 Apr 2023 05:19:36 -0700 (PDT)
X-Google-Smtp-Source: AKy350YYc4T9KTkCPycbDv6xDBX3EKiDz9Z2WqLcVrdrM5lC6nEPVALwq07FO3rM5qEnIdO6Wrh5cQ==
X-Received: by 2002:a05:600c:2191:b0:3f1:73c1:d1ad with SMTP id
 e17-20020a05600c219100b003f173c1d1admr1082152wme.35.1681993176393; 
 Thu, 20 Apr 2023 05:19:36 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 21-20020a05600c22d500b003f17131952fsm1891337wmg.29.2023.04.20.05.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 05:19:35 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Xu <peterx@redhat.com>,  Leonardo Bras <leobras@redhat.com>
Subject: Re: [PATCH v2] migration: move migration_global_dump() to
 migration-hmp-cmds.c
In-Reply-To: <20230420120257.24790-1-quintela@redhat.com> (Juan Quintela's
 message of "Thu, 20 Apr 2023 14:02:57 +0200")
References: <20230420120257.24790-1-quintela@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 20 Apr 2023 14:19:34 +0200
Message-ID: <87ildqycdl.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
> It is only used there, so we can make it static.
> Once there, remove spice.h that it is not used.
>
> Signed-off-by: Juan Quintela <quintela@redhat.com>

Nack.

Sent the wrong version of the patch.

Look at V3 already on the list.

Sorry, Juan.


