Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E7B43D52
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 17:41:25 +0200 (CEST)
Received: from localhost ([::1]:41020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbRqu-0004G4-6Z
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 11:41:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35004)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <stefanha@gmail.com>) id 1hbQQc-000728-UX
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 10:10:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1hbQQc-0007t5-0E
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 10:10:10 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:50777)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1hbQQb-0007nJ-Kn
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 10:10:09 -0400
Received: by mail-wm1-x335.google.com with SMTP id c66so10379893wmf.0
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 07:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=ffC1aG7hZ4XkHaHiyYiX05WLpWX7zSqtIwI7hotj3ro=;
 b=rH4X3Weo0ENzv/8LuSVOju3YfrHlMyDGwDndbWgUzC2ZkdQIMZY+1aaviB5WsZrs6K
 flWROxmqiBdKS2o+ltsTBozYtQy2l6Ngh5AuaVUmIeBTAnUZYhDFPEA6qXRd96c2dzjK
 WKlvAeFUSL6uVYv1tEpC4KxgdXu3xSHGM3Z3N2+YvHDwtTparw8cYBNmbRzWgDTbyE/z
 BNwWzybelT68ujD6xQ7lBObWmzMRIJrFqew3bOptEOXK2wKQf6uNBAhQPBIT8xrNvcq0
 WxIuG3Pt9DYyxA6Jg+QC+a9hLZr8GO18mVjoebF2sQk59LS4KOLQSJcDI96MvNQRI45z
 5BrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=ffC1aG7hZ4XkHaHiyYiX05WLpWX7zSqtIwI7hotj3ro=;
 b=mWsBTTpeIcTL9Ran04hz5JIA4/bfvIF1rfppBhqXt3iQ6nhn6zO8F79MgF1N5i43lr
 yJo55/vNNqIWtXOW93yhMTXKa/dmW+YVy4VQNWMVU0KaPVFhNIg099AvJo45zHRPprMG
 wcr2J+TD1rEdNZiVcyZs0usFDidLbUdgC4+aebDBxY8UacKy8Ewqpd44tIFOSd+PNdmB
 N+AV/HaK8hEj3ySijvpAMi0JqWFZEn1XEbocP8k3edlAdUFxJB8IhyWCCEuGQljxIoNz
 Em+nY+Q75EzPp4+8U//vbXayEBfoPLxtNW3w69VMLiv+SfBOfqGzSSDzcl2sBI1QsRtR
 VLzA==
X-Gm-Message-State: APjAAAWUA8ps0PArsPWDDFZsLAIF9HzYqQhX12YxeC4c/u7MSDGepgfA
 vkDN5CzK/ZzdZLbJoDGNajQJ9ABtdgD+beoYDyo=
X-Google-Smtp-Source: APXvYqyb1Qi0Yo8z/20CyRdFh907rRVc9JIiyPbq3ZZWZ81RjwQkr1y9k2pHBXs3R6aBWRRMouGlZ7reAx/g7dR/sn8=
X-Received: by 2002:a05:600c:2149:: with SMTP id
 v9mr3911197wml.141.1560435002671; 
 Thu, 13 Jun 2019 07:10:02 -0700 (PDT)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 13 Jun 2019 15:09:51 +0100
Message-ID: <CAJSP0QUqcEOMtme7Vhq_mh_TaW4msPnwqXy9DKz0ULK0ychiZA@mail.gmail.com>
To: Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::335
Subject: [Qemu-devel] KVM Community Call: Discussing multiprocess QEMU
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
 John G Johnson <john.g.johnson@oracle.com>, Jag Raman <jag.raman@oracle.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Juan,
Please add multiprocess QEMU to the agenda for the KVM Community Call
on June 18th.

Can you share the dial-in details again?

Thanks,
Stefan

