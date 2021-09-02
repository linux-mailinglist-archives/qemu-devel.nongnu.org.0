Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4C03FEA05
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 09:28:27 +0200 (CEST)
Received: from localhost ([::1]:45272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLh98-0001HW-Cu
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 03:28:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLh7u-00089J-6M
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:27:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mLh7s-0004We-P0
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 03:27:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630567628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iEXXP9fGTV3ggi04yDaEoGJ+ZgmxLi0b43lpowpq6Uw=;
 b=RdvPnn8xanqvhgQrvhtpKTZAbcKrCldkx/YdifyvUMXH+pt4gn2ZnwTDNx0hhsgw50TCme
 2zcQYA3LdBgnahPdYWdGuMX/bwpIXYJ+8TDBrlM4QyymF01npsx2teaph402nC80QNiTnv
 P1wPEX4Fi0u/mMjBw91TMoPK8COrZnA=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-QS2uuyzVM8SuoRH12bMjqw-1; Thu, 02 Sep 2021 03:27:05 -0400
X-MC-Unique: QS2uuyzVM8SuoRH12bMjqw-1
Received: by mail-lf1-f70.google.com with SMTP id
 q3-20020ac25283000000b003dedfdcf716so455782lfm.20
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 00:27:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iEXXP9fGTV3ggi04yDaEoGJ+ZgmxLi0b43lpowpq6Uw=;
 b=Ac5Jz5K8Ftd0GuquzDZj/G/qD4YsG7+nJfk55maOWJqjxGE4o5rSUJhw5gTV+NfgDF
 JxCX51ez5LXtYR0tNa81zus1lt2dWNPeRK2cwtYrgOAs6k3v4LCnskNUG+dXUujq+Psn
 9GHi0eYr/4fZXEgohI1/9ihjY6mylt5+an/lHWxvnCTPYMthwL5AIE5tM5adq1nMgtek
 uAMx1ZNN55zgAVtyy++5fr5LpV68WVNsWzw+CqnHTeu5WOLqeNgQEN5z0L9rl8mPMqyT
 cRVr44nuBCDMjlj4AM2GyRj6awbs+L7XLJRwcyc5hNfYbZ7A7eQjnr9lYkpDH0pph0tz
 H22w==
X-Gm-Message-State: AOAM532Ln+/hZ+qGG3LYW4pX213QN15iezPR5sq9U1veg5p9oaDAcPdf
 kMcw56wjPm37qCXk+oWqtF362Xul+hD1gBMWMtr9MJbGl+h1GQ3E802reqwJhx/NXvPigwBKiYZ
 Qw4kchZNIKTMWPYgcuyS3RF0u1gQ9rz4=
X-Received: by 2002:a05:651c:10a2:: with SMTP id
 k2mr1378211ljn.262.1630567623327; 
 Thu, 02 Sep 2021 00:27:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx6eh8Pgn/5MimyjfksiNrDG0fkNAHMcck/xShRHyrf92n9TE/xU5+JyBk1ipDqJPx533CvaE0tFT8mDcLx30Q=
X-Received: by 2002:a05:651c:10a2:: with SMTP id
 k2mr1378199ljn.262.1630567623169; 
 Thu, 02 Sep 2021 00:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210831110238.299458-1-leobras@redhat.com>
 <20210831110238.299458-4-leobras@redhat.com>
 <YS4rulGV9eueB04H@redhat.com> <YS6RFcQnZEhE8XpG@t490s>
In-Reply-To: <YS6RFcQnZEhE8XpG@t490s>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Thu, 2 Sep 2021 04:27:14 -0300
Message-ID: <CAJ6HWG4+5YtWBB8D_OdAEH-_JM_PE4pff12mvtgia0wcXAC2FQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] migration: multifd: Enable zerocopy
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Fam Zheng <fam@euphon.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Peter, thank you for this feedback!

On Tue, Aug 31, 2021 at 5:29 PM Peter Xu <peterx@redhat.com> wrote:
> Yes it would be great to be a migration capability in parallel to multifd. At
> initial phase if it's easy to be implemented on multi-fd only, we can add a
> dependency between the caps.  In the future we can remove that dependency when
> the code is ready to go without multifd.  Thanks,

I thought the idea was to use MSG_ZEROCOPY whenever possible, and otherwise
fall back to the default copying mechanism.

On replies to 2/3 I mentioned a new method to QIOChannel interface,
that would fall
back to copying, and that may be a way to not have to use a capability.

Best regards,
Leonardo


