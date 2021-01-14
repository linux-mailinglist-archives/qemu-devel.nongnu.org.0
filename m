Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C05C12F6373
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 15:52:57 +0100 (CET)
Received: from localhost ([::1]:47136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l03zc-0002GG-RH
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 09:52:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l03xd-0000BZ-F2
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:50:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l03xZ-00044t-Qw
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 09:50:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610635848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pNWj3EKZDxhjehbu7lws3TNrxGEHUI6XsyKsjL5DE1w=;
 b=MamEqsuaY72JQ5OkgTBByg5mpGQav4HCTzVZRpwCykAgkdMXSrOxaj+psaZZO8/lnmQsOL
 JHaJAsIiYWKjcH5/4Z92RJ06UCUuJTatzEQvLMeRHNAwiEkBek/Co1VkX3FvJNlcLkW9rT
 6lYxeC1ktC8YnUkHJOadvWx10+Ejk8s=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-0F-Fsi2TNGeBv7q2oUYnLQ-1; Thu, 14 Jan 2021 09:50:44 -0500
X-MC-Unique: 0F-Fsi2TNGeBv7q2oUYnLQ-1
Received: by mail-wr1-f71.google.com with SMTP id o12so2672296wrq.13
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 06:50:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+3CGQtLMjKmZTd4aa8nvG0hGo/4ILU2lW6vQl+WW300=;
 b=Tx+zw2Fnz6XA6qv9RujW/cP2XzTVfZI8ItVgZwHOhATy7qpwATLW9IoI/jSDRg/BJN
 V6uN8mxBI6kcgkc8mJC4WpieElf8Zy3Kv5bojlMYsNiOCYEMSLgQY7FOOjGyGnAX2mXp
 6VYssdd6t+uM2fhnDg138maU9e1EmVumBrO7x9kmtu2TcaW+X54SFQ/gVBng0v2+TLPo
 +ID/c3BDCxWcywupP29rjyydgN/PYe8ELuczbQk6lUNtHRgWWjk2o24Q7b7vJUnBN1v4
 DlPieleBr8M1b1SdD2U8rcBTVumKC8py1u0qrJncOagEm+qE4dJ+ljMSIJyVeZYHt0j4
 MYLw==
X-Gm-Message-State: AOAM533mh3PlL9fOkAxouzIZ6ousVJ4d+mLdBNayu+EBd6ThkYQmeSVK
 mgp3bWF9yDJr8RHW4z3XTE1ifj/A+QXQaVjuG0u+ooZJdFhcR7qxuEpyC/Kzldpxb4+zyaa9sjJ
 TbU225RJRZQ9+9T9x/PKgNqp9XKaxfLPJEotQ/pUZ7YFixoBUoG7HgrgNp+NwOhQX
X-Received: by 2002:a7b:c198:: with SMTP id y24mr4331778wmi.151.1610635843575; 
 Thu, 14 Jan 2021 06:50:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSddFFpfXqWRwxO48K9GClUcqX9gkE2nq04UUlHowwH7H36bBew8UvIi7mqN5wklANH2FDLA==
X-Received: by 2002:a7b:c198:: with SMTP id y24mr4331756wmi.151.1610635843394; 
 Thu, 14 Jan 2021 06:50:43 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id i59sm6477750wri.3.2021.01.14.06.50.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 06:50:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] net/eth: Fix stack-buffer-overflow in
 _eth_get_rss_ex_dst_addr()
Date: Thu, 14 Jan 2021 15:50:39 +0100
Message-Id: <20210114145041.2865440-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Miroslav Rezanina <mrezanin@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Prasad J Pandit <ppandit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I had a look at the patch from Miroslav trying to silence a=0D
compiler warning which in fact is a nasty bug. Here is a fix.=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg772735.html=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  net/eth: Simplify _eth_get_rss_ex_dst_addr()=0D
  net/eth: Fix stack-buffer-overflow in _eth_get_rss_ex_dst_addr()=0D
=0D
 net/eth.c | 37 +++++++++++++++++--------------------=0D
 1 file changed, 17 insertions(+), 20 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


