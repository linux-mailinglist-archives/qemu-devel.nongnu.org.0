Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E36226110B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 14:04:00 +0200 (CEST)
Received: from localhost ([::1]:33706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFcLv-0003hF-6C
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 08:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kFcL1-00039I-4H
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 08:03:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38388
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kFcKy-0004RU-Pn
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 08:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599566579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=25v9443PUJOrUYgY5UT1r73qOGsJnCX+v1XCLzedR7s=;
 b=IKeDYvDEbD+puaT4dIosXdEJcEzcJpFSW4fHmOWkxS8h4SfIx5iuDt3EretZZme4w/XSqc
 b3jk7OcHsOhoOyoJnBlGysG4hbulU81AlNK2veeYvGXxV0EBrVZLgtSIHFoJaOuGIsSaEG
 KQ4vo7MXFiJjyCX3gwukJuxqpBExCTc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-ydsSL3XKMtievugJ1KKI7A-1; Tue, 08 Sep 2020 08:02:55 -0400
X-MC-Unique: ydsSL3XKMtievugJ1KKI7A-1
Received: by mail-wm1-f70.google.com with SMTP id x6so4655436wmb.6
 for <qemu-devel@nongnu.org>; Tue, 08 Sep 2020 05:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=PWic+7ZrjKdbGM8jmorQVv/9NjTWO9cSwLc0ZULdpfc=;
 b=JmAr/WyDBkq/XJc6m83zacgW7d3Z01dIJDB5Q+ItHDcw/ON/zpnkD69TZ4yBxXnDgH
 +HRx5Sx+LlLndNQQVydryRUHbFWfWp/69iSXJyVj8nl0yIaCs2lVNemCJhlpxsOqKStS
 P5ZR3v75JXkExwVz4BhPfjbriIG4Venao62d3HBUVOhAS2jcM+DqSjEepS4E2NuLztyZ
 5o4MfZyjOHnwG77Z8j+B4ACjODgu07znVaJuD9c9A54546SEr4h9chZY+3e2kVfNBWB/
 fxU171J5YW0ymwaaFJYMCCYH0n5AOwDYygcF6wIMoo0vpjtS8r7xbZNkMCi4/DloxpZO
 /APA==
X-Gm-Message-State: AOAM533c3hmvzZQtssuOSYU0ctmgqENO4gd6dSx5G5b8k31+z3mtPwhv
 oD3GIeQf9icP5+XvrMCiKqn8INO4e7dC74QwBd/Do74bbQZvU8HgcZY3yd3kywr+R/TTDfw/wyq
 qPA2yVEXT8dLqkFA=
X-Received: by 2002:a1c:5685:: with SMTP id k127mr4228470wmb.135.1599566574230; 
 Tue, 08 Sep 2020 05:02:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxSK43+JAgIfWuFosyHZGf9NqjKFJIHcbZk1sH1mBCIqKhj+FsGPHb+Ur1gxG5TetRvYcR66g==
X-Received: by 2002:a1c:5685:: with SMTP id k127mr4228455wmb.135.1599566574036; 
 Tue, 08 Sep 2020 05:02:54 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-221-30.inter.net.il. [80.230.221.30])
 by smtp.gmail.com with ESMTPSA id o6sm32519397wrm.76.2020.09.08.05.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 05:02:53 -0700 (PDT)
Date: Tue, 8 Sep 2020 08:02:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Subject: Re: [PATCH 04/10] tests: acpi: tolerate "virt/SSDT.memhp" mismatch
 temporarily
Message-ID: <20200908080241-mutt-send-email-mst@kernel.org>
References: <20200908072939.30178-1-lersek@redhat.com>
 <20200908072939.30178-5-lersek@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200908072939.30178-5-lersek@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=mst@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:10:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 qemu devel list <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 08, 2020 at 09:29:33AM +0200, Laszlo Ersek wrote:
> ... to let "check-qtest-aarch64" pass until we refresh the AML after
> advancing the edk2 submodule to tag edk2-stable202008.
> 
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
> Ref: https://bugs.launchpad.net/qemu/+bug/1852196
> Signed-off-by: Laszlo Ersek <lersek@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8bf4..e569098abddc 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/virt/SSDT.memhp",
> -- 
> 2.19.1.3.g30247aa5d201
> 
> 


