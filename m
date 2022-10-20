Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6D8606727
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 19:38:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZV9-0001zd-BG
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:38:40 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olZV7-0002KR-Ov
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 13:38:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=p68v=2V=zx2c4.com=Jason@kernel.org>)
 id 1olZUs-0000Po-SU
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 13:38:23 -0400
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=p68v=2V=zx2c4.com=Jason@kernel.org>)
 id 1olZUp-0008Jx-8X
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 13:38:22 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E640561B4B
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 17:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2359FC433C1
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 17:38:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="HUP5qSnM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1666287492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mfqiLaJxRTM3Wv+HxLZJZIvcvIee16bx4CsWtfDr14I=;
 b=HUP5qSnM8HY71r5OkMypY9Ei/CqTZWbKsHlwa5LC6OTycAMGCjMsIqiYNuhxOwAXkpqeT8
 DKdwxlimwOqpsHm78mr7mcOyrkHXLw94jV3sFb+rfXBuDc7LMO11xlSUojA0ug65a/7bNW
 XCXjNnBQ8PySyyiID00Q+tnJNt9apDk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 43d12593
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Thu, 20 Oct 2022 17:38:12 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id i20so81778ual.4
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 10:38:12 -0700 (PDT)
X-Gm-Message-State: ACrzQf3u/Z3zNG6mJ7VDDuGicMzl3J1m9wZ4h1QGHxz7qoHpzZ40ZnhQ
 eBxcUUio+Mn8ZemZ+U8ktBgmYEpHiBxTnCjZnVw=
X-Google-Smtp-Source: AMsMyM7pBbJpAUqaT9R2iqoEIj8Adu2oAH4Azy9Arr9Pp39QoFPSaFggi3mjFw9wtdxP8W31pO8ScRwvjIofEyMWa0Q=
X-Received: by 2002:ab0:78d:0:b0:3da:ecc4:bdc6 with SMTP id
 c13-20020ab0078d000000b003daecc4bdc6mr8863637uaf.27.1666287491852; Thu, 20
 Oct 2022 10:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20221014021653.1461512-1-Jason@zx2c4.com>
In-Reply-To: <20221014021653.1461512-1-Jason@zx2c4.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 20 Oct 2022 11:38:00 -0600
X-Gmail-Original-Message-ID: <CAHmME9ogKZEvw06dOPfQjAiSyPHAPednEA9Qh_urZhBAGd2bkw@mail.gmail.com>
Message-ID: <CAHmME9ogKZEvw06dOPfQjAiSyPHAPednEA9Qh_urZhBAGd2bkw@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] rerandomize RNG seeds on reboot and handle
 record&replay
To: peter.maydell@linaro.org, pbonzini@redhat.com, qemu-devel@nongnu.org, 
 richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=139.178.84.217;
 envelope-from=SRS0=p68v=2V=zx2c4.com=Jason@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -67
X-Spam_score: -6.8
X-Spam_bar: ------
X-Spam_report: (-6.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Hey Peter,

Could you queue this up again like last time?

Thanks,
Jason

