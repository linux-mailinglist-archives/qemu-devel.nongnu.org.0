Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD485142CCD
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 15:06:32 +0100 (CET)
Received: from localhost ([::1]:37138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itXhH-0007nR-Le
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 09:06:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37998)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1itXg8-0007E4-N7
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:05:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1itXg3-00021s-Qc
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:05:20 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:34721)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1itXg3-00021S-Lb
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:05:15 -0500
Received: by mail-ot1-x343.google.com with SMTP id a15so28762262otf.1
 for <qemu-devel@nongnu.org>; Mon, 20 Jan 2020 06:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GD6gQq95fP3zvJb5ULJAL/yah3hbqfvn9T8iW33iqTM=;
 b=Z6aFNavcj0IZthod4cuKemO7YszHym1pYy1WviPwfPABxhabVIz8t2Q/qqtvVrgbOU
 fzMvjaL68E93wuM07HUJE5qYwOnEK4b4gtoL/tWMcQFqSiBkbZYdrbKuFIDyMSOxeoa0
 Ev4sdhcvcA3YsM98E24H0dnjRVJlii+AvKC36p7/ED2MidoHuB9YUsWR39qPnzNWm9Hu
 loEAhzbK3OQddON5lfJY7MY9v1yOyQ8k+Zm7tCY5KIHxnKLHS7aEr9KEwCmv2UTCI1sp
 R4oP3Hg3pcPKKoUT9K4h6mc+d++n0wHhnTDLeTg7361xf9e+fMRsbptm82MHgEtDlTnC
 1A5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GD6gQq95fP3zvJb5ULJAL/yah3hbqfvn9T8iW33iqTM=;
 b=DlzzEi5uedMtArApL92D5LvAiB7wam7mBrf/7rZupkO4nSF1f+l388rsHAtW+R8ZsY
 OxZ9Pyh7Px3iPhGvYLg6jJJkE5xQ6xfuTbres52jDeUl7Kv9d0EFu0b7QRdk4fXWnfsZ
 6XDOhL1y6Fp8PpRsk7XQKUcd4posKH8czssyzIBXe2mfWHOAmzHzVi1qN/eTT5/FbGKf
 AK2LhghnjKS8cpKLA/nK+O2y32t5ExYJsLWZ8x26eIV66cFWK0WiQ3IcEo7XQBlp8/Mm
 Lk/id5BykbW7IsA74ekgMyaSzqywnhAwtMZqePwwVbzvHfenTNaD8GvTpcP5Yibr0UvT
 86oQ==
X-Gm-Message-State: APjAAAUKhvXvoUeav9b/uAzVSZ7A4X/WkpbKZCCjBZH9vWeLT1JwYjaR
 fRir6bMWuSkvC0NxfXePkiax7VDVAJ+J4tt4+Fd72Q==
X-Google-Smtp-Source: APXvYqyI8dTwp6abaZLlkzSIbDhVNsPZZJRTIqJYN8H90Z8KmOqPq93C6b8QADiEf7xvq7HHLnKZUBCxkoVvOdOlYP0=
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr16043779otd.91.1579529114701; 
 Mon, 20 Jan 2020 06:05:14 -0800 (PST)
MIME-Version: 1.0
References: <20200120012755.44581-1-zhukeqian1@huawei.com>
In-Reply-To: <20200120012755.44581-1-zhukeqian1@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jan 2020 14:05:03 +0000
Message-ID: <CAFEAcA8O8LMzXMch2Y6PdyapV_KCv5Dotf1uZ0+goe_6G=HMqA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Adjust some codes about memory hotplug
To: Keqian Zhu <zhukeqian1@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: wanghaibin.wang@huawei.com, Igor Mammedov <imammedo@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Jan 2020 at 01:30, Keqian Zhu <zhukeqian1@huawei.com> wrote:
>
> This removes extra indent and makes some code refactor related to
> memory hotplug.
>
> Changelog:
>
> v2 -> v3
>  - Addressed Peter's comments.
>
> v1 -> v2
>  - Add Igor's R-b.



Applied to target-arm.next; thanks for splitting the patch.

-- PMM

