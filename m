Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 135961B0651
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 12:12:24 +0200 (CEST)
Received: from localhost ([::1]:60990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQTPa-0001Wg-PF
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 06:12:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52102 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQTOm-00017q-Ru
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 06:11:33 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jQTOm-0002Z2-3a
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 06:11:32 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33156)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jQTOl-0002YD-OS
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 06:11:31 -0400
Received: by mail-ot1-x342.google.com with SMTP id j26so7586593ots.0
 for <qemu-devel@nongnu.org>; Mon, 20 Apr 2020 03:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dUV7qcLtj1M9SSM+xC2v0N+o6DtwyCd+1yJf1qa3WEY=;
 b=lmzqLzXsEdIbVS4A7P3o88aDU8zMvDGfCPrlRAo5sC6N2rH/pVdBrMVBkd4gU/B1cz
 bwyPekfxmy1m3juR2UqDarpdUNT+NCsnuBMUqCrs9Nw9UF2SofIUOMi7IyKSAdGXwj+7
 UzkRSAYCvQiQ0eMlbC6lyk3NZCB2M2u4/mQ/GcU9tTO3W5VhyTV2t/UCqwcbvQiGKwBc
 T2U+ql6yLoEY9mOxHrF5sr8seOTAbyxicEXvuYmZvrtK6JkVMF00nDfUDuHMVQbE7j/I
 F9FmGOuZE27tC1rTyEM8O2ycRISI4b5s+JXPCnZPwX7gDc4Me5S5sLCU9NLEQVvaC9e9
 yqEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dUV7qcLtj1M9SSM+xC2v0N+o6DtwyCd+1yJf1qa3WEY=;
 b=CXKAO9y7szolTsdHQ0ObLUrYThoGMNZ2NysUw0egXfRAc8Je26OpItCnPdne2Pk6Is
 VAAAB6jr7EhxGuDlNztugT0q8r5P7iPpxT+S1gTnNmch9jji5D9tMpRVUePUeuu5KLVf
 pBzvg5GnrVX6fzJizKpZTpp5YmoYor9sjTr/L8pivTkB983vFqngoZWPIuu2LAivQaM8
 W6nhkgUyXrwDjmpjQHB+OtQ2E9LlTmbGYRhVZcCYQ+KkKmy2PKF+LqbhTC+FPvQeilpR
 frvckDzsb7Dn84tg2k0ieTmU3YNh1ZgPhCoDjF5n0Hc1nzC9/A8mpq4fkoRBbNt7VnJJ
 d6zQ==
X-Gm-Message-State: AGi0PuZwnXpIkgK6l0VAdgO7iP7h5cYTYQNqaZdhhQmUVA+9N4ZE3Nm/
 gZxkzyCAH63tD3Y0nIW0xDybtMAqgFkiV6oltjBx2A==
X-Google-Smtp-Source: APiQypLX7nuWktFAL7hsuC4XzF3v+aeb4VxJDAV404kQ3hGKxGQ+70Y/9ArpTxmjmPzVp+m0CTUIZydcaGaYqN6TTxY=
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr8505497otc.221.1587377489852; 
 Mon, 20 Apr 2020 03:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAEme+7FPF+inSJSXQPmuv8Up3Eam0N7fT03zqM-RvcvKsxjfVQ@mail.gmail.com>
In-Reply-To: <CAEme+7FPF+inSJSXQPmuv8Up3Eam0N7fT03zqM-RvcvKsxjfVQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Apr 2020 11:11:18 +0100
Message-ID: <CAFEAcA9Yk53oK5YstN7DpCCq344+tbyjvDA6RaWcJCrL9QSjMw@mail.gmail.com>
Subject: Re: [PATCH 3/3] plugins: avoid failing plugin when CPU is inited
 several times
To: Nikolay Igotti <igotti@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs1p.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 20 Apr 2020 at 10:16, Nikolay Igotti <igotti@gmail.com> wrote:
>
> In linux-user multithreaded scenarious CPU could be inited many times with the same id,
>
> so avoid assertions on already present hashtable entry.
>
>
> Signed-off-by: Nikolay Igotti <igotti@gmail.com>

Wouldn't it be better to make sure we remove the entry from
the hashtable when the old thread that was using that CPU
ID exits, or is that not feasible ?

thanks
-- PMM

