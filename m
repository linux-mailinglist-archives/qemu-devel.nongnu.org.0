Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0DB3868E
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 10:54:48 +0200 (CEST)
Received: from localhost ([::1]:47018 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZAe7-0001a2-2j
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 04:54:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35836)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hZAdE-00018p-D2
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 04:53:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hZAdD-00089d-Fn
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 04:53:52 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45626)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hZAdD-00088C-9i
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 04:53:51 -0400
Received: by mail-ot1-x341.google.com with SMTP id n2so1132593otl.12
 for <qemu-devel@nongnu.org>; Fri, 07 Jun 2019 01:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/VG5TUcHK28EUa7eURC83MWfCIRXMFJIi6mDFPjt1R8=;
 b=Vwbk4Y3JS2mbXejtOa5P/Hb9L6G+NT+PJ3Ymmie7BvJX3myOQorbzEDhh4jBKQs4DL
 Uu/qXOnT7gLu+d4nMWOUGYKA+gM3iGxt/bpBqRoTtasJ5+MSUBWep2CCOPzTLx5OMMc9
 H50g/C6mDJGj4GF/RbTI+r600PKMGcMYjSPK5sXaU/IXhcx9xyUu2yUKTGLT+iIaqRxP
 W6RfiTyG1d2K1+Yz6IXzsA19fedQanV8/eJ7uGiLLTB6IBqGO3tLqBhqpk16OgDdIkwR
 8d70KGUu5ehFyM19VMNJeX239kT3Gq+tR0ft/Yotq4zWPgZZXESxwm3GlqIA8Df1Xq8x
 QVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/VG5TUcHK28EUa7eURC83MWfCIRXMFJIi6mDFPjt1R8=;
 b=p6OYB070SbUwMg4Gx71hmnrsT30D9XqN82IVHAUL4FPXAfe3yLFYqRKldz7GlfXlIz
 VHqHIEE494jfx7v3qK7T79MmPB8b8V99wMp4W8X4sCtsXwEabWl/+FpHZCXDioNULOGO
 g4cgg+FxylcoWUWocYIqXZjrkVjuAI5NtDjomtOtplMBRatqE0pwWAU6ruEt1tBPvwpB
 GtCi0bALQCCTJ1xnH/4c2avAWuKGCsnhaD1n5wrbPUXN78Au94biAMRELNpDNKrK0wst
 7tvpzJge08yI3QDHeFJOGmq1Tj6Pwy+L5pzyus2g/FHjr+YV9vyJPd/cBy1NUhUeX7T9
 imiQ==
X-Gm-Message-State: APjAAAU4NBauRoPoDLxxcCxtlsnaZ3cI1QFQshV47ZfBLl2WNlZfqme1
 IWuCYgcHX3XzbTkd74eC2kOawhQMzOKypAXSxg9eyg==
X-Google-Smtp-Source: APXvYqzIHSAWAyJfIbRviXW/NBNJNcPgTiTdGysFMPCs5YkIql/uzcevT58LLZUDvKOa5zfmFC2DO9w4O9HRGZzkT/0=
X-Received: by 2002:a9d:193:: with SMTP id e19mr18003227ote.135.1559897630137; 
 Fri, 07 Jun 2019 01:53:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190401211712.19012-1-bsd@redhat.com>
In-Reply-To: <20190401211712.19012-1-bsd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jun 2019 09:53:39 +0100
Message-ID: <CAFEAcA8irfgXaGvUWxVAEa5Cr5yjNMCcwt_9KcBB+sggvhAMzg@mail.gmail.com>
To: Bandan Das <bsd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v4 0/3] misc usb-mtp fixes
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 1 Apr 2019 at 22:17, Bandan Das <bsd@redhat.com> wrote:
>
> v4:
>   Added 1/3: <jpgva0nuddm.fsf@linux.bootlegged.copy>
> v3:
>   2/2: Fix indentation
>        Add back sending RES_OK for success
> v2:
>   1/2: Add Reviewed-by tag
>   2/2: remove extra vars and directly call usb_mtp_queue_result
>
> The first patch removes a unnecessary function
> and the second is just a code reorg of usb_mtp_write_data
> to make it less confusing. Applies on top of
> [PATCH v3] usb-mtp: fix return status of delete
> Message-ID:
>
> Bandan Das (3):
>   usb-mtp: fix return status of delete
>   usb-mtp: remove usb_mtp_object_free_one
>   usb-mtp: refactor the flow of usb_mtp_write_data

Hi Bandan, Gerd -- what's the status of this patchset?
I think this is the one that fixes the CID1399415
Coverity issue about usb_mtp_write_data() return values, right?

thanks
-- PMM

