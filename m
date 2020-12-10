Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04532D6A69
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 22:58:22 +0100 (CET)
Received: from localhost ([::1]:55012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knTx7-0006EL-5s
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 16:58:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hgcoin@gmail.com>) id 1knTQL-0005nh-1t
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 16:24:31 -0500
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d]:45152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hgcoin@gmail.com>) id 1knTQJ-00008n-Jf
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 16:24:28 -0500
Received: by mail-oi1-x22d.google.com with SMTP id f132so7374618oib.12
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 13:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=KeCVqZm2/0dGy8P7zNg3fjvGxxoUT3rvXtKbkGpsypE=;
 b=sqEmBHpJThlmvLn3rNj/0SrsZP2/MHHJ33Wsd9py2X9yLKI54ejbQm3F9Uh6rPaMOn
 364wcbyNQwUI7DSxCPID7HQMBHlj/p0XcIo3NtT2AQ1gfMg59bF0/iHrzB5rvikob3h0
 EgKhMtN/MabgLcoxdcHGBjUjwneXSlMeN4AJk+80vFhHONvl4l5e+2wdsnOjD8ygNvUA
 0DSB7ArYoRlUhssDf66/PmXKPajUChSKRCOqHxljbp1CIsPk+erMR3nKDMCi5DoMR9cF
 8Efg5bqvurcr9uD8mMOf5zXoAa4Uwkl192rwBZYiFf+MMFyL3hdRu7iykMUWMY5m+iiQ
 72WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=KeCVqZm2/0dGy8P7zNg3fjvGxxoUT3rvXtKbkGpsypE=;
 b=Kf7z9xN3UNZI105GGJJgAMwzCF06dx78dKsOI3x+b2qAi5NIQ6L060dYng7OmlHLPW
 mwoWJmXNCdlJlbg9kSkqahOHK9ScXf4pVDwx0JltnHJ/2fVBhjMMt4SWANP1XKGxzihP
 fdLkGPNsSbz9Dt5muvTGX2exQs0XZj3RpT4SeE6ZRBnBqP462rEdk1G/3y6T0GtrRfHW
 275XPAoS0KofGnXiKY+Q2/hV0mItqoj0qQ7Pd0roRRNT/ylRfzUokI8kX++fBwaSa5Hk
 kjGTdO1sJQGVUOo+zqP3m4D7kghuTUoRngNdXMkpfoVGO6sMJSJB5eb346uoCFgnlSUC
 xuxQ==
X-Gm-Message-State: AOAM530Xxwm1c2O/QfbpchhD6kae38i7ZFvsguRL3ydpdChbkbyAPlkv
 KPCfpfThmpRixkp0fj57POeZ3g6qSuw=
X-Google-Smtp-Source: ABdhPJxffnYDhedGWXaRe3zzaQZXgW6AdcLYKF/eJvCM9VmORe0Iuscfh5QWy9rhvXWmiQKSCtx9Gw==
X-Received: by 2002:a05:6808:9a:: with SMTP id
 s26mr6971648oic.124.1607635465874; 
 Thu, 10 Dec 2020 13:24:25 -0800 (PST)
Received: from ceo1homenx.1.quietfountain.com (173-29-47-53.client.mchsi.com.
 [173.29.47.53])
 by smtp.gmail.com with ESMTPSA id 60sm1350007otn.35.2020.12.10.13.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Dec 2020 13:24:25 -0800 (PST)
Subject: ceph + freeipa ubuntu/fedora common small bug
To: Vivek Goyal <vgoyal@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20201207183021.22752-1-vgoyal@redhat.com>
 <20201207183021.22752-4-vgoyal@redhat.com> <20201210200303.GN3629@work-vm>
 <20201210200931.GA185111@redhat.com>
From: "Harry G. Coin" <hgcoin@gmail.com>
Message-ID: <97a0de57-8422-2fdc-e16e-0d6f133f615c@gmail.com>
Date: Thu, 10 Dec 2020 15:24:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201210200931.GA185111@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=hgcoin@gmail.com; helo=mail-oi1-x22d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 10 Dec 2020 16:55:00 -0500
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
Cc: virtio-fs@redhat.com, lersek@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FYI.  Same thing we saw on Fedora installing freeipa, this on ubuntu
with ceph.  Identical bitmask report.

...

Fixing /var/run/ceph ownership....done

Cannot set file attribute for '/var/log/journal', value=0x00800000,
mask=0x00800000, ignoring: Function not implemented

Cannot set file attribute for
'/var/log/journal/fd007229322043ad8778c214d19ed3ac', value=0x00800000,
mask=0x00800000, ignoring: Function not implemented

...

Host has xattrs on, btrfs.




