Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 572FFBB52F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Sep 2019 15:25:28 +0200 (CEST)
Received: from localhost ([::1]:56510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iCOLH-0002uQ-Dh
	for lists+qemu-devel@lfdr.de; Mon, 23 Sep 2019 09:25:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56801)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peterx@redhat.com>) id 1iCOKC-0002MK-Fx
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 09:24:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peterx@redhat.com>) id 1iCOKB-0007ip-IY
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 09:24:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49374)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <peterx@redhat.com>) id 1iCOKB-0007iS-CV
 for qemu-devel@nongnu.org; Mon, 23 Sep 2019 09:24:19 -0400
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5447B83F3D
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 13:24:18 +0000 (UTC)
Received: by mail-pl1-f200.google.com with SMTP id d1so8563500plj.9
 for <qemu-devel@nongnu.org>; Mon, 23 Sep 2019 06:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=51Lvc+oZ4iF9OX/rYG0s6r+aSOXa7YFt6xtyTuSnSTA=;
 b=P2Y7uQIL5ev2Tgmu5WdXpuBWzeCZRVnaChmxqfhW/cS23YjjJRs9mAuVgRgluA8OQq
 LdNGVAfjKWPI2sJR9k/uAnhIPZnmygPbjBGkjgSFNNsGKBqOEJaB35PnBGz6hbtx86z0
 589KmXaTIGvGU2Dmbcbr9fF//c4LyxXgiIBXLbJymO5QxBC1UwWyYBAueDQYV6s8mJj/
 MBkOqhTICrT7SHR7Sw/6PCbbAAabKoji1prHcfmiBVlFZtK0t6b4nawj4ZhFxOBBjK4I
 GdNbQcLp/zeADsd+9n5LOQ/dVJNCoBu2A5MYSqvF3Rc/eM5AaaRnNDElzfgp7japVhVv
 aUAA==
X-Gm-Message-State: APjAAAVtrpMqt5G6+YcjlnapBUNzqfbU6jlCjbOp0aPbLb+8WeS515fZ
 Wzg3ZZ6o6Z/SVSrQBH6+yEeQWs2TLPesOVIj/QojCdhlf5LIS0kwrY6j7MuMp9yPCnDLcNs86tB
 OPDvFOhsLY3xbpAk=
X-Received: by 2002:a63:364d:: with SMTP id d74mr9340803pga.416.1569245057771; 
 Mon, 23 Sep 2019 06:24:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwn7R8ExqL6dOo9RfNbf8CbbqOVquGI7iXg6B+P5lt0xSf+BoNvzTVs9iL98Hj+Fq3p4eit6w==
X-Received: by 2002:a63:364d:: with SMTP id d74mr9340769pga.416.1569245057394; 
 Mon, 23 Sep 2019 06:24:17 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id h2sm18786911pfq.108.2019.09.23.06.24.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 06:24:16 -0700 (PDT)
Date: Mon, 23 Sep 2019 21:24:07 +0800
From: Peter Xu <peterx@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Subject: Re: [PATCH 0/2] migration test tweeks
Message-ID: <20190923132407.GA28074@xz-x1>
References: <20190923131022.15498-1-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190923131022.15498-1-dgilbert@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: thuth@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 23, 2019 at 02:10:20PM +0100, Dr. David Alan Gilbert (git) wrote:
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> Alex noticed that some of the postcopy tests would occasionally
> hang; this series adds some checks to make them more likely
> to assert than hang in some failure cases, and changes
> the migration bandwidth so that under load it's much more likely
> to manage to land in postcopy.
> 
> Dr. David Alan Gilbert (2):
>   tests/migration: Fail on unexpected migration states
>   tests/migration/postcopy: trim migration bandwidth

Reviewed-by: Peter Xu <peterx@redhat.com>

I might be even more aggresive on patch 2 when turning down the
bandwidth. :)

Another thing I thought about on the hang issue is that maybe we can
give a timeout for the waits and when the timeout triggers before a
directly assert in the test case we send sigabrt to QEMU (just like
what kill_qemu does) then we could have a chance to see the cores.
Not sure whether that could help, though.

Regards,

-- 
Peter Xu

