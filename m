Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A0B3BF394
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 03:29:09 +0200 (CEST)
Received: from localhost ([::1]:36292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Iqi-0001O5-Mx
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 21:29:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m1Iks-0003pr-1l
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 21:23:06 -0400
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33]:34679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1m1Ikn-0002JP-Fl
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 21:23:05 -0400
Received: by mail-yb1-xb33.google.com with SMTP id y38so6312393ybi.1
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 18:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a/3DrUBxNREEYxksQsuEp127pWoPnos3YU5lXML7bqs=;
 b=raQgJ7KHM5ZjAcT9PUzX6TbzpPlEkWXD6XDq2moKT+VoFH4uVQkxnKpSSEzjoYFb1u
 4Bo38QUmU/daFD2ZGQW1WkFJauHWjP386tWnngHNNr4wbVdkQCQUd3+E2AkLHYXhRqDH
 /3oU+hIxkbU22zbdOmGxx9UI5zHBMKBwx+e0v1tVaxcKKIyvZ7JYvm8X39bBwVH2Rj+0
 au5g0VEAqsBIkT9dPrW0Ma1E/fpSppfT9Yviw7Q6NwnzlgOguUMkqsKy/e65ZlBNmtiA
 56UnEs9xqG1ScaQGpPJpvco78KTHFXe9r74PO61VN1SRHr2+P7CbyrV++VyUMyf9V9Gy
 sK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a/3DrUBxNREEYxksQsuEp127pWoPnos3YU5lXML7bqs=;
 b=pwyQnJVWrLEd4NDnj4DtEIV6cDaH3sWZkCtqJtsZy1jIXXdRUmLNSHkCAJ1r+uEM5r
 N2Evw8h4Vib7t2CwfKZPu/TQRVzIOoGDjSeaeBSoKqPEAMKpEgYrzN+YulEvlYbrPENn
 A4S6A9PlGUoM/WJRhUreOOwB9KOnKmI2kT1sqSrjgufrJj/axETCZOLBUuyVHY4UBNs4
 WcDyv3Vch0aSjEBI/boK5vFON2LNd34OoL4ymOQFIrSva5M5nNStEDVUMh6GqS1LXuCq
 y2KYiQuJftZoT4jkQMOa46iYab7JDT4feMgxuybZHI0PDBHi2LaLO+YRXOCLhzO1wfq7
 F5kg==
X-Gm-Message-State: AOAM533LsNzSbh5r94y6cN7lQ0xxwtx+detqwjB5+EpLM9FgIzGyWFlr
 bXRVyncY4jVENdRz/B2XqadC9u/mCx2QYUU6VNggszJh
X-Google-Smtp-Source: ABdhPJxLSlYmlxQoYZLmaxjTmCYZbtw9jThz3KZxhlv77MbdK8E6hfBp+pzJNwlcOIkeTwvb8XDYu76IMANUuvkN3S4=
X-Received: by 2002:a25:dcd:: with SMTP id 196mr36682774ybn.306.1625707379540; 
 Wed, 07 Jul 2021 18:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210706043124.1871866-1-bmeng.cn@gmail.com>
 <20210706043124.1871866-2-bmeng.cn@gmail.com>
 <YOZNo9N0hpcVRV6Q@yekko>
In-Reply-To: <YOZNo9N0hpcVRV6Q@yekko>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 8 Jul 2021 09:22:48 +0800
Message-ID: <CAEUhbmWs=F7a4Ox7KZ-F9eBe81Ysh+Jw9HqFRyd4AC28Z5LQqg@mail.gmail.com>
Subject: Re: [PATCH 2/2] docs/system: ppc: Update ppce500 documentation with
 eTSEC support
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb33.google.com
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
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi David,

On Thu, Jul 8, 2021 at 9:08 AM David Gibson <david@gibson.dropbear.id.au> wrote:
>
> On Tue, Jul 06, 2021 at 12:31:24PM +0800, Bin Meng wrote:
> > This adds eTSEC support to the PowerPC `ppce500` machine documentation.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> Applied to ppc-for-6.1, thanks.

Thanks!

Are both 2 patches applied, or only this one?

Regards,
Bin

