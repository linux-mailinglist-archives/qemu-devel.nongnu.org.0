Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E03C72833B2
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Oct 2020 11:57:17 +0200 (CEST)
Received: from localhost ([::1]:40572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPNF6-00069v-GY
	for lists+qemu-devel@lfdr.de; Mon, 05 Oct 2020 05:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kPNDa-0005ao-3N
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 05:55:42 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:46142)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kPNDY-00033x-An
 for qemu-devel@nongnu.org; Mon, 05 Oct 2020 05:55:41 -0400
Received: by mail-ed1-x543.google.com with SMTP id 33so8581552edq.13
 for <qemu-devel@nongnu.org>; Mon, 05 Oct 2020 02:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LlbqEHXOsa04D97hGS77EQwYH+JTb8cxRTKR/RTuVbk=;
 b=sVhyc3gRtBSzIcdmCejubMfWtQZ7UNp8T6RrMAn8DPw0fi4lBfITNhaOBlVRGK6Jif
 SN95QPzikQ64F5P4Uq+fjELkYWGBpLsiVVb/DUHT8sXHx9PewU14LneZPXgsfzUE/93j
 Lu/y+pvJaE2LUP5jP2XNhTV0w2mfoV8Bip1rJ/QQWdMj6Qnbp4uZehIl1wfG1+sx4buy
 tucWvePJlY6mPeBeY92ihfkmHJnCVAOf3SjjBFgQ2EUwxEcYv4j1eKOGLqB0xGaJmEHC
 Xsx+jWGU/xrmOtgTJuQqiRigUv0U5zgPQB5jRqm9/pNOHocEOHdcDvOJOxodbTAisLqm
 DRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LlbqEHXOsa04D97hGS77EQwYH+JTb8cxRTKR/RTuVbk=;
 b=bY+oSem2f5drMTfYTaZndIvzW6fV2YJV8LMAhLiA5pP/WxQkXzVGMwjowaWL+BCJCT
 AWwc5l62wfkGbaViGaMiOPthNi+QRd/OagDmPOd0/xAvjwExZ0HLxrHMho0dfS17R9JK
 TczHLWxdwWS1w0dNSb3bgUJTBUsDyHl4ur4D+YTmC78z2h7AbutordHy0BkSIwCvdEJT
 nK2tmwBDX+7fV/FdIm5HJxcgJt7Rti4kS1FVI0m8hjvJdxyQjPDRu2bukuidJgxmNA41
 Boaz+P+nSKUjUEsaORoZoXagw7qXcsdlqkHQr88Tib2U3YEbZFHIwDpEbmwYbkizIuOc
 bOfA==
X-Gm-Message-State: AOAM530jWMDrCKOH6Zvl8NuCUdsOUe8BZahtQQXnWcl/u1EZCLG6UDxw
 SwXJQcaWPGXqjzrmfCZOIa6MYy+RquirorPXcb18rQ==
X-Google-Smtp-Source: ABdhPJwdZqgSTcyB3y5KS8k5GBdZjitFdYkVYeSSdVcVBDIH/hjgVmeiPOLwUKmTws79GZPX+n0EOU0c2Mc0F+/qkxs=
X-Received: by 2002:aa7:c683:: with SMTP id n3mr15822822edq.146.1601891738764; 
 Mon, 05 Oct 2020 02:55:38 -0700 (PDT)
MIME-Version: 1.0
References: <20201001123807.42978-1-eafanasova@gmail.com>
 <87r1qhtdxt.fsf@dusky.pond.sub.org>
 <b4ab229a-0e84-9d0b-1287-846c52a667bb@redhat.com>
 <87eemhm2b9.fsf@dusky.pond.sub.org>
 <17636b91-e111-1b60-4eb2-d526df4a6bb6@redhat.com>
 <d52b5d3655fba86d1b3816115b24997b36952e3b.camel@gmail.com>
In-Reply-To: <d52b5d3655fba86d1b3816115b24997b36952e3b.camel@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Oct 2020 10:55:27 +0100
Message-ID: <CAFEAcA-5FFqr1oUgjeym=NjaSfnZCgHz9UrsnwF6GjMmb+w+wg@mail.gmail.com>
Subject: Re: [PATCH v2] elfload: use g_new/g_malloc and g_autofree
To: Elena Afanasova <eafanasova@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Kamil Rytarowski <kamil@netbsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Brad <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 4 Oct 2020 at 13:22, Elena Afanasova <eafanasova@gmail.com> wrote:
>
> Subject: [PATCH v2] elfload: use g_new/g_malloc and g_autofree
>
> Signed-off-by: Elena Afanasova <eafanasova@gmail.com>
> ---
>  bsd-user/elfload.c | 79 ++++++++--------------------------------------
>  1 file changed, 14 insertions(+), 65 deletions(-)

Random question -- how are you testing this change? (bsd-user
isn't covered by 'make check' I think).

thanks
-- PMM

