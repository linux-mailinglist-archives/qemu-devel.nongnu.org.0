Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F846C4A5
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Jul 2019 03:46:20 +0200 (CEST)
Received: from localhost ([::1]:33658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hnvUx-0005RO-1p
	for lists+qemu-devel@lfdr.de; Wed, 17 Jul 2019 21:46:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35458)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <zhexu@redhat.com>) id 1hnvUe-0004vl-UC
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:46:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhexu@redhat.com>) id 1hnvUe-00016X-2u
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:46:00 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34890)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <zhexu@redhat.com>) id 1hnvUd-00015n-TB
 for qemu-devel@nongnu.org; Wed, 17 Jul 2019 21:46:00 -0400
Received: by mail-pl1-f194.google.com with SMTP id w24so12968396plp.2
 for <qemu-devel@nongnu.org>; Wed, 17 Jul 2019 18:45:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=b2clJEl92S/RqLo9IRUi2/QMjmtnLfWlJv5bJFUXf14=;
 b=K7jFRvySr0SXCps26/a4LKKDPItc4WjjAygvf/Z77SDpvUIAxoZhSOYpnVl5b5qGra
 nwW5DasExDqZDA9p5tU9853Lx0iV2fYcr7Xr6LUsVmipR5Tqqj6zu41nP8zvOKQ9icW4
 Mc5oh7p8FcsxDNMLg9hIuOg3Wu8M6YRn6ZDv4t3IOFXluDeKiuzJ6gao2988EwpFUMrs
 5hKmjZ9ZwRlqw+x9UrXKrRhiXC1x4oYVeOhNL++wlFB8FtrI6M322zw5yur5GWX1DS72
 +RKYZNF3ZHnlCZjctKPpYTeE0lxdQc83hZXkzcKOAj0557Nx7doL6unZ0oo7BtERZ6jX
 Ed1Q==
X-Gm-Message-State: APjAAAWlg9mAfhP6WC+PiFVr23LtSETskxy52ppU2tvB3KMHW+WMvnX8
 fJ09IlHsVfZd2eOU1vRiyYBKKg==
X-Google-Smtp-Source: APXvYqzSC07NwgPVx3Cqu2qlRWC9Az5+Wu62IPnKKV/FyrwcEaZuD/qIDG9iQaRQ1/ituhCo/+g3TQ==
X-Received: by 2002:a17:902:a60d:: with SMTP id
 u13mr47439353plq.144.1563414358860; 
 Wed, 17 Jul 2019 18:45:58 -0700 (PDT)
Received: from xz-x1 ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id q1sm38839142pfn.178.2019.07.17.18.45.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 17 Jul 2019 18:45:58 -0700 (PDT)
From: Peter Xu <zhexu@redhat.com>
X-Google-Original-From: Peter Xu <peterx@redhat.com>
Date: Thu, 18 Jul 2019 09:45:48 +0800
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190718014548.GA14872@xz-x1>
References: <20190718010456.4234-1-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190718010456.4234-1-richardw.yang@linux.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.214.194
Subject: Re: [Qemu-devel] [PATCH v3 0/2] bitmap: refine bitmap_set
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
Cc: quintela@redhat.com, corentincj@iksaif.net, pl@kamp.de,
 qemu-devel@nongnu.org, kraxel@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 18, 2019 at 09:04:54AM +0800, Wei Yang wrote:
> Patch 1 refine bitmap_set a little.
> Patch 2 add related test case to bitmap_set.
> 
> v3:
>   * free bmap
>   * all 1's set correctly
>   * expand range to 2 long
>   * check each possible of offset
>   * add a skeleton to test both bitmap_set and bitmap_set_atomic

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu

