Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C57B6368D7D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 08:58:48 +0200 (CEST)
Received: from localhost ([::1]:33254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZpm3-0002I7-Tc
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 02:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ralph.schmieder@gmail.com>)
 id 1lZpkI-0001oG-Vb
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 02:56:58 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:44928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ralph.schmieder@gmail.com>)
 id 1lZpkH-00016p-7i
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 02:56:58 -0400
Received: by mail-ed1-x52c.google.com with SMTP id z5so19776477edr.11
 for <qemu-devel@nongnu.org>; Thu, 22 Apr 2021 23:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=HePghRm1SKvRYqSW2kvTrWSttypTPuADjCSFbK5ahzY=;
 b=rBYi9nHtXNRQM84n021fdNosQoh0aQKKWXyZyoW/ALSlMi+sKjE7FW7XoSAAfbJt8u
 SJJvUlVKLLvdqgN40CVHnyjApNOCjtN//mHLqVihX2PrLmGPMVUeKF4StCcMi6w0PgBp
 5kUC3MH8uF7jDVpH63dF1w7nrwYmWbkUJMU8dCI5TaCpu9e1pFWJPJ7VypdxTTJRTMVr
 HS3GRI+lCa1tqoBv6d9/j/XBUhcGSp2TiWzgKIiF1IEDPPPAo6cJiz5LJslD5P+5lGrL
 X4UmVW4h3Ojgxgz328oSa2h0ejn6aZuqFhRarXrdAMWIHf3uZtAQ5e+Wv+9xJwidD83F
 vjgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=HePghRm1SKvRYqSW2kvTrWSttypTPuADjCSFbK5ahzY=;
 b=kv3uyYhzTEYoyM0MaCnX2qBEfhKJdo2/+0AHqZq5BmJJ8z0DaWqqcG2GfUkk+6BSLc
 l7wqbNpbAL5OIu6IYqBijIpw36q8yf4lM5PddUPo/cHda15n5cmg7bVbwmz/q7BJsgJa
 IgVXkfr3E0qTIRqAyFY7xG6kGT3PDTCqnbS2Lk3JAWpCBOg+pPyDgmGgA4jX3ZCKuxSz
 XsadKxFErnCOj5SLmPG0y+2srLu881yfYbhVTYV1fuW+ggQuNHNUR/muQUEIQAkQFoqC
 KamwxJmANaGQqxaxpPV6FW8rSF2VMbfMLHwNwInPnrMz+Cte9c3bqc9j4+rmQkbE4j5T
 AKjw==
X-Gm-Message-State: AOAM532CUoQQhebxdIt0WQHiSILf33yTE7enW13PDTFdbA2qxt/e43TG
 MBfmxFV5GhiTVtgIWrVkguTF53LzICc=
X-Google-Smtp-Source: ABdhPJyP9s2lKUZU9w2aRheOxenl05mwm0jamH/HJKAUcq9WpTBkktSDGll5aP9YwDla0CFqnVnQfg==
X-Received: by 2002:a05:6402:202a:: with SMTP id
 ay10mr2650967edb.225.1619161013074; 
 Thu, 22 Apr 2021 23:56:53 -0700 (PDT)
Received: from ?IPv6:2001:470:1f0b:bcf:b1d9:4594:13e6:bf00?
 ([2001:470:1f0b:bcf:b1d9:4594:13e6:bf00])
 by smtp.gmail.com with ESMTPSA id a17sm3271201ejf.20.2021.04.22.23.56.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 22 Apr 2021 23:56:52 -0700 (PDT)
From: Ralph Schmieder <ralph.schmieder@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: socket.c added support for unix domain socket datagram transport
Message-Id: <1C0E1BC5-904F-46B0-8044-68E43E67BE60@gmail.com>
Date: Fri, 23 Apr 2021 08:56:48 +0200
To: qemu-devel@nongnu.org
X-Mailer: Apple Mail (2.3608.120.23.2.4)
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=ralph.schmieder@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hey...  new to this list.  I was looking for a way to use Unix domain =
sockets as a network transport between local VMs.

I'm part of a team where we run dozens if not hundreds of VMs on a =
single compute instance which are highly interconnected.

In the current implementation, I use UDP sockets (e.g. something like=20

-netdev id=3Dbla,type=3Dsocket,udp=3Dlocalhost:1234,localaddr=3Dlocalhost:=
5678)=20

which works great.

The downside of this approach is that I need to keep track of all the =
UDP ports in use and that there's a potential for clashes.  Clearly, =
having Unix domain sockets where I could store the sockets in the VM's =
directory would be much easier to manage.

However, even though there is some AF_UNIX support in net/socket.c, it's

- not configurable
- it doesn't work

As a side note, I tried to pass in an already open FD, but that didn't =
work either.

So, I added some code which does work for me... e.g.

- can specify the socket paths like -netdev =
id=3Dbla,type=3Dsocket,unix=3D/tmp/in:/tmp/out
- it does forward packets between two Qemu instances running =
back-to-back

I'm wondering if this is of interest for the wider community and, if so, =
how to proceed.

Thanks,
-ralph

Commit =
https://github.com/rschmied/qemu/commit/73f02114e718ec898c7cd8e855d0d5d5d7=
abe362


