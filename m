Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4663415372
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 00:29:41 +0200 (CEST)
Received: from localhost ([::1]:48538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTAkG-0006Fy-UQ
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 18:29:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mTAiq-00049y-11
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 18:28:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lsoaresp@redhat.com>)
 id 1mTAio-0003Bu-Iu
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 18:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632349689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CttzFL0dehNIhg4veg7hQnOkOBj/0xk83GhOPj1NSFE=;
 b=fCCs1MGX78LZqHgqf2kaGcFympBfoILGqRGmptQ2QxDNgKfX8xWjX9axO3l8F9s0h5McBT
 OK+/9gW2D1LaOioi+fPHa1BgKfjyy1X1kOoo8lYm6pGZ8eM0avuHduzN+3HGr3rBh+9Wng
 uBjmo3eMR03ZRlXEQbsh9gA0wFAK6nk=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-Xq6cvrM5O4CrDsqTfA5RUA-1; Wed, 22 Sep 2021 18:28:08 -0400
X-MC-Unique: Xq6cvrM5O4CrDsqTfA5RUA-1
Received: by mail-lf1-f72.google.com with SMTP id
 c6-20020a05651200c600b003fc6d39efa4so4292594lfp.12
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 15:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CttzFL0dehNIhg4veg7hQnOkOBj/0xk83GhOPj1NSFE=;
 b=BQhbuS0uqvRb9w1QUE1RpLuezfaV+X7lel0sMUOOmffqBYtbkj2aRVwzpRBx8YCVvk
 BUvopphLgBF/Sq9qzMNz00vOyvP9w8lr4hiSoj/5fzqXIni225Wl1Cylt9YjBNTVcHFC
 33Tp6MLYI3qFaLsZLFsp5HRMBuYb1f6M+/kbIxhNCxVuAyNi4k+RlLA2Q9gPe5+0wjXs
 boJNlPDyiaSJjvIef1O/b7Tpffv7plelIUSS6yHejd1zTOzSMvaXUWBUsJ8OcO8MKhL7
 bkceITjjrDOqkZsYp9sxtrj5L4L/fT7z0OV6O8X9BoXDgkpV4Jew2nm8yLBftQYfgknV
 xPNQ==
X-Gm-Message-State: AOAM530446DUNdMLVtm1r2WboQGR0Y3slIHrJi4EtXIpftMkpuOAOKyR
 T4CXpec1Y/cqy2NvD6njJ+dyz9rryI6aKl7h8dwQtFJAZnTtk+87utHUzUY89+0XsF1MmugajEz
 8zdKmAxd+dt08dcCiuaJKdtfvdrgLDdc=
X-Received: by 2002:ac2:48bc:: with SMTP id u28mr1273323lfg.370.1632349686977; 
 Wed, 22 Sep 2021 15:28:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh00F+r6tLoxR7qQ3ZHnq47BDoTQNiAXtN+aDV/N64DN3sfBMVuv2TGIOa1mH8Bk4ZHQAaYq9ttF9+tJxO5JI=
X-Received: by 2002:ac2:48bc:: with SMTP id u28mr1273304lfg.370.1632349686776; 
 Wed, 22 Sep 2021 15:28:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210922050340.614781-1-leobras@redhat.com>
In-Reply-To: <20210922050340.614781-1-leobras@redhat.com>
From: Leonardo Bras Soares Passos <leobras@redhat.com>
Date: Wed, 22 Sep 2021 19:28:36 -0300
Message-ID: <CAJ6HWG4d6wJfLk_5Lay71=wqGyOPJwX+UaTb5fHrQYShcK_mBQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] QIOChannel async_write & async_flush +
 MSG_ZEROCOPY + multifd
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>, 
 Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lsoaresp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lsoaresp@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I sent an v3 to this series, due to some errors on testing
MSG_ZEROCOPY on a user with a low memory locking resource.
 - If there is not enough memory locking resource, fall back to sync
(non-zerocopy) approach.

Best regards,
Leo


