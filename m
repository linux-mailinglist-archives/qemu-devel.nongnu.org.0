Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B763BF2DA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 02:26:49 +0200 (CEST)
Received: from localhost ([::1]:43712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1HsO-0001I0-AQ
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 20:26:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m1Hrd-0000bY-Mx
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:26:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m1Hrb-0003dC-Q8
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 20:26:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625703959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to; 
 bh=zJ14AsBvnpDyeB+jXIBEXMelPLsn1ueIE9wr1ycXpWc=;
 b=Po5UQIKsW6wgLa6/+epcFdn5Ke2TychWkH2mcUngJrSQFgcx9s8XXh5xe3EfrGQE5s6TdT
 r09qI6GWuUsOwanag++kMfZLuQZjJLD4pUZX7OtpPwXb/U1nzFXTgiqHN3hjApM/DEBvRU
 BABjPUYlzY/cfPt3BGxWmGcSFaJ2sTY=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-531-8jLGhHrEPFOcClTZqokbzQ-1; Wed, 07 Jul 2021 20:25:58 -0400
X-MC-Unique: 8jLGhHrEPFOcClTZqokbzQ-1
Received: by mail-pf1-f200.google.com with SMTP id
 w2-20020aa785820000b029032396e2bf68so1763936pfn.17
 for <qemu-devel@nongnu.org>; Wed, 07 Jul 2021 17:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding:from:to
 :cc:subject:date:message-id:in-reply-to;
 bh=zJ14AsBvnpDyeB+jXIBEXMelPLsn1ueIE9wr1ycXpWc=;
 b=MJ8TZvm7/0kgt1bbQ3qkyroYbu+tHtonQPNp+e2x7qEEkfUt/KDXES1K9b7UVKjt/M
 P+hfHahcBATJZLxHtKFpIINPKo7gSdnhRicEi/4GdtfmKviaQpmsOAals1B950E8+Gxi
 GLcAdLTpXagZuzopGJ32V8sLnsdByJkjG1o4JlLyARIj/cK2YqCQvWHo8J+pIM27rKSc
 03ZfGyhrsRoznjbw1Gknt7kQtfNBm2n3NZp+Pos5YhTNf+JJjQQRR6rHRhudmiXfUhi8
 rIhYsn/dznhefThyGbJDdk75IJ+UDJ9J8hhVUTYe7aot6BmxY+znKwo7wsj3ZBbCsqop
 uQgA==
X-Gm-Message-State: AOAM533fFfOKn+gV8ZwxYxJ6s9VetXTa+5rxTgyCj4z/mPc/KZ42fG2v
 /5hnyQbGkkHC6teBF/VIer/E4didXskeGY3aH9/sA2gJVBr5oed0uYXH3+G7zRbjlNpT4FEH0/6
 sobKDaL8raOKAgpM=
X-Received: by 2002:a63:d84b:: with SMTP id k11mr28869524pgj.372.1625703957060; 
 Wed, 07 Jul 2021 17:25:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz39J+aZ+EQhAlLmK8KESw0IU9SUCgHL2Ek/G6qsOkKiEN6SAHL4asOrKbjBl7PaXkSa+TDbQ==
X-Received: by 2002:a63:d84b:: with SMTP id k11mr28869512pgj.372.1625703956853; 
 Wed, 07 Jul 2021 17:25:56 -0700 (PDT)
Received: from localhost ([2601:1c0:4600:3f84:cb33:5075:e7f0:7862])
 by smtp.gmail.com with ESMTPSA id b62sm151344pfb.149.2021.07.07.17.25.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Jul 2021 17:25:56 -0700 (PDT)
Mime-Version: 1.0
From: "Connor Kuehl" <ckuehl@redhat.com>
To: "Miroslav Rezanina" <mrezanin@redhat.com>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH] Fix libpmem configuration option
Date: Wed, 07 Jul 2021 17:22:43 -0700
Message-Id: <CCNBVYIWGWRJ.BW9EYUEODQZW@redhat>
In-Reply-To: <20210707075144.82717-1-mrezanin@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 1
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed Jul 7, 2021 at 12:51 AM PDT, Miroslav Rezanina wrote:
> For some reason, libpmem option setting was set to work in an opposite
> way (--enable-libpmem disabled it and vice versa). Fixing this so
> configuration works properly.
>
> Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
> ---
> configure | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/configure b/configure
> index 7994bdee92..ffa93cc5fd 100755
> --- a/configure
> +++ b/configure
> @@ -1501,9 +1501,9 @@ for opt do
> ;;
> --disable-debug-mutex) debug_mutex=3Dno
> ;;
> - --enable-libpmem) libpmem=3Ddisabled
> + --enable-libpmem) libpmem=3D"enabled"
> ;;
> - --disable-libpmem) libpmem=3Denabled
> + --disable-libpmem) libpmem=3D"disabled"
> ;;
> --enable-xkbcommon) xkbcommon=3D"enabled"
> ;;
> --
> 2.27.0

Good catch.

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>

or

Tested-by: Connor Kuehl <ckuehl@redhat.com>


