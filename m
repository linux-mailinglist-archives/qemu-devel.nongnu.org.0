Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B603DF124
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 17:11:26 +0200 (CEST)
Received: from localhost ([::1]:52534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAw4j-0006zd-Tf
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 11:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mAw2q-0004dg-1E
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:09:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mAw2n-0006oc-Gs
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 11:09:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628003365;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dDFzIeX51d0htxu4Tqz9FWrsaS+hkrEOV5GffCs84rY=;
 b=MCEzZE8CRBRy50GHx2BRIQg5GG4K/sLRKnwJhT9qVehvhCbvvFVwjm+uk2gB/bCIVTN7pZ
 9REFV16PFomVZuNMSYfdYa+jgD5CMIrtxrN+7QrotHgTxaUUH5DhUUL2rmnC1Y1OT0NUvg
 1GjBFF1VO8rFQ9Lp5b9YEqrgHiPHIdY=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-4dKKaluVPwuUIQtCr2ma_g-1; Tue, 03 Aug 2021 11:09:21 -0400
X-MC-Unique: 4dKKaluVPwuUIQtCr2ma_g-1
Received: by mail-pj1-f72.google.com with SMTP id
 v2-20020a17090ac902b0290176b4310aaeso3315573pjt.2
 for <qemu-devel@nongnu.org>; Tue, 03 Aug 2021 08:09:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dDFzIeX51d0htxu4Tqz9FWrsaS+hkrEOV5GffCs84rY=;
 b=KO7rd/BIZFK9MJa1TP9GcnDvJpKQ75ZheJpD//BokUCKY8sEKs/71t8OUoVLVWGFb+
 83dA+GMoycDfJVF0qvAKTB7+MWY5e/dljFdhfa9PcHmG1lBBhqq9ojSIddB8Q0IOo0t7
 M02ooOpYdT3g7z4GO6RqjlugK0gL2ltuOeeroTdt8df0M2V3ObM4YI0Y+Z+goCi+kUdJ
 /8Y76sDrWvM1Xqtm4HfRyIioNj7Av7o3zoYOR5efxoa46AOiXBjjFNNwGWn5/wkkeEi7
 MEf4MsW0EdV16aSDevZLcRHwa4Ib2j+b8iozawmpSpPBKpegp2CvleZOlbeyoDd9r9jZ
 +GEw==
X-Gm-Message-State: AOAM530rLsUb2IZTzfIOoLqVIbOesofPXDxarQU7+/fa1PmVGw4FlzPn
 4vLNIaSglAmADrB0xFXvoDWTl4jUJGAfYhbEm3takXcX+q30FkmDzBq1KU1+OycehXBDn/5Aoof
 8z0JSHpRHMyikgRHNEaO3QfoAYxkO/LU=
X-Received: by 2002:a17:90a:7789:: with SMTP id
 v9mr24296993pjk.159.1628003360504; 
 Tue, 03 Aug 2021 08:09:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynu7K53xHePQ81X0NP91/Rxm02THtaR1hgzC3pI0XMIT0eDu4d0XByODvmuFu7maxH643dKzZuWq+sdEio+Vc=
X-Received: by 2002:a17:90a:7789:: with SMTP id
 v9mr24296973pjk.159.1628003360309; 
 Tue, 03 Aug 2021 08:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210730143809.717079-1-thuth@redhat.com>
 <20210730143809.717079-3-thuth@redhat.com>
In-Reply-To: <20210730143809.717079-3-thuth@redhat.com>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Tue, 3 Aug 2021 12:08:54 -0300
Message-ID: <CAKJDGDbRWLJqfU9NJuHK4+HUQTtNwZTJGb+Lys399Fv8415U9Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] gitlab-ci: Remove superfluous "dnf install" statement
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 30, 2021 at 11:38 AM Thomas Huth <thuth@redhat.com> wrote:
>
> The container already features meson and ninja, so there is no need
> to try to install it with dnf again.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/buildtest.yml | 2 --
>  1 file changed, 2 deletions(-)
>

Reviewed-by: Willian Rampazzo <willianr@redhat.com>


